Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A566CC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 20:21:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BB1560E52
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 20:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6BB1560E52
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3929240237;
	Mon, 25 Oct 2021 20:21:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MJA4EdCEg_fW; Mon, 25 Oct 2021 20:21:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AC134041B;
	Mon, 25 Oct 2021 20:21:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BFB851BF870
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 20:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AED3E60807
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 20:20:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n_KxkwarGn3v for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 20:20:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BF513605A6
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 20:20:05 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id gn3so9187839pjb.0
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 13:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cg3sFZDrhtm5GvMC3Q9b+gzl9dLVntfgvY2Z0RNB84k=;
 b=FB1UgPnHok1GRZ6WRRz+V6s9Q1SIuWI9xm/F0VxnvYMH/3UReBk9HQKoaY4daopFme
 k3mxkd3C20/8So1JV8TlsTe226hAgluWTm0x2+1dNZkKqL11aDsitYPaDWwHPZiH2qCQ
 CBSIOfSC65xdfE4c+1Il01h6xjnHqVgCK/xqxQc3qgoguL74RqzrqxJFAIUYPklXPj/i
 j1GzrAuuUfvZ85XkUom8/cKmx9CPMzpRSED7kF5perMYX6gEcLSwHNmcCT65NKqbXVsE
 U89VNUG8JpiDouZi1AQJu1FGKKHf7S+WbRkC0bwjl8a+U7pfeBO9nj1q21DDvFPo/AFk
 0sFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cg3sFZDrhtm5GvMC3Q9b+gzl9dLVntfgvY2Z0RNB84k=;
 b=BrEi0AZO5aipjy1sNWmd468TfW7muDqjwc+m74TSTXQDSrl92CZtaw/sfHDAf0DwCC
 R2UlwnUKLLdB8mcUwDnjBbLP+0ZQW459rrMxP6/PiSheyO0+UGK5CWJmT+2XcpLv9feX
 cV315zMQfokQurXbWBehVJ3v2k7QqDuYGEcjOWsoBcH7MQZKlLkx0IaNHjp1uRyPw3XB
 6OV0huUgt1zINqdO0t3NTYgxgAVK9ACZK0jeWmlRIJIpfcyq+ORo6LDzJ+mew3+otUiU
 zUKPRiHFP53LccD5Ctz+AfP9aRqgMUmagUsAxCKORd+GRgOXC7bAfPHtD9jCRPLD+Bxv
 eIcQ==
X-Gm-Message-State: AOAM532jQ9sgdgohV62NNvVEUnv7B/SQr40mrGar5scC0lBk8u7jSJFa
 gEJG/DKlZWgxErKc5QaIHLMeZ/EVPY0=
X-Google-Smtp-Source: ABdhPJxHxzwJy7451oxwnxKaSp0w67IH+LS6N7YaNDQFgFX1sry7PoBcde6ySunpG3/f+fsozu/Uig==
X-Received: by 2002:a17:90b:1812:: with SMTP id
 lw18mr4228997pjb.9.1635193204932; 
 Mon, 25 Oct 2021 13:20:04 -0700 (PDT)
Received: from adam.. ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id h19sm22852583pfv.81.2021.10.25.13.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 13:20:04 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 13:20:02 -0700
Message-Id: <20211025202002.589440-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/qemu: bump host gcc
 requirements: propagate to all reverse dependencies
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
Cc: Daniel Price <daniel.price@gmail.com>, Grzegorz Blach <grzegorz@blach.pl>,
 Anisse Astier <anisse@astier.eu>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Martin Bark <martin@barkynet.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

qemu now requires gcc >= 7.5, however, as there is no BR2_HOST_GCC_AT_LEAST_7_5,
set the host gcc requirements to 8.

In addition:
  - Add a missing comment in package/qemu/Config.in.host explaining the host gcc
    requirements if host gcc < 8.

Fixes:
http://autobuild.buildroot.org/results/32b7fee1f8cda2290fd4bd8ac9fe78bacb25b652
Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
changes v1 -> v2:
  - rebase against commit 17358061ad2b58d3eb96ea8c5631e235a484ac87

 package/gobject-introspection/Config.in | 6 +++---
 package/nodejs/Config.in                | 6 +++---
 package/python-bluezero/Config.in       | 6 +++---
 package/python-gobject/Config.in        | 6 +++---
 package/qemu/Config.in.host             | 7 ++++++-
 5 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/package/gobject-introspection/Config.in b/package/gobject-introspection/Config.in
index c631c84755..42250eb776 100644
--- a/package/gobject-introspection/Config.in
+++ b/package/gobject-introspection/Config.in
@@ -13,7 +13,7 @@ config BR2_PACKAGE_GOBJECT_INTROSPECTION
 	# compile errors with locale.c. As such, require 4.9 until this
 	# can be verified.
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-	depends on BR2_HOST_GCC_AT_LEAST_7 # host-qemu
+	depends on BR2_HOST_GCC_AT_LEAST_8 # host-qemu
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	# gobject-introspection does not require python3 to run on the
 	# target; however, because the tools run in a qemu wrapper, a
