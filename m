From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Dec 2019 11:07:13 +0100
Subject: [Buildroot] [git commit] package/libtelnet: new package
Message-ID: <20191222100330.56FA88D4EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=25b5ffae7df1df903b0ddc5d5a5f6cdad6d62a91
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 .../0001-fix-compilation-without-zlib.patch        | 42 ++++++++++++++++++++++
 package/libtelnet/Config.in                        | 10 ++++++
 package/libtelnet/libtelnet.hash                   |  3 ++
 package/libtelnet/libtelnet.mk                     | 18 ++++++++++
 6 files changed, 75 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index dd2bb60cbb..f2b37e55ac 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2328,6 +2328,7 @@ F:	package/civetweb/
 
 N:	Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 F:	docs/manual/
+F:	package/libtelnet/
 F:	package/opkg-utils/
 F:	package/perl-convert-asn1/
 F:	package/perl-crypt-blowfish/
diff --git a/package/Config.in b/package/Config.in
index bbbfc3adc0..247d96831e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1670,6 +1670,7 @@ menu "Networking"
 	source "package/libsoup/Config.in"
 	source "package/libsrtp/Config.in"
 	source "package/libstrophe/Config.in"
+	source "package/libtelnet/Config.in"
 	source "package/libtirpc/Config.in"
 	source "package/libtorrent/Config.in"
 	source "package/libtorrent-rasterbar/Config.in"
diff --git a/package/libtelnet/0001-fix-compilation-without-zlib.patch b/package/libtelnet/0001-fix-compilation-without-zlib.patch
new file mode 100644
index 0000000000..6b793e8f11
--- /dev/null
+++ b/package/libtelnet/0001-fix-compilation-without-zlib.patch
@@ -0,0 +1,42 @@
+From 1670ca128118be1d914fc89223e94c4cff1bbf03 Mon Sep 17 00:00:00 2001
+From: Jan Heylen <jan.heylen@nokia.com>
+Date: Wed, 25 Oct 2017 06:45:49 +0200
+Subject: [PATCH] Fix compilation without zlib
+
+libtelnet source code uses '#if defived(HAVE_ZLIB)' as conditional flag for
+optional compression support. But the configure(.ac) script does not play well
+with this: it will define 'HAVE_ZLIB' to either 1 (zlib present) or 0
+(zlib not present). For the C preprocessor, both cases mean 'defined'.
+
+As a result, compilation will fail when trying to include zlib.h, which is
+missing.
+
+Signed-off-by: Jan Heylen <jan.heylen@nokia.com>
+Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Upstream-status: upstream has changed to cmake iso autotools (but not yet
+released) [1] and a pull request exists to fix several issues with that,
+including correct handling of zlib detection [2].
+
+[1] https://github.com/seanmiddleditch/libtelnet/commit/4860d10da44929554895c0ef83274f38de68e958
+[2] https://github.com/seanmiddleditch/libtelnet/pull/54
+
+diff --git a/configure.ac b/configure.ac
+index 021b48f..c4dac8b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -33,7 +33,7 @@ AC_HEADER_STDC
+ PKG_CHECK_MODULES([zlib],
+   [zlib],
+   [AC_DEFINE([HAVE_ZLIB], [1], [Define to 1 if you have zlib.])],
+-  [AC_DEFINE([HAVE_ZLIB], [0], [Define to 1 if you have zlib.])])
++  [AC_MSG_NOTICE([not enabling zlib support])])
+ 
+ # Checks for header files.
+ 
+-- 
+2.7.4
+
diff --git a/package/libtelnet/Config.in b/package/libtelnet/Config.in
new file mode 100644
index 0000000000..59456a328f
--- /dev/null
+++ b/package/libtelnet/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBTELNET
+	bool "libtelnet"
+	help
+	  libtelnet provides safe and correct handling of the core
+	  TELNET protocol.  In addition to the base TELNET protocol,
+	  libtelnet also implements the Q method of TELNET option
+	  negotiation.  libtelnet can be used for writing servers,
+	  clients, or proxies.
+
+	  https://github.com/seanmiddleditch/libtelnet
diff --git a/package/libtelnet/libtelnet.hash b/package/libtelnet/libtelnet.hash
new file mode 100644
index 0000000000..afbb29e4fb
--- /dev/null
+++ b/package/libtelnet/libtelnet.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 d2f01a9dc0cc01777844b6d27f0f836dad9a4b9a32a31c7bbde0762480262f25  libtelnet-0.23.tar.gz
+sha256 b1faf309467bc1d0aab9b42d6e86a614e78f8fe3580e289966b5b9f9a8f94d99  COPYING
diff --git a/package/libtelnet/libtelnet.mk b/package/libtelnet/libtelnet.mk
new file mode 100644
index 0000000000..863d7a6166
--- /dev/null
+++ b/package/libtelnet/libtelnet.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# libtelnet
+#
+################################################################################
+
+LIBTELNET_VERSION = 0.23
+LIBTELNET_SITE = https://github.com/seanmiddleditch/libtelnet/releases/download/$(LIBTELNET_VERSION)
+LIBTELNET_INSTALL_STAGING = YES
+LIBTELNET_CONF_OPTS = --disable-util
+LIBTELNET_DEPENDENCIES = host-pkgconf
+LIBTELNET_LICENSE = Public domain
+LIBTELNET_LICENSE_FILES = COPYING
+
+# for 0001-fix-compilation-without-zlib.patch
+LIBTELNET_AUTORECONF = YES
+
+$(eval $(autotools-package))
