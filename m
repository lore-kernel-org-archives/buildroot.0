Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF61C5B572
	for <buildroot@archiver.kernel.org>; Thu, 13 Aug 2026 17:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40F7640827;
	Thu, 13 Aug 2026 17:12:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K2XbsuS2rNGB; Thu, 13 Aug 2026 17:12:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AB894084B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786641144;
	bh=T5oyvcmI6zPJKF2Qr+Ff72y1dgFgj25fba0Qp6ejZ/I=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=kvY3pQQ/Ca4OOrJPYgtZRjcUcX/7XpBRIDBQlm4Zc7MjjjygJlgp6u6cBRcMIdU1C
	 1OTVtHKPicdETzP3vldk+HJKfyJuzvhgJ+CDM+8CF7JTSiJctatvGL+KfLh+RTMc4l
	 Dw1/21bLORnHTufMaVAARRcCsH1MX9ji9ryO0aoVoIQjfRJ4BUYaydPOEC1fRSVosQ
	 reRPMPt4ntkuQMMvvucyFdTWoFiZiVG+Prag4Pp/ULzebFDrWT7p2KaPRTWWqJlhak
	 RqNgw6N7oqZs1aAicVdFLLXcw976wTkz6G6TGk4N5ykpPU4pr9TBQyrX58Th8DpLIi
	 jLrOQtBpadtog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AB894084B;
	Thu, 13 Aug 2026 17:12:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C37A233B
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 17:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9E664084B
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 17:12:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MjFqf1zIuR17 for <buildroot@buildroot.org>;
 Thu, 13 Aug 2026 17:12:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=richard@vodden.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9F63540827
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F63540827
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F63540827
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 17:12:21 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-47f96c5b722so47072f8f.0
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 10:12:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786641139; x=1787245939;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=dufaNIbBSE4uCLbNFpnxS8d9jCkc2FfG3hHveh16LxY=;
 b=f04muTyJTZwc3vfpeUoesBVWVpmd6HT9f6UpOQmiTixv2X3cf09FqhNItBMSaIRY3A
 hEyN+9oBVnRpcOJrf6YrhYaugZRNHbp4oDsiD+UBv+PrInQpV6bN3U/c/6mEWzQXBuFy
 nsfnBqaBmGuXaEe96+EZqnCIamPP2srOLugcunQaMvixf7yHqyaFwrlBc0t4hcB+qgix
 EyuJEJ0WgXvIN/weEVi83tfGcYsv9/ZIdO879sC2QvZQlbsvs91srUNzw0ktDXZJnFL3
 UcTFOLvIpPfnbubV4Et/p7bInybitgym9c0mogOu9PqxjTjR8P/MnnS34MCMzUExtPYM
 P2Lg==
X-Gm-Message-State: AOJu0YxwT4dpNGMCH72AYXXIaYm/THSuiVdOAQ/W5I2SlcM9S8yReZD9
 4IkeCxDwHK/jUX8WHhmmtYz5K9M6SXqshSn7pFrmaG0suixB9T14K2r3EvU6vy7w7Nbm+fSHy0C
 dR+Dv86ZjojcL
X-Gm-Gg: AR+sD10+7qeFeuD/bEEW7DLWYq/JqNdwy9cLbNnJDLm0sdCVA8fFvMB1kqTFCiLCCAm
 IBQI3qu6qHnXHm9EF7T6nncz6637zSFFlQSEgYKx/LyxvnmXO8USj2sXaT1CmR6Zn/jS9rAaRJX
 4I0YQqpzHY7b3Q8xZiVvSTbIp8+dgSHAass4/L3HRj+cv7QwcclF2vr8LgJKG4SunbgOcKpR72T
 0QC8dFVhWP8OXqrG43g+iZtiaB3GXKN530YUkgp7MEZAhhcyiLjcO+NnSXmV5QTGknHw/LgG/jJ
 liuVvknbjV0lCPfeBoPqcv5+imZfjN7Js4MPxZK8SW1zXOLCqQD1ItNdvWcyhaZH+BnRJbom91Y
 km799YZM9fzwLAjvkqwfGRh/258HlTLiZZOhRBkixK/8/CtSzdDttbV/02q4PdmWn3yYsgM2oyr
 uKzcNMQtynrPZpAC3LhXlHTbKWdF4gQev19F+dUwHCB6ThTVhwGZ34sj0N7YrtMdzusDEhC29Xy
 7D0NS9tQTn4ne6xDbIRvb0Me/Ji9s62
X-Received: by 2002:a05:6000:2997:10b0:47f:9ac6:ca60 with SMTP id
 ffacd0b85a97d-48159b367b4mr9032039f8f.0.1786641139558; 
 Thu, 13 Aug 2026 10:12:19 -0700 (PDT)
