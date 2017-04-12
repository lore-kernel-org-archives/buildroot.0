From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Apr 2017 22:52:00 +0200
Subject: [Buildroot] [git commit] xenomai: Add choice for enabling/disabling
	Cobalt/Mercury core
Message-ID: <20170412205256.0342B82747@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f9351871f058bd3a8edcd99cdee7a9f49e2739bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an option choice for Cobalt or Mercury core
depending on option BR2_LINUX_KERNEL_EXT_XENOMAI.

Signed-off-by: Pawel Sikora <sikor6@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xenomai/Config.in  | 27 +++++++++++++++++++++++++++
 package/xenomai/xenomai.mk |  6 ++++++
 2 files changed, 33 insertions(+)

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index b548ee8..324f502 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -51,6 +51,33 @@ config BR2_PACKAGE_XENOMAI_VERSION
 	  BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH, in the Linux
 	  Kernel -> Linux Kernel Extensions menu.
 
+choice
+	prompt "Xenomai core"
+	default BR2_PACKAGE_XENOMAI_MERCURY
+	help
+	  Select the Xenomai core: dual kernel (Cobalt)
+	  or native Linux Kernel (Mercury).
+
+config BR2_PACKAGE_XENOMAI_MERCURY
+	bool "Mercury"
+	depends on !BR2_LINUX_KERNEL_EXT_XENOMAI
+	help
+	  Select Mercury core for the Xenomai userspace.
+	  You want to use it if you have the native Linux Kernel.
+
+config BR2_PACKAGE_XENOMAI_COBALT
+	bool "Cobalt"
+	help
+	  Select Cobalt core (dual kernel) for the Xenomai
+	  userspace. Use this if you use a Xenomai-patched
+	  Linux kernel.
+
+	  If you want to use Cobalt core, your kernel must have
+	  the Adeos and Xenomai patches applied to it. You can
+	  add these through the BR2_LINUX_KERNEL_EXT_XENOMAI option
+	  in the Linux Kernel Extensions menu.
+endchoice
+
 config BR2_PACKAGE_XENOMAI_TESTSUITE
 	bool "Install testsuite"
 	help
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index c9e810e..73d9617 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -23,6 +23,12 @@ XENOMAI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-user
 
 XENOMAI_CONF_OPTS += --includedir=/usr/include/xenomai/ --disable-doc-install
 
+ifeq ($(BR2_PACKAGE_XENOMAI_MERCURY),y)
+XENOMAI_CONF_OPTS += --with-core=mercury
+else
+XENOMAI_CONF_OPTS += --with-core=cobalt
+endif
+
 define XENOMAI_REMOVE_DEVFILES
 	for i in xeno-config xeno-info wrap-link.sh ; do \
 		rm -f $(TARGET_DIR)/usr/bin/$$i ; \
