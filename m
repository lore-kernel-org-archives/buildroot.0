Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09014C55162
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 07:00:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B816B606FD;
	Mon,  3 Aug 2026 07:00:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rDce-SbCj_Vx; Mon,  3 Aug 2026 06:59:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31CF3606F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785740399;
	bh=hj6JB2ssPsVPCe3RSxWYCbo/znehMcAIZUlrnDK0eHI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UE6TZcysgvGhUokHtNzom9yO1BRRY/VXe7R64+pPNhpvEF+u+pRLncpSKcif52gnY
	 pRatbth2RkZ+QNGfS71fnjXMejqubWg2JWytBy/XJNNbDzBJend7drtXcJFUWYSpTh
	 Mw1xakmeEifEqP1fpOO+rbAqF3NYa14Fi/RbZF6rGGm92xBIa5Z9kp+CAbamTm0dws
	 oxwHeVK9EnBR0iuSkZ/sX+fR5WU0DYUYrFGBy1ZMCgC6Eyu+jX1WIseo4uVq5Lk/3I
	 He3fV6sXvLkJE2c+iXR80cjdUniDJFR6feh0S4VdroEfyK3j5WJnH922vIEjONPI+G
	 uvjqrliqtn+Mg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31CF3606F7;
	Mon,  3 Aug 2026 06:59:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C8B536E
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 06:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 129C880C9A
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 06:59:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kYa04uKZlU2Y for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 06:59:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1C1D580C98
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C1D580C98
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C1D580C98
 for <buildroot@busybox.net>; Mon,  3 Aug 2026 06:59:54 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-498028b3d5eso19283545e9.1
 for <buildroot@busybox.net>; Sun, 02 Aug 2026 23:59:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785740392; x=1786345192;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=q0vlnXPzC/D/mAptqsIvAQQ3Dw/Tq3eeGXjQ/QI2vbg=;
 b=gOZ3q2TztertQWBReUgEPTGjDY7iqmFcj00MM31LE+VVgwXDAKYLjbj/qPgoto0Brj
 sMIlE7xaqTbAzkGJ352CE/Xez4byRmZw94GlZs3B2jTULgx2JIAespxGrDCLq36YCJ4v
 H/qLb6xowY9Y61PZYQuMBJCt3yo/dtlhSJciSc0fTu8Z1m2ybJZOknLshVgdH4fu/cI3
 2GwmY6jS5QJ+ALRVUhAEo5XpL6iE636gINPJ4TJ33XJTy1ScjIzRIYNDSR/v0PhZ0spt
 WVLiIIJFcnvKEnjQk++Q2B7/M8dmNVO1xxty7PClPuFqVJuomiY8jJCR6WkCQoS6OMf6
 Y5kQ==
X-Gm-Message-State: AOJu0YwyKZ2azMerSEU4ZgSq8EEAcPUH6orR/8WQiPJaIIk+xhmNl+KF
 lsWLnpcoVCzu+XpsmiOmiJfJ5XtoLabAJRiU0QnqVUdevkAj7SCRTlfia2XxUg==
X-Gm-Gg: AR+sD10FgFEr+rQG38t1bNLgUKtkmPn085Q6myDL2VT3OrreQcBRsQ2bWdseYo5ACUq
 T9fI63W4qK3jCnix13XrfPdal/Bk7/MBAClOSiendsO+6fgU89D7bTKjTJp9zZB2Zx4XjvGVYz/
 nWKw1l+7g2USKZoRyTydB2NeAvPjeeJYCfkANvbDpNTqPZObitKrnUXbGHaE8/H8OPSrl890G3B
 oK0YsKV/i2RIBN8wTuplLFaYwkV793aU2elmIPU1DMng+rubkeiSEEKVGBtgFfmX9/o2xsz9GMs
 D1reWtGvujv4F2W4hhocc3YsKRQij+Y0jUDR8AN4COuk4zx3BBqGvdLSBvM16S+vUsl5ElBYojs
 xV3y6CxWkzLvOhpqsyDjHlEGqSxwIvNEDjg0iRzFA12kM2mkUll+n+R0vw/m3J4sAVW3nZllKZV
 DCzmlacbBpioNh/KypIaLuYGOCF9RJhPQcdSU5V+h2oQpPrL4vmHlb/t2zM9BdTgWQ3bkoUkUCf
 Tga3hwkfWBgPFZbU826KA==
