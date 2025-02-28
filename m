Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD62C19776
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 14:48:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D05B6FA39;
	Fri, 28 Feb 2025 14:48:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wANiAOf_hWJH; Fri, 28 Feb 2025 14:48:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F8D66FA31
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F8D66FA31;
	Fri, 28 Feb 2025 14:48:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C37168
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 14:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B338160B20
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 14:48:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hHdFqwJA5hTi for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 14:48:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B613E6064F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B613E6064F
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B613E6064F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 14:48:28 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-abf4145368dso7075566b.3
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 06:48:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740754106; x=1741358906;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bJCq5kC5kpijHAsnynTEJ8LphFfxi7gIbBGC12jW2dw=;
 b=FrFXD60QISI0QcCo6/iVEwoKkWQQFg0igTqPvOaaApjBzwTFbmYFOe7vC59WQNI3Kc
 kDtxa9o6HnLTVUCy+8Aaz5PosZGxdjDBkL21FhYqdgj6LLH566xd6xqvgIW+4Wq+bq9V
 OBvBmwvHKzSiZxAUqgscoSr2oiZxYDyFi+4NJi3P8xTQ5QcdqISBa1y0hb4DbL5oHrcX
 JQxJYFfsXa9ttbu2PVZznhNyqWGeylsZfmzJIEER66iN1nCJea6z5Uu8rqpa296+BDBs
 wHWRKJxR9fJ4rI/Zr+tO36HkCcH+iOYp6ToZBAIx1/Uw2tX91hhUlzCurgav0d1Ni36J
 53ow==
X-Gm-Message-State: AOJu0YzvfpMeQuMBMDxOSn3J5lHw3/5UfDbpeS1Og7zclPWiXdYuTRM3
 NeXWxfzcifesghZ2JhNZK2r/AKbPiBsxe4ZO7bq0k0VQGeJiyjezCTvoma3XnlPZKEPoRdXwafi
 K
X-Gm-Gg: ASbGncskkXld1BLp40n098iISFy5YAIkpZ1sKDH8Gg5qFRs4rMadxFBkubjwEz5ZKJJ
 t9xNK9sFYdtBfU9qArzG31BL22zBS0wRczrxOfAcKLXH9AsFvZeoQCI0OE6/JWYITLcgTmQNY0m
 MVTHly8ctJatOBqDIIpJ7MwKegmUkNjGubYR9iqIgfU5IBfHfzu5B3z7WQlpf5j8e5wLUpm8hYH
 HB4jw/Xl3yLeZYAcY9OPPbH4GR23/LswBpEoVqD2RPym9hNc9fgacw6YYrxSPxU7zUGtNAX6RKT
 sJ4u7TTp6VY1DQ/00G544bIxh75ZrMpxHfFXJwPzJDq79nfWruaOkAz3cjLszzaXkeaq+hqN85g
 pRPD25yhT9gsd
X-Google-Smtp-Source: AGHT+IGmUmQj9OgLMuLastWEcKX7lXlrtNMdIvmsKLNIEgRK3b/rwUR+jYXoc9MZTIeL2cwA9PqP9Q==
X-Received: by 2002:a17:907:728e:b0:aa5:a60:ad6a with SMTP id
 a640c23a62f3a-abf265fe809mr139088066b.8.1740754106576; 
 Fri, 28 Feb 2025 06:48:26 -0800 (PST)
Received: from fedora.ipgroup.local (212-57-59-66.xdsl.deanconnect.nl.
 [212.57.59.66]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf0c6ee4b3sm293663566b.112.2025.02.28.06.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 06:48:26 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Fri, 28 Feb 2025 15:48:21 +0100
Message-ID: <20250228144822.860085-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250228144822.860085-1-adam.duskett@amarulasolutions.com>
References: <20250228144822.860085-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1740754106; x=1741358906;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bJCq5kC5kpijHAsnynTEJ8LphFfxi7gIbBGC12jW2dw=;
 b=qACM/zGaYahKPTyYtzSPt/mi+X1cztucayVA7FRaLjP8+9KSBRCKG9Ac+lAZdU5UcP
 sIIwbFOI5oKloxp2z/cCnuRnd5JM/jazl/vs0QG7wn5HHzPXRVle5LPRJj1beG+6j7Ub
 /4TlwttM2kBkfE9kr7ZJYGMBXH64N4qa+lN/M=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=qACM/zGa
Subject: [Buildroot] [PATCH 4/5] package/flutter-sdk-bin: bump to version
 3.29.0
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

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-sdk-bin/flutter-sdk-bin.hash | 2 +-
 package/flutter-sdk-bin/flutter-sdk-bin.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.hash b/package/flutter-sdk-bin/flutter-sdk-bin.hash
index 02fee767a3..d47a72c498 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.hash
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  61497eb64cd7b3aa99ca9911ccd921c8dab79afd909ca1c9ff9546067ebcf6ca  flutter_linux_3.27.1-stable.tar.xz
+sha256  1f98f3de2931e1d097970e56df691b035f6840aa05be632c4fa2a2298c7cfdd8  flutter_linux_3.29.0-stable.tar.xz
 sha256  a598db94b6290ffbe10b5ecf911057b6a943351c727fdda9e5f2891d68700a20  LICENSE
diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
index 68cce21eac..cf76b6becf 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.mk
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_SDK_BIN_VERSION = 3.27.1
+FLUTTER_SDK_BIN_VERSION = 3.29.0
 FLUTTER_SDK_BIN_SITE = https://storage.googleapis.com/flutter_infra_release/releases/stable/linux
 FLUTTER_SDK_BIN_SOURCE = flutter_linux_$(FLUTTER_SDK_BIN_VERSION)-stable.tar.xz
 FLUTTER_SDK_BIN_LICENSE = BSD-3-Clause
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
