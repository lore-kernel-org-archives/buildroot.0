Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB49C61DA4
	for <buildroot@archiver.kernel.org>; Sat, 18 Mar 2023 12:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E963340530;
	Sat, 18 Mar 2023 12:30:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E963340530
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D0VR4aN8sGDL; Sat, 18 Mar 2023 12:30:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3060540147;
	Sat, 18 Mar 2023 12:30:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3060540147
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F373F1BF834
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 12:30:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA25041607
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 12:30:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA25041607
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b-Y-NF6HPkvS for <buildroot@lists.busybox.net>;
 Sat, 18 Mar 2023 12:30:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECD94415CF
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ECD94415CF
 for <buildroot@buildroot.org>; Sat, 18 Mar 2023 12:30:14 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 t17-20020a05600c451100b003edc906aeeaso39991wmo.1
 for <buildroot@buildroot.org>; Sat, 18 Mar 2023 05:30:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679142612;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZJInSawRUOy8e9XVatQgNXWcZy6yQ2hk1YPyZzDr/j8=;
 b=ROkb/CfIMUGNcq7XVGd99EwFVQZKUCMRn7iVtil5DPEj4M+H5UJyBm2Ymolf+8+nmI
 BdPU2LbWOdpWzGnsB+3qgzM0InJVRS6AeeO9dQNvT+mYzunr0M+eDLEEG0xneppwkbQA
 731fTfbudGCLQpq8meq2LCAF1hxlxCDlyCGRmvhdlHwROYzkqfZepf2e/HjfWLPUZbgY
 RleckU8GOEty+yHaWiD2UWe2JFfdMQVmukIk2P457WnkEE4Q9/2iasp3lCytNUXPadzU
 YzaTRUOxJNtOR+8dr57cLmYfr0OPfyMn2iuvLqwJJ2G3M1OAxQw0OHobxNi6UTdJDpLp
 Bg8A==
X-Gm-Message-State: AO0yUKXPY253rtgw3wDgCVX3CXeO85bz++JYFHcduebpQ6Tp5B+Ym2wQ
 oP4l3e+1Erie+pIw+X4owsZn4bUBi78=
X-Google-Smtp-Source: AK7set9HKHrfw8JRkioZDt2tSKEyWKZLlhI02K15LptyLYKbxv2RGnfCuWnjnPONQd+i79fYiDJ2Tw==
X-Received: by 2002:a05:600c:190c:b0:3eb:38e6:f65d with SMTP id
 j12-20020a05600c190c00b003eb38e6f65dmr27691097wmq.11.1679142612384; 
 Sat, 18 Mar 2023 05:30:12 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 d25-20020a1c7319000000b003ed2f755165sm10342781wmb.33.2023.03.18.05.30.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 05:30:11 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 18 Mar 2023 13:30:10 +0100
Message-Id: <20230318123010.3448-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679142612;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZJInSawRUOy8e9XVatQgNXWcZy6yQ2hk1YPyZzDr/j8=;
 b=btX5BOb7osF8MZAXdcSaSgT/aNUBn1Q8AnU3m0hIlfQJTARoDe7uCn65hNPIF8xE5/
 YuuFlo64V05OlaV69wPinD5GJz67jSPWHKqm8MosPJ9uhNNdrEd/xtYp3VgjjcRckoj4
 5d8HUbMRCzsMLQ9HlF/OE0SbgltlRFW5C01FTHww4tDZv18PUTZQ0BQCuh3AWtaw7yZT
 ZRKnNQmKxA+BotOrGLTfGxRqF4LJuxdGPokUqvZhN3SZ1NsB4/CgxCu0vBODZ6AbzpRj
 ni3VcreilUBT91rCgvZFBFSiW5gAXurmSV0U9IAjX/jvNqL5fZF4Pks2kULyx1PKSPFQ
 eOiw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=btX5BOb7
Subject: [Buildroot] [PATCH 1/1] package/shadow: fix libsemanage dependency
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since the addition of the package
in commit f78c5cb5cae93a9e63dad4361d78e1787759382f:

Makefile:576: *** libsemanage is in the dependency chain of shadow that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/e528e07874815d7f1cb951084ec985d76fe22d2e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/shadow/shadow.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
index d8f913a648..4bc3cce037 100644
--- a/package/shadow/shadow.mk
+++ b/package/shadow/shadow.mk
@@ -87,7 +87,7 @@ else
 SHADOW_CONF_OPTS += --without-libcrack
 endif
 
-ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+ifeq ($(BR2_PACKAGE_LIBSELINUX)$(BR2_PACKAGE_LIBSEMANAGE),yy)
 SHADOW_CONF_OPTS += --with-selinux
 SHADOW_DEPENDENCIES += libselinux libsemanage
 else
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
