Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E0D1C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 22:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C992B405D6;
	Sat,  8 Jan 2022 22:01:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 52WmikWL2zDH; Sat,  8 Jan 2022 22:01:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2873540878;
	Sat,  8 Jan 2022 22:01:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 32F511BF283
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D45160767
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:01:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FYYZcDdzyzBg for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 22:01:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3482C6077D
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 22:01:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 113EC83460; Sat,  8 Jan 2022 21:55:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 22:48:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 99adfe6750fbe7485a90473cccae0f37cbe14d83
X-Git-Newrev: 590d89fdad50f48c120b91ac008cc2ea4b625e15
X-Patchwork-Hint: ignore
Message-Id: <20220108215501.113EC83460@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/file: fix build with gcc-4.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=590d89fdad50f48c120b91ac008cc2ea4b625e15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

file-5.41 uses AC_PROG_CC, and was generated with autoconf 2.69. That
oldish version of autoconf does not check the C standard when AC_PROG_CC
is called, and standard-specific macros must be called instead:
AC_PROG_CC_C89, AC_PROG_CC_C99, or AC_PROG_CC_STDC.

So we would need to patch configure.ac to call either of those options,
and then we'd have to autoreocnf.

However, that would autoreconf with our autoconf, version 2.71. In that
version, AC_PROG_CC always check what C standards are available and sets
the appropriate ac_cv_XXX variables, and the previous macros,
AC_PROG_CC_C89, AC_PROG_CC_C99, and AC_PROG_CC_STDC are deprecated.

So it turns out that we just need to autoreconf.

Fixes:
  - http://autobuild.buildroot.org/results/9e7868be00f2cd18205b2ce664be95f8b9e2b063
  - http://autobuild.buildroot.org/results/31cbc313fceb84c0cbb1969fca5ac44244871dbc

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/file/file.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/file/file.mk b/package/file/file.mk
index b7e833e834..c06975460f 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -10,6 +10,8 @@ FILE_LICENSE = BSD-2-Clause, BSD-4-Clause (one file), BSD-3-Clause (one file)
 FILE_LICENSE_FILES = COPYING src/mygetopt.h src/vasprintf.c
 FILE_CPE_ID_VENDOR = file_project
 
+FILE_AUTORECONF = YES
+
 FILE_DEPENDENCIES = host-file
 FILE_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 FILE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
