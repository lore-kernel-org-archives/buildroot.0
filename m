Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC1FFCD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 20:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96CF06132E;
	Fri, 12 Jun 2026 20:51:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7H7FgXAnTMW9; Fri, 12 Jun 2026 20:51:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F62261336
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781297480;
	bh=BwJkfwKQ5RwFRoe3pxDikFr2G8rnNMflATgNCSl9a3U=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=r89KTHRlNo97PErDOjXG8ejzCIoEz100yM6kgnCZUk1Vh+sBL3Kv9Er15GI1Z60Hn
	 3m1nHxPQOxPN4ZymXOl468U30w9WD9qIzXVDa/s03eJjCOtjl1iA5pyyYjYTvxKXO/
	 RZrcg5usQcPuwmh3yHUuh8Iv/tfgg/eM1pmZOg30kO4clc2vLo0owvJ/6G6ERZ7Cxu
	 F4WNA7nh+cPdFbuI2En9AX/YXNC8UOMlS0v5WzoM1+EFiIu19TLGaWlx76xXcmc507
	 bilj9HSALeHTDPqpuNQVr6gzGUpEGVOZFl66JQPsRM1AWK2swtne9ChUjmvWzBW5SS
	 O8QNaltwK3Z0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F62261336;
	Fri, 12 Jun 2026 20:51:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D3D2237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 20:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DBC568414B
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 20:51:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ohZfJ4HbF-w for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 20:51:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 64614816EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64614816EE
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 64614816EE
 for <buildroot@busybox.net>; Fri, 12 Jun 2026 20:51:15 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-45e9f4a3510so857392f8f.1
 for <buildroot@busybox.net>; Fri, 12 Jun 2026 13:51:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781297473; x=1781902273;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tjOQNH3GkwAVmJBOqVcGiH2RmAczphJod0HSinh2ZG4=;
 b=Nq4+TwRAXBvD5rcD6KZMXmyFFgc0vOkIglYwI1LdeQFWr4GBUWZQOmVZBwA4tGx6vL
 SzOyIPz+VSd52Q/Ybq5ID5NxBmXEgnqpDEhvyMun/yNCNtFp8YIwQnaviVqXWd7xn6ua
 HF2ENtZbqG54AhveNwTKjS4I05smt+3KU+wxH6SHNaNB7KdEi+ZtG4gSKiR06xADGnN3
 sV+c7g019v766lWA8wWts4WPbDTH66a6oKo3b3HjdhnTJy0Cb0eaBzZsI1EYhY2lwTgw
 l8B5mYlNLgLu9qowIu9IYLfHRjk3xcznhEw6gd2/xYue9e7WVGb7YaXH6xaXeZv/8OjA
 HtOg==
X-Gm-Message-State: AOJu0YyRJ6IDdMsuhIbVEXS5esSafVsX/gQXuTVzHX4/oQEN4NLNxDU7
 JJNRVjeM1SHJLSXgJ/hKclyLdMPk+kR6JWsiALgUnqCFFsdsgVUHQp0is1bhLm8Aw2lTLncQ5Y4
 g0kH2Pg==
X-Gm-Gg: Acq92OH1wB6/BR7Jbb/cykaEa1/tpB4fyBygLsXoo57uftuHTHC4HkQzojwotfq8Q5C
 3ayQVsb2KWPzg+oSjhwsX87CbnpOM2rerRNU9SCBSl3OLPquJCcuX7kDYV4xyT/lphlo8NOFURa
 iqehFOwEB+Q8EOBUDQpGkYiRgLRDvF4V8hGbG2hh1Ejky6U+n7C+unL2AWwRSKwkjQKXOAzkaox
 XbrDRpH5OqvORWrPqoovQFhBioSchtkfPMfuziD6ANvR9nWTfGOv1PlbXxf6eEGJusB/ssRVMYE
 XKYzepneWNK7RN77PxjbNIDlNj6tFvFzlOs3C/2udoFBu3qVDlBb23GnadEil7YiMFl1mK2VTej
 WBY9+p++f0plDA8AfPS00jRs4++PBNGq4kdKLtcNzcqlE8bFPPyrol+DeGbC21kVaNFPlDwqgzK
 gjmKhxZukrqLZySOX2T8+EQLdBOxlqfxyeATNkNgKdtgZNqYdo2A==
X-Received: by 2002:a05:6000:1446:b0:43c:fb48:6856 with SMTP id
 ffacd0b85a97d-46074a5bdeamr1072281f8f.13.1781297471948; 
 Fri, 12 Jun 2026 13:51:11 -0700 (PDT)
Received: from vm-2404.. (165.186.66.37.rev.sfr.net. [37.66.186.165])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f26434dsm9353447f8f.1.2026.06.12.13.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 13:51:11 -0700 (PDT)
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad@gadz.org>
Date: Fri, 12 Jun 2026 22:50:23 +0200
Message-ID: <20260612205029.269642-5-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612205029.269642-1-francois.perrad@gadz.org>
References: <20260612205029.269642-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1781297473; x=1781902273; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tjOQNH3GkwAVmJBOqVcGiH2RmAczphJod0HSinh2ZG4=;
 b=LGCIkLp257UxHXg1KYUvmy+swlCJxlHpxfSfDCxS8LxdOkooDmA4GrRY8Nx4m7nqDU
 W809e5H5LT9dDSiHcwvfM0zvjerUg27ClkyJvgsyAj9wC7cTLzvGgZSUztRlXBnFwtgl
 kT0Xe1BqNdEYA/g8QxiFmQObZPqZCZKUxLUcs2JJTEs55OpfhGeSTy73+nhJEulR74e9
 acf8LxRzGE1MFM7Kvvf1RkJukZnly6Aa7mEwMNolHpgQYnC9ujoHw3IgQZlutkwqy61B
 olD2Nrvgqs4Kcrw+IGpwJrzVaXYZUNfD5Zl/G+wSmZRecFLRHpxE/wSvL/inhfnxvEns
 xvrg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=LGCIkLp2
