From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  7 Jan 2021 07:48:55 +0100
Subject: [Buildroot] [PATCH v2,1/1] package/htop: needs dynamic library
Message-ID: <20210107064855.261938-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

htop unconditionally uses dlopen since version 3.0.3 and
https://github.com/htop-dev/htop/commit/2a9e8ca07475e61e74d7b6f0afd0a5fd272cb07f

Fixes:
 - http://autobuild.buildroot.org/results/2976729b0b95bf822c3095efbcf3f86d6c71874f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Drop static workaround for ARC

 package/htop/Config.in | 5 +++++
 package/htop/htop.mk   | 7 -------
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/htop/Config.in b/package/htop/Config.in
index 7bb0fe6e07..214a9a1c99 100644
--- a/package/htop/Config.in
+++ b/package/htop/Config.in
@@ -1,9 +1,14 @@
 config BR2_PACKAGE_HTOP
 	bool "htop"
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS # dlopen()
 	select BR2_PACKAGE_NCURSES
 	help
 	  htop is an interactive text-mode process viewer for Linux.
 	  It aims to be a better top.
 
 	  https://htop.dev/
+
+comment "htop needs a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index bb6185a56d..25d1a9a129 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -18,11 +18,4 @@ else
 HTOP_CONF_OPTS += --disable-unicode
 endif
 
-# ARC uses an old uClibc that needs dladdr() for backtrace support,
-# which doesn't work for static only scenario, so as a workaround, we
-# pretend that execinfo.h is not available.
-ifeq ($(BR2_arc)$(BR2_STATIC_LIBS),yy)
-HTOP_CONF_ENV += ac_cv_header_execinfo_h=no
-endif
-
 $(eval $(autotools-package))
-- 
2.29.2
