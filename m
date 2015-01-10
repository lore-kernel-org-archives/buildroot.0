From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 18:43:59 +0100
Subject: [Buildroot] [git commit] xtables-addons: new package
Message-ID: <20150110175417.3AE8C80170@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=490917387a0ff6969f8130be38993eed5f06f73e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The geoip "helpers" are basically scripts that download and reformat
the geoip database in a form usable by xt_geoip.

The netfilter (kernel & userland) sides of it are built and installed.
Since there are many considerations to geoip databases (free,
commercial and variants for each) it's left to the user to deal with
that if they plan to use the extension which is only one among many.

[Thomas:
 - Take into account the rename of BR2_PREFER_STATIC_LIB to
   BR2_STATIC_LIBS
 - Remove "depends on BR2_LINUX_KERNEL" as suggested by Arnout.
 - Move XTABLES_ADDONS_CONF_OPTS a bit further down, with newlines
   around it, and adjust the indentation of the first line. Just to
   make it slightly more readable.]

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                          |    1 +
 package/xtables-addons/Config.in           |   20 +++++++++++++++++
 package/xtables-addons/xtables-addons.hash |    3 ++
 package/xtables-addons/xtables-addons.mk   |   33 ++++++++++++++++++++++++++++
 4 files changed, 57 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index db02394..10e50c2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1188,6 +1188,7 @@ endif
 	source "package/wvdial/Config.in"
 	source "package/xinetd/Config.in"
 	source "package/xl2tp/Config.in"
+	source "package/xtables-addons/Config.in"
 	source "package/znc/Config.in"
 
 endmenu
diff --git a/package/xtables-addons/Config.in b/package/xtables-addons/Config.in
new file mode 100644
index 0000000..36dbd48
--- /dev/null
+++ b/package/xtables-addons/Config.in
@@ -0,0 +1,20 @@
+comment "xtables-addons needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+comment "xtables-addons needs a toolchain w/ dynamic library, largefile, threads"
+	depends on BR2_STATIC_LIBS || !BR2_LARGEFILE || \
+		!BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_XTABLES_ADDONS
+	bool "xtables-addons"
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS # extensions are .so
+	select BR2_PACKAGE_IPTABLES
+	help
+	  Xtables-addons is the successor to patch-o-matic(-ng).
+	  Likewise, it contains extensions that were not, or are not yet,
+	  accepted in the main kernel/iptables packages.
+
+	  http://xtables-addons.sourceforge.net/
diff --git a/package/xtables-addons/xtables-addons.hash b/package/xtables-addons/xtables-addons.hash
new file mode 100644
index 0000000..d742aed
--- /dev/null
+++ b/package/xtables-addons/xtables-addons.hash
@@ -0,0 +1,3 @@
+# From http://sourceforge.net/projects/xtables-addons/files/Xtables-addons/2.6/
+md5	087835ba7e564481b6fd398692268340	xtables-addons-2.6.tar.xz
+sha1	10586961a70fd4fe4f972cb3f31962c6766b359c	xtables-addons-2.6.tar.xz
diff --git a/package/xtables-addons/xtables-addons.mk b/package/xtables-addons/xtables-addons.mk
new file mode 100644
index 0000000..dcfbd5e
--- /dev/null
+++ b/package/xtables-addons/xtables-addons.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# xtables-addons
+#
+################################################################################
+
+XTABLES_ADDONS_VERSION = 2.6
+XTABLES_ADDONS_SOURCE = xtables-addons-$(XTABLES_ADDONS_VERSION).tar.xz
+XTABLES_ADDONS_SITE = http://downloads.sourceforge.net/project/xtables-addons/Xtables-addons/$(XTABLES_ADDONS_VERSION)
+XTABLES_ADDONS_DEPENDENCIES = iptables linux host-pkgconf
+XTABLES_ADDONS_LICENSE = GPLv2+
+XTABLES_ADDONS_LICENSE_FILES = LICENSE
+
+XTABLES_ADDONS_CONF_OPTS = \
+	--with-kbuild="$(LINUX_DIR)" \
+	--with-xtables="$(STAGING_DIR)/usr" \
+	--with-xtlibdir="/usr/lib/xtables"
+
+# geoip helpers need perl with modules and unzip so disable
+define XTABLES_DISABLE_GEOIP_HELPERS
+	$(SED) 's/ geoip//' $(@D)/Makefile.in
+endef
+XTABLES_ADDONS_POST_PATCH_HOOKS += XTABLES_DISABLE_GEOIP_HELPERS
+
+define XTABLES_ADDONS_BUILD_CMDS
+	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS)
+endef
+
+define XTABLES_ADDONS_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) DESTDIR="$(TARGET_DIR)" install
+endef
+
+$(eval $(autotools-package))
