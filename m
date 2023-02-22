Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC645C64ED6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 20:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54A2D41080;
	Wed, 22 Feb 2023 20:03:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54A2D41080
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dozavOACxDx8; Wed, 22 Feb 2023 20:03:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75C39410AF;
	Wed, 22 Feb 2023 20:03:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75C39410AF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9A7AE1BF475
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 20:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75D4140571
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 20:03:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75D4140571
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W1rqDHyHaXPe for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 20:03:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9029B40566
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 20:03:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9029B40566
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7DE0386811; Wed, 22 Feb 2023 20:03:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 20:56:21 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 2c667302fd6a0f16a36925a77d0e2e6b7ec64bbc
X-Git-Newrev: ea68d30c344899e7f890ec0996b7c8554c2fa61e
X-Patchwork-Hint: ignore
Message-Id: <20230222200317.7DE0386811@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
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

commit: https://git.buildroot.net/buildroot/commit/?id=ea68d30c344899e7f890ec0996b7c8554c2fa61e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit 8f8085e63a4a755d587a25a73dbaafe33b23f867)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/dependencies.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 906781ab78..b879c58ff2 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -275,6 +275,7 @@ fi
 
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
