Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C0EEC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:03:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34A9A61076
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:03:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 34A9A61076
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0416B4017A;
	Mon, 25 Oct 2021 19:03:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6QbqfHw_e0-s; Mon, 25 Oct 2021 19:03:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 562AC4019F;
	Mon, 25 Oct 2021 19:03:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C8BAF1BF97C
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B787B403BA
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:02:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f24eP0unAQ_U for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 19:02:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8DBF40288
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 19:02:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 28153887C7; Mon, 25 Oct 2021 18:59:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 20:53:54 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: c7f6ce42f12d466b168983db511d2b565ec3f916
X-Git-Newrev: d9c113d31155ad41d7c067e0a56d0907ae4461ad
X-Patchwork-Hint: ignore
Message-Id: <20211025185909.28153887C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x]
 support/scripts/pkg-stats: use the new 'stable_versions' field of
 release-monitoring.org
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

commit: https://git.buildroot.net/buildroot/commit/?id=d9c113d31155ad41d7c067e0a56d0907ae4461ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

The pkg-stats script queries release-monitoring.org to find the latest
upstream versions of our packages. However, up until recently,
release-monitoring.org had no notion of stable
vs. development/release-candidate versions, so for some packages the
"latest" version was in fact a development/release-candidate version
that we didn't want to package in Buildroot.

However, in recent time, release-monitoring.org has gained support for
differentiating stable vs. development releases of upstream
projects. See for example
https://release-monitoring.org/project/10024/ for the glib library,
which has a number of versions marked "Pre-release".

The JSON blurb returned by release-monitoring.org has 3 relevant
fields:

 - "version", which we are using currently, which is a string
   containing the reference of the latest version, including
   pre-release.

 - "versions", which is an array of strings listing all versions,
   pre-release or not.

 - "stable_versions", which is an array of string listing only
   non-pre-release versions. It is ordered newest first to oldest
   last.

So, this commit changes from using 'version' to using
'stable_versions[0]'.

As an example, before this change, pkg-stats reports that nfs-utils
needs to be bumped to 2.5.5rc3, while after this patch, it reports
that nfs-utils is already at 2.5.4, and that this is the latest stable
version (modulo an issue where Buildroot has 2.5.4 and
release-monitoring.org has 2-5-4, this will be addressed separately).

Note that part of this change was already done in commit f7b0e0860, but
it was incomplete.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 11efcb39b2904512d429a328c7ec3c99246f94f7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/pkg-stats | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 26cba1479e..b182fce605 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -496,13 +496,13 @@ async def check_package_get_latest_version_by_guess(session, pkg, retry=True):
 
             data = await resp.json()
             # filter projects that have the right name and a version defined
-            projects = [p for p in data['projects'] if p['name'] == pkg.name and 'version' in p]
+            projects = [p for p in data['projects'] if p['name'] == pkg.name and 'stable_versions' in p]
             projects.sort(key=lambda x: x['id'])
 
             if len(projects) > 0:
                 check_package_latest_version_set_status(pkg,
                                                         RM_API_STATUS_FOUND_BY_PATTERN,
-                                                        projects[0]['version'],
+                                                        projects[0]['stable_versions'][0],
                                                         projects[0]['id'])
                 return True
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
