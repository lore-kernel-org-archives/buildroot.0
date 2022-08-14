Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06BD8C25B0E
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 19:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE6F7402E4;
	Sun, 14 Aug 2022 19:25:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE6F7402E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rGyk9ThvjsE8; Sun, 14 Aug 2022 19:25:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7C61403F7;
	Sun, 14 Aug 2022 19:25:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7C61403F7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 645761BF976
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 19:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CFEA4088D
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 19:23:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CFEA4088D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lvBSEnifdrqD for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 19:23:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63462408CF
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 19:23:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63462408CF
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B82298756A; Sun, 14 Aug 2022 19:09:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 21:21:48 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: af02102de8fe152b6406ff810386b24ce18363eb
X-Git-Newrev: dba1771d4c19fc4b5cfc70f6c53d6d9ef2908859
X-Patchwork-Hint: ignore
Message-Id: <20220814190900.B82298756A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x]
 package/shadowsocks-libev: fix build in shared library mode
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

commit: https://git.buildroot.net/buildroot/commit/?id=dba1771d4c19fc4b5cfc70f6c53d6d9ef2908859
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

shadowsocks-libev builds a number of static libraries, which end up
being used in a shared library. Unfortunately, the code of those
static libraries is built without fPIC due to a bogus usage of
libtool.

This commit adds a patch that fixes how libtool is used, to make sure
its produce correct convenience libraries, than can in-turn be linked
into shared libraries.

Fixes:

  http://autobuild.buildroot.net/results/75ca164903b8d47fa67343a4c2df11ce3f91d2bd/
  and many similar other build failures

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 380d9ad503d552dac2817d3a487f681530030752)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ib-Makefile.am-remove-static-from-LDFLAGS.patch | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/package/shadowsocks-libev/0003-lib-Makefile.am-remove-static-from-LDFLAGS.patch b/package/shadowsocks-libev/0003-lib-Makefile.am-remove-static-from-LDFLAGS.patch
new file mode 100644
index 0000000000..aebdb2305b
--- /dev/null
+++ b/package/shadowsocks-libev/0003-lib-Makefile.am-remove-static-from-LDFLAGS.patch
@@ -0,0 +1,61 @@
+From e8ba4d6fd11ce795d9ed7b7a2c0ee0f6bf50f352 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sat, 23 Jul 2022 18:20:00 +0200
+Subject: [PATCH] lib*/Makefile.am: remove -static from LDFLAGS
+
+The libbloom, libcork and libipset libraries are "convenience
+libraries" in libtool speak, and their code ends up being used in a
+shared library, so building them with -static does not work as it
+causes the code to be built without fPIC.
+
+https://www.gnu.org/software/libtool/manual/html_node/Static-libraries.html
+explains:
+
+"""
+If you omit both -rpath and -static, libtool will create a convenience
+library that can be used to create other libtool libraries, even
+shared ones. Just like in the static case, the library behaves as an
+alias to a set of object files and dependency libraries, but in this
+case the object files are suitable for inclusion in shared libraries.
+"""
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ libbloom/Makefile.am | 2 --
+ libcork/Makefile.am  | 2 --
+ libipset/Makefile.am | 2 --
+ 3 files changed, 6 deletions(-)
+
+diff --git a/libbloom/Makefile.am b/libbloom/Makefile.am
+index 17c0761..6b2eddd 100644
+--- a/libbloom/Makefile.am
++++ b/libbloom/Makefile.am
+@@ -2,5 +2,3 @@ noinst_LTLIBRARIES = libbloom.la
+ 
+ libbloom_la_SOURCES = bloom.c murmur2/MurmurHash2.c
+ libbloom_la_CFLAGS = -I$(top_srcdir)/libbloom -I$(top_srcdir)/libbloom/murmur2
+-
+-libbloom_la_LDFLAGS = -static
+diff --git a/libcork/Makefile.am b/libcork/Makefile.am
+index 82ce062..e466a68 100644
+--- a/libcork/Makefile.am
++++ b/libcork/Makefile.am
+@@ -17,5 +17,3 @@ endif
+ 
+ libcork_la_SOURCES = $(cli_src) $(core_src) $(ds_src) $(pthreads_src) $(posix_src)
+ libcork_la_CFLAGS = -I$(top_srcdir)/libcork/include -DCORK_API=CORK_LOCAL
+-					 
+-libcork_la_LDFLAGS = -static
+diff --git a/libipset/Makefile.am b/libipset/Makefile.am
+index 3edfde6..bee8493 100644
+--- a/libipset/Makefile.am
++++ b/libipset/Makefile.am
+@@ -23,5 +23,3 @@ set_src = src/libipset/set/allocation.c \
+ 
+ libipset_la_SOURCES = src/libipset/general.c ${bdd_src} ${map_src} ${set_src}
+ libipset_la_CFLAGS = -I$(top_srcdir)/libipset/include -I$(top_srcdir)/libcork/include
+-
+-libipset_la_LDFLAGS = -static
+-- 
+2.37.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
