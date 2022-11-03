Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F84C6379F
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 20:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9628F41D32;
	Mon, 20 Feb 2023 20:56:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9628F41D32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dYxqPHiK11SE; Mon, 20 Feb 2023 20:56:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 631A941CD3;
	Mon, 20 Feb 2023 20:56:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 631A941CD3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1C03B1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B0446108A
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B0446108A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aeW3rqKTJdac for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 460EF61040
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 460EF61040
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 35A0A86491; Mon, 20 Feb 2023 20:51:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 23:10:33 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b9dd9ee857ec59e35552efe46a173eebc50659d2
X-Git-Newrev: aaba432e2cae6ccff2bc6fa30c3ec0cc3c0f3c71
X-Patchwork-Hint: ignore
Message-Id: <20230220205146.35A0A86491@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gawk: drop incorrect
 patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=aaba432e2cae6ccff2bc6fa30c3ec0cc3c0f3c71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit 8cd06967b9be (gawk: bump version and migrate to autotargets)
added a patch that purportedly reduced the installation size by not
installing the versioned program (gawk-X.Y).

However, the versioned program is a hard-link to the unversioned one,
so, save for a directory entry, it does not take extra space in the
final image.

Drop that patch.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gawk/0001-no-versioned.patch | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/package/gawk/0001-no-versioned.patch b/package/gawk/0001-no-versioned.patch
deleted file mode 100644
index c5bbdddeb5..0000000000
--- a/package/gawk/0001-no-versioned.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Disabled versioned installation of binaries to save space.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-[Gustavo: update for 4.1.2]
-
-diff -Nura gawk-4.1.2.orig/Makefile.in gawk-4.1.2/Makefile.in
---- gawk-4.1.2.orig/Makefile.in	2015-04-29 16:11:09.367925925 -0300
-+++ gawk-4.1.2/Makefile.in	2015-04-29 16:11:25.308466495 -0300
-@@ -1173,6 +1173,7 @@
- # (This is done universally, which may not always be right, but
- # there's no easy way to distinguish GNU from non-GNU systems.)
- install-exec-hook:
-+foo:
- 	(cd $(DESTDIR)$(bindir); \
- 	$(LN) gawk$(EXEEXT) gawk-$(VERSION)$(EXEEXT) 2>/dev/null ; \
- 	if [ ! -f awk$(EXEEXT) ]; \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
