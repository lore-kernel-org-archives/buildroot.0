Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5776CEACEF
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 19:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BB65837A4;
	Mon, 17 Nov 2025 19:18:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qoblJ-U2wIXy; Mon, 17 Nov 2025 19:18:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6A25837B6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6A25837B6;
	Mon, 17 Nov 2025 19:18:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 51E4D1BA
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 381A5406DD;
 Mon, 17 Nov 2025 19:18:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uf73jAfCueFd; Mon, 17 Nov 2025 19:18:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0991D406A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0991D406A8
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0991D406A8
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:18:17 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-429c8632fcbso3318923f8f.1
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 11:18:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763407096; x=1764011896;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0PDGUbmUdigLISdjeDSLedgYS6nt5Cq/uHD729L8PZY=;
 b=nqRNBcJVJUzm/vSSbQnwm05KzHbh8XoA1PVi6f6DnamaKTVXF0HNkiCHXqEPXd6UEB
 aSVIFNHrqwT0a5UDSJNVi2rAixhmA3DqrVqfv8Nn1CgNjEuHqhSzS2zU1reajiGY4fmP
 GKozxpnpQGOUqH0rOqFo7mTkXCcc5W+AydcoKVj+FWOLVFhqJj1RDkUjpswiT2+fKN2D
 qfKmH7nV087NmSPB6f2tdUWbNe/n4epzNmRie/c/JmNtvJszSJdBeudr1hkKAje2iVMv
 I7tdNnHH0Ybwlrogun/48Z5cOcYQezxOpReoMKUulw6OqSIcYriTG5UsomQrVsBTmYKa
 ek1A==
X-Gm-Message-State: AOJu0Yz9Py3/fYuDsnRTXhN49afavwFlgS0byRRU12yKe7+Nziq3bJ7S
 r4VYqbwc64ZJfoje+46zaW2ZW1T3PIl+MZosUSou3mf+KqDSnqRMpBs11b+ExQ==
X-Gm-Gg: ASbGnctCgDj5QwDshguONM2URt7A1mTCuICA4fjsae1mJUnhDOk9BQ4bJUP7E9bnjNi
 ZGMe3IWlzUw5NYOlpnXEpg/Mf+GazgKWTRQjz4hBZ6QyXHgnB3Nin/4URWmpWjdPI2h0RpguElT
 94ZuOpkjeuqU76ukEVcftpXEz+CKrVz062rFTbEKq1bzWEViUPD+x1coEcWbBLGGEseQelpux0R
 ZFpbclzKpfc71mIQziUQeu4w2AIyDklpNMLLl02KRSOLYvwxsbrArXoob7cpfI3ARL0an9X9cGK
 i85k14JXdD0yRyqFIF1uMDQKWngI+FSQnXFE51sdThDcQaRacLxExZGDPIapGJIt7MUqndFf499
 Z7EuLt/Z+IFW+x6M8BhivhRbaUjEgcCb66t6MgIwRjtWEq7tRUfZPzOsiIPbOGbEzgBfE570X6U
 cyOTFGc1CCrHEJ0/LeYRLloA==
X-Google-Smtp-Source: AGHT+IEoDO0Of3AToX/bli4Th2VsbcfJPnocaCuEYbETV01XYpi04CvCvlG26nCqbdLaTObTh4106w==
X-Received: by 2002:a5d:5850:0:b0:42b:2a09:2e59 with SMTP id
 ffacd0b85a97d-42b592c6797mr13058412f8f.0.1763407095773; 
 Mon, 17 Nov 2025 11:18:15 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53f0b617sm27397652f8f.31.2025.11.17.11.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 11:18:15 -0800 (PST)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Mon, 17 Nov 2025 20:18:14 +0100
