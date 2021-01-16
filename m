From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Jan 2021 23:01:42 +0100
Subject: [Buildroot] [git commit] package/htop: needs dynamic library
Message-ID: <20210116214244.D181A86FDF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=30cfd54ae8fd36b9184a6fd4a7be130c8a133bc5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

htop unconditionally uses dlopen since version 3.0.3 and
https://github.com/htop-dev/htop/commit/2a9e8ca07475e61e74d7b6f0afd0a5fd272cb07f

Fixes:
 - http://autobuild.buildroot.org/results/2976729b0b95bf822c3095efbcf3f86d6c71874f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
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
