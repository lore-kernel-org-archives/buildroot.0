From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Oct 2019 20:24:33 +0100
Subject: [Buildroot] [git commit] package/busybox: update udhcpc.script for
 stateful DHCPv6
Message-ID: <20191027191758.3CCCA8A523@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3346048ac5ef14b411a082c56f688192ca4437e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

udhcpc6 will call the default script with the stateful address set in the
"ipv6" variable.  Set "ip" to this address if present, using the /128 prefix
used by stateful DHCPv6 so the existing renew/bound logic can be used like
in DHCPv4.

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/udhcpc.script | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/busybox/udhcpc.script b/package/busybox/udhcpc.script
index 131c138b1a..c2804a3b5a 100755
--- a/package/busybox/udhcpc.script
+++ b/package/busybox/udhcpc.script
@@ -8,6 +8,8 @@ RESOLV_CONF="/etc/resolv.conf"
 [ -e $RESOLV_CONF ] || touch $RESOLV_CONF
 [ -n "$broadcast" ] && BROADCAST="broadcast $broadcast"
 [ -n "$subnet" ] && NETMASK="netmask $subnet"
+# Handle stateful DHCPv6 like DHCPv4
+[ -n "$ipv6" ] && ip="$ipv6/128"
 
 case "$1" in
 	deconfig)
