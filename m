Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F635C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 21:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8219C81491;
	Mon,  8 Aug 2022 21:26:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8219C81491
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5K61oM80jah4; Mon,  8 Aug 2022 21:26:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBC9B8148F;
	Mon,  8 Aug 2022 21:26:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBC9B8148F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1E4941BF3BF
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 21:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2443408FF
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 21:26:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2443408FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pdJeLJOaboK4 for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 21:26:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C4EE408FC
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C4EE408FC
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 21:26:18 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 i128-20020a1c3b86000000b003a536d58f73so3023009wma.4
 for <buildroot@buildroot.org>; Mon, 08 Aug 2022 14:26:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=u7Ir0N/qegEd84TiLwIXkYnlmimL1P0exJbXNN8/lzk=;
 b=OhqZ8KDrzXBoJ4+qRqfC3y0SoSgf3eKNXjKSbkHdz+BXiufOU0fYpbcPPz8Z2wXmQ8
 3rocg63jg9/P8KRtyYV6a2TszZO8lLZQu+PQzR3Jc1UVoojZatNT4YiNQTozIFuDjs/S
 qc5QGpL+ggxrMaB1WLCZmk9cGVyBJftfBuUUcATa8so3D3Hsv1BZz5te8QXaChcIOwii
 0w8nGbrbl8Ec2LCXEOmLWNyS13oMf4rzslANalpUVTQyHxM3GGcE2DUkUoT0ixYRzzC7
 tmKmSSGknCwKrnA+XZ6VTt489sE4trbavEJm2Lr+jt2qghvHU4zL6hrVHKc43fgeeCLt
 JODA==
X-Gm-Message-State: ACgBeo0hhIbJ6DlDwNZdJJqB5bxNvN656+VHsobsYEvjFPb43NJ7HiCX
 9vAiMUXXa8xnWhZpPNzRCBPdscNCsYM=
X-Google-Smtp-Source: AA6agR57Ly3jxJHfcyD8zZVfL9T9B0CZaAA2nFPkYfj+QdA0ieTzTjJyWEsyk6HJxgqDH4edK2jIQg==
X-Received: by 2002:a05:600c:35d6:b0:3a3:1c4f:6f46 with SMTP id
 r22-20020a05600c35d600b003a31c4f6f46mr13681390wmq.206.1659993976700; 
 Mon, 08 Aug 2022 14:26:16 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a05600c4e0e00b003a5537bb2besm499369wmq.25.2022.08.08.14.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 14:26:16 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Aug 2022 23:26:07 +0200
Message-Id: <20220808212607.1802919-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=u7Ir0N/qegEd84TiLwIXkYnlmimL1P0exJbXNN8/lzk=;
 b=UD9hMQQjogCAzK/ztc2yvCFnGA8T9Xp1jzZq66RwzK0CmaKgqvOx53IIdWl+kkfjYv
 BGqe5M+gBhOB/oNGthaszVoNUW8YFUvDbYGQFdMCZ6fCJUB+BS6rGuwVRqWJHneRP7hG
 0GMSI20Jvi8C9saxqkjMnLl5aMuBr8Xr4vziLaQomXxq9Evmhf+iZfip1uSc9cR6j++q
 bZy4gu1RNrP4FQFDtwwEjuDUJCVx8r5NSlRKrkuZJZUbu1yIb+kldrIDwSGdT0fQrkWB
 Xe7BO5r4b5ySQE5jHDqkT319Co7xdX46Uk3C7on5lhexXhKZBC1ghM3rxvbWqGNY50NR
 PpGw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UD9hMQQj
Subject: [Buildroot] [PATCH 1/1] utils/genrandconfig: fix indentation
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 0f3115b2ca9fbdcf7a4e02aba45104f2d423fdb8 broke the indentation
(missing one space)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 utils/genrandconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index a56f03681a..4846c316bb 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -535,7 +535,7 @@ def fixup_config(sysinfo, configfile):
         if 'BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT=y\n' in configlines:
             return False
 
-   if 'BR2_PACKAGE_REFPOLICY=y\n' in configlines and \
+    if 'BR2_PACKAGE_REFPOLICY=y\n' in configlines and \
        'BR2_PACKAGE_REFPOLICY_CUSTOM_GIT=y\n' in configlines and \
        'BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL=""\n' in configlines:
         configlines.remove('BR2_PACKAGE_REFPOLICY_CUSTOM_GIT=y\n')
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
