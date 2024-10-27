Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43639D10C16
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 10:29:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E69E640555;
	Sun, 27 Oct 2024 10:29:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2RYO573Uz8x3; Sun, 27 Oct 2024 10:29:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9BDE40422
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9BDE40422;
	Sun, 27 Oct 2024 10:29:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DEDBC971
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 10:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8FD580591
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 10:29:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bAJNSLtzPXbm for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 10:29:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 156CD80B86
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 156CD80B86
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 156CD80B86
 for <buildroot@busybox.net>; Sun, 27 Oct 2024 10:29:01 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-37d6ff1cbe1so2538748f8f.3
 for <buildroot@busybox.net>; Sun, 27 Oct 2024 03:29:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730024940; x=1730629740;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uI49F2wzkruMTctbq9eVZJ704IeT7MSfY8vdCXqb1oY=;
 b=QP821CsvE4cipKmAL4ITYL7D8NzehhGvL7xMZohf+pF5uPa5LxEeHq4lgrIEHRJa62
 FSQXQN9kwosAmX1AB8ikR8bnIECEAhGTUKOYqQfKflJDFvFSeFvfEVMK3dzdEGsUppDn
 7f/1spVDNS23025dFxbgj3cAdgC3huubbUvLIdn5DVwz4BC0HtXf7EmRCFuLNBQngLD+
 LRIRT3+0qm5TNjNkDPL3jex/q+pCTjbEWic9ZnK7nrM/50jZKS7elBQjJH3M3kOtDXgp
 Ax+pR2RqIp0XL2H1dBj82iFI0/RGZXXsX6Tx3AftdHcG8vlTNHFKTT4RDpNMQpYbrx5c
 wEpg==
X-Gm-Message-State: AOJu0Yw/64ym2zrlUtuXOWY/GBI4vPWTiYgxk7C7TND9V/qNrudBJO4q
 10HB7vMLoVQbVFB2fgR36iQBuVRZ0WDRLIEGvCLv105d3tArJTn4mWJSpDcGTVeOpPoPjkEfag9
 CVQ==
X-Google-Smtp-Source: AGHT+IHL/nY/RxPLvS2V7Tqw90IebFMyiy0tGZWwz9HF04Ny5IB7XL3rHZB85BqwWzPj8PqCROIopw==
X-Received: by 2002:adf:e30a:0:b0:37d:238:5a84 with SMTP id
 ffacd0b85a97d-38061141692mr3867175f8f.15.1730024939928; 
 Sun, 27 Oct 2024 03:28:59 -0700 (PDT)
Received: from vm-2404.. (206.34.66.37.rev.sfr.net. [37.66.34.206])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b1c645sm6455691f8f.17.2024.10.27.03.28.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 03:28:59 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun, 27 Oct 2024 11:28:25 +0100
Message-ID: <20241027102827.899852-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241027102827.899852-1-francois.perrad@gadz.org>
References: <20241027102827.899852-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1730024940; x=1730629740; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uI49F2wzkruMTctbq9eVZJ704IeT7MSfY8vdCXqb1oY=;
 b=kMXyEPAY/W8qrNER2NBVM4z8uMINkCdlOeQxd1hyKNtyG/NsxaaV1h4g4FVI907Z7g
 fKm3QyCloAueZnbbcLQZDvLeI62LaiBH7fVNi9IrUn2WUokC5c4bnAwbkml7idDY8cA0
 +VdXSl808/sD1/VljAeEcepgQEX2v3V0YBNzxakleDc9QRXxIM4WQ9QGE78sn+RTy414
 sajxxVCqVKxLXpRDzlPDOdj5tHoPnS44JFwbynl47N9k24HYilJn2e/zCOTkqIfo4yiy
 PRHDRk47whrLrXxSsOoeBjUGxrVFFE/w9OXIPjZqz1gA4IMyZhyjjGXQDkuYqMBXX3CF
 WBLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=kMXyEPAY
Subject: [Buildroot] [PATCH v3 1/2] package/busybox: handle
 LIBFOO_BUSYBOX_CONFIG_FIXUPS
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
 docs/manual/adding-packages-generic.adoc | 6 ++++++
 package/busybox/busybox.mk               | 1 +
 package/pkg-generic.mk                   | 3 +++
 3 files changed, 10 insertions(+)

diff --git a/docs/manual/adding-packages-generic.adoc b/docs/manual/adding-packages-generic.adoc
index 89fc70045..f0b0508f5 100644
--- a/docs/manual/adding-packages-generic.adoc
+++ b/docs/manual/adding-packages-generic.adoc
@@ -631,6 +631,12 @@ different steps of the build process.
   This is seldom used, as package usually have no strict requirements on
   the kernel options.
 
+* +LIBFOO_BUSYBOX_CONFIG_FIXUPS+ lists the Busybox configuration
+  options that are needed to use this package especially in some scripts,
+  or at contrario the useless options. This shall be a set of
+  calls to one of the kconfig tweaking option: `KCONFIG_ENABLE_OPT`,
+  `KCONFIG_DISABLE_OPT`, or `KCONFIG_SET_OPT`.
+
 The preferred way to define these variables is:
 
 ----
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 204ebe010..ef5521105 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -411,6 +411,7 @@ define BUSYBOX_KCONFIG_FIXUP_CMDS
 	$(BUSYBOX_SET_SELINUX)
 	$(BUSYBOX_SET_LESS_FLAGS)
 	$(BUSYBOX_SET_INDIVIDUAL_BINARIES)
+	$(PACKAGES_BUSYBOX_CONFIG_FIXUPS)
 endef
 
 define BUSYBOX_BUILD_CMDS
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 9ec84d0f4..dc500f6d3 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1242,6 +1242,9 @@ endif
 ifneq ($$($(2)_USERS),)
 PACKAGES_USERS += $$($(2)_USERS)$$(sep)
 endif
+ifneq ($$($(2)_BUSYBOX_CONFIG_FIXUPS),)
+PACKAGES_BUSYBOX_CONFIG_FIXUPS += $$($(2)_BUSYBOX_CONFIG_FIXUPS)$$(sep)
+endif
 ifneq ($$($(2)_LINUX_CONFIG_FIXUPS),)
 PACKAGES_LINUX_CONFIG_FIXUPS += $$($(2)_LINUX_CONFIG_FIXUPS)$$(sep)
 endif
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
