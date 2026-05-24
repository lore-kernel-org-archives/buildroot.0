Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB44CD5BB1
	for <buildroot@archiver.kernel.org>; Sun, 24 May 2026 17:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1DD4607A5;
	Sun, 24 May 2026 17:23:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z_-pAIo5uioq; Sun, 24 May 2026 17:23:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF48B607BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779643435;
	bh=Ho+nkRu8itoAqgNdQFVI71HzrQ7hcsxQNC+hWXucNXQ=;
	h=From:Date:References:In-Reply-To:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=JISYsdCeOeBLz5nMKPmzGGdQw0LMrMl8k8DemKWnjAxsP7+mrgv7/uEEQKfp/un29
	 2KXtV2k9jorlmHadOHute4YzuDUTwehQ5YJzYh1NPQMUH48JIq425QhmRAJbhLlwLk
	 h8effYJNJpa/50zodmeV2+ehrn1CtNaSlmRRMCWt2D88xgeDN4Wi8dRUtVDbdtIcdE
	 gcc58rAUstl1OIaNoJNuE9MBRoFXBgLFw+FjwykX0zwcxRuvRh1SXJXa0NGsX9J0y9
	 EUFNezbN9Zl1tcbsIsnC4bTOQn5pcE2I783GSi24xlTlu7cEWEYLRVjZ++Z5JCiiT+
	 0NPQF2yTEZLAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF48B607BB;
	Sun, 24 May 2026 17:23:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E91D69
 for <buildroot@buildroot.org>; Sun, 24 May 2026 17:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3459640C33
 for <buildroot@buildroot.org>; Sun, 24 May 2026 17:23:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id chOC-usC4sN1 for <buildroot@buildroot.org>;
 Sun, 24 May 2026 17:23:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=obbardc@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E7C1240C2A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7C1240C2A
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E7C1240C2A
 for <buildroot@buildroot.org>; Sun, 24 May 2026 17:23:51 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-44b330c5cc6so6787523f8f.1
 for <buildroot@buildroot.org>; Sun, 24 May 2026 10:23:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779643430; x=1780248230;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3MDIXdamq/INvrgxYJ/0iRelPffiY0N2MAeFiy/Px9E=;
 b=C6XLtSSuHeZbPrI0KfqPpL2CB2dIUIX3mKprQNjWZ77F7EtVhG+2PlJEO9LOIKgaQi
 adx4TJF9PyCnZ2k+VX4h3RQ5SQJTnwfxVqW/36PwXmwAqmk1507z/3m6gBxBOmgzXqF/
 JQQO4A+fUo1yIB445Ss9ONYftrHNUmqYuQNiQrqTle98gvVaBPbEPidaS3Tpxcogn+QO
 nR1dWscL9z7SJN0xoQ1hcB3wRiFSwHunCDyhLk733mZDN8ejuqP/OwSUMkmD9PcKMC4b
 DPRahgnTZTMgx+2tz8BaFMpTfl8e2Di2RxiVBVAap6nNQ2Ep2KRJYspFmcNU8ZHp5JCP
 U9fg==
X-Gm-Message-State: AOJu0YzyBYmHqo/DLR1dZzYsLaKnjNKCTWvqP2cUmtayo1nPxCaemrJo
 TRflU5/mkJjc6pCN2KHsGLkx4kPIN6LmrXpWy8Dfmm/L+rkmf0Fawt45
X-Gm-Gg: Acq92OGwauVdgafE326bwaDAmDl7Oj8C2YwwjxzSXiIdgWmeg7YVbND1lNgCYmr7+YX
 JIMP68B4xNLXfZ9mTf6IdsASsqVCeCpO9pZAcbs1eiQuBPiVU1v47o33Gb9GIoqftgLO6Qx06qq
 dmVs9pgMsKN9q8sQu08ccZ8GbxZHYcQGieh9cOSKKY9quWCC35E/s6uPxBOi5e1aRrNUX4YEowZ
 lre34oWxgbTv1Z0YXcZtMC7TYG+DP+N0yRf74XNiRHz9lOhZj4k9adRGr+4E0LNZcXzTQ4243YY
 DAAhMstwUoF2sDipPZow8h9/Mlpl5f7DfDytbgb0Sa806R28mPP94RrOMuP4TiOBm+oqmH+JZ6C
 1mCSz/8z9E7qUvqLP0Pb0DCVrfdowV5Gwl3zEL2aZL35o3qaA7IlpJwH94e75GNPE5XednH1Cxi
 9eeerxYfQsy1NkdZ4wQipXxAORE4Qr1JQEirq9LHmt8HVsQdB9fNgV/1Eyl2kglSwA5/8mniHld
 TniDGWy2OmcQI8+QQoOSw7/I7I4c9UqeRWx2WsyJD+RtH91KCHqDodBWwU3mVNtkTQW5SFqeTem
 FD5jBeN1sEPH7l2Zmyz9cT3CiAPTSJhm8j7C1KMRq7aMTd51lmRC0qcWjuB1Idsd6KR4+w==
