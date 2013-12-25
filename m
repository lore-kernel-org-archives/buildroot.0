From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Dec 2013 18:21:33 +0100
Subject: [Buildroot] [git commit] package/powervr: switch to package-defined
	providers
Message-ID: <20131225172209.2A3059C1D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fe93cc8b5006db835ab1e417c2df6c9a0364697b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For the underlying reasons, see previous patch, titled:
    package/opengl/libegl: switch to package-defined providers

Reported-by: David Corvoysier <david.corvoysier@orange.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/powervr/Config.in  |    4 ++++
 package/powervr/powervr.mk |    5 +----
 package/ti-gfx/Config.in   |    3 +++
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/powervr/Config.in b/package/powervr/Config.in
index d09ce74..746e15b 100644
--- a/package/powervr/Config.in
+++ b/package/powervr/Config.in
@@ -1,2 +1,6 @@
 config BR2_PACKAGE_HAS_POWERVR
 	bool
+
+config BR2_PACKAGE_PROVIDES_POWERVR
+	depends on BR2_PACKAGE_HAS_POWERVR
+	string
diff --git a/package/powervr/powervr.mk b/package/powervr/powervr.mk
index 83392fd..1f43505 100644
--- a/package/powervr/powervr.mk
+++ b/package/powervr/powervr.mk
@@ -5,10 +5,7 @@
 ################################################################################
 
 POWERVR_SOURCE =
-
-ifeq ($(BR2_PACKAGE_TI_GFX),y)
-POWERVR_DEPENDENCIES += ti-gfx
-endif
+POWERVR_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_POWERVR))
 
 ifeq ($(POWERVR_DEPENDENCIES),)
 define POWERVR_CONFIGURE_CMDS
diff --git a/package/ti-gfx/Config.in b/package/ti-gfx/Config.in
index 929247b..f455f4c 100644
--- a/package/ti-gfx/Config.in
+++ b/package/ti-gfx/Config.in
@@ -17,6 +17,9 @@ config BR2_PACKAGE_PROVIDES_OPENGL_EGL
 config BR2_PACKAGE_PROVIDES_OPENGL_ES
 	default "ti-gfx"
 
+config BR2_PACKAGE_PROVIDES_POWERVR
+	default "ti-gfx"
+
 config BR2_PACKAGE_TI_GFX_DEBUG
 	bool "enable debug support"
 	help
