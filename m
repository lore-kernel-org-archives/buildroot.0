Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B077C30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 19:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB10E81241;
	Tue,  2 Jul 2024 19:45:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kth3ETEh3gYU; Tue,  2 Jul 2024 19:45:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DBF583F53
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DBF583F53;
	Tue,  2 Jul 2024 19:45:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4FEDC1BF303
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 19:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49B6B405CC
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 19:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lPcsU3mO-rXl for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 19:44:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E87FC40A21
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E87FC40A21
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 19:44:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D627B83B27; Tue,  2 Jul 2024 19:44:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jul 2024 21:38:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 89ba9c5a0b05f119d8f748f52244ebcb6a0dd008
X-Git-Newrev: 1907ae86eabb942e30fa73c0f5127b2258ae610e
X-Patchwork-Hint: ignore
Message-Id: <20240702194447.D627B83B27@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xfsprogs: fix patch fuzz
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1907ae86eabb942e30fa73c0f5127b2258ae610e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed "support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0" reduced the fuzz factor.

Due to this change, xfsprogs fails to build with output:

    Applying 0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch using patch:
    patching file mdrestore/Makefile
    Hunk #1 FAILED at 10.
    1 out of 1 hunk FAILED -- saving rejects to file mdrestore/Makefile.rej
    patching file scrub/Makefile
    Hunk #1 FAILED at 70.
    1 out of 1 hunk FAILED -- saving rejects to file scrub/Makefile.rej

This commit refreshes the package patches on the current package
version. Note: the patch 0001 file name is changed because it was
regenerated with the "git format-patch" command.

The patch 0001 had an "Upstream:" tag in brackets. The tag was not
detected as such by check-package. This commit updates this tag. The
patch 0002 is also marked with an alternative upstream commit, so it
can be easily dropped at the next bump.

With those changes, the ".checkpackageignore" entries are no longer
needed, so this commit removes those.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .checkpackageignore                                 |  2 --
 ...crub-do-not-do-dynamic-linking-of-libtool.patch} | 20 +++++++++++---------
 ...libxfs-do-not-try-to-run-the-crc32selftest.patch | 21 ++++++++++++---------
 3 files changed, 23 insertions(+), 20 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 76b1c3c49b..b7725077d3 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1576,8 +1576,6 @@ package/xen/0004-libs-light-fix-tv_sec-fprintf-format.patch lib_patch.Upstream
 package/xenomai/3.0.10/0001-lib-boilerplate-iniparser-Allow-building-with-GCC-10-2-2020101.patch lib_patch.Upstream
 package/xenomai/3.0.10/0002-Add-disable-demo-testsuite-options.patch lib_patch.Upstream
 package/xenomai/3.0.10/0003-lib-cobalt-copperplate-Use-valid-addresses-for-pthread_setspecific.patch lib_patch.Upstream
-package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch lib_patch.Upstream
-package/xfsprogs/0002-libxfs-do-not-try-to-run-the-crc32selftest.patch lib_patch.Upstream
 package/xinetd/0001-ar.patch lib_patch.Upstream
 package/xinetd/0002-destdir.patch lib_patch.Upstream
 package/xinetd/0003-rpc-fix.patch lib_patch.Upstream
diff --git a/package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch b/package/xfsprogs/0001-mdrestore-scrub-do-not-do-dynamic-linking-of-libtool.patch
similarity index 74%
rename from package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch
rename to package/xfsprogs/0001-mdrestore-scrub-do-not-do-dynamic-linking-of-libtool.patch
index 9030a2aac3..cb30e68db4 100644
--- a/package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch
+++ b/package/xfsprogs/0001-mdrestore-scrub-do-not-do-dynamic-linking-of-libtool.patch
@@ -1,4 +1,4 @@
-From d5cbb4f43cc9c30100fbf18a3e0d1fb95e1c1b0a Mon Sep 17 00:00:00 2001
+From fa3a4e036c8c78325216ed21eff6145aeb186686 Mon Sep 17 00:00:00 2001
 From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 Date: Wed, 25 Nov 2015 10:50:00 +0000
 Subject: [PATCH] mdrestore, scrub: do not do dynamic linking of libtool
