From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Oct 2014 17:23:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/beecrypt: Fix build with
	BR2_ENABLE_DEBUG=yes
Message-ID: <1413732225-14832-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise configure issues this error message:
configure: error: --enable-debug cannot be used in conjunction with --enable-expert-mode

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/beecrypt/beecrypt-0003-configure.patch |   30 ++++++++++++++++++++++++
 package/beecrypt/beecrypt.mk                   |    4 ++++
 2 files changed, 34 insertions(+)
 create mode 100644 package/beecrypt/beecrypt-0003-configure.patch

diff --git a/package/beecrypt/beecrypt-0003-configure.patch b/package/beecrypt/beecrypt-0003-configure.patch
new file mode 100644
index 0000000..bab94c9
--- /dev/null
+++ b/package/beecrypt/beecrypt-0003-configure.patch
@@ -0,0 +1,30 @@
+Fix build with debug enabled
+
+Otherwise configure issues this error message:
+configure: error: --enable-debug cannot be used in conjunction with --enable-expert-mode
+
+Downloaded from Gentoo:
+http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/dev-libs/beecrypt/files/beecrypt-4.2.1-build-system.patch?revision=1.2&view=markup
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- beecrypt-4.2.1/configure.ac
++++ beecrypt-4.2.1/configure.ac
+@@ -11,7 +11,7 @@
+ 
+ # Checks for package options
+ AC_ARG_ENABLE(expert-mode, [  --enable-expert-mode      follow user-defined CFLAGS settings [[default=no]]],[
+-  ac_enable_expert_mode=yes
++  ac_enable_expert_mode=$enableval
+   ],[
+   if test "X$CFLAGS" != "X"; then
+     echo "enabling expert mode"
+@@ -25,7 +25,7 @@
+   if test "$ac_enable_expert_mode" = yes; then
+     AC_MSG_ERROR([--enable-debug cannot be used in conjunction with --enable-expert-mode])
+   fi
+-  ac_enable_debug=yes
++  ac_enable_debug=$enableval
+   ],[
+   ac_enable_debug=no
+   ])
diff --git a/package/beecrypt/beecrypt.mk b/package/beecrypt/beecrypt.mk
index 7a2511d..f6a24d5 100644
--- a/package/beecrypt/beecrypt.mk
+++ b/package/beecrypt/beecrypt.mk
@@ -22,6 +22,10 @@ BEECRYPT_CONF_OPTS = \
 		--without-python \
 		--disable-openmp
 
+ifeq ($(BR2_ENABLE_DEBUG),y)
+BEECRYPT_CONF_OPTS += --disable-expert-mode
+endif
+
 ifeq ($(BR2_PACKAGE_BEECRYPT_CPP),y)
 BEECRYPT_DEPENDENCIES += icu
 else
-- 
1.7.10.4
