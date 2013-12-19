From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 20 Dec 2013 00:43:28 +0100
Subject: [Buildroot] [PATCH 5/5] package/powervr: switch to package-defined
	providers
In-Reply-To: <cover.1387495624.git.yann.morin.1998@free.fr>
References: <cover.1387495624.git.yann.morin.1998@free.fr>
Message-ID: <e3300b74a954f422626703e3402206636cf35043.1387495624.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

For the underlying reasons, see previous patch, titled:
    package/opengl/libegl: switch to package-defined providers

Reported-by: David Corvoysier <david.corvoysier@orange.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: David Corvoysier <david.corvoysier@orange.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
---
 package/powervr/Config.in  | 4 ++++
 package/powervr/powervr.mk | 5 +----
 package/ti-gfx/Config.in   | 3 +++
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
index 83392fd..d40411e 100644
--- a/package/powervr/powervr.mk
+++ b/package/powervr/powervr.mk
@@ -5,10 +5,7 @@
 ################################################################################
 
 POWERVR_SOURCE =
-
-ifeq ($(BR2_PACKAGE_TI_GFX),y)
-POWERVR_DEPENDENCIES += ti-gfx
-endif
+POWERVR_DEPENDENCIES = $(BR2_PACKAGE_PROVIDES_POWERVR)
 
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
-- 
1.8.1.2
