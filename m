From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Nov 2018 10:34:19 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/network-manager:
 Add upstream patch to fix CVE-2018-15688
Message-ID: <20181114093141.6CE28834AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9cd3f1b1ab8fee601f3fa6ad8ed01abe54e9caa9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

NetworkManager includes some parts of the systemd-networkd code in its
codebase. That can be found at src/systemd/src/libsystemd-networkd.
The DHCP implementation provided by systemd-networkd is used when
NetworkManager is configured to use the internal implementation,
however the default is to use dhclient.

When NetworkManager is configured to use the internal dhcp and an
interface is setup with ipv6.method=auto (which is the default value)
or ipv6.method=dhcp, this flaw can be exploited. When using
ipv6.method=auto, the DHCPv6 client can be automatically started with a
Router Advertisement packet.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0a51ba655c6eed7a2a8be116b855259adbaf7bd6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...sure-we-have-enough-space-for-the-DHCP6-o.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/network-manager/0001-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch b/package/network-manager/0001-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch
new file mode 100644
index 0000000000..c6066abe28
--- /dev/null
+++ b/package/network-manager/0001-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch
@@ -0,0 +1,38 @@
+From 01ca2053bbea09f35b958c8cc7631e15469acb79 Mon Sep 17 00:00:00 2001
+From: Lennart Poettering <lennart@poettering.net>
+Date: Fri, 19 Oct 2018 12:12:33 +0200
+Subject: dhcp6: make sure we have enough space for the DHCP6 option header
+
+Fixes a vulnerability originally discovered by Felix Wilhelm from
+Google.
+
+CVE-2018-15688
+LP: #1795921
+https://bugzilla.redhat.com/show_bug.cgi?id=1639067
+
+(cherry picked from commit 4dac5eaba4e419b29c97da38a8b1f82336c2c892)
+
+Patch downloaded from upstream commit:
+https://cgit.freedesktop.org/NetworkManager/NetworkManager/commit/?id=01ca2053bbea09f35b958c8cc7631e15469acb79
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/systemd/src/libsystemd-network/dhcp6-option.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/systemd/src/libsystemd-network/dhcp6-option.c b/src/systemd/src/libsystemd-network/dhcp6-option.c
+index d178fe2..9027c14 100644
+--- a/src/systemd/src/libsystemd-network/dhcp6-option.c
++++ b/src/systemd/src/libsystemd-network/dhcp6-option.c
+@@ -108,7 +108,7 @@ int dhcp6_option_append_ia(uint8_t **buf, size_t *buflen, const DHCP6IA *ia) {
+                 return -EINVAL;
+         }
+ 
+-        if (*buflen < len)
++        if (*buflen < offsetof(DHCP6Option, data) + len)
+                 return -ENOBUFS;
+ 
+         ia_hdr = *buf;
+-- 
+cgit v1.1
+
