Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1032DC27C53
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 17:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D369D42813;
	Fri,  7 Jun 2024 17:06:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d1fpJQwndurp; Fri,  7 Jun 2024 17:06:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 961BF42815
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 961BF42815;
	Fri,  7 Jun 2024 17:06:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 01EF11BF479
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 17:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D706A403FB
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 17:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V8rtljZNtrz9 for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 17:06:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EFE8040272
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFE8040272
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EFE8040272
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 17:06:04 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-35dceef429bso1318622f8f.1
 for <buildroot@buildroot.org>; Fri, 07 Jun 2024 10:06:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717779962; x=1718384762;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZpDXqCdd+h+Xpe4/uzs2mLFBfi8Oq6PCQxrusB237f0=;
 b=b1gMDa6ELoaZ/mFSjZJtu7v6cwNELXhlryJHQjfq/e8oW6MGM/zm13XXU16e2YfXqE
 b0C0gIpitZwc0R6jajUAtKch2A28OjjApiuuoiNPf5dnKBPyQXTCb5aVd+0JFx1bA8x6
 VzspP/22HCAE8MUpnHpydNI3Vn6NQvYu2MIWjw1A91Kc9j8xHBKH2fipcdNzv/k+ZCC1
 QGQ6oyOvU57obO6E4ZD7Upc3lampEqkKdpMz+gkm1nd/cE9a1D6zr/0uq6D1U5Set4Iw
 RWTDoGK5rdiIkjK9xPM+I6rrVWDQQRki3UYlaIp0PYkdLb2Mv//oyAKezVwCII6zTiQP
 njyg==
X-Gm-Message-State: AOJu0YzaUmBtiIv1U7kIVA+Dm6efZwfQQcACHa8T57bdIOsQ6hcxrFKH
 z5scAwetmaFm2+gPNOe9awGyHdsu3j/MEtrxBTlOpFhtIO4Azc5zI7p9vw==
X-Google-Smtp-Source: AGHT+IHorApc8e2YhLxwuvCM8XcdKVhWgjDVKl6rk6xkItxxZY7jFAi/3OadFZik/YPzkjColKZCKA==
X-Received: by 2002:a5d:4dce:0:b0:35f:9ab:d06c with SMTP id
 ffacd0b85a97d-35f09abd1c7mr2027993f8f.5.1717779962318; 
 Fri, 07 Jun 2024 10:06:02 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5e989c9sm4355379f8f.73.2024.06.07.10.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 10:06:02 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri,  7 Jun 2024 19:05:42 +0200
Message-ID: <6117766a03aa81d15ba27d93bbd3ceb0db711db2.1717779951.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717779951.git.yann.morin.1998@free.fr>
References: <cover.1717779951.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717779962; x=1718384762; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZpDXqCdd+h+Xpe4/uzs2mLFBfi8Oq6PCQxrusB237f0=;
 b=KjJRBJPRtD98fU+XxYpm2FFACnmKv3vD1PdMK1vcfYrch95Q/WfCikzRDPRCO0Dqjr
 hNPZvZGiuUmM4nxZ0gzpLhK6EgvcKaJHhpUrhaIyBTHtEVnRtD747M1S1frR3dkW+6/1
 WaLEWOhDFTQAC3Jjqzr8ndKjQGw7o9peWCV+QcfRznmHNGWwqaF0WlufPQOWJk+79ItB
 lwKKhth2UZWpSMuD29uX4CHOLSWUYPaUxFdqCkH5n6ZEPn8CKBILp4Nvz1bNLut6phbs
 6F5Ez7b7FQH/E5HWQD/DAPSHbCyz9+OdmNUZWam/Kz0zOCUNlck3AVlx85GqZTUKUNLA
 7Adw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KjJRBJPR
Subject: [Buildroot] [PATCH 01/20 v2] package/pkg-download: symplify calling
 parameters
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The DOWNLOAD macro is always called in package context, so the PKG
variable is always set, and thus we do not need to pass the package
as a parameter.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-download.mk | 33 ++++++++++++++++-----------------
 package/pkg-generic.mk  |  6 +++---
 2 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 7028d3917a..669d69fb3e 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -102,32 +102,31 @@ endif
 # source from the list returned by DOWNLOAD_URIS.
 #
 # Argument 1 is the source location
-# Argument 2 is the upper-case package name
-# Argument 3 is a space-separated list of optional arguments
+# Argument 2 is a space-separated list of optional arguments
 #
 ################################################################################
 
 define DOWNLOAD
