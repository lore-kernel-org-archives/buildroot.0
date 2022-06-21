Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B6DC433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Jun 2022 21:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3A4241A20;
	Tue, 21 Jun 2022 21:11:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3A4241A20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xdy8KZfsUdw4; Tue, 21 Jun 2022 21:11:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFFFB41A1A;
	Tue, 21 Jun 2022 21:11:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFFFB41A1A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D836E1BF2F3
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 21:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C00E88402E
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 21:11:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C00E88402E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4mftHiEArV-z for <buildroot@lists.busybox.net>;
 Tue, 21 Jun 2022 21:11:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DD6784028
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4DD6784028
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 21:11:50 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id ay16so10720972ejb.6
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 14:11:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qhNx56ykIPmbVGoPLQ6ONZ7W5gyjpmrSAQYN2leFFPs=;
 b=CLliinwEXhnSKLXoM4P5MD57ox8c3vbMGa7WMTMXyk0E0H9BKmkILc9QvyK/N7f/Ea
 hYltIbsDcfNPPn9AMX16FxUiaviOuRTHgljYlFnwEynXwn/IbOqvPYEyk43cExeLcADv
 KarozdlKwV/ssiJ8KQUKV4gFAEudAHy13oOlz7gTRBA6Rk2dkpsODFtgyoXPLVVcoVFb
 d92CH0plcfJ3UJmYJzfHDpkdloAPq9RDHQAyQSo8MiTya0SrV4yj4oUmWlOaipCNaqov
 ZQNYdS69+rJA/EM1zvhsGKeNQmY1WSROSoPrtbbrQiGkYL46ApBJ9l80VQpO3EcYzLqM
 Gv1w==
X-Gm-Message-State: AJIora/fipKKAwPBE2ZaNe44a2JMDP47XC7Kk4Q+jlDTGK0Ls+YjyTHE
 j/cdUCRs0AD5Op6TMDmCWg4fazcIhHuTsw==
X-Google-Smtp-Source: AGRyM1u9YjQYDkrMSuiLM8+jqWjFYvsR9YY9sSsQ2QRGCR4GGlEhMBbuXtfwaMHi3DkI6V/sjfmhNA==
X-Received: by 2002:a17:906:7a1b:b0:712:237d:8562 with SMTP id
 d27-20020a1709067a1b00b00712237d8562mr48215ejo.446.1655845909297; 
 Tue, 21 Jun 2022 14:11:49 -0700 (PDT)
Received: from angelo-ThinkPad-X270.. (host085115199111.static.fidoka.tech.
 [85.115.199.111]) by smtp.gmail.com with ESMTPSA id
 q11-20020a056402518b00b004307c8e1c3fsm14095227edd.34.2022.06.21.14.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 14:11:49 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 21 Jun 2022 23:11:50 +0200
Message-Id: <20220621211150.2043933-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qhNx56ykIPmbVGoPLQ6ONZ7W5gyjpmrSAQYN2leFFPs=;
 b=mAVzoJkuvW5Wz2M6TCHsOGdt3nTkZl4dpeU8Aka4W3ZYtjKB7bxAp/ZO2STyLzqJY0
 RcxS786QEhuyCV3Bq5CSOf0wgvXd4rlwcNt+pWu7UULg0MIJ/V07AC5LPnp3drE6D51V
 WSjXbNQuALCUcbLEQrwGatEJoGWseIu5Ofmr4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=mAVzoJku
Subject: [Buildroot] [PATCH] package/cups-filters: bump to version 1.28.15
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/cups-filters/cups-filters.hash | 2 +-
 package/cups-filters/cups-filters.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cups-filters/cups-filters.hash b/package/cups-filters/cups-filters.hash
index 50f755488b..d05cce3734 100644
--- a/package/cups-filters/cups-filters.hash
+++ b/package/cups-filters/cups-filters.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  3265017d2369e1130e732090165d6b4e3c0838d7ca9aa60978b087bee12247ff  cups-filters-1.28.12.tar.gz
+sha256  614e053404bb833f78e1edf077f7759d27e475a212eb9a3bd3eac2cfec8bb6c1  cups-filters-1.28.15.tar.gz
 sha256  38192ffdaca98b718f78b2d4abc38bb087f0bbcc9a16d212c98b903b985f900f  COPYING
diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index f8ff42f0f4..976549e65e 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_FILTERS_VERSION = 1.28.12
+CUPS_FILTERS_VERSION = 1.28.15
 CUPS_FILTERS_SITE = http://openprinting.org/download/cups-filters
 CUPS_FILTERS_LICENSE = GPL-2.0, GPL-2.0+, GPL-3.0, GPL-3.0+, LGPL-2, LGPL-2.1+, MIT, BSD-4-Clause
 CUPS_FILTERS_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
