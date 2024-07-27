Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55DFC3DA61
	for <buildroot@archiver.kernel.org>; Sat, 27 Jul 2024 13:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43AA440C8F;
	Sat, 27 Jul 2024 13:57:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b5I4oJLTGlak; Sat, 27 Jul 2024 13:57:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DEB640CC7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DEB640CC7;
	Sat, 27 Jul 2024 13:57:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D24B91BF2A9
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 13:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE6EA60703
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 13:57:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KvIu19EoCnFk for <buildroot@lists.busybox.net>;
 Sat, 27 Jul 2024 13:57:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 919CC605F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 919CC605F8
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 919CC605F8
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 13:57:55 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-428178fc07eso1511895e9.3
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 06:57:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722088673; x=1722693473;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XRd/pIzjSRMsrqETkLg0ry4GAkDBUBAvqwhMkHki5h4=;
 b=Pe5rCpECTOgFQ8YWHMXe3zMrOVwoIotmnwOtlpEyrjUD5Y79AyIl/fukA2ALcs6VlV
 2b3lDSLIhgXE303EAM3Jf+qgEVX8mhmFtmeBYSxpV7fFBfcauXhJQB0sviQZ9e9+U4mT
 qUK9lkQmVBBSg+3w+p3k5abUs43MN0LGDDZiCvUPoyWOcKAzmtFy4fr7BIrAa6zX74zT
 MNfWTbXLHsz+XL4zahBAT+vKq0+Wv+tjXy7KKHfo4RlNVqxwy1UlvullQNfoJhh8zxN2
 Qe0VWIIkMQbceaFg/myQBpj952rZl8t8Wh8T6Udv3qmQOxqtMwmkcxH8aRabmH1MmOm8
 n9Lg==
X-Gm-Message-State: AOJu0YxZIRTHohFf/KetlXjxrILqnYvDP0FQn+NksUc/znu7/rIrCOqg
 wLyQ9BNQs8eaj3VHDM/zLr9nY7t6l91u0s4cxXT/sQETMNcm873MTIStfQ==
X-Google-Smtp-Source: AGHT+IGgDaKqbiQjfG1KQaMzfEV2S1UaED1o5e3eL7F0y1XYnyNhfE31PwTleVW4WTKUaJ4ovZYzjg==
X-Received: by 2002:a05:600c:1551:b0:426:67f0:b4fa with SMTP id
 5b1f17b1804b1-42811d739c9mr15424615e9.1.1722088672686; 
 Sat, 27 Jul 2024 06:57:52 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4280574b0e8sm119113275e9.26.2024.07.27.06.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jul 2024 06:57:52 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 27 Jul 2024 15:57:48 +0200
Message-ID: <20240727135748.397792-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722088673; x=1722693473; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XRd/pIzjSRMsrqETkLg0ry4GAkDBUBAvqwhMkHki5h4=;
 b=Jji7rwPznljuB23w+/+qxzzXbhHspb/4HrLU7+K8d7lupG9Qosn5dou5rnoImKAgc6
 MxrigJeANt56be8p/BGPew20PNM+ycUXEx39uXu9Yqd/UnrIQC6ysxEtAhhLP3t0Km5+
 Y0eVTnPqFv9LmHte9JapHbbHWaAbhrSVS8SOOX3mR5ErsOHL9+y9gS7dEc27+aLd6jAd
 xSxdx666EshYHyoB7pZb/n0JilCT7nZd08YbREc8xxbuGng3brnHjLlVVtTrEG8EOn6A
 Y6MoAiD5PGpcUMmGNgU0FUL5Ps8xW0GBLK5iLPBJdFNfMjsR9LHXIHf9D6qc8kRaNs4E
 9/+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Jji7rwPz
Subject: [Buildroot] [PATCH 1/1] package/nasm: bump to version 2.16.03
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

https://nasm.us/doc/nasmdocc.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nasm/nasm.hash | 2 +-
 package/nasm/nasm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nasm/nasm.hash b/package/nasm/nasm.hash
index d6513ff9c6..141e141b0c 100644
--- a/package/nasm/nasm.hash
+++ b/package/nasm/nasm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1e1b942ea88f22edae89659e15be26fa027eae0747f51413540f52d4eac4790d  nasm-2.16.02.tar.xz
+sha256  1412a1c760bbd05db026b6c0d1657affd6631cd0a63cddb6f73cc6d4aa616148  nasm-2.16.03.tar.xz
 sha256  1563996c52e220e15ef2418e67d39488255aa8c28c89e617074d3afe3ee329e0  LICENSE
diff --git a/package/nasm/nasm.mk b/package/nasm/nasm.mk
index ec03b03977..e44d265be6 100644
--- a/package/nasm/nasm.mk
+++ b/package/nasm/nasm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NASM_VERSION = 2.16.02
+NASM_VERSION = 2.16.03
 NASM_SOURCE = nasm-$(NASM_VERSION).tar.xz
 NASM_SITE = https://www.nasm.us/pub/nasm/releasebuilds/$(NASM_VERSION)
 NASM_LICENSE = BSD-2-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
