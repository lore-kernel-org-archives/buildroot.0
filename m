Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B179C4452C
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 15:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6503180CC8;
	Mon, 20 Jul 2026 15:02:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fRAk9WXdrvim; Mon, 20 Jul 2026 15:02:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 278C480CBF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784559773;
	bh=DrGqJqtMHVp378PfpwjrBGUb+5CW7GcwX1r/tDwrPiw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gDamX+HqFrP9TV4ndvldV3jHTwTtKSlT2zyoFg8v+te0KxMsLivy5RqM8CuJWqMXA
	 co1KWEc8QJSI5TsoGUX7lUpR0p0ZuI2jtC8GiZX1nfiL1tjZ0Xk5LVnl+uu0xOy/eE
	 mQpFrUaO+fuy5f05/j5ozZ3UWgUSGoW+3w7Vg1WK1NcaaT0ZGjUx0kpCbx2a8qvddE
	 a97zHm/sB/p6lvunvTkjjOINtciq3bB+ZYJYL992MS6ztr1ZjxvR7FMqLTRUJUYPbj
	 snE8UROqx9FgM/3ozV2/C/9kSphND5fmRIAImB29ejnXWga2tkW5SjHgLhpyr0e5o4
	 NRhxEjyHp6cZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 278C480CBF;
	Mon, 20 Jul 2026 15:02:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 842071F6
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 15:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 721A580CE9
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 15:02:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ZjvzGO7zP0n for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 15:02:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 79F6680CC4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79F6680CC4
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 79F6680CC4
 for <buildroot@busybox.net>; Mon, 20 Jul 2026 15:02:48 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-472326ca506so7906130f8f.2
 for <buildroot@busybox.net>; Mon, 20 Jul 2026 08:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784559766; x=1785164566;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=h+KcB/PZFhWmSBLHQpXvDv7Z9QH0rLr+Y3mavZaB9R0=;
 b=DOdFI6l5jZiuzKshXuUBBHFrNJe6Nu/6QZ1ZcGAVCuQcLglvXieMwQK8hHbsxx2o4m
 NOKenwR2Uk9EdaioiPu4v2YiEhNhqnnGBZm8nQPWkFFoTnVsr5doWK3EelXLfbnTNYA1
 jzJRP9RjOJ6zkR4kHFWtImbuBOwLQFk3O0YfERVhVnHXlokRj+0soxG6dhJLokMXNpv5
 5l4BNZcv45ao3W02oCAdt7p65CwtX9QDZ2vMJFNIHPbEup5GkZygpIbrc/MFql28Vcdr
 AKGhO+KeqYMAZ5YJpF0px6YnYTEZKZt49ouLpUbC0Xxu9DquWdjkla1CJNJhfhXOq3c0
 iUdw==
X-Gm-Message-State: AOJu0Yxc7P8lpObaE2EOcxciA9Md3VBLMWEgn3gY1veYjZfg+TswDwfm
 RSrK8zAscLiPfbK278wfJLtAfAh1t7OyQxWFFKB5j4kHWVBuE2WgXNJd90ioXQ==
X-Gm-Gg: AfdE7cmtMh2ir46b/+94Ar5cXl1LyhfWhe+n+jHqZJ69tuPtFZJltqMKwmEQDTwU74T
 ya7prkdYDbaluf7G9qzdQ8dJU5hhtcZB5Wi2YR57AJwKehZ0EF0JK7cFwZJz1D6ISL1eTc4dp6s
 FYaXdzFOI2LeWCLriQ7bOIKlmPIGEgSeNCMjdcEbGPYeceUT2PUch3j7tYUdmHg4X/ugmTudlza
 uYUrqGTtywqCbpyQSyHAcKjoYwhJz/kIu2omxA+hPdttIcvtSZohelfURAuOSMTLcEjtlTJgS7R
 XrHJbEHnPCWNJvkhIFsU90VHl+Yhd8njt6VwRN+/dV1SR5mP3hzYqTmFU555n3zuGqSFpGLsFWP
 2RHbtoI2TDVRhoolP7e3Im0MZuVweUwV489n5W3LLE29W3yGlDLLqRgRap48L+d32Xm7Tu4Xm1e
 dP3wJtf81H0JDqhXS3IGwHssT1Ks0+zU1hNjEN1qg=
