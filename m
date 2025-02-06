Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D19C0219B
	for <buildroot@archiver.kernel.org>; Thu,  6 Feb 2025 18:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8059142825;
	Thu,  6 Feb 2025 18:06:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ENaBFWN_kT5x; Thu,  6 Feb 2025 18:06:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E833D4284B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E833D4284B;
	Thu,  6 Feb 2025 18:06:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 22B23E2
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 18:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11414846AC
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 18:06:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id whR3nNR_0Lur for <buildroot@buildroot.org>;
 Thu,  6 Feb 2025 18:06:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E99B1846AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E99B1846AB
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E99B1846AB
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 18:06:32 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-38dc6d55ebaso147214f8f.1
 for <buildroot@buildroot.org>; Thu, 06 Feb 2025 10:06:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738865191; x=1739469991;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KYSUbTUGEhl6ProCQ8cp0HKyOqlD26WUR9gVkQg8Qjw=;
 b=eqTqiWn5QKFGECHP9HlESAKCvuN4Z/XFgl6DfwnADvrq0vm7gDR8lMnVg8iFBMJheb
 vwQYKYar32+Dnq0kBzPIWO3t0FjYyITsfa+o97y8R15OEDrShpCf6AzDRagEuDL68y2z
 ZmyZkuMUypF80z677ZJs7WuefUrn9PhxzaufQDW97I4gB430RyPeYZGThlRx2Pb5SInf
 G57k17lj1rOo6WvajM4WbK4nDXm/4vxpvgk3Nx/UstZWd7XpcLpmZJIKxVyXonzO0ZFi
 Vn+3YcyxNDF/DkkHtoaRStuJCBv4PRndzHDVcu/I7MMHT8qZtFNBtYt/LJm043SSza/0
 SRow==
X-Gm-Message-State: AOJu0YzGysS+QtK5eZR6S3vD3D1FuNcVtu1BRLM9o3nnJ+ayTdoJKSRq
 AXLqoUsCX9fJGrBvMJAcmPx9QlY0af9VB7tcB67Q0chLCeyAu3zGagENOwdYC2leHmflrZUYBeM
 +3z8=
X-Gm-Gg: ASbGncstvrQVGZ0tjOD3tOSkuwjpFTEObOL3ks7dY4RU5Rd6rQtkGrjCiidOYI2zCDx
 2kJj1QBxMHvrBPxMwzAXohoAjyBuSuLUU1iBzaTC84uYxc3onjaqPF44+zwYHox6ODF/3iwAS/4
 9QL47Sv4I/lmlHmpw1ePfDFbA6vw9fwCH2VqNalHMjVqAPq+BRD8zQILMaIdlDQlK6sYzFtBXY+
 JQvx4pL3tY9R43K9C8+U5gCw/c7I8Sm1t0mrNjTbv+l+zTGHKPcabdMl5AogtPY9eZruktL0Bd8
 0rYaA2vscQHZxompfFEj+cxo9KGcLWk=
X-Google-Smtp-Source: AGHT+IFHQ5LSboJYDcD7qhZyn+t2aGbrfF836tXFeyrOvZaT1P19Bd+k5HSBrhmvY5xS/SI1jqLCQQ==
X-Received: by 2002:a05:6000:188b:b0:38d:b7dc:30b8 with SMTP id
 ffacd0b85a97d-38dbb2cf5b8mr3780253f8f.18.1738865190602; 
 Thu, 06 Feb 2025 10:06:30 -0800 (PST)
Received: from localhost.localdomain ([79.132.233.153])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dbde1dfaesm2342370f8f.90.2025.02.06.10.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 10:06:30 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu,  6 Feb 2025 19:06:13 +0100
Message-ID: <20250206180614.984105-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250206180614.984105-1-thomas.perale@mind.be>
References: <20250206180614.984105-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738865191; x=1739469991; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KYSUbTUGEhl6ProCQ8cp0HKyOqlD26WUR9gVkQg8Qjw=;
 b=K4ojRgJVijoFi2es0hMJe2qY2usdSLNSihVCR6HI8+lAZ7eJ8RBloZe6uFfuB+snjR
 znCvUObFxAG5AEulmdnzsU4fR7lTHKMIPJzTbziV3j4rqnct+EqzvaXoMrA451nlZX5D
 QoYBUcLbKBxNx9N/2aIDxCl/cDIWY69kGJXNYC3r5lhStG3Ef447p4/FxH6jYvo0gNXF
 VHeah20RVVhqcufO7jbetB8oxUOnJ40KxwjpoAzkh0RQO13ZX40n0QzXFnWrSKaIt8Lo
 snh298FN+QTH5ih5tVhIimKRIrdSC3I8dU9SDwNJGSbNkOjeo+NMgM/cvCT2OTTpcD7T
 mykw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=K4ojRgJV
Subject: [Buildroot] [v3, RFC,
 PATCH 1/2] package/pkg-utils.mk: add patches to show-info json
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Matthias Swiggers <matthias.swiggers@mind.be>,
 Thomas Perale <thomas.perale@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit adds support for listing the patches path or url applied to a
package when calling `show-info`.

