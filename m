From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Oct 2020 23:57:14 +0200
Subject: [Buildroot] [git commit] package/netsnmp: silence warning when
 running without IPv6
Message-ID: <20201017214557.E97F683676@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae85c9fd719bd773d8eb55a3cd0772ed6a3ce50d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

snmpd loudly complains every 3 seconds about a failure reading
/proc/net/if_inet6 if the system does not have IPv6 support:

Jan  1 00:00:12 buildroot daemon.err snmpd[92]: ipaddress_linux: could not open /proc/net/if_inet6: No such file or directory
Jan  1 00:00:15 buildroot daemon.err snmpd[92]: ipaddress_linux: could not open /proc/net/if_inet6: No such file or directory
Jan  1 00:00:18 buildroot daemon.err snmpd[92]: ipaddress_linux: could not open /proc/net/if_inet6: No such file or directory
Jan  1 00:00:21 buildroot daemon.err snmpd[92]: ipaddress_linux: could not open /proc/net/if_inet6: No such file or directory

Add an upstream patch to only print this warning once, rather than on every
poll iteration.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...-log-once-that-opening-proc-net-if_inet6-.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/netsnmp/0005-MIB-II-Only-log-once-that-opening-proc-net-if_inet6-.patch b/package/netsnmp/0005-MIB-II-Only-log-once-that-opening-proc-net-if_inet6-.patch
new file mode 100644
index 0000000000..2d5b38eb32
--- /dev/null
+++ b/package/netsnmp/0005-MIB-II-Only-log-once-that-opening-proc-net-if_inet6-.patch
@@ -0,0 +1,30 @@
+From cd09fd82522861830aaf9d237b26eef5f9ba50d2 Mon Sep 17 00:00:00 2001
+From: Bart Van Assche <bvanassche@acm.org>
+Date: Wed, 21 Nov 2018 20:47:42 -0800
+Subject: [PATCH] MIB-II: Only log once that opening /proc/net/if_inet6 failed
+
+If IPv6 has been disabled (ipv6.disable=1) then opening /proc/net/if_inet6
+fails. Only log this once instead of thousand of times a day.
+
+Reported-by: Fif <lefif@users.sourceforge.net>
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ agent/mibgroup/ip-mib/data_access/ipaddress_linux.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/agent/mibgroup/ip-mib/data_access/ipaddress_linux.c b/agent/mibgroup/ip-mib/data_access/ipaddress_linux.c
+index 5ddead3e0c..280575ce39 100644
+--- a/agent/mibgroup/ip-mib/data_access/ipaddress_linux.c
++++ b/agent/mibgroup/ip-mib/data_access/ipaddress_linux.c
+@@ -234,7 +234,7 @@ _load_v6(netsnmp_container *container, int idx_offset)
+ 
+ #define PROCFILE "/proc/net/if_inet6"
+     if (!(in = fopen(PROCFILE, "r"))) {
+-        snmp_log_perror("ipaddress_linux: could not open " PROCFILE);
++        NETSNMP_LOGONCE((LOG_ERR, "ipaddress_linux: could not open " PROCFILE));
+         return -2;
+     }
+ 
+-- 
+2.20.1
+
