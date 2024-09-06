Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F01E6FE41
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 18:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1944840151;
	Fri,  6 Sep 2024 18:33:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z-CNp5HqgAC8; Fri,  6 Sep 2024 18:33:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAA7F401D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DAA7F401D5;
	Fri,  6 Sep 2024 18:33:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AB6771BF309
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 18:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98C446058B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 18:33:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CnIFs3qaBeR1 for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 18:33:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6EC61600B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EC61600B8
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6EC61600B8
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 18:33:23 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3787e067230so1447759f8f.1
 for <buildroot@buildroot.org>; Fri, 06 Sep 2024 11:33:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725647601; x=1726252401;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ht9iu6/48TnPWAOOBhIvucy0TKQEVHVoi8ZQfSXJT6E=;
 b=ajqE5OMvhIiFpIbl95xWao14apuQTrD2tZaKGvTC7LcvFXnCbRx4UIE5zHtxc6joPS
 KGIaqJp9nyD2DnpaQGgB/gGGtD9es6vQ/T/9sDAyjs3H1NJfPOtc2txmQ5O81+Pqj41f
 6JhCF3J4YHffYTa+yW8fwWO1OGFFlQK1+rFFl2C8iekmLXb9oIHLXeJoxuw4KO8LXHoP
 Q6kD91PTHtombxM1oi0+xVNLPcJWvSz8gJXMtlIjE1y5PuTP9mnzLARvWf4ZhBcoD9JA
 QddKESfIonGw3vJzrdseFKAIOGj/8v1MKueVXPmU3aNxZjUMi6HPUeZwMNUdqbIc/AjF
 WiMg==
X-Gm-Message-State: AOJu0YwOJr23FPKr908UpFROdMLw+4wJdlaqbYdWYd/Awul1zm0hBIHr
 EWpCpTE0rWbns3s/b/+I9DHdwLUIjf7oVV9vvzeNxFQXL+sRH81UBiP1XQ==
X-Google-Smtp-Source: AGHT+IHWbZMtPGAmCsTGqkr7uMp6aHfLcvdl9OePHcfOO2oPui2c7lZqgA2P7yLBZXwhnV4RYbunxg==
X-Received: by 2002:a05:6000:a8e:b0:371:8dcc:7f9f with SMTP id
 ffacd0b85a97d-378895c5343mr2595754f8f.5.1725647600656; 
 Fri, 06 Sep 2024 11:33:20 -0700 (PDT)
Received: from x230.home (109-81-80-201.rct.o2.cz. [109.81.80.201])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ca05ccf8dsm27568585e9.19.2024.09.06.11.33.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 11:33:20 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Sep 2024 20:33:13 +0200
Message-ID: <20240906183313.1612683-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725647601; x=1726252401; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ht9iu6/48TnPWAOOBhIvucy0TKQEVHVoi8ZQfSXJT6E=;
 b=cCTElz/O00qtDvR7oei0IH23h+ssFnNKNQm79XDlDep/kc4QuNSRb47K+oqay2vC2n
 IFWt5/8dkogvbNts16T+dHXm3049E8QN1B8kSMjK1JvrRuNqfVkCBB4UTJ7RJsTK7Kdm
 IHdhT1EHqgeYTQ45MfYXilo2ol/2pjXNiH+PbDgE/V8c5tRQ7nkO0FBA9pp3cFPXYWEo
 6lOE7xGTgLsi6+pkugRo9dLCxf3fj98TOCIAz4pMF/86y2RjiPVIo/k+1mxRYdGvPHFS
 2BkcwVc3R0qowCRxIFi1q/q5YNPqhq5Sada73EZH3AoBjBL7KLyVjlw2qPlszUWe3fTr
 SitA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=cCTElz/O
Subject: [Buildroot] [PATCH 1/1] package/iputils: bump version to 20240905
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
Cc: Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update comment. This release includes pre-generated man pages & HTML
docs in dist tarballs [1], but we don't install them anyway (Buildroot
does not ship package docs).

[1] https://github.com/iputils/iputils/commit/535f6de25909a63ea35750c8a37408e49c0d235c

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/iputils/iputils.hash | 4 ++--
 package/iputils/iputils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/iputils/iputils.hash b/package/iputils/iputils.hash
index a3e48d60a9..6baf433dcb 100644
--- a/package/iputils/iputils.hash
+++ b/package/iputils/iputils.hash
@@ -1,5 +1,5 @@
-# https://github.com/iputils/iputils/releases/download/20240117/sha256sums.asc
-sha256  7ed46e876e4157e1d20c40ec945e1ce0f3af3b10b5f6373e423135c6f22cd116  iputils-20240117.tar.gz
+# https://github.com/iputils/iputils/releases/download/20240905/sha256sums.asc
+sha256  599cda8e3f5f7ce4c612456ab1101369da8f79aa0f83c8e877290a1c7bb56010  iputils-20240905.tar.gz
 # Locally computed
 sha256  2c9f29d982c48665c30b3adaf400c048988fd256eb91c691e351eb3b6a8b2036  LICENSE
 sha256  9acc4bc871a4742550158e3696dcb381953172ef808d04ca248184f9f6322712  Documentation/LICENSE.BSD3
diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 08d849e69d..ec8c24e4e0 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPUTILS_VERSION = 20240117
+IPUTILS_VERSION = 20240905
 IPUTILS_SITE = https://github.com/iputils/iputils/releases/download/$(IPUTILS_VERSION)
 IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause
 IPUTILS_LICENSE_FILES = LICENSE Documentation/LICENSE.BSD3 Documentation/LICENSE.GPL2
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
