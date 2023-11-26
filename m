Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B6BC4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 21:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4268404D0;
	Sun, 26 Nov 2023 21:24:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4268404D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k9ZYcjZACbig; Sun, 26 Nov 2023 21:24:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28F6C404AF;
	Sun, 26 Nov 2023 21:24:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28F6C404AF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 701A51BF40A
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 21:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 497CF404AF
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 21:24:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 497CF404AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rWhzuDfnDikB for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 21:24:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7600E40492
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 21:24:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7600E40492
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5F8CF8741E; Sun, 26 Nov 2023 21:24:37 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 26 Nov 2023 22:18:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1185c0256bb43bd451e73249d53915db42409476
X-Git-Newrev: 71bdba661e51a7c43163717ecb89500ec36d6ecf
X-Patchwork-Hint: ignore
Message-Id: <20231126212437.5F8CF8741E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpam-tacplus: fix build without
 SSP
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

commit: https://git.buildroot.net/buildroot/commit/?id=71bdba661e51a7c43163717ecb89500ec36d6ecf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The following build failure without stack-protector occurs since commit
160f0e4b5f16 (package/libpam-tacplus: bump to version 1.7.0):

    cc1: warning: '-fstack-protector' not supported for this target
    In file included from libtac/lib/xstrncpy.c:36:
    libtac/lib/xstrncpy.c: In function 'xstrncpy':
    ./libtac/include/libtac.h:71:15: error: called object is not a function or function pointer
       71 | #define abort exit(EXIT_FAILURE)
          |               ^~~~

Since we are passing the appropriate SSP and fortify flags via our
toolchain wrapper, we need to tell the package not to add its own.
Upstream commit b1054ad8bb33 (Add '--disable-am-ldcflags' configure
option), available since version 1.4.1, has been added for "a
distribution to select its own C/LD flags" which is exactly our
situation.

So that's what we do: replace the ax cache variable by this new
configure flag.

Fixes:
 - http://autobuild.buildroot.org/results/cc8a7c5cca65e002d40a775f09e3c4577fbab5b7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libpam-tacplus/libpam-tacplus.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/libpam-tacplus/libpam-tacplus.mk b/package/libpam-tacplus/libpam-tacplus.mk
index 044b7207f9..df4d62a0b8 100644
--- a/package/libpam-tacplus/libpam-tacplus.mk
+++ b/package/libpam-tacplus/libpam-tacplus.mk
@@ -17,8 +17,6 @@ LIBPAM_TACPLUS_DEPENDENCIES = \
 # We're patching Makefile.am
 LIBPAM_TACPLUS_AUTORECONF = YES
 LIBPAM_TACPLUS_INSTALL_STAGING = YES
-LIBPAM_TACPLUS_CONF_ENV = \
-	ax_cv_check_cflags___fstack_protector_all=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
-LIBPAM_TACPLUS_CONF_OPTS = --disable-werror
+LIBPAM_TACPLUS_CONF_OPTS = --disable-am-ldcflags --disable-werror
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
