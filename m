Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3501C636CC
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 03:07:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35E85820D9;
	Thu,  9 Feb 2023 03:07:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35E85820D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i_-L_XGXWkLT; Thu,  9 Feb 2023 03:07:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C63D820D6;
	Thu,  9 Feb 2023 03:07:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C63D820D6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BA0F11BF4E5
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 03:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98CA040993
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 03:07:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98CA040993
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wSKW_eQ-uDiP for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 03:07:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A06114098F
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A06114098F
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 03:07:16 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 g15-20020a9d6b0f000000b0068db1940216so186338otp.5
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 19:07:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BL5YFz9DprB50E8UJX6mqg6RwY569PvORv97tjz+6jE=;
 b=Pd1ilmbEsI/ckMvrJvmsbcIF6UhYhCpTY3UfW1f8XdLJ61IhvkcD797ofV871y23Rn
 A9+0ZCUMFwx0s+MExk5H5Pp/TjYJ/ZvNYLXV/ADJ0QXrtAcsqmH3Gl32lnFcCEL8IMjD
 4R1JqZ3P4udhxyNR20c2Mo00Oq9LNduCziD0Uj5DFtm8ivy/Fj1ZYsu6AGApSGSxphXO
 K3EVcD4QDMOYI/xGyyCP4sekgnvENhOftJiGsPYzzPHLGCoNSPMEdLF0aUMlaVvBV79J
 +DlklVwPMMx+4h+3iaPZ6L1dm86hoOb1Gt19KqLneVQtaWgKtXYOwamuw4QQELehJszd
 Peew==
X-Gm-Message-State: AO0yUKW9A4mM2vp7Esk8iGB0PI/zILCHSm1//VMLxaUKmU2CWneNgulE
 PjprqWIhlJDnM8bebRLbct3AZv66bXc=
X-Google-Smtp-Source: AK7set9IODbMBMQRX6N5RA/KDt6nn3IdnLCBdXbtguw9VSbSQZEAkoHZgCyseirF4OfTCMX7Ast7Hg==
X-Received: by 2002:a9d:84a:0:b0:68b:bb10:ce6d with SMTP id
 68-20020a9d084a000000b0068bbb10ce6dmr4456769oty.23.1675912034946; 
 Wed, 08 Feb 2023 19:07:14 -0800 (PST)
Received: from nowhere.attlocal.net ([2600:1700:65a0:14f0:dce0:30dc:b696:f26])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a05683018e800b00670679748f9sm83631otf.49.2023.02.08.19.07.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 08 Feb 2023 19:07:13 -0800 (PST)
From: Charles Hardin <ckhardin@gmail.com>
X-Google-Original-From: Charles Hardin <charles.hardin@chargepoint.com>
To: buildroot@buildroot.org
Date: Wed,  8 Feb 2023 19:07:06 -0800
Message-Id: <20230209030706.33870-2-charles.hardin@chargepoint.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230209030706.33870-1-charles.hardin@chargepoint.com>
References: <20230209030706.33870-1-charles.hardin@chargepoint.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BL5YFz9DprB50E8UJX6mqg6RwY569PvORv97tjz+6jE=;
 b=bshezAqbY6EYhetAGRnDY5pYV/G85o4r3xnv3RCXHVK/fro485shjhYspcxPs6/Ger
 yCj4WWrB5ry9cm8ZSQ7lRalnIjRkwym/XljLEeTvSpAnyvSOu3BhnMQOrs1YW1ETCmhe
 pT6VuYKb0KtDNgRm/DvO5w/SdgStPS0llSTgRglDxswhP1BYL1TMnlF28Zp3MV5U/TAD
 oUFkNZzJKfeIwhCCfi7aGS5Y5gHaydGqmKtpfNfh1weEW57LvAZiserlpbbn9taPYH0T
 CnAJCfkkuYnn4tJ/u0esuqCrqvVUYHuZaNIGJEOOAPrLUGysfA8gJF0aRJfhAU1R6RRu
 RXVQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bshezAqb
Subject: [Buildroot] [PATCH 2/2] boot/uboot: create a scmversion file based
 on the custom repo variables
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
Cc: Charles Hardin <ckhardin@gmail.com>,
 Charles Hardin <charles.hardin@chargepoint.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Charles Hardin <ckhardin@gmail.com>

When using the custom repositories, the archive creation will
omit the source history to get reproducible hashes. This has
the side effect of making the setlocalversion scripts within the
builds to not create the tracking information as expected. So,
just generate a .scmversion so that kernels will be labelled
with where buildroot referenced them.

Example (line wrapped)

    #define PLAIN_VERSION "2018.03-repo-version-" \
                          "d72b9d0908364a64718b652b75e4cac9b85cf0c3"

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
Signed-off-by: Charles Hardin <charles.hardin@chargepoint.com>
---
 boot/uboot/uboot.mk | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 4eae8e95c3..65bb7669c8 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -526,12 +526,25 @@ endif # BR2_TARGET_UBOOT_CUSTOM_TARBALL
 ifeq ($(BR2_TARGET_UBOOT_CUSTOM_GIT)$(BR2_TARGET_UBOOT_CUSTOM_HG),y)
 ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL)),)
 $(error No custom U-Boot repository URL specified. Check your BR2_TARGET_UBOOT_CUSTOM_REPO_URL setting)
-endif # qstrip BR2_TARGET_UBOOT_CUSTOM_CUSTOM_REPO_URL
+endif # qstrip BR2_TARGET_UBOOT_CUSTOM_REPO_URL
 ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION)),)
 $(error No custom U-Boot repository version specified. Check your BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION setting)
-endif # qstrip BR2_TARGET_UBOOT_CUSTOM_CUSTOM_REPO_VERSION
+endif # qstrip BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION
 endif # BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG
 
+# Create a custom scm version file to reflect the source version since the
+# archive will omit source directories like .git to maintain reproducible
+# hashes for the archives
+UBOOT_CUSTOM_REPO_SCMVERSION = \
+	"-repo-version-$(call qstrip,$(BR2_UBOOT_CUSTOM_REPO_VERSION))"
+define UBOOT_CUSTOM_REPO_SCMVERSION_HOOK
+	(cd $(@D); \
+		if [ ! -f .scmversion ]; then \
+			echo $(UBOOT_CUSTOM_REPO_SCMVERSION) > .scmversion; \
+		fi)
+endef
+
+UBOOT_POST_EXTRACT_HOOKS += UBOOT_CUSTOM_REPO_SCMVERSION_HOOK
 endif # BR2_TARGET_UBOOT && BR_BUILDING
 
 ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY),y)
-- 
2.37.1 (Apple Git-137.1)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
