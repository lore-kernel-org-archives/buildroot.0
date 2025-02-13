Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2521DC0219D
	for <buildroot@archiver.kernel.org>; Thu, 13 Feb 2025 14:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBE9083A58;
	Thu, 13 Feb 2025 14:58:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tu9v2xOvaGd5; Thu, 13 Feb 2025 14:58:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF07683A5C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF07683A5C;
	Thu, 13 Feb 2025 14:58:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B702CC2
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 14:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B302083A71
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 14:58:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CLwM3Dpw8iUX for <buildroot@buildroot.org>;
 Thu, 13 Feb 2025 14:58:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B2F4183A50
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2F4183A50
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B2F4183A50
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 14:58:06 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-307c13298eeso9804911fa.0
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 06:58:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739458684; x=1740063484;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uDOTyg6tsd3Mlu2pUm1+Yrv7X/H1L7uvgx8Ivl0PyDk=;
 b=ffuAallJRdskCGAgl4K8keoVykzie4iar6G+q9m7tugmK9DdFWJwFl7YOWYYjJsIld
 HR/wKzgrrk/aBbwXhNW0geW6QSZNehUWogrxbkvumtUsY4+cUBl/Ob8ujt8wVqJ10jlk
 vOLIIr4bYzU1f2qYTA0Ayod0ObTU2yRW2mJsi9R7XZVFcAfSJJDC0pQyXZJGw/suFLVc
 9qnMIw9KKBhw74dx3R1QgitM5eRQ/UKNmMZtUt7vyGh4Rxv4Iz9igQQMeFnymMgRWnPW
 6/QZFx8frIPB/xSWEA/4AxrZiOs08KxXqhWF8qV/SnW8pa4LZRACEa5VZMk9E0/9DhVV
 BaCg==
X-Gm-Message-State: AOJu0YxHy6HyJ6nRjJJUi2Sy/4TvX5o8aiMoav83BayHJe3Ppyiq+poW
 NE/aKDyuKDH3/YOkDSLzAbihG9G0gm5CPWEanqlTfivLY2nrgVQOZ/f5ajrl
X-Gm-Gg: ASbGncvWy/mRGpr3y7SRzV2EzjdlPwFnBZtfErAomQJOpN794ku55wt6CNOlUYBcAgh
 Qp85oNs+hop+4PqTj9lQyPXvrgMdo2PqLZMNq0mytsa2lg2xB1XHCgHqYwz8EiPrMQiB2FloItA
 33APfQjvOpPKtKJF+6myN3FJTwYC4j8mm1aGYo8IaVZ0n10V5vV3b0KmZF5dzWGzWleEATepv6N
 2/lgS6jcw5BRPTE6VeDNSBZFkqzmzbZTcisVEUxOQHdbeyIG9gf3o/BMOZNuRdzjTIS/UbmW9mM
 xRRaox5NfIhU9ExY0ZP+OW+YFH7V2Uv6Qy7VHW2EcDCUTw==
X-Google-Smtp-Source: AGHT+IEEw3CeGM24Z8a0lRM30Nx2Kdyq9vv5zynFcZQLuHYBf5V9rhX1gCvbUXfB18qUJHWLDHxDBg==
X-Received: by 2002:a2e:8887:0:b0:300:17a3:7af9 with SMTP id
 38308e7fff4ca-3090f3bee24mr9691781fa.19.1739458684325; 
 Thu, 13 Feb 2025 06:58:04 -0800 (PST)
Received: from precision7530-arch-roy.lan ([79.161.254.156])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3091029be88sm2094681fa.96.2025.02.13.06.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 06:58:02 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Andreas Naumann <ANaumann@ultratronik.de>, Baxiche Su <baxiche@gmail.com>,
 Christian Hitz <christian@klarinett.li>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Date: Thu, 13 Feb 2025 15:57:42 +0100
Message-ID: <20250213145747.639358-3-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213145747.639358-1-roykollensvendsen@gmail.com>
References: <20250213145747.639358-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739458684; x=1740063484; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uDOTyg6tsd3Mlu2pUm1+Yrv7X/H1L7uvgx8Ivl0PyDk=;
 b=ioGOtZU65IPlhi7mm+dXSEMBEMIYLWAF7gXzAP0mnVQtrZdCNjOmGOjisJtZ38d1Mf
 6VIUEuILEkLziONXFMaGIVJ0uV1/WxrlpaVv7F9CEWJdk7A+S+3IdeP0xNgvxeuYtEP0
 anUYBasu/bgAMHJ29UEIyDNC34OkGyAHPwLTTNArYnHwRTiXqyovyCgCJ2eDp4MelCJE
 VYzuwIez9jUowfxwmozvdJsq+j/luRzJ2GE5Z4YVJS7bWQLRZ4YUFv5aP3c8enI9QPQ9
 k0qTbUbhAGjb1+wGlRYesmYEVri8yY3DaC9IU0UaXoT3Tv/usJw8DDVr8tISRkBIetp4
 rgIw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ioGOtZU6
