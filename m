Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE79C636D6
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 19:07:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 492E7409A8;
	Thu, 23 Feb 2023 19:07:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 492E7409A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rnrbjIQomnrR; Thu, 23 Feb 2023 19:07:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30C03409A5;
	Thu, 23 Feb 2023 19:07:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30C03409A5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 081121BF343
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 19:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D63DD40993
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 19:07:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D63DD40993
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x9COs96sCf3B for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 19:07:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C14924098D
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 19:07:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C14924098D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A71E786927; Thu, 23 Feb 2023 19:07:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 23 Feb 2023 20:03:06 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 18db3685293a7865d9eb11cbee1ae5ed506cd429
X-Git-Newrev: 00cbf0095cdc1da96ddd1d991ac1e5979bd05d08
X-Patchwork-Hint: ignore
Message-Id: <20230223190725.A71E786927@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 support/dependencies/dependencies.sh: correct check for open perl module
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

commit: https://git.buildroot.net/buildroot/commit/?id=00cbf0095cdc1da96ddd1d991ac1e5979bd05d08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Commit 4cdd99190e89 (support/dependencies/dependencies.sh: require open perl
package for libxcrypt) added a check for the "open" perl module for
libxcrypt, but it does not work as "open" cannot be directly used with
"require" as an argument is needed:

perl -e "require open"
Not enough arguments for open at -e line 1, at EOF
Execution of -e aborted due to compilation errors.

So special case the check to instead check with "use open ':std'".

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b63e155e5fb7104e6660aa0570befa9498259cd7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/dependencies.sh | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 683bb5cb7e..cd0e900ff6 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -280,10 +280,6 @@ required_perl_modules="$required_perl_modules ExtUtils::MakeMaker" # Used by hos
 required_perl_modules="$required_perl_modules Thread::Queue" # Used by host-automake
 required_perl_modules="$required_perl_modules FindBin" # Used by (host-)libopenssl
 
-if grep -q ^BR2_PACKAGE_LIBXCRYPT=y $BR2_CONFIG ; then
-    required_perl_modules="$required_perl_modules open"
-fi
-
 if grep -q ^BR2_PACKAGE_MPV=y $BR2_CONFIG ; then
     required_perl_modules="$required_perl_modules Math::BigInt"
     required_perl_modules="$required_perl_modules Math::BigRat"
@@ -300,6 +296,13 @@ fi
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