@@ -42,9 +42,9 @@ comment "gobject-introspection needs python3"
 	depends on !BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
 
-comment "gobject-introspection needs a glibc toolchain, gcc >= 4.9, host gcc >= 7"
+comment "gobject-introspection needs a glibc toolchain, gcc >= 4.9, host gcc >= 8"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		!BR2_HOST_GCC_AT_LEAST_7
+		!BR2_HOST_GCC_AT_LEAST_8
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 771f735e97..99c76bc3de 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -8,18 +8,18 @@ config BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
 
-comment "nodejs needs a toolchain w/ C++, dynamic library, NPTL, gcc >= 7, wchar"
+comment "nodejs needs a toolchain w/ C++, dynamic library, NPTL, gcc >= 7, wchar, host gcc >= 8"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
-		!BR2_HOST_GCC_AT_LEAST_7 || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_USE_WCHAR
+		!BR2_HOST_GCC_AT_LEAST_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_USE_WCHAR
 
 config BR2_PACKAGE_NODEJS
 	bool "nodejs"
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
-	depends on BR2_HOST_GCC_AT_LEAST_7
+	depends on BR2_HOST_GCC_AT_LEAST_8 # qemu
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	depends on BR2_USE_WCHAR
 	# uses fork()
diff --git a/package/python-bluezero/Config.in b/package/python-bluezero/Config.in
index 3d40b1e275..d617b96d67 100644
--- a/package/python-bluezero/Config.in
+++ b/package/python-bluezero/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_PYTHON_BLUEZERO
 	bool "python-bluezero"
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS # python-gobject -> gobject-introspection
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # python-gobject -> gobject-introspection
-	depends on BR2_HOST_GCC_AT_LEAST_7 # python-gobject -> gobject-introspection -> host-qemu
+	depends on BR2_HOST_GCC_AT_LEAST_8 # python-gobject -> gobject-introspection -> host-qemu
 	depends on BR2_TOOLCHAIN_USES_GLIBC # python-gobject -> gobject-introspection
 	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_DBUS # runtime
@@ -13,9 +13,9 @@ config BR2_PACKAGE_PYTHON_BLUEZERO
 
 	  https://github.com/ukBaz/python-bluezero
 
-comment "python-bluezero needs a glibc toolchain, gcc >= 4.9, host gcc >= 7"
+comment "python-bluezero needs a glibc toolchain, gcc >= 4.9, host gcc >= 8"
 	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		!BR2_HOST_GCC_AT_LEAST_7
+		!BR2_HOST_GCC_AT_LEAST_8
diff --git a/package/python-gobject/Config.in b/package/python-gobject/Config.in
index 910f990026..efc781a1ff 100644
--- a/package/python-gobject/Config.in
+++ b/package/python-gobject/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_PYTHON_GOBJECT
 	depends on BR2_USE_MMU # libglib2, gobject-introspection
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS # gobject-introspection
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gobject-introspection
-	depends on BR2_HOST_GCC_AT_LEAST_7 # gobject-introspection -> host-qemu
+	depends on BR2_HOST_GCC_AT_LEAST_8 # gobject-introspection -> host-qemu
 	depends on BR2_TOOLCHAIN_USES_GLIBC # gobject-introspection
 	depends on BR2_PACKAGE_PYTHON3 # gobject-introspection
 	select BR2_PACKAGE_GOBJECT_INTROSPECTION
@@ -13,9 +13,9 @@ config BR2_PACKAGE_PYTHON_GOBJECT
 
 	  https://wiki.gnome.org/action/show/Projects/PyGObject
 
-comment "python-gobject needs a glibc toolchain, gcc >= 4.9, host gcc >= 7"
+comment "python-gobject needs a glibc toolchain, gcc >= 4.9, host gcc >= 8"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		!BR2_HOST_GCC_AT_LEAST_7
+		!BR2_HOST_GCC_AT_LEAST_8
diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index a5b38c081b..df5d921125 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -37,7 +37,7 @@ config BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
 config BR2_PACKAGE_HOST_QEMU
 	bool "host qemu"
 	depends on BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS || BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
-	depends on BR2_HOST_GCC_AT_LEAST_7
+	depends on BR2_HOST_GCC_AT_LEAST_8
 	select BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE \
 		if !BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE && BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
 	select BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE \
@@ -50,6 +50,11 @@ config BR2_PACKAGE_HOST_QEMU
 
 	  http://www.qemu.org
 
+comment "host-qemu needs a host gcc >= 8"
+	depends on BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS || \
+		BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORT
+	depends on !BR2_HOST_GCC_AT_LEAST_8
+
 if BR2_PACKAGE_HOST_QEMU
 
 comment "Emulators selection"
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
