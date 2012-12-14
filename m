From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@openwide.fr>
Date: Fri, 14 Dec 2012 15:24:09 +0100
Subject: [Buildroot] [PATCH] oprofile: bump to version 0.9.8
Message-ID: <1355495049-14689-1-git-send-email-jeremy.rosen@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
---
 package/oprofile/oprofile.mk |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
index 75f8407..f3ea23f 100644
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -4,13 +4,14 @@
 #
 #############################################################
 
-OPROFILE_VERSION = 0.9.7
+OPROFILE_VERSION = 0.9.8
 OPROFILE_SITE = http://downloads.sourceforge.net/project/oprofile/oprofile/oprofile-$(OPROFILE_VERSION)
 OPROFILE_LICENSE = GPLv2+
 OPROFILE_LICENSE_FILES = COPYING
 OPROFILE_CONF_OPT = --localstatedir=/var --with-kernel-support
 OPROFILE_BINARIES = utils/ophelp pp/opannotate pp/oparchive pp/opgprof
 OPROFILE_BINARIES += pp/opreport opjitconv/opjitconv daemon/oprofiled
+OPROFILE_BINARIES += utils/op-check-perfevents pe_profiling/operf libabi/opimport
 
 ifeq ($(BR2_i386),y)
 OPROFILE_ARCH = i386
@@ -33,6 +34,7 @@ OPROFILE_DEPENDENCIES = popt binutils
 define OPROFILE_INSTALL_TARGET_CMDS
 	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/bin
 	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/share/oprofile
+	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/lib/oprofile
 	if [ -d $(@D)/events/$(OPROFILE_ARCH) ]; then \
 		cp -dpfr $(@D)/events/$(OPROFILE_ARCH) \
 			$(TARGET_DIR)/usr/share/oprofile; \
@@ -40,12 +42,14 @@ define OPROFILE_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 644 $(@D)/libregex/stl.pat $(TARGET_DIR)/usr/share/oprofile
 	$(INSTALL) -m 755 $(@D)/utils/opcontrol $(TARGET_DIR)/usr/bin
 	$(INSTALL) -m 755 $(addprefix $(@D)/, $(OPROFILE_BINARIES)) $(TARGET_DIR)/usr/bin
+	$(INSTALL) -m 755 $(@D)/libopagent/.libs/*.so* $(TARGET_DIR)/usr/lib/oprofile
 endef
 
 define OPROFILE_UNINSTALL_TARGET_CMDS
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/, $(notdir $(OPROFILE_BINARIES)))
 	rm -f $(TARGET_DIR)/usr/bin/opcontrol
 	rm -rf $(TARGET_DIR)/usr/share/oprofile
+	rm -rf $(TARGET_DIR)/usr/lib/oprofile
 endef
 
 $(eval $(autotools-package))
-- 
1.7.10.4
