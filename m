Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5213CDB474
	for <buildroot@archiver.kernel.org>; Sun, 22 Oct 2023 21:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8317860B3D;
	Sun, 22 Oct 2023 21:17:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8317860B3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3RqBet_WOVPU; Sun, 22 Oct 2023 21:17:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6DEC60B29;
	Sun, 22 Oct 2023 21:17:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6DEC60B29
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 49A111BF40F
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 21:17:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 227D381F61
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 21:17:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 227D381F61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YegoYJ7RgKT5 for <buildroot@lists.busybox.net>;
 Sun, 22 Oct 2023 21:17:37 +0000 (UTC)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0800781F60
 for <buildroot@buildroot.org>; Sun, 22 Oct 2023 21:17:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0800781F60
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-32daeed7771so1783702f8f.3
 for <buildroot@buildroot.org>; Sun, 22 Oct 2023 14:17:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698009455; x=1698614255;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fCmIVZBPrP//9QwH9ZMSTerJx0BB7wfWU0KsfovgiMA=;
 b=cuCp8YHMU1vlJHjqIqZSDVLfvNs0i9K7QnDoD46HjTU6NsbcqgFx/+wbK7Uwkl9fRg
 eCXZrdMTEBx5lJJMqe7NW2YqVgxdYp2Ik3cwTTiQtjdfT8px0w4OkpO+y16YJxzZSdec
 qt9lNI8Kw+jbWa8HcZ6/a8T+RIjWUA+DYda0gR7JZfv78aRv2y7NGMJoj0slY4ESZfvS
 DMDilkeHveJh2VmWrbO2jgz4ytUXaoPxgjLl6qymmXJEPIglDR5aZz2Mg+iOl+CF09Li
 O1s0kV/16X/MjsSVNX/vwZJJ1c6xNFIrw7K9FoZoU+K4n6A6tB3hk3OjdmxOPuzAXOAI
 RXeQ==
X-Gm-Message-State: AOJu0Yw5w25XZidz5Bh54yovzmGiUZe+xl/7XzCGQvDKif4zh47JPb99
 JuPdnDxwfWo/UuWqx6wan6RK0VSVL+Q=
X-Google-Smtp-Source: AGHT+IFecnEUPjbiVa+f3M4OhtARkZc8BBtrJ2XAAFd+FosD8Wivn1PiyWmGmMmxVnsmjAqE1DTE4w==
X-Received: by 2002:a5d:480d:0:b0:32d:bdd5:2fc4 with SMTP id
 l13-20020a5d480d000000b0032dbdd52fc4mr5200683wrq.20.1698009454524; 
 Sun, 22 Oct 2023 14:17:34 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 x18-20020a5d60d2000000b003248a490e3asm6306938wrt.39.2023.10.22.14.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Oct 2023 14:17:34 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Oct 2023 23:17:21 +0200
Message-ID: <20231022211721.88737-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698009455; x=1698614255; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fCmIVZBPrP//9QwH9ZMSTerJx0BB7wfWU0KsfovgiMA=;
 b=FLKSEyaFT6JW4gaBg3sk2Y29EGwoz2jBA2zt0p9QX8jJWJnRlI+jXm1H/ngKgLHqdH
 CKf+vDY1NwO8F3Y0CupS5rIXIyQYKki7QgzwHJJobK3tJc/Yy0i2f5A9EREZv9lXnlwx
 l752DNjk8D/Aa0mQ8m28vXovK9EywR12gGulXTmC0g8ZXl8SmyvVpUrPH0sVdXhZ39+j
 TK9jAx4OgwTgGwfCPcGSUWP3tiv38FDIUiIdopvGZdhymuD83PaTtgLAZdOO5x07F7Wd
 AIWgTdrKHEz20lQMV32U9TCXaGqhhvf0OFOG975hoyexh7qGOW/MnCRZmew3ayJnxRS/
 Ylsw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FLKSEyaF
Subject: [Buildroot] [PATCH 1/1] package/nghttp2: security bump to version
 1.57.0
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
Cc: Anisse Astier <anisse@astier.eu>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2023-44487: The HTTP/2 protocol allows a denial of service
(server resource consumption) because request cancellation can reset
many streams quickly, as exploited in the wild in August through October
2023.

Fix CVE-2023-35945: nghttp2 fails to release memory when PUSH_PROMISE or
HEADERS frame cannot be sent, and nghttp2_on_stream_close_callback fails
with a fatal error. For example, if GOAWAY frame has been received, a
HEADERS frame that opens new stream cannot be sent.

https://github.com/nghttp2/nghttp2/security/advisories/GHSA-vx74-f528-fxqg
https://github.com/nghttp2/nghttp2/security/advisories/GHSA-6pcr-v3hg-752p
https://github.com/nghttp2/nghttp2/compare/v1.41.0...v1.57.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nghttp2/nghttp2.hash | 2 +-
 package/nghttp2/nghttp2.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/nghttp2/nghttp2.hash b/package/nghttp2/nghttp2.hash
index 3702a91b5e..18774d01d4 100644
--- a/package/nghttp2/nghttp2.hash
+++ b/package/nghttp2/nghttp2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  eacc6f0f8543583ecd659faf0a3f906ed03826f1d4157b536b4b385fe47c5bb8  nghttp2-1.41.0.tar.gz
+sha256  9210b0113109f43be526ac5835d58a701411821a4d39e155c40d67c40f47a958  nghttp2-1.57.0.tar.xz
 sha256  6b94f3abc1aabd0c72a7c7d92a77f79dda7c8a0cb3df839a97890b4116a2de2a  COPYING
diff --git a/package/nghttp2/nghttp2.mk b/package/nghttp2/nghttp2.mk
index 9190fa30d6..70a25d409c 100644
--- a/package/nghttp2/nghttp2.mk
+++ b/package/nghttp2/nghttp2.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-NGHTTP2_VERSION = 1.41.0
+NGHTTP2_VERSION = 1.57.0
+NGHTTP2_SOURCE =  nghttp2-$(NGHTTP2_VERSION).tar.xz
 NGHTTP2_SITE = https://github.com/nghttp2/nghttp2/releases/download/v$(NGHTTP2_VERSION)
 NGHTTP2_LICENSE = MIT
 NGHTTP2_LICENSE_FILES = COPYING
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
