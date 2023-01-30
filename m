Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31EA7C54EED
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 00:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB3C060D59;
	Mon, 30 Jan 2023 00:30:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB3C060D59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XDLwUf9-aebU; Mon, 30 Jan 2023 00:30:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8BA160B3D;
	Mon, 30 Jan 2023 00:30:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8BA160B3D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B242A1BF869
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 00:29:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94522817E4
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 00:29:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94522817E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bM63t63B_JJK for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 00:29:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93A2D817BD
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 93A2D817BD
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 00:29:06 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id j4so1022219iog.8
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 16:29:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mIBGwCnNSOQHVoJ23NcKv7tEnMAHbBMQ6XXNadqAvTk=;
 b=3bAq/6vmFYGRDg4bXKtSJHTEnkjI7mterz7DyWJ3kN3BZwymDL4HDrMljdEnZR39rz
 2N3tgM3rkVxXrYaIFF1/MxitEVLVx14Xf8MIIqLXzDNzzZf7LeVisVSEmv1uVVtD2k9e
 fA7FwcFhkszSmh9XOMYyOi7ZOYidqV3ZmreubltX6BtfeJ+nCea+nyJGpTLmhKcQedJy
 9Ojf1mXpUHyPQO4dl8NdzBCGIX9u0+dc5ADXPUObzU5eWggaV2RpZT6rfkjoAoW5+ZSx
 JgZAaZ5CLp8SajnDmqlWEeC4RfQoWq0Ao7rft0ey02vyEGS4gWLDJJql/5aPF6qDzDDZ
 IbDg==
X-Gm-Message-State: AO0yUKVrKzg8CepOpWTBil91Bhojhqbmei6AGsYmx7meCXiE06E78SxW
 Ih/I+oyiuOH78qvWIbWFrqGt+liyJU26Fg==
X-Google-Smtp-Source: AK7set9SRDGc5PZPas13e7O3FZMwSkcC6Y6aFO8SSxzAkQI7Rjq+s3yNVKjsi2y70kyBKt6eS/HhfQ==
X-Received: by 2002:a5e:dc48:0:b0:71b:5cd7:fcd9 with SMTP id
 s8-20020a5edc48000000b0071b5cd7fcd9mr1679431iop.20.1675038545469; 
 Sun, 29 Jan 2023 16:29:05 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 q4-20020a02c8c4000000b00363d6918540sm1676570jao.171.2023.01.29.16.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 16:29:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 Jan 2023 17:28:51 -0700
Message-Id: <20230130002854.2300661-7-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130002854.2300661-1-james.hilliard1@gmail.com>
References: <20230130002854.2300661-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mIBGwCnNSOQHVoJ23NcKv7tEnMAHbBMQ6XXNadqAvTk=;
 b=S5Z/QkINA0Kh0027Ov8cv2vGVzMhde4qhZkaAJqCK0pY99Jp5BADrvmnQWetjK0Qe8
 cz5xsQ2BwdRdefVC/tpagIv9IFAhCGfvAxEdUL6RMpzoHz9UUZz0n6tYVXWgJfJC4xoJ
 zE5NRhRqEj4laGGHNn2/FEE295qzdl6FMlYAJrks62dKwr7OXDTVT+fBJARmgDuKi5vK
 9bdnaSyQyYwilaXyiFwOAL3mpfSCwxXJ+LTjxp8gKu7lYsvav+VQyf3MnpIDohTAylDU
 QfcF8A4sIxiPjOjPMl+a4h7EosXdcEMqW4huuTZqVF3UZzCAxBacjT/F1Faf8Bn1fe8q
 5t9Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=S5Z/QkIN
Subject: [Buildroot] [PATCH v5 07/10] package/xnnpack: new package
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package is required by tensorflow-lite.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/xnnpack/Config.in    | 17 +++++++++++++++++
 package/xnnpack/xnnpack.hash |  4 ++++
 package/xnnpack/xnnpack.mk   | 18 ++++++++++++++++++
 5 files changed, 41 insertions(+)
 create mode 100644 package/xnnpack/Config.in
 create mode 100644 package/xnnpack/xnnpack.hash
 create mode 100644 package/xnnpack/xnnpack.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index daf0f89430..5e4daa7b3e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2730,6 +2730,7 @@ F:	package/gemmlowp/
 F:	package/psimd/
 F:	package/pthreadpool/
 F:	package/ruy/
+F:	package/xnnpack/
 
 N:	Stefan Ott <stefan@ott.net>
 F:	package/unbound/
diff --git a/package/Config.in b/package/Config.in
index 867159fa2b..7fa5bb867e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2136,6 +2136,7 @@ endif
 	source "package/uvw/Config.in"
 	source "package/volk/Config.in"
 	source "package/xapian/Config.in"
+	source "package/xnnpack/Config.in"
 endmenu
 
 menu "Security"
diff --git a/package/xnnpack/Config.in b/package/xnnpack/Config.in
new file mode 100644
index 0000000000..2016ce9817
--- /dev/null
+++ b/package/xnnpack/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_XNNPACK
+	bool "xnnpack"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
+	select BR2_PACKAGE_CPUINFO
+	select BR2_PACKAGE_FP16
+	select BR2_PACKAGE_FXDIV
+	select BR2_PACKAGE_PTHREADPOOL
+	help
+	  XNNPACK is a highly optimized solution for neural network
+	  inference on ARM, x86, WebAssembly, and RISC-V platforms.
+
+	  https://github.com/google/XNNPACK
+
+comment "xnnpack needs a toolchain w/ C++14"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/xnnpack/xnnpack.hash b/package/xnnpack/xnnpack.hash
new file mode 100644
index 0000000000..249f553f2a
--- /dev/null
+++ b/package/xnnpack/xnnpack.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  5d70dde70c0b1aef9e608f5d193c148aa1e538574a98d912278b51e60f2457f2  xnnpack-1f7f6131f7be587d0a657d03bdd0161d67ba2700.tar.gz
+# License files, locally calculated
+sha256  63f519e15726f4c4f830bd958f694c84fecb4e0a4cacc527d2696bb71ef95ada  LICENSE
diff --git a/package/xnnpack/xnnpack.mk b/package/xnnpack/xnnpack.mk
new file mode 100644
index 0000000000..d46b4c22de
--- /dev/null
+++ b/package/xnnpack/xnnpack.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# xnnpack
+#
+################################################################################
+
+XNNPACK_VERSION = 1f7f6131f7be587d0a657d03bdd0161d67ba2700
+XNNPACK_SITE = $(call github,google,XNNPACK,$(XNNPACK_VERSION))
+XNNPACK_LICENSE = BSD-3-Clause
+XNNPACK_LICENSE_FILES = LICENSE
+XNNPACK_INSTALL_STAGING = YES
+XNNPACK_DEPENDENCIES = cpuinfo fp16 fxdiv pthreadpool
+XNNPACK_CONF_OPTS = \
+	-DXNNPACK_BUILD_TESTS=OFF \
+	-DXNNPACK_BUILD_BENCHMARKS=OFF \
+	-DXNNPACK_USE_SYSTEM_LIBS=ON
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
