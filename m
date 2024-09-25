Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B58DCF58C3
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 13:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2F5640065;
	Wed, 25 Sep 2024 13:37:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UZJzqWrd0GX1; Wed, 25 Sep 2024 13:37:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F87140071
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F87140071;
	Wed, 25 Sep 2024 13:37:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2AE441BF3C0
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 13:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A2F284759
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 13:37:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aZ8F8cxgakOs for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 13:37:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C787F84757
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C787F84757
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C787F84757
 for <buildroot@busybox.net>; Wed, 25 Sep 2024 13:37:18 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-42cba6cdf32so63169225e9.1
 for <buildroot@busybox.net>; Wed, 25 Sep 2024 06:37:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727271437; x=1727876237;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wGDXGfGaNFHmLLBZHVjpG083X44EIhn+qiVIjLPjtBk=;
 b=mfKBJ1Dhhq7HNOeMuLxbVxTtQP637qAK8AYLqGXxrk6mS/acP/tC8wMwozgcBt1qim
 WA+Bbny5ABYOcrY+r5Y+flXu75DbMgBcjsPwL1mJys6k1ro3uZitm7oY/rJXIN93jLph
 9u0J04wd8aWbWqzLdD/Pgs40oxvqIGcBdzQcgbwyww/n7NSXGIs0AlTdksYYpqzWYBn+
 /h4d08XqyXUVkqNjpt7hi+klDEuoKr+e/DSRLAIxjrYvmckxPdwF8ywGjt+RFiWQXGm2
 OvnzrOs2h594xCXy48BMmR6FU5VSpEMpOTYjyGUrnjDCFU3sEp4oRlddHFgvsCFJnvfF
 a/ow==
X-Gm-Message-State: AOJu0YxV6DwKXqiBkH2XTVUIgC/pod/Dmn/AAs2vJsqSIFdTZQ6Dagyy
 sDMe4aiOzZjKnRzOYBasgQOfUdGxtzBpn/hnWrH3sWm3qElHX6TZLkZpmZrEjIjUxIxYYnFcwPY
 Akw==
X-Google-Smtp-Source: AGHT+IFZBtCftNVtdbVI74Nd45yYb1tjPVXOJAM3zu3YWi1H7286+4UDJbIcKCljuO2stIe1IivmIQ==
X-Received: by 2002:a05:600c:3b17:b0:42c:ba83:3f01 with SMTP id
 5b1f17b1804b1-42e9610c3a5mr20514045e9.8.1727271436604; 
 Wed, 25 Sep 2024 06:37:16 -0700 (PDT)
Received: from vm-2404.. (55.6.65.37.rev.sfr.net. [37.65.6.55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e96a56fddsm19127105e9.46.2024.09.25.06.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 06:37:16 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 25 Sep 2024 15:37:13 +0200
Message-ID: <20240925133713.3899825-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1727271437; x=1727876237; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wGDXGfGaNFHmLLBZHVjpG083X44EIhn+qiVIjLPjtBk=;
 b=dEScbDnCENXLTeFqvBRPLC+f9p2ub10xRY/VQ/LqN64/0lGqxCkcs1N0MPXgrWTpCn
 m3ZXB3uCmz/Nay7djAAT9vY4aldQcJOH3XDBUlFi4/CL6X5NhZRxnxGm+x1BlrV/zd18
 bIlJKWUMlHPbQZx+gf2QbRq0ar3WEuSMcKK34jGyaoX4YPbDeHwzB/SW0xDWZ2+ekyZ/
 xuZct/R7jsfGZAeFVKLCvsBRyTA4edKsTlNcSElht7+FlpHwjC9bVntvvpl++CEf5rw+
 wmfubJjJ/XASJncYTQaIfVMK6199O/9ziSf5wjfFq5aIxC7Eg3iSqgbOIdAHop8NLMXW
 T1OQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=dEScbDnC
Subject: [Buildroot] [PATCH] package/gnutls: bump to version 3.8.7
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/gnutls/gnutls.hash | 4 ++--
 package/gnutls/gnutls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index d9f830ec9..35e842546 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.6.tar.xz.sig
-sha256  2e1588aae53cb32d43937f1f4eca28febd9c0c7aa1734fc5dd61a7e81e0ebcdd  gnutls-3.8.6.tar.xz
+# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.7.tar.xz.sig
+sha256  fe302f2b6ad5a564bcb3678eb61616413ed5277aaf8e7bf7cdb9a95a18d9f477  gnutls-3.8.7.tar.xz
 # Locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  doc/COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  doc/COPYING.LESSER
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 479922ee5..a5012b1b2 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -6,7 +6,7 @@
 
 # When bumping, make sure *all* --without-libfoo-prefix options are in GNUTLS_CONF_OPTS
 GNUTLS_VERSION_MAJOR = 3.8
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).6
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).7
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
