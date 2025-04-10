Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46872C369A4
	for <buildroot@archiver.kernel.org>; Thu, 10 Apr 2025 08:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E233617A1;
	Thu, 10 Apr 2025 08:23:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GS9V_vUkBBY8; Thu, 10 Apr 2025 08:23:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF469611B2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF469611B2;
	Thu, 10 Apr 2025 08:23:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 73395201
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 08:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 647974085B
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 08:23:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y3ZSz79KpvgP for <buildroot@buildroot.org>;
 Thu, 10 Apr 2025 08:23:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.167.49;
 helo=mail-lf1-f49.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6BCEC40C01
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BCEC40C01
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6BCEC40C01
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 08:23:25 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-54298ec925bso805774e87.3
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 01:23:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744273403; x=1744878203;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tDblFKvGaZ4U+fvsW2Cx5uJSNdZ4tAbhXbM8dXL16BM=;
 b=V25ys+LaIk6u2/x+0g7+fEPaUT8OwJQSU6rJezALE96ZeMygr8zxMjfaUaEdXS1kEy
 De49i+yrryNvYDhpqR9KyAiwDDJrl1k+leFsyp93bHgUt6tom8r4v+FOMVGJV7+8bPNB
 bsvS6xN9RI1XPhbKXktmrJsYwn5vv+JdtdkEPHI3/0gKPUmnxDsIPrne9bQwhkT7Qhts
 RUj17gQ0JAGc3UQYvN+nTrqdOpXJZpBj6aiafP1e7AVy0YAaAvVKYaXjGU6ZfgdZ9ZHp
 6sB6/HGC9LeJp/3x7cFYrrQI0Ky36ugHJYwUlNhK4k0LCOuAO1tTxndJlXE1Hm6dS3Of
 O7Zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4Lig5ao6HiHp25omoQVkq3MDaMUWVdaNMXhfx2ebFoaPDynDJSKTmc6kI1q+TM/YkLEwcIe2Z9O8=@buildroot.org
X-Gm-Message-State: AOJu0YxqE/vwOvCg2X/4U8j689aWMo87iquHXaYJ9NSHCiZFGrzIs1+4
 sWfJPS7dqPpdm0oj4YqWcRXDOzV/VxQgqfCKi3dUe3ZGEDhqkGEX7Bh6vtlb
X-Gm-Gg: ASbGnctYugDd5Cnhsl/ktwODPSW00TXIfvBz8/WY0r6h0OH+49P84pBj1Eg2BSZo5Aj
 DVG5f5dmxOZPnnuQ6vx3KC+M7MF1HIcB/byIBXmu4nQEcctYdcYtGWx1vLAg1odhEin7eaxN8Km
 SV7vxGpckGcpsZHkn+2t1z9B5EoKBBek8Jh5Xuj/CtZQDwekMGnsFIcTwSDcphCzO6l7wzPwv8Y
 KRy3ucOPGUOn0ave1X9VfMcrltOCkvyIpQep5pxOWiWpkMrL3qAncC0TET81LoBCPalCvr6GN9J
 kZYpWlPKj+3z1YR3/UdX+LTbrIn1o00//6NfuSHL2FtGb8LJ/oOxnEIdIvV1zkqDSaEFNnLdnzo
 MRHE4F+tP28jQGnia
X-Google-Smtp-Source: AGHT+IEvmnRPyZBnZhwZHZAMAx1m2GtP7Qpexg+SDeLA6odHPYfA5WjVELmc/hrTQPbBqKNp2N73rg==
X-Received: by 2002:a2e:bcc5:0:b0:30c:f60:6c6 with SMTP id
 38308e7fff4ca-3103ea8e86emr4355021fa.6.1744273402493; 
 Thu, 10 Apr 2025 01:23:22 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com.
 [209.85.208.179]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f4649d81dsm4032431fa.2.2025.04.10.01.23.21
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 01:23:21 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-30c44a87b9cso4115371fa.3
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 01:23:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWodfV+zHsvYLVpHD6Z0hTVyjzwn65Vc1Sqrt59Wb56o8LMGAaYPih012k6rtuBktM+tT0KHzVW6Os=@buildroot.org
X-Received: by 2002:a2e:bd16:0:b0:30c:7fe:9c95 with SMTP id
 38308e7fff4ca-3103ea8ed17mr4780701fa.8.1744273401317; Thu, 10 Apr 2025
 01:23:21 -0700 (PDT)
