Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1822C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 20:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3FDD40148;
	Thu, 30 Dec 2021 20:43:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PCh6zHPZx-Br; Thu, 30 Dec 2021 20:43:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D28BC403ED;
	Thu, 30 Dec 2021 20:43:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 937901BF361
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F9BC405C6
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:41:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sAqTUEJmpo7M for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 20:41:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51529402D0
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 20:41:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B683B82A05; Thu, 30 Dec 2021 20:35:53 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 21:30:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1b7017c62c7da42cb4123327ee93ce3ae1d92ec2
X-Git-Newrev: 1f6b283dd9f9431079efa3569d159e7122ba575c
X-Patchwork-Hint: ignore
Message-Id: <20211230203553.B683B82A05@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-*.mk: do not conditionally set
 empty variables
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1f6b283dd9f9431079efa3569d159e7122ba575c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
index c8351b3027..5626af1d87 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -540,8 +540,6 @@ $(2)_DIR	=  $$(BUILD_DIR)/$$($(2)_BASENAME)
 ifndef $(2)_SUBDIR
  ifdef $(3)_SUBDIR
   $(2)_SUBDIR = $$($(3)_SUBDIR)
- else
-  $(2)_SUBDIR ?=
  endif
 endif
 
@@ -838,31 +836,6 @@ $(2)_EXTRACT_CMDS ?= \
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
