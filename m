Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 590DDC021AA
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 20:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00B038120D;
	Tue, 18 Feb 2025 20:14:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id raoztl6gL87W; Tue, 18 Feb 2025 20:14:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27C4F80ED8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27C4F80ED8;
	Tue, 18 Feb 2025 20:14:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 39CAAC8
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 20:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D05F813BD
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 20:14:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kAdaRAvgXeLP for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 20:14:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11D6E80F27
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11D6E80F27
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 20:14:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B7648772A; Tue, 18 Feb 2025 20:14:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 18 Feb 2025 20:58:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5494efe61b64c40dc5b197d8fd9732b4a3fadd98
X-Git-Newrev: d21aeb44e06eb8259179edb3f7e330a07f8b908f
X-Patchwork-Hint: ignore
Message-Id: <20250218201426.0B7648772A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/brmake: simplify redirection
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d21aeb44e06eb8259179edb3f7e330a07f8b908f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We want to redirect both stdout and stderr to the log, so just do both
redirections at once. This simplifies the call to make, which was
inherited from afdb545b2847 (tools: new tool to filter the output of
make) when brmake was using unbuffer (and even then it was not entirely
waranted to do the redirection that way).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 utils/brmake | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/utils/brmake b/utils/brmake
index 4b9179e415..a4b9e7fa71 100755
--- a/utils/brmake
+++ b/utils/brmake
@@ -7,8 +7,8 @@ main() {
 
     start=${SECONDS}
 
-    ( exec 2>&1; make "${@}" ) \
-    > >( while read -r line; do
+    make "${@}" \
+    &> >( while read -r line; do
              printf "%(%Y-%m-%dT%H:%M:%S)T %s\n" -1 "${line}"
          done \
          |tee -a br.log \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
