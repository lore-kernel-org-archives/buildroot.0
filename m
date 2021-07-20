Return-Path: <SRS0=PVMq=MM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C2BC07E95
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 20:43:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7117861009
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 20:43:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7117861009
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49CDD60769;
	Tue, 20 Jul 2021 20:43:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LgysnhzINMxR; Tue, 20 Jul 2021 20:43:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB4206062E;
	Tue, 20 Jul 2021 20:43:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 10C441BF45A
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 20:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3905404AD
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 20:42:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VPi5zevHXDUD for <buildroot@lists.busybox.net>;
 Tue, 20 Jul 2021 20:42:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C9734047C
 for <buildroot@buildroot.org>; Tue, 20 Jul 2021 20:42:46 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso2212301wmh.4
 for <buildroot@buildroot.org>; Tue, 20 Jul 2021 13:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zzVBoCdkyHc3BMqKC+ioD0oTHJWRGXgrIhtpmMdGeLI=;
 b=n3LKANo+mXgPpc/PdT+zCDuIVqthRo+/owkQLhdwjfeK9itPwYMRwx+6mOZNJMaeUz
 saCfTw959hlIgbtkKUv569pO58ADvJLhHnTBLGQz9eIP/zuiCefnKwJtv7eQ/iMNQGB0
 t1yYXrjKSgUOCpQoG1DF4nELPH3lnw5vS7cKmHW7EyrDRTwyDY2FibbF5LLU3l47KAN5
 KYRHzCxz0W6N1HCku4/bjGpJ5jQHj8c7jFwsNi71DWkyo8GOZiKDyB6zreDJOGeQj3zZ
 MmhlHqvu/jr8xeYyrhRLZ2x7r3KEXD2wlVD4OBflUyOwUheflvtVdppB7k4wRHZo0liR
 sRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zzVBoCdkyHc3BMqKC+ioD0oTHJWRGXgrIhtpmMdGeLI=;
 b=nrwUozzt6wxF0k8Jo2cPEdgNooEezMo12tpGYiZzRgRxQEPsmgnPJYV6KkaoR49Xvp
 Zas4AoEH7lqE1ulUjt89Hz+YdMmQssAr/1LgNNdILlkgYiFeT57MYxCzdYJyC4zTR4yf
 4h2vITBWhfTXMBDYGzoPyhSdyk+SSOm37r5fn4kHW/nhKbM33M/8NbqhhKK/7XNO9Oi5
 z/R+DXpzA9B+h0823ossb7CACReZCTco13JaZQe1gE/B1cVjeMcRs2RKcm+9l+gsJrdW
 ja8Va+cO8o7uLs2mnXQAIAsYdMzX57fcebBPu4/pyuuNN125Ptpgq5DdmmfTlO14ZxzT
 ZY7Q==
X-Gm-Message-State: AOAM533yRuo+66HC/BtZghB/HSKYCL22FRwjSPAJ8yFa92C3bEIUOLoh
 Z8OP5e0YkI4qo2aiS7YY3wcjiebRWZ3wBQ==
X-Google-Smtp-Source: ABdhPJwBe6lskOx4OD8IDMx1HGMtMFfAPrI6r/YvIS2u4zUjSx8sqmrwEUojHnahL4jfpoxpoXv1FA==
X-Received: by 2002:a7b:ce05:: with SMTP id m5mr368694wmc.64.1626813765026;
 Tue, 20 Jul 2021 13:42:45 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id c2sm24568087wrs.60.2021.07.20.13.42.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 13:42:44 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 22:42:12 +0200
Message-ID: <20210720204212.79467-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/network-manager: fix license hash
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>
Message-ID: <20210720204212.FTmDd43O-CxcpWz0CdIiJxMeXvkosKo0iL12wO8Ik2k@z>

For an unknown reason, commit 360d1aad84449c6a1993d8c7e469dc0cd35339a2
has set a wrong hash for CONTRIBUTING.md

Fixes:
 - No autobuilder failures yet

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/network-manager/network-manager.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index 6efd697af4..c9d4826a0b 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -3,4 +3,4 @@ sha256  701d511067f757d0f92f412c98cdb49a74a6ba69448aabb1beadacbc171e3873  Networ
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
-sha256  65fd94885d3a5f468755e7cbe1334e56ef3a32b8a73980967fa9839c10514aa9  CONTRIBUTING.md
+sha256  e70c2d84a038b972beff16d8662f35567709dff2d552220bd1af6014f6d2215d  CONTRIBUTING.md
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
