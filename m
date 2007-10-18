From: Simon Pasch <fpasch@googlemail.com>
Date: Thu, 18 Oct 2007 10:41:36 +0200
Subject: [Buildroot] compiling ATK fails because of wrong
	PKG_CONFIG_PATH-variable
Message-ID: <f90898420710180141l73cda04aw9d277423bb8b495b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Compiling atk fails, if the PKG_CONFIG_PATH-variable is set by the
host-system. (glib-object.h is missing)

Is this a bug or do I have to generally remove this variable while
compiling buildroot?

Solution is simple: (sorry for the line break, I had to use a webmailer)

--- buildroot.old/package/atk.mk	2007-10-18 10:27:12.000000000 +0200
+++ buildroot/package/atk.mk	2007-10-18 10:27:50.000000000 +0200
@@ -25,6 +25,7 @@
 	(cd $(ATK_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
+		PKG_CONFIG_PATH="$(STAGING_DIR)/lib/pkconfig:$(STAGING_DIR)/usr/lib/pkgconfig"
\
 		ac_cv_func_posix_getpwuid_r=yes \
 		glib_cv_stack_grows=no \
 		glib_cv_uscore=no \
