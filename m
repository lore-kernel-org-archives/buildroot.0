From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon, 15 Apr 2019 17:14:28 -0400
Subject: [Buildroot] [PATCH 2/2] package/openjdk: only support a single
 variant at a time
In-Reply-To: <20190415211428.25961-1-aduskett@gmail.com>
References: <20190415211428.25961-1-aduskett@gmail.com>
Message-ID: <20190415211428.25961-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Selecting multiple variants doesn't seem to be that important in the context of
Buildroot. This patch removes the ability to select multiple variants in favor
of just selecting one.

The default is server as that is what all of the major distributions currently
use as the default as well.

Fixes:
http://autobuild.buildroot.net/results/a45cfa9b3602fd05f6adbf070a1bad6510975c36/build-end.log
Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/openjdk/Config.in  | 16 +++++++++-------
 package/openjdk/openjdk.mk |  9 ++++-----
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
index de0efcc86b..61294ec49f 100644
--- a/package/openjdk/Config.in
+++ b/package/openjdk/Config.in
@@ -41,10 +41,6 @@ config BR2_PACKAGE_OPENJDK
 	select BR2_PACKAGE_XLIB_LIBXT
 	select BR2_PACKAGE_XLIB_LIBXTST
 	select BR2_PACKAGE_ZLIB
-	# make sure at least one variant is enabled
-	select BR2_PACKAGE_OPENJDK_JVM_VARIANT_SERVER \
-	       if !BR2_PACKAGE_OPENJDK_JVM_VARIANT_CLIENT && !BR2_PACKAGE_OPENJDK_JVM_VARIANT_ZERO && !BR2_powerpc
-	select BR2_PACKAGE_OPENJDK_JVM_VARIANT_ZERO if BR2_powerpc
 	help
 	  OpenJDK is a free and open-source implementation of the
 	  Java Platform.
@@ -53,20 +49,25 @@ config BR2_PACKAGE_OPENJDK
 
 if BR2_PACKAGE_OPENJDK
 
+choice
+	prompt "openjdk variant"
+	default BR2_PACKAGE_OPENJDK_JVM_VARIANT_SERVER if !BR2_powerpc
+	default BR2_PACKAGE_OPENJDK_JVM_VARIANT_ZERO if BR2_powerpc
+
 config BR2_PACKAGE_OPENJDK_JVM_VARIANT_CLIENT
-	bool "build client variant"
+	bool "client"
 	depends on !BR2_powerpc
 	help
 	  Quick loading, but slower run-time performance.
 
 config BR2_PACKAGE_OPENJDK_JVM_VARIANT_SERVER
-	bool "build server variant"
+	bool "server"
 	depends on !BR2_powerpc
 	help
 	  Slower loading, but faster run-time performance.
 
 config BR2_PACKAGE_OPENJDK_JVM_VARIANT_ZERO
-	bool "build zero variant"
+	bool "zero"
 	select BR2_PACKAGE_LIBFFI
 	help
 	  A non-assembler variant with wide arch support, however
@@ -74,6 +75,7 @@ config BR2_PACKAGE_OPENJDK_JVM_VARIANT_ZERO
 
 	  http://openjdk.java.net/projects/zero
 
+endchoice
 endif
 
 comment "openjdk needs X.Org"
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index 3f7b87ca96..b59e26778f 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -34,16 +34,15 @@ OPENJDK_DEPENDENCIES = \
 
 # JVM variants
 ifeq ($(BR2_PACKAGE_OPENJDK_JVM_VARIANT_CLIENT),y)
-OPENJDK_JVM_VARIANTS += client
+OPENJDK_JVM_VARIANT = client
 endif
 ifeq ($(BR2_PACKAGE_OPENJDK_JVM_VARIANT_SERVER),y)
-OPENJDK_JVM_VARIANTS += server
+OPENJDK_JVM_VARIANT = server
 endif
 ifeq ($(BR2_PACKAGE_OPENJDK_JVM_VARIANT_ZERO),y)
-OPENJDK_JVM_VARIANTS += zero
+OPENJDK_JVM_VARIANT = zero
 OPENJDK_DEPENDENCIES += libffi
 endif
-OPENJDK_JVM_VARIANT_LIST = $(subst $(space),$(comma),$(OPENJDK_JVM_VARIANTS))
 
 # OpenJDK ignores some variables unless passed via the environment.
 # These variables are PATH, LD, CC, CXX, and CPP.
@@ -75,7 +74,7 @@ OPENJDK_CONF_OPTS = \
 	--with-extra-cxxflags="$(TARGET_CXXFLAGS)" \
 	--with-giflib=system \
 	--with-jobs=$(PARALLEL_JOBS) \
-	--with-jvm-variants=$(OPENJDK_JVM_VARIANT_LIST) \
+	--with-jvm-variants=$(OPENJDK_JVM_VARIANT) \
 	--with-lcms=system \
 	--with-libjpeg=system \
 	--with-libpng=system \
-- 
2.20.1
