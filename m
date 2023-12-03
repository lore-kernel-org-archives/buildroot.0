Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00107C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 14:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8430D60F1A;
	Sun,  3 Dec 2023 14:20:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8430D60F1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TlTELNlpszB2; Sun,  3 Dec 2023 14:20:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF60560F15;
	Sun,  3 Dec 2023 14:20:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF60560F15
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A2B641BF47D
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 14:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78FCC60B98
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 14:20:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78FCC60B98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wa7duPQtC9M5 for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 14:20:21 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 66AD560F15
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 14:20:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66AD560F15
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40c09f4814eso4454475e9.1
 for <buildroot@buildroot.org>; Sun, 03 Dec 2023 06:20:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701613218; x=1702218018;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AaCeefvgIOCur3gzzIf5bcHULzp0NQtUFwnVHgnKYBA=;
 b=ZJ0r2GsRI4MUUPSaK6mYMVmKuUDvguqSuQD3IIa9W96vc6sM18GmlBvJlhW0yYICov
 xOIUjuc2/wBgij2qXIFaSV0Kbg9OINa48lrVJkA8rxB5PEL7xGN2kbtGkQytkwha+FkX
 H16S+USjzMLA74brHqtcfdMDkYJH/aBXJqsT6IJU5U1bhBV/sg1f6opjcmvnA8Uo/jiC
 Lwjnsg3W4in9JklFavTQx5yfUJgepZlxzRTgIdrEDqF2FmCqh9ckaHUWH6VA7KJVVo68
 1XKiAnBAX3LF6ZT2JaVOVGcCzje1H968p2AhEmi3of8ONrI+cMkubbZGUUFr0NvMKB+/
 0rNg==
X-Gm-Message-State: AOJu0YxwU7QJYGhsSS74kmple1pccveack0MBuyjdzTThRSh7O7LovyG
 j9UFkXjigXdMw+1qQzU/rpJMOytujM0=
X-Google-Smtp-Source: AGHT+IHXg2gmPq71eOXc1tExEuGY3Fpc3qTEFDCoePLWMy/uWRzfl285uEAaXX6LqPMlNxlDohKJbw==
X-Received: by 2002:a05:600c:198b:b0:40b:5e1d:83aa with SMTP id
 t11-20020a05600c198b00b0040b5e1d83aamr1735230wmq.62.1701613218282; 
 Sun, 03 Dec 2023 06:20:18 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 v15-20020a5d4a4f000000b0033328f47c83sm8338489wrs.2.2023.12.03.06.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 06:20:17 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Dec 2023 15:20:11 +0100
Message-ID: <20231203142011.1407103-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701613218; x=1702218018; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AaCeefvgIOCur3gzzIf5bcHULzp0NQtUFwnVHgnKYBA=;
 b=Gb3ijHQYMQ9L0TlpVDPX80PVm0pdzTBrH0iNSe63ZZRfe3cZ0NRMBhRhx7TpX5gDQl
 4kTENgBDUqK1Q+TNN6/xAjuy+8rjMoqm8zgvdezKaSQoQUpMI3l/evZjrJrlmSFRPsyl
 /lTTuvRt9cNMEnqNVR+koe6tx3JjWmaRFrBpBRn8xgzpIDIR5w1fDIC51qw1sWvcxAq8
 qRGVhR2ph+rRZv3antAgk4Ozwc3kljnssp0OjdzV+ELbZYo9/kg38ffhX2T5dRJg04sI
 4RjiQDOsxG36QRGop1NA3XRsRiIugMyQmLQ5XwVXOJ7M7YjDdGxgQ6sX1mAgOX8UKveh
 cIXQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Gb3ijHQY
Subject: [Buildroot] [PATCH 1/1] package/libde265: security bump to version
 1.0.14
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2023-43887: Libde265 v1.0.12 was discovered to contain multiple
buffer overflows via the num_tile_columns and num_tile_row parameters in
the function pic_parameter_set::dump.

Fix CVE-2023-47471: Buffer Overflow vulnerability in strukturag libde265
v1.10.12 allows a local attacker to cause a denial of service via the
slice_segment_header function in the slice.cc component.

https://github.com/strukturag/libde265/releases/tag/v1.0.14
https://github.com/strukturag/libde265/releases/tag/v1.0.13

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libde265/libde265.hash | 2 +-
 package/libde265/libde265.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libde265/libde265.hash b/package/libde265/libde265.hash
index 168b5db395..9bb3f20a71 100644
--- a/package/libde265/libde265.hash
+++ b/package/libde265/libde265.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  62185ea2182e68cf68bba20cc6eb4c287407b509cf0a827d7ddb75614db77b5c  libde265-1.0.12.tar.gz
+sha256  99f46ef77a438be639aa3c5d9632c0670541c5ed5d386524d4199da2d30df28f  libde265-1.0.14.tar.gz
 sha256  02cc1585a20677992e0ba578fa692635dc193735f2691dc81de924b51c4e8020  COPYING
diff --git a/package/libde265/libde265.mk b/package/libde265/libde265.mk
index 208fa24e27..8624d2f949 100644
--- a/package/libde265/libde265.mk
+++ b/package/libde265/libde265.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDE265_VERSION = 1.0.12
+LIBDE265_VERSION = 1.0.14
 LIBDE265_SITE = https://github.com/strukturag/libde265/releases/download/v$(LIBDE265_VERSION)
 LIBDE265_LICENSE = LGPL-3.0+
 LIBDE265_LICENSE_FILES = COPYING
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
