Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB73DC64ED6
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 21:26:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6779781F4C;
	Tue, 28 Feb 2023 21:26:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6779781F4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xco37r_nDZfJ; Tue, 28 Feb 2023 21:26:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DFF081EF1;
	Tue, 28 Feb 2023 21:26:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DFF081EF1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3BA991BF2BF
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 21:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23A4C400C8
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 21:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23A4C400C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6DmopnLjD963 for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 21:26:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5073B40142
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 21:26:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5073B40142
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3FB9E86DEB; Tue, 28 Feb 2023 21:26:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Feb 2023 21:57:09 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: d48b5b3652a1c724a4c04d97ab35f4c1484a9785
X-Git-Newrev: 470dd91a5a7fa04993656c099ec17ab91f85e3b7
X-Patchwork-Hint: ignore
Message-Id: <20230228212610.3FB9E86DEB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 support/dependencies/dependencies.sh: require diagnostics perl package for
 mosh
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

commit: https://git.buildroot.net/buildroot/commit/?id=470dd91a5a7fa04993656c099ec17ab91f85e3b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fixes:
http://autobuild.buildroot.net/results/820/820e98b1c126469b1f180f078d102ded43b9c40e/

scripts/Makefile.am of mosh-1.4.0 needs the perl diagnostics module on the host:

make[3]: Entering directory '/home/buildroot/autobuild/instance-2/output-1/build/mosh-1.4.0/scripts'
perl -Mdiagnostics -c ./mosh.pl
Can't locate diagnostics.pm in @INC (you may need to install the diagnostics module) (@INC contains: /home/buildroot/autobuild/instance-2/output-1/host/lib/perl /usr/local/lib64/perl5/5.36 /usr/local/share/perl5/5.36 /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/lib64/perl5 /usr/share/perl5).
BEGIN failed--compilation aborted.

So add a check for it in dependencies.sh similar to the other perl modules.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5be2d9bb621e3f3aa552516c8887a7821ed62788)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/dependencies.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 89ed3c9df9..70e951a7e6 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -290,6 +290,10 @@ required_perl_modules="$required_perl_modules ExtUtils::MakeMaker" # Used by hos
 required_perl_modules="$required_perl_modules Thread::Queue" # Used by host-automake
 required_perl_modules="$required_perl_modules FindBin" # Used by (host-)libopenssl
 
+if grep -q ^BR2_PACKAGE_MOSH=y $BR2_CONFIG ; then
+    required_perl_modules="$required_perl_modules diagnostics"
+fi
+
 if grep -q ^BR2_PACKAGE_MPV=y $BR2_CONFIG ; then
     required_perl_modules="$required_perl_modules Math::BigInt"
     required_perl_modules="$required_perl_modules Math::BigRat"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
