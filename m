From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 19 Apr 2017 22:00:06 +0200
Subject: [Buildroot] [PATCH 8/9] xenomai: add support for registry
In-Reply-To: <20170419200007.12590-1-patrickdepinguin@gmail.com>
References: <20170419200007.12590-1-patrickdepinguin@gmail.com>
Message-ID: <20170419200007.12590-9-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Add a config option to enable the Xenomai registry, which allows accessing
internal Xenomai state.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/xenomai/Config.in  | 20 ++++++++++++++++++++
 package/xenomai/xenomai.mk |  7 +++++++
 2 files changed, 27 insertions(+)

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index d6474bd..09e18bf 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -96,6 +96,26 @@ config BR2_PACKAGE_XENOMAI_ENABLE_SMP
 
 	  http://xenomai.org/troubleshooting-a-dual-kernel-configuration/#feature_mismatch_missing8221smpnosmp8221
 
+config BR2_PACKAGE_XENOMAI_ENABLE_REGISTRY
+	bool "Enable registry"
+	select BR2_PACKAGE_LIBFUSE
+	depends on !BR2_STATIC_LIBS # libfuse
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
+	depends on BR2_USE_MMU # libfuse
+	help
+	  Xenomai APIs can export their internal state through a
+	  pseudo-filesystem, whose files may be read to obtain information about
+	  the existing real-time objects, such as tasks, semaphores, message
+	  queues and so on.
+
+config BR2_PACKAGE_XENOMAI_ENABLE_REGISTRY_PATH
+	string "Custom registry root path"
+	depends on BR2_PACKAGE_XENOMAI_ENABLE_REGISTRY
+	help
+	  Specify the root path of the registry here.
+	  To use the Xenomai default (currently: /var/run/xenomai), leave this
+	  option empty.
+
 config BR2_PACKAGE_XENOMAI_TESTSUITE
 	bool "Install testsuite"
 	help
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 99f62f0..31424a1 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -45,6 +45,13 @@ else
 XENOMAI_CONF_OPTS += --disable-smp
 endif
 
+ifeq ($(BR2_PACKAGE_XENOMAI_ENABLE_REGISTRY),y)
+XENOMAI_DEPENDENCIES += libfuse
+XENOMAI_CONF_OPTS += --enable-registry$(if $(call qstrip,$(BR2_PACKAGE_XENOMAI_ENABLE_REGISTRY_PATH)),=$(call qstrip,$(BR2_PACKAGE_XENOMAI_ENABLE_REGISTRY_PATH)))
+else
+XENOMAI_CONF_OPTS += --disable-registry
+endif
+
 # Some of these files may be desired by some users -- at that point specific
 # config options need to be added to keep a particular set.
 define XENOMAI_REMOVE_UNNEEDED_FILES
-- 
2.10.2