Message-ID: <20251117191814.2160335-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763407096; x=1764011896; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=0PDGUbmUdigLISdjeDSLedgYS6nt5Cq/uHD729L8PZY=;
 b=dQswUKPH1HfOQpz/1wKxCkQlXvgU+AXq52TUrNGqpzKKQA4zNaVdjzkN6gSwtKVN8V
 Yg4BsTOvaGMcy3RKRq6ar6lL1qSIovZcS+ASXTZNKSca/W6vNFze3VijJ2oKAErdGkh4
 HmDH/Q5vU2IKiWwAu5fTFnDfLXi2xvHs91wOCorACWlXs/iBkgYeSrcKf0LDn5iejG6s
 p4Sn+pwWJEt4dWlMwiQ+cVnY84bXYGmcT6PpfcAQInd+lL7rUmfxl70oegarY5ZwMSP0
 t6ERW21PTr9VCQLuUbqk48hxvYQIe0irCgE0C8CnQ8LvM9G1bsZuXWoUWs+bw2mdeTWk
 iSpg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dQswUKPH
Subject: [Buildroot] [PATCH] package/distribution-registry: fix build on i386
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The S3 storage drivers defines the maximum size of a chunk to a value
thqt does not fit in the native integer on 32-bit architectures. This
causes build failures:

    registry/storage/driver/s3-aws/s3.go:312:99: cannot use maxChunkSize
    (untyped int constant 5368709120) as int value in argument to
    getParameterAsInteger (overflows)

Ideally, we'd like to use a build tag that refers to whether the
architecture is 32- or 64-bit, but there is no such flag. Sigh...

Instead, backport a patch from upstream that papers over the issue, by
usig the i386 build tag (of course, that still misses other 32-bit
archs, but are they really relevant in this case?).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-s3-aws-fix-build-for-386.patch       | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/distribution-registry/0001-s3-aws-fix-build-for-386.patch

diff --git a/package/distribution-registry/0001-s3-aws-fix-build-for-386.patch b/package/distribution-registry/0001-s3-aws-fix-build-for-386.patch
new file mode 100644
index 0000000000..a725ab8e92
--- /dev/null
+++ b/package/distribution-registry/0001-s3-aws-fix-build-for-386.patch
@@ -0,0 +1,45 @@
+From 6970080b10a53d858dd444a643a2bd911de12940 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Thu, 29 May 2025 11:28:38 +0800
+Subject: [PATCH] s3-aws: fix build for 386
+
+When building for 386, we got the following build error:
+
+  registry/storage/driver/s3-aws/s3.go:312:99: cannot use
+  maxChunkSize (untyped int constant 5368709120) as int value
+  in argument to getParameterAsInteger (overflows)
+
+This is because the s3_64bit.go is used. Adjust the build tag matching
+in s3_32bit.go and s3_64bit.go to fix this issue.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+Upstream: https://github.com/distribution/distribution/commit/6970080b10a53d858dd444a643a2bd911de12940
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ registry/storage/driver/s3-aws/s3_32bit.go | 2 +-
+ registry/storage/driver/s3-aws/s3_64bit.go | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/registry/storage/driver/s3-aws/s3_32bit.go b/registry/storage/driver/s3-aws/s3_32bit.go
+index 218e3eab..84161fcb 100644
+--- a/registry/storage/driver/s3-aws/s3_32bit.go
++++ b/registry/storage/driver/s3-aws/s3_32bit.go
+@@ -1,4 +1,4 @@
+-//go:build arm
++//go:build arm || 386
+ 
+ package s3
+ 
+diff --git a/registry/storage/driver/s3-aws/s3_64bit.go b/registry/storage/driver/s3-aws/s3_64bit.go
+index 55254e49..2ed1f92f 100644
+--- a/registry/storage/driver/s3-aws/s3_64bit.go
++++ b/registry/storage/driver/s3-aws/s3_64bit.go
+@@ -1,4 +1,4 @@
+-//go:build !arm
++//go:build !arm && !386
+ 
+ package s3
+ 
+-- 
+2.51.1
+
-- 
2.51.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
