Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63EC4C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FC546FBBE;
	Tue, 21 Feb 2023 01:39:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FC546FBBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jcLjkhr1Cn4h; Tue, 21 Feb 2023 01:39:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D4706FBBD;
	Tue, 21 Feb 2023 01:39:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D4706FBBD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6C0491BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:04:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 652F36FC2A
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 652F36FC2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1TYI6lsrefi9 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 874476FE5A
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 874476FE5A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 717F5828C8; Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 10:33:33 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 63da115085ca0cb369ab3c644200ba4b025da48b
X-Git-Newrev: 4cdd99190e89d538c25a8fc701372775fbde3b97
X-Patchwork-Hint: ignore
Message-Id: <20230220205251.717F5828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 support/dependencies/dependencies.sh: require open perl package for
 libxcrypt
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

commit: https://git.buildroot.net/buildroot/commit/?id=4cdd99190e89d538c25a8fc701372775fbde3b97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:
http://autobuild.buildroot.net/results/16c/16cba783be11cc5024f9c56bb0a7abb0acf13ef8/

The configure script of libxcrypt needs the open perl module on the host:

Can't locate open.pm in @INC (you may need to install the open module) (@INC
contains: /home/buildroot/autobuild/instance-2/output-1/host/lib/perl
/usr/local/lib64/perl5/5.36 /usr/local/share/perl5/5.36
/usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/lib64/perl5
/usr/share/perl5) at ./build-aux/scripts/expand-selected-hashes line 20.

So add a check for it in dependencies.sh similar to how it is done for mpv.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/dependencies.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index ea16a21e20..353817f8fb 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -271,6 +271,10 @@ required_perl_modules="$required_perl_modules ExtUtils::MakeMaker" # Used by hos
 required_perl_modules="$required_perl_modules Thread::Queue" # Used by host-automake
 required_perl_modules="$required_perl_modules FindBin" # Used by (host-)libopenssl
 
+if grep -q ^BR2_PACKAGE_LIBXCRYPT=y $BR2_CONFIG ; then
+    required_perl_modules="$required_perl_modules open"
+fi
+
 if grep -q ^BR2_PACKAGE_MPV=y $BR2_CONFIG ; then
     required_perl_modules="$required_perl_modules Math::BigInt"
     required_perl_modules="$required_perl_modules Math::BigRat"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
