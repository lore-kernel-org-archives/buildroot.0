Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458C9C25B74
	for <buildroot@archiver.kernel.org>; Sun,  2 Jun 2024 20:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3325D8214F;
	Sun,  2 Jun 2024 20:40:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mXdaLA1D-y6Z; Sun,  2 Jun 2024 20:40:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86B97833B7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86B97833B7;
	Sun,  2 Jun 2024 20:40:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A2A0A1BF315
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 20:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CB48606EA
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 20:39:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7CVcSv5hvdze for <buildroot@lists.busybox.net>;
 Sun,  2 Jun 2024 20:39:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3EF1B606A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EF1B606A9
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3EF1B606A9
 for <buildroot@buildroot.org>; Sun,  2 Jun 2024 20:39:55 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-42121d28664so32145865e9.2
 for <buildroot@buildroot.org>; Sun, 02 Jun 2024 13:39:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717360793; x=1717965593;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ygqlV03LS7SvQF9mGzb3ag3aO5/7LAN70V0o45Y2XLg=;
 b=COOCsE0j1DqQotQ1MGBPIPzRApHjyxEY2I44uk1eK7Pt6CnoPZ7/3KBUANlwH2SC8T
 f1pQUEyr4F/ODNYYp8xvKhXXJZtag6yYEhGbcElNSlEsZOSPnSUfd5mij6k7VAHxMhh3
 mSnKbpJbqtrKh6II3dauEyCGGq/ZDiiKl1X/oxKVOT3hJjbgz7wZHNyLfQ7YewArY2yk
 qC+In9skI5IzPhXFCmojUU33q2Tg5NLhNLZ3UK0RtOuGUlLRD7bkWQkLyv9vmRMoyjJC
 KVZ6c41Lc8JmAsx/WZgrld73v5LjbDzeADG1EG7cSy2OlCR9wzsXJxm9NQZBpqPzQFON
 +5/A==
X-Gm-Message-State: AOJu0YziHcCykQcFig/U1nPXzcYls7lbCwd6Bsaegg3HHdQpifun4IGy
 fqX8gJdvi/ENq+MzzAYbZyUYhGCzwSxGLyfHsOaaP3izze3KrPJFsUM3rQ==
X-Google-Smtp-Source: AGHT+IEPKyVe3p9RnFgLsVDt7Ubvhq9iBI5GZSdt/5XOuE17xJp11hyTfsAHx134yM+CFvQ2YO8aPw==
X-Received: by 2002:a05:600c:450a:b0:421:2760:159e with SMTP id
 5b1f17b1804b1-4212e0c0fa5mr60335225e9.34.1717360793224; 
 Sun, 02 Jun 2024 13:39:53 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35e0f97ba3csm6460862f8f.73.2024.06.02.13.39.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 13:39:52 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun,  2 Jun 2024 22:39:37 +0200
Message-ID: <b9777d181b916a854ca57a9d00222855c01ee299.1717360788.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717360788.git.yann.morin.1998@free.fr>
References: <cover.1717360788.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717360793; x=1717965593; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ygqlV03LS7SvQF9mGzb3ag3aO5/7LAN70V0o45Y2XLg=;
 b=eBzH047u0Qz3reeqygajMZm25QaTjfbgCjWonFibf0U1XfLPwUybUURS0bDswWIbz/
 U5dQ4H2CO9UNuovF445YtA32JV2ozAn6qgu2TsUZLP0xpEIO4ZBN21fFF1z4S4Yg1240
 73qaKl+7GnqRVMF7in/7an6BvH/PLR4hzJjeOg5Wt0kajsA6LusQPes1KGj/My1dhLQl
 ctEFvcgW/s+/ecW9fkDr7xD98GMQ1nP9a9RnbOCkGPPdYUEam/cxoraY/fjPWyAO3ZuH
 p0DIak/+O2NU+3dSqx+K3fBeJolETen35e4ymszikeZSLCA8FzLvXgEF5WexxmNVLbjH
 dczA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eBzH047u
Subject: [Buildroot] [PATCH 01/16] package/pkg-download: symplify calling
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
index bec213fb71..0c6ec6771a 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -102,30 +102,29 @@ endif
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
-	$(Q)$(EXTRA_ENV) $($(2)_DL_ENV) \
+	$(Q)mkdir -p $($(PKG)_DL_DIR)
+	$(Q)$(EXTRA_ENV) $($(PKG)_DL_ENV) \
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
