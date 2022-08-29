Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A6BECAAD2
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 20:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F9AA404BA;
	Mon, 29 Aug 2022 20:51:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F9AA404BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Q4e1sWq2biI; Mon, 29 Aug 2022 20:51:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 617C4404CA;
	Mon, 29 Aug 2022 20:51:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 617C4404CA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 110AC1BF9A4
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 20:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDDD58145F
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 20:51:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDDD58145F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rhrKVYgEYRus for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 20:51:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3349F81446
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 20:51:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3349F81446
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 48C9D87FD2; Mon, 29 Aug 2022 20:36:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 29 Aug 2022 22:14:40 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 4d8b9909a22370209aa31cf1f3e49cb52060af06
X-Git-Newrev: 370a7f2222c7dfd6db81b0bfcd62d1fa99296ed1
X-Patchwork-Hint: ignore
Message-Id: <20220829203609.48C9D87FD2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/Makefile.in: add
 detection for the lack of C library
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

commit: https://git.buildroot.net/buildroot/commit/?id=370a7f2222c7dfd6db81b0bfcd62d1fa99296ed1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit fda53f0791f5657d41735a40a29df3c8d0e8ae79)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
