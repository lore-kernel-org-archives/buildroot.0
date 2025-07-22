Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F399C83F27
	for <buildroot@archiver.kernel.org>; Tue, 22 Jul 2025 12:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04A9E6F55E;
	Tue, 22 Jul 2025 12:45:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5uzdfcjy0vK2; Tue, 22 Jul 2025 12:45:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B2A9611E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B2A9611E4;
	Tue, 22 Jul 2025 12:45:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C0837CD
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 12:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1ED684BD4
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 12:45:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3SoabbRVgDwW for <buildroot@buildroot.org>;
 Tue, 22 Jul 2025 12:45:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AEEF784B15
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEEF784B15
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AEEF784B15
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 12:45:26 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-612b34ef0c2so9274938a12.0
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 05:45:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753188324; x=1753793124;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GUpgFKLIb97RAqfbX3hwXQlCXB1ts5b4XbnfukHdLzk=;
 b=d6UeFpiUbvXT748UA/WTPqhJz4yVDkTNfLl2I1Lw43Hy2rxGd/chE+Ym8Ky2SlShBv
 DxkUFnAgosGGlWXmJJf2P6+jcQ6BVrOdqv00IpCo3GMMXrAId2MtYk7BkzGqua7NeSZW
 vmVuBcH/KjTtpLxDQKwILOT+QZMFQj4Y8+Lrky7RtLWK5RD1xiq9W31Z2Y1zIn0+Ca+o
 m543ls2+1olBavQBZMXtIlzcGWzJMymmY/EgqPHq2Xrz0kFJyQg/SXxziya0GFlckWCL
 HR/MzwiLqWrgKC0OO3Id4JF+Da6oz9dsN7XPrrq8GGLNpurtvp5V2cvwMfFoH8g9Ahou
 9Wxw==
X-Gm-Message-State: AOJu0YzWV4jz7+u/t5E9wovj+8eUKYOr3OBGWfnyHn5m4GUqpIy9qhE6
 vl2HU0QCPqTAr+cn21jIYB01OwcLyFmWMhLc0/4Ga8fQ21N8x4XZGGz4pvmDiw==
X-Gm-Gg: ASbGncu8jMnhTjGCCrlqY7TqoY+wEULojxc8A+sAedyCvPW3ivWmpTTsPWfYc4Bk/8E
 HyZXHkCKwi4gkWRGUUMVDJgN1iqAxUcWI6R/jcdQLTRXYc5idHYRkvK3hGBi3SGT+/ybk9LU6Ji
 6Ocsx4fKlxSUZvKDAjH1kGdlZEU12KS3x1dL+yQlX7WnCAvbbKmuF8WpRU/BWaG/9UjDlgXvWvR
 J2Y67Lbgz4KTsKbsdt/xyDaCgAGno6KN3Qk+GcS45Qop5hp3JWqJdad9+Sfx6yqfx7/rug+J0L8
 YiRTrZfTmlAySMsjedL9rrL0Rumw9enO7zTfVorUDM7+N+AMCJwiGACIw8BLV8pBhD5hcGqT2Ft
 4y5Zf/FoMUWG3WCIh5tYOXLY+Zxpw1dFM99oizDZnuSy5SKhI4qYF5RVd0BxgvKtPDIy4OYSVHt
 X/Fc0=
X-Google-Smtp-Source: AGHT+IEmo2GWoTF6lN3bm3FmnX/557xpFpb5j6u0yXHSvxK5pe/L4G2/qq/Ecky2+G6spmeGqfHrYw==
X-Received: by 2002:a50:cd5e:0:b0:607:5af9:19b6 with SMTP id
 4fb4d7f45d1cf-612a4e59023mr14275524a12.15.1753188323535; 
 Tue, 22 Jul 2025 05:45:23 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-612c9040d91sm6783120a12.38.2025.07.22.05.45.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 05:45:22 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 22 Jul 2025 14:45:19 +0200
Message-Id: <20250722124519.3434397-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1753188324; x=1753793124; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GUpgFKLIb97RAqfbX3hwXQlCXB1ts5b4XbnfukHdLzk=;
 b=m9UkN8iWYkcEbirM5lAGGYTyq5O5VNE7SXTdn1RWdb4b3CDrXzlraTfuHCKaX/rW7n
 DArjtFH+uJYBc0jK5dm6gHutSKHiBBoNUgCzDPjgEtQVG2OVGKYRHegNlOAqJUJUMD6m
 78e3/1dqELWRVuo6HcgRptD26z0U3uSGN5nUs7Po9qF1aWptdFWn+WmfSqSVNz4uupUi
 gRBVoKj/HxCfGxvxMvafmyPp1C2k6qQHzJbVWAglYU7Xu/Y6zvFbUnwiQcgY43gO5Mpc
 TpD78p3BMtj40YzL1icKnwhmXwl8xoBvioiEYzCZfywzJCczw2XeXSiJFp2IOVvYFGJS
 VScQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=m9UkN8iW
Subject: [Buildroot] [PATCH] package/memtester: bump version to 4.7.1
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

For change log, see:
https://pyropus.ca./software/memtester/CHANGELOG

Version 4.7.1 fixes compile error with stricter C23/gcc-15 due to
incompatible type declaration.

Fixes:
https://autobuild.buildroot.org/results/6d4d4e8ca4269a3d8f795c7c186ef70411f2dc79/build-end.log

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/memtester/memtester.hash | 2 +-
 package/memtester/memtester.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/memtester/memtester.hash b/package/memtester/memtester.hash
index 6e5d156ffd..1606fdbd01 100644
--- a/package/memtester/memtester.hash
+++ b/package/memtester/memtester.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1c5fc2382576c084b314cfd334d127a66c20bd63892cac9f445bc1d8b4ca5a47  memtester-4.5.1.tar.gz
+sha256  e427de663f7bd22d1ebee8af12506a852c010bd4fcbca1e0e6b02972d298b5bb  memtester-4.7.1.tar.gz
 sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/memtester/memtester.mk b/package/memtester/memtester.mk
index 347a158b74..1d3a8329fc 100644
--- a/package/memtester/memtester.mk
+++ b/package/memtester/memtester.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMTESTER_VERSION = 4.5.1
+MEMTESTER_VERSION = 4.7.1
 MEMTESTER_SITE = http://pyropus.ca/software/memtester/old-versions
 MEMTESTER_LICENSE = GPL-2.0
 MEMTESTER_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
