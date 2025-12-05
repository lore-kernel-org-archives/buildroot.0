Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2CED2CDE6
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 00:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E03E409C9;
	Fri,  5 Dec 2025 00:30:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cSWbdv8DkkZ9; Fri,  5 Dec 2025 00:30:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44644409CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764894618;
	bh=L8wqLT/QD+JFfH0Zh4sVxNxEhY/RSpd5ZuQnjuE0oP8=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=PW4+ciGqyb9jVMm7lcIZl7SbLF/Vkx6b21y0dZRwTG8JQM1fNuN/sh1xBwgH0A2cY
	 2RKhbapVVhEnaa8auCpWe+1AbXBM8FHJ3aJeGBMivmcxCkQJSIzm9cHvRK3hyih3n+
	 ZCgzlOa4gNpxgrWw2P8rqrlCLZO0C9/YBY4dPQWOWmHXFP/9of7SBg6Qjy4RUUx2i9
	 2EGw4aVnsCwYU50hpZu2MEgAb4pP5ZSJadmlHdhbN0xVfUFOZedI+0Vr4vU4EvlC/Q
	 Hf4N5dwHAut9CkNaBEfvxOJVJOaumUDeqgua150BZsAQS1RJpYiq7KRRzEG84JOLK3
	 DmrFSlDcCXO2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44644409CA;
	Fri,  5 Dec 2025 00:30:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D8FEE7
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 00:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0162681911
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 00:30:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FkA-yq4QkSXP for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 00:30:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c64; helo=mail-oo1-xc64.google.com;
 envelope-from=markus.mayer@broadcom.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2175B8176F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2175B8176F
Received: from mail-oo1-xc64.google.com (mail-oo1-xc64.google.com
 [IPv6:2607:f8b0:4864:20::c64])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2175B8176F
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 00:30:15 +0000 (UTC)
Received: by mail-oo1-xc64.google.com with SMTP id
 006d021491bc7-656d9230ceaso515532eaf.2
 for <buildroot@buildroot.org>; Thu, 04 Dec 2025 16:30:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764894615; x=1765499415;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iZCIngbl83kM6y3txgJdRCHRSSGBlDIKIcIFjqHHZss=;
 b=hY+1mvITVuVEKAmd4SsIG3dXPz3rlfokxA9tG+9RyQrd+hAk+4a6EKTddNcLrhUYtG
 uyZeDpRuK54QOD2WgMYwkAROf/Lz5FN1J5bYDGsvQEJxFlDC+VCGvKDE2sWjO1Lhfamg
 IEaN9drfMuAOXh01TNAZjb9rjzflsohY6XYXNHRKl+rnMfqcly2r1a7HFEFiKQO42nXB
 w89oB2VGmdj+DX2XbWpqlgYtHVsIsSbehDUOLg2cFT8CXPwEwobfgYL0l3QSoTRfea1L
 3K9tDQdPDDqBfoQGCG4JggQCsBfnqgu/2NZrpLb/vn691AEJyDVVqhqhbLN22PfgO0Bo
 bgcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9bMOlQYz+xPlR8em+aZbf1M8Pu2Wes0yu5pd9kv1yRRc9iePy51HgfJ1uIsuEaf9Uw7hjeocDOu4=@buildroot.org
X-Gm-Message-State: AOJu0YzXDv/7Q3KJ2mh9by4pc77+ggo5SaMCzff05jbvH10D28jDMs7M
 5U4X9KALTSKwFR4WhP077I7hv+bAT9eohPYXGTG879piraskDSCuT7NEh85YRLVGycfR3GtyxSC
 P6ad213MZltEW+ubQWVa+fdHyyr5IX8XW3JM9NN36Le6mVbE0yrtZU9iLErUHL2p+I0Lvb5MluF
 6bzKQICL+pGuDmIWZyYb04rMcECLfFJqdIEt+YUTSsYPI/sqVkqZBSTBsZMVU/o87dCLElByb4G
 LKOxplzgjrvcgQ=
X-Gm-Gg: ASbGncv4BH/pLT1SbhnLrGnVmGus+2fmaV7WEIPRvmiP1u2KNpTpLk5tk1FchljxUUI
 qAWkJ1H6ceMxlKW7NSWuKqmwOFPFZix3xVxo60oobzjfVxb0t36IPpwybV2qh07ig5zmmNf8bP5
 R0jFjoWmN0pLDuWRmmsCL9CDO8FxkGghhJK20w5TyL9sgyuJIhQcCnUVtsThKgMTduPDdWRZdTb
 ZVYBC4Eekwu5DoJ0uzYb/9Nv03Xm6I68q2kEGkI3Vd3p3Jjy6f9jsxzCWFu3bhjFvGnqiClt04g
 rDbOkbev59b110le3uCQ5PlnEDryaa0Bb4tAq9AXwubqlU9L4sV75RUHHI8HreBIiycllECY2B3
 g8Q1+eUBB4Gxp0Xqd4vBf+KbS8KHVIhW1kMcINC7kXLn7HkkP/++OxN0V/jY8pvFUzmdURaZ6zP
 s7Oz9ljMS1GIppJ9A09fb41w2T/EgNAtcmF3V4uNRJf1NWDsk=
