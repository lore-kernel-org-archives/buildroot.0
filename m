Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89F85C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 16:40:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B88B60F43
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 16:39:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3B88B60F43
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yuriev.ru
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D31278299D;
	Sun, 10 Oct 2021 16:39:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W1NJPmdakX1T; Sun, 10 Oct 2021 16:39:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30D18827A0;
	Sun, 10 Oct 2021 16:39:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B1C4F1BF424
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 16:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A00E8400F0
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 16:39:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=yuriev-ru.20210112.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id at4QaFtL4pJB for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 16:39:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E403B400EF
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 16:39:53 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id i24so61284645lfj.13
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 09:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yuriev-ru.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=caczfOUXmm5P+21B6wUYZheZaBYcAGli02v0fAj64Xs=;
 b=78L910zIDyUtqsj8O2swnXHexO2UVrVDgPal6MGo+/rGHG5PC9Z9Lc2X837FaUbbWY
 8cPtn055jRCKJnyTMIJlKTzIsYd+XwEWhdO/4jYpDwbnZoDGo9mOYGjyDsE5TClSoGFx
 WxuyEfAORJRQ7rrprkrGi2eGVsI10DVDPNWiJWouWmlbPOimvJJYPbEc5JC5mzXQxe9r
 Y0519n8AE0PujGlvKFXSxOdKI0RNqsap+a2PSIn0sUJ61Vq0YE6I+8BMucmqWhkCS7KZ
 FS27fjSf/vTvQudZ9WLi5A9neMrUvpK4pqZ4bn7sTUqyUoDNhUmGlaxmWCx7loA5cGSd
 CtVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=caczfOUXmm5P+21B6wUYZheZaBYcAGli02v0fAj64Xs=;
 b=XnlRJvJMJmYXL1BaF8hCggbhV9pDJb8uU+rxcO6u3mYMLXZ7srh0QAoHKWk7giIgUJ
 veMmkAz8CJerYA/BbjfoaK6zGsye1VJTwN5F8pFlVaRslbmaR9T1ffsXhKFAHxaDt7UE
 jbKQmDiIucgsFsmFJxRj1B1JT816eQk//subdHbXveK0GPSN3TXF6DaQ4kjiM2+PBXxO
 LGgfLAKyPhEGyI5VGY51/c2orZXElfVD3WAUYO6Iyh+sbljbeQq6Wn+1/4Njj+pQY2Hn
 ozohUTwii3ghzhKHn+p/MUVvMN3fgLAzG6b60BcJfJ+WMreZ7WD2BX19ckBx2KN1meK4
 ROiw==
X-Gm-Message-State: AOAM532l0/radCytDYY25T0w9hNMKth7H0xvfbm5jWzEV+Z+xu/2gxwp
 xa7x5y5UnXUPGSqZ6/YUXw0xaolXha1a4Igk
X-Google-Smtp-Source: ABdhPJxln9DXnKiPVffkfXrZ+ALWLb3YaekuTY5HAL49YygRxFox/ofAPxMhaSO9StdE7yBVnQuRvQ==
X-Received: by 2002:a05:6512:33af:: with SMTP id
 i15mr14605565lfg.260.1633883990529; 
 Sun, 10 Oct 2021 09:39:50 -0700 (PDT)
Received: from ly-ThinkPad-X1-Carbon-2nd.ptsecurity.com ([188.170.194.45])
 by smtp.gmail.com with ESMTPSA id o9sm614104ljh.9.2021.10.10.09.39.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Oct 2021 09:39:49 -0700 (PDT)
From: Leonid Yuriev <leo@yuriev.ru>
To: buildroot@buildroot.org
Date: Sun, 10 Oct 2021 19:39:33 +0300
Message-Id: <20211010163934.3169734-1-leo@yuriev.ru>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libmdbx: bump version to 0.10.4 (stable,
 bugfix release).
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
Cc: Leonid Yuriev <leo@yuriev.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is stable bugfix release of libmdbx.
So it is reasonable to backport this patch to all applicable releases of buildroot.
---
 package/libmdbx/libmdbx.hash | 2 +-
 package/libmdbx/libmdbx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmdbx/libmdbx.hash b/package/libmdbx/libmdbx.hash
index 7cc835a96a..326cf57bb6 100644
--- a/package/libmdbx/libmdbx.hash
+++ b/package/libmdbx/libmdbx.hash
@@ -1,5 +1,5 @@
 # Hashes from: https://github.com/erthink/libmdbx/releases/
-sha256  a8f2436c4d008886e044f568a22bda44329fb1c67f175d91a929ff8e2065340a  libmdbx-amalgamated-0.10.3.tar.gz
+sha256  e11d5339a1e1cc34407898933b62a208936fd761a2cc31e11244d581d1d2b5d0  libmdbx-amalgamated-0.10.4.tar.gz
 
 # Locally calculated
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/libmdbx/libmdbx.mk b/package/libmdbx/libmdbx.mk
index 76bd56dfd7..f38e4a533b 100644
--- a/package/libmdbx/libmdbx.mk
+++ b/package/libmdbx/libmdbx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMDBX_VERSION = 0.10.3
+LIBMDBX_VERSION = 0.10.4
 LIBMDBX_SOURCE = libmdbx-amalgamated-$(LIBMDBX_VERSION).tar.gz
 LIBMDBX_SITE = https://github.com/erthink/libmdbx/releases/download/v$(LIBMDBX_VERSION)
 LIBMDBX_SUPPORTS_IN_SOURCE_BUILD = NO
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
