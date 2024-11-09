Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48BABD64097
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 00:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05E5B8460F;
	Sat,  9 Nov 2024 00:23:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id watHw45hf_cq; Sat,  9 Nov 2024 00:23:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18A5084604
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18A5084604;
	Sat,  9 Nov 2024 00:23:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 71D8AC2
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 00:23:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6102860617
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 00:23:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TVOt9IeVM2u8 for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 00:23:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12e; helo=mail-il1-x12e.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8094460616
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8094460616
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8094460616
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 00:23:49 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-3a6af694220so10211015ab.1
 for <buildroot@buildroot.org>; Fri, 08 Nov 2024 16:23:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731111828; x=1731716628;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/403LF5t5OIIJxBAzYgE5M6AnIZ1kqAwIdCwX0vpoB8=;
 b=bwrt3TxiTd32LDXiYAY4J5Vqh9ByDAQrSWeZmF+qRAX1TWm8RfHyjX7VNBebohJrLP
 NE10hgDJCKgfZIFDWmgv60k6Wp3kKMJMj0BbBGfbjj/baxABUII3eGZsHhv0UN2P+izh
 7IGjsNQkV6EAX1W50/HFmlmFKIa7FyTJ8a1b6EWuSmj96oSF5l3q3+2C1yxwmE8uFWj9
 vr9XtefooZNKEP67IQyqFMkx3jc0TLGnw/5cFnJ61W6CYRNDbrVEANw9oiGPLXtvN3Bk
 WMtvRfWNRx6r+v7zzaIKknGJ8E96jNkBCxC6jVUf1ebbFXUio8+44ofkhmzZgrSpX9+q
 H3Zg==
X-Gm-Message-State: AOJu0YzhqRzyG6dvw4iaUrfFFkgqCygB6fZMlj1XD3zoHRCS27NnfsM9
 5wcsVSnunfn9rkwA6tFMGkdql9139jtZoUtJzwh0p2B7lkkxqOhE
X-Google-Smtp-Source: AGHT+IHRBNPWkMzu6pd+Ibhd0o5QA/ak1QKES3fhBIqCF/FWi6LlAWTGhFJ/tMUt86ejn7bEYGA1xw==
X-Received: by 2002:a05:6e02:1885:b0:3a0:9f85:d74e with SMTP id
 e9e14a558f8ab-3a6f1a6ed4cmr56900495ab.16.1731111828322; 
 Fri, 08 Nov 2024 16:23:48 -0800 (PST)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net.
 [207.191.210.45]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a6f9838277sm673435ab.25.2024.11.08.16.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 16:23:47 -0800 (PST)
From: Brandon Maier <brandon.maier@gmail.com>
Date: Fri, 08 Nov 2024 18:23:40 -0600
MIME-Version: 1.0
Message-Id: <20241108-dtc-1-7-2-v1-1-1141a7b163e9@gmail.com>
References: <20241108-dtc-1-7-2-v1-0-1141a7b163e9@gmail.com>
In-Reply-To: <20241108-dtc-1-7-2-v1-0-1141a7b163e9@gmail.com>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, 
 Brandon Maier <brandon.maier@gmail.com>
X-Mailer: b4 0.14.2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731111828; x=1731716628; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/403LF5t5OIIJxBAzYgE5M6AnIZ1kqAwIdCwX0vpoB8=;
 b=aTFQGmHFOsXgh1M88fFONSTc7M0ckCCk4WyFmg6cU6sp4F5aiFUMUTSFPw+p53oglc
 OugASlDe3S8/PAVKobGef87u8d/GaqX17C1tXnJtnhLhMBQBGAP42CEuHJMsw4ORofxY
 CHSyzr/V9DF625F+NyEeeBKqv3WJIm+guEol12I8O4jGFkdXsTkA3q4ZIjHlAcRXZwlX
 T+MiHJelwdLvo1FAHzlpyRCVOAbJDe5DRaj8yYPOjigzUS2QSMF5CTOGaOUzKV8/EDn/
 hRcuJU4EL4JMyH7gjzH8x4C2DUCeyTPhUo8TJDo22JeWnM02jO0P3QUAE6uSk7uyWZSa
 UWBA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aTFQGmHF
Subject: [Buildroot] [PATCH 1/2] package/dtc: update to dtc 1.7.2
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

Release notes: https://github.com/dgibson/dtc/releases/tag/v1.7.2

Signed-off-by: Brandon Maier <brandon.maier@gmail.com>
---
 package/dtc/dtc.hash | 2 +-
 package/dtc/dtc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dtc/dtc.hash b/package/dtc/dtc.hash
index 325a80880918146ec2bf08da0d2d0b1813acdc64..f05e902df0817d1ead1cb43a8f7e2c8316316a43 100644
--- a/package/dtc/dtc.hash
+++ b/package/dtc/dtc.hash
@@ -1,5 +1,5 @@
 # from https://www.kernel.org/pub/software/utils/dtc/sha256sums.asc
-sha256  398098bac205022b39d3dce5982b98c57f1023f3721a53ebcbb782be4cf7885e  dtc-1.7.1.tar.xz
+sha256  92d8ca769805ae1f176204230438fe52808f4e1c7944053c9eec0e649b237539  dtc-1.7.2.tar.xz
 
 # Hash for license files
 sha256  78e1e1ce5728a990d59c7de61d4741c49185d5129daf783b386380a214328d68  README.license
diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index ce5ea05da7882fcd0affaacdb73654db2168cbc6..5b810c6e659c39bbdac177052f0cbab7f9b740be 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DTC_VERSION = 1.7.1
+DTC_VERSION = 1.7.2
 DTC_SOURCE = dtc-$(DTC_VERSION).tar.xz
 DTC_SITE = https://www.kernel.org/pub/software/utils/dtc
 DTC_LICENSE = GPL-2.0+ or BSD-2-Clause (library)

-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
