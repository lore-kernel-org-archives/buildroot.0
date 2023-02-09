Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1545FC636D3
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 03:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C40D40992;
	Thu,  9 Feb 2023 03:07:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C40D40992
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DEpZMcAxQv01; Thu,  9 Feb 2023 03:07:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DE1F4094D;
	Thu,  9 Feb 2023 03:07:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DE1F4094D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1AAEA1BF4E5
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 03:07:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01159820C0
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 03:07:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01159820C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id szqIADT713Ct for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 03:07:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01340820B6
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 01340820B6
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 03:07:12 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 g21-20020a9d6495000000b0068bb336141dso177408otl.11
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 19:07:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YMFyFWQKAe34++kCrhB6kdtTnsf5oxhzFqpnzvqB97s=;
 b=75vmYuWaVC5/MBAxxOTVTokjGtoUkHitjfCce5VPDWRaHLTCfzNF2jbDJhF6hFSfa9
 o/4Qe9huA2RHzUPdcX12b59T5AWj2MGLUg48TvQKMW37jVN2zBOquQ2DB6wSKLceMaLA
 yKSKR541JeOw+hID1a8ao5UeLdjgxTCqlTHBqv21gpQb1DYGjWkCKJqLBbRnga6mhaDn
 WF7PPKdRlHCrwBJfH3Rx4ZgPX2gK4ZUXELbQr+fcczYKD0EnpPrKL+hBHvxwIBT+CnJQ
 xxiIYaZjLIYiMln6DImV6eclZ6OBl1z2tcbN5JWDglR6m8HVnLdGUlOCgOtCKs5ttOtk
 mjvQ==
X-Gm-Message-State: AO0yUKUHFnyXShmNhBCaRitbPkaBOIL2SO9BUZQVVFDitRNNGTBGRPWR
 Cd6iTSxv6aEIqOq15ESULyR6plbnq4Y=
X-Google-Smtp-Source: AK7set8sZBLivIras01sVrDA6Ve/dIOD993nLQQHt9Deeclie3YfK1inRm+3FWmnPfxbwhzyuZSVqg==
X-Received: by 2002:a05:6830:922:b0:686:b638:259c with SMTP id
 v34-20020a056830092200b00686b638259cmr5727698ott.35.1675912031445; 
 Wed, 08 Feb 2023 19:07:11 -0800 (PST)
Received: from nowhere.attlocal.net ([2600:1700:65a0:14f0:dce0:30dc:b696:f26])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a05683018e800b00670679748f9sm83631otf.49.2023.02.08.19.07.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 08 Feb 2023 19:07:09 -0800 (PST)
From: Charles Hardin <ckhardin@gmail.com>
X-Google-Original-From: Charles Hardin <charles.hardin@chargepoint.com>
To: buildroot@buildroot.org
Date: Wed,  8 Feb 2023 19:07:05 -0800
Message-Id: <20230209030706.33870-1-charles.hardin@chargepoint.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YMFyFWQKAe34++kCrhB6kdtTnsf5oxhzFqpnzvqB97s=;
 b=aeuxxqavBxs2nXkOPSfuLDdxORN08fdnubyEgIhGZ0OBfU0jw7AiTHeEBrsXj8Iazt
 ggj475wBJiIp9W1zKLmAPC6Ymg+sle/6z6cSofPV2G619Jf81/M7ngiRHzqEd2XjD1sg
 lY2s5iNtKQg6uvCqh4fEcxPIwnHmzc33gdtUvx/afoKvXlSSb0B1wVnsYqnpEoYCTveJ
 fFTjD5+VkSGP0vWZKJLoM8CBslzSIA9/Qfti2QWjGD6xmlN4Dnke9sRmmfRv8HeE6NW9
 8ec2hDWHnu7zE5koVjjXs6pZImUSEkU2L31jCIKX947On/UwbmTjLCrmZgkrTb2NKWFf
 k9nA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=aeuxxqav
Subject: [Buildroot] [PATCH 1/2] linux: create a scmversion file based on
 the custom repo variables
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

For example (line wrapped)

    #define UTS_RELEASE "5.4.70-repo-version-" \
                        "92c23d10d0031e0a13244a1a97e7530d3b53fc6e"

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
Signed-off-by: Charles Hardin <charles.hardin@chargepoint.com>
---
 linux/linux.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 7645b5f507..0b27c8dee2 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -596,6 +596,20 @@ endif
 ifeq ($(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL)),)
 $(error No custom repo URL set. Check your BR2_LINUX_KERNEL_CUSTOM_REPO_URL setting)
 endif
+
+# Create a custom scm version file to reflect the source version since the
+# archive will omit source directories like .git to maintain reproducible
+# hashes for the archives
+LINUX_CUSTOM_REPO_SCMVERSION = \
+	"-repo-version-$(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION))"
+define LINUX_CUSTOM_REPO_SCMVERSION_HOOK
+	(cd $(@D); \
+		if [ ! -f .scmversion ]; then \
+			echo $(LINUX_CUSTOM_REPO_SCMVERSION) > .scmversion; \
+		fi)
+endef
+
+LINUX_POST_EXTRACT_HOOKS += LINUX_CUSTOM_REPO_SCMVERSION_HOOK
 endif
 
 ifeq ($(BR_BUILDING),y)
-- 
2.37.1 (Apple Git-137.1)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
