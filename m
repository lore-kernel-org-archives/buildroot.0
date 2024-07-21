Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA13C3DA61
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 16:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC3A76075D;
	Sun, 21 Jul 2024 16:21:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tSIz2H1z9hwz; Sun, 21 Jul 2024 16:21:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFDB8607CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFDB8607CC;
	Sun, 21 Jul 2024 16:21:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7D0E31BF86C
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 654DA60638
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:21:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aa71OAuMkl-o for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 16:21:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D11F605F8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D11F605F8
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 16:21:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B42386F11; Sun, 21 Jul 2024 16:21:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 21 Jul 2024 18:21:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8637884057ddc3c1aeb9f0dd285fc6fcf378c26b
X-Git-Newrev: a8b788e19448bf06603f37666a54abec3f6af6e8
X-Patchwork-Hint: ignore
Message-Id: <20240721162141.6B42386F11@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gengetopt: fix patch fuzz
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

commit: https://git.buildroot.net/buildroot/commit/?id=a8b788e19448bf06603f37666a54abec3f6af6e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use upstream patch to fix patch fuzz and avoid the following build
failure raised since commit 8f88a644ed7d6c9ea55fd4fbe9d7f37055920016
which reduced the fuzz factor:

Applying 0001-configure.ac-add-disable-doc-option.patch using patch:
patching file Makefile.am
Hunk #1 FAILED at 18.
1 out of 1 hunk FAILED -- saving rejects to file Makefile.am.rej

Fixes:
 - http://autobuild.buildroot.org/results/4cfa513e024ea2cb2058fde4ffdd727bd379dae7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                         |  1 -
 .../0001-configure.ac-add-disable-doc-option.patch          | 13 +++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 975a7f21f4..6505cd6f76 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -604,7 +604,6 @@ package/gdb/15.1/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch lib_patch.U
 package/gdb/15.1/0007-fix-musl-build-on-riscv.patch lib_patch.Upstream
 package/gdb/15.1/0008-gdbserver-Makefile.in-fix-NLS-build.patch lib_patch.Upstream
 package/gdb/15.1/0009-gdb-Fix-native-build-on-xtensa.patch lib_patch.Upstream
-package/gengetopt/0001-configure.ac-add-disable-doc-option.patch lib_patch.Upstream
 package/genpart/0001-fix-return-code.patch lib_patch.Upstream
 package/genromfs/0001-build-system.patch lib_patch.Sob lib_patch.Upstream
 package/gensio/0001-Fix-missing-EVP_PKEY_ED25519-build-error-on-libressl.patch lib_patch.Upstream
diff --git a/package/gengetopt/0001-configure.ac-add-disable-doc-option.patch b/package/gengetopt/0001-configure.ac-add-disable-doc-option.patch
index d43714a3df..80bda9b721 100644
--- a/package/gengetopt/0001-configure.ac-add-disable-doc-option.patch
+++ b/package/gengetopt/0001-configure.ac-add-disable-doc-option.patch
@@ -1,22 +1,22 @@
-From 250bee9e02546846d70dbe88ac36bb83c6a7ebdf Mon Sep 17 00:00:00 2001
+From e3fe8db2b67cdb18e1a2a6765644c8cc476d0b0a Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Sun, 22 Sep 2019 09:27:24 +0200
-Subject: [PATCH] configure.ac: add --disable-doc option
+Subject: configure.ac: add --disable-doc option
 
 Add --disable-doc option to allow the user to disable documentation
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Sent upstream: https://savannah.gnu.org/bugs/index.php?56931]
+Upstream: https://git.savannah.gnu.org/cgit/gengetopt.git/commit/?id=e3fe8db2b67cdb18e1a2a6765644c8cc476d0b0a
 ---
  Makefile.am  | 6 +++++-
  configure.ac | 7 +++++++
  2 files changed, 12 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index dbb5719..2db307a 100644
+index 1f184c2..76ac21a 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -18,6 +18,10 @@
+@@ -18,7 +18,11 @@
  ACLOCAL_AMFLAGS = -I m4 -I gl/m4
  
  EXTRA_DIST = configure TODO LICENSE gl/m4/gnulib-cache.m4
@@ -28,6 +28,7 @@ index dbb5719..2db307a 100644
 +endif
  
  gengetoptdoc_DATA = ChangeLog COPYING NEWS THANKS INSTALL README LICENSE
+ 
 diff --git a/configure.ac b/configure.ac
 index 0ee89db..915706c 100644
 --- a/configure.ac
@@ -47,5 +48,5 @@ index 0ee89db..915706c 100644
  	[gengen],
  	[  --with-gengen=mygengen       gengen to use],
 -- 
-2.23.0
+cgit v1.1
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