Subject: [Buildroot] [PATCH 2/4] package/qt6/qt6multimedia: fix legal-info
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

Fixes:
legal-info failed, since some files in LICENSES/ were removed.

The license files were removed after version 6.8.1. So no need to backport this fix.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6multimedia/qt6multimedia.hash | 8 --------
 package/qt6/qt6multimedia/qt6multimedia.mk   | 8 --------
 2 files changed, 16 deletions(-)

diff --git a/package/qt6/qt6multimedia/qt6multimedia.hash b/package/qt6/qt6multimedia/qt6multimedia.hash
index 61be3ee44c..af9ab62621 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.hash
+++ b/package/qt6/qt6multimedia/qt6multimedia.hash
@@ -2,21 +2,13 @@
 sha256  34f561fdc07b158bcc4ad040b596fc6086c48908060e854b473b557e4feb1569  qtmultimedia-everywhere-src-6.8.2.tar.xz
 
 # Hashes for license files
-sha256  f32fb3b417a194167cfad068223fc975ba96c5960513a10f66a3c28720aec1df  LICENSES/BSD-2-Clause.txt
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
-sha256  1f1b677d26ab73e159a55c3a914cf12d888e18a9d0d469fedab4aa6e5a48b1c0  LICENSES/BSD-Source-Code.txt
-sha256  84c6ef3ea9e3254a54d0acf5d3e0c61ae011b8fef7dd6940591cf060e6380a8f  LICENSES/BSL-1.0.txt
 sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
-sha256  7658542977bfdced9e1059a6c934ce4281de76d103b831007b825917dc62511a  LICENSES/IJG.txt
-sha256  f2ec607f67bb0dd3053b49835b02110d5cd0f8eb6da3aac4dc0b142a6b299be9  LICENSES/ISC.txt
-sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  LICENSES/LGPL-2.1-or-later.txt
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
-sha256  b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0  LICENSES/MIT.txt
 sha256  66a3107d5ad6a058aab753eaac2047ccb2ed0e39465dd0fe5844da3e300d5172  LICENSES/MPL-2.0.txt
 sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
-sha256  bfb1112d49db5b1daecdfef24bd7e2f3ea0bafb33aa67aa0ab51e2bf8407c03d  LICENSES/Zlib.txt
 sha256  85da7c29c2d2f2e6b3116b1219584cb513474cab797b3312a779be4c2181e51e  src/3rdparty/eigen/COPYING.BSD
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  src/3rdparty/eigen/COPYING.MPL2
 sha256  8b69cf3ac3ddd34df478c4ae6eaacf5e6c63ea7ee6403c8dad97e4d1438bc3c4  src/3rdparty/eigen/COPYRIGHTS
diff --git a/package/qt6/qt6multimedia/qt6multimedia.mk b/package/qt6/qt6multimedia/qt6multimedia.mk
index 517b1fccb4..9ba574645c 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.mk
+++ b/package/qt6/qt6multimedia/qt6multimedia.mk
@@ -13,21 +13,13 @@ QT6MULTIMEDIA_CMAKE_BACKEND = ninja
 QT6MULTIMEDIA_LICENSE = GPL-3.0, LGPL-3.0
 
 QT6MULTIMEDIA_LICENSE_FILES = \
-	LICENSES/BSD-2-Clause.txt \
 	LICENSES/BSD-3-Clause.txt \
-	LICENSES/BSD-Source-Code.txt \
-	LICENSES/BSL-1.0.txt \
 	LICENSES/GFDL-1.3-no-invariants-only.txt \
 	LICENSES/GPL-2.0-only.txt \
 	LICENSES/GPL-3.0-only.txt \
-	LICENSES/IJG.txt \
-	LICENSES/ISC.txt \
-	LICENSES/LGPL-2.1-or-later.txt \
 	LICENSES/LGPL-3.0-only.txt \
-	LICENSES/MIT.txt \
 	LICENSES/MPL-2.0.txt \
 	LICENSES/Qt-GPL-exception-1.0.txt \
-	LICENSES/Zlib.txt \
 	src/3rdparty/eigen/COPYING.BSD \
 	src/3rdparty/eigen/COPYING.MPL2 \
 	src/3rdparty/eigen/COPYRIGHTS \
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
