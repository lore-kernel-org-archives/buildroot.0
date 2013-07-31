From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 31 Jul 2013 13:55:57 -0300
Subject: [Buildroot] [PATCH] libedit: really needs wchar support
Message-ID: <1375289757-23151-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

wctype.h is always included, even in configure tests.
Fixes:
http://autobuild.buildroot.net/results/ed8/ed85b9d688ad8389895e3ecd7a6a18151efc328d/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libedit/Config.in  | 4 ++++
 package/libedit/libedit.mk | 7 -------
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/libedit/Config.in b/package/libedit/Config.in
index 4747a38..c8fcf40 100644
--- a/package/libedit/Config.in
+++ b/package/libedit/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBEDIT
 	bool "libedit"
 	select BR2_PACKAGE_NCURSES
+	depends on BR2_USE_WCHAR
 	help
 	  The editline library (from BSD) provides generic line editing
 	  and history functions. It slightly resembles GNU readline.
@@ -12,3 +13,6 @@ config BR2_PACKAGE_LIBEDIT
 	  in Buildroot as it makes it much simpler than using the upstream
 	  sources which require pmake:
 	  http://www.thrysoee.dk/editline/
+
+comment "libedit requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
diff --git a/package/libedit/libedit.mk b/package/libedit/libedit.mk
index 6769fdc..c1e8cc7 100644
--- a/package/libedit/libedit.mk
+++ b/package/libedit/libedit.mk
@@ -19,11 +19,4 @@ ifeq ($(BR2_PACKAGE_LIBBSD),y)
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
-- 
1.8.1.5
