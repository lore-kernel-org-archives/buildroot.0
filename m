Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A69CCA476
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 12:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95A3880CAD;
	Fri, 10 Oct 2025 12:54:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IgtNBd9mVsLV; Fri, 10 Oct 2025 12:54:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9991080C4A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9991080C4A;
	Fri, 10 Oct 2025 12:54:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 32006226
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 12:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2ECFA412A4
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 12:54:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ctjyCAuParB for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 12:54:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.52;
 helo=mail-wm1-f52.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 10615412A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10615412A1
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 10615412A1
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 12:54:35 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-46e3a50bc0fso15962585e9.3
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 05:54:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760100873; x=1760705673;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3voFdsaTJSO3iieKFKJr9Xdp0Ze97jp5RkMZf/S63Rs=;
 b=WGXbLFgu2zO4RP144V/A4nhh19JXWyVgNyjYnA+72/aCojg2bss7wd1CIToE94+T1q
 EsFebuJGGOqUIUuQ4Uw5RSYh7BnIxHjqI25KIKFIkF+VpGvitfsSWzMdqoDtQ4IpFVBh
 F4PByGRKhOij2Nsi1dMNT9dQlfMY1e3gBkqdX/weHTmw8FgllXNDNyUOdDCyM2bO6sfW
 ieBGZyLp1SBMj8JiYAzAqTEaXjK8s/W3DA6x19t/s/d1L18s7Z91gXqxacZjKoeFS520
 VLMxVrGrUxAE7CvUfBGNGDKijFEghnlVrP4IeS2OWDzXJOIjRjubViskGGO7/jNv+6nD
 vgrw==
X-Gm-Message-State: AOJu0YymZNTqfA7FuQq2KB152tty05IOr3Ruzi2g2tisLojbdAvm5Rtb
 xJ9HzWKZpwqbCUW4QJjApkxX5Eyd7pmo40/rlGHsRv1cn+VFQ/twtuiVVD7ANg==
X-Gm-Gg: ASbGncs0mzj3GF262fw0aLcwX8T8EvZmNDrYwdQt/9kM0eDrLpjTWjZhkKN0rrPWWy0
 F+WIyWD1ZVYwGYwIKUnRqD4NYfEYMPGLedNzAqYJoDV7VcfQuIDFF1Dk/p0+K+vN34d/1g7exl1
 m1fMvtaqaNCAuV4GsDb4gGa39eh/ijupPAsRY2s+u51PA4fK/eitKwD2KbOSVTEGMDAIcT7ZCip
 9eWe/2tGF6EvAlRgoIweBKVjjBtWj/hZ9L6dq6cJoXw4Y4gAbsnpo7840kd2uPXLrTsoIkcJjkN
 NI9HolmXbyRRWb2T85Xk7EbK5TQjNe5UQL0gu2MDP8zpGOG14VoxZT63qsK/4KWDsV+PDkJS064
 omRMDsXOnx+JPXUF0BiLQmxnIJeqO2EONUI6bhTYBjW+ntHVn/kAXvxdT1AEXg63fcR4i3oPaXx
 aK8DAgaxPhMT+xUV2wG9/bwAxYdC0naKwfMIRmXVZNOzBY7AL3tyYeTPWUjsdPIuUp
X-Google-Smtp-Source: AGHT+IECmQzjwIOqnm9semGYIJATFwFEafv5V2v0mwvT7qMJtyQc041OuQ59af4bqgNaYekexrD92A==
X-Received: by 2002:a05:600c:6383:b0:46e:32dd:1b1a with SMTP id
 5b1f17b1804b1-46fa9a8f146mr79837465e9.7.1760100872823; 
 Fri, 10 Oct 2025 05:54:32 -0700 (PDT)
Received: from KORLIN44614.barco.com
 ([2a02:a03f:eb6f:7900:f303:6e96:eed7:13e8])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-426ce57d4bbsm4148108f8f.2.2025.10.10.05.54.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Oct 2025 05:54:32 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Date: Fri, 10 Oct 2025 14:54:30 +0200
Message-ID: <20251010125430.1253718-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/webkitgtk: bump to version 2.50.1
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

From: Thomas Devoogdt <thomas.devoogdt@barco.com>

Release announce:
https://webkitgtk.org/2025/09/17/webkitgtk2.50.0-released.html
https://webkitgtk.org/2025/10/10/webkitgtk2.50.1-released.html

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/webkitgtk/webkitgtk.hash | 6 +++---
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index fde2439dd5..90304074ac 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,6 +1,6 @@
-# From https://www.webkitgtk.org/releases/webkitgtk-2.48.6.tar.xz.sums
-sha1  8f8e27722b29be5aba84322cf7252fe14afcec60  webkitgtk-2.48.6.tar.xz
-sha256  d9ac3034b7a39c2aaa567e6112b3124b158e591a74439e46974a031dd0e44e24  webkitgtk-2.48.6.tar.xz
+# From https://www.webkitgtk.org/releases/webkitgtk-2.50.1.tar.xz.sums
+sha1  b599be86497f57fc5b2eb8b5d60ff181fc651752  webkitgtk-2.50.1.tar.xz
+sha256  33e912ee6e3cdb4b9803715f50686af85a60af47f1cf72a6acc6a2db1bb3d9fe  webkitgtk-2.50.1.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index cb66641e3d..0b6a1383ca 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.48.6
+WEBKITGTK_VERSION = 2.50.1
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
