From: Charles Duffy <charles@dyfis.net>
Date: Tue, 13 Oct 2015 23:28:38 -0500
Subject: [Buildroot] [PATCH 1/1] introduce nwipe package
Message-ID: <1444796918-22912-1-git-send-email-chaduffy@cisco.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Charles Duffy <charles@dyfis.net>

Signed-off-by: Charles Duffy <chaduffy@cisco.com>
---
 package/Config.in       |  1 +
 package/nwipe/Config.in |  9 +++++++++
 package/nwipe/nwipe.mk  | 27 +++++++++++++++++++++++++++
 3 files changed, 37 insertions(+)
 create mode 100644 package/nwipe/Config.in
 create mode 100644 package/nwipe/nwipe.mk

diff --git a/package/Config.in b/package/Config.in
index 8e3c64a..32affcc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1496,6 +1496,7 @@ endif
 	source "package/ncdu/Config.in"
 	source "package/numactl/Config.in"
 	source "package/nut/Config.in"
+	source "package/nwipe/Config.in"
 	source "package/openvmtools/Config.in"
 	source "package/polkit/Config.in"
 	source "package/powerpc-utils/Config.in"
diff --git a/package/nwipe/Config.in b/package/nwipe/Config.in
new file mode 100644
index 0000000..0cecd25
--- /dev/null
+++ b/package/nwipe/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_NWIPE
+	bool "nwipe"
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_NCURSES
+	help
+	  nwipe thoroughly overwrites block devices, forked from a component at
+	  the core of the venerable DBAN.
+	
+	  https://github.com/martijnvanbrummelen/nwipe
diff --git a/package/nwipe/nwipe.mk b/package/nwipe/nwipe.mk
new file mode 100644
index 0000000..18efb22
--- /dev/null
+++ b/package/nwipe/nwipe.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# nwipe
+#
+################################################################################
+
+NWIPE_VERSION = 0.17
+NWIPE_SITE = https://github.com/martijnvanbrummelen/nwipe
+NWIPE_SITE_METHOD = git
+NWIPE_DEPENDENCIES = ncurses parted
+NWIPE_CONF_OPTS = --bindir=/bin
+NWIPE_LICENSE = GPL
+NWIPE_LICENSE_FILES = LICENCE
+
+define NWIPE_RUN_AUTOGEN
+	cd $(@D) && { printf '%s\n' '44a' 'AC_CHECK_LIB([intl], [libintl_dgettext]) # needed by static builds of libparted' 'AC_CHECK_LIB([uuid], [uuid_generate]) # needed by static builds of libparted' '.' 'w' | edit configure.ac; }
+	cd $(@D) && PATH=$(BR_PATH) ./init.sh
+endef
+NWIPE_PRE_CONFIGURE_HOOKS += NWIPE_RUN_AUTOGEN
+
+# to fix support for MUSL
+define NWIPE_USE_OFF64T
+	cd $(@D) && find . -type f -name '*.[ch]' -exec sed -i -r -e 's/loff_t/off64_t/g' -- '{}' +
+endef
+NWIPE_PRE_CONFIGURE_HOOKS += NWIPE_USE_OFF64T
+
+$(eval $(autotools-package))
-- 
2.0.0
