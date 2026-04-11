Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C65E0F36BA5
	for <buildroot@archiver.kernel.org>; Sat, 11 Apr 2026 08:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74A0383673;
	Sat, 11 Apr 2026 08:06:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CC-c3dWGwgUs; Sat, 11 Apr 2026 08:06:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93992836AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775894786;
	bh=bBAKhZ81B4s7zWHQ3a3d351Z886M/gkwdlqF72Bwnbo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=l51ItgufjwhonXJwbZBXD7uuFcsxh1cLsIQrT4xH35Hs9yHLo1AKVcpcBp2vJ27XB
	 dYMeUI4mEOwFtckz4QOjTqnGrkh5SmaqRQDmQ+OYKa7rte65bY3E0/rTIEFppQA0S+
	 RuP97zvkZ9+XNGlDXecWkxQiPJvWKopzqVqrZAAvBOGJLkMokLCLJaxQLgcRzN9BUU
	 XPEQ+zTvYcNGQdlNeBCPXTxV8ZQJm+PT+FZIDdXYTVbrM8q3KkPViN4LfdfnVJwpVt
	 nsfiqYwLvZygu/IdFn6M/TvmOsD4+T36np5XsCXMCLjIia3UXgUZhJvRRqEcXJanFc
	 j6vHEHJ6qxVGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93992836AE;
	Sat, 11 Apr 2026 08:06:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D5D07EC
 for <buildroot@buildroot.org>; Sat, 11 Apr 2026 08:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B41D9836AE
 for <buildroot@buildroot.org>; Sat, 11 Apr 2026 08:06:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bLmBiHCA2vgQ for <buildroot@buildroot.org>;
 Sat, 11 Apr 2026 08:06:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6955383673
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6955383673
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6955383673
 for <buildroot@busybox.net>; Sat, 11 Apr 2026 08:06:24 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-488a29e6110so31162625e9.3
 for <buildroot@busybox.net>; Sat, 11 Apr 2026 01:06:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775894782; x=1776499582;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rSGwfO5LbWBXDs9oYoeEpQu3T8W6ccl4UdEOce398s4=;
 b=DKLjcXy71LL3AZ+MjUtOciQRk0gc5CA3Bzm0OHi4yD4a5fI/KSL9AlS20wFLh2oyn3
 vhvSHsoFffSpg5HD3EOlPW+vvv/i0Ch6EcQy1vhhtoO23eL06XL/2DbVmzgovCD/84tk
 vpXgCxEcEK3Q96V+9rweEHAXn+T/ylPzBOMKEbwdiULhRjtjTOq8FnRJ4KwqYU60+6l5
 bRP9whKOxHGr+kAe2xusz9UUfFzl+hIURXxQJMcvdeDH9S6QW89IbTCrOTvY5/mTzxwE
 ZEKPhgCTrEi677Nmq6OOevF5SXgG4IkQsGRwCDZx8ZHS2B4eZboRKurDGgjeM6iNJbcR
 1BYw==
X-Gm-Message-State: AOJu0Yyen+Rxy//WcaBj8KlRf0T+Hy1zJOO8c4ExcYoZlLBdP4wAVfdn
 l55F3ZuaZJAZKqrez25Sfnt4kL3GdYyD/v3xZyiIkzO33YYD932c3WJSJKml0o18BV0Jy1VChAY
 9mPA=
X-Gm-Gg: AeBDievBwofb6HeEufJ9JTZPwSUbyaZFvuWd7Fl/TjKIPgxT5IIcdEuLa6FLb/Vcs0/
 yovp6c3qmItWtej9+94QJ2k65bW8j4UIcRnbABZmS0PFAWAp7K3aBNTJlW23xLvUwI2RILeveS7
 dEI2qs0sMuXuczR16H5W7mT8KOb7cxc2ZNG7nbk+S2nD3lTuKCEdULp23HmitBHTfTSfyF8z5p5
 u3wmubzqgMGjzsDtgJm07JerA7xcSQ/8CNb0FR0NN9zl8xA/+HB2qxXm2IafAUucLfquAfb0fy0
 CjZY9TR6tYvv9cxIrRGLZYb0LMyqIAxF17AQOYqzBaEKMuIBfGBxZaT2rikiu7LGefY5vWKHXgP
 XIMM2oOlwP1/zdjNXeAvD3gVacxH/SdVESjYSqoZIiumngT/mf1bOWOoXbk745dv4/QEtmX8IFG
 /t3VW+sorgJV4tQbAmUxomDjTbSLs39k5PtvWV20wIXssc4iAzVA==
X-Received: by 2002:a05:600c:5397:b0:488:b8bc:6a32 with SMTP id
 5b1f17b1804b1-488d68a4765mr85852535e9.23.1775894781002; 
 Sat, 11 Apr 2026 01:06:21 -0700 (PDT)