@@ -11,23 +11,25 @@ linking for libuuid only. Otherwise the build will fail like this:
 ld: attempted static link of dynamic object `/usr/lib/libuuid.so'
 
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-[Sent upstream: https://www.spinics.net/lists/xfs/msg36149.html]
+Upstream: Proposed: https://www.spinics.net/lists/xfs/msg36149.html
 [baruch: update for v4.15.1; extend to include scrub]
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 [matt: update for v4.16.1; adjusted libunistring -> libicu]
 Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
+[Julien: rebased on v6.4.0]
+Signed-off-by: Julien Olivain <ju.o@free.fr>
 ---
  mdrestore/Makefile | 2 +-
  scrub/Makefile     | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/mdrestore/Makefile b/mdrestore/Makefile
-index 136ae716d691..75ff1bad78e9 100644
+index 4a932efb..7ea1fd45 100644
 --- a/mdrestore/Makefile
 +++ b/mdrestore/Makefile
 @@ -10,7 +10,7 @@ CFILES = xfs_mdrestore.c
  
- LLDLIBS = $(LIBXFS) $(LIBFROG) $(LIBRT) $(LIBPTHREAD) $(LIBUUID)
+ LLDLIBS = $(LIBXFS) $(LIBFROG) $(LIBRT) $(LIBUUID) $(LIBURCU) $(LIBPTHREAD)
  LTDEPENDENCIES = $(LIBXFS) $(LIBFROG)
 -LLDFLAGS = -static
 +LLDFLAGS = -static-libtool-libs
@@ -35,12 +37,12 @@ index 136ae716d691..75ff1bad78e9 100644
  default: depend $(LTCOMMAND)
  
 diff --git a/scrub/Makefile b/scrub/Makefile
-index 063279400262..949f6fd8ba94 100644
+index aba14ed2..f0ef492f 100644
 --- a/scrub/Makefile
 +++ b/scrub/Makefile
-@@ -70,7 +70,7 @@ xfs_scrub.c
- 
- LLDLIBS += $(LIBHANDLE) $(LIBFROG) $(LIBPTHREAD) $(LIBICU_LIBS) $(LIBRT)
+@@ -71,7 +71,7 @@ xfs_scrub.c
+ LLDLIBS += $(LIBHANDLE) $(LIBFROG) $(LIBICU_LIBS) $(LIBRT) $(LIBURCU) \
+ 	$(LIBPTHREAD)
  LTDEPENDENCIES += $(LIBHANDLE) $(LIBFROG)
 -LLDFLAGS = -static
 +LLDFLAGS = -static-libtool-libs
@@ -48,5 +50,5 @@ index 063279400262..949f6fd8ba94 100644
  ifeq ($(HAVE_MALLINFO),yes)
  LCFLAGS += -DHAVE_MALLINFO
 -- 
-2.16.2
+2.45.2
 
diff --git a/package/xfsprogs/0002-libxfs-do-not-try-to-run-the-crc32selftest.patch b/package/xfsprogs/0002-libxfs-do-not-try-to-run-the-crc32selftest.patch
index 6778d069a1..77bdc19127 100644
--- a/package/xfsprogs/0002-libxfs-do-not-try-to-run-the-crc32selftest.patch
+++ b/package/xfsprogs/0002-libxfs-do-not-try-to-run-the-crc32selftest.patch
@@ -1,4 +1,4 @@
-From 3a77dfc54271059dcac305384bf6ace34fe1f3d3 Mon Sep 17 00:00:00 2001
+From 94ae5db7d017480e103aa6f07cc86648b613d114 Mon Sep 17 00:00:00 2001
 From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Date: Sun, 18 Dec 2016 15:37:27 +0100
 Subject: [PATCH] libxfs: do not try to run the crc32selftest
@@ -19,17 +19,20 @@ generator is natively built, but with the target CFLAGS.
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Signed-off-by: "Fabrice Fontaine" <fontaine.fabrice@gmail.com>
 [Update for 4.18.0: crc32 has been moved from libxfs to libfrog]
+[Julien: rebased on v6.4.0]
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+Upstream: patch to be superseded by https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/commit/?id=e51b89e657af7843d8c7aea3df49fe1f0f1d4ac2
 ---
- libxfs/Makefile | 4 ++--
+ libfrog/Makefile | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/libfrog/Makefile b/libxfs/Makefile
-index 62608bd..e021625 100644
+diff --git a/libfrog/Makefile b/libfrog/Makefile
+index f292afe3..1d0d2083 100644
 --- a/libfrog/Makefile
 +++ b/libfrog/Makefile
-@@ -112,9 +112,9 @@ LTLIBS = $(LIBPTHREAD) $(LIBRT)
- # don't try linking xfs_repair with a debug libxfs.
- DEBUG = -DNDEBUG
+@@ -57,9 +57,9 @@ ifeq ($(HAVE_GETMNTENT),yes)
+ LCFLAGS += -DHAVE_GETMNTENT
+ endif
  
 -LDIRT = gen_crc32table crc32table.h crc32selftest
 +LDIRT = gen_crc32table crc32table.h
@@ -37,8 +40,8 @@ index 62608bd..e021625 100644
 -default: crc32selftest ltdepend $(LTLIBRARY)
 +default: ltdepend $(LTLIBRARY)
  
- crc32table.h: gen_crc32table.c
+ crc32table.h: gen_crc32table.c crc32defs.h
  	@echo "    [CC]     gen_crc32table"
 -- 
-2.7.4
+2.45.2
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
