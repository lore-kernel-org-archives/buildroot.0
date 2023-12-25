Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C343C3DA6E
	for <buildroot@archiver.kernel.org>; Mon, 25 Dec 2023 19:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 759E181438;
	Mon, 25 Dec 2023 19:38:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 759E181438
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BQo2cG_LAnjt; Mon, 25 Dec 2023 19:38:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA33781429;
	Mon, 25 Dec 2023 19:38:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA33781429
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C53F41BF28C
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 19:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9EC9C813B1
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 19:38:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EC9C813B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V52r8j9qNlIO for <buildroot@lists.busybox.net>;
 Mon, 25 Dec 2023 19:38:51 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C39CA81394
 for <buildroot@busybox.net>; Mon, 25 Dec 2023 19:38:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C39CA81394
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40d2e56f3a6so21871755e9.1
 for <buildroot@busybox.net>; Mon, 25 Dec 2023 11:38:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703533129; x=1704137929;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9glFXDvffMsAsru4TmQs7soS7dpmk7XOCuYOv/UWOa0=;
 b=k2Rjcizxh/1iZUDs9RWXNu6BYKL4nJUV4jBDEn4hucrwJP79RaIvII7ZQjPYB/DCht
 GXj6IyyhpfEHajSThYlU8GpEv4VKh7rl58MaxeOFyLgoZ/YSxR2ngt2kxUNNZEX+8zTy
 OOFvMmnaSGMpxBRTcILCwc8zyz8P0FHNaObviYiTOgE6fdOSBiex3bl6QHm5yYSARTsq
 w6QmUdURKxyK/cGn35xyysIghGqgj8fp912CDHhD28TdnmlHfcVQUm2nQa3UAadICHzQ
 17NdCK5rqIr3LjND6R+i1ibvNlYXBh8SyrwCa/rLCYw+8SVES0dKN2uCBFdlyvGDzwg7
 UzUQ==
X-Gm-Message-State: AOJu0YwsjJk76Ku9aQzyMMQkFrEqC5VrwPv+W6RDOf1PSHneQTVPPACa
 dOI5yyughVazBXabUAHEH17Tnoib5Zw=
X-Google-Smtp-Source: AGHT+IHJVhRMbk5HMua8Al9m0t0xKPRGHtBRcMdnb/awW1I5jOlbCltax6gxpcb2Cpk/IWiUl9i+/A==
X-Received: by 2002:a05:600c:1d26:b0:40d:2876:def6 with SMTP id
 l38-20020a05600c1d2600b0040d2876def6mr2988089wms.45.1703533128414; 
 Mon, 25 Dec 2023 11:38:48 -0800 (PST)
Received: from xubuntu-23.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 c10-20020a7bc2aa000000b0040b2b38a1fasm18032879wmk.4.2023.12.25.11.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Dec 2023 11:38:48 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 25 Dec 2023 20:38:42 +0100
Message-Id: <20231225193842.87962-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703533129; x=1704137929; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9glFXDvffMsAsru4TmQs7soS7dpmk7XOCuYOv/UWOa0=;
 b=kR5Ex02CKSlwtN2zLOgF+OOmOTLLSpxmpWQHHG2V8XXhAoWgpczd4q+L0P/ErJ5+Ep
 R/DjKYRzLqAwdRag9u32zpqrruYRIGJo/TMouzgxlcICm4RPd8/0JPX83POx5rKE9Mfi
 vcouDhjEYRfb64IIDpKH5YbZWBtISTQ0Ao1L7lgHJDauvIHRUr38M8WhWUGb/sRNCPCl
 Ng7YPKcYtboLCKaxyhJiDy4RNdPzOx6QRXdkXSYwYWL5DsefIgVrUCBa/gD9VnDkkKgN
 sWGdthaajB3FQPeZYlwx0gKPdfa3gF1oDcVsQSjY24k+fsMcVW3IZ4nx7hPkBBrweRt4
 g+dQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kR5Ex02C
Subject: [Buildroot] [PATCH] package/libatomic_ops: bump to version 7.8.2
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
 package/libatomic_ops/libatomic_ops.hash | 2 +-
 package/libatomic_ops/libatomic_ops.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libatomic_ops/libatomic_ops.hash b/package/libatomic_ops/libatomic_ops.hash
index c6de93fb4..1710fd3a4 100644
--- a/package/libatomic_ops/libatomic_ops.hash
+++ b/package/libatomic_ops/libatomic_ops.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  68c5970b11297056c8e5c63a73f26621a8eb8c667a5fe9a2b3e3ff6c0fbb3177  libatomic_ops-7.8.0.tar.gz
+sha256  ad8428a40e01d41bc4ddad3166afa1fc175c9e58d8ef7ddbd7ef3298e32ac37b  libatomic_ops-7.8.2.tar.gz
 sha256  969294c9324b2d360ae2a08edd5ca6f9cd754cb71b71e56bee15d2f10bb10496  LICENSE
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/libatomic_ops/libatomic_ops.mk b/package/libatomic_ops/libatomic_ops.mk
index 0c72b1725..bf6994b3a 100644
--- a/package/libatomic_ops/libatomic_ops.mk
+++ b/package/libatomic_ops/libatomic_ops.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBATOMIC_OPS_VERSION = 7.8.0
+LIBATOMIC_OPS_VERSION = 7.8.2
 LIBATOMIC_OPS_SITE = $(call github,ivmai,libatomic_ops,v$(LIBATOMIC_OPS_VERSION))
 LIBATOMIC_OPS_AUTORECONF = YES
 
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
