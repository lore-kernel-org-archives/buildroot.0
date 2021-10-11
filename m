Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DB21C433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 22:00:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9E6D60F21
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 22:00:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E9E6D60F21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 998B940404;
	Mon, 11 Oct 2021 22:00:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mAIjf5GJ1M6n; Mon, 11 Oct 2021 22:00:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 051C5403F0;
	Mon, 11 Oct 2021 22:00:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 026E91BF865
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 22:00:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5716403F0
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 22:00:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wShZBwaG17AW for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 22:00:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AB95B403C8
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 22:00:36 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id k7so60334562wrd.13
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 15:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/2q2xLUB+sBLlcs1uDMYYtgM6ZZrjNc/zagh4EtmmRc=;
 b=QanqyIz18Dw8chAsGjXT3/6eGum6e2CydI0l1AZsiZUB9K7HPnsIRJdlaZJGuQLCSY
 nN055N8VMeZAkT7nl7raI+pTzTDy1IN6kPFoe5zpf5RjcxBP+fG3pSIAyzFofAix6Hmo
 V04hGlr12l9Uu24/hvgijeFy4V0nzUawlVueMxWpy8jvrbpp2v7J6+kzb72/qstqkfLG
 hteFtnv7yRPbJL4f94yboSoQHfbPtBb+ldaemjHNxGAXceb+kcaY7v3byMuQdc64fmyl
 9a623X46TULTrGO8uFD3bTHcEC/lSQVIRtBB7SLbOi/2PzWJIoh+nxOK2XfYqfJ6EaXd
 CXPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/2q2xLUB+sBLlcs1uDMYYtgM6ZZrjNc/zagh4EtmmRc=;
 b=2T/DrUrXqMWFZtaPGWjjKJZO+CdlyLsK7ky+5A5qaO6cSvzMYKkGvfklZ5xkxQ3Z3V
 uniiYRTkOry5MfxM83gEQUifm+xfg8jfXl4fBDt343ITRL8lXbUF3yyUCQu+zDZCBFYq
 gJsGLUQt1CG+bwhb4TIbM/VgqX/9uUmUoRjSSqz4OxmETqmv5kH/C8F3MoGkWB+KrDbd
 EyPrjC0Y2BSuNO8DwkA2Y7RHFIILNruIEDlvpPpeJ89YlDnoXMwdhlelbikRAtqAeXev
 sjtPvIknS5XXlA+e7VUszdOEDe1d2bcYgRMuXHnAhhLd0cgydFcnhtbglZAvAA16IvRd
 zDeg==
X-Gm-Message-State: AOAM530+YqybAStgYZomAtDmEgBmDtAOcHmxBFK7ZxGgYwKeU2N/P964
 Z5pcckkcWRQJTzQ+LMTUNFlet5iPfdI=
X-Google-Smtp-Source: ABdhPJwHaILEuLVJpTIKatyxoI7ObK2wpjgq/01fsZ/vY0zR2eEnVrSq7KLx2DTGox5VYdm/zBNZng==
X-Received: by 2002:a1c:808e:: with SMTP id b136mr1674988wmd.178.1633989634748; 
 Mon, 11 Oct 2021 15:00:34 -0700 (PDT)
Received: from dell5510.suse.de (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id g25sm9214992wrc.88.2021.10.11.15.00.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 15:00:34 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 12 Oct 2021 00:00:22 +0200
Message-Id: <20211011220025.7998-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [RFC PATCH 0/3] make: support: use `command -v' instead
 of `which' *second try*
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Markus Mayer <mmayer@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

this is a second attempt to introduce command -v.

Changes v1->v2:
* reproduced original issue and fixed by not relying to
  $(shell command -v ...) but shell with:
  $(shell $(SHELL) -c "command -v ...").
* quote variables

Tested only with make defconfig && make help >/dev/null


Petr Vorel (3):
  make: support: use `command -v' instead of `which'
  make: Drop `type -p ...' fallback
  support/dependencies: don't check for `which'

 Makefile                                      | 22 +++++++++----------
 package/Makefile.in                           |  8 +++----
 support/dependencies/check-host-bison-flex.mk |  4 ++--
 support/dependencies/check-host-cmake.sh      |  2 +-
 support/dependencies/check-host-gzip.sh       |  2 +-
 support/dependencies/check-host-lzip.sh       |  4 ++--
 support/dependencies/check-host-python3.sh    |  2 +-
 support/dependencies/check-host-tar.sh        |  4 ++--
 support/dependencies/check-host-xzcat.sh      |  4 ++--
 support/dependencies/dependencies.sh          | 18 +++++++--------
 .../pkg-toolchain-external.mk                 |  2 +-
 11 files changed, 35 insertions(+), 37 deletions(-)

-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
