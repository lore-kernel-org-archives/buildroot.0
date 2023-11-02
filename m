Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE621C4332F
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 21:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D5E6416E4;
	Thu,  2 Nov 2023 21:11:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D5E6416E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vb0btzKVTz0G; Thu,  2 Nov 2023 21:11:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BD684028D;
	Thu,  2 Nov 2023 21:11:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BD684028D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A4C1F1BF59C
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 21:11:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DCE984F7F
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 21:11:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DCE984F7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R0LNpSkd1VNg for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 21:11:44 +0000 (UTC)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD35084F75
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 21:11:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD35084F75
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2c50ec238aeso20105121fa.0
 for <buildroot@buildroot.org>; Thu, 02 Nov 2023 14:11:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698959501; x=1699564301;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4tdxnqdk5xwpPLDUW8GMJ99f4FQyWD8jFEVuEMt7CBc=;
 b=W7jRjkY1T48FY5xAaziV71BYWo233ody/0nn8v2vHkE7ppdSufhvL0I0/S0yskhlb3
 Y4bc1PBxJIcWlivTBQ1GnkIIcZZP8ctBneOoADHR8P2UZCf+tp9DXHyXzugUh0kGC8xJ
 zlJ9yMowUtb4Lmynt+9j6Pawsxlhzua+u/fZwg5q97iwMzKcH+5sa8xziYSErBClV/yh
 HK54oLGuqEmzxo0GRkLbSYCQWaNZiqHbC6hUYGg74BA7hPO59x40ge+YpKYORSNyVa7b
 ihIC5uVD02YmBUX4aNpBD3X5o4JNFswWKgW7WRiisZupwO+vD9AjBCWtfHicuEzUpjng
 7e8w==
X-Gm-Message-State: AOJu0Yym6lw75HLurXS87S5izITEyTaLKkIlqD3cxcWNNjLSBcWtYDoT
 ja7tVzIf9LoYq+jiXixPp1w4SWc6lIc=
X-Google-Smtp-Source: AGHT+IFKzaW0MpQ+Szs1EMgu5E9l+lC0ZMq9wVCdkDY6JRhNwylPtxMFIWq3cbC4XVxfgquxm3Gnug==
X-Received: by 2002:a2e:9dd9:0:b0:2c5:2475:f848 with SMTP id
 x25-20020a2e9dd9000000b002c52475f848mr16016961ljj.15.1698959500303; 
 Thu, 02 Nov 2023 14:11:40 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 k25-20020a05600c1c9900b004067e905f44sm324958wms.9.2023.11.02.14.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 14:11:39 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  2 Nov 2023 22:11:36 +0100
Message-ID: <20231102211136.8412-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698959501; x=1699564301; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4tdxnqdk5xwpPLDUW8GMJ99f4FQyWD8jFEVuEMt7CBc=;
 b=EIi7GuU+g8UB8WBuegxaVrKST0Z2i5Cf30fVUm6H0rdoG41Yu2wLr97Rit8wAd8Vce
 aGdrnKNy1As5/9Enofe2k+kx0OM/HFxtR94y0aTtl2/M0WpHVyg0y6Ac5IqUpYQYjGT3
 jGhbu1Njd8L7CccHQrSVa+EDL4+Pnnqe4DJQWV6YwfXcRkb+/9Nmp58lcU1RC4m6TmsU
 n+YNHKR11LfK+iuVWA0gJJ7cqpNTe+o6UUSKGAR3SfXeWYG6tzMf3NtEQHvTq+xLC4vB
 OxWdtyc5qOchepQME+HJivBuNloajDFLlGW4uzZcewK+UkyoqeM0CwMSB3Gpd0eDoXPa
 Pn4g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EIi7GuU+
Subject: [Buildroot] [PATCH 1/1] package/python-tftpy: fix legal info
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Colin Foster <colin.foster@in-advantage.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since the addition of the package
in commit 8dd5390be6b210eaac1bf02af2fea84d4c87dcd1:

>>> python-tftpy 0.8.2 Collecting legal info
ERROR: No hash found for LICENSE.txt

Fixes:
 - http://autobuild.buildroot.org/results/9e12e0cd81bdf1a09884a340ca809c194e4dba9b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-tftpy/python-tftpy.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-tftpy/python-tftpy.mk b/package/python-tftpy/python-tftpy.mk
index 829bd08b96..fd3c601496 100644
--- a/package/python-tftpy/python-tftpy.mk
+++ b/package/python-tftpy/python-tftpy.mk
@@ -7,7 +7,7 @@
 PYTHON_TFTPY_VERSION = 0.8.2
 PYTHON_TFTPY_SITE = $(call github,msoulier,tftpy,$(PYTHON_TFTPY_VERSION))
 PYTHON_TFTPY_LICENSE = MIT
-PYTHON_TFTPY_LICENSE_FILES = LICENSE.txt
+PYTHON_TFTPY_LICENSE_FILES = LICENSE
 PYTHON_TFTPY_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
