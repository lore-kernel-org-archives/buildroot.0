Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFE0C46CD3
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 10:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3316441687;
	Sun, 24 Dec 2023 10:25:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3316441687
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ACqCtRU0qyjM; Sun, 24 Dec 2023 10:25:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F9824168E;
	Sun, 24 Dec 2023 10:25:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F9824168E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BA0A81BF5DC
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 10:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 996A660A7D
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 10:25:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 996A660A7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XlA1njTwwHFR for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 10:25:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DA6060A7B
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 10:25:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DA6060A7B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4881C82617; Sun, 24 Dec 2023 10:25:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 24 Dec 2023 11:25:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9212a719a5c3078048737d56596442e5ac7120a4
X-Git-Newrev: 875b898b984e9aabaeced6a485356fb9c4b8d5db
X-Patchwork-Hint: ignore
Message-Id: <20231224102548.4881C82617@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/grub2: needs host-gawk
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

commit: https://git.buildroot.net/buildroot/commit/?id=875b898b984e9aabaeced6a485356fb9c4b8d5db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

grub2 build is failing, when compiled on host system not including
gawk and host-gawk is not built by another package before. This can
be the the case on current Buildroot Docker image, based on Debian,
which includes mawk.

grub2 was updated in commit 5baf1ffe7e "boot/grub2: bump to version
2.12". This version includes the commit [1], which introduced the use
of the asorti() awk function. This function is a specific gawk
builtin extension. See [2].

This commit fixes this issue by adding host-gawk as a dependency.

Fixes:

    mawk: ../../grub-core/genmoddep.awk: line 110: function asorti never defined
    make[4]: *** [Makefile:49030: moddep.lst] Error 1
    make[4]: Leaving directory '/buildroot/output/build/grub2-2.12/build-i386-pc/grub-core'
    make[3]: *** [Makefile:28116: all] Error 2
    make[3]: Leaving directory '/buildroot/output/build/grub2-2.12/build-i386-pc/grub-core'
    make[2]: *** [Makefile:11714: all-recursive] Error 1
    make[2]: Leaving directory '/buildroot/output/build/grub2-2.12/build-i386-pc'
    make[1]: *** [Makefile:3547: all] Error 2
    make[1]: Leaving directory '/buildroot/output/build/grub2-2.12/build-i386-pc'
    make: *** [package/pkg-generic.mk:283: /buildroot/output/build/grub2-2.12/.stamp_built] Error 2

[1] https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commitdiff;h=87648e9c12a32bddb005b899edc44c2c9c63df82
[2] https://www.gnu.org/software/gawk/manual/gawk.html#Sorting-Array-Values-and-Indices-with-gawk

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/grub2/grub2.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index b9be826885..4430aebd59 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -9,8 +9,8 @@ GRUB2_SITE = http://ftp.gnu.org/gnu/grub
 GRUB2_SOURCE = grub-$(GRUB2_VERSION).tar.xz
 GRUB2_LICENSE = GPL-3.0+
 GRUB2_LICENSE_FILES = COPYING
-GRUB2_DEPENDENCIES = host-bison host-flex host-grub2
-HOST_GRUB2_DEPENDENCIES = host-bison host-flex
+GRUB2_DEPENDENCIES = host-bison host-flex host-gawk host-grub2
+HOST_GRUB2_DEPENDENCIES = host-bison host-flex host-gawk
 GRUB2_INSTALL_IMAGES = YES
 
 # CVE-2019-14865 is about a flaw in the grub2-set-bootflag tool, which
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
