From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Mar 2020 14:51:12 +0100
Subject: [Buildroot] [git commit] package/spidermonkey: do not build the
 JavaScript shell, by default
Message-ID: <20200308133858.C66138FE51@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=04ce57ed24deef723d9a98693c9eae72e6cc90fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a configuration to enable the JavaScript shell (default off). So
far only libmozjs is required (by polkit) and the shell takes around
24MiB.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...efile.in-install-shell-only-if-it-s-built.patch | 28 ++++++++++++++++++++++
 package/spidermonkey/Config.in                     | 11 +++++++++
 package/spidermonkey/spidermonkey.mk               |  6 +++++
 3 files changed, 45 insertions(+)

diff --git a/package/spidermonkey/0011-js-src-Makefile.in-install-shell-only-if-it-s-built.patch b/package/spidermonkey/0011-js-src-Makefile.in-install-shell-only-if-it-s-built.patch
new file mode 100644
index 0000000000..f6092af7ef
--- /dev/null
+++ b/package/spidermonkey/0011-js-src-Makefile.in-install-shell-only-if-it-s-built.patch
@@ -0,0 +1,28 @@
+From b5e4a9926cf50d12e9c5c05c6d1b161e5b662d62 Mon Sep 17 00:00:00 2001
+From: Carlos Santos <unixmania@gmail.com>
+Date: Sat, 7 Mar 2020 23:42:02 -0300
+Subject: [PATCH] js/src/Makefile.in: install shell only if it's built
+
+Prevents an installation error if we configure with --disable-js-shell.
+
+Signed-off-by: Carlos Santos <unixmania@gmail.com>
+---
+ js/src/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/js/src/Makefile.in b/js/src/Makefile.in
+index 4ac9f48..9c8fb64 100644
+--- a/js/src/Makefile.in
++++ b/js/src/Makefile.in
+@@ -136,7 +136,7 @@ endif
+ 
+ install::
+ 	$(MAKE) -C build install
+-	$(MAKE) -C shell install
++	if [ -d shell ]; then $(MAKE) -C shell install; fi
+ 
+ ifdef HAVE_DTRACE
+ javascript-trace.h: $(srcdir)/devtools/javascript-trace.d
+-- 
+2.18.2
+
diff --git a/package/spidermonkey/Config.in b/package/spidermonkey/Config.in
index 5f12110626..e015e84ad2 100644
--- a/package/spidermonkey/Config.in
+++ b/package/spidermonkey/Config.in
@@ -37,6 +37,17 @@ config BR2_PACKAGE_SPIDERMONKEY
 
 	  https://developer.mozilla.org/en-US/docs/Mozilla/Projects/SpiderMonkey
 
+if BR2_PACKAGE_SPIDERMONKEY
+
+config BR2_PACKAGE_SPIDERMONKEY_JS_SHELL
+	bool "JS shell"
+	help
+	  Build the JavaScript shell.
+
+	  WARNING: increases target image size by around 24 MiB.
+
+endif
+
 comment "spidermonkey needs a glibc or musl toolchain with C++, wchar, dynamic library, NPTL, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_SPIDERMONKEY_ARCH_SUPPORTS
diff --git a/package/spidermonkey/spidermonkey.mk b/package/spidermonkey/spidermonkey.mk
index 579dc7b864..50afdc1758 100644
--- a/package/spidermonkey/spidermonkey.mk
+++ b/package/spidermonkey/spidermonkey.mk
@@ -41,6 +41,12 @@ else
 SPIDERMONKEY_CONF_OPTS += --disable-ion
 endif
 
+ifeq ($(BR2_PACKAGE_SPIDERMONKEY_JS_SHELL),y)
+SPIDERMONKEY_CONF_OPTS += --enable-js-shell
+else
+SPIDERMONKEY_CONF_OPTS += --disable-js-shell
+endif
+
 ifeq ($(BR2_PACKAGE_READLINE),y)
 SPIDERMONKEY_CONF_OPTS += --enable-readline
 SPIDERMONKEY_DEPENDENCIES += readline
