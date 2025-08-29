Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0B9CA0FF0
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 11:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EA7E418F1;
	Fri, 29 Aug 2025 11:28:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PeUBYhdxETGk; Fri, 29 Aug 2025 11:28:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96A0F418EB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96A0F418EB;
	Fri, 29 Aug 2025 11:28:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 02CA369
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 11:28:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E81AD418ED
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 11:28:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M9z-nTBMJ64t for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 11:28:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::343; helo=mail-wm1-x343.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E96EE418E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E96EE418E7
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E96EE418E7
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 11:28:42 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-45a1b0c8867so17264935e9.3
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 04:28:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756466921; x=1757071721;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kF70xqjtKQVRHGtDzJ1phnx8PgTwzLmS48R+rW+y+PM=;
 b=Lbb7taz+3Gym/tlLcaqHOXRTMU5OjjpXK3f9kxYJNWCNftIV80B0h8SZ/VTvn1SKiS
 cC+2DVC8fCD9bhU9fVHcNx0derb3Tai1LOw5gKGVjWKsZ7Y3cxzlSEUkcLSE8o01kG/y
 GxgcKyhRnQm17Ril+zzbqgGqwewFZQwjhe9kGf4n8U4HuELzj+1ZUisdUd54EDiwplXD
 niuXqcNNG+ACDaAELPgaUUk+AEUBPGodg6EGgWm5aetFeVvVMuylwAPgj1Bse0eANB9L
 ZoJvlCnq2TqJzppdrmgH7QMBMlKLhkrLo5Eq27XPlX8t05QDhGSXGI27Po05fUFZkHXR
 JuFQ==
X-Gm-Message-State: AOJu0Yzg5OgYT9TooEb5kT+qp0/d9OWKEITc3rPJ4pDPywHO7hpLsry8
 sjRRArk1+yOH+jJAMemDIA2wEqrJnF5uS7Lrjgbwa5AY2JAcfVAH772lvWg8qruz4RWiXT3+7NV
 /+qLVL+Qq0yzb8pk=
X-Gm-Gg: ASbGncuUIlaJxCFZPxv9NvDLdwTL8lGEoFaOblNCU8blzwfjr7EqbJK3UdvOL/GJVkK
 n18CAsA8KKJEVXP4VzsfqcpG1i29/s3+dvJQ+N0SuM5nndtfbL0SlQFFwLgy0VVKK1RGNJChxOL
 zJdmnm6vHmsT5Y/QmlbVpfb9eX9TKy5b9GhKwhUtFyAU2gilB26ynYdTr+x2DV6TT5rES6z939K
 bv/0pcVLi/mqmFx2dKaLxQmxpf3k+LhvV1bILXXAgRodzAtWBed/r2EYOKvNb1A4eQ5U371Y+zX
 uVFBRsnyRWo5uLZF1xE3ug7IaJbVAIP6SDm9mxuhQJeUaQNV7q3NiVOBCoZi0/H6P4eU426cu5X
 03LnQqA9BZ44VzSwinqQ+AVrwuf6PXoAaLG04Xomlne0ZQyZtGiZWNjcMjX50pZ8xyetEh7pKxu
 /iLvpvlH1LGXeRF0/h
X-Google-Smtp-Source: AGHT+IGdoC6i+udItjykbfXUOBtIFTZ0XAbzoDxB8Qh36Gf6D9c48ZsttbVIKQab4OTmyS1fwTQfoQ==
X-Received: by 2002:a05:600c:1d0a:b0:456:1204:e7e6 with SMTP id
 5b1f17b1804b1-45b517a0c10mr229498265e9.11.1756466920670; 
 Fri, 29 Aug 2025 04:28:40 -0700 (PDT)
