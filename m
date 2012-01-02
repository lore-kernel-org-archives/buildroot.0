From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 2 Jan 2012 20:15:30 +0100
Subject: [Buildroot] [git commit] igh-ethercat: new package
Message-ID: <20120102191619.D5FB98FF8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=27ad470d7df5509ae4a96edd04521211900090e4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                    |    1 +
 package/igh-ethercat/Config.in       |   23 +++++++++++++++++++
 package/igh-ethercat/igh-ethercat.mk |   41 ++++++++++++++++++++++++++++++++++
 3 files changed, 65 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index dc12ad5..0e51493 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -431,6 +431,7 @@ source "package/hostapd/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/ifplugd/Config.in"
 endif
+source "package/igh-ethercat/Config.in"
 source "package/iperf/Config.in"
 source "package/iproute2/Config.in"
 source "package/ipsec-tools/Config.in"
diff --git a/package/igh-ethercat/Config.in b/package/igh-ethercat/Config.in
new file mode 100644
index 0000000..764a021
--- /dev/null
+++ b/package/igh-ethercat/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_IGH_ETHERCAT
+	bool "igh-ethercat"
+	depends on BR2_LINUX_KERNEL
+	help
+	  IgH EtherCAT Master for Linux.
+
+	  http://www.etherlab.org/en/ethercat/index.php
+
+if BR2_PACKAGE_IGH_ETHERCAT
+
+config BR2_PACKAGE_IGH_ETHERCAT_8139TOO
+	bool "8139too driver"
+
+config BR2_PACKAGE_IGH_ETHERCAT_E100
+	bool "e100 driver"
+
+config BR2_PACKAGE_IGH_ETHERCAT_E1000
+	bool "e1000 driver"
+
+config BR2_PACKAGE_IGH_ETHERCAT_R8169
+	bool "r8169 driver"
+
+endif
diff --git a/package/igh-ethercat/igh-ethercat.mk b/package/igh-ethercat/igh-ethercat.mk
new file mode 100644
index 0000000..b6ac5b8
--- /dev/null
+++ b/package/igh-ethercat/igh-ethercat.mk
@@ -0,0 +1,41 @@
+IGH_ETHERCAT_VERSION = stable-1.5
+IGH_ETHERCAT_SITE    = http://etherlabmaster.hg.sourceforge.net/hgweb/etherlabmaster/etherlabmaster/archive/
+IGH_ETHERCAT_SOURCE  = $(IGH_ETHERCAT_VERSION).tar.bz2
+
+IGH_ETHERCAT_AUTORECONF      = YES
+IGH_ETHERCAT_DEPENDENCIES    = linux
+IGH_ETHERCAT_INSTALL_STAGING = YES
+
+IGH_ETHERCAT_CONF_OPT = \
+	--with-linux-dir=$(LINUX_DIR)
+
+IGH_ETHERCAT_CONF_OPT += $(if $(BR2_PACKAGE_IGH_ETHERCAT_8139TOO),--enable-8139too,--disable-8139too)
+IGH_ETHERCAT_CONF_OPT += $(if $(BR2_PACKAGE_IGH_ETHERCAT_E100),--enable-e100,--disable-e100)
+IGH_ETHERCAT_CONF_OPT += $(if $(BR2_PACKAGE_IGH_ETHERCAT_E1000),--enable-e1000,--disable-e1000)
+IGH_ETHERCAT_CONF_OPT += $(if $(BR2_PACKAGE_IGH_ETHERCAT_R8169),--enable-r8169,--disable-r8169)
+
+# Since we download ethercat from source control, we have to emulate
+# the bootstrap script that creates the ChangeLog file before running
+# autoreconf.  We don't want to run that script directly, since we
+# leave to the autotargets infrastructure the responsability of
+# running 'autoreconf' so that the dependencies on host-automake,
+# host-autoconf and al. are correct.
+define IGH_ETHERCAT_CREATE_CHANGELOG
+	touch $(@D)/ChangeLog
+endef
+
+IGH_ETHERCAT_POST_PATCH_HOOKS += IGH_ETHERCAT_CREATE_CHANGELOG
+
+define IGH_ETHERCAT_BUILD_MODULES
+	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) modules
+endef
+
+IGH_ETHERCAT_POST_BUILD_HOOKS += IGH_ETHERCAT_BUILD_MODULES
+
+define IGH_ETHERCAT_INSTALL_MODULES
+	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) modules_install
+endef
+
+IGH_ETHERCAT_POST_INSTALL_TARGET_HOOKS += IGH_ETHERCAT_INSTALL_MODULES
+
+$(eval $(call AUTOTARGETS))
