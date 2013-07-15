From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 15 Jul 2013 22:53:42 +0200
Subject: [Buildroot] [git commit] libosip2: arc: Undefine __arc__ when
	building for ARC processors
Message-ID: <20130715211528.660439A4B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=821a6d6338451d76d6856ab9c0bfe1a709543b4b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libosip2 appears to have support for the "ARC standard" (Advanced
RISC Computing), which is unrelated to Synopsys DesignWare ARC
processors. The check for this involves verifying the existence of
the "__arc__" macro. Unfortunately, this macro is also present
as a predefined built-in for the ARC processors, resulting into
build failures.

[Peter: add short comment in .mk files as well]
Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libeXosip2/libeXosip2.mk |    5 +++++
 package/libosip2/libosip2.mk     |    5 +++++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/libeXosip2/libeXosip2.mk b/package/libeXosip2/libeXosip2.mk
index 4be2f05..6abdaab 100644
--- a/package/libeXosip2/libeXosip2.mk
+++ b/package/libeXosip2/libeXosip2.mk
@@ -12,6 +12,11 @@ LIBEXOSIP2_LICENSE_FILES = COPYING
 
 LIBEXOSIP2_DEPENDENCIES = host-pkgconf libosip2
 
+ifeq ($(BR2_arc),y)
+# toolchain __arc__ define conflicts with libeXosip2 source
+LIBEXOSIP2_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -U__arc__"
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBEXOSIP2_DEPENDENCIES += openssl
 LIBEXOSIP2_CONF_OPT += --enable-openssl
diff --git a/package/libosip2/libosip2.mk b/package/libosip2/libosip2.mk
index 6ae8149..0b672d8 100644
--- a/package/libosip2/libosip2.mk
+++ b/package/libosip2/libosip2.mk
@@ -10,6 +10,11 @@ LIBOSIP2_INSTALL_STAGING = YES
 LIBOSIP2_LICENSE = LGPLv2.1+
 LIBOSIP2_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_arc),y)
+# toolchain __arc__ define conflicts with libosip2 source
+LIBOSIP2_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -U__arc__"
+endif
+
 LIBOSIP2_CONF_OPT = \
 	--enable-mt=$(if $(BR2_TOOLCHAIN_HAS_THREADS),yes,no)
 
