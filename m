From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 05 Feb 2014 11:50:11 +0100
Subject: [Buildroot] [PATCH 5 of 7] ccache: remove deprecated target package
In-Reply-To: <patchbomb.1391597406@argentina>
References: <patchbomb.1391597406@argentina>
Message-ID: <177393de90a5b546175b.1391597411@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ccache target package has been deprecated since 2013.02 and thus can be
removed in 2014.02. This does not change anything about host ccache (used
for speeding up builds).

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 Config.in.legacy         |   8 ++++++++
 package/Config.in        |   1 -
 package/ccache/Config.in |  12 ------------
 package/ccache/ccache.mk |   1 -
 4 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -101,6 +101,14 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2014.02"
 
+config BR2_PACKAGE_CCACHE
+	bool "ccache target package has been removed"
+	select BR2_LEGACY
+	help
+	  The 'ccache' target package has been removed since it has been
+	  deprecated for more than four buildroot releases.
+	  Note: using ccache for speeding up builds is still supported.
+
 config BR2_HAVE_DOCUMENTATION
 	bool "support for documentation on target has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
--- a/package/Config.in
+++ b/package/Config.in
@@ -85,7 +85,6 @@ source "package/binutils/Config.in"
 source "package/bison/Config.in"
 source "package/bsdiff/Config.in"
 source "package/bustle/Config.in"
-source "package/ccache/Config.in"
 source "package/cvs/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/diffutils/Config.in"
diff --git a/package/ccache/Config.in b/package/ccache/Config.in
deleted file mode 100644
--- a/package/ccache/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_CCACHE
-	bool "ccache"
-	# needs fork()
-	depends on BR2_USE_MMU
-	# We no longer support a toolchain on the target
-	depends on BR2_DEPRECATED_SINCE_2013_02
-	help
-	  ccache is a compiler cache. It speeds up recompilation by
-	  caching previous compilations and detecting when the same
-	  compilation is being done again
-
-	  http://ccache.samba.org
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -38,7 +38,6 @@ endef
 HOST_CCACHE_POST_CONFIGURE_HOOKS += \
 	HOST_CCACHE_PATCH_CONFIGURATION
 
-$(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
 ifeq ($(BR2_CCACHE),y)
