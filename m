Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31468C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 21:30:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DBE6340BA8;
	Thu, 10 Mar 2022 21:30:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id diDyKw3_o_8p; Thu, 10 Mar 2022 21:30:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3B344057A;
	Thu, 10 Mar 2022 21:30:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CD53A1BF2C1
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 21:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1B4861280
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 21:27:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id viTKZE_tvyxC for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 21:27:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97F8961281
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 21:27:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0C9D283C1A; Thu, 10 Mar 2022 21:18:44 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 10 Mar 2022 22:26:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4104e099fd10ca3fdd537ffa151146f86e6424f6
X-Git-Newrev: 2c6d0b52698a032f181e97c6218c52abe4cabc0e
X-Patchwork-Hint: ignore
Message-Id: <20220310211844.0C9D283C1A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-gd: bump to version 2.76
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

commit: https://git.buildroot.net/buildroot/commit/?id=2c6d0b52698a032f181e97c6218c52abe4cabc0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

remove upstreamed patch

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...le.PL-fix-cross-compilation-with-gdlib.pc.patch | 34 ----------------------
 package/perl-gd/perl-gd.hash                       |  4 +--
 package/perl-gd/perl-gd.mk                         |  2 +-
 3 files changed, 3 insertions(+), 37 deletions(-)

diff --git a/package/perl-gd/0001-Makefile.PL-fix-cross-compilation-with-gdlib.pc.patch b/package/perl-gd/0001-Makefile.PL-fix-cross-compilation-with-gdlib.pc.patch
deleted file mode 100644
index af053c5605..0000000000
--- a/package/perl-gd/0001-Makefile.PL-fix-cross-compilation-with-gdlib.pc.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 11dc017e902397c452331425eb6101b3315572fa Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 24 Jan 2021 10:59:31 +0100
-Subject: [PATCH] Makefile.PL: fix cross-compilation with gdlib.pc
-
-Cross-compilation will fail if gdlib.pc does not contain any cflags.
-Indeed, if cflags is empty, Makefile.PL will use the default value for
-INC (i.e. -I/usr/include -I/usr/include/gd)
-
-It should be noted that gdlib-config has been dropped from gd since
-version 2.3.0
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: probably not upstreamable]
----
- Makefile.PL | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.PL b/Makefile.PL
-index 25f2f93..7da3651 100644
---- a/Makefile.PL
-+++ b/Makefile.PL
-@@ -47,7 +47,7 @@ If you want to try to compile anyway, please rerun this script with the option -
- END
- }
- 
--@INC     = qw(-I/usr/include -I/usr/include/gd) unless @INC;
-+#@INC     = qw(-I/usr/include -I/usr/include/gd) unless @INC;
- @LIBPATH = qw(-L/usr/lib/X11 -L/usr/X11R6/lib -L/usr/X11/lib -L/usr/lib) unless @LIBPATH;
- @LIBS    = qw(-lgd) unless @LIBS;
- 
--- 
-2.29.2
-
diff --git a/package/perl-gd/perl-gd.hash b/package/perl-gd/perl-gd.hash
index 780b1d1e27..97f1da821a 100644
--- a/package/perl-gd/perl-gd.hash
+++ b/package/perl-gd/perl-gd.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  c2bf1ca56d15e33d2432e4d8ba5aeadf  GD-2.73.tar.gz
-sha256  491c9e73238522e2987e66725a20935f4268a3864202ecbaf4659a1691ba322b  GD-2.73.tar.gz
+md5  fb4bacab10ed4f28d52c2aabdaf866bb  GD-2.76.tar.gz
+sha256  693d9e3d709e9188a682cb9090a77b70aac12a04e84128677577b94e4331775b  GD-2.76.tar.gz
 
 # computed by scancpan
 sha256  1e2250289d6df4ba1c24f7550982d7ffaff2c97cd02e847659406e1afd28e83f  LICENSE
diff --git a/package/perl-gd/perl-gd.mk b/package/perl-gd/perl-gd.mk
index b402dfff49..9787cc12fe 100644
--- a/package/perl-gd/perl-gd.mk
+++ b/package/perl-gd/perl-gd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_GD_VERSION = 2.73
+PERL_GD_VERSION = 2.76
 PERL_GD_SOURCE = GD-$(PERL_GD_VERSION).tar.gz
 PERL_GD_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RURBAN
 PERL_GD_DEPENDENCIES = host-perl-extutils-pkgconfig zlib gd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
