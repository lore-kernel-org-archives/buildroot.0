From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 26 Feb 2019 11:36:45 -0600
Subject: [Buildroot] [PATCH] package/openjdk: support zero hotspot variant
Message-ID: <1551202605-37314-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The OpenJDK package supports a non-assembler variant of the hotspot
virtual machine.  This allows archtectures which don't have hard-coded
support (which provides better performance) to still build a virtual
machine that can execute JAVA.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---

Requires http://patchwork.ozlabs.org/patch/1040100/ to merge first.

---
 package/openjdk/Config.in  | 12 +++++++++++-
 package/openjdk/openjdk.mk |  5 ++++-
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
index 4dd5576..cf77628 100644
--- a/package/openjdk/Config.in
+++ b/package/openjdk/Config.in
@@ -34,15 +34,25 @@ menu "JVM Variants"
 
 config BR2_PACKAGE_OPENJDK_JVM_VARIANT_CLIENT
 	bool "client"
+	depends on !BR2_powerpc
 	help
 	  Quick loading, but slower run-time performance.
 
 config BR2_PACKAGE_OPENJDK_JVM_VARIANT_SERVER
 	bool "server"
-	default y
+	depends on !BR2_powerpc
 	help
 	  Slower loading, but faster run-time performance.
 
+config BR2_PACKAGE_OPENJDK_JVM_VARIANT_ZERO
+	bool "zero"
+	default y
+	select BR2_PACKAGE_LIBFFI
+	help
+	  A non-assembler variant with wide arch support,
+	  however performance is less then client/server.
+
+	  http://openjdk.java.net/projects/zero/
 endmenu
 endif
 
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index 23fbbf5..e99c8d8 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -33,10 +33,13 @@ OPENJDK_DEPENDENCIES = \
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
-- 
1.9.1
