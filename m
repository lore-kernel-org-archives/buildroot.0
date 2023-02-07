Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F9CC636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A850F6FB0C;
	Tue, 21 Feb 2023 01:39:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A850F6FB0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H2vHstdC2So6; Tue, 21 Feb 2023 01:39:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF2BC6FB9D;
	Tue, 21 Feb 2023 01:39:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF2BC6FB9D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E3F91BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4CF476FC1B
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CF476FC1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4zsTnD9rrIT6 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D6A96FC2E
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D6A96FC2E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 48C5781979; Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 09:39:29 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 82f84b4cfbe7d7631b34b67f10e9709772dd1165
X-Git-Newrev: 8f8085e63a4a755d587a25a73dbaafe33b23f867
X-Patchwork-Hint: ignore
Message-Id: <20230220205251.48C5781979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 support/dependencies/dependencies.sh: require English perl package for
 host-libxml-parser-perl
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

commit: https://git.buildroot.net/buildroot/commit/?id=8f8085e63a4a755d587a25a73dbaafe33b23f867
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes http://autobuild.buildroot.net/results/166/1667b4ebd8e16e7d8b47bc3ca128a76daf27b4d9/

The configure script of host-libxml-parser-perl needs the English perl
module on the host:

ERROR from evaluation of
/home/buildroot/autobuild/instance-1/output-1/build/host-libxml-parser-perl-2.46/Expat/Makefile.PL:
Can't locate English.pm in @INC (you may need to install the English module)
(@INC contains:
/home/buildroot/autobuild/instance-1/output-1/build/host-libxml-parser-perl-2.46/inc
/home/buildroot/autobuild/instance-1/output-1/host/lib/perl
/usr/local/lib64/perl5/5.36 /usr/local/share/perl5/5.36
/usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/lib64/perl5
/usr/share/perl5 .) at ./Makefile.PL line 3.

So add a check for it in dependencies.sh similar to the existing check for
ExtUtils::MakeMaker.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/dependencies.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index afd30008e8..ea16a21e20 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -266,6 +266,7 @@ fi
 
 # Check that the Perl installation is complete enough for Buildroot.
 required_perl_modules="Data::Dumper" # Needed to build host-autoconf
+required_perl_modules="$required_perl_modules English" # Used by host-libxml-parser-perl
 required_perl_modules="$required_perl_modules ExtUtils::MakeMaker" # Used by host-libxml-parser-perl
 required_perl_modules="$required_perl_modules Thread::Queue" # Used by host-automake
 required_perl_modules="$required_perl_modules FindBin" # Used by (host-)libopenssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
