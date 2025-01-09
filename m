Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBB0E77188
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 01:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDB9C6089A;
	Thu,  9 Jan 2025 01:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yOSQ6eOvsGm0; Thu,  9 Jan 2025 01:21:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AEC3606A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AEC3606A7;
	Thu,  9 Jan 2025 01:21:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C6C17AA
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 01:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7183280B48
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 01:21:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HF1HS9kR1P4d for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 01:21:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D3E6080B39
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3E6080B39
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D3E6080B39
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 01:21:15 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-216281bc30fso6656185ad.0
 for <buildroot@buildroot.org>; Wed, 08 Jan 2025 17:21:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736385675; x=1736990475;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zxyrDY89vltxQqjIv1bBlHeU6SOjNYUlFjMDK1l8ai4=;
 b=cQergOHgrk9YYduAbeJHLzs2nnufd25yS6l2aVwtHso/8s5QUP8R/B7h1xxVCmVw7x
 GiU8OjDfpXvpNyQrrD9/pdqNXFo3kEt4E1WRuOriv4l+/j8JZ9p8OKkVz/Q9TuD5UT1s
 SYnQIyfy0nbH36+yCPXLY7QARzPvs+DIQvUrKwke6I1h1zb3++V76gugA1H3OgYnd14I
 teVqcb98zKsvee2twwnUFcxOfqF2LhNiaCLu9kyogsXtheSESvG5AMcOg+QYaySVoy99
 ILFgcaey1Eu7JhiwNQXddIw0xmvHQUj1zC9ww76Dn+ys4S2Yv+RBh4gXUyMSRJqPQeMt
 hHsg==
X-Gm-Message-State: AOJu0YwACM10JstYx+uxLxfyaL3n4YjyyovfVh+ipMcqgW32sTAGoS6Y
 0erjs7jIzx7FiHdgyjVtD9j7DKJeTkMjJu7tz9BR4GEjncN0ln9Ca9Qt+A==
X-Gm-Gg: ASbGncu6Ovt8RgFqEX3TVkuiBfacoJcImCCWzjfvO2wGZyiqNMgy9ZldIOiQQ7szlF9
 jKkqjS7UROTa+0lmXcq3g5+joST4xvE3Ff4aj2koRWhzpJnHygY13OHaIqCh1/vSMVTJVy9Sbl6
 bltj3GIL2eHY2KSJIM1xULhQAVci9vIh9FhgbrfN2DmEkuE3SSW4yfOMx+jukFBxn8mksxeZR8h
 TwgfGC0y0ZZNWlx97N6f2NrJP83vURTX0HLubfY6lSFSVtT3vROxXOH3xJY6QTe7WxJY0OQPpqi
 VVr8tuZl8u/afSpONOxWEVqBBuFNKeA+BnOLwtc6
X-Google-Smtp-Source: AGHT+IGUvLfKdkUgKriw4p8hLT6e0baLxPm53k048+2WSleAJwDIyvZ8X0W2t3p4PKFTZh2nBjwZQQ==
X-Received: by 2002:a17:902:da87:b0:215:9642:4d7a with SMTP id
 d9443c01a7336-21a83da6a40mr80989115ad.0.1736385674827; 
 Wed, 08 Jan 2025 17:21:14 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21a9174447asm862695ad.82.2025.01.08.17.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 17:21:14 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Nathaniel Roach <nroach44@gmail.com>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Wed,  8 Jan 2025 17:21:11 -0800
Message-Id: <20250109012111.28783-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736385675; x=1736990475; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zxyrDY89vltxQqjIv1bBlHeU6SOjNYUlFjMDK1l8ai4=;
 b=KDEen26/CxQsj2O9IiGgdNmk0eFlYENkms7m5y+vFqqW4DLhS1a3sq4VCxzyvZcOxa
 rmdyt70DUZobwln3k0EsIFXi476ZTpfkDNl22nXmn2+Jz9eHs9pK2W9BnyPaK2jiNplP
 /LdgrOfwfHMIBagFctJdXuzAIkB4hcPhith1Gr/hjt4wqiEn/NsoE1NatvL3tnEIbswN
 C8mvrMlM8o6FlPXp5MNgVfCG6pf8ddgZNc8aG1rvpyXOQWimDvFoSXXQXBUy4d67Q+Nu
 UdcQ8dAHBcgHjijMKDlxUFX2FjJHNPRj/kjlZGwH6IH+dweMH8+cHwpbeERtlYCF4UwA
 X4SQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KDEen26/
Subject: [Buildroot] [PATCH 1/1] package/libgudev: bump to version 238
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

Changelog: https://download.gnome.org/sources/libgudev/238/libgudev-238.news

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/libgudev/libgudev.hash | 4 ++--
 package/libgudev/libgudev.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgudev/libgudev.hash b/package/libgudev/libgudev.hash
index 90f27a02fc..f037b1143f 100644
--- a/package/libgudev/libgudev.hash
+++ b/package/libgudev/libgudev.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/libgudev/237/libgudev-237.sha256sum
-sha256  0d06b21170d20c93e4f0534dbb9b0a8b4f1119ffb00b4031aaeb5b9148b686aa  libgudev-237.tar.xz
+# From https://download.gnome.org/sources/libgudev/238/libgudev-238.sha256sum
+sha256  61266ab1afc9d73dbc60a8b2af73e99d2fdff47d99544d085760e4fa667b5dd1  libgudev-238.tar.xz
 
 # Hash for license file:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libgudev/libgudev.mk b/package/libgudev/libgudev.mk
index ef0bd997fa..67d9b65150 100644
--- a/package/libgudev/libgudev.mk
+++ b/package/libgudev/libgudev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGUDEV_VERSION = 237
+LIBGUDEV_VERSION = 238
 LIBGUDEV_SOURCE = libgudev-$(LIBGUDEV_VERSION).tar.xz
 LIBGUDEV_SITE = https://download.gnome.org/sources/libgudev/$(LIBGUDEV_VERSION)
 LIBGUDEV_INSTALL_STAGING = YES
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
