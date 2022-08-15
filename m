Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B900C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 09:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EEED60F1B;
	Mon, 15 Aug 2022 09:07:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EEED60F1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nBUNOe4dNmNs; Mon, 15 Aug 2022 09:07:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A40E60EB8;
	Mon, 15 Aug 2022 09:07:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A40E60EB8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9C8C31BF3CB
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76332415DE
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:07:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76332415DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s1mOObokTkXd for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 09:07:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 209614097D
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 209614097D
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:07:47 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id w5so9844182lfq.5
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 02:07:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=TPYx++e9hYHT3HQtPTfNoe43EdeseYewiw3LMkOFk3Y=;
 b=QeS/nZFeIMAIC3zIvmnQxp23yUh9j4sCS/aQAxkqmHjmzUjBRtb1Nm4N71y+lgU4f8
 X+cTPyoGmZGd0FhFFp5I0azTWxZYaVYxcpCdNJafiowozaaXs2F+xMqAxGTAkVajcubB
 RDWk2bUIOqGiQkr9NttY4A0I+gw6rc6fukR/BdIgSNjJXkk3mEuie4aLpC8w2wOJkyf6
 eE8uxbNHcFz9oXiILgbA1v2Fp+ZaRBvqIVm0b0Ifwa6nKySZxtq85M5OgoQLcDrz7+fo
 xox0zwsv9389FqGZ1mucoHsVEE+fcW6QHe3FnUisVPcuketmEEVLAGxDSVJecjz8O7Ax
 BzlQ==
X-Gm-Message-State: ACgBeo2lFDMCGaj1GJucr8FQWjeUepp7wqXz/kRwKWqlO4dWgCZZz2p+
 CrQkb+QmXIZZBjSDhDJFuHp047RYOfg=
X-Google-Smtp-Source: AA6agR6+THhB7aXwDckaBDU9R0vEHdkDcQbZD583g2xbDcXOSHmcYDhkuDS3/rEQkg7M5hX69BvwgQ==
X-Received: by 2002:ac2:5cc5:0:b0:48d:ab8c:c1d8 with SMTP id
 f5-20020ac25cc5000000b0048dab8cc1d8mr4874517lfq.504.1660554464303; 
 Mon, 15 Aug 2022 02:07:44 -0700 (PDT)
Received: from gimli.addiva.ad (a124.broadband3.quicknet.se. [46.17.184.124])
 by smtp.gmail.com with ESMTPSA id
 bi33-20020a05651c232100b0025e8492e918sm1359718ljb.41.2022.08.15.02.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 02:07:43 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 11:07:36 +0200
Message-Id: <20220815090736.79798-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Organization: Addiva Elektronik
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc;
 bh=TPYx++e9hYHT3HQtPTfNoe43EdeseYewiw3LMkOFk3Y=;
 b=VN9qfEjmf+mB48mv+ru/iFSHT/nhUMOgoYleqXxQFco99M0uDkOhAsDTfFonorM/Uq
 CkkSBAA1lg0VB/AF64O0S6iBTrG1qm2O5kDItM96HejJx+nIXcTKfiLniZ12V79WrgjF
 xPpbloTjse06C3JVG1kg0RLPBen+JgYZDcLT3OyKP4AS6KZTbRDHQw2POwQt8yX531Dd
 T9wLzYfb7fU1EfvKUDIq97erLlWxJnz47uWFvs863UAgRgHiv2yBWwZp2TV7VG1o0b1y
 ceLVi4N2rJPVjL6vnrKeo0ixSWeotpFCYZxykEOifSAXmTE0Zj+PqldG2DhHAYxG6bXL
 6tkQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=VN9qfEjm
Subject: [Buildroot] [PATCH next] package/sysklogd: bump to version 2.4.4
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Only one change compared to v2.4.3, fix for running `syslogd -T`, which
should use local time for all remote messages, but time is always logged
with "Jan 0 00:00:00".

https://github.com/troglobit/sysklogd/releases/tag/v2.4.4

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/sysklogd/sysklogd.hash | 2 +-
 package/sysklogd/sysklogd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sysklogd/sysklogd.hash b/package/sysklogd/sysklogd.hash
index 6ddfcf16cb..e370716bd9 100644
--- a/package/sysklogd/sysklogd.hash
+++ b/package/sysklogd/sysklogd.hash
@@ -1,5 +1,5 @@
 # Upstream .sha256 from GitHub
-sha256  58cbf7e82b3ee0f0ac2433192737dbb317656ff6eed0317490821b2a4532aa34  sysklogd-2.4.3.tar.gz
+sha256  01f25931d1508c3e6be4e182f49356c993abc7d035d5835db35f9b61d5085549  sysklogd-2.4.4.tar.gz
 
 # Locally calculated
 sha256  7a71d7603a7c4456df441463e54da35acf151c1be0879246de63544f1f34f477  LICENSE
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index 393482305d..68023c9ae2 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSKLOGD_VERSION = 2.4.3
+SYSKLOGD_VERSION = 2.4.4
 SYSKLOGD_SITE = https://github.com/troglobit/sysklogd/releases/download/v$(SYSKLOGD_VERSION)
 SYSKLOGD_LICENSE = BSD-3-Clause
 SYSKLOGD_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
