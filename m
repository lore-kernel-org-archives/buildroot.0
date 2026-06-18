Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96AEFCD98F0
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 01:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 661CA60F48;
	Thu, 18 Jun 2026 01:23:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z79f3s5qG5RG; Thu, 18 Jun 2026 01:23:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 449B260F30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781745827;
	bh=9wFBCcf+7Zt0dY2g6AETV+ZCaGO6DVd5HT3ZHKEJezo=;
	h=From:Date:References:In-Reply-To:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=RwY+jYq9/u5ImAJSF+UtV0TOZzRUO+MJ1uKNJBQXbRVuZTo5ED39a4ywUatHX3vch
	 cYA6iMNb94bNzE42lD2XpkE3dxPlI6Zs231HfqCx4WfvvqsNehgGrUDeluW8/DfkYK
	 UOg8gafLUfnGMBbyrbQkevB4nHftURdkdIS3dP5Ip6ALTFL8GmB4TPAIwvbmgj4Y2X
	 nRFoH13c32PIdunQ5v3zIuDFv1lEOc1Eip+mPu1RKEhQLQPJlSUqLxu+SBLz58EXUW
	 bAp+0ptgf0R2EVEF9K7pIujJS1arC6a+aKckQ+aTMB8a2zOgFVys/5iY4qenwl59TM
	 QJlBQ3OO5Q4Rw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 449B260F30;
	Thu, 18 Jun 2026 01:23:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 30096131
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 01:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14FAB60F2A
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 01:23:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lCisNYG7dack for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 01:23:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=obbardc@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ADF8D60F2C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADF8D60F2C
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ADF8D60F2C
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 01:23:43 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-463b2f6fc9dso369259f8f.2
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 18:23:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781745821; x=1782350621;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PtLh78WNWYLP00BkqABU/Qp/WlFjeX+VniTC5NKhEfs=;
 b=paWGo3c8WAPO9CQvQi2+rV5Fb5D5rH7Vsm7n13jvv2YW1wmoWCw4V1DBjz7J0i9WqU
 Bpn4odp1YBKFwKGHje0MfqNRnYFdyI45jM+u/VojapofW9AtFLN4+oUILTNrU4V0fWbj
 MLrfdkEu7V9lpNOUgesN7GYqHKh73CujNG7INm97FF92A/jzxeyPAlp9LUFsZhCsrVth
 LpUK0/XkQ0Ur4ZO7X7w6EQlROX+syvWEiKtcWYh8WXDWVi2dRBCRLcnnhHDKAtblrk3D
 9UvE0jREqEMEgwhujwavd/6saLkCSmVaWrTjzLgMIlNje5lxGwY9IHOB3bp/htex2nQK
 gaZA==
X-Gm-Message-State: AOJu0YzYR2IcP63tmod8Xh6HDrfSHHoFQvQJd906uwsDa82KdBEGGxZy
 oYvbM7BMV5tWyJfQ40nPFB9oCERE1YE1H3azY8I5YRdBVkf67hpJm13ZpdIYUXuAMMc=
X-Gm-Gg: Acq92OGI2cCJYXf5eWUfozBov8/hPf4/OhSSjn5d9IwdtbIXad1vwV2BA6VQXDdiJO/
 eOUPqbThW7YEnZlQDiNLeLkHTrJ2uG9Fl9EoNYPuNHV9AfIbZScvtfi9BqUT7c3i51ywSJFM//W
 xQjs32pZJJNRRM2H4q9JeTuDaMS+m5l9eZfIb2Ox0lwxufv7O5xZQNgAt4tfDVmK+VDt2cc22St
 DQlQkjOQkfJfDlV73GvvSnn6LYFOD0qmr2t4dwYCPGXQA26ZRS8wGvcftdocJemLKXOYqPGr8hg
 tUdVNOLOJn9UxQvuzBCeEE64oPK6UHcoM4gPpyS9SdBlQoHCszSKCD1iQl5VDAZSfa8IrPMZ1IT
 4cBhZWvD1OPW+79jdEVN51pm4XygdNa//HFWY1AK6qEbRtWJW94Idgp3XI3ceyoG8xoXVms7e7P
 UM4A8Beut7QWWiykixpBUWu4AClguxGfG8rC9Bs44+NxfnEkVpn/lFkGHfhwVB/jc6nC+o9n4Wt
 9dMt/+/Dg4zDyivy+vRxdUhd3ORi+uLdVYHFIDSnEK0pA7DZ0z+YQMHV2Pof7WLprJ29R+iLCfo
 BkSZF3KVa9aiyGLIcirPC/ebRGoqnvzj2l0wCCFkCz0BhK2yWcSiewwhyBE=
X-Received: by 2002:a05:600c:4e04:b0:492:2fa4:2563 with SMTP id
 5b1f17b1804b1-492333eb324mr109643435e9.25.1781745821435; 
 Wed, 17 Jun 2026 18:23:41 -0700 (PDT)
