Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 236FEC4332F
	for <buildroot@archiver.kernel.org>; Fri,  4 Nov 2022 07:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9F556104D;
	Fri,  4 Nov 2022 07:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9F556104D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TQ8TZj6DyNjw; Fri,  4 Nov 2022 07:53:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E10B561038;
	Fri,  4 Nov 2022 07:53:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E10B561038
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5F5041BF399
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 07:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A39F4188A
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 07:52:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A39F4188A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DiTi2oOBnUgf for <buildroot@lists.busybox.net>;
 Fri,  4 Nov 2022 07:52:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A01F41888
 for <buildroot@buildroot.org>; Fri,  4 Nov 2022 07:52:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A01F41888
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 48CFE87D7E; Fri,  4 Nov 2022 07:52:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 4 Nov 2022 08:39:54 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 9bb4f83a08956ed0a038b53b3d4b3244ab974ee8
X-Git-Newrev: 89fa62f1ae6dc06b9b70a30f5394b20cc248977c
X-Patchwork-Hint: ignore
Message-Id: <20221104075258.48CFE87D7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] support/scripts: don't
 require gawk to generate glibc gconv modules
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

commit: https://git.buildroot.net/buildroot/commit/?id=89fa62f1ae6dc06b9b70a30f5394b20cc248977c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

When only a subset of the glibc gconv modules are installed, we need to
generate a trimmed-down list of available modules. We currently use gawk
for that.

However, we are not using any GNU extension in that awk script, and it
happens to work as expected when using mawk (which has no GNU
extension).

Commit 11c1076db9a5 (toolchain: add option to copy the gconv libraries)
did not explain why it used gawk explicitly, and given the age for that
commit, we doubt we'd be able to have the involved participants recall
anything from that period...

Besides, gawk is not a requirement for Buildroot.

Switch over to using plain awk.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 822cc1ebc42cc43877a20ca51d94689aed3e4424)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/expunge-gconv-modules | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/expunge-gconv-modules b/support/scripts/expunge-gconv-modules
index 03012c1ce3..bc60fc0ce4 100755
--- a/support/scripts/expunge-gconv-modules
+++ b/support/scripts/expunge-gconv-modules
@@ -19,7 +19,7 @@
 # we handle each with slightly different code, since the second never has
 # associated aliases.
 
-gawk -v files="${1}" '
+awk -v files="${2}" '
 $1 == "alias" {
     aliases[$3] = aliases[$3] " " $2;
 }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