Received: from dragon.local.ess-mail.com (31-207-9-44.static.ef-service.nl.
 [31.207.9.44]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b7e887fdcsm34794685e9.13.2025.08.29.04.28.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 04:28:40 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 13:28:13 +0200
Message-ID: <20250829112818.129101-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1756466921; x=1757071721; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kF70xqjtKQVRHGtDzJ1phnx8PgTwzLmS48R+rW+y+PM=;
 b=Yn13BfjreHlqxfMs/FUeLg5Yx91wHRy9VvZQeCbuBYlzSD/Dcg3uA756FM1JSprshL
 t4H1+cO/chm7hbRLvM9KAuey1+JTE06Xy8AqJ+5SkS5/CE2iaRCouN/moRiHfpOvmFkK
 eHQ4KSm0x3YnV8wE1H8nsRQFrxuKBpcsqZmJDKurJgaAtgG5zOW1BQbf/poUgRTkLSyL
 XODTiTPYZDzMF24oLaf2GH6LOY91vCxTEHnMTNHJ229k2lzo/C9jdY9svhkOQhmSVRbL
 umuiS7H6Cua9nfVjb9AWwebDEnd5m6BP40DzKg1O5OidGnTh1g8ZOi/DrjGGxrlLAIVp
 KF2A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Yn13Bfjr
Subject: [Buildroot] [PATCH 0/5] Remove legacy external toolchains
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove old and unmaintained external toolchains from Linaro and
Sourcery Codebench. As discussed during the Buildroot developer meeting,
there are still alternative up-to-date external toolchains in Buildroot.

This is aimed at helping downstream users to avoid using unmaintained
toolchains with possible security issues

Titouan Christophe (5):
  toolchain/external: remove Sourcery Codebench MIPS toolchain
  toolchain/external: remove Linaro aarch64 toolchain
  toolchain/external: remove Linaro aarch64 BE toolchain
  toolchain/external: remove Linaro arm toolchain
  toolchain/external: remove Linaro armeb toolchain

 Config.in.legacy                              | 35 +++++++
 package/efibootmgr/Config.in                  |  2 -
 package/efivar/Config.in                      |  2 -
 package/fluidsynth/Config.in                  |  4 -
 package/mokutil/Config.in                     |  1 -
 package/sedutil/Config.in                     |  2 -
 .../autobuild/linaro-aarch64-be.config        |  3 -
 .../autobuild/linaro-aarch64.config           |  3 -
 .../autobuild/linaro-arm.config               |  5 -
 .../autobuild/sourcery-mips.config            |  4 -
 .../autobuild/sourcery-mips64.config          |  5 -
 .../autobuild/toolchain-configs.csv           |  5 -
 support/testing/tests/boot/test_atf.py        |  2 +-
 .../testing/tests/package/test_gst1_python.py |  2 +-
 .../testing/tests/toolchain/test_external.py  |  2 +-
 toolchain/toolchain-external/Config.in        | 18 ----
 .../Config.in                                 | 94 -------------------
 .../Config.in.options                         |  9 --
 .../toolchain-external-codesourcery-mips.hash |  3 -
 .../toolchain-external-codesourcery-mips.mk   | 13 ---
 .../Config.in                                 | 16 ----
 .../Config.in.options                         |  9 --
 .../toolchain-external-linaro-aarch64-be.hash |  3 -
 .../toolchain-external-linaro-aarch64-be.mk   | 16 ----
 .../Config.in                                 | 16 ----
 .../Config.in.options                         |  9 --
 .../toolchain-external-linaro-aarch64.hash    |  3 -
 .../toolchain-external-linaro-aarch64.mk      | 16 ----
 .../toolchain-external-linaro-arm/Config.in   | 27 ------
 .../Config.in.options                         |  9 --
 .../toolchain-external-linaro-arm.hash        |  3 -
 .../toolchain-external-linaro-arm.mk          | 16 ----
 .../toolchain-external-linaro-armeb/Config.in | 26 -----
 .../Config.in.options                         |  9 --
 .../toolchain-external-linaro-armeb.hash      |  3 -
 .../toolchain-external-linaro-armeb.mk        | 17 ----
 36 files changed, 38 insertions(+), 374 deletions(-)
 delete mode 100644 support/config-fragments/autobuild/linaro-aarch64-be.config
 delete mode 100644 support/config-fragments/autobuild/linaro-aarch64.config
 delete mode 100644 support/config-fragments/autobuild/linaro-arm.config
 delete mode 100644 support/config-fragments/autobuild/sourcery-mips.config
 delete mode 100644 support/config-fragments/autobuild/sourcery-mips64.config
 delete mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in
 delete mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in.options
 delete mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-mips/toolchain-external-codesourcery-mips.hash
 delete mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-mips/toolchain-external-codesourcery-mips.mk
 delete mode 100644 toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in
 delete mode 100644 toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in.options
 delete mode 100644 toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/toolchain-external-linaro-aarch64-be.hash
 delete mode 100644 toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/toolchain-external-linaro-aarch64-be.mk
 delete mode 100644 toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
 delete mode 100644 toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in.options
 delete mode 100644 toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash
 delete mode 100644 toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.mk
 delete mode 100644 toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
 delete mode 100644 toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in.options
 delete mode 100644 toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash
 delete mode 100644 toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk
 delete mode 100644 toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
 delete mode 100644 toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in.options
 delete mode 100644 toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash
 delete mode 100644 toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.mk

-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
