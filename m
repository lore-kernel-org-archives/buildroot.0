From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Mon, 15 Jul 2013 14:39:22 +0200
Subject: [Buildroot] [PATCH] libosip2: arc: Undefine __arc__ when building
	for ARC processors
Message-ID: <1373891962-32493-1-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libosip2 appears to have support for the "ARC standard" (Advanced
RISC Computing), which is unrelated to Synopsys DesignWare ARC
processors. The check for this involves verifying the existence of
the "__arc__" macro. Unfortunately, this macro is also present
as a predefined built-in for the ARC processors, resulting into
build failures.

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
 package/libeXosip2/libeXosip2.mk |    4 ++++
 package/libosip2/libosip2.mk     |    4 ++++
 2 files changed, 8 insertions(+)

diff --git a/package/libeXosip2/libeXosip2.mk b/package/libeXosip2/libeXosip2.mk
index 4be2f05..76c4947 100644
--- a/package/libeXosip2/libeXosip2.mk
+++ b/package/libeXosip2/libeXosip2.mk
@@ -12,6 +12,10 @@ LIBEXOSIP2_LICENSE_FILES = COPYING
 
 LIBEXOSIP2_DEPENDENCIES = host-pkgconf libosip2
 
+ifeq ($(BR2_arc),y)
+LIBEXOSIP2_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -U__arc__"
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBEXOSIP2_DEPENDENCIES += openssl
 LIBEXOSIP2_CONF_OPT += --enable-openssl
diff --git a/package/libosip2/libosip2.mk b/package/libosip2/libosip2.mk
index 6ae8149..6d5c516 100644
--- a/package/libosip2/libosip2.mk
+++ b/package/libosip2/libosip2.mk
@@ -10,6 +10,10 @@ LIBOSIP2_INSTALL_STAGING = YES
 LIBOSIP2_LICENSE = LGPLv2.1+
 LIBOSIP2_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_arc),y)
+LIBOSIP2_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -U__arc__"
+endif
+
 LIBOSIP2_CONF_OPT = \
 	--enable-mt=$(if $(BR2_TOOLCHAIN_HAS_THREADS),yes,no)
 
-- 
1.7.9.5
