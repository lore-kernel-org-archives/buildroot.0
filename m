From: Petri Gynther <pgynther@google.com>
Date: Mon,  8 Aug 2016 11:35:00 -0700
Subject: [Buildroot] [RESEND][PATCH v2 2/3] gcc: configs: rename
	BR2_EXTRA_GCC_CONFIG_OPTIONS
In-Reply-To: <1470681301-6374-1-git-send-email-pgynther@google.com>
References: <1470681301-6374-1-git-send-email-pgynther@google.com>
Message-ID: <1470681301-6374-2-git-send-email-pgynther@google.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rename BR2_EXTRA_GCC_CONFIG_OPTIONS to BR2_GCC_EXTRA_CONFIG_OPTIONS
to be consistent with BR2_GCC_* and BR2_BINUTILS_EXTRA_CONFIG_OPTIONS.

Signed-off-by: Petri Gynther <pgynther@google.com>
---
 Config.in.legacy                       | 14 ++++++++++++++
 package/gcc/Config.in.host             |  3 ++-
 package/gcc/gcc-final/gcc-final.mk     |  2 +-
 package/gcc/gcc-initial/gcc-initial.mk |  2 +-
 4 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 746b80a..4287b61 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -143,6 +143,20 @@ comment "----------------------------------------------------"
 endif
 
 ###############################################################################
+comment "Legacy options removed in master"
+
+config BR2_EXTRA_GCC_CONFIG_OPTIONS
+	string "gcc extra config options has been renamed"
+	default ""
+	help
+	  BR2_EXTRA_GCC_CONFIG_OPTIONS has been renamed to BR2_GCC_EXTRA_CONFIG_OPTIONS
+
+config BR2_EXTRA_GCC_CONFIG_OPTIONS_WRAP
+	bool
+	default y if BR2_EXTRA_GCC_CONFIG_OPTIONS != ""
+	select BR2_LEGACY
+
+###############################################################################
 comment "Legacy options removed in 2016.08"
 
 config BR2_PACKAGE_SYSTEMD_COMPAT
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 2b54959..ec272d2 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -109,8 +109,9 @@ config BR2_GCC_VERSION
 	default "6.1.0" if BR2_GCC_VERSION_6_X
 	default "arc-2016.09-eng007" if BR2_GCC_VERSION_4_8_ARC
 
-config BR2_EXTRA_GCC_CONFIG_OPTIONS
+config BR2_GCC_EXTRA_CONFIG_OPTIONS
 	string "Additional gcc options"
+	default BR2_EXTRA_GCC_CONFIG_OPTIONS if BR2_EXTRA_GCC_CONFIG_OPTIONS != ""
 	default ""
 	help
 	  Any additional gcc configure options you may want to
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 284d34c..0c0ab35 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -90,7 +90,7 @@ endif
 # End with user-provided options, so that they can override previously
 # defined options.
 HOST_GCC_FINAL_CONF_OPTS += \
-	$(call qstrip,$(BR2_EXTRA_GCC_CONFIG_OPTIONS))
+	$(call qstrip,$(BR2_GCC_EXTRA_CONFIG_OPTIONS))
 
 HOST_GCC_FINAL_CONF_ENV = \
 	$(HOST_GCC_COMMON_CONF_ENV)
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index 1e58d8b..0fba9fb 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -47,7 +47,7 @@ HOST_GCC_INITIAL_CONF_OPTS = \
 	--with-newlib \
 	--disable-largefile \
 	--disable-nls \
-	$(call qstrip,$(BR2_EXTRA_GCC_CONFIG_OPTIONS))
+	$(call qstrip,$(BR2_GCC_EXTRA_CONFIG_OPTIONS))
 
 HOST_GCC_INITIAL_CONF_ENV = \
 	$(HOST_GCC_COMMON_CONF_ENV)
-- 
2.8.0.rc3.226.g39d4020
