From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Jul 2012 22:40:14 +0200
Subject: [Buildroot] [git commit] libmad: Add optimization config options
Message-ID: <20120713204800.20BD490B5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=830c5868ed96a06007050f6b134e2a9954e88b10
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Configuring libmad with --enable-speed compromises accuracy and can cause audio
clipping in some cases (heard on ARM platform with some loud MP3s), so give
users the choice of MAD optimizations.

The default config corresponds to the default behavior of libmad's configure.

Signed-off-by: Beno??t Th??baudeau <benoit.thebaudeau@advansee.com>
---
 package/libmad/Config.in |   41 +++++++++++++++++++++++++++++++++++++++++
 package/libmad/libmad.mk |    6 +++++-
 2 files changed, 46 insertions(+), 1 deletions(-)

diff --git a/package/libmad/Config.in b/package/libmad/Config.in
index 4d4f930..d0edc49 100644
--- a/package/libmad/Config.in
+++ b/package/libmad/Config.in
@@ -6,3 +6,44 @@ config BR2_PACKAGE_LIBMAD
 	  without a floating-point unit.
 
 	  http://www.underbit.com/products/mad/
+
+if BR2_PACKAGE_LIBMAD
+
+choice
+	prompt "Speed vs. accuracy"
+	default BR2_PACKAGE_LIBMAD_OPTIMIZATION_DEFAULT
+
+config BR2_PACKAGE_LIBMAD_OPTIMIZATION_DEFAULT
+	bool "Default"
+	help
+	  Keep optimizations balanced between speed and accuracy.
+
+config BR2_PACKAGE_LIBMAD_OPTIMIZATION_SPEED
+	bool "Optimize for speed over accuracy"
+	help
+	  Compromise accuracy for speed.
+
+config BR2_PACKAGE_LIBMAD_OPTIMIZATION_ACCURACY
+	bool "Optimize for accuracy over speed"
+	help
+	  Compromise speed for accuracy.
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
diff --git a/package/libmad/libmad.mk b/package/libmad/libmad.mk
index 6e53cf2..3c92d52 100644
--- a/package/libmad/libmad.mk
+++ b/package/libmad/libmad.mk
@@ -30,6 +30,10 @@ LIBMAD_POST_INSTALL_TARGET_HOOKS += LIBMAD_INSTALL_TARGET_PC
 
 LIBMAD_CONF_OPT = \
 		--disable-debugging \
-		--enable-speed
+		$(if $(BR2_PACKAGE_LIBMAD_OPTIMIZATION_SPEED),--enable-speed) \
+		$(if $(BR2_PACKAGE_LIBMAD_OPTIMIZATION_ACCURACY),--enable-accuracy) \
+		--$(if $(BR2_PACKAGE_LIBMAD_SSO),enable,disable)-sso \
+		--$(if $(BR2_PACKAGE_LIBMAD_ASO),enable,disable)-aso \
+		--$(if $(BR2_PACKAGE_LIBMAD_STRICT_ISO),enable,disable)-strict-iso
 
 $(eval $(call AUTOTARGETS))
