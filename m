From: =?UTF-8?B?QW5kcsOpIEhlbnRzY2hlbA==?= <nerv@dawncrow.de>
Date: Thu, 05 Mar 2015 20:38:40 +0100
Subject: [Buildroot] [PATCH] wine: Add dependency check for ALSA
Message-ID: <54F8B0C0.2040806@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---

This fixes the problem from http://autobuild.buildroot.org/results/018/018391c5e70d33bc0b5745ad7a2a273efa9be0d7/

 package/wine/wine.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index 926ac99..47c7259 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -29,6 +29,13 @@ ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
 WINE_CONF_OPTS += TARGETFLAGS="-b $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))"
 endif
 
+ifeq ($(BR2_PACKAGE_ALSA_LIB)$(BR2_PACKAGE_ALSA_LIB_SEQ),yy)
+WINE_CONF_OPTS += --with-alsa
+WINE_DEPENDENCIES += alsa-lib
+else
+WINE_CONF_OPTS += --without-alsa
+endif
+
 ifeq ($(BR2_PACKAGE_CUPS),y)
 WINE_CONF_OPTS += --with-cups
 WINE_DEPENDENCIES += cups
