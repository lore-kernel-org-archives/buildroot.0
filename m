Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8729CDB474
	for <buildroot@archiver.kernel.org>; Tue, 17 Oct 2023 21:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C271612CE;
	Tue, 17 Oct 2023 21:01:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C271612CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ARMVo3G5mWGZ; Tue, 17 Oct 2023 21:01:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F67C6141E;
	Tue, 17 Oct 2023 21:01:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F67C6141E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B90371BF982
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 21:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90F1882239
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 21:01:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90F1882239
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BH1lgYrorB1n for <buildroot@lists.busybox.net>;
 Tue, 17 Oct 2023 21:01:23 +0000 (UTC)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 84FCC8119D
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 21:01:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84FCC8119D
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-323ef9a8b59so5713794f8f.3
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 14:01:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697576481; x=1698181281;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fWtdFqESk87OmUQ+Wm958Tc0XvlDru4yejHtCG6fh7M=;
 b=RFCRk4hmPPGeO5y8SgFphzFE7JRiVf6MXif5kMJbuaHFtloWpjPZZZO/jNCbU9neHO
 SkNVZ1OdutuZZgAFogiucGP5vvsCj5mWenqUXgKK6GILjV+TmPxNgSp2ZUNzuPLPhs66
 OQD1alQhHUSEC5A393zkvLmhMOF0cB3s63X1QeewtAN8I2SVfws0quLxw7viQwICKfZB
 EFdMyFVkX9sFbxVhlB0iC4y2dNNOOJBfZ162XTnOyb8tUEWpmJE39rUQyHZfePhJcYsz
 vMfow8fZmyg0wi/ufGI2eOKkeib3xsF7govjw4HcxuUmms/2BUR3k1mrXFAPMhPNr9ju
 0/Cw==
X-Gm-Message-State: AOJu0YxLWQ3nVPlV2fzCTvMZKlJbmE7iQyiN10ibmxifA29AsQxChiEe
 X1LKaoi3TzkhHsa8XOFNbmGD4c941GA=
X-Google-Smtp-Source: AGHT+IHebA7NR2aoJQp8tHlDz/77P5f51CoBAuOeyJfEY+KhdqK8+GmJ+4eKnCthWzSTg5rcAzTYpg==
X-Received: by 2002:a5d:6045:0:b0:320:8e6:b0cf with SMTP id
 j5-20020a5d6045000000b0032008e6b0cfmr2604590wrt.42.1697576481469; 
 Tue, 17 Oct 2023 14:01:21 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8290:3800:fb7f:2f7a:afad:92ed])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a5d4712000000b0031984b370f2sm565486wrq.47.2023.10.17.14.01.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 14:01:21 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 17 Oct 2023 23:01:20 +0200
Message-Id: <3a0be46ecee62af708a5c63ebcd4845228fc29a5.1697576472.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1697576472.git.yann.morin.1998@free.fr>
References: <cover.1697576472.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697576481; x=1698181281; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fWtdFqESk87OmUQ+Wm958Tc0XvlDru4yejHtCG6fh7M=;
 b=nJ5UvVMzLQFCiQSsStyl4/EiYdTR0i5UhQBUWbGWppxMkPxml8zQNriK7r5FmCi52g
 87iy3pFSXhC9DWQ18YY55XVz0t38n7pxEg0/ez0tiBS+vw8CtSQNmnSTc5SgwF7dVxjX
 2LeEeR8rYy1CCl1tBaIkQ0xKKtMU4elP+i6XIOYwo27yZb6zY2NrmI9y28a/X8d2i8e1
 Zmnu8M8hSI2l8TMmXNliIfA1tDbiZku1SQdr03Q2DWROXYx4u0WqhkIt0vpMDLszddn4
 3fR35M02E+gfRfP+K+MgM6jHAzFR2ImcY41wX+Yt4gPd0cac73XpSJ5xUJgSe5/6Cm8u
 6WYQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nJ5UvVMz
Subject: [Buildroot] [PATCH 2/2] package/pkg-utils: teach per-package-rsync
 to copy or hardlink dest
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
Cc: Herve Codina <herve.codina@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit 21d52e52d8de (package/pkg-utils.mk: break hardlinks in global
{TARGET, HOST}_DIR on per-package build) was recently reverted, so we
are back to a situation where it is possible for packages and post-build
scripts to modify files in-place, and thus impact files in any arbitrary
per-package directory, which may break things on rebuild for example.

21d52e52d8de wsa too big a hammer, but we can still apply the reasoning
from it, to the aggregation of the final target and host directories.

This solves the case for post-build scripts at least. We leave the case
of inter-package modification aside, as it is a bigger issue that will
need more than jsut copying files around.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Herve Codina <herve.codina@bootlin.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Makefile             |  4 ++--
 package/pkg-utils.mk | 15 ++++++++++++---
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index f87f4458ba..3e85d5ef09 100644
--- a/Makefile
+++ b/Makefile
@@ -717,7 +717,7 @@ STAGING_DIR_FILES_LISTS = $(sort $(wildcard $(BUILD_DIR)/*/.files-list-staging.t
 .PHONY: host-finalize
 host-finalize: $(PACKAGES) $(HOST_DIR) $(HOST_DIR_SYMLINK)
 	@$(call MESSAGE,"Finalizing host directory")
-	$(call per-package-rsync,$(sort $(PACKAGES)),host,$(HOST_DIR))
+	$(call per-package-rsync,$(sort $(PACKAGES)),host,$(HOST_DIR),copy)
 
 .PHONY: staging-finalize
 staging-finalize: $(STAGING_DIR_SYMLINK)
@@ -725,7 +725,7 @@ staging-finalize: $(STAGING_DIR_SYMLINK)
 .PHONY: target-finalize
 target-finalize: $(PACKAGES) $(TARGET_DIR) host-finalize
 	@$(call MESSAGE,"Finalizing target directory")
-	$(call per-package-rsync,$(sort $(PACKAGES)),target,$(TARGET_DIR))
+	$(call per-package-rsync,$(sort $(PACKAGES)),target,$(TARGET_DIR),copy)
 	$(foreach hook,$(TARGET_FINALIZE_HOOKS),$($(hook))$(sep))
 	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
 		$(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/pkgconfig \
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 5d5980b098..dcab7d9b2a 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -214,10 +214,19 @@ ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
 # $1: space-separated list of packages to rsync from
 # $2: 'host' or 'target'
 # $3: destination directory
+# $4: literal "copy" or "hardlink" to copy or hardlink files from src to dest
 define per-package-rsync
 	mkdir -p $(3)
 	$(foreach pkg,$(1),\
-		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
+		rsync -a \
+			--hard-links \
+			$(if $(filter hardlink,$(4)), \
+				--link-dest=$(PER_PACKAGE_DIR)/$(pkg)/$(2)/, \
+				$(if $(filter copy,$(4)), \
+					$(empty), \
+					$(error per-package-rsync can only "copy" or "hardlink", not "$(4)") \
+				) \
+			) \
 			$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
 			$(3)$(sep))
 endef
@@ -230,8 +239,8 @@ endef
 #
 # $1: space-separated list of packages to rsync from
 define prepare-per-package-directory
-	$(call per-package-rsync,$(1),host,$(HOST_DIR))
-	$(call per-package-rsync,$(1),target,$(TARGET_DIR))
+	$(call per-package-rsync,$(1),host,$(HOST_DIR),hardlink)
+	$(call per-package-rsync,$(1),target,$(TARGET_DIR),hardlink)
 endef
 
 # Ensure files like .la, .pc, .pri, .cmake, and so on, point to the
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