X-Google-Smtp-Source: AGHT+IFpbRT0ls5uWJjcLy7jdX4wfdAXlXedvjac8+Kf487lSdPk4SFPv6YtFY1zNprmYhSTph6TA+JxO/vz
X-Received: by 2002:a05:6808:1454:b0:43f:63cc:aed9 with SMTP id
 5614622812f47-4536e51a1a8mr4584187b6e.31.1764894614676; 
 Thu, 04 Dec 2025 16:30:14 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-103.dlp.protect.broadcom.com. [144.49.247.103])
 by smtp-relay.gmail.com with ESMTPS id
 006d021491bc7-6597ec5b5dfsm257324eaf.3.2025.12.04.16.30.14
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Dec 2025 16:30:14 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ed6ceab125so35524181cf.1
 for <buildroot@buildroot.org>; Thu, 04 Dec 2025 16:30:14 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVLYlr0BCQTIbwjYQFIy3xRK8LBUmZKAdiIrHrPg4oPhnKtxSvkjUvFpTdTo3FTBfm1T4bNYJRR7S8=@buildroot.org
X-Received: by 2002:ac8:7d4d:0:b0:4e8:846e:2d8b with SMTP id
 d75a77b69052e-4f017544b2fmr104685191cf.28.1764894613718; 
 Thu, 04 Dec 2025 16:30:13 -0800 (PST)
X-Received: by 2002:ac8:7d4d:0:b0:4e8:846e:2d8b with SMTP id
 d75a77b69052e-4f017544b2fmr104684781cf.28.1764894613296; 
 Thu, 04 Dec 2025 16:30:13 -0800 (PST)
Received: from lbrmn-mmayer.ric.broadcom.net ([192.19.161.248])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4f027d588fdsm16964181cf.32.2025.12.04.16.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 16:30:12 -0800 (PST)
Received: by lbrmn-mmayer.ric.broadcom.net (Postfix, from userid 1000)
 id E72BC2A; Thu,  4 Dec 2025 16:30:10 -0800 (PST)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Markus Mayer <mmayer@broadcom.com>, Julien Olivain <ju.o@free.fr>,
 Bernd Kuhls <bernd@kuhls.net>, Buildroot List <buildroot@buildroot.org>
Date: Thu,  4 Dec 2025 16:30:03 -0800
Message-ID: <20251205003008.153577-1-mmayer@broadcom.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1764894614; x=1765499414; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iZCIngbl83kM6y3txgJdRCHRSSGBlDIKIcIFjqHHZss=;
 b=VBDCqrJXN2vUAFTcjfSZHfTFb3oMtEQ+YKGGNfFDq3aWsxKiBQJMwt00twXgyNTzNU
 ZPc1IIP/o4IuaTAPfIiIktNqXMWCyHF8fZYVOaU6H8JboV3WtFAwpnOaS2HNHSCcGct0
 CJ+gQAyjRQQRZ7H9SVaRLv3kqhj/mSdqZ+Ofk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=broadcom.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=VBDCqrJX
Subject: [Buildroot] [PATCH 0/1] package/e2fsprogs: fix fsverity build error
 slightly differently
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
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <mmayer@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is the follow-up to the mailing list discussion at [1].

The only thing I undid about Thomas' patch was to remove
0001-configure.ac-check-for-FS_IOC_READ_VERITY_METADATA-a.patch

The change to e2fsprogs.mk remains with the comment slightly tweaked.

Please feel free to adjust the commit message if needed.

[1]: https://lists.buildroot.org/pipermail/buildroot/2025-November/790482.html

Markus Mayer (1):
  package/e2fsprogs: fix fsverity build error slightly differently

 ...ck-for-FS_IOC_READ_VERITY_METADATA-a.patch | 103 --------------
 .../0001-lib-add-kern_compat.h.patch          | 134 ++++++++++++++++++
 package/e2fsprogs/0002-Generated-files.patch  |  63 ++++++++
 package/e2fsprogs/e2fsprogs.mk                |   4 +-
 4 files changed, 199 insertions(+), 105 deletions(-)
 delete mode 100644 package/e2fsprogs/0001-configure.ac-check-for-FS_IOC_READ_VERITY_METADATA-a.patch
 create mode 100644 package/e2fsprogs/0001-lib-add-kern_compat.h.patch
 create mode 100644 package/e2fsprogs/0002-Generated-files.patch

-- 
2.51.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
