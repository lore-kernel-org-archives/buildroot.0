Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28495C64EC7
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 16:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C632581F2F;
	Tue, 28 Feb 2023 16:17:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C632581F2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SV_cQlAaGMea; Tue, 28 Feb 2023 16:17:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1054281C18;
	Tue, 28 Feb 2023 16:17:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1054281C18
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D493C1BF5A8
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 16:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF04240BCB
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 16:16:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF04240BCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bCQTqEFp-pVm for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 16:16:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E430E40BC6
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 16:16:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E430E40BC6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF48D86D40; Tue, 28 Feb 2023 16:16:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Feb 2023 17:12:08 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: ff9115673eb413e300aa7cb7e868413489d9024a
X-Git-Newrev: 6444c034e31f359bfb33a4333994861a87f7fab0
X-Patchwork-Hint: ignore
Message-Id: <20230228161657.CF48D86D40@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] utils/brmake: fix
 shellcheck errors
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

commit: https://git.buildroot.net/buildroot/commit/?id=6444c034e31f359bfb33a4333994861a87f7fab0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

In utils/brmake line 6:
    local found ret start d h m mf
          ^---^ SC2034: found appears unused. Verify use (or export if used externally).

In utils/brmake line 16:
    > >( while read line; do
               ^--^ SC2162: read without -r will mangle backslashes.

For both, the suggestions from shellcheck can be applied.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit dc364c6ae65d3167409380b8883123a55270b18d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
