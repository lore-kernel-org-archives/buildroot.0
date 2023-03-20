Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C155AC6FD1D
	for <buildroot@archiver.kernel.org>; Mon, 20 Mar 2023 08:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69E0660BF8;
	Mon, 20 Mar 2023 08:52:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69E0660BF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EC0tCLCf8ARn; Mon, 20 Mar 2023 08:52:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7A6B60BDB;
	Mon, 20 Mar 2023 08:52:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7A6B60BDB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 76E761BF35B
 for <buildroot@lists.busybox.net>; Mon, 20 Mar 2023 08:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5070C408FB
 for <buildroot@lists.busybox.net>; Mon, 20 Mar 2023 08:52:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5070C408FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R8N7HG5E4stM for <buildroot@lists.busybox.net>;
 Mon, 20 Mar 2023 08:52:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DA01408E3
 for <buildroot@buildroot.org>; Mon, 20 Mar 2023 08:52:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DA01408E3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3809E874FB; Mon, 20 Mar 2023 08:52:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 20 Mar 2023 09:37:27 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 8b641331d0b1fea1c70f910df70d7f045f9de162
X-Git-Newrev: 75e04c691e580165b7f203261a3ca2a2d1e3e25c
X-Patchwork-Hint: ignore
Message-Id: <20230320085236.3809E874FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 package/linux-tools/S10hyperv: fix shellcheck warnings
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

commit: https://git.buildroot.net/buildroot/commit/?id=75e04c691e580165b7f203261a3ca2a2d1e3e25c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

When running "make check-package" on a system with shellcheck 0.9.0,
the command fails with output:

    make check-package
    package/linux-tools/S10hyperv:0: run 'shellcheck' and fix the warnings
    ...
    2 warnings generated

This commit fixes the warnings reported by the command:

    shellcheck package/linux-tools/S10hyperv

This commit also fixes the four-space indent by a single tab on the
changed lines. Since this fixes the indentation warnings of
check-package, the Indent exclusion in .checkpackageignore is also
removed.

Fixes:

    In package/linux-tools/S10hyperv line 27:
        return $ret
               ^--^ SC2086 (info): Double quote to prevent globbing and word splitting.

    In package/linux-tools/S10hyperv line 48:
        return $ret
               ^--^ SC2086 (info): Double quote to prevent globbing and word splitting.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c4173d8b08525f260fea8a2a1e805b806bcba9fc)
[Peter: drop .checkpackageignore, not in 2022.02.x]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-tools/S10hyperv | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-tools/S10hyperv b/package/linux-tools/S10hyperv
index ec934bc972..32887d1b6c 100644
--- a/package/linux-tools/S10hyperv
+++ b/package/linux-tools/S10hyperv
@@ -24,7 +24,7 @@ start() {
 	for prog in ${PROGS}; do
 		start_one "${prog}" || ret=$?
 	done
-    return $ret
+	return "$ret"
 }
 
 stop_one() {
@@ -45,7 +45,7 @@ stop() {
 	for prog in ${PROGS}; do
 		stop_one "${prog}" || ret=$?
 	done
-    return $ret
+	return "$ret"
 }
 
 restart() {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
