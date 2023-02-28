Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8EB2C64EC7
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 15:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 743DC61189;
	Tue, 28 Feb 2023 15:37:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 743DC61189
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EA5WdMMk7E-E; Tue, 28 Feb 2023 15:37:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91E01611BA;
	Tue, 28 Feb 2023 15:37:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91E01611BA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 258211BF2AA
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 15:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3AA36117C
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 15:36:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3AA36117C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zrJNk1sXW94n for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 15:36:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2676461171
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 15:36:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2676461171
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 136C686CC2; Tue, 28 Feb 2023 15:36:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Feb 2023 16:28:26 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 35ddf2f7707d33c8272fddeb2a0fae5647ed8426
X-Git-Newrev: f21a9f61c59bf1110b051fcbc73f3dcd9bea32ea
X-Patchwork-Hint: ignore
Message-Id: <20230228153629.136C686CC2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 support/dependencies/dependencies.sh: silence gcc plugin test
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

commit: https://git.buildroot.net/buildroot/commit/?id=f21a9f61c59bf1110b051fcbc73f3dcd9bea32ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

The gcc plugin test was not using the -q option to grep causing it to print
the line to stdout, so fix that.

While we're at it, adjust the locale check to use grep -q instead of
redirecting to /dev/null for consistency with the other checks.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4fbd2f6d2cf26225f73f584c3a0cacb1b2476f5f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/dependencies.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index cd0e900ff6..3822f0ca0e 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -203,7 +203,7 @@ if [ "${PATCH_MAJOR}" -lt 2 ] || [ "${PATCH_MAJOR}" -eq 2 -a "${PATCH_MINOR}" -l
 	exit 1;
 fi
 
-if grep ^BR2_NEEDS_HOST_UTF8_LOCALE=y $BR2_CONFIG > /dev/null; then
+if grep -q ^BR2_NEEDS_HOST_UTF8_LOCALE=y $BR2_CONFIG ; then
 	if ! which locale > /dev/null ; then
 		echo
 		echo "You need locale support on your build machine to build a toolchain supporting locales"
@@ -263,7 +263,7 @@ if grep -q ^BR2_HOSTARCH_NEEDS_IA32_COMPILER=y $BR2_CONFIG ; then
 	fi
 fi
 
-if grep ^BR2_NEEDS_HOST_GCC_PLUGIN_SUPPORT=y $BR2_CONFIG ; then
+if grep -q ^BR2_NEEDS_HOST_GCC_PLUGIN_SUPPORT=y $BR2_CONFIG ; then
 	if ! echo "#include <gcc-plugin.h>" | $HOSTCXX_NOCCACHE -I$($HOSTCXX_NOCCACHE -print-file-name=plugin)/include -x c++ -c - -o /dev/null ; then
 		echo
 		echo "Your Buildroot configuration needs a host compiler capable of building gcc plugins."
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
