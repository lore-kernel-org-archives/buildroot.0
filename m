From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 Jan 2013 22:11:37 +0100
Subject: [Buildroot] [git commit] oprofile: bump to version 0.9.8
Message-ID: <20130106211201.2ACD19A59C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c8c40f7278ac680c0be4b54d1517699b627cf48b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??r??my Rosen <jeremy.rosen@openwide.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/oprofile/oprofile.mk |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

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
