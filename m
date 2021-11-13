Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88AFEC433EF
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 13:29:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F32761029
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 13:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0F32761029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC790605AD;
	Sat, 13 Nov 2021 13:29:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hRNhi2Ji8HdP; Sat, 13 Nov 2021 13:29:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1AAD60651;
	Sat, 13 Nov 2021 13:29:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0FC1C1BF2FD
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 13:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C678C60594
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 13:28:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K15qQ8vOX8ZA for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 13:28:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F786605C1
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 13:28:32 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id d5so20675971wrc.1
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 05:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8ypiLsTTL/57xduJ3BIEhMK0Tc2ccqNt+IY0XkA3Bf8=;
 b=BFzeI8HSncBw72UVm8vOqfqm0mxBhi0XUwiBsLr2EygR+waxNOdhbYpAUmwJ5IwqO+
 8XHP/r9l90vGv1JA7O+JBEymodkWPoBr+misxGSjrJubyuch9xJy+u6MRQZJ8voFfw5C
 giSCUTtBdHHDkoWjaNwwhGrCZ+OPf3PI2y4Hrgm8WbzuUUFddM0AGmCQR8ANyYc1RmHH
 NOp3Nf0lhr4e1Gvec5PfIb3xtJF2nD9mcA4mhaEAsEwA2cDi1lrau38j8TL1HDPvkVWC
 bDadH3DOvZSdDauMhgUtvp4nqJVDiO+k8dKWMMnTyGC+eXrwcB1zLNwUdWKBGeLGeLHf
 j2Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8ypiLsTTL/57xduJ3BIEhMK0Tc2ccqNt+IY0XkA3Bf8=;
 b=TbLdVSrpgcU2fP+ugclD2QIgenUhxWMdqUV8AW+522NJQxurOT/6G4bae37KvJUZvz
 /1AEXLTj+vRvFewrmHMQynU7fAwJKZTg0+1PSVMfCzOElec0pfnB1olrkHGh7MpeZAGJ
 +xeuHmM6gPep1AFnJ8LHjzAyYeIoq709AN+O9mm3ydvD3aJCCDWuq4dWhKxDNKOsYVPI
 ohYh/0369vJBw5PvUQ1cWzWeEU/LmIwpkBHgIMMiR7kThjkP7A2Bm6c9idq8tIF4eLvt
 RBz3q1gzMj1hHGOh1HJ5dEKKsIhA1XdoSK3VW1BpMKMsvIJKtLJ1uZax0sh7sGS6Vr33
 TGNw==
X-Gm-Message-State: AOAM5314VjLcZQDFoaTwaQhI/rojmFS0gUzwYNPTb7dLQs5tnjVyGzxB
 l/xrErd/VDrkN2k5MUbAaFxm+DtNvDkCSw==
X-Google-Smtp-Source: ABdhPJzwO+HO344NDyIVtFHghnw2J4PyR/RI4zB+Rbd22wOA3we3tJxdWAtXLGmW9zHOYn9V3wtrJg==
X-Received: by 2002:adf:dcd0:: with SMTP id x16mr28362897wrm.229.1636810110777; 
 Sat, 13 Nov 2021 05:28:30 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:68ab:b59:72c3:89f3])
 by smtp.gmail.com with ESMTPSA id p14sm5606890wms.29.2021.11.13.05.28.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Nov 2021 05:28:30 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 14:28:15 +0100
Message-Id: <659c748d4a2913f6bc9ea8cb5e2693fac0bf0542.1636810092.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1636810092.git.yann.morin.1998@free.fr>
References: <cover.1636810092.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 04/16 v2] package/infras: do not conditionally
 set empty variables
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Setting an unset variable to an empty value is useless in make; an unset
variable just expands to an empty string anyway. So what we do currently
has no side effect:

    variable set and not empty   -> variable not modified
    variable set and empty       -> variable not modified
    variable unset               -> set to an empty string

However, additional variables do have an impact on the parsing time of
the Makefiles, and the more variables, the more collisions in the hash
table used internally by make, which slows down the parsing.

