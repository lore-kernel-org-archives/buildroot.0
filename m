From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 Jan 2019 23:05:24 +0100
Subject: [Buildroot] [PATCH 02/19] infra/pkg-generic: create $(@D) before
 running PRE_HOOKS
In-Reply-To: <cover.1546898693.git.yann.morin.1998@free.fr>
References: <cover.1546898693.git.yann.morin.1998@free.fr>
Message-ID: <bc9beba1e5a9552273015d7f29f55a4aa249f73f.1546898693.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-generic.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 7602765139..6581ffa5e8 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -140,18 +140,18 @@ $(BUILD_DIR)/%/.stamp_downloaded:
 			break ; \
 		fi ; \
 	done
+	$(Q)mkdir -p $(@D)
 	$(foreach hook,$($(PKG)_PRE_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
 	$(foreach p,$($(PKG)_ALL_DOWNLOADS),$(call DOWNLOAD,$(p))$(sep))
 	$(foreach hook,$($(PKG)_POST_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
-	$(Q)mkdir -p $(@D)
 	@$(call step_end,download)
 	$(Q)touch $@
 
 # Retrieve actual source archive, e.g. for prebuilt external toolchains
 $(BUILD_DIR)/%/.stamp_actual_downloaded:
 	@$(call step_start,actual-download)
+	$(Q)mkdir -p $(@D)
 	$(call DOWNLOAD,$($(PKG)_ACTUAL_SOURCE_SITE)/$($(PKG)_ACTUAL_SOURCE_TARBALL))
-	$(Q)mkdir -p $(@D)
 	@$(call step_end,actual-download)
 	$(Q)touch $@
 
@@ -159,8 +159,8 @@ $(BUILD_DIR)/%/.stamp_actual_downloaded:
 $(BUILD_DIR)/%/.stamp_extracted:
 	@$(call step_start,extract)
 	@$(call MESSAGE,"Extracting")
+	$(Q)mkdir -p $(@D)
 	$(foreach hook,$($(PKG)_PRE_EXTRACT_HOOKS),$(call $(hook))$(sep))
-	$(Q)mkdir -p $(@D)
 	$($(PKG)_EXTRACT_CMDS)
 # some packages have messed up permissions inside
 	$(Q)chmod -R +rw $(@D)
-- 
2.14.1
