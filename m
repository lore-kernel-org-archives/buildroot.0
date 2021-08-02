Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A7C1C4338F
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 19:45:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA41D61037
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 19:45:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DA41D61037
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B4BD4023F;
	Mon,  2 Aug 2021 19:45:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kwJXuaaAG8ng; Mon,  2 Aug 2021 19:45:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7D3540249;
	Mon,  2 Aug 2021 19:45:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 576D81BF989
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 19:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 449A483118
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 19:45:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qjp35yw18fhK for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 19:45:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 52D1A83547
 for <buildroot@busybox.net>; Mon,  2 Aug 2021 19:45:39 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id c9so2481567wri.8
 for <buildroot@busybox.net>; Mon, 02 Aug 2021 12:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qsnyz2y5kc8tOhrNySo8hZSga9doon9rILsAGxe/7oc=;
 b=A0wSU3g1kGSaNV2OezgY5QKFTzMVRFfKYZ9DNjUtu0+4Nw3F/cU8EYeyX6aT6IjZh1
 pHguZfzKbRQQbHtRbwCRAYWYcgLeK1YYtNu+T1X/TDme+ZvnprgaZPvPyh61kQfMEJ7X
 syVPXbqWOb85f5X5GLC+mcNXD4Yv8Agls10E9sto19C2UOFUzqEjDRw21U+Zga9nGthu
 JxHx9GCx7AmK9Qo8CMMKlR1kFqK9+5Qj/BcWdX4LrNqIk2MqOrCC/7canPWF+gOdH61t
 kCnArtqJnhCxNCfOd2IXRBRdm7n7DoKLudJm66wG/KDQ8lGEJA34Y8JaGHWLmVsakkJb
 Trgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qsnyz2y5kc8tOhrNySo8hZSga9doon9rILsAGxe/7oc=;
 b=AyQHDiPR66/WXW91U4JEYO4rRInXxFhtv4RYlRUmpjfLhF1CZxDXTxsJKfU7K83WXu
 uzeEycC1621Os0AnDmDfrB+ZZjJ6NX4HZU/HWDhQjZlstLZnJ+SDZNDlood48b1Btppu
 Np1pJmXzAXcnyHnxPvB97DBxn3rr2VfrSVLvlq9mXblOugiGMJA8dqcPjiM5WNQEw8iV
 FEe+AoFzNYfH2upD+g5y9uKvhcCzRc0spwlk1PMsAiyn6sD868Njr8apj4g0DiydqCc7
 UGeMju7Wlubpt+LdOjYTL2/R3eqNk+ESSKR+rmMKdo9/UjXA6NpUGnzJ8+PffeLiNq90
 sJQQ==
X-Gm-Message-State: AOAM533jJmtgIoCW0QpTURTxA7DwtErXDWgVCBlmS84eS61eOpxi8PiF
 ftP37RdfN9ed3bD6dqtU2775UvJrdgA=
X-Google-Smtp-Source: ABdhPJz2Gj8Ihrf5cFlLkVeajxRrM1FY9n5YO7HQTPhtbPOGHfIEM7AbBEZTyHMJLfh7La+z1CzMsg==
X-Received: by 2002:adf:cd0d:: with SMTP id w13mr19511614wrm.25.1627933537423; 
 Mon, 02 Aug 2021 12:45:37 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id p3sm283410wmp.25.2021.08.02.12.45.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 12:45:37 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  2 Aug 2021 21:45:16 +0200
Message-Id: <20210802194516.3316626-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/e2fsprogs: bump to version 1.46.3
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/e2fsprogs/e2fsprogs.hash | 4 ++--
 package/e2fsprogs/e2fsprogs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.hash b/package/e2fsprogs/e2fsprogs.hash
index 909394ba4..366180119 100644
--- a/package/e2fsprogs/e2fsprogs.hash
+++ b/package/e2fsprogs/e2fsprogs.hash
@@ -1,5 +1,5 @@
-# From https://mirrors.edge.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.46.2/sha256sums.asc
-sha256  23aa093295c94e71ef1be490c4004871c5b01d216a8cb4d111fa6c0aac354168  e2fsprogs-1.46.2.tar.xz
+# From https://mirrors.edge.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.46.3/sha256sums.asc
+sha256  86d1580facdd49f2e0e6b027e26b1e6c48af538762dc40aeed2a87153c1f11b7  e2fsprogs-1.46.3.tar.xz
 # Locally calculated
 sha256  5da5ef153e559c1d990d4c3eedbedd4442db892d37eae1f35fff069de8ec9020  NOTICE
 sha256  032989b508f1a72ebee5b3417e55d06d473f9ee203e45ab11864a7e49cdec63d  lib/ss/mit-sipb-copyright.h
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 0a69690e2..5603d168f 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-E2FSPROGS_VERSION = 1.46.2
+E2FSPROGS_VERSION = 1.46.3
 E2FSPROGS_SOURCE = e2fsprogs-$(E2FSPROGS_VERSION).tar.xz
 E2FSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/tytso/e2fsprogs/v$(E2FSPROGS_VERSION)
 E2FSPROGS_LICENSE = GPL-2.0, MIT-like with advertising clause (libss and libet)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
