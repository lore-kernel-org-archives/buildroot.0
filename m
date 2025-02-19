Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C60BC021AA
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 14:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DA568603C;
	Wed, 19 Feb 2025 14:37:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5OkjB9LoRZol; Wed, 19 Feb 2025 14:37:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2415886040
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2415886040;
	Wed, 19 Feb 2025 14:37:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 97477711
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 14:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84D6D84931
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 14:10:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hkeV1gdmsfCH for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 14:10:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A653A84918
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A653A84918
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A653A84918
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 14:10:32 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-22101839807so95240095ad.3
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 06:10:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739974231; x=1740579031;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u6C7GaELppGdmu1coX5bVZ5CwjLRgDXCVHQx9FOa2wE=;
 b=HR5GaOz54AvLV1EWRlS0u5PqGJmSfrQXK6zkn8fLaw0UsbTKKM9w0YOwnoyY0008Xf
 y0O9/y9y3KautvmM0Mm4qQt1xYkPBdUTQBa/Wu/3kknU7i4mPgeEOsl+gLeT7+6OGwyY
 LRY4HAjSc2O53M2zXzn/7ttOnhLz8dHAfcYjfkdnbX3hgKha5rxBlAeRZjArz+IdFg6G
 BiAYa8k0qg8ZsRvUFj4FcBP3lIWQlN1OUej0k38kzUjGIbsadQZg9M5VxQkhZGUh9Gh2
 aaJrvzhFO9n/qA0QchJORNRQS/+cRq+SdT2pwRU8dZXSSl3Dt1M3/34v7cfTua/TSGnN
 UdPw==
X-Gm-Message-State: AOJu0Yx05dZBsHTprGtt2wRWDMAA0SwHB23S5ukuon9Qr4ewiTx2G/Qf
 7pHGSRygN/E/FukXdZlWuGdwGiLEo7m9dsM/OizVhSEBXkojl4ZxN9qZFg==
X-Gm-Gg: ASbGncs5pldjddkdpAvT2oIFU6DbC3VL+/UERzmMOGxx+fIZHBFBWgodYPmfw0YwUEf
 7dDQz/BWQ8cKNnr8y0+V6aKaehfXX+x0SvLJyKiezQytuN5zYz5rOsWPDZ92oDAxfDFgxwxCCUc
 g6ZOzcLfPkF9xqlcCj+R6PWu9Y50W4sqSaTq1Blq0sqZdJHJQibQIQ4oEWxX5c2ud8takdpmROk
 CWGYiTU2UF1xz6OGSSSExwZDPDNI9ultdgUAzI3YuefkIgkaqiFNlVn7dvc57d2B25hjwEwOV61
 jatMpwDeNt3W
X-Google-Smtp-Source: AGHT+IFljiE6S6ullyrpoQZTC+2oyYS0qGUQSrjEQCnVnS6g2iYq979lvdhi8PuyeWI4NC/TMF0atQ==
X-Received: by 2002:a05:6a00:18a0:b0:732:1f45:fcca with SMTP id
 d2e1a72fcca58-7329df5c864mr5692719b3a.21.1739974230798; 
 Wed, 19 Feb 2025 06:10:30 -0800 (PST)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7326a52f865sm7840937b3a.80.2025.02.19.06.10.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 06:10:30 -0800 (PST)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Scott Fan <fancp2007@gmail.com>,
 Bernd Kuhls <bernd@kuhls.net>
Date: Wed, 19 Feb 2025 22:10:10 +0800
Message-ID: <20250219141012.796417-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739974231; x=1740579031; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u6C7GaELppGdmu1coX5bVZ5CwjLRgDXCVHQx9FOa2wE=;
 b=TfaB+rp6EwCPJwjcn9oQpfjK8+9uA67XGZ8M5pCHKuaCz2Tya3AWenqXfSpQPoSzkj
 KRJOr/F4PCy34wZNxQJS1nKSfrRlSg3MmJoChzo0n7d9VD4HcDfaKkbqYu4OBDNXm60K
 14WJpwX9dAGiVMYJM+RR6ytbPv3FkxaV+t85mHRW3EvqUIJzQ+AsVBs0P7AdpILlM58l
 Xu3lvPO+jokKq2Zup2dptF4mZ/IaBJxXcDt0zVpc1iOxcVUrW/c/HWYu9UDZ4ESUNEeS
 BhQV0DI93CiaYemSWwQQ/KxkE/pxBKINl0TqGFtajeGu2yJeGbEyz65oHbrQBpPLyuB6
 sJPQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=TfaB+rp6
Subject: [Buildroot] [PATCH] package/sqlite: fix build issue when the
 toolchain has no thread support
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

If the toolchain does not have thread support enabled, the following error
will occur:
  Support threadsafe operation? yes
  Checking libs for pthread_create...no
  Error: Missing required pthread bits

In this case, we can provide the --disable-threadsafe option, so that the
autosetup script will skip checking for threadsafe support.

Fixes:
  https://autobuild.buildroot.org/results/c9bb0d0128507302910a69a0aaec95942449afb6/
  https://autobuild.buildroot.org/results/b28181095400c26d49425c58c35aee79e6fff8cd/

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/sqlite/sqlite.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 8016ff1c4c..e51ade0203 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -42,6 +42,10 @@ else
 SQLITE_CFLAGS += $(subst -Ofast,-O3,$(TARGET_CFLAGS))
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
+SQLITE_CONF_OPTS += --disable-threadsafe
+endif
+
 ifeq ($(BR2_PACKAGE_NCURSES)$(BR2_PACKAGE_READLINE),yy)
 SQLITE_DEPENDENCIES += ncurses readline
 SQLITE_CFLAGS  += -DHAVE_READLINE=1
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
