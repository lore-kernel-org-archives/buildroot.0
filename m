Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1673C25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 20:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90CB04030D;
	Mon, 13 May 2024 20:38:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LsdDwUVWQig7; Mon, 13 May 2024 20:38:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3483E40324
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3483E40324;
	Mon, 13 May 2024 20:38:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0501A1BF2C0
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 20:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5E684012A
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 20:38:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lblxg0QT_GOl for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 20:38:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 213D0400B8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 213D0400B8
 for <buildroot@buildroot.org>; Mon, 13 May 2024 20:38:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1A0748715D; Mon, 13 May 2024 20:38:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 May 2024 22:37:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 69cb6259479c548a09aac1140261c17f1cbb86b3
X-Git-Newrev: 1c8bdef54213640e88b199466d1e504515c1a073
X-Patchwork-Hint: ignore
Message-Id: <20240513203849.1A0748715D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: refactor nios2 obsolete
 handling into common gcc code
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

commit: https://git.buildroot.net/buildroot/commit/?id=1c8bdef54213640e88b199466d1e504515c1a073
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 69cb6259479c548a09aac1140261c17f1cbb86b3 ("package/gcc: enable
obsolete nios2 target") added some handling of nios2 with gcc 14.x,
duplicated between gcc-initial and gcc-final. Let's deduplicate this
logic into the common package/gcc/gcc.mk code.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/gcc-final/gcc-final.mk     | 5 -----
 package/gcc/gcc-initial/gcc-initial.mk | 5 -----
 package/gcc/gcc.mk                     | 5 +++++
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 5feb96b568..99d7047b5f 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -117,11 +117,6 @@ else
 HOST_GCC_FINAL_CONF_OPTS += --disable-libgomp
 endif
 
-# allow to build gcc 14.x
-ifeq ($(BR2_nios2),y)
-HOST_GCC_FINAL_CONF_OPTS += --enable-obsolete
-endif
-
 # End with user-provided options, so that they can override previously
 # defined options.
 HOST_GCC_FINAL_CONF_OPTS += \
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index 8b4247bdad..1f8b76a942 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -42,11 +42,6 @@ HOST_GCC_INITIAL_CONF_OPTS = \
 	--disable-largefile \
 	$(call qstrip,$(BR2_EXTRA_GCC_CONFIG_OPTIONS))
 
-# allow to build gcc 14.x
-ifeq ($(BR2_nios2),y)
-HOST_GCC_INITIAL_CONF_OPTS += --enable-obsolete
-endif
-
 HOST_GCC_INITIAL_CONF_ENV = \
 	$(HOST_GCC_COMMON_CONF_ENV)
 
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 94935d79a2..672f9472a9 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -293,6 +293,11 @@ HOST_GCC_COMMON_CONF_OPTS += \
 	--with-long-double-128
 endif
 
+# allow to build gcc 14.x
+ifeq ($(BR2_nios2),y)
+HOST_GCC_COMMON_CONF_OPTS += --enable-obsolete
+endif
+
 HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_CROSS_PATH_SUFFIX='".br_real"'
 
 # For gcc-initial, we need to tell gcc that the C library will be
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
