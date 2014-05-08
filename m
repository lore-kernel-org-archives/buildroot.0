From: Romain Naour <romain.naour@openwide.fr>
Date: Fri,  9 May 2014 01:05:12 +0200
Subject: [Buildroot] [PATCH 1/2] openpowerlink: use git repository instead
	of zip archive.
Message-ID: <1399590313-30617-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit 6c5c08b854e4490697076ae3c5a9c587d8672c63,
openpowerlink package is rebuilt at every make call because
.stamp_downloaded is missing in the build directory.

The culprit is OPENPOWERLINK_EXTRACT_CMDS that remove and
replace the build directory.

unzip extract a directory "openPOWERLINK-V1.08.4" and
Buildroot expect a directory "openpowerlink-V1.08.4"

It is easier to use git repository instead of zip archive and
avoids rename the directory openPOWERLINK to openpowerlink.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/openpowerlink/openpowerlink.mk | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/package/openpowerlink/openpowerlink.mk b/package/openpowerlink/openpowerlink.mk
index 37a06e5..0aae544 100644
--- a/package/openpowerlink/openpowerlink.mk
+++ b/package/openpowerlink/openpowerlink.mk
@@ -5,9 +5,8 @@
 ################################################################################
 
 OPENPOWERLINK_VERSION = V1.08.4
-OPENPOWERLINK_SOURCE = openPOWERLINK-$(OPENPOWERLINK_VERSION).zip
-OPENPOWERLINK_SITE = http://downloads.sourceforge.net/project/openpowerlink/openPOWERLINK/V1.8.4
-
+OPENPOWERLINK_SITE = http://git.code.sf.net/p/openpowerlink/code
+OPENPOWERLINK_SITE_METHOD = git
 OPENPOWERLINK_LICENSE = BSD-2c, GPLv2
 OPENPOWERLINK_LICENSE_FILES = license.txt
 OPENPOWERLINK_INSTALL_STAGING = YES
@@ -89,11 +88,4 @@ else
 OPENPOWERLINK_CONF_OPT += -DCFG_X86_DEMO_LINUX_KERNEL=OFF
 endif
 
-define OPENPOWERLINK_EXTRACT_CMDS
-	$(RM) -rf $(OPENPOWERLINK_DIR)
-	unzip -q -d $(BUILD_DIR)/ $(DL_DIR)/$(OPENPOWERLINK_SOURCE)
-	test -d $(OPENPOWERLINK_DIR) || \
-		mv $(BUILD_DIR)/$(subst .zip,,$(OPENPOWERLINK_SOURCE)) $(OPENPOWERLINK_DIR)
-endef
-
 $(eval $(cmake-package))
-- 
1.9.0