Received: from localhost (host86-170-11-80.range86-170.btcentralplus.com.
 [86.170.11.80]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2c473bsm63440674f8f.28.2026.06.17.18.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 18:23:40 -0700 (PDT)
From: Christopher Obbard <obbardc@gmail.com>
Date: Thu, 18 Jun 2026 02:23:29 +0100
MIME-Version: 1.0
Message-Id: <20260618-wip-obbardc-boot-efibootguard-initial-pkg-v4-1-65fa5eb2acf4@gmail.com>
References: <20260618-wip-obbardc-boot-efibootguard-initial-pkg-v4-0-65fa5eb2acf4@gmail.com>
In-Reply-To: <20260618-wip-obbardc-boot-efibootguard-initial-pkg-v4-0-65fa5eb2acf4@gmail.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7624; i=obbardc@gmail.com;
 h=from:subject:message-id; bh=YqjJHMsdNVV0UWF/bOfIom58FfVY6pgoJyo9C79s25E=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBqM0iajKMfSDGCxnvo1KBispqah5nXrXJK28m+K
 3iSn7tqDtyJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCajNImgAKCRBjTcTwaHBG
 +Nq6EACLAglwgkm9po+qL/uGdJvpq8+YgH9lczTJd4Cg7PfTsx6dVwNgqnvXdjXBS/rQxGjKf23
 8kUueVKMm5m2wkUvqDc5vKF0QtmhCyjZcEHSBhom0rnhfnkUaybQX7HXma1sdu0YR+bIMoQ86PC
 O5KsJ+IAJlzqmba/0FjHKh+O3WnoFeFqTh0KYCBnmtWoZON2eFhJEsZzZ7YjlUGNProB/j1/pgn
 Qa84Z7zT3oM/Wq2V/DhHlpS97XsRuct4ntErz8fb83jizkTMzgH98Jr7nnqvWLARQe2nSk4Li/S
 tjlJHBaiyJJBogQbE+wRg5ar/ecPa19ZQ7dCWqd6ZNS1QNnui2lckTURCM0ixP3NkBPbJm5LW/L
 oE1h+3aSq8zI7f6ZqXisssUbZZr9HYaekYsh+66N2Cm2xoqbTdvSIXXUzLbPoeP2gwB3EQIW+Gp
 UQsmYE7E9f1qdjvcaChPyarqIPNuKBpoEeFiCjwAOcJN/CQXAALK1mgF72GH75mSXj03SkZBeq/
 LEbmF+LOX0in+0CqbUez3sPp2CpyiS42UvnP0mdCa2bq2CdnU4r450WHKektH39XqFcsqsjH4pk
 rjMmM4Osr+HeYsvVDrVRqOWkujZ6UG4p6M3fB0o+K3sLepZFrBSW3bQvchDtZQNW61wFZ5OWZez
 z4QEUkG9MRWQM8Q==
X-Developer-Key: i=obbardc@gmail.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781745821; x=1782350621; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PtLh78WNWYLP00BkqABU/Qp/WlFjeX+VniTC5NKhEfs=;
 b=Ux6Di4Kb8hGrj237khahCpbMXflV476Y3L2PSnN57dkQmi744HslsLZcXkLSe/heSq
 Sh6D5W01rb25ttbIlDHWf9XK4RZE2xsbnXDgJ8qPVCMmLADhpE6M5hMP67G+d5pnaO0j
 0LAeo/oXLw/UHvVJ5uJH5bhW9qfclDwOEl6ZPLlxeLI/nD4zG4pVdEEzU0gzvwMR0Lgm
 reOnEHnwPN3PyiFhfzqw7fS7+No/yu3gOw/7ZaTgSTKQ3CdDUGyuxFwfaBEnZEDWQBP+
 Qs2O87kPwX25Fyx1XyGbc0V7qUnSU0c3S3PSr+RHr6o3XwX2fWWVe7TVKO63jK6Itd3y
 NlVA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Ux6Di4Kb
Subject: [Buildroot] [PATCH v4 1/3] boot/efibootguard: new boot package
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

Signed-off-by: Christopher Obbard <obbardc@gmail.com>
---
 DEVELOPERS                                         |  1 +
 boot/Config.in                                     |  2 +
 .../0001-Do-not-use-ld-fatal-warnings.patch        | 32 +++++++++++
 boot/efibootguard/Config.in                        | 30 ++++++++++
 boot/efibootguard/Config.in.host                   |  8 +++
 boot/efibootguard/efibootguard.hash                |  3 +
 boot/efibootguard/efibootguard.mk                  | 67 ++++++++++++++++++++++
 7 files changed, 143 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d591c62805..1c77d02afc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -706,6 +706,7 @@ F:	package/perl-time-parsedate/
 F:	package/perl-x10/
 
 N:	Christopher Obbard <obbardc@gmail.com>
+F:	boot/efibootguard/
 F:	package/dtui/
 
 N:	Colin Foster <colin.foster@in-advantage.com>
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
diff --git a/boot/efibootguard/0001-Do-not-use-ld-fatal-warnings.patch b/boot/efibootguard/0001-Do-not-use-ld-fatal-warnings.patch
new file mode 100644
index 0000000000..2970826b20
--- /dev/null
+++ b/boot/efibootguard/0001-Do-not-use-ld-fatal-warnings.patch
@@ -0,0 +1,32 @@
+Date: Tue, 7 May 2024 09:36:45 +0200
+From: Bastian Germann <bage@debian.org>
+Subject: Do not use ld fatal-warnings
+
+fatal-warnings are almost guaranteed to break the build when using a more
+recent linker than the upstream developers. Get rid of them so the package
+can be built with some warnings and be maintained sanely in the long run.
+
+Upstream: N/A; not suitable for upstream, which intentionally relies on
+--fatal-warnings. Taken from Debian (Forwarded: not-needed):
+https://salsa.debian.org/debian/efibootguard/-/blob/master/debian/patches/Do-not-use-ld-fatal-warnings.patch
+
+Signed-off-by: Christopher Obbard <obbardc@gmail.com>
+---
+ Makefile.am | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index c7aed67..b27ea87 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -293,7 +293,6 @@ efi_ldflags = \
+ 	-z max-page-size=4096 \
+ 	--warn-common \
+ 	--no-undefined \
+-	--fatal-warnings \
+ 	$(LDFLAGS_NO_WARN_RWX_SEGMENTS) \
+ 	-L $(GNUEFI_LIB_DIR) \
+ 	$(GNUEFI_LIB_DIR)/crt0-efi-$(ARCH).o
+-- 
+2.43.0
+
diff --git a/boot/efibootguard/Config.in b/boot/efibootguard/Config.in
new file mode 100644
index 0000000000..746f0b7b70
--- /dev/null
+++ b/boot/efibootguard/Config.in
@@ -0,0 +1,30 @@
+config BR2_TARGET_EFIBOOTGUARD
+	bool "efibootguard"
+	depends on BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_GNU_EFI
+	select BR2_PACKAGE_PCIUTILS
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
+config BR2_TARGET_EFIBOOTGUARD_INSTALL_TOOLS
+	bool "install tools"
+	help
+	  Install the EFI Boot Guard user-space tools (e.g.
+	  bg_printenv and bg_setenv) on the target. These tools
+	  allow reading and updating EFI Boot Guard configuration
+	  in user-space.
+
+endif # BR2_TARGET_EFIBOOTGUARD
+
+comment "efibootguard needs a glibc toolchain w/ wchar"
+	depends on BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/boot/efibootguard/Config.in.host b/boot/efibootguard/Config.in.host
new file mode 100644
index 0000000000..c7af5c3120
--- /dev/null
+++ b/boot/efibootguard/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_TARGET_HOST_EFIBOOTGUARD
+	bool "host efibootguard"
+	help
+	  Build EFI Boot Guard companion tools for the host. These
+	  can be used during image creation to inspect and
+	  modify the EFI Boot Guard configuration data.
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
index 0000000000..f12c078632
--- /dev/null
+++ b/boot/efibootguard/efibootguard.mk
@@ -0,0 +1,67 @@
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
+EFIBOOTGUARD_CPE_ID_VENDOR = siemens
+
+EFIBOOTGUARD_DEPENDENCIES = \
+	gnu-efi \
+	pciutils \
+	host-autoconf-archive \
+	host-pkgconf
+
+EFIBOOTGUARD_AUTORECONF = YES
+
+EFIBOOTGUARD_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
+
+EFIBOOTGUARD_CONF_OPTS = \
+	--with-gnuefi-sys-dir=$(STAGING_DIR) \
+	--with-gnuefi-include-dir=$(STAGING_DIR)/usr/include/efi \
+	--with-gnuefi-lib-dir=$(STAGING_DIR)/usr/lib \
+	--disable-completion \
+	--disable-tests
+
+EFIBOOTGUARD_CONF_ENV = \
+	LDFLAGS="$(LDFLAGS) -no-pie"
+
+ifeq ($(BR2_TARGET_EFIBOOTGUARD_INSTALL_TOOLS),y)
+EFIBOOTGUARD_INSTALL_TARGET = YES
+
+# bg_gen_unified_kernel is mainly useful when assembling a UKI/image - do not
+# install it into the runtime target filesystem.
+define EFIBOOTGUARD_REMOVE_BG_GEN_UNIFIED_KERNEL
+	rm -rf $(TARGET_DIR)/usr/bin/bg_gen_unified_kernel
+endef
+EFIBOOTGUARD_POST_INSTALL_TARGET_HOOKS += EFIBOOTGUARD_REMOVE_BG_GEN_UNIFIED_KERNEL
+else
+EFIBOOTGUARD_INSTALL_TARGET = NO
+endif
+
+EFIBOOTGUARD_INSTALL_IMAGES = YES
+define EFIBOOTGUARD_INSTALL_IMAGES_CMDS
+	$(INSTALL) -m 0644 $(@D)/efibootguard*.efi $(BINARIES_DIR)
+	$(INSTALL) -m 0644 $(@D)/kernel-stub*.efi $(BINARIES_DIR)
+endef
+
+HOST_EFIBOOTGUARD_DEPENDENCIES = \
+	host-autoconf-archive \
+	host-pkgconf \
+	host-python3
+
+HOST_EFIBOOTGUARD_AUTORECONF = YES
+
+HOST_EFIBOOTGUARD_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
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
