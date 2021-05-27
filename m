Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9100C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:51:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DC5F601FD
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:51:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8DC5F601FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F78D608AE;
	Tue,  3 Aug 2021 22:51:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ID85t5ZJ1biK; Tue,  3 Aug 2021 22:51:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F6CC60864;
	Tue,  3 Aug 2021 22:51:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 039421BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:12:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BBBB940494
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iQ69EOYmXpRG for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF89A40500
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 21D6E85F62; Tue,  3 Aug 2021 21:09:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 27 May 2021 17:25:02 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 34a387b5f68d2cc259d4fe641c128232edb6da62
X-Git-Newrev: 8d7ac28707a30d883de0a60cd67ea246653da472
X-Patchwork-Hint: ignore
Message-Id: <20210803210946.21D6E85F62@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gdb: fix gdbserver
 build with m68k and uclibc
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=8d7ac28707a30d883de0a60cd67ea246653da472
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Allow to build gdbserver with m68k and uclibc. This patch is not needed
for version above 9.2 because build_gdbserver as been
moved to its own file since
https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=919adfe8409211c726c1d05b47ca59890ee648f1

This new file (gdbserver/configure.srv) does not seem to be affected by
this issue

Fixes:
 - http://autobuild.buildroot.org/results/f4d6d9d8418c0da48a3db4ad5a82e19bd16eae34

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...re.tgt-build-gdbserver-with-m68k-and-ucli.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/gdb/9.2/0007-gdb-configure.tgt-build-gdbserver-with-m68k-and-ucli.patch b/package/gdb/9.2/0007-gdb-configure.tgt-build-gdbserver-with-m68k-and-ucli.patch
new file mode 100644
index 0000000000..5cdafae7a8
--- /dev/null
+++ b/package/gdb/9.2/0007-gdb-configure.tgt-build-gdbserver-with-m68k-and-ucli.patch
@@ -0,0 +1,41 @@
+From 808601f075fe3dd8ca101e31c9121a4e87f0bfc7 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 6 May 2021 07:45:00 +0200
+Subject: [PATCH] gdb/configure.tgt: build gdbserver with m68k and
+ uclibc
+
+Allow to build gdbserver with m68k and uclibc:
+
+checking whether gdbserver is supported on this host... no
+configure: error: Automatic gdbserver build is not supported for this configuration
+
+Fixes:
+ - http://autobuild.buildroot.org/results/f4d6d9d8418c0da48a3db4ad5a82e19bd16eae34
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ gdb/configure.tgt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gdb/configure.tgt b/gdb/configure.tgt
+index caa42be1c01..8666bc5d0bf 100644
+--- a/gdb/configure.tgt
++++ b/gdb/configure.tgt
+@@ -372,12 +372,12 @@ m68hc11*-*-*|m6811*-*-*)
+ 	gdb_sim=../sim/m68hc11/libsim.a
+ 	;;
+ 
+-m68*-*-aout* | m68*-*-coff* | m68*-*-elf* | m68*-*-rtems* | m68*-*-uclinux* | \
++m68*-*-aout* | m68*-*-coff* | m68*-*-elf* | m68*-*-rtems* | \
+ fido-*-elf*)
+ 	# Target: Motorola m68k embedded
+ 	gdb_target_obs="m68k-tdep.o"
+ 	;;
+-m68*-*-linux*)
++m68*-*-*linux*)
+ 	# Target: Motorola m68k with a.out and ELF
+ 	gdb_target_obs="m68k-tdep.o m68k-linux-tdep.o solib-svr4.o \
+ 			linux-tdep.o glibc-tdep.o symfile-mem.o"
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
