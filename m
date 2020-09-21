From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Sep 2020 22:35:44 +0200
Subject: [Buildroot] [git commit] package/busybox/udhcpc.script: support
 RFC3442 static routes
Message-ID: <20200921202821.7F5268A49F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f79a420825479c47d064e40bc12d3a6755a64383
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

RFC3442 specifies a DHCP extension to provide the client with a list of
static routes to use.  This is already handled by udhcpc and exposed as the
"staticroutes" environment variable, but currently not handled by the action
script.

Extend the script to do so.  The RFC specifies that if this option is
provided by the server then the normal "routes" (3) option should be
ignored, so ensure that is done.

As we may now have more than just a default route on the interface, extend
the route cleanup logic to handle all routes for the interface (except for
the implied local 0.0.0.0 one).

Notice that this option is only sent by servers if explicitly requested by
the client, E.G.  using the -O staticroutes option to udhcpc.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/busybox/udhcpc.script | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/package/busybox/udhcpc.script b/package/busybox/udhcpc.script
index 0196351cd5..ec4d9f6185 100755
--- a/package/busybox/udhcpc.script
+++ b/package/busybox/udhcpc.script
@@ -61,7 +61,23 @@ case "$1" in
 			wait_for_ipv6_default_route
 		fi
 
-		if [ -n "$router" ] ; then
+		# RFC3442: If the DHCP server returns both a Classless
+		# Static Routes option and a Router option, the DHCP
+		# client MUST ignore the Router option.
+		if [ -n "$staticroutes" ]; then
+			echo "deleting routers"
+			route -n | while read dest gw mask flags metric ref use iface; do
+				[ "$iface" != "$interface" -o "$gw" = "0.0.0.0" ] || \
+					route del -net "$dest" netmask "$mask" gw "$gw" dev "$interface"
+			done
+
+			# format: dest1/mask gw1 ... destn/mask gwn
+			set -- $staticroutes
+			while [ -n "$1" -a -n "$2" ]; do
+				route add -net "$1" gw "$2" dev "$interface"
+				shift 2
+			done
+		elif [ -n "$router" ] ; then
 			echo "deleting routers"
 			while route del default gw 0.0.0.0 dev $interface 2> /dev/null; do
 				:
