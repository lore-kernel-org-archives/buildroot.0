Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65957CAC597
	for <buildroot@archiver.kernel.org>; Mon, 15 Sep 2025 14:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03BCF60E5B;
	Mon, 15 Sep 2025 14:24:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fh0pTmBOAvGF; Mon, 15 Sep 2025 14:24:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3867F60E67
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3867F60E67;
	Mon, 15 Sep 2025 14:24:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FEC21F7
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 14:24:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55E804119D
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 14:24:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IyfyP0c7SbIz for <buildroot@buildroot.org>;
 Mon, 15 Sep 2025 14:24:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=kazemi.ms@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8279640D2E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8279640D2E
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8279640D2E
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 14:24:27 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-afcb7a16441so640802966b.2
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 07:24:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757946265; x=1758551065;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0dgqFR8hLvmkqxR5yViCUi1+IQ4RIEFaTP2B9UWY09g=;
 b=WN6By5DOl9CExKu5uU2s6C1i8dCunf+XWeV1d8MAkz9T/e2pR9/v/J48AmYR1CU/6+
 VZUkSSosaJKIyExjOZx8nLX/4LYwYxhVPA2LuhxR+Bg30dEBHFykqkgobyVNJoJyIsSj
 Jfd+/xjmybOs0yiVSS4oRvNAgoMoWxaZX3EP4ngK4v3k9+9QY23YLi5VEeBsSE8qRqHw
 oqk31mAcq1FxdFALZVNEBv0i7LtVuSJR4/cgqPU8LwGJI7Oe9AJc4NWrGXT+OMx+7Jlm
 d19GfTAKf3Du5UF0AVmRkQi1idouScx3UuEZ8DtgtReR6pAVuOSkJHtIBiDofcaCMjtx
 taXw==
X-Gm-Message-State: AOJu0Yz5N+LHH5NfPqlzw7TKmghPZNFUjIh6vTtpg5ttgX2G+6Nm3jSh
 MSFZeU+NC0341s6hvRGqOfNjYYixD8+Sqa/kLZo4F3knblaPi2WmwtCbmex174YJ
X-Gm-Gg: ASbGncvYO+DjyUErjPW1PJa8Oi4n0R7WXlQ2c5k+M+/5g+vDet71Mhm6814cqK17Mfo
 79SYZBM11y8YWxiRn2m07tjV605+4/W2Yw5N/m0kOQtIyZ3gu5p9i8ydihe+pCYLl1kVPSLyHlh
 fNGEjPuSJQCZKsQtljyRyStH8F3TTuTnOXyVIgtTT/6cijMLKUgnunitFVaA7lBUoy4mZqc1sZ0
 7AF0LkVlM1v9i2uCipN2nGGfBC4jMJMPmhH/iDSeOqpeDy7VbcwQkPgaiX3uYeyZ7p9j3FV0KrQ
 moUPxTYInVkaIE/ZrBRpL9N/6rS+nzVa2v73BViBzWipuw+tjgZ8mMdtFGrDwm2LNbsFTB0k66/
 VjHUYPgDdtlYGyYngcFfWpiuvNk+H9PdkVLa4olUcoe2hp2GAcAmTOpFTm49cz754dE2TpU1Q/m
 7BqX6G0H+LNYyo8Ry5Q5rRQsgJjQi8hp2YDGtdNf1SfcccSEbNNKWowa4TigzQ9kfUCUOLtyfnU
 0GhrTOTalQ3v/w8CLIXRRdG
X-Google-Smtp-Source: AGHT+IEEX7wvxhU1WRDPdQNpeOSq69BzjQCgHWfmcqHBBs4LDcGCBkEomayt6OZTJVvfb/447F1gVw==
X-Received: by 2002:a17:907:3e21:b0:b04:6cf7:75d4 with SMTP id
 a640c23a62f3a-b07c365eb87mr1296867466b.49.1757946264961; 
 Mon, 15 Sep 2025 07:24:24 -0700 (PDT)
Received: from saeedkazemi-ThinkPad.home
 (2a02-a450-7a0e-0-d307-416a-de81-9106.fixed6.kpn.net.
 [2a02:a450:7a0e:0:d307:416a:de81:9106])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b32f1e3csm965479966b.80.2025.09.15.07.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 07:24:24 -0700 (PDT)
From: Saeed Kazemi <kazemi.ms@gmail.com>
To: buildroot@buildroot.org
Cc: Saeed Kazemi <kazemi.ms@gmail.com>
Date: Mon, 15 Sep 2025 16:24:22 +0200
Message-ID: <20250915142422.3421361-1-kazemi.ms@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757946265; x=1758551065; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0dgqFR8hLvmkqxR5yViCUi1+IQ4RIEFaTP2B9UWY09g=;
 b=hZXPSBtTLk8wLjM4zR72yDeI4xiSJwSgLt09sgCDvHe68n4JVXeyCsZjFuQSY8YxY3
 Tl+zZQmSqfVfRm43VY1QA02j5pK0NdL2FKQq8C7e94EpPy16OhXmSbAaNQrqFHyc3iUA
 //NEaIbVuIXx5QTGtnDRi8Z1QnKtDvb5zATqvARBaMvrF1M2HsPKcFXEeaPXK7dQWoM8
 0hk+zo6l2HNFWt27gbEmTiti32BE0coJUJbNgTONldmFBXQJvBjakDeSACBWP/WTJLvs
 UDjvTkLAbcJ4Ic9dahuBoo+2Kw0/JXHw+s+dOQPUWLlL5Q+l/g0H0KjZPSGOf0u5Mea8
 muJQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hZXPSBtT
Subject: [Buildroot] [PATCH 1/1] package/zoxide: bump to version 0.9.8
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/ajeetdsouza/zoxide/releases/tag/v0.9.8

Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
---
 package/zoxide/zoxide.hash | 2 +-
 package/zoxide/zoxide.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zoxide/zoxide.hash b/package/zoxide/zoxide.hash
index c6648b94d9..64c1efd277 100644
--- a/package/zoxide/zoxide.hash
+++ b/package/zoxide/zoxide.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  06c7c697582252a8b54f8bd32d77603d3c2f107b8d1e9adee7751dfd31ebfe76  zoxide-0.9.6-cargo4.tar.gz
+sha256  728fbe4e44cb9b4b8bb0753e962e2889619cccdc354ac141d6e26eb2ca8ee9b9  zoxide-0.9.8-cargo4.tar.gz
 sha256  23aa3b08366e4ed6050f3d9950070201802aadbe5675fa1c19f24f4de91cf294  LICENSE
diff --git a/package/zoxide/zoxide.mk b/package/zoxide/zoxide.mk
index bd9a7e2acd..870fc12a2c 100644
--- a/package/zoxide/zoxide.mk
+++ b/package/zoxide/zoxide.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZOXIDE_VERSION = 0.9.6
+ZOXIDE_VERSION = 0.9.8
 ZOXIDE_SITE = $(call github,ajeetdsouza,zoxide,v$(ZOXIDE_VERSION))
 ZOXIDE_LICENSE = MIT
 ZOXIDE_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
