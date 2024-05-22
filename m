Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89945C25B77
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 07:03:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F2EE820B8;
	Wed, 22 May 2024 07:03:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 86kXTLAVmZpn; Wed, 22 May 2024 07:03:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D5DF820B4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D5DF820B4;
	Wed, 22 May 2024 07:03:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3254C1C585E
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 07:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EBCB4079E
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 07:03:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0yE4Vd6R0Jhg for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 07:03:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D4A3E4079C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4A3E4079C
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D4A3E4079C
 for <buildroot@buildroot.org>; Wed, 22 May 2024 07:03:00 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-56e6affdd21so3413081a12.3
 for <buildroot@buildroot.org>; Wed, 22 May 2024 00:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716361379; x=1716966179;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=utvnmglmgmSzdarlYtYnxejlDZopVmdJkuJT1/OqgMQ=;
 b=s4FXd91QUnz1Ygxch4KSPuPBUSy4o2O8eik7jTxt6RAK39uKB9A8HwICGMPSLTsogp
 i9v7bN6e5t3yG9Mj1WhPJaGeXe3uNjhRJn5bmZUxFrjcTxNc5BN2btecFOM3ct5XIijJ
 6vq0Lf4cPilyvHqZDZZ8ZVAHjHE381QoQIULpZZT/lzOGQ2ZDvyA1vBYMBtXHXYCz3E6
 gLQCSeCVxKeg728vpDT6LOTplimAZPxMr2qWI10or+LUYbrrO24Y8p2tNphpN2mQMdpP
 qyaL4vdkEb74QvrLk/08pQKGWf43ibvNHN/b+0laFcJt/DQEjWcn+gNEQfJ19/coWAQg
 YkOw==
X-Gm-Message-State: AOJu0YxBMfUSTS74PlLAzlU+r5TvxikTp1cna5UCzRFdilLOShONx4X9
 7R5v9wRYstEBHCFDDllBk1q+QhXrvTJcFQPXRYEXKGtAk5xH5slq6mNIZj7pSjMDAOkuxGGzlc7
 Z1rs=
X-Google-Smtp-Source: AGHT+IFwokcT3tFrkWnRBsKzuuwwIgrW2YCARk9AbbtNe2SWN46mxJp6bQzEKsrjKHrWMWAa4XMa5g==
X-Received: by 2002:a05:6402:358b:b0:578:3420:4ed6 with SMTP id
 4fb4d7f45d1cf-578342052d6mr715397a12.1.1716361378773; 
 Wed, 22 May 2024 00:02:58 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.196])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574d738c80csm12028365a12.81.2024.05.22.00.02.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 00:02:58 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 22 May 2024 09:02:28 +0200
Message-ID: <20240522070238.3282121-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240522070238.3282121-1-dario.binacchi@amarulasolutions.com>
References: <20240522070238.3282121-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1716361379; x=1716966179;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=utvnmglmgmSzdarlYtYnxejlDZopVmdJkuJT1/OqgMQ=;
 b=ow8wOWg7B/cxcAfB++HA/w+ObTEbdkGDMiA0ud/Vlnj1TlYDau4A8zOpABtDlYl8I0
 OSWOoQ0CkAtLChb3doz8gnh0ujd5pSkHrUFNOmF7N/htKjyOc0N14e7TyJtqlZr57Rff
 B4kRavudVN+uhvMInLah1B8Eu+y8fGhJ3qo0U=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ow8wOWg7
Subject: [Buildroot] [PATCH v2 09/18] package/libabseil-cpp: update the
 patch to be applied with fuzz 0
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Romain Naour <romain.naour@gmail.com>, Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit allows the package patch to be applied with fuzz factor 0.
The fuzz factor specifies how many lines of the patch can be inexactly
matched, so the value 0 requires all lines to be exactly matched.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../0001-force-position-independent-code.patch     | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/libabseil-cpp/0001-force-position-independent-code.patch b/package/libabseil-cpp/0001-force-position-independent-code.patch
index 6bf46bf0cb1b..a6ca9c0f0e9e 100644
--- a/package/libabseil-cpp/0001-force-position-independent-code.patch
+++ b/package/libabseil-cpp/0001-force-position-independent-code.patch
@@ -1,4 +1,4 @@
-From d170b19e500d85381369e379771be8d7816bcc92 Mon Sep 17 00:00:00 2001
+From 832765d12879fabf799dd80af6e8fee9cd298934 Mon Sep 17 00:00:00 2001
 From: Adam Duskett <Aduskett@gmail.com>
 Date: Tue, 21 Jul 2020 13:08:50 -0700
 Subject: [PATCH] force position independent code
@@ -16,17 +16,19 @@ cause relocation errors when shared libraries link against the built static
 libraries.
 
 Signed-off-by: Adam Duskett <Aduskett@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  CMake/AbseilHelpers.cmake | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/CMake/AbseilHelpers.cmake b/CMake/AbseilHelpers.cmake
-index 86ff9eb..bdb7a89 100644
+index 3bd33ce8718d..7f269bd20c21 100644
 --- a/CMake/AbseilHelpers.cmake
 +++ b/CMake/AbseilHelpers.cmake
-@@ -209,6 +209,8 @@ function(absl_cc_library)
-     set_property(TARGET ${_NAME} PROPERTY CXX_STANDARD ${ABSL_CXX_STANDARD})
-     set_property(TARGET ${_NAME} PROPERTY CXX_STANDARD_REQUIRED ON)
+@@ -292,6 +292,8 @@ Cflags: -I\${includedir}${PC_CFLAGS}\n")
+       target_compile_features(${_NAME} PUBLIC ${ABSL_INTERNAL_CXX_STD_FEATURE})
+     endif()
  
 +    # Without this setting, other programs such as GRPC will fail when linking.
 +    set_property(TARGET ${_NAME} PROPERTY POSITION_INDEPENDENT_CODE ON)
@@ -34,5 +36,5 @@ index 86ff9eb..bdb7a89 100644
      # to have properly named lib files.  This is a no-op when we are not being
      # installed.
 -- 
-2.26.2
+2.43.0
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
