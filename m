Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A83C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 11:36:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B525860B95;
	Tue,  7 Feb 2023 11:36:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B525860B95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id luN4l9pQXq8s; Tue,  7 Feb 2023 11:36:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA0E260A7A;
	Tue,  7 Feb 2023 11:36:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA0E260A7A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1FAD31BF2AF
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 11:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06C7160A7A
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 11:36:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06C7160A7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BIFU3rBgO8r7 for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 11:36:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 121A1605AB
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 11:36:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 121A1605AB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F360184086; Tue,  7 Feb 2023 11:36:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 12:35:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8a9da9a8cad5f77902547fab3b24d04175749a7c
X-Git-Newrev: b63e155e5fb7104e6660aa0570befa9498259cd7
X-Patchwork-Hint: ignore
Message-Id: <20230207113647.F360184086@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/dependencies/dependencies.sh:
 correct check for open perl module
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

commit: https://git.buildroot.net/buildroot/commit/?id=b63e155e5fb7104e6660aa0570befa9498259cd7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 4cdd99190e89 (support/dependencies/dependencies.sh: require open perl
package for libxcrypt) added a check for the "open" perl module for
libxcrypt, but it does not work as "open" cannot be directly used with
"require" as an argument is needed:

perl -e "require open"
Not enough arguments for open at -e line 1, at EOF
Execution of -e aborted due to compilation errors.

So special case the check to instead check with "use open ':std'".

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/dependencies.sh | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 353817f8fb..88eabe921d 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -271,10 +271,6 @@ required_perl_modules="$required_perl_modules ExtUtils::MakeMaker" # Used by hos
 required_perl_modules="$required_perl_modules Thread::Queue" # Used by host-automake
 required_perl_modules="$required_perl_modules FindBin" # Used by (host-)libopenssl
 
-if grep -q ^BR2_PACKAGE_LIBXCRYPT=y $BR2_CONFIG ; then
-    required_perl_modules="$required_perl_modules open"
-fi
-
 if grep -q ^BR2_PACKAGE_MPV=y $BR2_CONFIG ; then
     required_perl_modules="$required_perl_modules Math::BigInt"
     required_perl_modules="$required_perl_modules Math::BigRat"
@@ -291,6 +287,13 @@ fi
 # This variable will keep the modules that are missing in your system.
 missing_perl_modules=""
 
+if grep -q ^BR2_PACKAGE_LIBXCRYPT=y $BR2_CONFIG ; then
+	# open cannot be used with require
+	if ! perl -e "use open ':std'" > /dev/null 2>&1 ; then
+		missing_perl_modules="$missing_perl_modules open"
+	fi
+fi
+
 for pm in $required_perl_modules ; do
 	if ! perl  -e "require $pm" > /dev/null 2>&1 ; then
 		missing_perl_modules="$missing_perl_modules $pm"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
