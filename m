Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C8B5C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 20:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1174A418AD;
	Sat, 23 Dec 2023 20:30:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1174A418AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HLB0ofQNfW6K; Sat, 23 Dec 2023 20:30:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64F60418A9;
	Sat, 23 Dec 2023 20:30:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64F60418A9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C37E91BF47E
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 20:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C5D48217A
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 20:30:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C5D48217A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T9NBZEGJvq72 for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 20:30:46 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B2C981E5C
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 20:30:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B2C981E5C
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id CD55913F81D;
 Sat, 23 Dec 2023 21:30:40 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 23 Dec 2023 21:30:32 +0100
Message-ID: <20231223203032.1598109-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703363443;
 bh=oowR9g/9nQM+/hV4h7fMt4rSJ6ncCbI+hSDXviamEcM=;
 h=From:To:Cc:Subject:Date:From;
 b=Zg7e8AZ90+eEu6Yq+YNd7NU5jlk7FV6bEmnOOwWmvKO1LlIF64VY36NZ9j5EbeMfH
 ak+iBR6RPhbfp2mJVI0jUUmQHKLb3Ep3ey33vhnjG8Aj5SV4df8KixXqm02TOgD9Fz
 lxjJXPggD4JmblYCCssnZS4gaDaFUTldNfRW51c9AK0ZfnFnuxwX2qvab5UR+QPgnk
 RNrKrsniwPhQqjRjJTa6P0erMigrX9kJNLyzhVmdz25IAtGJn2PB4EJtrnnBmu8Qri
 6jXdoWpJUtYhvabu9BMKtclm9bjHOU3VfnrieZwWrkJQ01MHSgiKxJGWlIs7hwmV79
 HTJAbTmbRfrsA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Zg7e8AZ9
Subject: [Buildroot] [PATCH 1/1] boot/grub2: needs host-gawk
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
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
