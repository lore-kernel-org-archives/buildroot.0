Return-Path: <SRS0=LUVO=OU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 324E0C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 18:31:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA91461381
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 18:31:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA91461381
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D0196143F;
	Thu, 30 Sep 2021 18:31:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WKvNdJPfmG9s; Thu, 30 Sep 2021 18:31:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E69146143C;
	Thu, 30 Sep 2021 18:31:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 30D5A1BF289
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 18:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D17F425D4
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 18:31:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hKY-bhZ5JXkV for <buildroot@lists.busybox.net>;
 Thu, 30 Sep 2021 18:31:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 79694425D3
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 18:31:27 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 i6-20020a1c3b06000000b0030d05169e9bso7022576wma.4
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 11:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Lqf3P5NXbHWNunzlAWuHxNqsTTLiD1OwbFaNvROLfL0=;
 b=q1Eu7w21AwSYXZxJn2lT2ZwzhdNyZRPOxnyL4N9/nd+7vJVVq74MzeFC/Z83iEV3ns
 K0J2RzEDxubgXq6cZddBJsfsoxq5nvf+sr/OGEn6kfBinQEYG+XNs4cHRaA+icWi0ru9
 ouLhqUYSLyRSx2MFfng3EhrM2zV/+3iZYaCDnyreAjbsTWHowf9RJ3lr054RT1q+pLV5
 PlyQ9xUWwfplu6NI4Ld0oK1pa8c6j6m5KWpEIPa7jvIL5ycNlii+6Xc+EwcFbVWVT4AJ
 WObYEywb2DnT6xAiiW2hITjWFPX5q+KzCID4PhqccGoAGkn0t7rT9bO3a4quKwVIizgd
 5Wvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Lqf3P5NXbHWNunzlAWuHxNqsTTLiD1OwbFaNvROLfL0=;
 b=FLunqVYcQHs+0Bn6/KaOcnhbnasKQxf6/aXUy1HpB6f7NcCzRcNtOmNuUAzw/qv+nV
 g1AZYPxgE8HKwROFrO5X8acSVZ2bYxRYomv5k4KcC/0DFiIYe+Ve1BiEguCWbJHbLDcT
 xmCCADqrQbImbjMaSf49a3uHJmieefeuBHNKEfFyVIizs/pnFuSlu9XMBh2VBX9oyivJ
 H4Hs842pocbJDilBfY1iscncK4O6rURDrwZlzf5fctI931DdFYrFjASOE5bN4nqdGTT3
 6pdMXClG5+6i7pD2T54Tu0eaDMKGvsXlUa4G//1DSvNhzH/HZ5LKcOwXt5VqdkJrn1NX
 RuEQ==
X-Gm-Message-State: AOAM532Ax7GvCFGZLMVflPzEVt317h3/RmDMdTwdbqxGYUIyBgeOsywT
 +UMUYqndDv9zRO3nKKYG720=
X-Google-Smtp-Source: ABdhPJxyEOz2QhEHB+0DeigyWBMahyt4wCqx5/70GK3dLk4fDeTi6LJYZ8qdM7YgRaD/sl+72jzpKA==
X-Received: by 2002:a05:600c:a0b:: with SMTP id
 z11mr687984wmp.147.1633026685537; 
 Thu, 30 Sep 2021 11:31:25 -0700 (PDT)
Received: from dell5510.suse.de (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id c9sm5767996wmb.41.2021.09.30.11.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 11:31:24 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Thu, 30 Sep 2021 20:30:55 +0200
Message-Id: <20210930183058.5240-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [RFC PATCH v2 0/3] Fix old toolchain (< v3.14)
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
Cc: Li Wang <liwang@redhat.com>, Martin Doucha <mdoucha@suse.cz>,
 Cyril Hrubis <chrubis@suse.cz>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

NOTE: this fix (3rd commit) is needed obviously due very old toolchain
(sourcery-arm from Buildroot). I suppose it's still used, but can
anybody from Buildroot confirm this?

Kind regards,
Petr

changes v1->v2:
* fixing moving IFA_FLAGS from lapi/rtnetlink.h to lapi/if_addr.h
  (it was by accident done in 2 commits)
* new commit tst_netdevice.c: Drop redundant include

Petr Vorel (3):
  tst_netdevice.c: Drop redundant include
  lapi: Create if_addr.h and reuse it in rtnetlink.h
  lapi/if_addr.h: Define IFA_FLAGS

 include/lapi/if_addr.h            | 19 +++++++++++++++++++
 include/lapi/rtnetlink.h          |  5 +----
 lib/tst_netdevice.c               |  1 -
 testcases/cve/icmp_rate_limit01.c |  3 ++-
 4 files changed, 22 insertions(+), 6 deletions(-)
 create mode 100644 include/lapi/if_addr.h

-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
