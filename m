Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 802B9C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 21:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F3DB83313;
	Thu,  6 Jan 2022 21:29:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iNtK0CildQ2t; Thu,  6 Jan 2022 21:29:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8184D832D8;
	Thu,  6 Jan 2022 21:29:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DB2461BF38A
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 21:29:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9EF542930
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 21:29:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KS60aijucaWq for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 21:29:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2FFCA4292C
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 21:29:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A4B96829F5; Thu,  6 Jan 2022 21:23:31 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 6 Jan 2022 22:27:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9d7abbfed89683a7f1bef089c9fb5ab32b967cb0
X-Git-Newrev: dd8f8f8e89b9e2fdfe3262bc685368ad77d96e2a
X-Patchwork-Hint: ignore
Message-Id: <20220106212331.A4B96829F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/misc/relocate-sdk.sh: allow
 relocating to any directory
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

commit: https://git.buildroot.net/buildroot/commit/?id=dd8f8f8e89b9e2fdfe3262bc685368ad77d96e2a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, relocate-sdk.sh must be run _after_ relocating the SDK. There
are cases where it is useful to already prepare the SDK _before_
relocating. For example, it allows to prepare a tarball that the user
has to extract to a specific, pre-defined location and nothing more than
that, which is simpler for the user than requiring the script to be run.
In addition, it hides the build directory that was used by the SDK
builder (somewhat).

Add an optional argument to relocate-sdk.sh that gives the target
directory.

Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/misc/relocate-sdk.sh | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/support/misc/relocate-sdk.sh b/support/misc/relocate-sdk.sh
index caabeaa6f6..981d272425 100755
--- a/support/misc/relocate-sdk.sh
+++ b/support/misc/relocate-sdk.sh
@@ -1,15 +1,20 @@
 #!/bin/sh
-#
-if [ "$#" -ne 0 ]; then
-    echo "Run this script to relocate the buildroot SDK at that location"
+
+if [ "$#" -gt 1 ]; then
+    echo "Usage: $0 [path]"
+    echo "Run this script to relocate the buildroot SDK to the current location"
+    echo "If [path] is given, sets the location to [path] (without moving it)"
     exit 1
 fi
 
-LOCFILE="share/buildroot/sdk-location"
-FILEPATH="$(readlink -f "$0")"
-NEWPATH="$(dirname "${FILEPATH}")"
+cd "$(dirname "$(readlink -f "$0")")"
+if [ "$#" -eq 1 ]; then
+    NEWPATH="$1"
+else
+    NEWPATH="${PWD}"
+fi
 
-cd "${NEWPATH}"
+LOCFILE="share/buildroot/sdk-location"
 if [ ! -r "${LOCFILE}" ]; then
     echo "Previous location of the buildroot SDK not found!"
     exit 1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
