Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA40DC433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 04:56:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90DF36109F
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 04:56:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 90DF36109F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DB4B4044B;
	Wed,  3 Nov 2021 04:56:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LMc3Iwn2Peiv; Wed,  3 Nov 2021 04:56:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32FF740442;
	Wed,  3 Nov 2021 04:56:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2D6291BF3F6
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 04:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2972080E43
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 04:56:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ooEnXAhUzZcH for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 04:56:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1CEF380E3E
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 04:56:40 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id k4so1658602plx.8
 for <buildroot@buildroot.org>; Tue, 02 Nov 2021 21:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xN/QAL7mo4P1EUHfxjxs2ArHEcg5n5LH0yN1lQQhQz8=;
 b=DlgMNV+c3GKTKe5SyK2a0Ws+VSS9icmtSK/0oy27aHCdyPqeKJrzGsMUx1WhYG+9mc
 0Wm7cj6Np21EhcShyjeHr0/NhtQOdpQOeIbRzDsyZaLID3VeAxKIlbr4SKCU0cET8SmM
 ghUCRZD3mWATa3bkWTfC0y4AiPr6H2J1DjPgLLhHk2VlwU1EnhA9E9g2h+RiNUspy9Zm
 l3kq25WCNLld/OKzCb9w0taaBEpAapZ9EEXA1w6sHk6V6aqO5x+29/J3SzpRer3afHoY
 hmT1DyaUG1zmCCGx/igGYC3tv7KQnFS5hR6cQrRSMh5dTTigOziIBj3jKuHBBzYXSiTO
 Ql9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=xN/QAL7mo4P1EUHfxjxs2ArHEcg5n5LH0yN1lQQhQz8=;
 b=KQCO7jIf691UUofuEtGV1UDc33TTcMGCBLm1WsIrKdmtRPSo3WqEKw9I8DLVv7FZMp
 hLA0U0jmpcCL009Ll0P/GeGVN+SKCvI1ro2d8pCQoJ2Hl+0gZImOdySyQBWBVLXHC7zX
 7FP6zroAFvbaH2gcRIGeTaAKMy4/Kuf5CMAxmD1jb82Uz8qKPHVvDUqISGVk/Ei+LEQo
 L+wAOGORD7BSxBCVVqXa91VeS3D+a4UTUIJbcRtuaTzTUdRPxd8qDId7qJQ6aM3BPhyl
 3UMZMi5JzFDvAM6Bsi/akHwgnN17ALmJ/8aA2F6p36fNqKoNj1hvjdIYq+5ZlBVL7qnk
 3jGg==
X-Gm-Message-State: AOAM530KLSoaAVy5sIKHp+IzkBR+5AOxxEsNgnSk5ROVkkqQB4EstdhN
 CZWGUg2/1FUjbTyO8i1YwBERaQBiLeo=
X-Google-Smtp-Source: ABdhPJzWyRaDwJjsHI/iXaJcMAX68wo72U8BipH4Rlxtflidkl97Kk7bmSRauFEg0J9oE+o72YTbxg==
X-Received: by 2002:a17:90b:3b44:: with SMTP id
 ot4mr12220940pjb.202.1635915398803; 
 Tue, 02 Nov 2021 21:56:38 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.19])
 by smtp.gmail.com with ESMTPSA id b18sm605897pjo.31.2021.11.02.21.56.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 21:56:37 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: buildroot@buildroot.org
Date: Wed,  3 Nov 2021 15:26:25 +1030
Message-Id: <20211103045627.1281356-1-joel@jms.id.au>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/2] configs: Update ppc machines to v5.15
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
Cc: Gerome Burlats <gerome.burlats@smile.fr>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This updates the powerpc machines to Linux v5.15. The series depends on
Michael's kernel bump patch:

 https://lore.kernel.org/all/20211101185420.2338601-1-michael@walle.cc/

I built and boot tested each machine in qemu. They all appeared to work,
except for the g3beige machine which needed some attention.

Joel Stanley (2):
  board: g3beige: Update to Linux 5.15
  configs/ppc: Move all powerpc machines to 5.15

 board/qemu/ppc-g3beige/linux.config    | 13 ++++++++-----
 board/qemu/ppc-g3beige/readme.txt      |  2 +-
 configs/qemu_ppc64_e5500_defconfig     |  4 ++--
 configs/qemu_ppc64_pseries_defconfig   |  6 +++---
 configs/qemu_ppc64le_pseries_defconfig |  6 +++---
 configs/qemu_ppc_e500mc_defconfig      |  4 ++--
 configs/qemu_ppc_g3beige_defconfig     |  6 +++---
 configs/qemu_ppc_mac99_defconfig       |  6 +++---
 configs/qemu_ppc_mpc8544ds_defconfig   |  6 +++---
 9 files changed, 28 insertions(+), 25 deletions(-)

-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
