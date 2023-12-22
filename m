Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3C9C4706F
	for <buildroot@archiver.kernel.org>; Fri, 22 Dec 2023 20:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCA6F6F5F6;
	Fri, 22 Dec 2023 20:53:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCA6F6F5F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PIIZtU3JkyUC; Fri, 22 Dec 2023 20:53:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A48660D79;
	Fri, 22 Dec 2023 20:53:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A48660D79
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 408511BF831
 for <buildroot@lists.busybox.net>; Fri, 22 Dec 2023 20:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24D8C4016F
 for <buildroot@lists.busybox.net>; Fri, 22 Dec 2023 20:53:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24D8C4016F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ASeKIzvmSgX for <buildroot@lists.busybox.net>;
 Fri, 22 Dec 2023 20:53:32 +0000 (UTC)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6BD4A400D7
 for <buildroot@buildroot.org>; Fri, 22 Dec 2023 20:53:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BD4A400D7
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5545139bed4so1216287a12.2
 for <buildroot@buildroot.org>; Fri, 22 Dec 2023 12:53:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703278410; x=1703883210;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uUMAXbv3D5PBfiS2rOgHDuAAY2RvauQYphSNNZcKreQ=;
 b=KZsCoqrm8bGONDtucJb1iaqfZwLwCMiEERzcxC0s2SNiOtu16DNFuQe9XCrOy1T+05
 FoetDIdJx19y8aWDS5HURw2VAdQwmW5RAhjdza3GNvWDvOh26ViUqr2ohXm6xpnYqQ4E
 DQjbh20lswC2dRaCtJlHiRAYbpEp58zYI/52nCYdl9FREjYA4Z3z6W6cUTsjiJgsn+SL
 Owd7BoG4n/wb4aBuCUrcQip/6vUlh49sE/1z5kQL7u7Qd9eribuDMDjnEnFv6KgOFjp/
 /WCYDdYcSYdBdTLbsSpOGQofMIOKA5+MP6USoaw7w8RBQC2UJ1c0RjvwvcSaiq3uidxd
 hC1w==
X-Gm-Message-State: AOJu0YwT1pN3Yku3isB0lrb57V6zOV6/i8SzNYAYIapEnPZI9YD5ti89
 YFPrDG1rGmeucnrcOKBKu5SL6v/EF4bBFw==
X-Google-Smtp-Source: AGHT+IHQsoyd0tCoP68oAyZzkpnUJkrnv/nhyr8vr3D85a0+CW31dMPSbsSDjYXCzxieQLrLM6NGRQ==
X-Received: by 2002:a50:baad:0:b0:54b:b32a:bc35 with SMTP id
 x42-20020a50baad000000b0054bb32abc35mr1244315ede.35.1703278410112; 
 Fri, 22 Dec 2023 12:53:30 -0800 (PST)
Received: from localhost.localdomain (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 fg9-20020a056402548900b00552691fc7f9sm2952606edb.66.2023.12.22.12.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 12:53:29 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 22 Dec 2023 21:53:20 +0100
Message-ID: <20231222205321.5588-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703278410; x=1703883210; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uUMAXbv3D5PBfiS2rOgHDuAAY2RvauQYphSNNZcKreQ=;
 b=dPcceqOTkmOArWz8POQ6dY17yACzrD/pK6yzzioQ4ulrn3R4uj/GVYsrm0nX/2sUKZ
 1y5VZUxHWwR9X3msrR7V1pyr6x+NXxe1mWarC33y+40HdJlE9jkTZBXY6sz8sn5NRzxY
 H6h9emtYkMgRz7g+rN0YeWu2++B2PH9UingzMBrUetWUlI/ns6aojOpVRK2SMp9zAOqX
 YHmsJc8kTzxtd+3TZAUd3SX3jWciWV9CcxH0DDrIVZ4SoBoZiaryZlkoEBkA7m/Gvg+A
 gtx7lDU/JYJVPaMaKf4Yw8R8zuTKZy5jK+d1ZbNzYKiMP0v/xRGOnrQfACyOtuxhhk7T
 /PjA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dPcceqOT
Subject: [Buildroot] [PATCH 1/2] package/iputils: bump version to 20231222
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
Cc: Petr Vorel <petr.vorel@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/iputils/iputils.hash | 4 ++--
 package/iputils/iputils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/iputils/iputils.hash b/package/iputils/iputils.hash
index ea23f27f3c..c2f6a40797 100644
--- a/package/iputils/iputils.hash
+++ b/package/iputils/iputils.hash
@@ -1,5 +1,5 @@
-# https://github.com/iputils/iputils/releases/download/20221126/sha256sum.asc
-sha256  745ea711fe06d5c57d470d21acce3c3ab866eb6afb69379a16c6d60b89bd4311  iputils-20221126.tar.gz
+# https://github.com/iputils/iputils/releases/download/20231222/sha256sums.asc
+sha256  e3ce5e1a1f795c2d520985463b90e20f9388b7060796d54ad64509aa8e4af775  iputils-20231222.tar.gz
 # Locally computed
 sha256  2c9f29d982c48665c30b3adaf400c048988fd256eb91c691e351eb3b6a8b2036  LICENSE
 sha256  9acc4bc871a4742550158e3696dcb381953172ef808d04ca248184f9f6322712  Documentation/LICENSE.BSD3
diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index fe4468ec19..783ed9a0e7 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -11,7 +11,7 @@
 # and IPv6 updates.
 # http://www.spinics.net/lists/netdev/msg279881.html
 
-IPUTILS_VERSION = 20221126
+IPUTILS_VERSION = 20231222
 IPUTILS_SITE = $(call github,iputils,iputils,$(IPUTILS_VERSION))
 IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause
 IPUTILS_LICENSE_FILES = LICENSE Documentation/LICENSE.BSD3 Documentation/LICENSE.GPL2
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
