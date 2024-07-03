Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7185DC2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 13:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC612414BF;
	Wed,  3 Jul 2024 13:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tURamrs6E3QR; Wed,  3 Jul 2024 13:57:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A423414C0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A423414C0;
	Wed,  3 Jul 2024 13:57:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7F0D11BF302
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 13:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CE9D6084E
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 13:57:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l39hsCxDWQkg for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 13:57:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 719046077D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 719046077D
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 13:57:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 592E083ACB; Wed,  3 Jul 2024 13:57:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Jul 2024 15:55:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3b3cb4e5a71aac0e1133a0f2d51984671ee958ae
X-Git-Newrev: b751a7b90f313188bd1b8d425a8a8082d60be712
X-Patchwork-Hint: ignore
Message-Id: <20240703135749.592E083ACB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/poke: fix patch fuzz
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b751a7b90f313188bd1b8d425a8a8082d60be712
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed "support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0" reduced the fuzz factor.

Due to this change, poke fails to build with output:

    Applying 0001-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch using patch:
    patching file configure.ac
    Hunk #1 FAILED at 90.
    1 out of 1 hunk FAILED -- saving rejects to file configure.ac.rej

This commit refreshes the package patches on the current package
version.

The patch 0002 was described as specific to Buildroot. This commit
adds the "Upstream:" tag and removes the corresponding
".checkpackageignore" entry.

Fixes:
http://autobuild.buildroot.org/results/ace4a0efffb66dcebf873a2baa33b5edfe670093

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .checkpackageignore                                         |  1 -
 ...nfigure.ac-HELP2MAN-replace-by-true-when-cross-com.patch | 12 +++++++-----
 .../0002-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch | 13 ++++++++-----
 3 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index ca94fb56b0..9a7a3af757 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1207,7 +1207,6 @@ package/pkgconf/0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch li
 package/pkgconf/0002-Revert-main-assume-modversion-insted-of-version-if-o.patch lib_patch.Upstream
 package/pkgconf/pkg-config.in Shellcheck
 package/poke/0001-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch lib_patch.Upstream
-package/poke/0002-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch lib_patch.Upstream
 package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch lib_patch.Upstream
 package/policycoreutils/0002-Add-PREFIX-to-host-paths.patch lib_patch.Upstream
 package/postgresql/S50postgresql lib_sysv.Variables
diff --git a/package/poke/0001-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch b/package/poke/0001-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch
index 85a76e068e..fb5604d80e 100644
--- a/package/poke/0001-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch
+++ b/package/poke/0001-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch
@@ -1,4 +1,4 @@
-From 51fb81264323f01a86dd0bdeaf1c7a044a9cb6dc Mon Sep 17 00:00:00 2001
+From a7e29f73dab5f9bd4fc7a2407f1ed2022c4ff109 Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Fri, 30 Apr 2021 15:43:59 +0200
 Subject: [PATCH] configure.ac: HELP2MAN replace ':' by 'true' when
@@ -12,15 +12,17 @@ Avoid:
 ../run: line 51: exec: :: not found
 
 Signed-off-by: Romain Naour <romain.naour@gmail.com>
+[Julien: refreshed the patch to be applied with fuzz factor 0]
+Signed-off-by: Julien Olivain <ju.o@free.fr>
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index a1943b57..c633f719 100644
+index 71b4d86..6487b57 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -90,7 +90,7 @@ gl_LIBTEXTSTYLE_OPTIONAL([0.20.5])
+@@ -88,7 +88,7 @@ gl_LIBTEXTSTYLE_OPTIONAL([0.20.5])
  if test $cross_compiling = no; then
    AM_MISSING_PROG(HELP2MAN, help2man)
  else
@@ -28,7 +30,7 @@ index a1943b57..c633f719 100644
 +  HELP2MAN=true
  fi
  
- dnl recfix is part of the GNU recutils suite, and is used in cfg.mk to
+ dnl The following Automake conditional is used in some Makefile.am files
 -- 
-2.31.1
+2.45.2
 
diff --git a/package/poke/0002-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch b/package/poke/0002-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch
index bd20b5d2c6..db1250810d 100644
--- a/package/poke/0002-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch
+++ b/package/poke/0002-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch
@@ -1,4 +1,4 @@
-From 236b019b83228d2e37fa07635fb6864ed7dc5fad Mon Sep 17 00:00:00 2001
+From 09758ebb191da659563b4c33334295ce21ecae71 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Thu, 1 Apr 2021 07:49:46 +0200
 Subject: [PATCH] lib/getrandom.c: fix build with uclibc < 1.0.35
@@ -25,6 +25,9 @@ Fixes:
  - http://autobuild.buildroot.org/results/30105094e39374ec6d4e47e2fb5e99696f7f7981
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: Not applicable (Buildroot specific)
+[Julien: refreshed the patch to be applied with fuzz factor 0]
+Signed-off-by: Julien Olivain <ju.o@free.fr>
 ---
  gl-libpoke/getrandom.c          | 1 +
  gl/getrandom.c                  | 1 +
@@ -32,7 +35,7 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
  3 files changed, 3 insertions(+)
 
 diff --git a/gl-libpoke/getrandom.c b/gl-libpoke/getrandom.c
-index e146873..3948d8d 100644
+index 19bb342..0251e0f 100644
 --- a/gl-libpoke/getrandom.c
 +++ b/gl-libpoke/getrandom.c
 @@ -19,6 +19,7 @@
@@ -44,7 +47,7 @@ index e146873..3948d8d 100644
  
  #include <errno.h>
 diff --git a/gl/getrandom.c b/gl/getrandom.c
-index e146873..3948d8d 100644
+index 19bb342..0251e0f 100644
 --- a/gl/getrandom.c
 +++ b/gl/getrandom.c
 @@ -19,6 +19,7 @@
@@ -56,7 +59,7 @@ index e146873..3948d8d 100644
  
  #include <errno.h>
 diff --git a/jitter/gnulib-local/getrandom.c b/jitter/gnulib-local/getrandom.c
-index e146873..3948d8d 100644
+index 19bb342..0251e0f 100644
 --- a/jitter/gnulib-local/getrandom.c
 +++ b/jitter/gnulib-local/getrandom.c
 @@ -19,6 +19,7 @@
@@ -68,5 +71,5 @@ index e146873..3948d8d 100644
  
  #include <errno.h>
 -- 
-2.31.1
+2.45.2
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
