From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Nov 2018 09:10:15 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] package/systemd: Add
 upstream patch to fix CVE-2018-15688
Message-ID: <20181114080742.7CA8383253@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0e0c86d9c23372a7a26c2646436432b68d2c4b9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Systemd-networkd is vulnerable to an out out-of-bounds heap write in the
DHCPv6 client when handling options sent by network adjacent DHCP servers.
A attacker could exploit this via malicious DHCP server to corrupt heap
memory on client machines, resulting in a denial of service or potential
code execution.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Peter: add description]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

(cherry picked from commit bc6ecbbeefadb185e9d171562afb9f01e250e132)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...sure-we-have-enough-space-for-the-DHCP6-o.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/systemd/0005-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch b/package/systemd/0005-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch
new file mode 100644
index 0000000000..6a72a38988
--- /dev/null
+++ b/package/systemd/0005-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch
@@ -0,0 +1,30 @@
+From 49653743f69658aeeebdb14faf1ab158f1f2cb20 Mon Sep 17 00:00:00 2001
+From: Lennart Poettering <lennart@poettering.net>
+Date: Fri, 19 Oct 2018 12:12:33 +0200
+Subject: [PATCH] dhcp6: make sure we have enough space for the DHCP6 option
+ header
+
+Fixes CVE-2018-15688:
+https://security-tracker.debian.org/tracker/CVE-2018-15688
+
+Patch downloaded from upstream commit:
+https://github.com/systemd/systemd/commit/49653743f69658aeeebdb14faf1ab158f1f2cb20
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/libsystemd-network/dhcp6-option.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libsystemd-network/dhcp6-option.c b/src/libsystemd-network/dhcp6-option.c
+index cbd4bc7a2a3..2806415100c 100644
+--- a/src/libsystemd-network/dhcp6-option.c
++++ b/src/libsystemd-network/dhcp6-option.c
+@@ -106,7 +106,7 @@ int dhcp6_option_append_ia(uint8_t **buf, size_t *buflen, const DHCP6IA *ia) {
+                 return -EINVAL;
+         }
+ 
+-        if (*buflen < len)
++        if (*buflen < offsetof(DHCP6Option, data) + len)
+                 return -ENOBUFS;
+ 
+         ia_hdr = *buf;
