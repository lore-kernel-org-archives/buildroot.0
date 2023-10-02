Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7603BE784B6
	for <buildroot@archiver.kernel.org>; Mon,  2 Oct 2023 14:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D22461261;
	Mon,  2 Oct 2023 14:31:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D22461261
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e9w2-4hgJmeQ; Mon,  2 Oct 2023 14:31:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D35F60F8F;
	Mon,  2 Oct 2023 14:31:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D35F60F8F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0700C1BF947
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 14:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4EBB6106E
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 14:31:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4EBB6106E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zCwFHEdFiJXQ for <buildroot@lists.busybox.net>;
 Mon,  2 Oct 2023 14:31:29 +0000 (UTC)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6F94860A9B
 for <buildroot@buildroot.org>; Mon,  2 Oct 2023 14:31:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F94860A9B
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-99c3c8adb27so2363161166b.1
 for <buildroot@buildroot.org>; Mon, 02 Oct 2023 07:31:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696257087; x=1696861887;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FFF9vEOnlLVKYHMTCWIdHhBTwmSoFYhyfSbN2MOxu8Y=;
 b=jtfAYdTbrnh9NhC3lww37kR7+8s7/a8Hw2EfTORpnm7Ofy1tEFTU3PKSmJS1sPlHMj
 IPVi6I1bXvs9Tft6LMA9Xf1+s48Bgs4c7xCBmSS42vgHluq3lrBnDVdjhXzMD/W8u45m
 P3M2tplI9Dbmkj6synpkMxe8sXZEqfud8b4l+kctJSuidMEkVuQHfppl/f5qTc5IXMTg
 n5+aGpmZTcfCd7JFKBaJAr7eRvOwbHmynuNfqCKwVrxCeHtohHjk9veXwBA7puaneiZj
 GCESaeJPkwIqUaQchsHzvcT/H7quIF/hDBILHqCQvm2Yw91F75Ce3FopzciHuLrozWGT
 rPAw==
X-Gm-Message-State: AOJu0YxiHRThzHpxNHA8p7jtWFr6UGih63FumtyEkVv1xGn3T/KLh4lY
 Z+ujc7b9nFRnNZoNzR7WQErB0kIRZ+8DguByO5mpXcJr
X-Google-Smtp-Source: AGHT+IHwrJbeD5PSP7XcTHkPojOCvW76VWAIRrF3od/9wMOjZWZbWKlsWZJd9fgMkL7D22FxmBrcgg==
X-Received: by 2002:a17:906:51:b0:9ad:e101:3f9e with SMTP id
 17-20020a170906005100b009ade1013f9emr8417229ejg.39.1696257087310; 
 Mon, 02 Oct 2023 07:31:27 -0700 (PDT)
Received: from fedora.. (146-241-223-149.dyn.eolo.it. [146.241.223.149])
 by smtp.gmail.com with ESMTPSA id
 n19-20020a170906165300b009a1c05bd672sm16917735ejd.127.2023.10.02.07.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 07:31:27 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  2 Oct 2023 08:31:21 -0600
Message-ID: <20231002143122.257820-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231002143122.257820-1-adam.duskett@amarulasolutions.com>
References: <20231002143122.257820-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696257087; x=1696861887;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FFF9vEOnlLVKYHMTCWIdHhBTwmSoFYhyfSbN2MOxu8Y=;
 b=RDaq+YFw1oVTkNhzNvRxY6e9yB+mYadWPKd0hpM7/0qv+qqm65YAJvaUbbWt+XmxY0
 GU+V4Qeea7dxeWYrJxeG+L7jbvIHg0Nbn+FDjA41zvOYymQJbHizn6wFu2FcuBYphtEv
 wzxuNXLyqaTSCbKuNQRdrwNCn5LFFsW67uFRs=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=RDaq+YFw
Subject: [Buildroot] [PATCH 3/4] package/flutter-pi: bump version to
 d62e84350d2869b3ec1dfb1af21bfe234c4b817f
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-pi/flutter-pi.hash | 2 +-
 package/flutter-pi/flutter-pi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flutter-pi/flutter-pi.hash b/package/flutter-pi/flutter-pi.hash
index f7148963a4..6cd7116cd7 100644
--- a/package/flutter-pi/flutter-pi.hash
+++ b/package/flutter-pi/flutter-pi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e4af79c8f53c15913f52a83a221f099a2a750d023a0bc4560d0db6f15def79a2  flutter-pi-d62e84350d2869b3ec1dfb1af21bfe234c4b817f-br1.tar.gz
+sha256  1fb5f4faebebd8b78294aae05eb9a57c3ca80228972d7ffe1f5b9dfc264cfb0e  flutter-pi-4e9b44bcb332547c05b728687edf895847eb0aa9-br1.tar.gz
 sha256  b34df9d3e1b4e5d1ba70b1740ec74b69f1189b44efd0c96b898b074ef8db1c70  LICENSE
diff --git a/package/flutter-pi/flutter-pi.mk b/package/flutter-pi/flutter-pi.mk
index 27f140c177..dc825c95a2 100644
--- a/package/flutter-pi/flutter-pi.mk
+++ b/package/flutter-pi/flutter-pi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_PI_VERSION = d62e84350d2869b3ec1dfb1af21bfe234c4b817f
+FLUTTER_PI_VERSION = 4e9b44bcb332547c05b728687edf895847eb0aa9
 FLUTTER_PI_SITE = https://github.com/ardera/flutter-pi.git
 FLUTTER_PI_SITE_METHOD = git
 FLUTTER_PI_LICENSE = MIT
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