Subject: [Buildroot] [RFC PATCH 4/9] package/hare: new host package
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 DEVELOPERS                  |  2 +-
 package/Config.in.host      |  1 +
 package/hare/Config.in.host | 14 ++++++++++++
 package/hare/config         | 45 +++++++++++++++++++++++++++++++++++++
 package/hare/hare.hash      |  3 +++
 package/hare/hare.mk        | 27 ++++++++++++++++++++++
 6 files changed, 91 insertions(+), 1 deletion(-)
 create mode 100644 package/hare/Config.in.host
 create mode 100644 package/hare/config
 create mode 100644 package/hare/hare.hash
 create mode 100644 package/hare/hare.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 681469716..81259905b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1176,7 +1176,7 @@ F:	package/copas/
 F:	package/coxpcall/
 F:	package/dado/
 F:	package/ficl/
-F:	package/harec/
+F:	package/hare*
 F:	package/janet/
 F:	package/qbe/
 F:	package/libtomcrypt/
diff --git a/package/Config.in.host b/package/Config.in.host
index df57cc0c1..595caf9e7 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -54,6 +54,7 @@ menu "Host utilities"
 	source "package/gobject-introspection/Config.in.host"
 	source "package/google-breakpad/Config.in.host"
 	source "package/gptfdisk/Config.in.host"
+	source "package/hare/Config.in.host"
 	source "package/imagemagick/Config.in.host"
 	source "package/imx-mkimage/Config.in.host"
 	source "package/imx-usb-loader/Config.in.host"
diff --git a/package/hare/Config.in.host b/package/hare/Config.in.host
new file mode 100644
index 000000000..a6c53b376
--- /dev/null
+++ b/package/hare/Config.in.host
@@ -0,0 +1,14 @@
+
+config BR2_PACKAGE_HOST_HARE_TARGET_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64
+	default y if BR2_RISCV_64
+	default y if BR2_x86_64
+
+config BR2_PACKAGE_HOST_HARE
+	bool "host hare"
+	depends on BR2_PACKAGE_HOST_HARE_TARGET_ARCH_SUPPORTS
+	help
+	  The Hare programming language
+
+	  https://harelang.org/
diff --git a/package/hare/config b/package/hare/config
new file mode 100644
index 000000000..17366d0a5
--- /dev/null
+++ b/package/hare/config
@@ -0,0 +1,45 @@
+# install locations
+PREFIX = /usr
+BINDIR = $(PREFIX)/bin
+MANDIR = $(PREFIX)/share/man
+SRCDIR = $(PREFIX)/src
+STDLIB = $(SRCDIR)/hare/stdlib
+LIBEXECDIR = $(PREFIX)/libexec
+TOOLDIR = $(LIBEXECDIR)/hare
+
+# variables used during build
+PLATFORM = linux
+ARCH = $(HOSTARCH)
+HAREFLAGS =
+HARECFLAGS =
+QBEFLAGS =
+ASFLAGS =
+LDLINKFLAGS = --gc-sections -z noexecstack
+
+# commands used by the build script
+HAREC = harec
+QBE = qbe
+AS = as
+LD = ld
+SCDOC = scdoc
+
+# build locations
+HARECACHE = .cache
+BINOUT = .bin
+
+# variables that will be embedded in the binary with -D definitions
+HAREPATH = $(DESTDIR)$(SRCDIR)/hare/stdlib
+VERSION=$$(./scripts/version)
+
+# For cross-compilation, modify the variables below
+AARCH64_AS=aarch64-linux-as
+AARCH64_CC=aarch64-linux-cc
+AARCH64_LD=aarch64-linux-ld
+
+RISCV64_AS=riscv64-linux-as
+RISCV64_CC=riscv64-linux-cc
+RISCV64_LD=riscv64-linux-ld
+
+X86_64_AS=x86_64-linux-as
+X86_64_CC=x86_64-linux-cc
+X86_64_LD=x86_64-linux-ld
diff --git a/package/hare/hare.hash b/package/hare/hare.hash
new file mode 100644
index 000000000..98aadd890
--- /dev/null
+++ b/package/hare/hare.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  f76704920a2f457be4d2d6290dc10dcfb7319c1d1990f2305491644383466905  0.26.0.1.tar.gz
+sha256  be782a711236b742d7231a4a9a15ca781013e61dead0d6908105fbc2cb38a317  COPYING
diff --git a/package/hare/hare.mk b/package/hare/hare.mk
new file mode 100644
index 000000000..39b0cc77a
--- /dev/null
+++ b/package/hare/hare.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# hare
+#
+################################################################################
+
+HARE_VERSION = 0.26.0.1
+HARE_SITE = https://git.sr.ht/~sircmpwn/hare/archive
+HARE_SOURCE = $(HARE_VERSION).tar.gz
+HARE_LICENSE = MPL-2.0
+HARE_LICENSE_FILES = COPYING
+
+HOST_HARE_DEPENDENCIES = host-qbe host-scdoc host-harec
+
+define HOST_HARE_CONFIGURE_CMDS
+	cp package/hare/config $(@D)/config.mk
+endef
+
+define HOST_HARE_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(HOST_DIR)" all
+endef
+
+define HOST_HARE_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(HOST_DIR)" install
+endef
+
+$(eval $(host-generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
