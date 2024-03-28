Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB29CD11DD
	for <buildroot@archiver.kernel.org>; Thu, 28 Mar 2024 21:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D068400B8;
	Thu, 28 Mar 2024 21:55:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vX8nqlp4_ZMr; Thu, 28 Mar 2024 21:55:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0EC4417EE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0EC4417EE;
	Thu, 28 Mar 2024 21:55:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CBAB31BF47A
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 21:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B898B417EE
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 21:55:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XKWbb31pY0Mo for <buildroot@lists.busybox.net>;
 Thu, 28 Mar 2024 21:55:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 86CC4400B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86CC4400B8
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 86CC4400B8
 for <buildroot@buildroot.org>; Thu, 28 Mar 2024 21:55:52 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4149749cc36so10230095e9.0
 for <buildroot@buildroot.org>; Thu, 28 Mar 2024 14:55:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711662949; x=1712267749;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=huuxyK63bjXYjqfQxsEsabFedtJUClg0N3ETwhKiOfM=;
 b=K2x9EJsBFpD3vWed0bLt3dg6k79TZ4yHREr3SVwDha4azFbyvDX3QTF8TDvDK9D4K1
 4jWZuFIfFmBKYfLP74+Wl3qTuvaLhL2c772U6RCI+jqHPaJlb5RVJERYZI620+8C/nf3
 0GJNnF5U5dM9kP5QFFaJBD/1tLN1mq043AbJl2rDfWaf0GLoi8zA5oaeWTZmuD9CUblY
 Pps9x0ugvzzPC1ePZLEBUnugN8W0Rd5PYsnRGZ9YJIGsLZel2316PJTcbZyaQSlWm2p/
 0WxqbCPcG9572IL9Ojk1KO5vYTw5anr4jJwevBNkrlk38hAHf0st3zNvarXqSvBDqMoU
 8mxQ==
X-Gm-Message-State: AOJu0YzOAiv/z6xzUeyMWEwsKb6Xuy7qfgZQ8UjfY54ovW7/0W2fj9cq
 3GmJKzpd6X1IS8pa8IcR2qLrQlBzFCFZN5Sxv7VA2IdWIN93jEv930XyuERD
X-Google-Smtp-Source: AGHT+IEYKLuRGKiJHyFtGCnFDjV2rhyVYx/FTo3g1HBn0M8H+xMkxe4LQVaxhpLfAgcEq1N0Olal+Q==
X-Received: by 2002:a05:600c:1907:b0:414:869b:dbd9 with SMTP id
 j7-20020a05600c190700b00414869bdbd9mr424150wmq.9.1711662949377; 
 Thu, 28 Mar 2024 14:55:49 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 bg3-20020a05600c3c8300b0041481207b23sm3530686wmb.8.2024.03.28.14.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 14:55:49 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Mar 2024 22:55:47 +0100
Message-ID: <20240328215547.67028-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711662949; x=1712267749; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=huuxyK63bjXYjqfQxsEsabFedtJUClg0N3ETwhKiOfM=;
 b=EWLreMDC9L0fL33Bw998mRsLTR3zNQ2xQMAoUKogTfUTqr+9ymgEZM5hYAXM0bBD8A
 e3KL+h5LOgLGRhZObc0G1Ud8jovX8i5y4PVfp11qff9wgGyySbrqPWcgxnsFpkY3jUk6
 ZBc7+NkqePCW6n3Xd+J6rXGDCFJbWJKx9KX1wV2XL3NY7Oi6LwP6G74JeAqYvZfxG4tV
 l8BrJ4+0Z1jUvkmI3SVzqtUrIa/KYBycLdlHcSiio+abQLys9G/CAZQMwXgQbES4SA3z
 ydWGKEGJIfepHoqqOy2lWYu0Zh1a7ocCq7gftEbX1IO//xQE6/Tr1nbcUaupD3pdjdw3
 U5dg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EWLreMDC
Subject: [Buildroot] [PATCH 1/1] package/freeipmi: bump to version 1.6.14
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

https://lists.gnu.org/archive/html/freeipmi-announce/2024-01/msg00001.html
https://lists.gnu.org/archive/html/freeipmi-announce/2024-01/msg00000.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/freeipmi/freeipmi.hash | 2 +-
 package/freeipmi/freeipmi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freeipmi/freeipmi.hash b/package/freeipmi/freeipmi.hash
index ac24b7c64e..2f81d90c1d 100644
--- a/package/freeipmi/freeipmi.hash
+++ b/package/freeipmi/freeipmi.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  65fbd6910fc010457748695414f27c5755b4e8d75734221221f3858c6230a897  freeipmi-1.6.11.tar.gz
+sha256  1a3dac5c76b7ccc4d4f86aa12b8ef9b212baef7489bf05e899b89abb7e14edb5  freeipmi-1.6.14.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.bmc-watchdog
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.ipmiconsole
diff --git a/package/freeipmi/freeipmi.mk b/package/freeipmi/freeipmi.mk
index ecff6f9925..e28f63f715 100644
--- a/package/freeipmi/freeipmi.mk
+++ b/package/freeipmi/freeipmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREEIPMI_VERSION = 1.6.11
+FREEIPMI_VERSION = 1.6.14
 FREEIPMI_SITE = https://ftp.gnu.org/gnu/freeipmi
 FREEIPMI_LICENSE = GPL-3.0+, BSD-like (sunbmc)
 FREEIPMI_LICENSE_FILES = \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
