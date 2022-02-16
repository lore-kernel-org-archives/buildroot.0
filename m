Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F4A0C433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 21:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52A1E60D94;
	Wed, 16 Feb 2022 21:49:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wLwDsTcB8nLV; Wed, 16 Feb 2022 21:49:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6A9060BEA;
	Wed, 16 Feb 2022 21:49:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 027E11BF5A9
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1C2A4091A
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:49:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DhlkhPu5Lzb1 for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 21:49:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 233CC404A6
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 21:49:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 611D783778; Wed, 16 Feb 2022 21:41:35 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 16 Feb 2022 22:38:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0319170f50c043e86a79d151b23008f6d639b06d
X-Git-Newrev: 63f40a109b8281283c66870f623382268130953a
X-Patchwork-Hint: ignore
Message-Id: <20220216214135.611D783778@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/safeclib: fix build with gcc 4.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=63f40a109b8281283c66870f623382268130953a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add -std=c99 to fix the following build failure with gcc 4.8 raised
since bump to version 3.7.1 in commit
cc27267ae41bf44276c63b1e86042c4fae4adf50:

In file included from abort_handler_s.c:35:0:
safeclib_private.h:167:18: error: anonymous variadic macros were introduced in C99 [-Werror=variadic-macros]
 #define slprintf(...) fprintf(stderr, __VA_ARGS__)
                  ^

Fixes:
 - http://autobuild.buildroot.org/results/5c3468585942879b47331e05058d25d324c8cc23

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/safeclib/safeclib.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/safeclib/safeclib.mk b/package/safeclib/safeclib.mk
index 91b3e26c68..bc58c1a38c 100644
--- a/package/safeclib/safeclib.mk
+++ b/package/safeclib/safeclib.mk
@@ -11,6 +11,7 @@ SAFECLIB_SOURCE = safeclib-$(SAFECLIB_VERSION).tar.xz
 SAFECLIB_LICENSE = MIT
 SAFECLIB_LICENSE_FILES = COPYING
 SAFECLIB_INSTALL_STAGING = YES
+SAFECLIB_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=c99"
 # -fstack-protector-strong is used by default. Disable that so the
 # BR2_SSP_* options in the toolchain wrapper are used instead
 SAFECLIB_CONF_OPTS = --disable-hardening
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
