Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C193C6FA83
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 08:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF90841C56;
	Sun, 11 Sep 2022 08:59:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF90841C56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ybv_3OxIImil; Sun, 11 Sep 2022 08:59:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D63E41B5C;
	Sun, 11 Sep 2022 08:59:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D63E41B5C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E3C311BF368
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3252A61091
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3252A61091
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jil9imk3f1SZ for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A074260812
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A074260812
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8AEC983621; Sun, 11 Sep 2022 08:48:24 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 17 Aug 2022 20:45:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 54e033785cfead216db256d2dc3389b2486806f4
X-Git-Newrev: 4057e36ca9665edd5248512e4edba2c243b8f4be
X-Patchwork-Hint: ignore
Message-Id: <20220911084824.8AEC983621@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/toolchain-buildroot: default to
 glibc as the C library
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

commit: https://git.buildroot.net/buildroot/commit/?id=4057e36ca9665edd5248512e4edba2c243b8f4be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is perhaps the most controversial change for Buildroot that can
be written in a two-liner.

Historically, we have used uClibc as our default C library, as
Buildroot was created initially as a test-bed for uClibc, and also
because uClibc made a lot of sense for embedded Linux systems, due to
its smaller size and fine-grained configurability.

Since then, the landscape of embedded Linux systems has changed. Even
though Buildroot happily supports really low-end devices, the vast
majority of Buildroot users are quite certainly running the resulting
system on a reasonably powerful platform, with significant amount of
RAM and storage. In this context, the benefits of uClibc are no longer
that much relevant, and glibc causes less "troubles". Therefore, this
patch proposes to use glibc as our default C library when using the
internal toolchain backend instead of uClibc.

Of course, we will keep the support for uClibc, which remains an
important C library choice, for space-constrained systems, or simply
for architectures that are not supported by glibc.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
Acked-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 toolchain/toolchain-buildroot/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 836af3b22a..9956dc4383 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -22,8 +22,7 @@ config BR2_TOOLCHAIN_BUILDROOT_VENDOR
 
 choice
 	prompt "C library"
-	default BR2_TOOLCHAIN_BUILDROOT_UCLIBC
-	default BR2_TOOLCHAIN_BUILDROOT_GLIBC if BR2_powerpc64
+	default BR2_TOOLCHAIN_BUILDROOT_GLIBC
 
 config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 	bool "uClibc-ng"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
