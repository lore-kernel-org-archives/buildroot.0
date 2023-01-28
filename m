Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 794C0C38142
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 06:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E23C982323;
	Sat, 28 Jan 2023 06:04:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E23C982323
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IpgjOTDpO8P9; Sat, 28 Jan 2023 06:04:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B2A682320;
	Sat, 28 Jan 2023 06:04:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B2A682320
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 300291BF424
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 06:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02ADC610FA
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 06:04:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02ADC610FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6p9Fvl7QV_61 for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 06:04:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECEAF60B8B
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ECEAF60B8B
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 06:04:31 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id mf7so158172ejc.6
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 22:04:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N+fcCXvJsoTF8rVaRNlrzKMi7hpDNnwVo+sxojaiUuo=;
 b=GtYBz+Xz46T5zpXWrqzVDmIo/QyF7kTIv9uhdoO8nosfe66pbAw/dritLLTXR7BwTR
 S1aXSMgDBA+nhjeVQqOf5Ch6eJ3PSn4kgXumEkMru5XR/Xs+w+1R+lLbOh/kBcaPw9W2
 OGNocUUY4L4e1nsFYDCSOQotDGKWKvh5Q6OoIoj2mombpJ6WPDjTgcx+9CNbr/tHCOwo
 MdOkO/LH2UaYiTxdssM5l1nojUmw84zVe3jWhOTg5rrobIoKhJTwDPXOoJDNWmo0Of21
 5d3a9VpV9Km7u3CuaotOzAa6JSWyLuX7256LgfHSzu0Uh/35VL8ZPA1G3Shdsh1Op5Mc
 1UOw==
X-Gm-Message-State: AFqh2kr1QEAPabcE5qpmA+K0YKmmFPH3LGSId42hjDQ1C2AJhFJ9+RHq
 Ik5bVezed1oKaAkloRPbdlRiACyWGQU=
X-Google-Smtp-Source: AMrXdXtG65Im/C8jWLN8oxCDxbDfHOQJpzfrBY6YL1PTjGizFBoF+aazkNueKPIC1qskp4umtK9SpA==
X-Received: by 2002:a17:906:2c45:b0:84d:4b8f:b34c with SMTP id
 f5-20020a1709062c4500b0084d4b8fb34cmr44984162ejh.66.1674885870080; 
 Fri, 27 Jan 2023 22:04:30 -0800 (PST)
Received: from localhost.localdomain (tmo-064-101.customers.d1-online.com.
 [80.187.64.101]) by smtp.gmail.com with ESMTPSA id
 b16-20020a170906d11000b0085ca279966esm3381939ejz.119.2023.01.27.22.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 22:04:29 -0800 (PST)
From: Thomas Huth <huth@tuxfamily.org>
To: buildroot@buildroot.org
Date: Sat, 28 Jan 2023 07:03:49 +0100
Message-Id: <20230128060349.4029-1-huth@tuxfamily.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/kvm-unit-tests: bump to version
 2023-01-05
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
Cc: Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Cyril Bur <cyrilbur@gmail.com>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A new kvm-unit-tests version has recently been tagged, so let's
update to that version now.
This new version now features a --disable-werror parameter for
the configure script, so we can drop the patch for disabling
this manually now.

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
---
 ...emove-Werror-to-avoid-build-failures.patch | 30 -------------------
 package/kvm-unit-tests/kvm-unit-tests.hash    |  2 +-
 package/kvm-unit-tests/kvm-unit-tests.mk      |  3 +-
 3 files changed, 3 insertions(+), 32 deletions(-)
 delete mode 100644 package/kvm-unit-tests/0001-Makefile-remove-Werror-to-avoid-build-failures.patch

diff --git a/package/kvm-unit-tests/0001-Makefile-remove-Werror-to-avoid-build-failures.patch b/package/kvm-unit-tests/0001-Makefile-remove-Werror-to-avoid-build-failures.patch
deleted file mode 100644
index d07b9b6912..0000000000
--- a/package/kvm-unit-tests/0001-Makefile-remove-Werror-to-avoid-build-failures.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 08e14a662b9e75daec29722e49150869952ba1b6 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Mon, 20 Nov 2017 22:09:39 +0100
-Subject: [PATCH] Makefile: remove -Werror to avoid build failures
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[Matthew: Refactoring of Thomas Petazzoni's original.]
-Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
-[Fabrice: updated for 2022-03-08]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- Makefile | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 7231334..d9ad42b 100644
---- a/Makefile
-+++ b/Makefile
-@@ -53,7 +53,7 @@ cc-option = $(shell if $(CC) $(1) -S -o /dev/null -xc /dev/null \
- 
- COMMON_CFLAGS += -g $(autodepend-flags) -fno-strict-aliasing -fno-common
- COMMON_CFLAGS += -Wall -Wwrite-strings -Wempty-body -Wuninitialized
--COMMON_CFLAGS += -Wignored-qualifiers -Werror -Wno-missing-braces
-+COMMON_CFLAGS += -Wignored-qualifiers -Wno-missing-braces
-
- frame-pointer-flag=-f$(if $(KEEP_FRAME_POINTER),no-,)omit-frame-pointer
- fomit_frame_pointer := $(call cc-option, $(frame-pointer-flag), "")
-- 
-2.14.2
-
diff --git a/package/kvm-unit-tests/kvm-unit-tests.hash b/package/kvm-unit-tests/kvm-unit-tests.hash
index 42c3b4a241..3b6d02dd8e 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.hash
+++ b/package/kvm-unit-tests/kvm-unit-tests.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c2edf2b188033a5d634150ecc797c797a85e5af8e3ef4ac3e583f60b2ee7bcf3  kvm-unit-tests-v2022-03-08.tar.bz2
+sha256  9c9b093ffe3fa33145a53102de9c3e2d55cd0cdc8a20cf172b726296ffe22f4f  kvm-unit-tests-v2023-01-05.tar.bz2
 sha256  d9bbb60891710d248f01c8bdac50ef7ad39188de512610437872e83112b38a1b  COPYRIGHT
diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
index dd8f153710..956f07b304 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.mk
+++ b/package/kvm-unit-tests/kvm-unit-tests.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KVM_UNIT_TESTS_VERSION = 2022-03-08
+KVM_UNIT_TESTS_VERSION = 2023-01-05
 KVM_UNIT_TESTS_SOURCE = kvm-unit-tests-v$(KVM_UNIT_TESTS_VERSION).tar.bz2
 KVM_UNIT_TESTS_SITE = https://gitlab.com/kvm-unit-tests/kvm-unit-tests/-/archive/v$(KVM_UNIT_TESTS_VERSION)
 KVM_UNIT_TESTS_LICENSE = GPL-2.0, LGPL-2.0
@@ -31,6 +31,7 @@ KVM_UNIT_TESTS_ENDIAN = big
 endif
 
 KVM_UNIT_TESTS_CONF_OPTS =\
+	--disable-werror \
 	--arch="$(KVM_UNIT_TESTS_ARCH)" \
 	--processor="$(GCC_TARGET_CPU)" \
 	--endian="$(KVM_UNIT_TESTS_ENDIAN)"
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
