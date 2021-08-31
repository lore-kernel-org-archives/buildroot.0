Return-Path: <SRS0=R6N7=NW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17491C4320A
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 17:00:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB73C6108B
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 17:00:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB73C6108B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94CD540129;
	Tue, 31 Aug 2021 17:00:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vHQWZm07cB-H; Tue, 31 Aug 2021 17:00:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6553402AD;
	Tue, 31 Aug 2021 17:00:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5433D1BF4D7
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 17:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41C598102D
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 17:00:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3FUMvU4yjoFX for <buildroot@lists.busybox.net>;
 Tue, 31 Aug 2021 17:00:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 372C980E83
 for <buildroot@busybox.net>; Tue, 31 Aug 2021 17:00:43 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id g18so80129wrc.11
 for <buildroot@busybox.net>; Tue, 31 Aug 2021 10:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6tpH/tywWtC5gEJW8bcFG1D818HLmGlA2eKw8CQ+wMU=;
 b=qs/DHOlzsS5duEs7ghZO7+I+6oIA20wS/V5ASal5JpQSOslXy3h+0ARkMSwfBSu8bt
 C6n6erSAAhvU4w8RmzXnTaRNeXIGVHa4BXcdkGCQvJwI40uyYfvCrnVk0ZzcSTi1EKct
 V7cXhWdNfx1r5Qbm1DAIxAjgrK2yT/5Ii+OkwazMmTQrSySQcmW7Xa16gyekKdFSsDWp
 hEhLw7mMg/CWwHdCzBF4dDXzD7nMvFg8w3p6B2j+n0Gy/Yu0AGMf5mUj88MZ35q7isfV
 jKupncz5wwuXtYNVYPvpK5JHhtPptjyi6R6gAfNQ06MO3obDVPuK6/eEyQCD3EVfEk9k
 olbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6tpH/tywWtC5gEJW8bcFG1D818HLmGlA2eKw8CQ+wMU=;
 b=J1h4f95MKfDaBQlk6zoYwJz0+yxVvXofX0audTriv5POgzwZlvAwZzx3f2UH5QDGXk
 jYmRbolONXavjqC3NSEAzXOkP4SRJ5c5G6TMKT1dRK2zRIRhI8r78gE1k3YHv+fzwwKt
 bd8c0LVVS3LLGTM+Ho1MaWdzv+uNAneA4k2i0bdMgdXKysbE6DjryDPDylko9/UqUw7l
 inBrNGTCegdUc7GWWUQaucNUBq1f18jJbbqDq6G9P1mTBwTrdItOJnWdHLiIFF05+Scn
 52F20SUm/xzrwGEmiQxhKA7C/zyzXNuyoiWQK8yG8pIxSN6GMVaedaytd+fI5JnMD9Qn
 ax7g==
X-Gm-Message-State: AOAM530w8SDoAZq4mHvGzwUQKHxQKVeZitA8VG/z1FaM0zwFmTLQTRE2
 v/xhlOcYfxq6pHFD6Pt92XK4aXZoulQ=
X-Google-Smtp-Source: ABdhPJxL3g0w4pHEKdUBI5w1ZB4J0DTL16o94p47xEJ8c+pM7p3o+CAecPXjmGOfIfGN9IW6tsPVIA==
X-Received: by 2002:a05:6000:1627:: with SMTP id
 v7mr21366wrb.347.1630429241532; 
 Tue, 31 Aug 2021 10:00:41 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id o7sm2850273wmc.46.2021.08.31.10.00.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 10:00:41 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 31 Aug 2021 19:00:30 +0200
Message-Id: <20210831170030.887874-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] support/scripts/pkg-stats: prefer stable
 version from release-monitoring.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

for example with libpng: 1.6.37 instead of 1.7.0beta89

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 support/scripts/pkg-stats | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index cc91d1316..773c90ddd 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -484,7 +484,7 @@ async def check_package_get_latest_version_by_distro(session, pkg, retry=True):
                 return False
 
             data = await resp.json()
-            version = data['version'] if 'version' in data else None
+            version = data['stable_versions'][0] if 'stable_versions' in data else None
             check_package_latest_version_set_status(pkg,
                                                     RM_API_STATUS_FOUND_BY_DISTRO,
                                                     version,
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
