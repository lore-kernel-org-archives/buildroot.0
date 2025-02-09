Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3910C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4865984AAA;
	Fri, 28 Feb 2025 17:17:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZehTk1NPi24M; Fri, 28 Feb 2025 17:17:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C9A785D13
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C9A785D13;
	Fri, 28 Feb 2025 17:17:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1041394F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1A1D42F2F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ql6jOAyxvsy5 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14F4144A2F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14F4144A2F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C81A87AD6; Fri, 28 Feb 2025 16:30:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 9 Feb 2025 15:39:46 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0100c6e402b6cf67c580b4b6b43b958d1c4f761f
X-Git-Newrev: ef80b710f214fe76dca1aa666eb5e7cea9702ca0
X-Patchwork-Hint: ignore
Message-Id: <20250228163038.0C81A87AD6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] utils/config: fix shellcheck
 errors
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=ef80b710f214fe76dca1aa666eb5e7cea9702ca0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

SC2086 is now reported for missing Double quote around
$FN since shellcheck 0.9.0:

In utils/config line 175:
                if grep -q "# ${BR2_PREFIX}$ARG is not set" $FN ; then
                                                            ^-^ SC2086 (info): Double quote to prevent globbing and word splitting.

In utils/config line 178:
                        if V="$(grep "^${BR2_PREFIX}$ARG=" $FN)"; then
                                                           ^-^ SC2086 (info): Double quote to prevent globbing and word splitting.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/config | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/utils/config b/utils/config
index dfaaf46cd7..038986ca6c 100755
--- a/utils/config
+++ b/utils/config
@@ -172,10 +172,10 @@ while [ "$1" != "" ] ; do
 		;;
 
 	--state|-s)
-		if grep -q "# ${BR2_PREFIX}$ARG is not set" $FN ; then
+		if grep -q "# ${BR2_PREFIX}$ARG is not set" "$FN" ; then
 			echo n
 		else
-			if V="$(grep "^${BR2_PREFIX}$ARG=" $FN)"; then
+			if V="$(grep "^${BR2_PREFIX}$ARG=" "$FN")"; then
 				V="${V/#${BR2_PREFIX}$ARG=/}"
 				V="${V/#\"/}"
 				V="${V/%\"/}"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