X-Received: by 2002:a05:600c:8b14:b0:493:c47f:3c55 with SMTP id
 5b1f17b1804b1-4980c66d940mr199292095e9.5.1785740391945; 
 Sun, 02 Aug 2026 23:59:51 -0700 (PDT)
Received: from vm-2404.. (132.187.66.37.rev.sfr.net. [37.66.187.132])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49807b5b4a2sm234639805e9.1.2026.08.02.23.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2026 23:59:51 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Mon,  3 Aug 2026 08:59:35 +0200
Message-ID: <20260803065940.224429-5-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803065940.224429-1-francois.perrad.86@gmail.com>
References: <20260803065940.224429-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785740392; x=1786345192; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=q0vlnXPzC/D/mAptqsIvAQQ3Dw/Tq3eeGXjQ/QI2vbg=;
 b=hBNDfyiSGpsOUwgrlTdQPxGyxyFSjSfo1Xhy06Nf2dnlsyOST5ee4WoG7MtsT3CD99
 LujstgUvYNG4zRS6eZl1MVUTnWCRyqcX4rlN0Ra9iJ1vdgJxRyxff9zZe0AJBFOuybQB
 IProEogzwul5c+svBD0l23Ovn23uYSU/BJmyjTcfzKa5S5K2xZSXVBderkpVHD8TRFRL
 QfkVPvRFvE7QpSevvZWxTNkG9IuDPkXxQpK8KYrOEDONwY+zJaAhperAA0LcYAx7D2r4
 zW1J0AnJhQDu/vjnrDQIiTbks5DU0jbR2Qu+CBXXLHI+A3xywUxTBpJTak2qyWUVYWVB
 YqQQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=hBNDfyiS
Subject: [Buildroot] [PATCH v4 4/8] package/hare: new host package
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

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 DEVELOPERS                  |  2 +-
 package/Config.in.host      |  1 +
 package/hare/Config.in.host | 14 +++++++++++
 package/hare/hare.hash      |  3 +++
 package/hare/hare.mk        | 46 +++++++++++++++++++++++++++++++++++++
 5 files changed, 65 insertions(+), 1 deletion(-)
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
index 000000000..88662d3c2
--- /dev/null
+++ b/package/hare/hare.mk
@@ -0,0 +1,46 @@
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
+ifeq ($(BR2_aarch64),y)
+HOST_HARE_TARGET_ARCH = AARCH64
+else ifeq ($(BR2_RISCV_64),y)
+HOST_HARE_TARGET_ARCH = RISCV64
+else ifeq ($(BR2_x86_64),y)
+HOST_HARE_TARGET_ARCH = X86_64
+endif
+
+HOST_HARE_CONF_OPTS = \
+	ARCH=$(HOSTARCH) \
+	PREFIX="$(HOST_DIR)" \
+	HAREC="$(HOST_DIR)/bin/harec" \
+	QBE="$(HOST_DIR)/bin/qbe" \
+	SCDOC="$(HOST_DIR)/bin/scdoc" \
+	HAREPATH="$(HOST_DIR)/src/hare/stdlib" \
+	$(HOST_HARE_TARGET_ARCH)_AS=$(TARGET_AS) \
+	$(HOST_HARE_TARGET_ARCH)_CC=$(TARGET_CC) \
+	$(HOST_HARE_TARGET_ARCH)_LD=$(TARGET_LD)
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
