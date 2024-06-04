Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60905C25B78
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 11:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F1EB40586;
	Tue,  4 Jun 2024 11:25:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l4_aNJYw8hos; Tue,  4 Jun 2024 11:25:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DC89413E1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DC89413E1;
	Tue,  4 Jun 2024 11:25:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2E65E1BF83A
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 11:25:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A9C784501
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 11:25:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FfYlHzJ1Ow90 for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 11:25:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CCC69844E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCC69844E8
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CCC69844E8
 for <buildroot@busybox.net>; Tue,  4 Jun 2024 11:25:00 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a68b334eb92so131056166b.0
 for <buildroot@busybox.net>; Tue, 04 Jun 2024 04:25:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717500299; x=1718105099;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NJDfD57nz42XZJkuP8hguPBhk3BnQkBUd4mQ8KXsXAI=;
 b=HfXxLWtbCT0U51uGunenBIhtW/g+4Lr0DkFes0WF6CiKHVM2nRngIcSpkUiA6CydFf
 yWmcIec0yOECsjf9cFyzZd7E9M3jddfYVJG3WcaJCK9Cdk/dOFTtntE3vTLa/Vi/5huS
 YwM7fHa5egZ9uCZrHJylDpjaBPv9pCu5hkOl/vWA7PJOiLxma7z487k6nnuO4prgKiW9
 7Ozun3u8E6CxsKDZgNnmEe5iza5ha8yv++Lw6yVv9VrXGF1mLSPE5Wg+KVCCASvs+Kxy
 1A0q3Z0YF6Ab/2TCvQHTHG0J5Xp7pCKprbl8jRCT3sqXSG6Hvf9LoYHo/hsu1p8fCGv8
 2IZQ==
X-Gm-Message-State: AOJu0YyoNn8EpJU6j0LV1NHuHRR6WGkHWNRub/L8AOCltffN6IgZ35CA
 X7RaeczTT3j+C9vZpvHk58U97xVjErCn1+tlIviXTITOGihjF4RvN1QjgKnLQ/oWQh0yKcGD9EZ
 trg==
X-Google-Smtp-Source: AGHT+IGk5aXJl0IgTLEEbFoETn3w6kwVKLbYF8uCUgHk0txCMir3nPKf5xq2wab2yxd/f79ysYgO9Q==
X-Received: by 2002:a50:9faa:0:b0:57a:30fb:576 with SMTP id
 4fb4d7f45d1cf-57a363470c0mr8299417a12.8.1717500298206; 
 Tue, 04 Jun 2024 04:24:58 -0700 (PDT)
Received: from vm-2404.. ([37.65.6.24]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57a31bbbe18sm7196837a12.37.2024.06.04.04.24.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 04:24:57 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue,  4 Jun 2024 13:24:52 +0200
Message-ID: <20240604112453.1097708-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1717500299; x=1718105099; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NJDfD57nz42XZJkuP8hguPBhk3BnQkBUd4mQ8KXsXAI=;
 b=qioramz0oO2+xpYo81tXZtfTttqGZBiuSoXzlIe4yR3+H7weiu9nI5O/1LDHIzAmPP
 6qHWYCR4z59EVNhy+IT/rEsGDymVuEMxXEl0QazGvws82Dl5BXOUOkuvskcBLlOed+s7
 D74tWs06QS0kN0agIMWmruYtqii5dZNNkvQkiOkxeyWClHr5P/n0vBMEf4ry+l8wyJRo
 qnRxJUzNBUrIiJ5Jzp8G84NIvWbuydnUxO7KsLa8HsQmG1V9w6zt8ZZA99ZlGqcGYZl/
 DFUU54L1OAjEke69Cvm77giZ5wnW2hhrg6JK8LULkKfx50d9SyJRrAFWjGEcI24xhEL3
 wWNA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=qioramz0
Subject: [Buildroot] [PATCH] package/libcap: bump to version 2.70
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
 package/libcap/libcap.hash | 2 +-
 package/libcap/libcap.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcap/libcap.hash b/package/libcap/libcap.hash
index 0f1501d31..dd9bc75a0 100644
--- a/package/libcap/libcap.hash
+++ b/package/libcap/libcap.hash
@@ -1,5 +1,5 @@
 # https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/sha256sums.asc
-sha256  f311f8f3dad84699d0566d1d6f7ec943a9298b28f714cae3c931dfd57492d7eb  libcap-2.69.tar.xz
+sha256  23a6ef8aadaf1e3e875f633bb2d116cfef8952dba7bc7c569b13458e1952b30f  libcap-2.70.tar.xz
 
 # Hash for license file:
 sha256  68467e731f4744bd6e0bb69e8df9c3a994e09cd6b203d0c41327ac6d079c581d  License
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index fe2f24ad8..a1b2636c5 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAP_VERSION = 2.69
+LIBCAP_VERSION = 2.70
 LIBCAP_SITE = https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2
 LIBCAP_SOURCE = libcap-$(LIBCAP_VERSION).tar.xz
 LIBCAP_LICENSE = GPL-2.0 or BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
