From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Jul 2013 19:14:56 +0200
Subject: [Buildroot] [git commit] libedit: really needs wchar support
Message-ID: <20130731171439.DA58D9AE2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a3e7fc8e6592eb6b24adaad1f4c1dfdd28cd729d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

wctype.h is always included, even in configure tests.
Fixes:
http://autobuild.buildroot.net/results/ed8/ed85b9d688ad8389895e3ecd7a6a18151efc328d/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libedit/Config.in  |    4 ++++
 package/libedit/libedit.mk |   10 +++-------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/libedit/Config.in b/package/libedit/Config.in
index 4747a38..72b0cf1 100644
--- a/package/libedit/Config.in
+++ b/package/libedit/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBEDIT
 	bool "libedit"
+	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_NCURSES
 	help
 	  The editline library (from BSD) provides generic line editing
@@ -12,3 +13,6 @@ config BR2_PACKAGE_LIBEDIT
 	  in Buildroot as it makes it much simpler than using the upstream
 	  sources which require pmake:
 	  http://www.thrysoee.dk/editline/
+
+comment "libedit requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
diff --git a/package/libedit/libedit.mk b/package/libedit/libedit.mk
index 6769fdc..0ff418a 100644
--- a/package/libedit/libedit.mk
+++ b/package/libedit/libedit.mk
@@ -12,6 +12,9 @@ LIBEDIT_DEPENDENCIES    = ncurses
 # We're patching configure.ac
 LIBEDIT_AUTORECONF      = YES
 
+# Doesn't really support !wchar, but support is disabled otherwise
+LIBEDIT_CONF_OPT += --enable-widec
+
 # Note: libbsd required for *vis functions, but works only with a toolchain
 # with __progname; otherwise, some features are disabled, as if libbsd was
 # missing entirely.
@@ -19,11 +22,4 @@ ifeq ($(BR2_PACKAGE_LIBBSD),y)
 LIBEDIT_DEPENDENCIES   += libbsd
 endif
 
-# Wide-char support is not autodetected by configure, we have to help a bit.
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_WCHAR),y)
-LIBEDIT_CONF_OPT       += --enable-widec
-else
-LIBEDIT_CONF_OPT       += --disable-widec
-endif
-
 $(eval $(autotools-package))
