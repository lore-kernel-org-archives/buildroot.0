From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 Oct 2015 14:48:56 +0200
Subject: [Buildroot] [PATCH 4/9 v2] toolchain/external: use generic extract
	commands (!blackfin case)
In-Reply-To: <cover.1445690712.git.yann.morin.1998@free.fr>
References: <cover.1445690712.git.yann.morin.1998@free.fr>
Message-ID: <4dfbf001b46ffeddf9c4fb300967473a3860b200.1445690712.git.yann.morin.1998@free.fr>
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
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
---
 toolchain/toolchain-external/toolchain-external.mk | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 704ce2b..6de3690 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -300,16 +300,16 @@ TOOLCHAIN_EXTERNAL_SITE = http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arag
 TOOLCHAIN_EXTERNAL_SOURCE = arago-2011.09-armv7a-linux-gnueabi-sdk.tar.bz2
 TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL = arago-toolchain-2011.09-sources.tar.bz2
 define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
-	mv $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/arago-2011.09/armv7a/* $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/
-	rm -rf $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/arago-2011.09/
+	mv $(@D)/arago-2011.09/armv7a/* $(@D)/
+	rm -rf $(@D)/arago-2011.09/
 endef
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109),y)
 TOOLCHAIN_EXTERNAL_SITE = http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09/exports
 TOOLCHAIN_EXTERNAL_SOURCE = arago-2011.09-armv5te-linux-gnueabi-sdk.tar.bz2
 TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL = arago-toolchain-2011.09-sources.tar.bz2
 define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
-	mv $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/arago-2011.09/armv5te/* $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/
-	rm -rf $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/arago-2011.09/
+	mv $(@D)/arago-2011.09/armv5te/* $(@D)/
+	rm -rf $(@D)/arago-2011.09/
 endef
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM),y)
 TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.09/components/toolchain/binaries
@@ -459,12 +459,14 @@ define TOOLCHAIN_EXTERNAL_EXTRACT_CMDS
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
