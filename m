Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB4ACC433EF
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 20:48:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 745CE61AED
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 20:48:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 745CE61AED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40BB280B67;
	Wed, 17 Nov 2021 20:48:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bZhmwK8CnTxN; Wed, 17 Nov 2021 20:48:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FAB380B2D;
	Wed, 17 Nov 2021 20:48:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 72A6B1BF842
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 20:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7010E81B6D
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 20:47:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G5IC5BfM18yz for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 20:47:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6761781D72
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 20:47:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 71B8D8D4D1; Wed, 17 Nov 2021 20:43:35 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 21:33:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 748b7878e90ab5813a6f48e156410cf38ef087d9
X-Git-Newrev: 0258c013b1c37a8b9bab5fec92ea69ec4f06df6f
X-Patchwork-Hint: ignore
Message-Id: <20211117204335.71B8D8D4D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sg3_utils: fix uclibc-ng build
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

commit: https://git.buildroot.net/buildroot/commit/?id=0258c013b1c37a8b9bab5fec92ea69ec4f06df6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump to version 1.47 in
commit 710b0eaebeb25d7718bfb10e87f0d67adfaf8c2f:

/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: sg_dd.o: in function `sg_read_low.constprop.0':
sg_dd.c:(.text+0xc6c): undefined reference to `sg_chk_n_print3'

Fixes:
 - http://autobuild.buildroot.org/results/38a0dfc70a21ce574368b7a485deb231f778b3e7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0002-configure.ac-fix-uclibc-ng-build.patch    | 36 ++++++++++++++++++++++
 package/sg3_utils/sg3_utils.mk                     |  2 ++
 2 files changed, 38 insertions(+)

diff --git a/package/sg3_utils/0002-configure.ac-fix-uclibc-ng-build.patch b/package/sg3_utils/0002-configure.ac-fix-uclibc-ng-build.patch
new file mode 100644
index 0000000000..4c475ee1ff
--- /dev/null
+++ b/package/sg3_utils/0002-configure.ac-fix-uclibc-ng-build.patch
@@ -0,0 +1,36 @@
+From 1e95d5b8c507a49f6d15d2795dc46d82b4d1ded0 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 16 Nov 2021 08:41:48 +0100
+Subject: [PATCH] configure.ac: fix uclibc-ng build
+
+Fix the following build failure with uclibc-ng raised because SG_IO is
+not defined:
+
+/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: sg_dd.o: in function `sg_read_low.constprop.0':
+sg_dd.c:(.text+0xc6c): undefined reference to `sg_chk_n_print3'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/38a0dfc70a21ce574368b7a485deb231f778b3e7
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/doug-gilbert/sg3_utils/pull/8]
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0a65d94..23378ad 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -107,7 +107,7 @@ case "${host}" in
+ 		AC_DEFINE_UNQUOTED(HAVE_NVME, 1, [Found NVMe])
+ 		check_for_getrandom
+                 CFLAGS="$CFLAGS -D__USE_MINGW_ANSI_STDIO";;
+-        *-*-linux-gnu* | *-*-linux*)
++        *-*-linux-gnu* | *-*-linux* | *-*-uclinux-gnu* | *-*-uclinux*)
+                 AC_DEFINE_UNQUOTED(SG_LIB_LINUX, 1, [sg3_utils on linux])
+ 		check_for_linux_sg_v4_hdr
+ 		check_for_getrandom
+-- 
+2.33.0
+
diff --git a/package/sg3_utils/sg3_utils.mk b/package/sg3_utils/sg3_utils.mk
index 055f7befb9..e357fc1dde 100644
--- a/package/sg3_utils/sg3_utils.mk
+++ b/package/sg3_utils/sg3_utils.mk
@@ -13,6 +13,8 @@ ifeq ($(BR2_PACKAGE_SG3_UTILS_PROGS),y)
 SG3_UTILS_LICENSE += , GPL-2.0+ (programs), BSD-2-Clause (programs)
 endif
 SG3_UTILS_LICENSE_FILES = COPYING BSD_LICENSE
+# We're patching configure.ac
+SG3_UTILS_AUTORECONF = YES
 
 # install the libsgutils2 library
 SG3_UTILS_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
