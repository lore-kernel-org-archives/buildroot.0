Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A64BC36008
	for <buildroot@archiver.kernel.org>; Wed, 26 Mar 2025 11:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE73641434;
	Wed, 26 Mar 2025 11:17:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ThtNIMgR2u5o; Wed, 26 Mar 2025 11:17:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3F2C41416
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3F2C41416;
	Wed, 26 Mar 2025 11:17:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A599E4
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 11:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5689408E9
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 11:16:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yr8N8ZUvAnZu for <buildroot@buildroot.org>;
 Wed, 26 Mar 2025 11:16:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1E2C041575
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E2C041575
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E2C041575
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 11:16:58 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cfecdd8b2so52944815e9.2
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 04:16:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742987817; x=1743592617;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4ymr1Kh9Rk+eUmiSLos1v+sg8GwFeDXyVCiXyZhd1XM=;
 b=rUv3nL0i0IC1e8Rdp5/BkhcVsnwG1hp0LsmINoS36ccCTZvsl8v84g+jtMVWnsukqn
 FQbqlF7gO6YkQVBVBEpwjgk1sPLsKtDxdbF/4kY/7r0DCo3LPeT5F9f5eAUbLfqva5jz
 LxFrCmo6oTcZjoV0dV9sey5o7bBR2XPYZ57lT6CxMshjFkg/TdljECouFtCmvCG7nP5X
 AEHpu8aFxDUZ8sE3FTXE4N9mDYpVmFft8B5oZNJKGeSRSjmIIJpt1uDAGpORHxkBgSlP
 wkWxw6mBK0+q+w9z0454h5F19Iwvi2DxNNPT2lbS9f0Utc5hrwL6IdN7I3L3Mw8DrCbi
 jQsg==
X-Gm-Message-State: AOJu0YwIUBXD4tlAViDqr8RMPXtJLPR0B1NmFFFlx3h0mBeJ0i1qpKF3
 +LLf1ubO0rDbz4XegOsqp5yRWJsAfC8K6tqWbvJu9wt9c8SpNZF7OMkiDVt2mZQ=
X-Gm-Gg: ASbGncsLbOzcYY0U/EAueOvtms4elGKoI4OxSbjaHvZFr0S4o3/w6nYMBzxKbCZ8Yka
 nqKgT4Rh2kP0vXhYprCcL5I9OKGFpHm7rk+iedEx0/dDgzLgTeAaTk98xOyiesaZwYo+sJgMigq
 sllYM3Fmgm428ZwXN9hbyUqP/axcjhUTw6HuIZj4yhPTsCA7hZtBSNUi6ZwqkoLo3TaY90seASx
 mBGW5C+nXMKSpA+fwX1b3GSgmr12rLVd9uuqvhc2My6CZz1itULzOSq2b4CfhGFRn0ONmCNX/jg
 YkPcv+XdqABh3ITjjTD6ymGne8KEGpTvEyZuM5LG9b68vm/5YA2edJdS5imdAU8/GhZmirAuUg=
 =
X-Google-Smtp-Source: AGHT+IFjxQZcfOifInXWuEJmSPL5GWtKLdmwLWYKUz5J6txVPC6iLQaj11QNgP/jGrgulDkURjesUw==
X-Received: by 2002:a05:600c:138a:b0:43c:fcb1:528a with SMTP id
 5b1f17b1804b1-43d509e04femr193343545e9.6.1742987816364; 
 Wed, 26 Mar 2025 04:16:56 -0700 (PDT)
Received: from freepad.iliad.local (free-reseau.vlq16.iliad.fr. [213.36.7.12])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9a3f2asm16677145f8f.30.2025.03.26.04.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Mar 2025 04:16:55 -0700 (PDT)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Vincent Jardin <vjardin@free.fr>, Robin Jarry <robin@jarry.cc>,
 Julien Olivain <ju.o@free.fr>, Maxime Leroy <maxime@leroys.fr>
Date: Wed, 26 Mar 2025 12:16:50 +0100
Message-ID: <20250326111651.23707-1-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742987817; x=1743592617; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=4ymr1Kh9Rk+eUmiSLos1v+sg8GwFeDXyVCiXyZhd1XM=;
 b=VkceeHLSdZs6WEhdFCvQe6BqujliCo5fSyO0WAqu2rGHPP8bmydEB/KjHrHU0+p6tG
 4qXciuZ0smYlMrak/SvjH5eoMdKBd71tVlyfyNr3+JxLi3Er4oooewCihpUBKI2s10yT
 LhZV7tUGt3Vbl+WbK3eZnr3jYFLKxsFHyt0njQcFxEViXRiUZrCsiqjAMUhLwCX+Jqx2
 qDaBPYjKv+Vjo/xsOr7GAR3pAeOzEcQ0fUKeN2t15LAqmgtz+UNq0OZ7n3vrh9qORXG2
 4SZ9cn00F7x6eOKdTjeC6+uN5VIotKiDoDurnHdQdVahweP4bS5nTsbqVkwsQkjlOnMW
 c+qA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VkceeHLS
Subject: [Buildroot] [PATCH 1/2] package/libecoli: bump version to 0.5.0
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

This new version is required to compile grout v8.4.0.

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
---
 package/libecoli/libecoli.hash | 2 +-
 package/libecoli/libecoli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libecoli/libecoli.hash b/package/libecoli/libecoli.hash
index 433550f91b..f973b6f254 100644
--- a/package/libecoli/libecoli.hash
+++ b/package/libecoli/libecoli.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  e66a85a35bae644b0baf9a4e6d084ff926ebaa12023f9df9f34e8f7a46834da8  libecoli-0.3.0.tar.gz
+sha256  bc9ca742f32dc7787146de4cbc3997b28356adaf219049304bbc3368d25b7395  libecoli-0.5.0.tar.gz
 sha256  e58bf9ec962bee9b3e37abcaa0bc0ec940b05efdc1d1a5a4d9e2fdbcc08b7bdd  LICENSE
diff --git a/package/libecoli/libecoli.mk b/package/libecoli/libecoli.mk
index f260467d1f..f989e7b9cd 100644
--- a/package/libecoli/libecoli.mk
+++ b/package/libecoli/libecoli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBECOLI_VERSION = 0.3.0
+LIBECOLI_VERSION = 0.5.0
 LIBECOLI_SITE = $(call github,rjarry,libecoli,v$(LIBECOLI_VERSION))
 LIBECOLI_INSTALL_STAGING = YES
 LIBECOLI_LICENSE = BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
