Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33105C433FE
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 15:41:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEA3B613A9
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 15:41:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AEA3B613A9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71478400C7;
	Wed, 17 Nov 2021 15:41:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 18ZyQ4wx8oYy; Wed, 17 Nov 2021 15:41:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57703401F4;
	Wed, 17 Nov 2021 15:41:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 164BA1BF36B
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 15:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10B17401F4
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 15:41:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6gchcss2TuFb for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 15:41:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 153F3400C7
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 15:41:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 961E68D4A2; Wed, 17 Nov 2021 15:37:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 16:37:27 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: e3bec374c9c3d08445eed7e680f22b0ba39e7156
X-Git-Newrev: bd2594cce7aa4f84b72003bbedacb804c0cee0f7
X-Patchwork-Hint: ignore
Message-Id: <20211117153703.961E68D4A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/binutils: zlib is
 mandatory
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

commit: https://git.buildroot.net/buildroot/commit/?id=bd2594cce7aa4f84b72003bbedacb804c0cee0f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

As found out by Yann [1], binutils will use its bundled copy of zlib,
whether it is already provided by the system or not, and unless
explicitly told to use the system zlib with --with-system-zlib, which
is available since version 2.21 and
https://github.com/bminor/binutils-gdb/commit/700d40ca16eb3ba1ecc1e602cb3eec175bdf70f0

This will fix the following build failure with oprofile when compiling
in a static configuration where zlib is not enabled:

    checking for bfd_openr in -lbfd... no
    checking for compress in -lz... no
    configure: error: libz library not found; required by libbfd

As found out by Arnout [1], this fails infrequently because static is
already pretty rare, but in addition zlib is almost always selected by
some other package.

Fixes:
 - http://autobuild.buildroot.org/results/0e1d16dfbb455a08db80ac5d35613908c3b4163f

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20211030214734.2154583-1-fontaine.fabrice@gmail.com/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr:
  - reword the explanations about the system zlib
  - extend the oprofile example with static and !zlib
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a3c1ba68f4bbad17df57a408097b7e862df43b6b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/Config.in   | 1 +
 package/binutils/binutils.mk | 7 ++-----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/binutils/Config.in b/package/binutils/Config.in
index e17a8ec65a..5e1a769998 100644
--- a/package/binutils/Config.in
+++ b/package/binutils/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_BINUTILS
 	bool "binutils"
 	depends on !BR2_nios2
 	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_ZLIB
 	help
 	  Install binutils on the target
 
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 8ec76134bc..3ec50912d7 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -31,7 +31,7 @@ BINUTILS_SITE ?= $(BR2_GNU_MIRROR)/binutils
 BINUTILS_SOURCE ?= binutils-$(BINUTILS_VERSION).tar.xz
 BINUTILS_EXTRA_CONFIG_OPTIONS = $(call qstrip,$(BR2_BINUTILS_EXTRA_CONFIG_OPTIONS))
 BINUTILS_INSTALL_STAGING = YES
-BINUTILS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
+BINUTILS_DEPENDENCIES = zlib $(TARGET_NLS_DEPENDENCIES)
 BINUTILS_MAKE_OPTS = LIBS=$(TARGET_NLS_LIBS)
 BINUTILS_LICENSE = GPL-3.0+, libiberty LGPL-2.1+
 BINUTILS_LICENSE_FILES = COPYING3 COPYING.LIB
@@ -57,6 +57,7 @@ BINUTILS_CONF_OPTS = \
 	--target=$(GNU_TARGET_NAME) \
 	--enable-install-libiberty \
 	--enable-build-warnings=no \
+	--with-system-zlib \
 	$(BINUTILS_DISABLE_GDB_CONF_OPTS) \
 	$(BINUTILS_EXTRA_CONFIG_OPTIONS)
 
@@ -80,10 +81,6 @@ ifeq ($(BR2_ARM_CPU_ARMV7M)$(BR2_OPTIMIZE_S),yy)
 BINUTILS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O2"
 endif
 
-ifeq ($(BR2_PACKAGE_ZLIB),y)
-BINUTILS_DEPENDENCIES += zlib
-endif
-
 # "host" binutils should actually be "cross"
 # We just keep the convention of "host utility" for now
 HOST_BINUTILS_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
