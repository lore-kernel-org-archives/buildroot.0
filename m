Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 811ABC4167D
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 09:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AEB3A405AD;
	Tue, 22 Feb 2022 09:49:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kNhV2RbJiOwu; Tue, 22 Feb 2022 09:49:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E098405AA;
	Tue, 22 Feb 2022 09:49:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 502421BF2B0
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 09:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CF68409A3
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 09:49:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t7ziVtELZJ74 for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 09:49:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 54F804099E
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 09:49:19 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id m3so29529738eda.10
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 01:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hXtoic3fq9gIRIXxlWlGnzpL+WPoOHo8pMSwknIpHkE=;
 b=diHY15p+T27JB7CBKteYx4YVCTcHggaor5YCEdFhoFRRjDk6O2Rjus8DP4tTfRMQg3
 K40HHI5WjAclRJEvjPXDPVtfiyAHNJvMwTOx7vqUqxVIoEmddds2A/zbbyIj9sRSro+/
 gvPuUYjImalT0aPaw7XVZEdEsOT8wRpavDzGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hXtoic3fq9gIRIXxlWlGnzpL+WPoOHo8pMSwknIpHkE=;
 b=H9DM7aK8wwxdJsQqtRmuWJo+XHPDbQQpR3qKU15Zn2WHrr3QN3wy+vVIqrGKcO8p1p
 IfxMm51YypODM6RFpSIwdJJBot3x+qJ5EIhG2Z8fQOAU2AAWq5bQQuOMrIp9qSrvt/kC
 23BTm8uHFy1XGdh0L8+5+X6eOuvTUuSgKXrkSgjMyXR78ipuTI3BCexMLicRr2G12kXe
 RZmri7B+vwfLFmvOs1eJfA7pwpbdVR6YjbDz0rmlugoKBDJ5HIM0k2dvdcE/yj5JhkU5
 6Bx/68G3dhSatY8qA4yF/TvNXP3Ek0bFZ6VbG0j430CyoQ5HJ6dVcAf9n1LTdRuj/IEU
 ZMvA==
X-Gm-Message-State: AOAM531a4kG6pPPWjNYUd8B8TayzZqOe04/Sx5rnZWVpOuZMk6A68G7p
 GNVcHrtPefdCM1K7X3o59LycuiptxDvMag==
X-Google-Smtp-Source: ABdhPJwJsvkawdloBKs+TkRJXDTJ03le/rPRJ4SvWHn2IbBWAoKjUkvQurLxg3o3bYyFd+soeEb9IQ==
X-Received: by 2002:a50:fe08:0:b0:40f:932a:47b0 with SMTP id
 f8-20020a50fe08000000b0040f932a47b0mr26077251edt.64.1645523357494; 
 Tue, 22 Feb 2022 01:49:17 -0800 (PST)
Received: from localhost.localdomain (host185127038042.static.fidoka.tech.
 [185.127.38.42])
 by smtp.gmail.com with ESMTPSA id a29sm4162469edm.54.2022.02.22.01.49.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 01:49:17 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 22 Feb 2022 10:49:13 +0100
Message-Id: <20220222094913.2217366-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/cups: bump to version 2.4.1
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

NOTICE hash is changed due to a copyright year update.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/cups/cups.hash | 4 ++--
 package/cups/cups.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cups/cups.hash b/package/cups/cups.hash
index b0e3654b3d..8308b7b803 100644
--- a/package/cups/cups.hash
+++ b/package/cups/cups.hash
@@ -1,4 +1,4 @@
 # Locally calculated:
-sha256  9abecec128ca6847c5bb2d3e3d30c87b782c0697b9acf284d16fa38f80a3a6de  cups-2.4.0-source.tar.gz
+sha256  c7339f75f8d4f2dec50c673341a45fc06b6885bb6d4366d6bf59a4e6c10ae178  cups-2.4.1-source.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
-sha256  a2a46d024e4d78dd2475d89f2f3d905578edfeca7dcb041e1d0ba079d9a87b48  NOTICE
+sha256  7a7bd639e3a8457ae40b0dcfb74ea3cc6a8132b06c726142e993625d33eb6de5  NOTICE
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index e406d3bc64..298a6ed879 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_VERSION = 2.4.0
+CUPS_VERSION = 2.4.1
 CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
 CUPS_SITE = https://github.com/OpenPrinting/cups/releases/download/v$(CUPS_VERSION)
 CUPS_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
