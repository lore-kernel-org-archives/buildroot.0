Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FD4C35FFB
	for <buildroot@archiver.kernel.org>; Wed, 19 Mar 2025 04:40:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0171580E38;
	Wed, 19 Mar 2025 04:40:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kunG2jay-lhK; Wed, 19 Mar 2025 04:40:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF6A9820D3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF6A9820D3;
	Wed, 19 Mar 2025 04:40:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A9F47CD
 for <buildroot@buildroot.org>; Wed, 19 Mar 2025 04:39:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97B81820D3
 for <buildroot@buildroot.org>; Wed, 19 Mar 2025 04:39:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sVb4Q7OZFwl5 for <buildroot@buildroot.org>;
 Wed, 19 Mar 2025 04:39:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::82e; helo=mail-qt1-x82e.google.com;
 envelope-from=git@jdknight.me; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DB23080E38
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB23080E38
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DB23080E38
 for <buildroot@buildroot.org>; Wed, 19 Mar 2025 04:39:56 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id
 d75a77b69052e-4766cb762b6so3415381cf.0
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 21:39:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742359194; x=1742963994;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6Kjhd3wzZuvrD5kL2e7+BIkv0ENofCFt85VtJv/hhuE=;
 b=ePsMk1TD34APUsQzWKr1IJ5+TsRAq9jPnlZbH0unOGIKG+u5TOUPvXPdoY2Sov+7hn
 0KpZZUYhwYMyx5Ry/lrLK8I2iIn5GrZQqhptiDZgQfbjyJ/NZOawDw0y7eCOt6XGO7kq
 ogXjPvhiFMLJyjubGAeQTsfPnuhJKWJs476sFXH1PHDJHTk+e5gTZncyECA0yQvNpwI+
 /O48hnlbJteK9+Yn3ngAetxoR/iuUcHruTJb0qgEW3WXHCh31fWYE2dOPMjXMIGD1C84
 w7wBGEI8GY0o5auvx1O/WLilySoca5gDPlRnmFa528kPUpVZkFj8ypNepJZwIfZYtOKq
 3xfA==
X-Gm-Message-State: AOJu0YzEu9WmGGALJXKbY1+asaaHEipFFPtCLUVN6G/NPr3Q1a9Geo1d
 JFC0+SubJOuDH6UqMQq84b7nGLZU/YDXpzSgbiwabIxggrmtgFgRd1gzTNv1uE15s98N7RAMixd
 uNzY=
X-Gm-Gg: ASbGnctiGR+DmiQIj0GKQABWeziygWjUoJ5bNpAtXGCHZcU6BQWaugmvWmdR2xPDaOW
 5PaVbyp0hRyKefdaupz1l+SLc9D9kEiZqG2KMob33dpj+QAbUykPcOVygKzvq4lVb/5EhhalQHt
 T0VaCwSVZGA9jjU3DY/Ktnuv4txGSWim8HFfnvz/L+iB/vQVCGQ9tps8/3XygzAAo38xEUqYjPD
 PLBo5gVdrQTVXlcXm7NnHrrq7bcFwyy1Y+qx1GZHswFgGG+jc5fUNCMTperEqzTgLEAs+AcGfgq
 iG4JDBhQHMk/5WTpzSCz6iqlXX1x1gEWZLgK4o1P6Jk5Opv9mviZDS4UKc/QuhjGY1umn1wz+mr
 GZBFTUKnt3ROHfNebdwXRszfBxP0Jc2OW5axJDCjwi+ysOYhNAyhB
X-Google-Smtp-Source: AGHT+IG9xL85F4mqqxH+T/epU44GDmMZb1Vj4STsjdGO9TpOv+VXmHDxfhfrUz4ErfijKs4MCOddQw==
X-Received: by 2002:a05:622a:1b25:b0:471:b544:e6fc with SMTP id
 d75a77b69052e-47708a7d80fmr20447511cf.26.1742359194517; 
 Tue, 18 Mar 2025 21:39:54 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-jkvlon0513w-grc-40-174-95-139-126.dsl.bell.ca. [174.95.139.126])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-476bb611c83sm75779201cf.2.2025.03.18.21.39.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 21:39:54 -0700 (PDT)
