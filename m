Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 311A0C3DA5D
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 20:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2A3180DD6;
	Sun, 21 Jul 2024 20:04:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f6J4MwUE43yk; Sun, 21 Jul 2024 20:04:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB40080DDD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB40080DDD;
	Sun, 21 Jul 2024 20:04:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AA02F1BF32D
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 20:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95CCC80DDD
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 20:04:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nkiomRPMdTCn for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 20:04:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 67B5180DD6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67B5180DD6
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67B5180DD6
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 20:04:40 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-36865a516f1so2402011f8f.0
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 13:04:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721592277; x=1722197077;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZEKvF1lmfM6LbaG9AiDt2+my3oGOWsFmHqUXSoGUwag=;
 b=HGAG0h1H0ReWv51agRvETDR7JOK4WEpmsVcp8VQkTCep0GltdNf5qiu9Si/NRvacsk
 8PfoMyUfLVVeLCc9Fpt2YrMaCRROlpHqjxaGcTnhxU62hoXL3/MZ4Nt+7wGccCfBPGqd
 /f8N3Vqibc1eD8WXgqYTP15V/pLySmqeh6FtyxVezSOAILpm//SeJ6qzuANbPE+Ow140
 9zzhnfOjR/DpU5991Wvp3RxgfnrDdpSSw2e92jDjEjOtLhxD5SZkms9CQDrFKZQjynnm
 8NqxlX1HondkenKbKji+qDurRvWqlxQTLf8UjvPMpu3i0GYMRX/HXgUZyWrB/eh7xJ3m
 uRRA==
X-Gm-Message-State: AOJu0Yys3voOuo6GhI1dPIlYueiqdVtR2334HxtnlChuH7KhBuVXZO/y
 81HcFnmVXSq6p3GJlSnKqNBt29OL85ByiYUoF5+JLvqmPSC/+2eRVtEYOg==
X-Google-Smtp-Source: AGHT+IE4ZMM5SMCb1lijl8gOnvjIG+/1K0n8g3xf2KJKbqjxdhgeDG3oIgxYt25uhRqa7axFbwpBnw==
X-Received: by 2002:adf:e385:0:b0:368:7e54:baaa with SMTP id
 ffacd0b85a97d-369bae3aa5amr3486258f8f.4.1721592277344; 
 Sun, 21 Jul 2024 13:04:37 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-368787cec60sm6662155f8f.79.2024.07.21.13.04.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jul 2024 13:04:36 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Jul 2024 22:04:30 +0200
Message-ID: <20240721200430.3070270-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721592277; x=1722197077; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZEKvF1lmfM6LbaG9AiDt2+my3oGOWsFmHqUXSoGUwag=;
 b=ZHebInGMC79ElfucRA40jWME4KSCb8ywP77Wb8QUB7guaf4iw4kaDqWGOlfxM6bLrl
 I37f83i1L3g5soXZqdQ3xGVfMSNdJzrt4RFndhnZ6Dncc6Gunaq3HYeyo+iFhQFhvA84
 cS5h83/pZIudbMKQ8Mft4UGbavEJl54KCD1J8t40QithRXQ8DX3wtK8PYE/QG60nS2WD
 QgR+AX34je297zDt/mfQ5bNlFhqetYfhze5N1h1jnxuNrF4A9WBE30MQj/di1aeMGD9n
 cdfWshj7gGdB6PuZRAHY/5xXoyvb6dHezNTmgT6jNF3pfaJ2ACg2j2BNKGTWxtghAt9u
 7Tog==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZHebInGM
Subject: [Buildroot] [PATCH 1/1] package/vorbis-tools: fix build with gcc >=
 14
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with gcc >= 14:

codec_skeleton.c: In function 'skeleton_process_fisbone_message_header':
codec_skeleton.c:119:9: error: implicit declaration of function 'utf8_decode' [-Wimplicit-function-declaration]
  119 |     if (utf8_decode(header, &decoded) < 0) {
      |         ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/bb5d56d836e7d0f2a62daa9954878ad6e0b190ed

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-fix-build-with-gcc-14.patch          | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 package/vorbis-tools/0001-fix-build-with-gcc-14.patch

diff --git a/package/vorbis-tools/0001-fix-build-with-gcc-14.patch b/package/vorbis-tools/0001-fix-build-with-gcc-14.patch
new file mode 100644
index 0000000000..a05ce8a584
--- /dev/null
+++ b/package/vorbis-tools/0001-fix-build-with-gcc-14.patch
@@ -0,0 +1,51 @@
+From f4a31fe975ea37537f39ace4420aee893b7e0b1a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 21 Jul 2024 21:57:38 +0200
+Subject: [PATCH] fix build with gcc >= 14
+
+Add missing includes to avoid the following build failure with gcc >=
+14:
+
+codec_skeleton.c: In function 'skeleton_process_fisbone_message_header':
+codec_skeleton.c:119:9: error: implicit declaration of function 'utf8_decode' [-Wimplicit-function-declaration]
+  119 |     if (utf8_decode(header, &decoded) < 0) {
+      |         ^~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/bb5d56d836e7d0f2a62daa9954878ad6e0b190ed
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/xiph/vorbis-tools/pull/48
+---
+ ogginfo/codec_skeleton.c | 2 ++
+ share/utf8.c             | 1 +
+ 2 files changed, 3 insertions(+)
+
+diff --git a/ogginfo/codec_skeleton.c b/ogginfo/codec_skeleton.c
+index a27f8da..f906f8c 100644
+--- a/ogginfo/codec_skeleton.c
++++ b/ogginfo/codec_skeleton.c
+@@ -28,6 +28,8 @@
+ 
+ #include "private.h"
+ 
++#include "utf8.h"
++
+ typedef struct {
+     bool supported;
+     uint16_t version_major;
+diff --git a/share/utf8.c b/share/utf8.c
+index be378d1..e819b67 100644
+--- a/share/utf8.c
++++ b/share/utf8.c
+@@ -28,6 +28,7 @@
+ #include <stdlib.h>
+ #include <string.h>
+ 
++#include "charset.h"
+ #include "utf8.h"
+ 
+ 
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
