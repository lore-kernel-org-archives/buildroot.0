From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 20 Dec 2019 14:44:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/libtelnet: new package
Message-ID: <20191220134436.15392-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 .../0001-fix-compilation-without-zlib.patch   | 43 +++++++++++++++++++
 package/libtelnet/Config.in                   | 10 +++++
 package/libtelnet/libtelnet.hash              |  3 ++
 package/libtelnet/libtelnet.mk                | 18 ++++++++
 6 files changed, 76 insertions(+)
 create mode 100644 package/libtelnet/0001-fix-compilation-without-zlib.patch
 create mode 100644 package/libtelnet/Config.in
 create mode 100644 package/libtelnet/libtelnet.hash
 create mode 100644 package/libtelnet/libtelnet.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d9b4864b9f..4e5c485de4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2325,6 +2325,7 @@ F:	package/civetweb/
 
 N:	Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 F:	docs/manual/
+F:	package/libtelnet/
 F:	package/opkg-utils/
 F:	package/perl-convert-asn1/
 F:	package/perl-crypt-blowfish/
diff --git a/package/Config.in b/package/Config.in
index f304a8fbd3..4a7abe14b1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1664,6 +1664,7 @@ menu "Networking"
 	source "package/libsoup/Config.in"
 	source "package/libsrtp/Config.in"
 	source "package/libstrophe/Config.in"
+	source "package/libtelnet/Config.in"
 	source "package/libtirpc/Config.in"
 	source "package/libtorrent/Config.in"
 	source "package/libtorrent-rasterbar/Config.in"
diff --git a/package/libtelnet/0001-fix-compilation-without-zlib.patch b/package/libtelnet/0001-fix-compilation-without-zlib.patch
new file mode 100644
index 0000000000..c54e4bfcb6
--- /dev/null
+++ b/package/libtelnet/0001-fix-compilation-without-zlib.patch
@@ -0,0 +1,43 @@
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
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Signed-off-by: Jan Heylen <jan.heylen@nokia.com>
+Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
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
-- 
2.23.0
