Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A03BC4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 16:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F18A741741;
	Thu,  2 May 2024 16:34:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gi-3VIw-3FrY; Thu,  2 May 2024 16:34:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0D5A40701
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0D5A40701;
	Thu,  2 May 2024 16:34:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 91B661BF990
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 16:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7DFCF41B5A
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 16:33:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CFCxudPnUPzk for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 16:33:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 529E2409F1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 529E2409F1
 for <buildroot@buildroot.org>; Thu,  2 May 2024 16:33:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3A7D786636; Thu,  2 May 2024 16:33:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 2 May 2024 18:28:38 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 81deca8719c0fd5cd707df040dee7c525106c5ed
X-Git-Newrev: 59c153dbcd0b47e35f65dc911ee2bfb1bca0b895
X-Patchwork-Hint: ignore
Message-Id: <20240502163355.3A7D786636@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x]
 support/scripts/pkg-stats: fix bug when sorting by hashfile
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

commit: https://git.buildroot.net/buildroot/commit/?id=59c153dbcd0b47e35f65dc911ee2bfb1bca0b895
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Because the div_class variable was not reassigned a value,
cells in the latest_version column were still being assigned
hash_file classes and so were being picked up as elements in
the hash_file sort. This lead to execessive grid gap elements
stacking up and creating huge blank spaces at the top of the page.
This is very noticable on pages with a large number of packages,
like the ones the autobuilder creates.

original behaviour(click the "Hash file" column label twice):
http://autobuild.buildroot.org/stats/master.html

demo of fixed behaviour:
https://sen-h.codeberg.page/pkg-stats-demos/@pages/fix-bug-when-sorting-by-hash-file.html

Signed-off-by: Sen Hastings <sen@hastings.org>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 6e3d79f52ef0e1b2b6fe1e660820cabdca6179c2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/pkg-stats | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 53898a36f2..3295eb7a48 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -977,6 +977,7 @@ def dump_html_pkg(f, pkg):
 
     # Latest version
     data_field_id = f'latest_version__{pkg_css_class}'
+    div_class = ["centered"]
     div_class.append(f'_{pkg_css_class}')
     div_class.append("latest_version data")
     if pkg.latest_version['status'] == RM_API_STATUS_ERROR:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
