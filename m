Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E84C19F29
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 07:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91637409AB;
	Wed, 27 Jul 2022 07:56:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91637409AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XnOQ1pdctzpI; Wed, 27 Jul 2022 07:56:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 545CF409A7;
	Wed, 27 Jul 2022 07:56:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 545CF409A7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DE0CA1BF3A0
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8ECF40412
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:56:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8ECF40412
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g3WCx4El84B9 for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 07:56:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7AEF403E9
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 07:56:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7AEF403E9
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 56DC48648A; Wed, 27 Jul 2022 07:42:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 09:56:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f7d60ee57d7d5155d4b3ac5f5ca12b7445faf95c
X-Git-Newrev: fda53f0791f5657d41735a40a29df3c8d0e8ae79
X-Patchwork-Hint: ignore
Message-Id: <20220727074256.56DC48648A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/Makefile.in: add detection for the
 lack of C library
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

commit: https://git.buildroot.net/buildroot/commit/?id=fda53f0791f5657d41735a40a29df3c8d0e8ae79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We recently had several cases of architecture configurations for which
no C library was available, leading to a build failure during the gcc
build. In order to more easily detect those bogus configurations,
let's bail out very early by detecting the lack of C library
selection.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998@free.fr:
  - move as final else clause in existing conditional block
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Makefile.in | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 508ea7c366..580e9d14ca 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -51,8 +51,12 @@ ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 LIBC = uclibc
 else ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
 LIBC = musl
-else
+else ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
 LIBC = gnu
+else
+# This happens if there is a bug in Buildroot that allows an
+# architecture configuration that isn't supported by any library.
+$(error No C library enabled, this is not possible.)
 endif
 
 # The ABI suffix is a bit special on ARM, as it needs to be
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