Received: from vm-2404.. (222.186.66.37.rev.sfr.net. [37.66.186.222])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d6864121sm39396055e9.28.2026.04.11.01.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Apr 2026 01:06:20 -0700 (PDT)
To: buildroot@busybox.net
Date: Sat, 11 Apr 2026 10:06:16 +0200
Message-ID: <20260411080616.670069-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1775894782; x=1776499582; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rSGwfO5LbWBXDs9oYoeEpQu3T8W6ccl4UdEOce398s4=;
 b=BtUQSiFPi/6o7+dDH5SIs3MjWXlkaB6Hhq+V0RiYK2ZQX54GOsxSpNWf/FCVLJV4/p
 gq6mYPprK3cJzRmKkFunLf2OhNb6+anxX81q0E8gjqzA3VtJ/dz0u5z1qdm0ynyKlQdQ
 o93TbdD29XiDE+KT5K1wTLOZAZNZUj1ZUHDdhlCc5SgTr9RkPOI+V9hSFYEqm4WMK9aN
 hAXTdXJ/6ZGdeuZzFR7dRUNDTqyg/2VcqiLp5m0NOU9AkCzbjeBsPmCkV7txaApm0+Jq
 YNIUo5Yo7caakLABkYK+dE0Gr/Da1PVP3RdlKGkde/8HjQGotJ8C33vWCBgnmUhjcv43
 7hGA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=BtUQSiFP
Subject: [Buildroot] [PATCH] package/opendoas: new package
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
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/opendoas/Config.in     |  9 ++++++
 package/opendoas/opendoas.hash |  3 ++
 package/opendoas/opendoas.mk   | 50 ++++++++++++++++++++++++++++++++++
 5 files changed, 64 insertions(+)
 create mode 100644 package/opendoas/Config.in
 create mode 100644 package/opendoas/opendoas.hash
 create mode 100644 package/opendoas/opendoas.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f8c71d679..3ec8a16a8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1197,6 +1197,7 @@ F:	package/lua*
 F:	package/lynis/
 F:	package/lzlib/
 F:	package/moarvm/
+F:	package/opendoas/
 F:	package/perl*
 F:	package/pkg-perl.mk
 F:	package/pkg-luarocks.mk
diff --git a/package/Config.in b/package/Config.in
index fbc2605ff..77af2c332 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2746,6 +2746,7 @@ comment "Utilities"
 	source "package/lowdown/Config.in"
 	source "package/minisign/Config.in"
 	source "package/neofetch/Config.in"
+	source "package/opendoas/Config.in"
 	source "package/pdmenu/Config.in"
 	source "package/pinentry/Config.in"
 	source "package/qprint/Config.in"
diff --git a/package/opendoas/Config.in b/package/opendoas/Config.in
new file mode 100644
index 000000000..f359ed576
--- /dev/null
+++ b/package/opendoas/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_OPENDOAS
+	bool "opendoas"
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
+	help
+	  OpenDoas: a portable version of OpenBSD's doas command.
+	  doas is a minimal replacement for the venerable sudo.
+
+	  https://github.com/Duncaen/OpenDoas
diff --git a/package/opendoas/opendoas.hash b/package/opendoas/opendoas.hash
new file mode 100644
index 000000000..ada1835f5
--- /dev/null
+++ b/package/opendoas/opendoas.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  6da058a0e70b7543bc60624389b0b00b686189ec933828c522bf8b2600495a67  opendoas-6.8.2.tar.gz
+sha256  293e7f2bc3a06396b200956cd660cd101bdb3c109f31c9ab6f2547f2105b38af  LICENSE
diff --git a/package/opendoas/opendoas.mk b/package/opendoas/opendoas.mk
new file mode 100644
index 000000000..baeb37e4c
--- /dev/null
+++ b/package/opendoas/opendoas.mk
@@ -0,0 +1,50 @@
+################################################################################
+#
+# opendoas
+#
+################################################################################
+
+OPENDOAS_VERSION = 6.8.2
+OPENDOAS_SITE = $(call github,Duncaen,OpenDoas,v$(OPENDOAS_VERSION))
+OPENDOAS_LICENSE = ISC
+OPENDOAS_LICENSE_FILES = LICENSE
+
+OPENDOAS_CONF_OPTS = \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--sysconfdir=/etc \
+		--with-shadow
+
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+OPENDOAS_DEPENDENCIES += libxcrypt
+endif
+
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+define OPENDOAS_INSTALL_PAM_CONF
+	$(INSTALL) -D -m 0644 $(@D)/pam.d__doas__linux $(TARGET_DIR)/etc/pam.d/doas
+endef
+
+OPENDOAS_DEPENDENCIES += linux-pam
+OPENDOAS_CONF_OPTS += --with-pam
+else
+OPENDOAS_CONF_OPTS += --without-pam
+endif
+
+define OPENDOAS_CONFIGURE_CMDS
+	(cd $(@D) && \
+	$(TARGET_CONFIGURE_OPTS) ./configure $(OPENDOAS_CONF_OPTS))
+endef
+
+define OPENDOAS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		CC="$(TARGET_CC)"
+endef
+
+define OPENDOAS_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/doas $(TARGET_DIR)/usr/bin/doas
+	$(OPENDOAS_INSTALL_PAM_CONF)
+endef
+
+$(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
