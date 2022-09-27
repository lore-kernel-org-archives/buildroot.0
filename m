Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65CE3C07E9D
	for <buildroot@archiver.kernel.org>; Tue, 27 Sep 2022 10:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4CD261060;
	Tue, 27 Sep 2022 10:58:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4CD261060
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yDnmFj_75w99; Tue, 27 Sep 2022 10:58:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E746C6105D;
	Tue, 27 Sep 2022 10:58:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E746C6105D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C926C1BF297
 for <buildroot@lists.busybox.net>; Tue, 27 Sep 2022 10:58:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A94894049C
 for <buildroot@lists.busybox.net>; Tue, 27 Sep 2022 10:58:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A94894049C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n6nEdd07NInp for <buildroot@lists.busybox.net>;
 Tue, 27 Sep 2022 10:58:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 733434046D
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 733434046D
 for <buildroot@buildroot.org>; Tue, 27 Sep 2022 10:58:18 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id x18so14382076wrm.7
 for <buildroot@buildroot.org>; Tue, 27 Sep 2022 03:58:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=HiwvasMFNRHnBHHKaKQtjR3Gqw5Jpi15t6rwN0RyHaw=;
 b=7yCYUeiYcLpFK2q9Jb9mC+Yri4LpX6amkdmrRSxKCTeDhhIt5CbSkayM6IheFIbIlG
 U0JQNczrUTLBMzZIciFeAWsxpk3UNKIHUCjs/XvC1aWHyjctsIo/DlywturEciRZ0UgQ
 cviLTis87sllePyUPc4bFPKsiKAr/sK1gxRMfHc/EA27nAmEUAUkLWqzXLuMID4BTNdr
 Wwp5UMVPU0qnUOO0imtH1FT2GcxZ53sP0Z1+RfDMfgrimkPSmeOpXQkKP857EaPM7mCc
 XWAMdestmqAG9gPx/jBWj05nTcBhFM2Bx+8xK93+kd+3fLabs8ENLW2q5wiNj7qrXrol
 +z2A==
X-Gm-Message-State: ACrzQf0iHul4kPSK1bCyb+KZ1kGBybgm76ggDGWVAY5lkEA+blyriJSK
 AE4NnhIRAMyMbuwsKnNOmCCwIhH/4AyXDw==
X-Google-Smtp-Source: AMsMyM6/yjggI9yIquRtV1fAnMaAPWHxPkQw6En3IsodkFR0UWD0jJagtguv1HzNAu9Y0eSfq0pIhw==
X-Received: by 2002:adf:e904:0:b0:22c:be06:5001 with SMTP id
 f4-20020adfe904000000b0022cbe065001mr1484228wrm.400.1664276296440; 
 Tue, 27 Sep 2022 03:58:16 -0700 (PDT)
Received: from centennial.enunes.eu (ip-78-45-66-209.bb.vodafone.cz.
 [78.45.66.209]) by smtp.gmail.com with ESMTPSA id
 g14-20020adff3ce000000b0022af9555669sm1734230wrp.99.2022.09.27.03.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 03:58:15 -0700 (PDT)
From: Erico Nunes <nunes.erico@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Sep 2022 12:57:52 +0200
Message-Id: <20220927105752.760729-1-nunes.erico@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=HiwvasMFNRHnBHHKaKQtjR3Gqw5Jpi15t6rwN0RyHaw=;
 b=S+uy4JkPfRuD/v52tT9pt9htCAD0NFaaaeUYGeBZFj8SAKHOlQVYtqwAOx34NflDe2
 QD5SgmJRPS3LT4hEfJA2904m/WYsaGUL/pSR3SuevKBUF6gjNJGDNy1tUsv/4Fd2qQEM
 us/X4/L/xn5JVBYzNim2nwgvZsquLXLSL6gydtUBDLKDiJT8ADHU1VG6nZBex5uVgEh8
 RdlNjYeywNfO97YAO1uXGSzZO00b4ySlnG2dVzWvSkcpp5GpYaSrXzvf+BCSFZGnf0qd
 97DX++5YJeQFl4whFD30j7N2uXEIeXklSpcpx4EVJzabbJ5nyeq40EUaloS9tA/D/DYm
 Zjkw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=S+uy4JkP
Subject: [Buildroot] [PATCH] package/acpica: bump to version 20220331
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 package/acpica/acpica.hash | 4 ++--
 package/acpica/acpica.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/acpica/acpica.hash b/package/acpica/acpica.hash
index a2fdfe602e..4b6981c602 100644
--- a/package/acpica/acpica.hash
+++ b/package/acpica/acpica.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  8a49904744a8159b7f325ed941b56968ba37a0371c634036628064f97538de4b  acpica-unix2-20200717.tar.gz
-sha256  cb17c679d3291eba1a70a1336062fb07eec2e839b0821b443b24f41de18c5218  source/include/acpi.h
+sha256  1ccda5c6a08a90b145777df635eb09f995b3472b3128f375009c5a6b01a04c7a  acpica-unix2-20220331.tar.gz
+sha256  c7c5facde0edec64ce403043082a4b288543b9a120d86a23bba3be7585e021aa  source/include/acpi.h
diff --git a/package/acpica/acpica.mk b/package/acpica/acpica.mk
index 21ecc155be..9901c1ed48 100644
--- a/package/acpica/acpica.mk
+++ b/package/acpica/acpica.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ACPICA_VERSION = 20200717
+ACPICA_VERSION = 20220331
 ACPICA_SOURCE = acpica-unix2-$(ACPICA_VERSION).tar.gz
 ACPICA_SITE = https://acpica.org/sites/acpica/files
 ACPICA_LICENSE = BSD-3-Clause or GPL-2.0
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
