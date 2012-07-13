From: =?utf-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau@advansee.com>
Date: Fri, 13 Jul 2012 19:25:12 +0200 (CEST)
Subject: [Buildroot] [PATCH v2] libmad: Add optimization config options
In-Reply-To: <1655432189.1326270.1342189713400.JavaMail.root@advansee.com>
Message-ID: <1218634753.1336082.1342200312454.JavaMail.root@advansee.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Configuring libmad with --enable-speed compromises accuracy and can cause audio
clipping in some cases (heard on ARM platform with some loud MP3s), so give
users the choice of MAD optimizations.

The default config corresponds to the default behavior of libmad's configure.

Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau@advansee.com>
---
Note that, if applicable, the options are always passed with either '--enable-'
or '--disable-' to be more robust than a simple omission, since this can avoid a
mismatch in config options if the package version is changed and its new default
configure options are different.

Changes for v2:
   - Factorize the 'able' in the $(if ).

 .../package/libmad/Config.in                       |   41 ++++++++++++++++++++
 .../package/libmad/libmad.mk                       |    6 ++-
 2 files changed, 46 insertions(+), 1 deletion(-)

diff --git buildroot.orig/package/libmad/Config.in buildroot/package/libmad/Config.in
index 4d4f930..d4d08de 100644
--- buildroot.orig/package/libmad/Config.in
+++ buildroot/package/libmad/Config.in
@@ -6,3 +6,44 @@ config BR2_PACKAGE_LIBMAD
 	  without a floating-point unit.
 
 	  http://www.underbit.com/products/mad/
+
+if BR2_PACKAGE_LIBMAD
+
+choice
+	prompt "Speed vs. accuracy"
+	default BR2_PACKAGE_LIBMAD_SPEED_ACCURACY
+
+config BR2_PACKAGE_LIBMAD_SPEED
+	bool "Optimize for speed over accuracy"
+	help
+	  Compromise accuracy for speed.
+
+config BR2_PACKAGE_LIBMAD_ACCURACY
+	bool "Optimize for accuracy over speed"
+	help
+	  Compromise speed for accuracy.
+
+config BR2_PACKAGE_LIBMAD_SPEED_ACCURACY
+	bool "Optimize for both speed and accuracy"
+	help
+	  Keep optimizations balanced between speed and accuracy.
+
+endchoice
+
+config BR2_PACKAGE_LIBMAD_SSO
+	bool "Subband synthesis optimization"
+	help
+	  Use the subband synthesis optimization, with reduced accuracy.
+
+config BR2_PACKAGE_LIBMAD_ASO
+	bool "Architecture-specific optimizations"
+	default y
+	help
+	  Use certain architecture-specific optimizations.
+
+config BR2_PACKAGE_LIBMAD_STRICT_ISO
+	bool "Strict ISO/IEC interpretations"
+	help
+	  Use strict ISO/IEC interpretations.
+
+endif
diff --git buildroot.orig/package/libmad/libmad.mk buildroot/package/libmad/libmad.mk
index 6e53cf2..1c77e28 100644
--- buildroot.orig/package/libmad/libmad.mk
+++ buildroot/package/libmad/libmad.mk
@@ -30,6 +30,10 @@ LIBMAD_POST_INSTALL_TARGET_HOOKS += LIBMAD_INSTALL_TARGET_PC
 
 LIBMAD_CONF_OPT = \
 		--disable-debugging \
-		--enable-speed
+		$(if $(BR2_PACKAGE_LIBMAD_SPEED),--enable-speed) \
+		$(if $(BR2_PACKAGE_LIBMAD_ACCURACY),--enable-accuracy) \
+		--$(if $(BR2_PACKAGE_LIBMAD_SSO),en,dis)able-sso \
+		--$(if $(BR2_PACKAGE_LIBMAD_ASO),en,dis)able-aso \
+		--$(if $(BR2_PACKAGE_LIBMAD_STRICT_ISO),en,dis)able-strict-iso
 
 $(eval $(call AUTOTARGETS))