By dropping those conditionally-set-empty variables, we gain about 3%:

    Run     Before  After
    1       5.572   5.325
    2       5.434   5.354
    3       5.490   5.320
    4       5.525   5.330
    5       5.476   5.330
    6       5.511   5.434
    7       5.498   5.388
    8       5.524   5.371
    9       5.479   5.346
    10      5.637   5.324
    Mean:   5.515   5.352

Yeah, 0.163s does not look like much, and this does not make
autocompletion any more usable. Still, that 3% gain is not to be
ashamed of either.

Note that there are 3 others case where we do set empty variables, but
those are unconditional and serve other purposes:

  - pkg-virtual: this is done on purpose to avoid a bug when the
    environment may have TOOLCHAIN_VERSION or _SOURCE set, and we really
    want those to be empty, so the assignment is not conditional;

  - pkg-python: the reason for setting those to empty is dubious at
    best; it's been there since the inception of the python infra, back
    in 2013; still, the case is different than this patch addresses;

  - pkg-toolchain-external: this is the case for a toolchain already
    installed, so indeed we want to set _SOURCE and _VERSION to empty.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-autotools.mk |  4 ----
 package/pkg-cmake.mk     |  4 ----
 package/pkg-generic.mk   | 27 ---------------------------
 package/pkg-kconfig.mk   |  3 ---
 package/pkg-meson.mk     |  4 ----
 package/pkg-python.mk    |  4 ----
 package/pkg-qmake.mk     |  4 ----
 package/pkg-waf.mk       |  5 -----
 8 files changed, 55 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index daa688dab6..717ff81593 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -160,10 +160,6 @@ ifeq ($(4),host)
  $(2)_AUTORECONF_OPTS ?= $$($(3)_AUTORECONF_OPTS)
 endif
 
-$(2)_CONF_ENV			?=
-$(2)_CONF_OPTS			?=
-$(2)_MAKE_ENV			?=
-$(2)_MAKE_OPTS			?=
 $(2)_INSTALL_OPTS                ?= install
 $(2)_INSTALL_STAGING_OPTS	?= DESTDIR=$$(STAGING_DIR) install
 $(2)_INSTALL_TARGET_OPTS		?= DESTDIR=$$(TARGET_DIR) install
diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 4ee100a0c6..3b1db35fb6 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -51,11 +51,7 @@ endif
 
 define inner-cmake-package
 
-$(2)_CONF_ENV			?=
-$(2)_CONF_OPTS			?=
 $(2)_MAKE			?= $$(MAKE)
-$(2)_MAKE_ENV			?=
-$(2)_MAKE_OPTS			?=
 $(2)_INSTALL_OPTS		?= install
 $(2)_INSTALL_STAGING_OPTS	?= DESTDIR=$$(STAGING_DIR) install/fast
 $(2)_INSTALL_TARGET_OPTS	?= DESTDIR=$$(TARGET_DIR) install/fast
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index ded5176428..ab48240283 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -538,8 +538,6 @@ $(2)_DIR	=  $$(BUILD_DIR)/$$($(2)_BASENAME)
 ifndef $(2)_SUBDIR
  ifdef $(3)_SUBDIR
   $(2)_SUBDIR = $$($(3)_SUBDIR)
- else
-  $(2)_SUBDIR ?=
  endif
 endif
 
@@ -836,31 +834,6 @@ $(2)_EXTRACT_CMDS ?= \
 		$$(TAR_OPTIONS) -)
 
 # pre/post-steps hooks
