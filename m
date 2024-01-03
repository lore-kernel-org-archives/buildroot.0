Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACF4C47073
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 17:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43427828DF;
	Wed,  3 Jan 2024 17:41:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43427828DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g4MbHrjrwnDi; Wed,  3 Jan 2024 17:41:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 917A9828BA;
	Wed,  3 Jan 2024 17:41:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 917A9828BA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 667FC1BF3A4
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 17:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4CEC260AF6
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 17:41:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CEC260AF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JKVS_a49ELY6 for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 17:41:20 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A02860AE2
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 17:41:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A02860AE2
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40d4a7f0c4dso100156295e9.1
 for <buildroot@buildroot.org>; Wed, 03 Jan 2024 09:41:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704303677; x=1704908477;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hlbR998zO/Q+0xRw+EWVpgnuIitC1S/YqmQJ0YM9uLw=;
 b=deTRRszelxRse4k+vN7SRW9Lx5vglehqZInQdrbwc1cTgxZQJF2hZ88Mq2AiNTeE9Y
 w8uCYAJZ7WJQZHwtOl42Xe70yQukKAh6asQJFq4rk1xaLcwBpi9lhPuJknTuyOdBQZAu
 lpxd3ELGDSrbo33SrRjE8aGpnXcq2qFtdJ1bBircnyoLRY5LdtAm7GGIxRqP9Vr+f0TT
 lBCtIri0ZyyiVTa0IECb0rdM8fGEYnh6cmdyWnJoCO6YEqMh2X+xhNWX9AeQKGr8klZG
 Jpt9NAMckAkmhVrNcq+8eNwW1t/5maXDkTPn3YovY/RbyjsS1gNDXG9YbyL/Enc11c5y
 KUTw==
X-Gm-Message-State: AOJu0Yz9va8nzB8gi8diRoBAWjEOprdg4sH2R5fyPrK4YDD0WNkksqS6
 CxW5fKSYaMLr6sMnQxA+qHS0HqrD0TU=
X-Google-Smtp-Source: AGHT+IEXWxT97tV5o9XGXxv+VbI1I1FNlTBAa1/73AgbIdzI6SBtSRbR6LgBR+RUVASRjHuDpJOEgA==
X-Received: by 2002:a05:600c:4384:b0:40d:3b3f:6040 with SMTP id
 e4-20020a05600c438400b0040d3b3f6040mr10338631wmn.45.1704303677386; 
 Wed, 03 Jan 2024 09:41:17 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 b14-20020adff90e000000b003373fe3d345sm8003712wrr.65.2024.01.03.09.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 09:41:17 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  3 Jan 2024 18:41:11 +0100
Message-ID: <20240103174111.853264-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240103174111.853264-1-fontaine.fabrice@gmail.com>
References: <20240103174111.853264-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704303677; x=1704908477; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hlbR998zO/Q+0xRw+EWVpgnuIitC1S/YqmQJ0YM9uLw=;
 b=eZLFpKgppvdLnuG0eFfftSzMVMZb9SWfCjdHAdQanLfmO/0dNU6kK75X5za5W9r3VE
 TWcS7aUYQufBJu+EYDmh0xjqyKx/wvLWQjfPxxUp02JVRfr3fRKQ26qVq1ORkPBlqOEL
 +aoUrYTbKmvkVs9zU/OHIVzA64tUm3pNQYg/+OheVNZyRkkN4V4z3H+8bmcj9e4AsrzK
 xKOh4K5a7jH18gYGNElKmdrgB5nxywDc+SVR5EdMPUFksq/8f/Qh43LXUm8pkiDB+nWh
 NGWirYmmPmnqpRxQBy2HUK/rRPToBng2EkViwQmDcL1Lgt8+wDrya84zvXwkjwxuSMnh
 JSBA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eZLFpKgp
Subject: [Buildroot] [PATCH 2/2] package/valijson: bump to version 1.0.2
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update hash of LICENSE file (typo fixed by
https://github.com/tristanpenman/valijson/commit/c0ce4cde7e89c1a88a82ddc4ae32727e1a01998f)

https://github.com/tristanpenman/valijson/releases/tag/v1.0.2
https://github.com/tristanpenman/valijson/releases/tag/v1.0.1
https://github.com/tristanpenman/valijson/releases/tag/v1.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/valijson/valijson.hash | 4 ++--
 package/valijson/valijson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/valijson/valijson.hash b/package/valijson/valijson.hash
index aacdf7dedc..592d2c900e 100644
--- a/package/valijson/valijson.hash
+++ b/package/valijson/valijson.hash
@@ -1,3 +1,3 @@
 # Locally Computed:
-sha256  bc24736709acfb252a5fdcb5145f1f2670c7aecaba3356f6f8ba54903800fa5c  valijson-0.7.tar.gz
-sha256  1a0f99926a2dbec30eba3db820236d9953fbe3048976923ac24980e655fbe991  LICENSE
+sha256  35d86e54fc727f1265226434dc996e33000a570f833537a25c8b702b0b824431  valijson-1.0.2.tar.gz
+sha256  61b5766db38eaa3f320c366357956d7743424bfbf90fd78f5943866ba237589e  LICENSE
diff --git a/package/valijson/valijson.mk b/package/valijson/valijson.mk
index 875c913b09..5b68dc9864 100644
--- a/package/valijson/valijson.mk
+++ b/package/valijson/valijson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VALIJSON_VERSION = 0.7
+VALIJSON_VERSION = 1.0.2
 VALIJSON_SITE = $(call github,tristanpenman,valijson,v$(VALIJSON_VERSION))
 VALIJSON_LICENSE = BSD-2-Clause
 VALIJSON_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
