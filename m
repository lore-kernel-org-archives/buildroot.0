Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF0F5C77B7C
	for <buildroot@archiver.kernel.org>; Wed,  2 Jul 2025 17:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 912B161011;
	Wed,  2 Jul 2025 17:10:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NMfCTMzwVysG; Wed,  2 Jul 2025 17:10:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7ADD6073C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7ADD6073C;
	Wed,  2 Jul 2025 17:10:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 00DC9128
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 17:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBAB940427
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 17:10:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f8BbHYggJSzZ for <buildroot@buildroot.org>;
 Wed,  2 Jul 2025 17:10:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DE14E402BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE14E402BB
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE14E402BB
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 17:10:36 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-451d41e1ad1so47753025e9.1
 for <buildroot@buildroot.org>; Wed, 02 Jul 2025 10:10:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751476234; x=1752081034;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UWuTaV0a6wTapN4tXpLb9HXNlK91kfrYnJkWRXhzUvM=;
 b=QHIXEIHy1/OLopFMqH3sX+AnSub092IdVaXX9QB1cZkBXphM0OdUtSP1X2JNZh4KTT
 bm9M1ZsLNFy/8AVKPf3T55fzxaFNKliaYeIJcHsTYN2wUvLd8mp1c8tbh/HpsFGJ4kkQ
 ds5IqEcjpUYctmIsxOK5MDHiEHuorvrtcBH53dl2xayAAnopHrJCzommaFD6vtzJxCrS
 xI3jwp95qFvVs/uy3rOdXlgxpOgZUxo7mjUbi6KuYJrvc5SUaNZo9hB9gwOYpecuMY79
 Iu6gSQT3sEyk/ZTwrEpRkK1ck3svz4ihUubZ49ox/7g/eKIOTINlziHWZ3nn7uze8+Rk
 pSdQ==
X-Gm-Message-State: AOJu0Yx9b4QOR+bx5uODPg4U0F/hYMdi4eKqsJzy4kXA9kZ4fWiIDIay
 kdcDygqqLQ1WlGxAPEidLHjrbTzLPY2L84RzcOtJn/kirlXyLrcw0GUXyD4qnSfPnuYyvjshb4m
 qN+oE
X-Gm-Gg: ASbGncuRM7H3X8li6IqETzM8zkMniAVOqsNkTpqTVJu3mZkygZm6RDzHdMonRpxm4Ym
 RZ5RO1q9OkhrmGB2qwsemqMDoWPjkOrgz43aFDWRFF+V8Dvf2cQRbS7C6+UD/J0l47RG6CeQWuW
 +QSq35ix7Acm0arn756RH9hjm4lST5NSxeTP/iISJVtRXAxcHOM6sydoGPvEZeDZNrort7RKS9A
 fJPUaFeG5S0Irw7g/25251lxs/DZ+YCHWgWZMdBOaqizdQwm8qn2vuL+IFaoBE2vH7UMq83Aj4t
 9w0wx9J8jVyTQ/zZHetIOFfSY4T39vtn/KpBd2q+P9aDPl+Coq0YWmFHRQNdbWlRW/DAc+J+WxC
 xBQWquDzXjw==
X-Google-Smtp-Source: AGHT+IGbpnWR9XKx+E08+swvSb7Mm3DVxzdSzrMprKCLNFWRZV3VYKLid+trMQgZXK0q7Rq6pesPNA==
X-Received: by 2002:a05:600c:5309:b0:43b:ca39:6c75 with SMTP id
 5b1f17b1804b1-454a9d3ee7bmr5257455e9.16.1751476234560; 
 Wed, 02 Jul 2025 10:10:34 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454a9989423sm3388835e9.19.2025.07.02.10.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 10:10:33 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  2 Jul 2025 19:10:33 +0200
Message-ID: <20250702171033.3040749-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751476234; x=1752081034; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UWuTaV0a6wTapN4tXpLb9HXNlK91kfrYnJkWRXhzUvM=;
 b=DRFoFZeblEsfmCrqyUEYsPFwkw7OdnKx7T0hMxo6cpQb96EsxG2ezemOuS0U8y8k+O
 oY1YX9E2KJkj5D0NuSRHtcwKlNY3GHPz9vv4gweYuBBVu4anL0JMWWiQmp1iHb4IXjuQ
 SBYUYoUarwtEaNCThJ76pkqMcuIN1Ra+779mzjrlcmE7Jzudm63ReY1vniyD4gfIuMtR
 crzjNaZZoKTp8STAjvvSjQ/bqDnjNdxQb9H1g5jqFtJWRTXP0+7qI/qQGFilYOSu8p1O
 M9ksD0bRGzGsMneMtnUasrLZVIyohn8X4YmWVpq9byhKtR6wiM0aCPq6EZBiTun9xApj
 V7RA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=DRFoFZeb
Subject: [Buildroot] [2025.02.x PATCH v2]
 support/dependencies/check-host-cmake.mk: set host-cmake max version
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the introduction of CMake 4 in several distributions, build errors
started occurring on those distributions for cmake packages that
included calls to cmake_minimum_required() or cmake_policy() with a
version older than 3.50 (see [1]).

To avoid backporting numerous individual fixes for affected packages,
commit [2] was previously applied to the LTS branch as a workaround.

Following further discussion (see [2][3]), that raised concerns about
policy changes between CMake versions that could lead to breaking builds
in non-obvious ways, a different approach was chosen.

This patch reverts commit [2] and instead of applying a global
compatibility variable, we now enforce building host-cmake when the host
system provides CMake 4 or newer.

[1] https://cmake.org/cmake/help/latest/release/4.0.html#deprecated-and-removed-features
[2] 70aac2d9e8 package/pkg-cmake.mk: force config version >=3.5
[3] https://lists.buildroot.org/pipermail/buildroot/2025-May/780262.html
[4] https://lists.buildroot.org/pipermail/buildroot/2025-June/780372.html

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
v1 -> v2: move the logic in the .sh file
---
 package/pkg-cmake.mk                     | 4 ----
 support/dependencies/check-host-cmake.sh | 9 +++++++++
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 08fe7c431e..ba287d244a 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -53,10 +53,6 @@ define inner-cmake-package
 
 $(3)_SUPPORTS_IN_SOURCE_BUILD ?= YES
 
-# Some packages requires CMake 3.0.0 but latest CMake requires >=3.5
-# Set the policy version minimum to force these packages to 3.5 or greater.
-$(2)_CONF_OPTS += -DCMAKE_POLICY_VERSION_MINIMUM=3.5
-
 # The default backend, unless specified by the package
 $(3)_CMAKE_BACKEND ?= make
 
diff --git a/support/dependencies/check-host-cmake.sh b/support/dependencies/check-host-cmake.sh
index fadeae9f6b..c7aa16f48d 100755
--- a/support/dependencies/check-host-cmake.sh
+++ b/support/dependencies/check-host-cmake.sh
@@ -6,6 +6,9 @@
 major_min="${1%.*}"
 minor_min="${1#*.}"
 
+major_max="4"
+minor_max="0"
+
 shift
 
 for candidate; do
@@ -32,6 +35,12 @@ for candidate; do
     major="${version%.*}"
     minor="${version#*.}"
 
+    if [ ${major} -gt ${major_max} ]; then
+        continue
+    elif [ ${major} -eq ${major_max} -a ${minor} -ge ${minor_max} ]; then
+        continue
+    fi
+
     if [ ${major} -gt ${major_min} ]; then
         echo "${cmake}"
         exit
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
