From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  3 Sep 2015 00:51:58 +0200
Subject: [Buildroot] [PATCH 4/6 RFC] toolchain/external: use generic extract
	commands (!blackfin case)
In-Reply-To: <cover.1441233378.git.yann.morin.1998@free.fr>
References: <cover.1441233378.git.yann.morin.1998@free.fr>
Message-ID: <07008633b2570983b01bcb69b611802eae4eade9.1441233378.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that packages can provide a list of files to be excluded when
extracting their archive, downloaded external toolchains are no longer
special in this respect.

Still, those toolchains are currently extracted directly into their
final location, $(HOST_DIR)/opt/ext-toolchain/ which means we still
need a custom extract command.

Except, we don't really need it: we can just move the toolchain, after
it's been extracted by the generic extract command, with a post-extract
hook.

This means that:

  - we now extract the toolchain with the generic extract command,

  - the toolchain is thus extracted into $(@D) ,

  - fixup commands are run against $(@D), as a post-extract hook,
    instead of against $(HOST_DIR)/opt/ext-toolchain ,

  - once this is done, we move $(@D)/* into the final location with a
    new post-extract hook.

Note: the blackfin case is special, and will be handled in a follow-up
patch.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

---
Note: ideally, this part should be a host-generic-package, which
installs the toolchain as apart of its install commands, but that's much
more intrusive, and can be postponed for a later patchset...
---
 toolchain/toolchain-external/toolchain-external.mk | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 3cb59c6..b14e0a1 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -266,15 +266,15 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_201109),y)
 TOOLCHAIN_EXTERNAL_SITE = http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09/exports
 TOOLCHAIN_EXTERNAL_SOURCE = arago-2011.09-armv7a-linux-gnueabi-sdk.tar.bz2
 define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
-	mv $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/arago-2011.09/armv7a/* $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/
-	rm -rf $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/arago-2011.09/
+	mv $(@D)/arago-2011.09/armv7a/* $(@D)/
+	rm -rf $(@D)/arago-2011.09/
 endef
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109),y)
 TOOLCHAIN_EXTERNAL_SITE = http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09/exports
 TOOLCHAIN_EXTERNAL_SOURCE = arago-2011.09-armv5te-linux-gnueabi-sdk.tar.bz2
 define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
-	mv $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/arago-2011.09/armv5te/* $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/
-	rm -rf $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/arago-2011.09/
+	mv $(@D)/arago-2011.09/armv5te/* $(@D)/
+	rm -rf $(@D)/arago-2011.09/
 endef
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM),y)
 TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.09/components/toolchain/binaries
@@ -423,12 +423,14 @@ define TOOLCHAIN_EXTERNAL_EXTRACT_CMDS
 endef
 else ifneq ($(TOOLCHAIN_EXTERNAL_SOURCE),)
 # Normal handling of toolchain tarball extraction.
-define TOOLCHAIN_EXTERNAL_EXTRACT_CMDS
+TOOLCHAIN_EXTERNAL_EXCLUDES = usr/lib/locale/*
+define TOOLCHAIN_EXTERNAL_MOVE
 	mkdir -p $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)
-	$(call suitable-extractor,$(TOOLCHAIN_EXTERNAL_SOURCE)) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE) | \
-		$(TAR) --strip-components=1 --exclude='usr/lib/locale/*' -C $(TOOLCHAIN_EXTERNAL_INSTALL_DIR) $(TAR_OPTIONS) -
-	$(TOOLCHAIN_EXTERNAL_FIXUP_CMDS)
+	mv $(@D)/* $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/
 endef
+TOOLCHAIN_EXTERNAL_POST_EXTRACT_HOOKS += \
+	TOOLCHAIN_EXTERNAL_FIXUP_CMDS \
+	TOOLCHAIN_EXTERNAL_MOVE
 endif
 
 # Returns the location of the libc.a file for the given compiler + flags
-- 
1.9.1
