Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B281C4706C
	for <buildroot@archiver.kernel.org>; Tue, 16 Jan 2024 08:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96D5B81354;
	Tue, 16 Jan 2024 08:48:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96D5B81354
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FYRAYPUKmXBu; Tue, 16 Jan 2024 08:48:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E58C981341;
	Tue, 16 Jan 2024 08:48:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E58C981341
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 770E31BF429
 for <buildroot@lists.busybox.net>; Tue, 16 Jan 2024 08:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F2CD61045
 for <buildroot@lists.busybox.net>; Tue, 16 Jan 2024 08:48:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F2CD61045
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rodw2PaZBbb7 for <buildroot@lists.busybox.net>;
 Tue, 16 Jan 2024 08:48:35 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 09F4C60FDC
 for <buildroot@buildroot.org>; Tue, 16 Jan 2024 08:48:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09F4C60FDC
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a2dd05e02ffso181961766b.3
 for <buildroot@buildroot.org>; Tue, 16 Jan 2024 00:48:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705394913; x=1705999713;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dHG5ZREJeRZhBke/Rm6145NAOB2u7ur4N7A7u4SD8O0=;
 b=iOlGR30YP1d33z8+jtCUroxX0PmoxfBRPzivFB+/DlqGxJ5tDcbJmdg2S4kTBbViHg
 S/u/HPZuK62VGZoy/KWmTrnxkmyKbxMo9jEBb3l5RKk8ldgtgwnP+pB7hVRX9rwe9rd8
 kJdwsHuzzufx99Q2FEfwlJQO0Yw5/JCsteuWt2YXWbQEFNVd+fKYT0h0N2e8rjcGzSiM
 zhQzP4nVPaRmIase5ErKBXA2KiO04BmloxOBaFtI5RFeu16fgH2vbShZm7P5HMAFH1rr
 WWqjz4a6ND19nwXGvX8WxEZ32PHWJibtBxkea0o1MjiQ9uQDXOHm6TOPrfngzGNC2Nri
 vOrg==
X-Gm-Message-State: AOJu0YwX2qV/1yC9y0pPlTO1AThzl8uxr9TckFqjPfZqHQVkktKnb2UF
 nSANbmJfmrom8vE7DXtK/wF4uT9AU+E=
X-Google-Smtp-Source: AGHT+IFvG65sp0rKpnWROJFX19aDcZbkAaUr2ghD4fn65CMkSNJGKL3qQMQ35kpI7T9/rTCTG2SmCg==
X-Received: by 2002:a17:906:99c7:b0:a2e:620f:2cc2 with SMTP id
 s7-20020a17090699c700b00a2e620f2cc2mr396280ejn.193.1705394912641; 
 Tue, 16 Jan 2024 00:48:32 -0800 (PST)
Received: from fedora.. (ip-109-43-179-227.web.vodafone.de. [109.43.179.227])
 by smtp.gmail.com with ESMTPSA id
 k16-20020a170906129000b00a274f3396a0sm6305461ejb.145.2024.01.16.00.48.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jan 2024 00:48:32 -0800 (PST)
From: Thomas Huth <huth@tuxfamily.org>
To: buildroot@buildroot.org
Date: Tue, 16 Jan 2024 09:48:26 +0100
Message-ID: <20240116084826.917058-1-huth@tuxfamily.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/kvm-unit-tests: bump to version
 2024-01-08
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
Cc: Cyril Bur <cyrilbur@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A new kvm-unit-tests version has recently been tagged, so we can use this
version now for buildroot. It ships now with a full version of the GPL v2
license in the LICENSE file, thus we add a hash for that file, too.

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
---
 package/kvm-unit-tests/kvm-unit-tests.hash | 5 +++--
 package/kvm-unit-tests/kvm-unit-tests.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/kvm-unit-tests/kvm-unit-tests.hash b/package/kvm-unit-tests/kvm-unit-tests.hash
index 3b6d02dd8e..d4db9f2b75 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.hash
+++ b/package/kvm-unit-tests/kvm-unit-tests.hash
@@ -1,3 +1,4 @@
 # Locally computed
-sha256  9c9b093ffe3fa33145a53102de9c3e2d55cd0cdc8a20cf172b726296ffe22f4f  kvm-unit-tests-v2023-01-05.tar.bz2
-sha256  d9bbb60891710d248f01c8bdac50ef7ad39188de512610437872e83112b38a1b  COPYRIGHT
+sha256  8636994e10240705f10a9150ef688ae6832d0ea0dcc8860c826c645ecfc1169f  kvm-unit-tests-v2024-01-08.tar.bz2
+sha256  b3c9ca9e257f2eaae070cf0ccdf8770764f05a947a39a835e633413750a5777b  COPYRIGHT
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
index 956f07b304..73d20d6b2e 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.mk
+++ b/package/kvm-unit-tests/kvm-unit-tests.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-KVM_UNIT_TESTS_VERSION = 2023-01-05
+KVM_UNIT_TESTS_VERSION = 2024-01-08
 KVM_UNIT_TESTS_SOURCE = kvm-unit-tests-v$(KVM_UNIT_TESTS_VERSION).tar.bz2
 KVM_UNIT_TESTS_SITE = https://gitlab.com/kvm-unit-tests/kvm-unit-tests/-/archive/v$(KVM_UNIT_TESTS_VERSION)
 KVM_UNIT_TESTS_LICENSE = GPL-2.0, LGPL-2.0
-KVM_UNIT_TESTS_LICENSE_FILES = COPYRIGHT
+KVM_UNIT_TESTS_LICENSE_FILES = COPYRIGHT LICENSE
 
 ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
 KVM_UNIT_TESTS_ARCH = aarch64
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
