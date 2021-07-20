Return-Path: <SRS0=PVMq=MM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_NONE,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A6DBC07E95
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 21:01:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AE67610A0
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 21:01:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AE67610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB478402D3;
	Tue, 20 Jul 2021 21:01:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6480Wuka_YBi; Tue, 20 Jul 2021 21:01:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 398D2401BA;
	Tue, 20 Jul 2021 21:01:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 386C61BF45A
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 21:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 222D2401BA
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 21:01:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GNpwGBAQkosr for <buildroot@lists.busybox.net>;
 Tue, 20 Jul 2021 21:01:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4564A4018D
 for <buildroot@buildroot.org>; Tue, 20 Jul 2021 21:01:04 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id g22so45004iom.1
 for <buildroot@buildroot.org>; Tue, 20 Jul 2021 14:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l2kuQsYk5wV5Bz3EhjJp15rW7MK9KbZ15mWIpWf/JEk=;
 b=YT4szgiepgXlRikuyYaXUnWtGNnrrUVkxwz4nfL+yy5HGlZ9vLFSY6G+dUiJODrslh
 JE02xVGCnYxOC/V7iMNRMa5HnvLDdrkYq+GFKaXWbKnGZmjdwfuhWqDn4FEA8L5KYmE+
 B3ytwWpmCIxg8PunzKR9yJIHOnpATttT2Po5Htsh508q+2pLg685Hts1RY/xi2tjmZiv
 Jf1Hdk+IIUVJcgidO6ADLiQY/gzYWgJOMhxZLAG53guMVIbvZ/vjpkWFhzOmibZEoY85
 KE/zHzLhoaBL0p27cWt8AGKMKSVj7/uiiNBThtrRYxygsmMeBVNBe/KVCPPBcrjJuomf
 BGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l2kuQsYk5wV5Bz3EhjJp15rW7MK9KbZ15mWIpWf/JEk=;
 b=XPeX557Z35A1DjPU6igvCWacjDhcf20D4QZQDpEW2lw6wvhoyz7ASVvHVZvdAAB0d9
 Ef4apo3Wn1mcAdhrj/G6l1VaFyBJ7tWzcg7Nd+YrkZQVcb5sr3mXPSxWojzwZZTxokTt
 WkZsabzusB39aYv6by9SrAS/vvX7fz77wwudu7MZQbbwcZ5TTXGmpTUa0sLS+jiDlppm
 WzE9wSi4nzTRJMMTaqj64ccQGypP6t0d0Vb1Okbn7uABPzslXqSYslDyfXe6hPT6p0xt
 i6/fyKIQBeyislAllbAzY+9fYA8B/7oQPr21fuXJ5fOR6dKaO08VCu/FaLZ8/SVpPvLd
 8u5A==
X-Gm-Message-State: AOAM531s/q6hUVrKtg0wyq3koULem/VAL+TDNQqj+snTbPlARMF3faw3
 0Th6BYfTV2+8nW5oBO9wHnMkpA2zimw=
X-Google-Smtp-Source: ABdhPJxUUgZLZvawgaLo2OVxGMLT7hoWEZJwleg/bloNqzq98UGm1Nlo19RUPKcntZhn0lK0jERq4w==
X-Received: by 2002:a5d:9ccb:: with SMTP id w11mr19135203iow.174.1626814863244; 
 Tue, 20 Jul 2021 14:01:03 -0700 (PDT)
Received: from james-x399.localdomain (97-118-178-184.hlrn.qwest.net.
 [97.118.178.184])
 by smtp.gmail.com with ESMTPSA id u10sm8211698iop.15.2021.07.20.14.01.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 14:01:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 15:01:00 -0600
Message-ID: <20210720210100.990403-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/systemd: bump to version 249.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>
Message-ID: <20210720210100.DaBqxJMHrYiY2wEX2j49uYunpiitoWGWwPCDHDamNlQ@z>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/systemd/systemd.hash | 2 +-
 package/systemd/systemd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 82741d1996..b419dce445 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  0d9d45140e95f2d0ee79005ccf867f2706976c30391b932a8c3b9b198a801fad  systemd-249.tar.gz
+sha256  69ca802ff87e316a216f4bf5e5fd787dd9810c8c8c5076917ee817e52bd6c3a9  systemd-249.1.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
 sha256  f5645b4b846479859d6618fa7a5a1722681aa7fc43c1e45f8bf8e1fe5738d618  README
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 03a5a5e4c8..8bfd407f81 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 249
+SYSTEMD_VERSION = 249.1
 SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README), BSD-3-Clause (tools/chromiumos)
 SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README tools/chromiumos/LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