-	$(Q)mkdir -p $($(2)_DL_DIR)
+	$(Q)mkdir -p $($(PKG)_DL_DIR)
 	$(Q)$(EXTRA_ENV) \
-	$($(2)_DL_ENV) \
+	$($(PKG)_DL_ENV) \
 	TAR="$(TAR)" \
 	BR_NO_CHECK_HASH_FOR="$(if $(BR2_DOWNLOAD_FORCE_CHECK_HASHES),,$(BR_NO_CHECK_HASH_FOR))" \
-		flock $($(2)_DL_DIR)/.lock $(DL_WRAPPER) \
-		-c '$($(2)_DL_VERSION)' \
-		-d '$($(2)_DL_DIR)' \
+		flock $($(PKG)_DL_DIR)/.lock $(DL_WRAPPER) \
+		-c '$($(PKG)_DL_VERSION)' \
+		-d '$($(PKG)_DL_DIR)' \
 		-D '$(DL_DIR)' \
 		-f '$(notdir $(1))' \
-		$(foreach f,$($(2)_HASH_FILES),-H '$(f)') \
-		-n '$($(2)_DL_SUBDIR)-$($(2)_VERSION)' \
-		-N '$($(2)_RAWNAME)' \
-		-o '$($(2)_DL_DIR)/$(notdir $(1))' \
-		$(if $(filter YES,$($(2)_SVN_EXTERNALS)),-r) \
-		$(if $($(2)_GIT_SUBMODULES),-r) \
-		$(if $($(2)_GIT_LFS),-l) \
-		$(foreach uri,$(call DOWNLOAD_URIS,$(1),$(2)),-u $(uri)) \
-		$(3) \
+		$(foreach f,$($(PKG)_HASH_FILES),-H '$(f)') \
+		-n '$($(PKG)_DL_SUBDIR)-$($(PKG)_VERSION)' \
+		-N '$($(PKG)_RAWNAME)' \
+		-o '$($(PKG)_DL_DIR)/$(notdir $(1))' \
+		$(if $(filter YES,$($(PKG)_SVN_EXTERNALS)),-r) \
+		$(if $($(PKG)_GIT_SUBMODULES),-r) \
+		$(if $($(PKG)_GIT_LFS),-l) \
+		$(foreach uri,$(call DOWNLOAD_URIS,$(1),$(PKG)),-u $(uri)) \
+		$(2) \
 		$(QUIET) \
 		-- \
-		$($(2)_DL_OPTS)
+		$($(PKG)_DL_OPTS)
 endef
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index a2749320c3..da02cb2d32 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -182,8 +182,8 @@ $(BUILD_DIR)/%/.stamp_downloaded:
 			break ; \
 		fi ; \
 	done
-	$(if $($(PKG)_MAIN_DOWNLOAD),$(call DOWNLOAD,$($(PKG)_MAIN_DOWNLOAD),$(PKG),$(patsubst %,-p '%',$($(PKG)_DOWNLOAD_POST_PROCESS))))
-	$(foreach p,$($(PKG)_ADDITIONAL_DOWNLOADS),$(call DOWNLOAD,$(p),$(PKG))$(sep))
+	$(if $($(PKG)_MAIN_DOWNLOAD),$(call DOWNLOAD,$($(PKG)_MAIN_DOWNLOAD),$(patsubst %,-p '%',$($(PKG)_DOWNLOAD_POST_PROCESS))))
+	$(foreach p,$($(PKG)_ADDITIONAL_DOWNLOADS),$(call DOWNLOAD,$(p))$(sep))
 	$(foreach hook,$($(PKG)_POST_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
 	$(Q)mkdir -p $(@D)
 	@$(call step_end,download)
@@ -192,7 +192,7 @@ $(BUILD_DIR)/%/.stamp_downloaded:
 # Retrieve actual source archive, e.g. for prebuilt external toolchains
 $(BUILD_DIR)/%/.stamp_actual_downloaded:
 	@$(call step_start,actual-download)
-	$(call DOWNLOAD,$($(PKG)_ACTUAL_SOURCE_SITE)/$($(PKG)_ACTUAL_SOURCE_TARBALL),$(PKG))
+	$(call DOWNLOAD,$($(PKG)_ACTUAL_SOURCE_SITE)/$($(PKG)_ACTUAL_SOURCE_TARBALL))
 	$(Q)mkdir -p $(@D)
 	@$(call step_end,actual-download)
 	$(Q)touch $@
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
