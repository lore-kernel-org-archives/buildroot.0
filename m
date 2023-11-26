Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24982C4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 22:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEC4C60C0B;
	Sun, 26 Nov 2023 22:57:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEC4C60C0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SIdiX2mf4Ki8; Sun, 26 Nov 2023 22:57:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3124160C06;
	Sun, 26 Nov 2023 22:57:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3124160C06
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CBF5F1BF215
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 22:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3A6140191
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 22:57:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3A6140191
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Xz8HD8cc6Ip for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 22:57:23 +0000 (UTC)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D78340017
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 22:57:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D78340017
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3316a4bc37dso2329014f8f.2
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 14:57:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701039440; x=1701644240;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=772pwUM0UWL+9vRhEHSBAHcsIu1EXfbTr7pdVPLeFhM=;
 b=D5zuiMVLu/Mp7e0/py3cH0iCC8ac0mqNc1BPIboIt5uZee76b860aX6WxesiznHRIJ
 zOLTRkBFR5xFqWleWeMBx93iYFm5dq1fwhq5mOiiEXrIR3LhxpJSbOuZXONqvkU2qHRQ
 NdJYQ2jn0YyT8Nqj79CMQRvSuyudFUb2jyEqgk1oyl4FOAiofHWBrils7N0pTTKnR+C/
 IbK7vXJGugqA/nX7WkiTCR9EsdL+QFzYulyohKHxzP/vMMYyu7rYGaXz1HuhWnr1yY28
 TDwrrVYwUFkjVBjOMtwx1oa3c6MNlV3bibVkPq7QCja/f4rkQHZqPLBq2HhTjbgXRxct
 TcGQ==
X-Gm-Message-State: AOJu0Yx2tygTMrOZzLxqPlDtR9PrY/fLXwVbrHKYb2wJDiMmFJaCRXKd
 FrYL5Da0Zy34JF30OKpWqnDT9sdRitA=
X-Google-Smtp-Source: AGHT+IEULkz2xjU3Gwz54JYMKCX3mur+WfLUkeUTU2foQu6BDuHGuNDSBmu0FT07Ew2NoRcBTjPtJw==
X-Received: by 2002:a5d:470d:0:b0:332:e134:aaad with SMTP id
 y13-20020a5d470d000000b00332e134aaadmr6948724wrq.65.1701039440552; 
 Sun, 26 Nov 2023 14:57:20 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 j15-20020adfff8f000000b00332f02123d2sm5363621wrr.54.2023.11.26.14.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Nov 2023 14:57:20 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Nov 2023 23:57:17 +0100
Message-ID: <20231126225717.326858-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701039440; x=1701644240; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=772pwUM0UWL+9vRhEHSBAHcsIu1EXfbTr7pdVPLeFhM=;
 b=Yvvi2mj5qK/KMe2A+qE7rywAYdFbimsFHhXqhZBUeQQWQQubzLh2/LOn0ZTWG/0Erb
 Z9gye8mlE2pqw/6hJ/Mqsf0cMBOc2WK85ZJXLQS/XXX3pyTutDLLwdc2UOL3YB9J3jbH
 Ddc9ce4srK/zr18yiZOXMZxN8mc8BpHfuOxXI2BZRDt5iw5JQAQD7/S4BAqFQ41sqGJV
 ppmfYOMqauAC0vNRj16KMVuYSB3OqmaR9ib/XpcitLDCzJ6pUgKQprIzTvtQctdUeQsA
 weAfbKQcP9d5Jfs2TTmCgwfDsDlLNo/eWvTVo/Yrbxy2LrKpmQVXtXgGWyuIRLiBJYqo
 y2cA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Yvvi2mj5
Subject: [Buildroot] [PATCH 1/1] package/exfatprogs: add
 EXFATPROGS_CPE_ID_VENDOR
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:namjaejeon:exfatprogs is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/F174A846-F275-4AD8-A0E3-6D0CEFDFF308

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/exfatprogs/exfatprogs.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/exfatprogs/exfatprogs.mk b/package/exfatprogs/exfatprogs.mk
index d755c7a214..fcc9ff0788 100644
--- a/package/exfatprogs/exfatprogs.mk
+++ b/package/exfatprogs/exfatprogs.mk
@@ -9,6 +9,7 @@ EXFATPROGS_SOURCE = exfatprogs-$(EXFATPROGS_VERSION).tar.xz
 EXFATPROGS_SITE = https://github.com/exfatprogs/exfatprogs/releases/download/$(EXFATPROGS_VERSION)
 EXFATPROGS_LICENSE = GPL-2.0+
 EXFATPROGS_LICENSE_FILES = COPYING
+EXFATPROGS_CPE_ID_VENDOR = namjaejeon
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
