Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A85ECAC599
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 14:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD93F610E2;
	Wed, 17 Sep 2025 14:41:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NXji5uesKOeK; Wed, 17 Sep 2025 14:41:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74374610F4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74374610F4;
	Wed, 17 Sep 2025 14:41:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DDD3199
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 14:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F16983BB1
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 14:41:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bmry7UMnA69o for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 14:41:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::543; helo=mail-ed1-x543.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9573881AD1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9573881AD1
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9573881AD1
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 14:41:12 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id
 4fb4d7f45d1cf-62733e779bbso10089711a12.1
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 07:41:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758120070; x=1758724870;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Au4dMXHQbC9UZ0PB07hiCZk/EIoOuYxvPO76XOLXl/g=;
 b=Qe7ov/agoBq3EE7o/z1I+1syM7KFf7EMVov2mADXII5mfuGvL087IBCjfpG1pFJNXG
 cHi5nGhJqQ0l9KM1VYbpVOhURgzlBzueq15wVD+NZvHSKxpC4FG4f251pXAGRQ9xv6N8
 +hrtPCzA5EjvsvtL/lEc24jAW3vl22rtyLCHEKxslFn/xZEyxCBu7mdt7BptrsEg7lzB
 xTvlwsSKATAj7te8teuGxiirFplE/DxzyVaTU0WAs0tYB7ECDJk3etqK3U/5zjA0F47V
 lm5Rcql2sKwEH3p3yKw8fdt+2mdhI0am3Z5pmLN5uQckKEUzj35x+TRmEaPc/2nX5trl
 UKlw==
X-Gm-Message-State: AOJu0YyoeCf7iJ9eY08nKSCIE3yEFq55zm9xQJ0r7xSVmAPgAD8pRlIB
 4J+VuM5woKq19JrL2Sg/UZFrrUM/hVGnqwOS6jNHSeIlTKJLk9iFlitjZyzNwtirqusstABt5/U
 4fDquWS4vLg==
X-Gm-Gg: ASbGncu4liCy8hUiJypzQ/sbpCh+vP9t5GchHcQq3Hj8nSXeRriG+wTVLLnHcr7GIv/
 lDQ4jiJSb2Ca4BBIfxQF8dCa6uzf/hLNfm3fmG7l4vxA9BljsSzZyyEDlYYR3zQ7E6dnu+2wvWD
 rtIhAjj5+W1tBPYgb9FZuF4E6oqeF05cCr1CB5dMjH8lS9a7fIwFUSYRAVNxElh3W4e/nNltpEo
 cP/LfWkiS24bozojV9IQsy2BX/iDSyxcUNBUa9G7+MZ8Gjf1ArkBJS6+lhBpHSr5/zp/XPfq+Hs
 Lq7+CDvtvePJCIpj8l+OO1fLdS/udGVqb7IDLI+5X8EnczkFv1sNgOUlOodMDvbbkyE6sFxsNly
 0kx9DjblWNfT3ejp4+fipD/hlUDbbsFi70uur
X-Google-Smtp-Source: AGHT+IEPVqRoWIYa+lh2i0rizcprRvtrkSjPjP4CVD/M7xVMeNVJgSV/6vBAgjQJKRuvMgrzL3GeCQ==
X-Received: by 2002:a05:6402:2693:b0:62f:2c1a:920a with SMTP id
 4fb4d7f45d1cf-62f84230517mr2591207a12.16.1758120070138; 
 Wed, 17 Sep 2025 07:41:10 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:73a7:c001:49b1:76d4:3e52:5347])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62ec8c8ee5asm12956974a12.4.2025.09.17.07.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 07:41:09 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
Date: Wed, 17 Sep 2025 16:40:53 +0200
Message-ID: <20250917144053.350712-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758120070; x=1758724870; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Au4dMXHQbC9UZ0PB07hiCZk/EIoOuYxvPO76XOLXl/g=;
 b=ADGiVvQdaDQpbXhKq+NAnGWolVy3R8lLntOwfr3QzIppOJ8aYUYSYJzWfHdJd1e7Ce
 /laKfheONRSsQWdpPhHTReRv77Oaq7ISB4U1b8ZO5tFlfJ28qFMRKO04vkzLdU5A9Ufl
 4Mvykzvx9jpBuvNEuxQom5QWpy9KVDulVfDhADIuLi8jBNU1s9WfqEqu9it4LdUX7oll
 o1UHxSoAsr1Y9ZBNw+d+Ekp30aVo4d7ff4++sfS1tkgNwIfp8zxyw6Lg2Xf6kGrqb9+v
 smaR0UMe3kGrj7I9Eobi27cKICWjma3Luq3PdUg6DTVtOnWaq7ab/xRNFVz1CHq7gcXg
 MyIA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ADGiVvQd
Subject: [Buildroot] [PATCH for 2025.{02,
 05}.x] package/samba4: bump to v4.21.8
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the release notes
https://www.samba.org/samba/history/samba-4.21.8.html

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 21e5b6c9e8..9fff75bcb4 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.21.7.tar.asc
-sha256  a395414ee573ef3f5313b274d463866356a53acc7b5e48fb9b5ad83c6ad4a265  samba-4.21.7.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.21.8.tar.asc
+sha256  e78c36653a37e9647513e5408fc8052375901560d36b8744cd21acc9e4d91fc8  samba-4.21.8.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index e5aa0ce31a..7895ec4a4c 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.21.7
+SAMBA4_VERSION = 4.21.8
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
