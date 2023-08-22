Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41199EE49A5
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 21:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C95174064A;
	Tue, 22 Aug 2023 21:40:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C95174064A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J6_Tx9W0qbRE; Tue, 22 Aug 2023 21:40:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22DEB4052A;
	Tue, 22 Aug 2023 21:40:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22DEB4052A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AC3611BF31A
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 21:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 934554052A
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 21:40:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 934554052A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8SF-tcjFgl41 for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 21:40:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7386E40003
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 21:40:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7386E40003
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5DB9B861AC; Tue, 22 Aug 2023 21:40:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Aug 2023 23:39:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 49a37916a8e1d60cfa763057927387d6f8d23998
X-Git-Newrev: 9c61470c4bc0c88dbaba49468ee8cc4c983d2604
X-Patchwork-Hint: ignore
Message-Id: <20230822214007.5DB9B861AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpg123: fix linking error due to
 undefined symbol
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

commit: https://git.buildroot.net/buildroot/commit/?id=9c61470c4bc0c88dbaba49468ee8cc4c983d2604
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This was introduced since commit
f8af24707b196eb64121d29a829fc31b5506409c, which bumped mpg123 from
1.25.15 to 1.31.3.

Patch was provided by upstream:
https://sourceforge.net/p/mpg123/bugs/353/

Fixes:

  http://autobuild.buildroot.net/results/74e1522cc9328c98186ca730eeb7ce0cb5fbbcb5

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mpg123/0001-mpg123-buildfix.patch | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/package/mpg123/0001-mpg123-buildfix.patch b/package/mpg123/0001-mpg123-buildfix.patch
new file mode 100644
index 0000000000..cc731ea967
--- /dev/null
+++ b/package/mpg123/0001-mpg123-buildfix.patch
@@ -0,0 +1,24 @@
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://sourceforge.net/p/mpg123/bugs/353/
+
+diff -Nur mpg123-1.31.3.orig/src/libmpg123/getcpuflags.h mpg123-1.31.3/src/libmpg123/getcpuflags.h
+--- mpg123-1.31.3.orig/src/libmpg123/getcpuflags.h	2023-03-15 09:02:58.000000000 +0100
++++ mpg123-1.31.3/src/libmpg123/getcpuflags.h	2023-08-07 15:57:19.444106173 +0200
+@@ -44,6 +44,8 @@
+ 
+ unsigned int getcpuflags(struct cpuflags* cf);
+ 
++#if ((defined OPT_X86) || (defined OPT_X86_64) || (defined OPT_NEON) || (defined OPT_NEON64)) && (defined OPT_MULTI)
++
+ #ifdef WANT_GETCPUFLAGS
+ #include <string.h>
+ // Wrapper needed for ignorant clang memory sanitizer that chokes
+@@ -55,8 +57,6 @@
+ }
+ #endif
+ 
+-#if ((defined OPT_X86) || (defined OPT_X86_64) || (defined OPT_NEON) || (defined OPT_NEON64)) && (defined OPT_MULTI)
+-
+ // We really evaluate the CPU flags.
+ #define OPT_CPU_FLAGS
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
