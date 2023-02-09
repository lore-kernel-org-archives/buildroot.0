Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B7FC636CC
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 03:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B997482101;
	Thu,  9 Feb 2023 03:05:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B997482101
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zKITdBJ9qq2x; Thu,  9 Feb 2023 03:05:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4E8B820C0;
	Thu,  9 Feb 2023 03:05:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4E8B820C0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 85C671BF4E5
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 03:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6091140236
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 03:04:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6091140236
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aDA16HInS_Ev for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 03:04:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C7424018A
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9C7424018A
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 03:04:55 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-16aaa20f516so1045636fac.1
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 19:04:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BL5YFz9DprB50E8UJX6mqg6RwY569PvORv97tjz+6jE=;
 b=lbSEPw5zB9DWIOyHZ2NXTf+vjUZ8bnqdtp3Kojfy0FsJ/TZN7WBXe3wZu8JJ8AzWtv
 kk+JTk5QS7BsTB4/Yg2vywM+e/Q1oDca0Xisv9d9CC+Kw0laRI5F8DYMJPb9rkMQ2SOt
 0KpNjJLn8XRFcHdru8lV9Otrax66KdROzbZ+BUVfkOAxs13CyUEM7v3Mzefk2mCCgP1I
 sF3nPepF3dMAxuTcvXH8RaF7q7VvsdjenSh8I26B7ma5ZKlc18TfCDhKaoLnv333yShA
 fgmSbk6jfV9LMohK9wH24XUq7n+owoqV2bZPwnLE8iMKIu2BaR8NQ2EVZXSC6MSwYtn0
 TZ/g==
X-Gm-Message-State: AO0yUKX7OP0h/byV1JcIW0isg7BEMfU5BKQFbndldIrerJ6rn9gIgTgJ
 KjWwP3puDDc856d7CetPvD0NZAdGfyc=
X-Google-Smtp-Source: AK7set/gixgd7ecnaQBMp2AixrzvJiGnnanh9M5zp+MuvFqqs/l6s88NwI1TLAy+7eX1F2rOoR8Cfg==
X-Received: by 2002:a05:6870:3325:b0:163:5443:17a3 with SMTP id
 x37-20020a056870332500b00163544317a3mr5235537oae.2.1675911894532; 
 Wed, 08 Feb 2023 19:04:54 -0800 (PST)
Received: from nowhere.attlocal.net ([2600:1700:65a0:14f0:dce0:30dc:b696:f26])
 by smtp.gmail.com with ESMTPSA id
 m5-20020a056870a10500b0014fe4867dc7sm108383oae.56.2023.02.08.19.04.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 08 Feb 2023 19:04:53 -0800 (PST)
From: Charles Hardin <ckhardin@gmail.com>
X-Google-Original-From: Charles Hardin <charles.hardin@chargepoint.com>
To: buildroot@buildroot.org
Date: Wed,  8 Feb 2023 19:04:04 -0800
Message-Id: <20230209030405.33574-3-charles.hardin@chargepoint.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230209030405.33574-1-charles.hardin@chargepoint.com>
References: <20230209030405.33574-1-charles.hardin@chargepoint.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BL5YFz9DprB50E8UJX6mqg6RwY569PvORv97tjz+6jE=;
 b=c2mKau7oLootzPi4Nd1v7WJRVZ9UriGPCqUbzQaWheRf8Vy6MZ+xSZZ1yVjDu+n2gq
 f1EaqUuk/5LiQEbaa1rxHYYVhVKvnKzeuEMEwyazRHpaNX32cZ8uGIBeylvk67Kflurs
 u7/Ts0N3s7XEgHG+n5W2iRFMV1zsWPp/N6R5We6hnZtQQqspvzhXw8sIyzMGfxrMkfcj
 phATsdkJcrYo53ZtwSfFhurwlYZvY9uNBRJbrdLCRo1hMR3bgglifRil67ZvYfu8lD3Q
 JwXEK2rmH9yL74iKHPpGDAnUhvUqhXDcckHx729pl79DeAgJ5HrN1z6x4AXpZ1A29rZz
 Ltfg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=c2mKau7o
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