To avoid making `show-info` dependant on having to download and patch the
packages there is a known limitation with the patch listing of `show-info`:

  * If a package apply patches in the pre/post hook, they won't be listed
    (for instance: `android-tool`, `libmad`, `gcc-initial`, `gcc-final`,
    `linux-header`, ...)
  * Patches defined in the `<pkg-name>_PATCH` variable will be listed as
    an URL instead of listing the content with a path.

To list the patches this commit introduces the `pkg-patches-dirs` function
that list the directories that are subject to contain patches.
This function is used to replace the similar procedure that happened in
the `.stamp_patched` step as well as `<pkg>_HASH_FILES` variable.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Co-authored-by: Matthias Swiggers <matthias.swiggers@mind.be>
---
 package/pkg-generic.mk | 25 +++----------------------
 package/pkg-utils.mk   | 17 +++++++++++++++++
 2 files changed, 20 insertions(+), 22 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 8fb6f97be8..2a8dc639d5 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -231,27 +231,15 @@ $(BUILD_DIR)/%/.stamp_rsynced:
 	$(Q)touch $@
 
 # Patch
-#
-# The RAWNAME variable is the lowercased package name, which allows to
-# find the package directory (typically package/<pkgname>) and the
-# prefix of the patches
-#
-# For BR2_GLOBAL_PATCH_DIR, only generate if it is defined
-$(BUILD_DIR)/%/.stamp_patched: PATCH_BASE_DIRS =  $(PKGDIR)
-$(BUILD_DIR)/%/.stamp_patched: PATCH_BASE_DIRS += $(addsuffix /$(RAWNAME),$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)))
 $(BUILD_DIR)/%/.stamp_patched:
 	@$(call step_start,patch)
 	@$(call MESSAGE,"Patching")
 	$(foreach hook,$($(PKG)_PRE_PATCH_HOOKS),$(call $(hook))$(sep))
 	$(foreach p,$($(PKG)_PATCH),$(APPLY_PATCHES) $(@D) $($(PKG)_DL_DIR) $(notdir $(p))$(sep))
 	$(Q)( \
-	for D in $(PATCH_BASE_DIRS); do \
+	for D in $(call pkg-patches-dirs,$(PKG)); do \
 	  if test -d $${D}; then \
-	    if test -d $${D}/$($(PKG)_VERSION); then \
-	      $(APPLY_PATCHES) $(@D) $${D}/$($(PKG)_VERSION) \*.patch || exit 1; \
-	    else \
-	      $(APPLY_PATCHES) $(@D) $${D} \*.patch || exit 1; \
-	    fi; \
+	    $(APPLY_PATCHES) $(@D) $${D} \*.patch || exit 1; \
 	  fi; \
 	done; \
 	)
@@ -516,14 +504,7 @@ endif
 $(2)_VERSION := $$(call sanitize,$$($(2)_DL_VERSION))
 
 $(2)_HASH_FILES = \
-	$$(strip \
-		$$(foreach d, $$($(2)_PKGDIR) $$(addsuffix /$$($(2)_RAWNAME), $$(call qstrip,$$(BR2_GLOBAL_PATCH_DIR))),\
-			$$(if $$(wildcard $$(d)/$$($(2)_VERSION)/$$($(2)_RAWNAME).hash),\
-				$$(d)/$$($(2)_VERSION)/$$($(2)_RAWNAME).hash,\
-				$$(d)/$$($(2)_RAWNAME).hash\
-			)\
-		)\
-	)
+	$$(strip $$(foreach d,$$(call pkg-patches-dirs,$(2)),$$(wildcard $$(d)/$$($(2)_RAWNAME).hash)))
 
 ifdef $(3)_OVERRIDE_SRCDIR
   $(2)_OVERRIDE_SRCDIR ?= $$($(3)_OVERRIDE_SRCDIR)
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index a0dbeac18e..5c84e364db 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -156,6 +156,16 @@ define _json-info-pkg
 	)
 endef
 
+pkg-patches-dirs = $($(1)_PKGDIR) $($(1)_PKGDIR)/$($(1)_VERSION)\
+	$(addsuffix /$($(1)_RAWNAME),$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)))\
+	$(addsuffix /$($(1)_RAWNAME)/$($(1)_VERSION),$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)))
+
+pkg-patches-url = $(foreach patch,$($(1)_PATCH),\
+	$(if $(findstring ://,$(patch)),$(patch),\
+		$($(1)_SITE_METHOD)+$($(1)_SITE)/$(patch)))
+
+pkg-patches-list = $(foreach patchdir,$(call pkg-patches-dirs,$(1)),$(wildcard $(addsuffix /*.patch,$(patchdir)))) $(call pkg-patches-url,$(1))
+
 define _json-info-pkg-details
 	"version": $(call mk-json-str,$($(1)_DL_VERSION)),
 	"licenses": $(call mk-json-str,$($(1)_LICENSE)),
@@ -178,6 +188,13 @@ define _json-info-pkg-details
 		},
 	)
 	],
+	"patches": [
+		$(foreach patch, \
+			$(call pkg-patches-list,$(1)), \
+			$(call mk-json-str,$(patsubst $(CONFIG_DIR)/%,%,$(patch)))$(comma) \
+
+		)
+	],
 endef
 
 define _json-info-fs
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
