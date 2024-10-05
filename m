Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7E8CFB420
	for <buildroot@archiver.kernel.org>; Sat,  5 Oct 2024 16:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7958A60ADA;
	Sat,  5 Oct 2024 16:59:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TaLHEdzdEJ26; Sat,  5 Oct 2024 16:59:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54A91606FF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54A91606FF;
	Sat,  5 Oct 2024 16:59:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A03CD1BF29C
 for <buildroot@lists.busybox.net>; Sat,  5 Oct 2024 16:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B6D0405AC
 for <buildroot@lists.busybox.net>; Sat,  5 Oct 2024 16:59:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kp3lCO1C9z_B for <buildroot@lists.busybox.net>;
 Sat,  5 Oct 2024 16:59:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::136; helo=mail-il1-x136.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 88BE8405AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88BE8405AB
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 88BE8405AB
 for <buildroot@buildroot.org>; Sat,  5 Oct 2024 16:59:07 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-3a27599274eso8442335ab.0
 for <buildroot@buildroot.org>; Sat, 05 Oct 2024 09:59:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728147546; x=1728752346;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O1mi518jVEATaCqDlNHKcRawsOHz433uSarVE6Wugn4=;
 b=o4oa7x95JXKHjnuC1Qu2lM2Hx7mdUVW85mle3T+vcHMuI+HiIXOgVlPxmKd/2qYzH2
 bWuUZzuU+ghe67AbsP2mA0wXOlGjzd9Uhk9v9WxRXYLeuLSakrUNjeNN/75WoP5c/s9y
 jRN7cyRSi9QvCTh4RyOCG6RaTl61Y3nKFStZnkK8W8c9u8V4MJtmBIws2nUd1lAQsS6M
 ae2aEAIKDtpm+v6jLw52JfYF+j2lt5dlSE6gq5qi9uWVlsMFjSWY30A9papC7Xf6BYcd
 NsDWY4U6Mze+T2lNHLPKB5GQ52a7DR6CO+UpWBXmR6j+3M+QM0t04K0udj/mbvnPfXLf
 d9dw==
X-Gm-Message-State: AOJu0YyVXU7RL84cO/OWWQJUo90jEMG+EURgsFA4NIt/T+1w4oEMt0Ao
 kVoON2bIkrUsDx+14+0GNiED0MsNSbMKJzvKR/RJHtjJIGVXElpe3owva8Ew
X-Google-Smtp-Source: AGHT+IHQnDK3Ytmrz+jmPPz1o6789RHF6DlVGXsZr2sLZrtnr88Y7BKFBlOrC7/69SmnrhmdqlNxew==
X-Received: by 2002:a05:6e02:144d:b0:3a2:7651:9867 with SMTP id
 e9e14a558f8ab-3a375a9e4b0mr53076065ab.13.1728147546356; 
 Sat, 05 Oct 2024 09:59:06 -0700 (PDT)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net.
 [207.191.210.45]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4db6eb56bb9sm467941173.61.2024.10.05.09.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Oct 2024 09:59:05 -0700 (PDT)
From: Brandon Maier <brandon.maier@gmail.com>
Date: Sat, 05 Oct 2024 11:58:45 -0500
MIME-Version: 1.0
Message-Id: <20241005-dtc-1-7-1-v1-2-89550f828a4c@gmail.com>
References: <20241005-dtc-1-7-1-v1-0-89550f828a4c@gmail.com>
In-Reply-To: <20241005-dtc-1-7-1-v1-0-89550f828a4c@gmail.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728147546; x=1728752346; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O1mi518jVEATaCqDlNHKcRawsOHz433uSarVE6Wugn4=;
 b=LgHWh6X+UCUAEgFsjqKE7UafmUDUSqoLOaYiq/aKfeVNpP4pj33tnMFN3Xb/fNi9i6
 vZI89momsUA3JGp8J3EixsGoWeo4+qh/aM9zk/wr5eF+moktL+u4Gq4t8yEnIRE5N2rZ
 2vinUqSQMzdHXd0Mvk2LHHZCJoefXjFbXof7MD/7uiRg9DSwJx05SQpliu1fe49CYhMR
 Y4rseu6LW+z9XnCF3lO6IhnkUODxV2QUQQOJ0aZOAgDwwcMFpBfTWphwZ/0BLcPPARQf
 H59mEtTAdSJdRd+tvQmvr6qRAqWxqZC+K9Ykot3bVDmhyD1j/sbvPsvidX0ln60t0iUS
 ABCQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LgHWh6X+
Subject: [Buildroot] [PATCH RESEND 2/2] package/dtc: update to dtc 1.7.1
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
Cc: Brandon Maier <brandon.maier@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://lore.kernel.org/linux-devicetree/ZsBvsq5pVv9xEPmp@zatzit/

Signed-off-by: Brandon Maier <brandon.maier@gmail.com>
---
 package/dtc/dtc.hash | 2 +-
 package/dtc/dtc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dtc/dtc.hash b/package/dtc/dtc.hash
index 5856156f008871558b72dba4a847d360f9fd163b..325a80880918146ec2bf08da0d2d0b1813acdc64 100644
--- a/package/dtc/dtc.hash
+++ b/package/dtc/dtc.hash
@@ -1,5 +1,5 @@
 # from https://www.kernel.org/pub/software/utils/dtc/sha256sums.asc
-sha256  29edce3d302a15563d8663198bbc398c5a0554765c83830d0d4c0409d21a16c4  dtc-1.7.0.tar.xz
+sha256  398098bac205022b39d3dce5982b98c57f1023f3721a53ebcbb782be4cf7885e  dtc-1.7.1.tar.xz
 
 # Hash for license files
 sha256  78e1e1ce5728a990d59c7de61d4741c49185d5129daf783b386380a214328d68  README.license
diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index 5868ae0e5a818e9d92dd577991e1cc4d1cc25924..ce5ea05da7882fcd0affaacdb73654db2168cbc6 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DTC_VERSION = 1.7.0
+DTC_VERSION = 1.7.1
 DTC_SOURCE = dtc-$(DTC_VERSION).tar.xz
 DTC_SITE = https://www.kernel.org/pub/software/utils/dtc
 DTC_LICENSE = GPL-2.0+ or BSD-2-Clause (library)

-- 
2.46.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
