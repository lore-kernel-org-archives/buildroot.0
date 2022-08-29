Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86148ECAAD4
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 11:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 278D7416F4;
	Mon, 29 Aug 2022 11:37:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 278D7416F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g7aYli1EzdUO; Mon, 29 Aug 2022 11:37:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11653416D0;
	Mon, 29 Aug 2022 11:37:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11653416D0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6B5D81BF9A4
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 11:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4637640C41
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 11:36:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4637640C41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dyX_DNBjvIiE for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 11:36:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76C7540C1D
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 11:36:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76C7540C1D
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 615D087F52; Mon, 29 Aug 2022 11:21:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 29 Aug 2022 13:11:28 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 8657bd624385519fc457a66b126f5c72a452fcc4
X-Git-Newrev: d7a54191fbde92a6edefcb0c6306ab72604ee68f
X-Patchwork-Hint: ignore
Message-Id: <20220829112111.615D087F52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x]
 support/dependencies/dependencies.sh: check for 'cmp'
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

commit: https://git.buildroot.net/buildroot/commit/?id=d7a54191fbde92a6edefcb0c6306ab72604ee68f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

cmp from diffutils is part of the host system requirements, so check
for it. It is used in package/pkg-generic.mk.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1ca7348fd445c6842ba2d8c20e4e76e49aa54fdb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
