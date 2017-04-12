From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Apr 2017 22:59:56 +0200
Subject: [Buildroot] [git commit] xenomai: Add config for enabling/disabling
	SMP
Message-ID: <20170412210000.C32AB8270C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=36c229d65d34eeedd74434ee8625db88f93c973e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a config option for enabling/disabling SMP
in Xenomai userspace in version 3.x

Enabled by default.

Signed-off-by: Pawel Sikora <sikor6@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
[Thomas: implement minor tweaks suggested by Thomas DS.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xenomai/Config.in  | 18 ++++++++++++++++++
 package/xenomai/xenomai.mk |  6 ++++++
 2 files changed, 24 insertions(+)

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index 324f502..8acf579 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -78,6 +78,24 @@ config BR2_PACKAGE_XENOMAI_COBALT
 	  in the Linux Kernel Extensions menu.
 endchoice
 
+config BR2_PACKAGE_XENOMAI_ENABLE_SMP
+	bool "Enable SMP support"
+	default y
+	help
+	  This option enables SMP support in Xenomai userspace.
+
+	  If this option is turned on while no SMP support is enabled
+	  in the kernel, things will still work. However, if SMP is
+	  enabled in the kernel but this option is not turned on,
+	  Xenomai applications will complain with:
+
+	    feature mismatch: missing="smp/nosmp"
+
+	  Please refer to this troubleshooting guide for more
+	  information:
+
+	  http://xenomai.org/troubleshooting-a-dual-kernel-configuration/#feature_mismatch_missing8221smpnosmp8221
+
 config BR2_PACKAGE_XENOMAI_TESTSUITE
 	bool "Install testsuite"
 	help
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 73d9617..bd147a9 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -29,6 +29,12 @@ else
 XENOMAI_CONF_OPTS += --with-core=cobalt
 endif
 
+ifeq ($(BR2_PACKAGE_XENOMAI_ENABLE_SMP),y)
+XENOMAI_CONF_OPTS += --enable-smp
+else
+XENOMAI_CONF_OPTS += --disable-smp
+endif
+
 define XENOMAI_REMOVE_DEVFILES
 	for i in xeno-config xeno-info wrap-link.sh ; do \
 		rm -f $(TARGET_DIR)/usr/bin/$$i ; \
