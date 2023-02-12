Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3218FC636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBBB96FC24;
	Tue, 21 Feb 2023 01:57:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBBB96FC24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pU59nr6vje_h; Tue, 21 Feb 2023 01:57:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D8E1701EF;
	Tue, 21 Feb 2023 01:57:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D8E1701EF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BFEBA1BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D85570032
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D85570032
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YP2JnicLgIkH for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9488B7001F
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9488B7001F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 848CC828C8; Mon, 20 Feb 2023 20:52:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Feb 2023 09:28:45 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d8f0c02574b485e3250030d8cbf5c057ced578a7
X-Git-Newrev: 5be2d9bb621e3f3aa552516c8887a7821ed62788
X-Patchwork-Hint: ignore
Message-Id: <20230220205258.848CC828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
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

commit: https://git.buildroot.net/buildroot/commit/?id=5be2d9bb621e3f3aa552516c8887a7821ed62788
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:
http://autobuild.buildroot.net/results/820/820e98b1c126469b1f180f078d102ded43b9c40e/

scripts/Makefile.am of mosh-1.4.0 needs the perl diagnostics module on the host:

make[3]: Entering directory '/home/buildroot/autobuild/instance-2/output-1/build/mosh-1.4.0/scripts'
perl -Mdiagnostics -c ./mosh.pl
Can't locate diagnostics.pm in @INC (you may need to install the diagnostics module) (@INC contains: /home/buildroot/autobuild/instance-2/output-1/host/lib/perl /usr/local/lib64/perl5/5.36 /usr/local/share/perl5/5.36 /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/lib64/perl5 /usr/share/perl5).
BEGIN failed--compilation aborted.

So add a check for it in dependencies.sh similar to the other perl modules.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/dependencies.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index cf6635bff6..4353e9585e 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -281,6 +281,10 @@ required_perl_modules="$required_perl_modules ExtUtils::MakeMaker" # Used by hos
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