MIME-Version: 1.0
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Thu, 10 Apr 2025 10:23:09 +0200
X-Gmail-Original-Message-ID: <CACXRmJgW8m7jNxfo_n=QoLfMz-ROgc=N2Ms7GcWh=UQOsnUBQQ@mail.gmail.com>
X-Gm-Features: ATxdqUHNrrvPqlFNySB0sEwg30yb2mQOSiS97UqWHCCrqLAlZvH1JQyIXpEZdUo
Message-ID: <CACXRmJgW8m7jNxfo_n=QoLfMz-ROgc=N2Ms7GcWh=UQOsnUBQQ@mail.gmail.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: Adrian Perez de Castro <aperez@igalia.com>, 
 Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v2] package/webkitgtk: bump to 2.48.1
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

This bumps webkit to the 2.48 stable series.

WebKitGTK+ 2.48 highlights:
https://webkitgtk.org/2025/04/08/webkitgtk-2.48.html

News:
- https://webkitgtk.org/2025/03/14/webkitgtk2.48.0-released.html
- https://webkitgtk.org/2025/04/02/webkitgtk2.48.1-released.html

And brings some security fixes:
- https://webkitgtk.org/security/WSA-2025-0002.html
- https://webkitgtk.org/security/WSA-2025-0003.html

Also,

- Raise the minimal GCC requirement [1],
which should have been raised by the 2.46.4 bump.

- Handle SPEECH_SYNTHESIS, which has been enabled
by default in commit [2].

[1] https://github.com/WebKit/WebKit/commit/682ac4ba74c53d0cd488c7a595096224a9abb036
[2] https://github.com/WebKit/WebKit/commit/10381a8de938024f31935184af470ccbce0b22d9

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v2: added additional security report and a link to the release highlights
---
 package/webkitgtk/Config.in      | 6 +++---
 package/webkitgtk/webkitgtk.hash | 6 +++---
 package/webkitgtk/webkitgtk.mk   | 9 ++++++++-
 3 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 3594299314..bcb4b12fa3 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -16,12 +16,12 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
  depends on BR2_TOOLCHAIN_HAS_SYNC_4
  depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt

-comment "webkitgtk needs libgtk3 and a toolchain w/ C++, wchar, NPTL,
dynamic library, gcc >= 10, host gcc >= 4.9"
+comment "webkitgtk needs libgtk3 and a toolchain w/ C++, wchar, NPTL,
dynamic library, gcc >= 11, host gcc >= 4.9"
  depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
  depends on !BR2_BINFMT_FLAT
  depends on !BR2_PACKAGE_LIBGTK3 || !BR2_INSTALL_LIBSTDCPP || \
  !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS || \
- !BR2_TOOLCHAIN_GCC_AT_LEAST_10 || \
+ !BR2_TOOLCHAIN_GCC_AT_LEAST_11 || \
  !BR2_HOST_GCC_AT_LEAST_4_9
  depends on BR2_USE_MMU

@@ -33,7 +33,7 @@ config BR2_PACKAGE_WEBKITGTK
  depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu, host-ruby
  depends on BR2_INSTALL_LIBSTDCPP
  depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
- depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10
+ depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11
  depends on BR2_USE_WCHAR # icu, libsoup3
  depends on BR2_PACKAGE_LIBGTK3
  depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 96100d4c7c..fd9420bad9 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,6 +1,6 @@
-# From https://www.webkitgtk.org/releases/webkitgtk-2.46.4.tar.xz.sums
-sha1  10d4dbd222acec30b1d20ee3b7d02c0d9727c5a9  webkitgtk-2.46.4.tar.xz
-sha256  0eff5f0ab0a2872ec87df62bc32e3289c8af625716ac71e94b298d74e0374176
 webkitgtk-2.46.4.tar.xz
+# From https://www.webkitgtk.org/releases/webkitgtk-2.48.1.tar.xz.sums
+sha1  f7939f920f92f6b1395b8573f069d3fb9c085b3f  webkitgtk-2.48.1.tar.xz
+sha256  98efdf21c4cdca0fe0b73ab5a8cb52093b5aa52d9b1b016a93f71dbfa1eb258f
 webkitgtk-2.48.1.tar.xz

 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4
 Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index ec63d093b7..2c22bfb607 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-WEBKITGTK_VERSION = 2.46.4
+WEBKITGTK_VERSION = 2.48.1
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
@@ -73,6 +73,13 @@ else
 WEBKITGTK_CONF_OPTS += -DENABLE_MINIBROWSER=OFF
 endif

+ifeq ($(BR2_PACKAGE_FLITE),y)
+WEBKITGTK_CONF_OPTS += -DENABLE_SPEECH_SYNTHESIS=ON
+WEBKITGTK_DEPENDENCIES += flite
+else
+WEBKITGTK_CONF_OPTS += -DENABLE_SPEECH_SYNTHESIS=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LCMS2),y)
 WEBKITGTK_CONF_OPTS += -DUSE_LCMS=ON
 WEBKITGTK_DEPENDENCIES += lcms2
-- 
2.43.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
