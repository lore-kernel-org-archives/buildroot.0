Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBFE5C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 17:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8750C40A80;
	Tue,  7 Feb 2023 17:24:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8750C40A80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u9YQo60T3VMG; Tue,  7 Feb 2023 17:24:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C787B40A8E;
	Tue,  7 Feb 2023 17:24:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C787B40A8E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E21F11BF5F6
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC543402F0
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:24:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC543402F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bizvQp54vB3G for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 17:24:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACA5240291
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 17:24:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACA5240291
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 921B78430F; Tue,  7 Feb 2023 17:24:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 18:24:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bde165f7ad4922e218cabdb6eb7c40e1661179f0
X-Git-Newrev: 4fbd2f6d2cf26225f73f584c3a0cacb1b2476f5f
X-Patchwork-Hint: ignore
Message-Id: <20230207172450.921B78430F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/dependencies/dependencies.sh:
 silence gcc plugin test
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

commit: https://git.buildroot.net/buildroot/commit/?id=4fbd2f6d2cf26225f73f584c3a0cacb1b2476f5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The gcc plugin test was not using the -q option to grep causing it to print
the line to stdout, so fix that.

While we're at it, adjust the locale check to use grep -q instead of
redirecting to /dev/null for consistency with the other checks.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/dependencies.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 88eabe921d..0aa5e59274 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -194,7 +194,7 @@ if [ "${PATCH_MAJOR}" -lt 2 ] || [ "${PATCH_MAJOR}" -eq 2 -a "${PATCH_MINOR}" -l
 	exit 1;
 fi
 
-if grep ^BR2_NEEDS_HOST_UTF8_LOCALE=y $BR2_CONFIG > /dev/null; then
+if grep -q ^BR2_NEEDS_HOST_UTF8_LOCALE=y $BR2_CONFIG ; then
 	if ! which locale > /dev/null ; then
 		echo
 		echo "You need locale support on your build machine to build a toolchain supporting locales"
@@ -254,7 +254,7 @@ if grep -q ^BR2_HOSTARCH_NEEDS_IA32_COMPILER=y $BR2_CONFIG ; then
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
