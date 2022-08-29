Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA12ECAAD2
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 20:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59B3D408AD;
	Mon, 29 Aug 2022 20:52:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59B3D408AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NKCBVNiiRC4Y; Mon, 29 Aug 2022 20:52:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 387E740898;
	Mon, 29 Aug 2022 20:52:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 387E740898
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6611E1BF228
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 20:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F1D5408AD
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 20:51:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F1D5408AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oYgArEPZXx6U for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 20:51:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 623604088D
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 20:51:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 623604088D
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 780CC87FE4; Mon, 29 Aug 2022 20:36:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 29 Aug 2022 22:14:58 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: cf0491ebcdff57f64fd3e25da4528612bc7b7529
X-Git-Newrev: 131cb373bc28af8175df5bec8435afea1271b290
X-Patchwork-Hint: ignore
Message-Id: <20220829203619.780CC87FE4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/Makefile.in: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=131cb373bc28af8175df5bec8435afea1271b290
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