-$(2)_PRE_DOWNLOAD_HOOKS         ?=
-$(2)_POST_DOWNLOAD_HOOKS        ?=
-$(2)_PRE_EXTRACT_HOOKS          ?=
-$(2)_POST_EXTRACT_HOOKS         ?=
-$(2)_PRE_RSYNC_HOOKS            ?=
-$(2)_POST_RSYNC_HOOKS           ?=
-$(2)_PRE_PATCH_HOOKS            ?=
-$(2)_POST_PATCH_HOOKS           ?=
-$(2)_PRE_CONFIGURE_HOOKS        ?=
-$(2)_POST_CONFIGURE_HOOKS       ?=
-$(2)_PRE_BUILD_HOOKS            ?=
-$(2)_POST_BUILD_HOOKS           ?=
-$(2)_PRE_INSTALL_HOOKS          ?=
-$(2)_POST_INSTALL_HOOKS         ?=
-$(2)_PRE_INSTALL_STAGING_HOOKS  ?=
-$(2)_POST_INSTALL_STAGING_HOOKS ?=
-$(2)_PRE_INSTALL_TARGET_HOOKS   ?=
-$(2)_POST_INSTALL_TARGET_HOOKS  ?=
-$(2)_PRE_INSTALL_IMAGES_HOOKS   ?=
-$(2)_POST_INSTALL_IMAGES_HOOKS  ?=
-$(2)_PRE_LEGAL_INFO_HOOKS       ?=
-$(2)_POST_LEGAL_INFO_HOOKS      ?=
-$(2)_TARGET_FINALIZE_HOOKS      ?=
-$(2)_ROOTFS_PRE_CMD_HOOKS       ?=
-
 $(2)_POST_PREPARE_HOOKS += FIXUP_PYTHON_SYSCONFIGDATA
 
 ifeq ($$($(2)_TYPE),target)
diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 23a291fccf..32dcfea0bc 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -81,9 +81,6 @@ define inner-kconfig-package
 # Default values
 $(2)_MAKE ?= $$(MAKE)
 $(2)_KCONFIG_EDITORS ?= menuconfig
-$(2)_KCONFIG_OPTS ?=
-$(2)_KCONFIG_FIXUP_CMDS ?=
-$(2)_KCONFIG_FRAGMENT_FILES ?=
 $(2)_KCONFIG_DOTCONFIG ?= .config
 $(2)_KCONFIG_SUPPORTS_DEFCONFIG ?= YES
 
diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 16a90d157b..ec535174b6 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -45,10 +45,6 @@ NINJA_OPTS	= $(if $(VERBOSE),-v) -j$(PARALLEL_JOBS)
 
 define inner-meson-package
 
-$(2)_CONF_ENV		?=
-$(2)_CONF_OPTS		?=
-$(2)_NINJA_ENV		?=
-
 #
 # Configure step. Only define it if not already defined by the package
 # .mk file. And take care of the differences between host and target
diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index e6b81bdfd3..ce0fc97283 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -108,10 +108,6 @@ HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
 
 define inner-python-package
 
-$(2)_ENV         ?=
-$(2)_BUILD_OPTS   ?=
-$(2)_INSTALL_OPTS ?=
-
 ifndef $(2)_SETUP_TYPE
  ifdef $(3)_SETUP_TYPE
   $(2)_SETUP_TYPE = $$($(3)_SETUP_TYPE)
diff --git a/package/pkg-qmake.mk b/package/pkg-qmake.mk
index deb033c1d6..4dcaf6dd62 100644
--- a/package/pkg-qmake.mk
+++ b/package/pkg-qmake.mk
@@ -40,10 +40,6 @@ endef
 
 define inner-qmake-package
 
-$(2)_CONF_ENV			?=
-$(2)_CONF_OPTS			?=
-$(2)_MAKE_ENV			?=
-$(2)_MAKE_OPTS			?=
 $(2)_INSTALL_STAGING_OPTS	?= install
 $(2)_INSTALL_TARGET_OPTS	?= $$($(2)_INSTALL_STAGING_OPTS)
 
diff --git a/package/pkg-waf.mk b/package/pkg-waf.mk
index 038d89454e..a593476a69 100644
--- a/package/pkg-waf.mk
+++ b/package/pkg-waf.mk
@@ -49,11 +49,6 @@ else
 $(2)_WAF ?= ./waf
 endif
 
-$(2)_BUILD_OPTS				?=
-$(2)_INSTALL_STAGING_OPTS		?=
-$(2)_INSTALL_TARGET_OPTS		?=
-$(2)_WAF_OPTS				?=
-
 #
 # Configure step. Only define it if not already defined by the package
 # .mk file.
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
