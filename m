Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C95C4C05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 14:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7529E40BF4;
	Wed,  8 Feb 2023 14:29:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7529E40BF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1d0uQBjyJlCd; Wed,  8 Feb 2023 14:29:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AFBF440BF9;
	Wed,  8 Feb 2023 14:29:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFBF440BF9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A7FE01BF2C7
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 14:28:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 811D240BE2
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 14:28:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 811D240BE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0ci_aI4Xf_ux for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 14:28:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB9F940148
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 14:28:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB9F940148
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D0048846E3; Wed,  8 Feb 2023 14:28:51 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 8 Feb 2023 15:28:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b739d6bd98e8ee12ec2150563ef9cdef35d2ea35
X-Git-Newrev: dc364c6ae65d3167409380b8883123a55270b18d
X-Patchwork-Hint: ignore
Message-Id: <20230208142851.D0048846E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/brmake: fix shellcheck errors
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

commit: https://git.buildroot.net/buildroot/commit/?id=dc364c6ae65d3167409380b8883123a55270b18d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In utils/brmake line 6:
    local found ret start d h m mf
          ^---^ SC2034: found appears unused. Verify use (or export if used externally).

In utils/brmake line 16:
    > >( while read line; do
               ^--^ SC2162: read without -r will mangle backslashes.

For both, the suggestions from shellcheck can be applied.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 utils/brmake | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/utils/brmake b/utils/brmake
index e30119dd10..70dfb6cdc8 100755
--- a/utils/brmake
+++ b/utils/brmake
@@ -3,7 +3,7 @@
 # License: WTFPL, https://spdx.org/licenses/WTFPL.html
 
 main() {
-    local found ret start d h m mf
+    local ret start d h m mf
 
     if ! which unbuffer >/dev/null 2>&1; then
         printf "you need to install 'unbuffer' (from package expect or expect-dev)\n" >&2
@@ -13,7 +13,7 @@ main() {
     start=${SECONDS}
 
     ( exec 2>&1; unbuffer make "${@}"; ) \
-    > >( while read line; do
+    > >( while read -r line; do
              printf "%(%Y-%m-%dT%H:%M:%S)T %s\n" -1 "${line}"
          done \
          |tee -a br.log \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
