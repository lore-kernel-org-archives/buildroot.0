Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17866C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 19:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91C19401A6;
	Tue, 26 Jul 2022 19:58:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91C19401A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q-PozpXhpPDK; Tue, 26 Jul 2022 19:58:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BA8C408C2;
	Tue, 26 Jul 2022 19:58:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BA8C408C2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EBC5C1BF9B5
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 19:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE93160681
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 19:57:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE93160681
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zp8qW3W2l7iH for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 19:57:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E918360644
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 19:57:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E918360644
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7F3C385F9F; Tue, 26 Jul 2022 19:43:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 21:56:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fecec75b6205c299b6f422bbf175bd5d43485e02
X-Git-Newrev: f0f99c9087a84ff8f9f621e4e7b7ab3332566e26
X-Patchwork-Hint: ignore
Message-Id: <20220726194331.7F3C385F9F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/binutils: remove
 BR2_BINUTILS_ENABLE_LTO
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f0f99c9087a84ff8f9f621e4e7b7ab3332566e26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, this option doesn't do anything. It only adds
--enable-plugins --enable-lto to the configure flags, but doesn't
disable them if it is not set. Since both of these default to enabled,
plugins and lto are effectively always enabled.

There really is no need to make this configurable: it adds a bit of size
and build time to host-binutils, but we don't care about that for host
tools. It's still up to individual builds to enable the LTO options.

Therefore, remove the option entirely. For clarity, explicitly pass
--enable-plugins --enable-lto to configure.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/binutils/Config.in.host | 3 ---
 package/binutils/binutils.mk    | 6 ++----
 package/gcc/Config.in.host      | 1 -
 3 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index ef1b2a94db..5bdda25faf 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -35,9 +35,6 @@ config BR2_BINUTILS_VERSION
 	default "2.37"		if BR2_BINUTILS_VERSION_2_37_X
 	default "2.38"		if BR2_BINUTILS_VERSION_2_38_X
 
-config BR2_BINUTILS_ENABLE_LTO
-	bool
-
 config BR2_BINUTILS_EXTRA_CONFIG_OPTIONS
 	string "Additional binutils options"
 	default ""
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index c94ebe0995..6362cb1641 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -86,6 +86,8 @@ HOST_BINUTILS_CONF_OPTS = \
 	--with-sysroot=$(STAGING_DIR) \
 	--enable-poison-system-directories \
 	--without-debuginfod \
+	--enable-plugins \
+	--enable-lto \
 	$(BINUTILS_DISABLE_GDB_CONF_OPTS) \
 	$(BINUTILS_EXTRA_CONFIG_OPTIONS)
 
@@ -120,10 +122,6 @@ HOST_BINUTILS_POST_EXTRACT_HOOKS += BINUTILS_XTENSA_OVERLAY_EXTRACT
 HOST_BINUTILS_EXTRA_DOWNLOADS += $(ARCH_XTENSA_OVERLAY_URL)
 endif
 
-ifeq ($(BR2_BINUTILS_ENABLE_LTO),y)
-HOST_BINUTILS_CONF_OPTS += --enable-plugins --enable-lto
-endif
-
 # Hardlinks between binaries in different directories cause a problem
 # with rpath fixup, so we de-hardlink those binaries, and replace them
 # with copies instead.
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index a7e237c3f7..20187db6fd 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -132,7 +132,6 @@ config BR2_TOOLCHAIN_BUILDROOT_DLANG
 
 config BR2_GCC_ENABLE_LTO
 	bool "Enable compiler link-time-optimization support"
-	select BR2_BINUTILS_ENABLE_LTO
 	help
 	  This option enables link-time optimization (LTO) support in
 	  gcc.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
