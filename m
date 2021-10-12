Return-Path: <SRS0=Fi0H=PA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E94AC433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 17:48:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F284160E54
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 17:48:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F284160E54
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92CCB60BE4;
	Tue, 12 Oct 2021 17:48:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JN4o9T6j9pFb; Tue, 12 Oct 2021 17:48:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFC0160BD5;
	Tue, 12 Oct 2021 17:48:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EFBF81BF5AA
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 17:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF96081BC6
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 17:48:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uDK2VTbdb5Te for <buildroot@lists.busybox.net>;
 Tue, 12 Oct 2021 17:48:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0DBDB81BC5
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 17:48:41 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id f21so73396plb.3
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 10:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d8P2/1jMqutAdT+St0TTAMHJCJxGHM5ZMeMxy/uj9Ak=;
 b=CkPQ1vHkiZqCGNDpduA6e7H/gRma6MX4lGavAowX5ZbMXeZkolOJOaYmg+wb27KRz9
 wD2fCoZAGtv4B2ZY+N5Y+tzqYBPCHwMhJUlg2e2zlZLOBEw4CSI+EAFtiOK0+AJl5T51
 0Up4g0jG42hMQ70azf1jHhEGEscHqTXOvq8sDeGcShAzN64WkTK2UtmD30uN4OqQBN1U
 8A+naH0EpJQk96MGsrNrHMAa5hGrcKt1LuO51aCl5yUoKCiQKJ3Ca3QLALWkrrfyno4h
 DGUHLWxhnDTfNg4ahH4I3a989ZdXeFW9GU0AofySqcrNgKgyEFBg7ujCh946qcg7VI6f
 Y1TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d8P2/1jMqutAdT+St0TTAMHJCJxGHM5ZMeMxy/uj9Ak=;
 b=hggT88RzI2rFX4vtJN33Ej+jYaGa+Q/Kt9GfPoPW4OHW+sUIVqvNXxgMrNbtWt87Ur
 iKeHcvtLq46066yf1xY+b1ivMifb8fO93TnY9JcZ8nR0ZMdpVxIG44h8/ylSvQlKytir
 Vc+7J5umwHQLzx06B3Jqs7F5PsIl2vI8ffesa2OWuRcH+0KBC4zEw5uNXfi9CMqKOMIX
 MixJKZ2r9Vj/4arRHkWAtV5KJGhrqj3kPA/JOgP9d9rusVQgQe+Qyik80pL+8I2VBK1O
 K6R7AQk3swg7WSHfDCedxP9tk8WA4Az56tgsB5OPKsmfz4cH3CZTqaEj3OAGX7XEZXHJ
 IpBA==
X-Gm-Message-State: AOAM532hdeW7ssGkBYwSevBWUucULO0thIIwuIMS/riW3nDd8JNGYbnl
 Oa/gpj77ASCzFsO6JeFILVAErK/CwD0=
X-Google-Smtp-Source: ABdhPJwajdMTc7lfMBn1RJXX2+TYJ9tBoacY+XbOVCWMASOBi6kKgvKVKgoEZEAUNsT5vt/Xr6VTGA==
X-Received: by 2002:a17:90a:7892:: with SMTP id
 x18mr7694191pjk.33.1634060921118; 
 Tue, 12 Oct 2021 10:48:41 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id i125sm11679295pfc.36.2021.10.12.10.48.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 10:48:40 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 12 Oct 2021 10:48:35 -0700
Message-Id: <20211012174838.1222576-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/4] package/nmap: bump to version 7.92
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Adam Duskett <aduskett@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In addition:
  - Remove upstream patch
  - Update license hash to reflect license version bump from 0.92 to 0.93

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/nmap/0002-ncat-unix-socket.patch | 30 ------------------------
 package/nmap/nmap.hash                   |  6 ++---
 package/nmap/nmap.mk                     |  2 +-
 3 files changed, 4 insertions(+), 34 deletions(-)
 delete mode 100644 package/nmap/0002-ncat-unix-socket.patch

diff --git a/package/nmap/0002-ncat-unix-socket.patch b/package/nmap/0002-ncat-unix-socket.patch
deleted file mode 100644
index b6484ebeea..0000000000
--- a/package/nmap/0002-ncat-unix-socket.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-ChangeLog:
-
-o [Ncat][GH#2154] Ncat no longer crashes when used with Unix domain sockets.
-
-Backported from: r38121
-
-Signed-off-by: Alexey Neyman <stilor@att.net>
-
-Index: ncat/ncat_main.c
-===================================================================
---- a/ncat/ncat_main.c	(revision 38120)
-+++ b/ncat/ncat_main.c	(revision 38121)
-@@ -846,7 +846,7 @@
-             targetaddrs->addr.un.sun_family = AF_UNIX;
-             strncpy(targetaddrs->addr.un.sun_path, argv[optind], sizeof(targetaddrs->addr.un.sun_path));
-             targetaddrs->addrlen = SUN_LEN(&targetaddrs->addr.un);
--            o.target = argv[optind];
-+            o.sslservername = o.target = argv[optind];
-             optind++;
-         } else
- #endif
-@@ -865,7 +865,7 @@
-                 targetaddrs->addr.vm.svm_cid = long_cid;
- 
-                 targetaddrs->addrlen = sizeof(targetaddrs->addr.vm);
--                o.target = argv[optind];
-+                o.sslservername = o.target = argv[optind];
-                 optind++;
-             }
-         } else
diff --git a/package/nmap/nmap.hash b/package/nmap/nmap.hash
index 8f69bbf613..dc379f30d4 100644
--- a/package/nmap/nmap.hash
+++ b/package/nmap/nmap.hash
@@ -1,5 +1,5 @@
-# From https://nmap.org/dist/sigs/nmap-7.91.tar.bz2.digest.txt (lowercase)
-sha256  18cc4b5070511c51eb243cdd2b0b30ff9b2c4dc4544c6312f75ce3a67a593300  nmap-7.91.tar.bz2
+# From https://nmap.org/dist/sigs/nmap-7.92.tar.bz2.digest.txt (lowercase)
+sha256  a5479f2f8a6b0b2516767d2f7189c386c1dc858d997167d7ec5cfc798c7571a1  nmap-7.92.tar.bz2
 
 # Locally calculated
-sha256  8254a9bc733f3312c6dcfe0d5a129c29e96ecb8b33408c652a8c7beb2e25b471  LICENSE
+sha256  133794301a764dfe8a60e38601e56657b7113e0337b452189725bbbed58baea0  LICENSE
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index 34cf61ff0b..f3994e9b38 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NMAP_VERSION = 7.91
+NMAP_VERSION = 7.92
 NMAP_SITE = https://nmap.org/dist
 NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
 NMAP_DEPENDENCIES = liblinear libpcap
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
