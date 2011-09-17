From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2011 22:22:56 +0200
Subject: [Buildroot] [PATCH 6/8] xenomai: add support to keep or remove skins
In-Reply-To: <cover.1316290714.git.thomas.petazzoni@free-electrons.com>
References: <cover.1316290714.git.thomas.petazzoni@free-electrons.com>
Message-ID: <84dc08856919e6431347886d30464c89cf61d692.1316290714.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xenomai/Config.in  |   37 +++++++++++++++++++++++++++++++++++++
 package/xenomai/xenomai.mk |   19 +++++++++++++++++++
 2 files changed, 56 insertions(+), 0 deletions(-)

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index 3749a60..cfeaa04 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -119,4 +119,41 @@ config BR2_PACKAGE_XENOMAI_ANALOGY
          This option allows to install the Xenomai Analogy utilities
          and libraries
 
+config BR2_PACKAGE_XENOMAI_NATIVE_SKIN
+       bool "Native skin library"
+       default y
+       help
+	 This option allows to install the Native Xenomai skin
+
+config BR2_PACKAGE_XENOMAI_POSIX_SKIN
+       bool "POSIX skin library"
+       default y
+       help
+	 This option allows to install the POSIX Xenomai skin
+
+config BR2_PACKAGE_XENOMAI_VXWORKS_SKIN
+       bool "VX-Works skin library"
+       help
+	 This option allows to install the VX-Works Xenomai skin
+
+config BR2_PACKAGE_XENOMAI_PSOS_SKIN
+       bool "PSOS skin library"
+       help
+	 This option allows to install the PSOS Xenomai skin
+
+config BR2_PACKAGE_XENOMAI_RTAI_SKIN
+       bool "RTAI skin library"
+       help
+	 This option allows to install the RTAI Xenomai skin
+
+config BR2_PACKAGE_XENOMAI_UITRON_SKIN
+       bool "uiTron skin library"
+       help
+	 This option allows to install the uiTron Xenomai skin
+
+config BR2_PACKAGE_XENOMAI_VRTX_SKIN
+       bool "VRTX skin library"
+       help
+	 This option allows to install the VRTX Xenomai skin
+
 endif
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index fff2c5d..52e0b4e 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -103,6 +103,25 @@ endef
 XENOMAI_POST_INSTALL_TARGET_HOOKS += XENOMAI_REMOVE_ANALOGY
 endif
 
+XENOMAI_REMOVE_SKIN_LIST += $(if $(BR2_PACKAGE_XENOMAI_NATIVE_SKIN),,native)
+XENOMAI_REMOVE_SKIN_LIST += $(if $(BR2_PACKAGE_XENOMAI_POSIX_SKIN),,posix)
+XENOMAI_REMOVE_SKIN_LIST += $(if $(BR2_PACKAGE_XENOMAI_VXWORKS_SKIN),,vxworks)
+XENOMAI_REMOVE_SKIN_LIST += $(if $(BR2_PACKAGE_XENOMAI_PSOS_SKIN),,psos)
+XENOMAI_REMOVE_SKIN_LIST += $(if $(BR2_PACKAGE_XENOMAI_RTAI_SKIN),,rtai)
+XENOMAI_REMOVE_SKIN_LIST += $(if $(BR2_PACKAGE_XENOMAI_UITRON_SKIN),,uitron)
+XENOMAI_REMOVE_SKIN_LIST += $(if $(BR2_PACKAGE_XENOMAI_VRTX_SKIN),,vrtx)
+
+define XENOMAI_REMOVE_SKINS
+	for i in $(XENOMAI_REMOVE_SKIN_LIST) ; do \
+		rm -f $(TARGET_DIR)/usr/xenomai/lib/lib$$i.* ; \
+		if [ $$i == "posix" ] ; then \
+			rm -f $(TARGET_DIR)/usr/xenomai/lib/posix.wrappers ; \
+		fi ; \
+	done
+endef
+
+XENOMAI_POST_INSTALL_TARGET_HOOKS += XENOMAI_REMOVE_SKINS
+
 define XENOMAI_ADD_LD_SO_CONF
 	# Add /usr/xenomai/lib in the library search path
 	grep -q "^/usr/xenomai/lib" $(TARGET_DIR)/etc/ld.so.conf || \
-- 
1.7.4.1
