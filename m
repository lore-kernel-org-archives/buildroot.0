Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46AB2C3F6B0
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 22:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B74B3812F6;
	Tue, 26 Jul 2022 22:03:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B74B3812F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rm_aadBXmvmR; Tue, 26 Jul 2022 22:03:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5DFB812C2;
	Tue, 26 Jul 2022 22:03:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5DFB812C2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B25D1BF59F
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 22:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EAA054017C
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 22:03:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EAA054017C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sauokAD13BtJ for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 22:03:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3644B40167
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 22:03:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3644B40167
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8F634863AE; Tue, 26 Jul 2022 21:49:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 00:01:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f3d5916a9fde5d1bd451b7705a17c3553ac43de2
X-Git-Newrev: 1ca7348fd445c6842ba2d8c20e4e76e49aa54fdb
X-Patchwork-Hint: ignore
Message-Id: <20220726214921.8F634863AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/dependencies/dependencies.sh:
 check for 'cmp'
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

commit: https://git.buildroot.net/buildroot/commit/?id=1ca7348fd445c6842ba2d8c20e4e76e49aa54fdb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cmp from diffutils is part of the host system requirements, so check
for it. It is used in package/pkg-generic.mk.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/dependencies/dependencies.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index c604a9efcc..d69d97afaa 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -163,7 +163,7 @@ fi
 
 # Check that a few mandatory programs are installed
 missing_progs="no"
-for prog in perl tar wget cpio unzip rsync bc ${DL_TOOLS} ; do
+for prog in perl tar wget cpio unzip rsync bc cmp ${DL_TOOLS} ; do
 	if ! which $prog > /dev/null ; then
 		echo "You must install '$prog' on your build machine";
 		missing_progs="yes"
@@ -175,6 +175,8 @@ for prog in perl tar wget cpio unzip rsync bc ${DL_TOOLS} ; do
 			echo "  zcat is usually part of the gzip package in your distribution"
 		elif test $prog = "bzcat" ; then
 			echo "  bzcat is usually part of the bzip2 package in your distribution"
+		elif test $prog = "cmp" ; then
+			echo "  cmp is usually part of the diffutils package in your distribution"
 		fi
 	fi
 done
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
