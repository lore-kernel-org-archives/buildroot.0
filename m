Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C736F99C95
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 00:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C727981521;
	Sun, 19 Apr 2026 00:21:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 05LwOcp9IYU0; Sun, 19 Apr 2026 00:21:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D30968153D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776558079;
	bh=64aOIxSJ7+/mjnuTSpAyEscBNu5Z24hppJEW5hXEU6k=;
	h=From:Date:References:In-Reply-To:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=cJLhHJuJCEwatgVlJL+y2gadAE9Z34vEQnO+v+j1M5q+4EWvU0ND4ijLzzhcAnXJ+
	 FKA59V/RSI7TcZoS7eq5TU1Sso+cKtaX6LD3nnOqU7cYhF3DJ/buqTWBFNoIUhny82
	 oecOes763/x7uJwF6sZ1s+kb3c6g/jXJQ2c60YlTVE++X3yCicG6/lr3LoZY/vUK34
	 NJqyOEHxT896LabGTUW95vh8NtR57KlI2M6X0dfmouE90xC9OYggYuY+LQPTeY3zfC
	 Xxi0XRoylb4wBagblPWtbGj+hDWaIW1vRlRki11qGPUfemRSLEPEFl5XvCI2wlQOol
	 2Ra/4hrhEk92g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D30968153D;
	Sun, 19 Apr 2026 00:21:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 40E0D259
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 00:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26C9B60EEE
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 00:21:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D2QnhE3VloN1 for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 00:21:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=obbardc@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D4301608C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4301608C5
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D4301608C5
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 00:21:15 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4887ca8e529so13639995e9.0
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 17:21:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776558073; x=1777162873;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NBikY3UNRgajw4soLf0atIq/1MhIRTBNYWOLhIcnrK4=;
 b=U5Zur76Y2aTc7XqKVaXU7dWpXLxY66BzCOfH1NqRAW0EeLAPgTW9VbwwoQwa+1ghRj
 6ntQ23MsfEBw1lxGfnDPlXvqgobcdLq+IuzIgLXcJsRqqvRjCMJOBNiyq53DBKCIiily
 l8g0Y7Ir3uiD1LpF6fU2kPj3fyG6ti52BXynMj8zDbIXHtNShjZfVNFOh5J9jN1A1WOi
 1J13+mssqnsWLV0fWXyRZMtg1YyPgj7aWtKI3ZHf/dJvliIdOXtOo6PqB9UAO1biJDaW
 7nRflvRktqPH+2HPCdjvvkZRMbX0bw2ImF38ADmUxo8eDMe362N5gr2aLB0NDgKoDSrx
 dm7Q==
X-Gm-Message-State: AOJu0YyGDgbXZ6FokwEowApR/npcghyZgnVPePo8fShXHwB+Xy5TH+em
 C5EJGKi6+K9f59Uf9u9Bz0I7iE/6UIlhrLgPalKqUV8S4qP/8l4HfLub
X-Gm-Gg: AeBDietvFtiRG/6bCfb6GduZkYOg4YtJWW2W9UmEdPMHXTFg207e0bvkwfepj51u4zw
 p+r/pNgsJK9z30uTDDXUhVcIhSk6kHeGRQ2v52qXEevdKXHuCd3czACMdg3f+JX5+4qdURLAJ0i
 rDY+5+4eJJoP15spXPOt607vj/sSyg7gW5Pv/C8j+gmeZz0PNQJ4fJ5zpTj/T1btkYV0lJexoFr
 fAZbE0jvfDjmqp/6j0fq7N1eZUwPfVpTLq1zvA5PWTG9BhP0S6Ljx+Z7h7fec625lfpiq1j//6r
 lR87RlwkRQQiu239un0Fb9s+OOMhEua9yow1jBiF5aYQ6l9t2/2C57cq+SiBK9Py+fRcvnWaETq
 yF6WNiwTJa8yvu6jKVkei0awhJ/tJODJ7BR95Y0qFu9t/DK9HNshjvleN7g9AM0v5kmGrLC+Y/o
 FVL6rGH5AUrlRpFuhFM5WXM3V4KfaFquFcmtzSTz89E6f7ET2tLG3psXIBPEPYurIYBwcv348/a
 3xPEc1d+cTlsEM0ognwDwlZes6+zgEnncHT/Om3h5tXJE3BMSlf4bLiZz9m6Qt5P/EEQlus4g+d
 R6kLBshkwi67VyYM5rirBIvkp/IWmrqSFd3ec1IrfmwrBTjPH03VTZbeNRWTzz/YNT7ZQ7Pnmpc
 Ht/5a
