From: Gilles Talis <gilles.talis@gmail.com>
Date: Thu, 21 Feb 2013 17:01:21 -0800
Subject: [Buildroot] [PATCH 1/1] libmad: force architecture-specific
	optimisations on AVR32
In-Reply-To: <y>
References: <y>
Message-ID: <1361494881-27134-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/e01f5a5484299dce1797966445f3972583c67b22
http://autobuild.buildroot.net/results/7ed0563fbbfc19c93ec5be35d3b6a95e496b4c5d

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/libmad/Config.in |    1 +
 package/libmad/libmad.mk |    8 +++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/libmad/Config.in b/package/libmad/Config.in
index d0edc49..b713cd1 100644
--- a/package/libmad/Config.in
+++ b/package/libmad/Config.in
@@ -37,6 +37,7 @@ config BR2_PACKAGE_LIBMAD_SSO
 
 config BR2_PACKAGE_LIBMAD_ASO
 	bool "Architecture-specific optimizations"
+	depends on !BR2_avr32
 	default y
 	help
 	  Use certain architecture-specific optimizations.
diff --git a/package/libmad/libmad.mk b/package/libmad/libmad.mk
index 09f3cdb..651afb6 100644
--- a/package/libmad/libmad.mk
+++ b/package/libmad/libmad.mk
@@ -35,7 +35,13 @@ LIBMAD_CONF_OPT = \
 		$(if $(BR2_PACKAGE_LIBMAD_OPTIMIZATION_SPEED),--enable-speed) \
 		$(if $(BR2_PACKAGE_LIBMAD_OPTIMIZATION_ACCURACY),--enable-accuracy) \
 		--$(if $(BR2_PACKAGE_LIBMAD_SSO),enable,disable)-sso \
-		--$(if $(BR2_PACKAGE_LIBMAD_ASO),enable,disable)-aso \
 		--$(if $(BR2_PACKAGE_LIBMAD_STRICT_ISO),enable,disable)-strict-iso
 
+ifeq ($(BR2_avr32),y)
+# AVR32: Force architecture-specific optimisations
+LIBMAD_CONF_OPT += --enable-aso
+else
+LIBMAD_CONF_OPT += --$(if $(BR2_PACKAGE_LIBMAD_ASO),enable,disable)-aso
+endif
+
 $(eval $(autotools-package))
-- 
1.7.10.4
