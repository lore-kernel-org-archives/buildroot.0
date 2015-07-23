From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 24 Jul 2015 01:10:06 +0200
Subject: [Buildroot] [PATCH v3 1/2] Add TOOLCHAIN_EXTERNAL_STRIP_COMPONENTS
Message-ID: <1437693007-13320-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

...for toolchains with non-standard tarballs.

Following the same logic as <PKG>_STRIP_COMPONENTS (commit 73b9a5e), we
also allow the posibility to specify a --strip-components level for
external toolchains by setting the TOOLCHAIN_EXTERNAL_STRIP_COMPONENTS
variable.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 toolchain/toolchain-external/toolchain-external.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 5ce4d33..2254248 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -408,6 +408,10 @@ TOOLCHAIN_EXTERNAL_ADD_TOOLCHAIN_DEPENDENCY = NO
 
 TOOLCHAIN_EXTERNAL_INSTALL_STAGING = YES
 
+ifeq ($(TOOLCHAIN_EXTERNAL_STRIP_COMPONENTS),)
+TOOLCHAIN_EXTERNAL_STRIP_COMPONENTS = 1
+endif
+
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1),y)
 # Special handling for Blackfin toolchain, because of the split in two
 # tarballs, and the organization of tarball contents. The tarballs
@@ -426,7 +430,7 @@ else ifneq ($(TOOLCHAIN_EXTERNAL_SOURCE),)
 define TOOLCHAIN_EXTERNAL_EXTRACT_CMDS
 	mkdir -p $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)
 	$(call suitable-extractor,$(TOOLCHAIN_EXTERNAL_SOURCE)) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE) | \
-		$(TAR) --strip-components=1 --exclude='usr/lib/locale/*' -C $(TOOLCHAIN_EXTERNAL_INSTALL_DIR) $(TAR_OPTIONS) -
+		$(TAR) --strip-components=$(TOOLCHAIN_EXTERNAL_STRIP_COMPONENTS) --exclude='usr/lib/locale/*' -C $(TOOLCHAIN_EXTERNAL_INSTALL_DIR) $(TAR_OPTIONS) -
 	$(TOOLCHAIN_EXTERNAL_FIXUP_CMDS)
 endef
 endif
-- 
2.3.6
