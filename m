Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBE2C4451C
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 09:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1719140884;
	Tue, 21 Jul 2026 09:39:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DdGWInhK32dx; Tue, 21 Jul 2026 09:39:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 041C340893
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784626792;
	bh=qPeBNlfEHKn3BSjFUy6PXZyIln1rHfdXQe1rS6F1N60=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TVGbvItAisUnclsjxaRnKoyp+aVR6gnbx9gtOn6hR6kV2UTLPlwOQE8qZ3g/wZqGJ
	 +NN2vMOFKPxfqkwDRZd38o2mGE2hsvn/sauhYU71oeGdzkwfHtvsUHvTY96g35wcd4
	 qtPFnCBN1em4tNngdxO1vSjHfTDT5zLlNwhgUyqI9tPhpbd6aVn4LeuAMzz4MeEzE6
	 lbOLLP8yMCMb5Aa903DOhKbvexpJi286yFMAHQyvje/LP8+nZD+9lfd0w71UaL/xmf
	 NAGNvKjo8F71F3wnoaKy8EIc8enk1cx4Em/K+7ND0mPhU6n8wt6PFdM4k5YLLRfIz1
	 0tyVELTyXPW1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 041C340893;
	Tue, 21 Jul 2026 09:39:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8801696C
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 09:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A10B80B84
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 09:39:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5feYt2reaBpT for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 09:39:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5B87E80B5C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B87E80B5C
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B87E80B5C
 for <buildroot@busybox.net>; Tue, 21 Jul 2026 09:39:46 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-493f6de72faso32825715e9.0
 for <buildroot@busybox.net>; Tue, 21 Jul 2026 02:39:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784626784; x=1785231584;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=nR/XDy0YaRrsiPtYMojLAKZZweLAr6Yxem71MpVcf/8=;
 b=CW6oWHbkaJe3nxvmbCKRaJXJFwJHj4/N/+IOIxZUMNAPMdVIHBHH3wKfPr8MpFMoM5
 Lkb8Klnw2SdLK5HrRfGImyOgEOzHnaCNgwVHRsAzn7KdO50ndYRu2eeaeynZN8N6AefH
 iZqxjoOeyGMmdf/2ldcU4Zyjl0trSSUE714DrMlChnDQL9fGEtxn24OPt3J7WxnEujmL
 lWfB2B3vtltz/AU+nBtLCqLZU1vX2qaSOtd3ww5K6WuL2IVtvLE217J2ISkEPOOpuHgw
 n411O2fBs5L6IsCiJADlezQF3NL6wXwS4PlNiEjgVYA00RBjPOr0PDiwDe1r5yHZKp0b
 lsYw==
X-Gm-Message-State: AOJu0Yx47DklFJt4eTP2hE9nRZRNo01+Ao6qKbB8NTaZMACTTXTYIn7X
 qZU3ukG23LIpREmQd1LTpRCI2yIyKjXw7aE2ERgVnicpfuP5rbMqQw7TC/UjBQ==
X-Gm-Gg: AfdE7cmFyhM1Oz69QV9femKgJ/sguO91VllJGbUCy+JaSBgO1O/wbhe7YX5K/LhxQc3
 0wmRN/qlSMOEUgQzd6daQrdtbi380WmsOERj1OOv58fmMm91Oy0414pMg5NdtkYfyp9XMjCt47+
 QVndI0B8xznO9DA2pstFzsEgl7UJ2h0xkk7njkjJc8nTafgo0BY0j52qlu3gazlOt7cyqG7j9+U
 9PLpmzCLVD7wXIYwh4GA0BXrQVPFO4km/aKrglRPgnntnIPsPZyXHrJ9WmVxwjr/B9SL8pGmX3W
 alv1DyyTLYhb0gYQxx4CEOk+lSMGVjDwuxaBvguXSkNMwFtkVcmsXtd8boC3k3UvVVQH8M5A9lI
 BOpfxGMD1gwYa4Ns7ku++fb1MBMFSohX5xgQTWSLsTNz/ZbHs1DTv6Erfhsm6Dcj/pQWQWLyIIV
 ux2pmdo2tjE9MuSCmwZ9PZrNm6Rh3IvoADmw==
X-Received: by 2002:a05:600c:1906:b0:495:3bc6:d381 with SMTP id
 5b1f17b1804b1-4954affd764mr187150995e9.2.1784626784207; 
 Tue, 21 Jul 2026 02:39:44 -0700 (PDT)
Received: from vm-2404.. (132.187.66.37.rev.sfr.net. [37.66.187.132])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4956546db7bsm56227655e9.3.2026.07.21.02.39.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 02:39:43 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Tue, 21 Jul 2026 11:39:28 +0200
Message-ID: <20260721093932.282565-5-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721093932.282565-1-francois.perrad.86@gmail.com>
References: <20260721093932.282565-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784626784; x=1785231584; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=nR/XDy0YaRrsiPtYMojLAKZZweLAr6Yxem71MpVcf/8=;
 b=EbWaADEpHCPdJal5mJ+e6hVoqr7g5t6UZpWysFqIA0dlXWLTdiuHZP+q60wXdkQ6TU
 z01wuw3Rj10zsWtfZlzZFpI7xMRvYKgODX1CbOsMBygz/5VZ7pdkPsQySGGSmmzrZ+bE
 sQ+osJQutVuFDyBrcxan9Bzbl8VugZEt2lvIjx2XnJz+vwbm1q3Ef7lGhCpzFlvnNd4q
 aKb0lZxcLRrPy43lI9e+bRNOLRe8uFjsIq+rV69RJF0rQKDUeoHWT3c7C0ugCVGO21QD
 JY0Q2eSFA+1TijTSDPzTxyyZeaCWQNLLEaLsHMEjCNEv6ny4VU9aHBekSGw3gXSh7TBv
 7fPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=EbWaADEp
Subject: [Buildroot] [PATCH v3 4/8] package/hare: new host package
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
 package/hare/hare.mk        | 47 +++++++++++++++++++++++++++++++++++++
 5 files changed, 66 insertions(+), 1 deletion(-)
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
index 000000000..9a85d4c14
--- /dev/null
+++ b/package/hare/hare.mk
@@ -0,0 +1,47 @@
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
+	DESTDIR="$(HOST_DIR)" \
+	PREFIX=/usr \
+	HAREC="$(HOST_DIR)/usr/bin/harec" \
+	QBE="$(HOST_DIR)/usr/bin/qbe" \
+	SCDOC="$(HOST_DIR)/usr/bin/scdoc" \
+	HAREPATH="$(HOST_DIR)/usr/src/hare/stdlib" \
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
