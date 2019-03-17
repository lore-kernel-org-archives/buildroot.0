From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 14:26:18 +0100
Subject: [Buildroot] [git commit] package/openjdk: support zero hotspot
 variant
Message-ID: <20190317132440.42E6D8079B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a54194f35c5c65d1e73491f9f75aaaee905e3d15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The OpenJDK package supports a non-assembler variant of the hotspot
virtual machine.  This allows archtectures which don't have hard-coded
support (which provides better performance) to still build a virtual
machine that can execute JAVA.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openjdk/Config.in  | 14 +++++++++++++-
 package/openjdk/openjdk.mk |  5 ++++-
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
index 96eef79eb0..dd1f3c59cf 100644
--- a/package/openjdk/Config.in
+++ b/package/openjdk/Config.in
@@ -25,7 +25,8 @@ config BR2_PACKAGE_OPENJDK
 	select BR2_PACKAGE_ZLIB
 	# make sure at least one variant is enabled
 	select BR2_PACKAGE_OPENJDK_JVM_VARIANT_SERVER \
-	       if !BR2_PACKAGE_OPENJDK_JVM_VARIANT_CLIENT
+	       if !BR2_PACKAGE_OPENJDK_JVM_VARIANT_CLIENT && !BR2_PACKAGE_OPENJDK_JVM_VARIANT_ZERO && !BR2_powerpc
+	select BR2_PACKAGE_OPENJDK_JVM_VARIANT_ZERO if BR2_powerpc
 	help
 	  OpenJDK is a free and open-source implementation of the
 	  Java Platform.
@@ -36,14 +37,25 @@ if BR2_PACKAGE_OPENJDK
 
 config BR2_PACKAGE_OPENJDK_JVM_VARIANT_CLIENT
 	bool "build client variant"
+	depends on !BR2_powerpc
 	help
 	  Quick loading, but slower run-time performance.
 
 config BR2_PACKAGE_OPENJDK_JVM_VARIANT_SERVER
 	bool "build server variant"
+	depends on !BR2_powerpc
 	help
 	  Slower loading, but faster run-time performance.
 
+config BR2_PACKAGE_OPENJDK_JVM_VARIANT_ZERO
+	bool "build zero variant"
+	select BR2_PACKAGE_LIBFFI
+	help
+	  A non-assembler variant with wide arch support, however
+	  performance is less then client/server.
+
+	  http://openjdk.java.net/projects/zero
+
 endif
 
 comment "openjdk needs X.Org"
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index cf98dd73e1..602e26b34b 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -35,10 +35,13 @@ OPENJDK_DEPENDENCIES = \
 ifeq ($(BR2_PACKAGE_OPENJDK_JVM_VARIANT_CLIENT),y)
 OPENJDK_JVM_VARIANTS += client
 endif
-
 ifeq ($(BR2_PACKAGE_OPENJDK_JVM_VARIANT_SERVER),y)
 OPENJDK_JVM_VARIANTS += server
 endif
+ifeq ($(BR2_PACKAGE_OPENJDK_JVM_VARIANT_ZERO),y)
+OPENJDK_JVM_VARIANTS += zero
+OPENJDK_DEPENDENCIES += libffi
+endif
 OPENJDK_JVM_VARIANT_LIST = $(subst $(space),$(comma),$(OPENJDK_JVM_VARIANTS))
 
 # OpenJDK ignores some variables unless passed via the environment.
