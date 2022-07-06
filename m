Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE36C43334
	for <buildroot@archiver.kernel.org>; Wed,  6 Jul 2022 21:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BE836112D;
	Wed,  6 Jul 2022 21:30:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BE836112D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gPuvlYpZYD_5; Wed,  6 Jul 2022 21:30:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0EC361120;
	Wed,  6 Jul 2022 21:30:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0EC361120
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 89FC81BF401
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 626B24028D
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:30:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 626B24028D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VD6QbxxrweAe for <buildroot@lists.busybox.net>;
 Wed,  6 Jul 2022 21:30:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21C32402AF
 for <buildroot@buildroot.org>; Wed,  6 Jul 2022 21:30:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21C32402AF
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4025E82D5B; Wed,  6 Jul 2022 21:17:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 6 Jul 2022 23:29:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 07f26d8aa9352de95eba57f215e13f70c8b517f4
X-Git-Newrev: affabe47a22769b717979f854a1028e567d35e36
X-Patchwork-Hint: ignore
Message-Id: <20220706211702.4025E82D5B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsndfile: fix libsndfile.pc
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

commit: https://git.buildroot.net/buildroot/commit/?id=affabe47a22769b717979f854a1028e567d35e36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with libsamplerate or minimodem raised
since bump to version 1.1.0 in commit
c59a9d12b7805f2ac08be81fe18a4ebc197d5cd9:

powerpc-buildroot-linux-uclibc-gcc.br_real: error: EXTERNAL_MPEG_LIBS@: No such file or directory

Add host-pkgconf dependency to avoid the following build failure when
running autoreconf:

configure.ac:345: error: macro PKG_INSTALLDIR is not defined; is a m4 file missing?
m4/ax_require_defined.m4:35: AX_REQUIRE_DEFINED is expanded from...

Fixes:
 - http://autobuild.buildroot.org/results/6de2d7634b1958693b7cf96fbcc79121f92347e9
 - http://autobuild.buildroot.org/results/bf66b19cacd6394957f534035af647ddd8037d60

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...bstitute-EXTERNAL_MPEG_LIBS-in-sndfile-pc.patch | 24 ++++++++++++++++++++++
 package/libsndfile/libsndfile.mk                   |  3 +++
 2 files changed, 27 insertions(+)

diff --git a/package/libsndfile/0001-configure-ac-substitute-EXTERNAL_MPEG_LIBS-in-sndfile-pc.patch b/package/libsndfile/0001-configure-ac-substitute-EXTERNAL_MPEG_LIBS-in-sndfile-pc.patch
new file mode 100644
index 0000000000..44ed6dc2cb
--- /dev/null
+++ b/package/libsndfile/0001-configure-ac-substitute-EXTERNAL_MPEG_LIBS-in-sndfile-pc.patch
@@ -0,0 +1,24 @@
+From e4fdaeefddd39bae1db27d48ccb7db7733e0c009 Mon Sep 17 00:00:00 2001
+From: Michael Cho <cho-m@tuta.io>
+Date: Sun, 17 Apr 2022 21:31:07 -0700
+Subject: [PATCH] configure.ac: substitute EXTERNAL_MPEG_LIBS in sndfile.pc
+
+[Retrieved from:
+https://github.com/libsndfile/libsndfile/commit/e4fdaeefddd39bae1db27d48ccb7db7733e0c009]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure.ac b/configure.ac
+index 727b67bc0..a4c776d70 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -739,6 +739,7 @@ AC_SUBST(SNDIO_LIBS)
+ AC_SUBST(EXTERNAL_XIPH_CFLAGS)
+ AC_SUBST(EXTERNAL_XIPH_LIBS)
+ AC_SUBST(EXTERNAL_XIPH_REQUIRE)
++AC_SUBST(EXTERNAL_MPEG_LIBS)
+ AC_SUBST(EXTERNAL_MPEG_REQUIRE)
+ AC_SUBST(MPG123_CFLAGS)
+ AC_SUBST(MPG123_LIBS)
diff --git a/package/libsndfile/libsndfile.mk b/package/libsndfile/libsndfile.mk
index 12a6601b6b..0b57a1fdd8 100644
--- a/package/libsndfile/libsndfile.mk
+++ b/package/libsndfile/libsndfile.mk
@@ -11,6 +11,9 @@ LIBSNDFILE_INSTALL_STAGING = YES
 LIBSNDFILE_LICENSE = LGPL-2.1+
 LIBSNDFILE_LICENSE_FILES = COPYING
 LIBSNDFILE_CPE_ID_VENDOR = libsndfile_project
+# We're patching configure.ac
+LIBSNDFILE_AUTORECONF = YES
+LIBSNDFILE_DEPENDENCIES = host-pkgconf
 
 LIBSNDFILE_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 LIBSNDFILE_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