From: James Knight <git@jdknight.me>
To: buildroot@buildroot.org
Cc: James Knight <git@jdknight.me>
Date: Wed, 19 Mar 2025 00:39:35 -0400
Message-ID: <20250319043935.7756-1-git@jdknight.me>
X-Mailer: git-send-email 2.48.1.windows.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jdknight-me.20230601.gappssmtp.com; s=20230601; t=1742359194; x=1742963994;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6Kjhd3wzZuvrD5kL2e7+BIkv0ENofCFt85VtJv/hhuE=;
 b=RsTp+O9F3QvAGsiMXIIxY0pGOl36vtK1UduOgNDWvHIWvlm9+99BZBuDHGH6nMGk5d
 HE+NuifaXKH4OtpKpJpUURQj4vVFGFnH9lS+UeBb6jRmlKQ73B1KVfwE279mrhNE2bnn
 ftyvgZ+KlkKfmclClqUhW52rlAzpCtR6nyZgqliw+TT1H4CisztMERzXzgyKkbL5Hw7u
 ycHf7qChEPb8a1+fNPjYuaRWHeiIk8ByOsF7AszIFA02ioJ3ZdqCJfpoAQaOH6upEoM3
 dtJnRKqXFSGzRaeUIGd11sfg3dslGDLvlY1PKw7E1bJCyTGu8Ces4D3BKK033B9rYwe/
 eVoA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=jdknight.me
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=jdknight-me.20230601.gappssmtp.com
 header.i=@jdknight-me.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=RsTp+O9F
Subject: [Buildroot] [PATCH 1/1] package: add support for <pkg>_SITE_ONLY
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This will allow individual packages to hint that sources for the package
should only ever be downloaded from the specified `<pkg>_SITE` location.
Can be useful to avoid hitting configured cache sites when it is known
that a package would only ever be available from the package's site.

Signed-off-by: James Knight <git@jdknight.me>
---
 docs/manual/adding-packages-generic.adoc |  6 ++++++
 package/pkg-download.mk                  | 17 ++++++++++++++---
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/docs/manual/adding-packages-generic.adoc b/docs/manual/adding-packages-generic.adoc
index f0b0508f537d4a0329b48e2f8696ca43b098f1f2..35bd05e790520b92462e7acfb47472d44f5de792 100644
--- a/docs/manual/adding-packages-generic.adoc
+++ b/docs/manual/adding-packages-generic.adoc
@@ -336,6 +336,12 @@ not and can not work as people would expect it should:
      still patch the source code, use +LIBFOO_POST_RSYNC_HOOKS+, see
      xref:hooks-rsync[].
 
+* +LIBFOO_SITE_ONLY+ can be set to +YES+ to indicate that the package
+  should only be attempted to be downloaded from the configured site
+  defined by +LIBFOO_SITE+. Useful to avoid hitting configured cache
+  sites when it is known that the package would only ever be available
+  from the package's site.
+
 * +LIBFOO_GIT_SUBMODULES+ can be set to +YES+ to create an archive
   with the git submodules in the repository.  This is only available
   for packages downloaded with git (i.e. when
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index cf5959ea95549c896fd0837faf43f8e09f88b167..9b8ed92e9d3fb036aae6b84825cd2410337bf34d 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -59,6 +59,15 @@ gitlab = https://gitlab.com/$(1)/$(2)/-/archive/$(3)
 # Expressly do not check hashes for those files
 BR_NO_CHECK_HASH_FOR =
 
+################################################################################
+# DOWNLOAD_DEFAULT_URI - Default download site to get a package from.
+#
+# Argument 1 is the source location
+#
+################################################################################
+
+DOWNLOAD_DEFAULT_URI = $(patsubst %/,%,$(dir $(call qstrip,$(1))))
+
 ################################################################################
 # DOWNLOAD_URIS - List the candidates URIs where to get the package from:
 # 1) BR2_PRIMARY_SITE if enabled
@@ -77,8 +86,7 @@ DOWNLOAD_URIS += \
 endif
 
 ifeq ($(BR2_PRIMARY_SITE_ONLY),)
-DOWNLOAD_URIS += \
-	$(patsubst %/,%,$(dir $(call qstrip,$(1))))
+DOWNLOAD_URIS += $(DOWNLOAD_DEFAULT_URI)
 ifneq ($(call qstrip,$(BR2_BACKUP_SITE)),)
 DOWNLOAD_URIS += \
 	$(call getschemeplusuri,$(call qstrip,$(BR2_BACKUP_SITE)/$($(2)_DL_SUBDIR)),urlencode) \
@@ -129,7 +137,10 @@ define DOWNLOAD
 		$(if $(filter YES,$($(PKG)_SVN_EXTERNALS)),-r) \
 		$(if $($(PKG)_GIT_SUBMODULES),-r) \
 		$(if $($(PKG)_GIT_LFS),-l) \
-		$(foreach uri,$(call DOWNLOAD_URIS,$(1),$(PKG)),-u $(uri)) \
+		$(if $($(PKG)_SITE_ONLY), \
+			$(DOWNLOAD_DEFAULT_URI), \
+			$(foreach uri,$(call DOWNLOAD_URIS,$(1),$(PKG)),-u $(uri)) \
+		) \
 		$(2) \
 		$(QUIET) \
 		-- \
-- 
2.48.1.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
