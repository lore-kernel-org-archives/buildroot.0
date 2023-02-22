Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE677C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 19:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1CD040547;
	Wed, 22 Feb 2023 19:51:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1CD040547
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zodKE3E65VCy; Wed, 22 Feb 2023 19:51:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFFCD40579;
	Wed, 22 Feb 2023 19:51:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFFCD40579
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B31E31BF475
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 19:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A9D04193F
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 19:51:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A9D04193F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lpd6GFl__eyU for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 19:51:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A90B4192F
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 19:51:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A90B4192F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 78DC3867F4; Wed, 22 Feb 2023 19:51:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 20:46:56 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 227bfb48661865a2496ce28236d1aba0ca831bae
X-Git-Newrev: 579945a3baa365aae556b886b9e2405a9176d1a6
X-Patchwork-Hint: ignore
Message-Id: <20230222195137.78DC3867F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x]
 support/dependencies/dependencies.sh: require FindBin perl package for
 libopenssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=579945a3baa365aae556b886b9e2405a9176d1a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Fixes:
http://autobuild.buildroot.net/results/5d1/5d10f4f545dccf126e3f5b5efce777a393c5e7bc/
http://autobuild.buildroot.net/results/7c2/7c2df31c6eb34b68e460e092d8c262bdc6c8f25a/

The configure script of (host-)libopenssl needs the FindBin perl module on the host:

Can't locate FindBin.pm in @INC (you may need to install the FindBin module)
(@INC contains: /home/buildroot/autobuild/instance-2/output-1/host/lib/perl
/usr/local/lib64/perl5/5.36 /usr/local/share/perl5/5.36
/usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/lib64/perl5
/usr/share/perl5) at ./Configure line 15.  BEGIN failed--compilation aborted
at ./Configure line 15.

As this is needed for both libopenssl and host-libopenssl (which does not
have a corresponding config symbol in the .config), we have to require it
unconditionally.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5aab8c59d5b310540105166e7b48faf3d5bd200b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/dependencies.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 2b678ae8c4..906781ab78 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -277,6 +277,7 @@ fi
 required_perl_modules="Data::Dumper" # Needed to build host-autoconf
 required_perl_modules="$required_perl_modules ExtUtils::MakeMaker" # Used by host-libxml-parser-perl
 required_perl_modules="$required_perl_modules Thread::Queue" # Used by host-automake
+required_perl_modules="$required_perl_modules FindBin" # Used by (host-)libopenssl
 
 if grep -q ^BR2_PACKAGE_MPV=y $BR2_CONFIG ; then
     required_perl_modules="$required_perl_modules Math::BigInt"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
