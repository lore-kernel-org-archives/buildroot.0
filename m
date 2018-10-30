From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 30 Oct 2018 18:50:13 +0100
Subject: [Buildroot] [PATCH 1/1] package/systemd: Add upstream patch to fix
 CVE-2018-15688
Message-ID: <20181030175013.7786-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...we-have-enough-space-for-the-DHCP6-o.patch | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/systemd/0005-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch

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
-- 
2.19.1