X-Received: by 2002:a5d:64e1:0:b0:43d:7d24:b510 with SMTP id
 ffacd0b85a97d-45eb38af491mr19695320f8f.22.1779643429609; 
 Sun, 24 May 2026 10:23:49 -0700 (PDT)
Received: from localhost (host86-170-11-80.range86-170.btcentralplus.com.
 [86.170.11.80]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eb6bc5479sm22396022f8f.0.2026.05.24.10.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2026 10:23:48 -0700 (PDT)
From: Christopher Obbard <obbardc@gmail.com>
Date: Sun, 24 May 2026 18:23:38 +0100
MIME-Version: 1.0
Message-Id: <20260524-wip-obbardc-boot-efibootguard-initial-pkg-v3-1-47fc8262591b@gmail.com>
References: <20260524-wip-obbardc-boot-efibootguard-initial-pkg-v3-0-47fc8262591b@gmail.com>
In-Reply-To: <20260524-wip-obbardc-boot-efibootguard-initial-pkg-v3-0-47fc8262591b@gmail.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6243; i=obbardc@gmail.com;
 h=from:subject:message-id; bh=AUvvGp3sq+H8m4pBqRHVWMZkzeX6Jpp1JoPBUKDveP8=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBqEzQiLm6Pv9Gw/J93qOI1uP5XxRaSWils1hOkH
 k6KLMS34U6JAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCahM0IgAKCRBjTcTwaHBG
 +FEgD/sGZTIQEhmvoH1VxCAg8ixKYpn2+2YxyqWexUJhiH/pIY6YMRH8I/blFYmT1/ncR633kUJ
 YhATk9eJGcGB7BC6A5KkwB6lv7e0QO/Fdz9VrPVbvvg1z/3bmpJEJkarcWN7qdwsy1lgswjvSG7
 NsK1KvAKNpJOY9lYMGALIasOOSW1DWP+2y8s/TSAzNu+WXIZngAGxaeZvFiy2vO+Y8ywy2f/5un
 ZMC+fEivj3ruxkT1klGRR50d0p+FuorPTpTT/hnPt4e70n3iBptIbZo1Bw0f1OmgLq53aID55eC
 xoYuIr5ymIaj44W56KytDj223pXkfkjOfH4uCCF+lKxVXQxUcMumUWYbNsRJh6cyby/0zyKRmrL
 EljOSqemzPo/FKzOKPVvCqFqypkZFaO1BhVCYyGJ9OiNn5F9jBy+Zzt1MtDh+Ih4i9R1ya9ClV7
 +F6AC4mlT/IuAqn+4Bq51wbGBHBhC6Nz0krQGLPuRVOyiVrr9MQ796ksj/v1ekQcgBM7BYaIfw2
 QMcdjNviQpjTpi77ZbG3uTJVwHXrgQckKLrJwKMcp9OQgb8exBj063rIqfXl9b+Q2liRVG4HkLc
 cMbkjW7ietdsEXOrN8TW2Xa/oVc0vfUfHtDWqqSBJafpMynaAYZbW9iU0pqKxOozj0yeof591Me
 CDlF0XJGze3CCjw==
X-Developer-Key: i=obbardc@gmail.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779643430; x=1780248230; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3MDIXdamq/INvrgxYJ/0iRelPffiY0N2MAeFiy/Px9E=;
 b=H6QGZ3BSdJkgaARDVdvGum3aN05JPNh6YequBTLYA+tLoKcLQiDi+JZOrTn5i9zM08
 FC7ckrlxSSkqRyMCN1AfwEAQUna6ADEQI0bekNRB7GRc224DjgCNR/jmLtVU1ZbrtajS
 HGx0DCF+yiEb2uLuEjTJXcVbg7uicNtgkDssaQTlKLaQdLIUisGoRnsIIqFw5wJIr85W
 Dgk3T8YbdEEja4cnkIoQ9YgGOVEnSNUbSTm8lRaSJ99oEAUh3a9pb3EL+65iOe+rI9AK
 pQBNTiwOK1riRexSJn/7SBl6ZO0pk9RxX7DyO5L7OJeK4GhCZ1TUCfxVaZ6ldBdXrMaR
 9wDg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=H6QGZ3BS
Subject: [Buildroot] [PATCH v3 1/2] boot/efibootguard: new boot package
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

This patch adds a new boot package to Buildroot to build the
EFI Boot Guard bootloader from the https://github.com/siemens/efibootguard
repository.

EFI Boot Guard can be chainloaded as an EFI application or used as a
standalone bootloader and can be useful when booting A/B systems.

Add a recipe to build the EFI bootloader application, user-space
tooling & host tooling (both of which are used to manage EFI Boot Guard
configuration).

EFI Boot Guard can be built for multiple architectures, but this initial
patch only builds the EFI bootloader for x86_64.

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
index 125e7f8248..246b1aa44e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -703,6 +703,9 @@ F:	package/perl-sys-mmap/
 F:	package/perl-time-parsedate/
 F:	package/perl-x10/
 
+N:	Christopher Obbard <obbardc@gmail.com>
+F:	boot/efibootguard/
+
 N:	Colin Foster <colin.foster@in-advantage.com>
 F:	package/python-tftpy/
 F:	package/rauc-hawkbit-updater/
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
