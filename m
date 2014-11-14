From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 14 Nov 2014 09:44:54 -0300
Subject: [Buildroot] [PATCH 08/10] dhcp: update dhclient-script
In-Reply-To: <1415969096-3032-1-git-send-email-gustavo@zacarias.com.ar>
References: <1415969096-3032-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1415969096-3032-9-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The previous no-op dhclient-script is useless and in fact can lead users
to believe things will work.
dhclient-script is supposed to, among many other things, bring the
interface up for dhclient to pump an address, set the interface address,
set resolv.conf appropiately and set the default gateway.
It's a complex script since it has to deal with a lot of details so
let's just use the best fit which is the OpenWRT one since it uses the
"legacy" tools (ifconfig, route, ...) which can be easily provided by
busybox and/or net-tools.
There are newer and more feature-complete versions around but they
require full iproute2 ip and wouldn't fit as well with the busybox-only
approach.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dhcp/dhclient-script | 281 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 280 insertions(+), 1 deletion(-)

diff --git a/package/dhcp/dhclient-script b/package/dhcp/dhclient-script
index 5566aca..4afebc0 100755
--- a/package/dhcp/dhclient-script
+++ b/package/dhcp/dhclient-script
@@ -1,2 +1,281 @@
 #!/bin/sh
-# empty dhclient-script to keep dhclient from complaining
+
+make_resolv_conf() {
+  if [ x"$new_domain_name_servers" != x ]; then
+    cat /dev/null > /etc/resolv.conf.dhclient
+    chmod 644 /etc/resolv.conf.dhclient
+    if [ x"$new_domain_search" != x ]; then
+      echo search $new_domain_search >> /etc/resolv.conf.dhclient
+    elif [ x"$new_domain_name" != x ]; then
+      # Note that the DHCP 'Domain Name Option' is really just a domain
+      # name, and that this practice of using the domain name option as
+      # a search path is both nonstandard and deprecated.
+      echo search $new_domain_name >> /etc/resolv.conf.dhclient
+    fi
+    for nameserver in $new_domain_name_servers; do
+      echo nameserver $nameserver >>/etc/resolv.conf.dhclient
+    done
+
+  elif [ "x${new_dhcp6_name_servers}" != x ] ; then
+    cat /dev/null > /etc/resolv.conf.dhclient6
+    chmod 644 /etc/resolv.conf.dhclient6
+
+    if [ "x${new_dhcp6_domain_search}" != x ] ; then
+      echo search ${new_dhcp6_domain_search} >> /etc/resolv.conf.dhclient6
+    fi
+    for nameserver in ${new_dhcp6_name_servers} ; do
+      echo nameserver ${nameserver} >> /etc/resolv.conf.dhclient6
+    done
+  fi
+
+  # if both v4 and v6 clients are running, concatenate results
+  cat /etc/resolv.conf.* > /etc/resolv.conf
+}
+
+# Must be used on exit.   Invokes the local dhcp client exit hooks, if any.
+exit_with_hooks() {
+  exit_status=$1
+  if [ -f /etc/dhclient-exit-hooks ]; then
+    . /etc/dhclient-exit-hooks
+  fi
+# probably should do something with exit status of the local script
+  exit $exit_status
+}
+
+# Invoke the local dhcp client enter hooks, if they exist.
+if [ -f /etc/dhclient-enter-hooks ]; then
+  exit_status=0
+  . /etc/dhclient-enter-hooks
+  # allow the local script to abort processing of this state
+  # local script must set exit_status variable to nonzero.
+  if [ $exit_status -ne 0 ]; then
+    exit $exit_status
+  fi
+fi
+
+###
+### DHCPv4 Handlers
+###
+
+if [ x$new_broadcast_address != x ]; then
+  new_broadcast_arg="broadcast $new_broadcast_address"
+fi
+if [ x$new_subnet_mask != x ]; then
+  new_subnet_arg="netmask $new_subnet_mask"
+fi
+if [ x$alias_subnet_mask != x ]; then
+  alias_subnet_arg="netmask $alias_subnet_mask"
+fi
+
+if [ x$reason = xMEDIUM ]; then
+  # Linux doesn't do mediums (ok, ok, media).
+  exit_with_hooks 0
+fi
+
+if [ x$reason = xPREINIT ]; then
+  if [ x$alias_ip_address != x ]; then
+    # Bring down alias interface. Its routes will disappear too.
+    ifconfig $interface:0- 0.0.0.0
+  fi
+  ifconfig $interface 0.0.0.0 up
+
+  # We need to give the kernel some time to get the interface up.
+  sleep 1
+
+  exit_with_hooks 0
+fi
+
+if [ x$reason = xARPCHECK ] || [ x$reason = xARPSEND ]; then
+  exit_with_hooks 0
+fi
+  
+if [ x$reason = xBOUND ] || [ x$reason = xRENEW ] || \
+   [ x$reason = xREBIND ] || [ x$reason = xREBOOT ]; then
+  current_hostname=`hostname`
+  if [ x$current_hostname = x ] || \
+     [ x$current_hostname = x$old_host_name ]; then
+    if [ x$current_hostname = x ] || \
+       [ x$new_host_name != x$old_host_name ]; then
+      hostname $new_host_name
+    fi
+  fi
+    
+  if [ x$old_ip_address != x ] && [ x$alias_ip_address != x ] && \
+		[ x$alias_ip_address != x$old_ip_address ]; then
+    # Possible new alias. Remove old alias.
+    ifconfig $interface:0- 0.0.0.0
+  fi
+  if [ x$old_ip_address != x ] && [ x$old_ip_address != x$new_ip_address ]; then
+    # IP address changed. Bringing down the interface will delete all routes,
+    # and clear the ARP cache.
+    ifconfig $interface 0.0.0.0 down
+
+  fi
+  if [ x$old_ip_address = x ] || [ x$old_ip_address != x$new_ip_address ] || \
+     [ x$reason = xBOUND ] || [ x$reason = xREBOOT ]; then
+
+    ifconfig $interface $new_ip_address $new_subnet_arg \
+							$new_broadcast_arg
+    for router in $new_routers; do
+      if [ "x$new_subnet_mask" = "x255.255.255.255" ] ; then
+	route add -host $router dev $interface
+      fi
+      route add default gw $router
+    done
+  fi
+  if [ x$new_ip_address != x$alias_ip_address ] && [ x$alias_ip_address != x ];
+   then
+    ifconfig $interface:0- 0.0.0.0
+    ifconfig $interface:0 $alias_ip_address $alias_subnet_arg
+    route add -host $alias_ip_address $interface:0
+  fi
+  make_resolv_conf
+  exit_with_hooks 0
+fi
+
+if [ x$reason = xEXPIRE ] || [ x$reason = xFAIL ] || [ x$reason = xRELEASE ] \
+   || [ x$reason = xSTOP ]; then
+  if [ x$alias_ip_address != x ]; then
+    # Turn off alias interface.
+    ifconfig $interface:0- 0.0.0.0
+  fi
+  if [ x$old_ip_address != x ]; then
+    # Shut down interface, which will delete routes and clear arp cache.
+    ifconfig $interface 0.0.0.0 down
+  fi
+  if [ x$alias_ip_address != x ]; then
+    ifconfig $interface:0 $alias_ip_address $alias_subnet_arg
+    route add -host $alias_ip_address $interface:0
+  fi
+
+  # remove v4 dns configuration for this interface
+  rm /etc/resolv.conf.dhclient
+  cat /etc/resolv.conf.* > /etc/resolv.conf
+
+  exit_with_hooks 0
+fi
+
+if [ x$reason = xTIMEOUT ]; then
+  if [ x$alias_ip_address != x ]; then
+    ifconfig $interface:0- 0.0.0.0
+  fi
+  ifconfig $interface $new_ip_address $new_subnet_arg \
+					$new_broadcast_arg
+  set $new_routers
+  if ping -q -c 1 $1; then
+    if [ x$new_ip_address != x$alias_ip_address ] && \
+			[ x$alias_ip_address != x ]; then
+      ifconfig $interface:0 $alias_ip_address $alias_subnet_arg
+      route add -host $alias_ip_address dev $interface:0
+    fi
+    for router in $new_routers; do
+      if [ "x$new_subnet_mask" = "x255.255.255.255" ] ; then
+	route add -host $router dev $interface
+      fi
+      route add default gw $router
+    done
+    make_resolv_conf
+    exit_with_hooks 0
+  fi
+  ifconfig $interface 0.0.0.0 down
+  exit_with_hooks 1
+fi
+
+###
+### DHCPv6 Handlers
+###
+
+if [ x$reason = xPREINIT6 ]; then
+  # Ensure interface is up.
+  ifconfig ${interface} up
+
+  # Remove any stale addresses from aborted clients.
+  ip -f inet6 addr flush dev ${interface} scope global
+
+  exit_with_hooks 0
+fi
+
+if [ x${old_ip6_prefix} != x ] || [ x${new_ip6_prefix} != x ] ; then
+    echo Prefix ${reason} old=${old_ip6_prefix} new=${new_ip6_prefix}
+
+    exit_with_hooks 0
+fi
+
+if [ x$reason = xBOUND6 ]; then
+  if [ x${new_ip6_address} = x ] || [ x${new_ip6_prefixlen} = x ] ; then
+    exit_with_hooks 2;
+  fi
+
+  ifconfig ${interface} add ${new_ip6_address}/${new_ip6_prefixlen}
+
+  # Check for nameserver options.
+  make_resolv_conf
+
+### <<
+  # Set up softwire tunnel
+  if [ x${new_dhcp6_softwire} != x ] ; then
+    /etc/init.d/dhclient stop
+    ifconfig ${interface} 0.0.0.0
+    ip -6 tunnel add tun0 mode ipip6 \
+	remote ${new_dhcp6_softwire} \
+	local ${new_ip6_address} \
+	dev ${interface} encaplimit none
+    ip link set tun0 up
+    ip route add default dev tun0
+  fi
+### >>
+
+  exit_with_hooks 0
+fi
+
+if [ x$reason = xRENEW6 ] || [ x$reason = xREBIND6 ]; then
+  if [ x${new_ip6_address} = x ] || [ x${new_ip6_prefixlen} = x ] ; then
+    exit_with_hooks 2;
+  fi
+
+  ifconfig ${interface} add ${new_ip6_address}/${new_ip6_prefixlen}
+
+  # Make sure nothing has moved around on us.
+
+  # Nameservers/domains/etc.
+  if [ "x${new_dhcp6_name_servers}" != "x${old_dhcp6_name_servers}" ] ||
+     [ "x${new_dhcp6_domain_search}" != "x${old_dhcp6_domain_search}" ] ; then
+    make_resolv_conf
+  fi
+
+  exit_with_hooks 0
+fi
+
+if [ x$reason = xDEPREF6 ]; then
+  if [ x${new_ip6_address} = x ] ; then
+    exit_with_hooks 2;
+  fi
+
+  # Busybox ifconfig has no way to communicate this to the kernel, so ignore it
+
+  exit_with_hooks 0
+fi
+
+if [ x$reason = xEXPIRE6 -o x$reason = xRELEASE6 -o x$reason = xSTOP6 ]; then
+  if [ x${old_ip6_address} = x ] || [ x${old_ip6_prefixlen} = x ] ; then
+    exit_with_hooks 2;
+  fi
+
+  ifconfig ${interface} del ${old_ip6_address}/${old_ip6_prefixlen}
+
+  # remove v6 dns configuration for this interface
+  rm /etc/resolv.conf.dhclient6
+  cat /etc/resolv.conf.* > /etc/resolv.conf
+
+### <<
+  # Tear down softwire tunnel
+  if [ x${old_dhcp6_softwire} != x ] ; then
+    ip link set tun0 down
+    ip tunnel del tun0
+  fi
+### >>
+
+  exit_with_hooks 0
+fi
+
+exit_with_hooks 0
-- 
2.0.4
