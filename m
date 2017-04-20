From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Apr 2017 23:05:34 +0200
Subject: [Buildroot] [git commit] xenomai: add support for registry
Message-ID: <20170420211017.1C121817E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=78672fdade49de4c0dc551f1b3a9ac7c61c1af01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a config option to enable the Xenomai registry, which allows accessing
internal Xenomai state.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
[Thomas:
 - add missing Config.in comment.
 - rewrap Config.in help text.
 - tweak the .mk file logic for the registry path to avoid the super
   long line.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xenomai/Config.in  | 24 ++++++++++++++++++++++++
 package/xenomai/xenomai.mk | 12 ++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index d6474bd..6646ec0 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -96,6 +96,30 @@ config BR2_PACKAGE_XENOMAI_ENABLE_SMP
 
 	  http://xenomai.org/troubleshooting-a-dual-kernel-configuration/#feature_mismatch_missing8221smpnosmp8221
 
+config BR2_PACKAGE_XENOMAI_ENABLE_REGISTRY
+	bool "Enable registry"
+	select BR2_PACKAGE_LIBFUSE
+	depends on !BR2_STATIC_LIBS # libfuse
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
+	depends on BR2_USE_MMU # libfuse
+	help
+	  Xenomai APIs can export their internal state through a
+	  pseudo-filesystem, whose files may be read to obtain
+	  information about the existing real-time objects, such as
+	  tasks, semaphores, message queues and so on.
+
+comment "registry needs a toolchain w/ threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_XENOMAI_ENABLE_REGISTRY_PATH
+	string "Custom registry root path"
+	depends on BR2_PACKAGE_XENOMAI_ENABLE_REGISTRY
+	help
+	  Specify the root path of the registry here.
+	  To use the Xenomai default (currently: /var/run/xenomai),
+	  leave this option empty.
+
 config BR2_PACKAGE_XENOMAI_TESTSUITE
 	bool "Install testsuite"
 	help
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 99f62f0..89b022a 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -45,6 +45,18 @@ else
 XENOMAI_CONF_OPTS += --disable-smp
 endif
 
+ifeq ($(BR2_PACKAGE_XENOMAI_ENABLE_REGISTRY),y)
+XENOMAI_DEPENDENCIES += libfuse
+XENOMAI_REGISTRY_PATH = $(call qstrip,$(BR2_PACKAGE_XENOMAI_ENABLE_REGISTRY_PATH))
+ifeq ($(XENOMAI_REGISTRY_PATH),)
+XENOMAI_CONF_OPTS += --enable-registry
+else
+XENOMAI_CONF_OPTS += --enable-registry=$(XENOMAI_REGISTRY_PATH)
+endif
+else
+XENOMAI_CONF_OPTS += --disable-registry
+endif
+
 # Some of these files may be desired by some users -- at that point specific
 # config options need to be added to keep a particular set.
 define XENOMAI_REMOVE_UNNEEDED_FILES