X-Received: by 2002:a05:600c:3b01:b0:495:4fd4:144b with SMTP id
 5b1f17b1804b1-4954fd419e8mr120659535e9.21.1784559766258; 
 Mon, 20 Jul 2026 08:02:46 -0700 (PDT)
Received: from vm-2404.. (132.187.66.37.rev.sfr.net. [37.66.187.132])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63ee926dsm28681532f8f.35.2026.07.20.08.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 08:02:45 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad@gadz.org>
Date: Mon, 20 Jul 2026 17:02:31 +0200
Message-ID: <20260720150236.243961-5-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720150236.243961-1-francois.perrad@gadz.org>
References: <20260720150236.243961-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784559766; x=1785164566; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=h+KcB/PZFhWmSBLHQpXvDv7Z9QH0rLr+Y3mavZaB9R0=;
 b=cFEORllaOwKQA8rLbQBYIY8xpA5YolOe/5wgih0GAfcfE6lZO8VWxOZ8pYg1e4ynsX
 UJDeCOoRIxNHAj63XlIyQhnpgc82R8bcl5lLpY1nrjmtuKgrAjEkkaBMCPu/Ss65mc+L
 FB2zVDHTMbdQKG4KfVlNMJyN1+W7Xd0aBCC2/f4cBZVFrvawSgCHppXcb56AwlV4ASAO
 wUWZYpmNav11gDxZJ7Ltt/Gc0f3TWQYyfyFv+ihz9pCITjdtnjk/Rv2AfdAmKXrwGvvG
 CA95o65YHhU1Rt4G3Tk1AtqnJD3dYBJOx2u+U80YQ5Zc20kzpE1iGjrjJ0J80OfaEVPm
 oYSw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=cFEORlla
Subject: [Buildroot] [PATCH v2 4/8] package/hare: new host package
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 DEVELOPERS                  |  2 +-
 package/Config.in.host      |  1 +
 package/hare/Config.in.host | 14 +++++++++
 package/hare/hare.hash      |  3 ++
 package/hare/hare.mk        | 57 +++++++++++++++++++++++++++++++++++++
 5 files changed, 76 insertions(+), 1 deletion(-)
 create mode 100644 package/hare/Config.in.host
 create mode 100644 package/hare/hare.hash
 create mode 100644 package/hare/hare.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 0b99456a9..89232ff71 100644
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
index 000000000..d408b03d6
--- /dev/null
+++ b/package/hare/hare.mk
@@ -0,0 +1,57 @@
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
+HOST_HARE_DEPENDENCIES = host-harec host-qbe host-scdoc
+
+HOST_HARE_CONF_OPTS = \
+	ARCH=$(HOSTARCH) \
+	DESTDIR="$(HOST_DIR)" \
+	PREFIX=/usr \
+	HAREC="$(HOST_DIR)/usr/bin/harec" \
+	QBE="$(HOST_DIR)/usr/bin/qbe" \
+	SCDOC="$(HOST_DIR)/usr/bin/scdoc" \
+	HAREPATH="$(HOST_DIR)/usr/src/hare/stdlib"
+
+ifeq ($(BR2_aarch64),y)
+HOST_HARE_CONF_OPTS += \
+	AARCH64_AS=$(TARGET_AS) \
+	AARCH64_CC=$(TARGET_CC) \
+	AARCH64_LD=$(TARGET_LD)
+endif
+
+ifeq ($(BR2_RISCV_64),y)
+HOST_HARE_CONF_OPTS += \
+	RISCV64_AS=$(TARGET_AS) \
+	RISCV64_CC=$(TARGET_CC) \
+	RISCV64_LD=$(TARGET_LD)
+endif
+
+ifeq ($(BR2_x86_64),y)
+HOST_HARE_CONF_OPTS += \
+	X86_64_AS=$(TARGET_AS) \
+	X86_64_CC=$(TARGET_CC) \
+	X86_64_LD=$(TARGET_LD)
+endif
+
+define HOST_HARE_CONFIGURE_CMDS
+	cp $(@D)/configs/linux.mk $(@D)/config.mk
+endef
+
+define HOST_HARE_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_HARE_CONF_OPTS) all
+endef
+
+define HOST_HARE_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_HARE_CONF_OPTS) install
+endef
+
+$(eval $(host-generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