X-Received: by 2002:a05:600c:c0d8:b0:485:fbd2:f72 with SMTP id
 5b1f17b1804b1-488fb8838abmr79793145e9.1.1776558073385; 
 Sat, 18 Apr 2026 17:21:13 -0700 (PDT)
Received: from localhost (host86-170-11-80.range86-170.btcentralplus.com.
 [86.170.11.80]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc1070bfsm161989485e9.7.2026.04.18.17.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2026 17:21:12 -0700 (PDT)
From: Christopher Obbard <obbardc@gmail.com>
Date: Sun, 19 Apr 2026 01:20:51 +0100
MIME-Version: 1.0
Message-Id: <20260419-wip-obbardc-boot-efibootguard-initial-pkg-v2-1-1420c48f78fa@gmail.com>
References: <20260419-wip-obbardc-boot-efibootguard-initial-pkg-v2-0-1420c48f78fa@gmail.com>
In-Reply-To: <20260419-wip-obbardc-boot-efibootguard-initial-pkg-v2-0-1420c48f78fa@gmail.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6207; i=obbardc@gmail.com;
 h=from:subject:message-id; bh=eJXF5bXoJL0OBz2ivUUstngkHA3TLtIzHBz3FGZWK6g=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBp5B/21A0UoIHDxqHyIpvRaqw6EjHHk27EB0R15
 Cg/0U+FSTGJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCaeQf9gAKCRBjTcTwaHBG
 +JVLD/407o1pvCidqV6CjOIHcLHXHShRAjH4sc5O6QL+ll0nJaF84V3AFcfAicHbPzUvHcCf47H
 Yq1xxgJ8Q9a7OtpiI684WrS908fCLkjes7lHdI8Cu61GyMKTbLAmg21i6N68Q6MxzfcXTOKY6K+
 UWcze8HNB8Dbee14J9xGSFdESwzCj/K+rm1mKzdFtu7DT9oOLI89MQmTkR9E1tmEvS6eZbFXeki
 /UISkyEG3Y39GxgKAX3cO/o7cHlwKMQZS6oQOVrCJj61XzjrbYvSPtvkXM2Tiwt2oA/tYRXyrHT
 KB8fkdryxLXRQrVx2GA5JU15+B943xlrSWjHBrjJ4qw18O3Ik9RR/SGwFdYrS6ETG0MgfhDNUTy
 8uTYFVfCcZmJBaL0LVxUGFUi3ZcOOxDes3oHuuf6Wa+pURg6PrlorUu0BEEIjvK1heeX+aqdv82
 /lGS8whedEbwHFs/qpU4pDE5WdSQqJWCt3aTxIdGm03ch8D3pSJadM9oHekcwv0CDc/DUThsJ0x
 taLcY5N3KoqfFegc6sbVbJ/H4pcKQZnJmeW+ZYI4ZK8SJkKDnUiO2eCLWeWkBhdS6+NRkLhEpLQ
 9v53AKdOqxrRWuRplJQbbnnXwtXqeFv6UnDxAnRGEo541WHa8fVvPMrp7Y5+m8jifRNzuALe50q
 2xckz5dRRYTdQcQ==
X-Developer-Key: i=obbardc@gmail.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776558073; x=1777162873; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NBikY3UNRgajw4soLf0atIq/1MhIRTBNYWOLhIcnrK4=;
 b=s+hrmhVRuUdcqCKZxyorHFlK7X5bWmCouHVc2G9fgXdqmDuU5xopxmCcTnEMuGRnqX
 NxrnAWObyOtIz1SCVzudIfq9wcop6uj5jfWDvYNnkevz5mxbiUk7Oh2/9rwK+7QEC9mX
 wS3O6bxllMoCcJj0XDUhcyzcpfYvA9tGBbN4aJTMBtM8GQ1ZiFPSoLYrP9oxgRnrpVfB
 5fFuoDVNOrNKMj7NvnaoK93Tnu28zvyIKvFZ8UP6sGGjl5IqR5dNGykLBuFyMqD9TZo4
 zAoVVT45MCEoABYmYlfF8NmDim4S0lgPxbe2ryLNJL4s/76oEaQFEosAULRoVkRT7Xon
 QOoQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=s+hrmhVR
Subject: [Buildroot] [PATCH v2 1/2] boot/efibootguard: new boot package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Christopher Obbard <obbardc@gmail.com>, efibootguard-dev@googlegroups.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds a new boot package to Buildroot for building the
efibootguard bootloader from the https://github.com/siemens/efibootguard
repository.

efibootguard can be chainloaded as an EFI application or used as a
standalone bootloader and can be useful when building A/B systems.

Add a recipe to build the EFI bootloader application, user-space
tooling & host tooling (both of which are used to manage efibootguard
configuration).

efibootguard supports multiple architectures, but for now only build
the EFI bootloader for x86_64.

Signed-off-by: Christopher Obbard <obbardc@gmail.com>
---
 DEVELOPERS                          |  3 ++
 boot/Config.in                      |  2 ++
 boot/efibootguard/Config.in         | 37 +++++++++++++++++++++++
 boot/efibootguard/Config.in.host    |  8 +++++
 boot/efibootguard/efibootguard.hash |  3 ++
 boot/efibootguard/efibootguard.mk   | 60 +++++++++++++++++++++++++++++++++++++
 6 files changed, 113 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9e983ae113..f64a5d6370 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -697,6 +697,9 @@ F:	package/perl-sys-mmap/
 F:	package/perl-time-parsedate/
 F:	package/perl-x10/
 
+N:	Christopher Obbard <obbardc@gmail.com>
+F:	boot/efibootguard/
+
 N:	Clayton Shotwell <clayton.shotwell@collins.com>
 F:	package/audit/
 F:	package/checkpolicy/
diff --git a/boot/Config.in b/boot/Config.in
index d73d221431..8e6dc7a5cc 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -15,6 +15,8 @@ source "boot/barebox/Config.in"
 source "boot/binaries-marvell/Config.in"
 source "boot/boot-wrapper-aarch64/Config.in"
 source "boot/edk2/Config.in"
+source "boot/efibootguard/Config.in"
+source "boot/efibootguard/Config.in.host"
 source "boot/grub2/Config.in"
 source "boot/mv-ddr-marvell/Config.in"
 source "boot/mxs-bootlets/Config.in"
diff --git a/boot/efibootguard/Config.in b/boot/efibootguard/Config.in
new file mode 100644
index 0000000000..47fd478e8b
--- /dev/null
+++ b/boot/efibootguard/Config.in
@@ -0,0 +1,37 @@
+config BR2_TARGET_EFIBOOTGUARD_ARCH_SUPPORTS
+	bool
+	default y if BR2_x86_64
+	depends on BR2_USE_MMU
+
+config BR2_TARGET_EFIBOOTGUARD
+	bool "efibootguard"
+	depends on BR2_TARGET_EFIBOOTGUARD_ARCH_SUPPORTS
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_GNU_EFI
+	select BR2_PACKAGE_PCIUTILS if BR2_TARGET_EFIBOOTGUARD_INSTALL_TOOLS
+	help
+	  EFI Boot Guard is a UEFI bootloader intended for robust
+	  A/B style updates. It arms a hardware watchdog before
+	  handing over control to the OS and supports a fail-safe
+	  boot mechanism to roll back if a boot attempt fails.
+
+	  https://github.com/siemens/efibootguard
+
+if BR2_TARGET_EFIBOOTGUARD
+
+config BR2_TARGET_EFIBOOTGUARD_X86_64
+	bool "x86-64"
+	depends on BR2_x86_64
+	help
+	  Select this option if the platform you're targeting has a
+	  64 bits EFI BIOS.
+
+config BR2_TARGET_EFIBOOTGUARD_INSTALL_TOOLS
+	bool "install tools"
+	help
+	  Install the efibootguard user-space tools (e.g.
+	  bg_printenv and bg_setenv) on the target. These tools
+	  allow reading and updating efibootguard's configuration
+	  in user-space.
+
+endif # BR2_TARGET_EFIBOOTGUARD
diff --git a/boot/efibootguard/Config.in.host b/boot/efibootguard/Config.in.host
new file mode 100644
index 0000000000..845c14c079
--- /dev/null
+++ b/boot/efibootguard/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_TARGET_HOST_EFIBOOTGUARD
+	bool "host efibootguard"
+	help
+	  Build efibootguard companion tools for the host. These
+	  can be used during image creation to inspect and
+	  modify the efibootguard configuration data.
+
+	  https://github.com/siemens/efibootguard
diff --git a/boot/efibootguard/efibootguard.hash b/boot/efibootguard/efibootguard.hash
new file mode 100644
index 0000000000..6f5a5cf25c
--- /dev/null
+++ b/boot/efibootguard/efibootguard.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  6c68c541311dcc8c2be0042f7887acc2a24d2ac68a88d426380fdbda9f476ae8  efibootguard-0.22.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/boot/efibootguard/efibootguard.mk b/boot/efibootguard/efibootguard.mk
new file mode 100644
index 0000000000..c40cef13ac
--- /dev/null
+++ b/boot/efibootguard/efibootguard.mk
@@ -0,0 +1,60 @@
+################################################################################
+#
+# efibootguard
+#
+################################################################################
+
+EFIBOOTGUARD_VERSION = 0.22
+EFIBOOTGUARD_SITE = $(call github,siemens,efibootguard,refs/tags/v$(EFIBOOTGUARD_VERSION))
+EFIBOOTGUARD_LICENSE = GPL-2.0-only
+EFIBOOTGUARD_LICENSE_FILES = COPYING
+
+EFIBOOTGUARD_DEPENDENCIES = \
+	gnu-efi \
+	host-autoconf-archive
+
+ifeq ($(BR2_TARGET_EFIBOOTGUARD_INSTALL_TOOLS),y)
+EFIBOOTGUARD_DEPENDENCIES += pciutils
+EFIBOOTGUARD_INSTALL_TARGET = YES
+else
+EFIBOOTGUARD_INSTALL_TARGET = NO
+endif
+
+EFIBOOTGUARD_INSTALL_IMAGES = YES
+
+EFIBOOTGUARD_AUTORECONF = YES
+
+EFIBOOTGUARD_AUTORECONF_OPTS = \
+	-I $(HOST_DIR)/share/autoconf-archive
+
+EFIBOOTGUARD_CONF_OPTS = \
+	--with-gnuefi-sys-dir=$(STAGING_DIR) \
+	--with-gnuefi-include-dir=$(STAGING_DIR)/usr/include/efi \
+	--with-gnuefi-lib-dir=$(STAGING_DIR)/usr/lib \
+	--disable-completion \
+	--disable-tests
+
+# TODO: Perhaps take inspiration from Debian patch https://salsa.debian.org/debian/efibootguard/-/blob/master/debian/patches/always-override-stack-protector-variables-in-EFI-bui.patch?ref_type=heads
+EFIBOOTGUARD_CONF_ENV = \
+	LDFLAGS="$(LDFLAGS) -no-pie"
+
+define EFIBOOTGUARD_INSTALL_IMAGES_CMDS
+	$(INSTALL) -d $(BINARIES_DIR)/efibootguard
+	$(INSTALL) -m 0644 $(@D)/efibootguardx64.efi $(BINARIES_DIR)/efibootguard/
+endef
+
+HOST_EFIBOOTGUARD_DEPENDENCIES = \
+	host-autoconf-archive
+
+HOST_EFIBOOTGUARD_AUTORECONF = YES
+
+HOST_EFIBOOTGUARD_AUTORECONF_OPTS = \
+	-I $(HOST_DIR)/share/autoconf-archive
+
+HOST_EFIBOOTGUARD_CONF_OPTS = \
+	--disable-bootloader \
+	--disable-completion \
+	--disable-tests
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