Received: from Hamilton.. ([2a0e:1d47:d002:5c00:f03a:f2f4:3357:904])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f21a31dsm832291f8f.9.2026.08.13.10.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2026 10:12:19 -0700 (PDT)
From: Richard Vodden <richard@vodden.com>
To: buildroot@buildroot.org
Date: Thu, 13 Aug 2026 17:12:07 +0000
Message-ID: <20260813171215.3483906-1-richard@vodden.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vodden.com; s=google; t=1786641139; x=1787245939; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=dufaNIbBSE4uCLbNFpnxS8d9jCkc2FfG3hHveh16LxY=;
 b=a7PdJ3wzAzdCnYbn9+IJLYnhVrjfhRxLvdHwe5+mT1wM6r79RCQE3/2WiKShs8yjTu
 ELAPxJizXFGYH7SC1RVToY0uXRO8j6Ty5+0nRnO7vrAbnQ9787Gx9WlA+CTdrLMTC0hb
 kMWvzYovKRYfc7lLdZD0DxBp+dynZXjEEiiVc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=vodden.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=vodden.com header.i=@vodden.com header.a=rsa-sha256
 header.s=google header.b=a7PdJ3wz
Subject: [Buildroot] [PATCH 0/2] boot/opensbi: support building an
 out-of-tree platform
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
Cc: Leo Yu-Chi Liang <ycliang@andestech.com>,
 Alistair Francis <alistair@alistair23.me>, Mark Corbin <mark@dibsco.co.uk>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Kanak Shilledar <kanakshilledar@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Francois Dugast <francois.dugast.foss@gmail.com>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Richard Vodden <richard@vodden.com>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

OpenSBI can build a platform that lives outside its source tree via
PLATFORM_DIR. For a board whose platform is not upstream -- as is the case
for LiteX/VexRiscv -- that is considerably simpler than patching a platform
directory into the OpenSBI source or maintaining a custom tarball, and it
decouples the platform from the OpenSBI release so upstream can be tracked.

Patch 1 replaces the BR2_TARGET_OPENSBI_PLAT string with a choice of
reference platform, external platform, or no platform. Three existing
conditionals compared that symbol against the empty string; they are moved
to !BR2_TARGET_OPENSBI_PLAT_NONE, as leaving them referring to the removed
symbol would silently have disabled INSTALL_JUMP_IMG and INSTALL_DYNAMIC_IMG
and produced no firmware at all. The 13 in-tree defconfigs that set the old
symbol are converted, and a Config.in.legacy entry carries an existing value
over to the reference platform.

Patch 2 adds me to DEVELOPERS for boot/opensbi. It is separate so it can be
dropped or taken independently.

Tested:

 - The external platform path is what builds OpenSBI 1.5.1, 1.6 and 1.9 for
   a LiteX/VexRiscv rv32 target here; all three boot to a shell on hardware
   (ALINX AX7035, xc7a35t).
 - qemu_riscv64_virt_defconfig builds clean and installs its firmware from
   build/platform/generic/firmware/, exercising the reference platform path.
   The resulting fw_jump.bin boots under qemu-system-riscv64 to a login
   prompt (OpenSBI v1.6, Linux 6.18.7).
 - All 13 converted defconfigs generate a configuration and resolve
   OPENSBI_PLAT=generic.
 - An old-style configuration setting BR2_TARGET_OPENSBI_PLAT="generic"
   converts to BR2_TARGET_OPENSBI_PLAT_REF with the name carried over, and
   sets BR2_LEGACY as expected.
 - check-package, check-symbol, check-DEVELOPERS and the checkpackagelib and
   checksymbolslib unit tests all pass in Gitlab CI. The defconfig jobs could
   not run there: they are tagged saas-linux-large-amd64, which is not
   available to a free-tier fork.

Richard Vodden (2):
  boot/opensbi: allow building against an external platform
  DEVELOPERS: add Richard Vodden for boot/opensbi

 Config.in.legacy                        | 18 ++++++++
 DEVELOPERS                              |  3 ++
 boot/opensbi/Config.in                  | 55 +++++++++++++++++++------
 boot/opensbi/opensbi.mk                 | 16 +++++--
 configs/andes_ae350_45_defconfig        |  3 +-
 configs/hifive_unleashed_defconfig      |  3 +-
 configs/hifive_unmatched_defconfig      |  3 +-
 configs/nezha_defconfig                 |  3 +-
 configs/pine64_star64_defconfig         |  3 +-
 configs/qemu_riscv32_virt_defconfig     |  3 +-
 configs/qemu_riscv64_virt_defconfig     |  3 +-
 configs/sipeed_lichee_rv_defconfig      |  3 +-
 configs/sipeed_lichee_rv_dock_defconfig |  3 +-
 configs/sipeed_licheepi_4a_defconfig    |  3 +-
 configs/spike_riscv32_defconfig         |  3 +-
 configs/spike_riscv64_defconfig         |  3 +-
 configs/visionfive2_defconfig           |  3 +-
 17 files changed, 103 insertions(+), 28 deletions(-)


base-commit: 0e94f8d4de7b5421d5c0d21e22122a444c632770
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
