Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EDD4C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 19:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4713F40012;
	Tue, 26 Jul 2022 19:58:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4713F40012
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id csPyPp6ZC1FB; Tue, 26 Jul 2022 19:58:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63B734011F;
	Tue, 26 Jul 2022 19:58:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63B734011F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E17011BF27A
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 19:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9D4940012
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 19:57:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9D4940012
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 99GQplFm03g0 for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 19:57:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3128400D8
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 19:57:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3128400D8
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8908485FA0; Tue, 26 Jul 2022 19:43:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 21:56:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f0f99c9087a84ff8f9f621e4e7b7ab3332566e26
X-Git-Newrev: b07210b272c6e8810b038190cf5c1fd1f7b48397
X-Patchwork-Hint: ignore
Message-Id: <20220726194331.8908485FA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: remove BR2_GCC_ENABLE_LTO
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

commit: https://git.buildroot.net/buildroot/commit/?id=b07210b272c6e8810b038190cf5c1fd1f7b48397
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, this option doesn't do anything. It only adds
--enable-plugins --enable-lto to the configure flags, but doesn't
disable them if it is not set. Since both of these default to enabled,
plugins and lto are effectively always enabled.

There really is no need to make this configurable: it adds a bit of size
and build time to host-gcc, but we don't care about that for host tools.
It's still up to individual builds to enable the LTO options.

Therefore, remove the option entirely. For clarity, explicitly pass
--enable-plugins --enable-lto to configure.

No legacy handling is added for the removed option. Since the behaviour
hasn't actually changed (independently of whether the option was enabled
or not), there's no point bothering the user with a legacy option.

elf2flt was linking with libdl depending on this option. Since the
option doesn't do anything, this is probably not needed. Still, to avoid
breaking things, and because linking with libdl doesn't cost us anything
anyway, always link with libdl.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/elf2flt/elf2flt.mk | 6 +-----
 package/gcc/Config.in.host | 6 ------
 package/gcc/gcc.mk         | 6 ++----
 3 files changed, 3 insertions(+), 15 deletions(-)

diff --git a/package/elf2flt/elf2flt.mk b/package/elf2flt/elf2flt.mk
index 9230e3ce1a..6cd0786c3d 100644
--- a/package/elf2flt/elf2flt.mk
+++ b/package/elf2flt/elf2flt.mk
@@ -24,11 +24,7 @@ HOST_ELF2FLT_CONF_OPTS = \
 	--target=$(GNU_TARGET_NAME) \
 	--disable-werror
 
-HOST_ELF2FLT_LIBS = -lz
-
-ifeq ($(BR2_GCC_ENABLE_LTO),y)
-HOST_ELF2FLT_LIBS += -ldl
-endif
+HOST_ELF2FLT_LIBS = -lz -ldl
 
 HOST_ELF2FLT_CONF_ENV = LIBS="$(HOST_ELF2FLT_LIBS)"
 
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 20187db6fd..9833ae1336 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -130,12 +130,6 @@ config BR2_TOOLCHAIN_BUILDROOT_DLANG
 	  D language and you want D libraries to be installed on your
 	  target system.
 
-config BR2_GCC_ENABLE_LTO
-	bool "Enable compiler link-time-optimization support"
-	help
-	  This option enables link-time optimization (LTO) support in
-	  gcc.
-
 config BR2_GCC_ENABLE_OPENMP
 	bool "Enable compiler OpenMP support"
 	depends on !BR2_PTHREADS_NONE && !BR2_arc && !BR2_microblaze
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 114e774503..ec6f3b550a 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -75,6 +75,8 @@ HOST_GCC_COMMON_CONF_OPTS = \
 	--disable-libssp \
 	--disable-multilib \
 	--disable-decimal-float \
+	--enable-plugins \
+	--enable-lto \
 	--with-gmp=$(HOST_DIR) \
 	--with-mpc=$(HOST_DIR) \
 	--with-mpfr=$(HOST_DIR) \
@@ -165,10 +167,6 @@ else
 HOST_GCC_COMMON_CONF_OPTS += --enable-tls
 endif
 
-ifeq ($(BR2_GCC_ENABLE_LTO),y)
-HOST_GCC_COMMON_CONF_OPTS += --enable-plugins --enable-lto
-endif
-
 ifeq ($(BR2_PTHREADS_NONE),y)
 HOST_GCC_COMMON_CONF_OPTS += \
 	--disable-threads \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
