Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 341AEC3DA45
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 08:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56D9E60712;
	Mon, 15 Jul 2024 08:23:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C94tLMMA6hXc; Mon, 15 Jul 2024 08:23:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3239D605E8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3239D605E8;
	Mon, 15 Jul 2024 08:23:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2E1791BF421
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 08:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2762440448
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 08:23:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bRajLBv7Y8iY for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 08:23:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5F9B403D3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5F9B403D3
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 08:23:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BA42D869C4; Mon, 15 Jul 2024 08:23:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 10:22:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 455637e8010840ee76c6ad8ae36c189606919262
X-Git-Newrev: 9a66711be1786b90f94cbb1648fa470def3486f8
X-Patchwork-Hint: ignore
Message-Id: <20240715082300.BA42D869C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tar: fix linking with libiconv
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

commit: https://git.buildroot.net/buildroot/commit/?id=9a66711be1786b90f94cbb1648fa470def3486f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport two patches from upstream to fix linking with libiconv, e.g.
with this defconfig:

    BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
    BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
    BR2_SYSTEM_ENABLE_NLS=y
    BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
    BR2_PACKAGE_LIBICONV=y
    BR2_PACKAGE_TAR=y

It is interesting to note that the first patch we backport is the first
commit in the tar repository after the 1.35 tag, and was comitted the
same day the release was cut...

Fixes:

 https://gitlab.com/buildroot.org/buildroot/-/issues/4
 http://autobuild.buildroot.net/results/c074c2e22a7f764400ecc7dd1a6cd6022fa87fb9/

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tar/0002-Fix-savannah-bug-#64441.patch | 28 ++++++++++++++++++++++++
 package/tar/0003-tests-fix-LDADD.patch         | 30 ++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/package/tar/0002-Fix-savannah-bug-#64441.patch b/package/tar/0002-Fix-savannah-bug-#64441.patch
new file mode 100644
index 0000000000..049e08c27b
--- /dev/null
+++ b/package/tar/0002-Fix-savannah-bug-#64441.patch
@@ -0,0 +1,28 @@
+From 8632df398b2f548465ebe68b8f494c0d6f8d913d Mon Sep 17 00:00:00 2001
+From: Sergey Poznyakoff <gray@gnu.org>
+Date: Tue, 18 Jul 2023 17:02:23 +0300
+Subject: Fix savannah bug #64441
+
+* src/Makefile.am (tar_LDADD): Add libiconv libraries.
+
+[yann.morin.1998@free.fr: backport from upstream]
+Upstream: https://git.savannah.gnu.org/cgit/tar.git/commit/?id=8632df398b2f548465ebe68b8f494c0d6f8d913d
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ src/Makefile.am | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 36c9543..e2ec58d 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -52,4 +52,5 @@ AM_CFLAGS = $(WARN_CFLAGS) $(WERROR_CFLAGS)
+ tar_LDADD = $(LIBS) ../lib/libtar.a ../gnu/libgnu.a\
+  $(LIB_ACL) $(LIB_CLOCK_GETTIME) $(LIB_EACCESS)\
+  $(LIB_GETRANDOM) $(LIB_HARD_LOCALE) $(FILE_HAS_ACL_LIB) $(LIB_MBRTOWC)\
+- $(LIB_SELINUX) $(LIB_SETLOCALE_NULL)
++ $(LIB_SELINUX) $(LIB_SETLOCALE_NULL) \
++ $(LIBINTL) $(LIBICONV)
+-- 
+cgit v1.1
+
diff --git a/package/tar/0003-tests-fix-LDADD.patch b/package/tar/0003-tests-fix-LDADD.patch
new file mode 100644
index 0000000000..c00f14d2c1
--- /dev/null
+++ b/package/tar/0003-tests-fix-LDADD.patch
@@ -0,0 +1,30 @@
+From 71530f72d21d9af00b5688948111666f62f5ec4b Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Wed, 19 Jul 2023 15:48:25 -0700
+Subject: tests: fix LDADD
+
+Problem reported by Christian Weisgerber <naddy@mips.inka.de> in:
+https://lists.gnu.org/r/bug-tar/2023-07/msg00015.html
+* tests/Makefile.am (LDADD): Add $(LIBINTL), $(LIBICONV).
+
+[yann.morin.1998@free.fr: backport from upstream]
+Upstream: https://git.savannah.gnu.org/cgit/tar.git/commit/?id=71530f72d21d9af00b5688948111666f62f5ec4b
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ tests/Makefile.am | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 1884b72..b696f01 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -337,4 +337,5 @@ AM_CPPFLAGS = \
+ LDADD = ../gnu/libgnu.a\
+  $(LIB_ACL) $(LIB_CLOCK_GETTIME) $(LIB_EACCESS)\
+  $(LIB_GETRANDOM) $(LIB_HARD_LOCALE) $(FILE_HAS_ACL_LIB) $(LIB_MBRTOWC)\
+- $(LIB_SELINUX) $(LIB_SETLOCALE_NULL)
++ $(LIB_SELINUX) $(LIB_SETLOCALE_NULL) \
++ $(LIBINTL) $(LIBICONV)
+-- 
+cgit v1.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
