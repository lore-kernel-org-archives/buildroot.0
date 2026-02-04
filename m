Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBCEE9D40D
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 16:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE1966087D;
	Wed,  4 Feb 2026 16:45:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gyYuVPgrLV2A; Wed,  4 Feb 2026 16:45:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB98860EB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770223525;
	bh=m3WmOw5V6BDCIgH1qkLmwAPr9SwfFIiQ6u2Ayc0Xvuk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RuXREuBXLCB5zLva0d+jA5AraFSHFrwsvOEQAvd/bEvuOpuEU7F0NNpYv0H+W2xqs
	 tTQKbvy9q4zeaOfpSP22hEztwgKrLy3MaVwXkRed+MvBULrwr5XCAck4BqZyVr+95s
	 y4oyWmnw6aV4ufGiWeoe3F/IJTRHfu/PrgR7iRCJeLUK9bMs5iLE681QC6/vaA0iAg
	 hiBf0S/b2TtRTK8Ia5BMXXolpEXeRZDsoc3ONFai6q1Yymb+tzd86q8Xrag6TTRE9l
	 iEybgDzIGCFbGj9nrs67qndIUM+SEjpyuS4DzEJyxMpp0zvvG8nJTA5ZQp/HKNn/j/
	 8mQF2Al7WdAJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB98860EB2;
	Wed,  4 Feb 2026 16:45:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 11C8C173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07CF781E54
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:45:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zt5x-ZBg2U0h for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 16:45:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.48;
 helo=mail-wm1-f48.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E36DF81DF5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E36DF81DF5
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E36DF81DF5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:45:21 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-48039fdc8aeso43137625e9.3
 for <buildroot@buildroot.org>; Wed, 04 Feb 2026 08:45:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770223520; x=1770828320;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K0NUqUxGhi5fcVAZzRNDEZrLQy1HhKKP+ZuTQMTLNqg=;
 b=E0MU1dcQwXH7hCb+5Fb5m0ujzJgsUrANFV4EceWbEumjkc6oz0/vy+FZwlXBl5fkG8
 2tpx/bi8fyfyk3JgvlJgx0ZoHzAxNae5vDaTxQ2BlqJ8tGMBrqDXPN+YZPMCBxW9J01P
 cNIPBVihWIlAjQECU8tohY/rg0cNnvGAplecZElS3I79vKrUxl6/0jq2Qq2d5gIL852l
 +i4V4nlmK9ZYb5z3vKeJnOvcazvv8N+2gE2M1v23ofC8R3Hd2PqBHK8Nw4qFSe3VA/a/
 qRjxYzDpZ8MZquGTgoDjidFBqrkCP+VPP1C7VTP7gsaTkXi+ZBibXd7qY3DIJPWOdNmN
 WjVg==
X-Gm-Message-State: AOJu0Yzrtdy0W9TqE0fI8FBVgqwdFV/QZ1hTfZf3K9PyzXql5+UBjavz
 0i24LiV4etVA31SdALbZuwqtBkMAL1wWaOF2vHm+FGPh2/UEVEiLba12oERno5OfHn4=
X-Gm-Gg: AZuq6aKTL8jGDGLFLzTPc4GDWXEVqtjKAHWngKAGZKR4rpqCbR7LIVz2Hk3w0X1YAtk
 AliU2jnbrhGoXvOO5nAsziJ5qlzmMHmIK9aLjp83Q/FhAgZXAxXRjxViyaf3ccoMb64Q+0EPP7t
 AdIgMqaKu+XLKKHADhOIyYto4c7x0tG2M770T7sCZjkpTvpCLJK/a8ZWVzuUWipLGQxS7X/h0B8
 m7wJPEaK9iQqWkxAYmYDlucfoegs0raqJZSAGM4T9YeG7QsaasBbPW1M3PoGrM6/lLOEi5KRQj5
 x78kanx8PJ9GMDOM+RkCi1DRI1qTpknhyf+qteSjyvq0vTeTBRQLBK2fVvQr7A+5oFgmnh+HoE1
 v1pxiYXaCH1DnXM8UeYEGOYxctdWPXl9F0HvtdNQyi9101Jx4IxAC32szMmyq9iVHRiH5m0WH6r
 hmKsBP+IvVfL8viEIWINys1CQGOn+FPImCT4VLhn/G+sevJLnjD49NVaUvW9VBWdrBKCY2ZKotS
 PBbmUk=
X-Received: by 2002:a05:600c:34d1:b0:477:7ab8:aba with SMTP id
 5b1f17b1804b1-4830e92a768mr46047955e9.1.1770223519564; 
 Wed, 04 Feb 2026 08:45:19 -0800 (PST)
Received: from KORLIN44614.. (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-48310894f18sm83589745e9.13.2026.02.04.08.45.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 08:45:18 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas@devoogdt.com>
Date: Wed,  4 Feb 2026 17:45:11 +0100
Message-ID: <20260204164512.243312-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/webkitgtk: security bump to version
 2.50.4
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

News:
 - https://webkitgtk.org/2025/11/19/webkitgtk2.50.2-released.html
 - https://webkitgtk.org/2025/12/04/webkitgtk2.50.3-released.html
 - https://webkitgtk.org/2025/12/16/webkitgtk2.50.4-released.html

Security advisory:
 - https://webkitgtk.org/security/WSA-2025-0008.html
 - https://webkitgtk.org/security/WSA-2025-0009.html
 - https://webkitgtk.org/security/WSA-2025-0010.html

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/webkitgtk/webkitgtk.hash | 6 +++---
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 90304074ac4..3c2f7aedbd0 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,6 +1,6 @@
-# From https://www.webkitgtk.org/releases/webkitgtk-2.50.1.tar.xz.sums
-sha1  b599be86497f57fc5b2eb8b5d60ff181fc651752  webkitgtk-2.50.1.tar.xz
-sha256  33e912ee6e3cdb4b9803715f50686af85a60af47f1cf72a6acc6a2db1bb3d9fe  webkitgtk-2.50.1.tar.xz
+# From https://www.webkitgtk.org/releases/webkitgtk-2.50.4.tar.xz.sums
+sha1  719c304539cecca945846700cefebc7339eb5924  webkitgtk-2.50.4.tar.xz
+sha256  d3bfa473845acfab72635bada5e0d134fda6792c5b95c5c5cd141b46125bd8e4  webkitgtk-2.50.4.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index fecca3529d8..d9aa48f024f 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.50.1
+WEBKITGTK_VERSION = 2.50.4
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
