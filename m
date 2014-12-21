From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Dec 2014 16:39:25 +0100
Subject: [Buildroot] [git commit] tinc: new package
Message-ID: <20141221154058.2F0A0805F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=50440196aebc11d75184aa6855f38ff0b92cfbc2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - fix license from GPLv2 to 'GPLv2+ with OpenSSL exception'
 - add -std=c99 to CFLAGS, otherwise it doesn't build with a minimal
   toolchain configuration
 - add BR2_USE_MMU dependency since fork() is used.]

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in      |    1 +
 package/tinc/Config.in |   12 ++++++++++++
 package/tinc/tinc.mk   |   14 ++++++++++++++
 3 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 0ce890d..9747c0e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1140,6 +1140,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/tftpd/Config.in"
 endif
 	source "package/thttpd/Config.in"
+	source "package/tinc/Config.in"
 	source "package/tinyhttpd/Config.in"
 	source "package/tn5250/Config.in"
 	source "package/transmission/Config.in"
diff --git a/package/tinc/Config.in b/package/tinc/Config.in
new file mode 100644
index 0000000..5390ff3
--- /dev/null
+++ b/package/tinc/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_TINC
+	bool "tinc"
+	select BR2_PACKAGE_LZO
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_ZLIB
+	depends on BR2_USE_MMU # fork()
+	help
+	  tinc is a Virtual Private Network (VPN) daemon that uses
+	  tunnelling and encryption to create a secure private network
+	  between hosts on the Internet.
+
+	  http://www.tinc-vpn.org/
diff --git a/package/tinc/tinc.mk b/package/tinc/tinc.mk
new file mode 100644
index 0000000..b8d4ca7
--- /dev/null
+++ b/package/tinc/tinc.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# tinc
+#
+################################################################################
+
+TINC_VERSION = 1.0.24
+TINC_SITE = http://www.tinc-vpn.org/packages
+TINC_DEPENDENCIES = lzo openssl zlib
+TINC_LICENSE = GPLv2+ with OpenSSL exception
+TINC_LICENSE_FILES = COPYING COPYING.README
+TINC_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=c99"
+
+$(eval $(autotools-package))
