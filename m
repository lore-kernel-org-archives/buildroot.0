Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D22F9C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:03:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7532660E74
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:03:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7532660E74
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 504B660895;
	Mon, 25 Oct 2021 19:03:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pYGW5VO4-DWl; Mon, 25 Oct 2021 19:03:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E84560847;
	Mon, 25 Oct 2021 19:03:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 91BEE1BF3F7
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8139D4046E
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:02:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0SWqM5rDIW5d for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 19:02:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E26040462
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 19:02:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1EA97887C8; Mon, 25 Oct 2021 18:59:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 20:52:44 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 94ba255b30c8972b3d092f084582e37bbf08272c
X-Git-Newrev: c7f6ce42f12d466b168983db511d2b565ec3f916
X-Patchwork-Hint: ignore
Message-Id: <20211025185909.1EA97887C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x]
 support/scripts/pkg-stats: fix the status for packages found by guess
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

commit: https://git.buildroot.net/buildroot/commit/?id=c7f6ce42f12d466b168983db511d2b565ec3f916
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

The pkg-stats scripts tries to match packages against
release-monitoring.org in two ways:

- First by using the "Buildroot" distribution registered on
  release-monitoring.org, in which we have added a lot of mappings
  between Buildroot package names and release-monitoring.org package
  names. If there is a match using this distribution, the package
  status is RM_API_STATUS_FOUND_BY_DISTRO, which means that the
  resulting HTML has a "found by distro" statement.

- Then, if the first solution didn't work, by using the pattern
  matching, as done in the check_package_get_latest_version_by_guess()
  function.

However, there is a bug in this later case: it sets the package status
to RM_API_STATUS_FOUND_BY_DISTRO as well, while it should have been
RM_API_STATUS_FOUND_BY_PATTERN. Due to this bug, in the resulting HTML
file from a pkg-stats run, all packages are marked as "found by
distro" even the ones that are "found by guess".

This commit fixes that by setting the correct package status.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 9602fd94e767a30861e43ee8c28086bb413a4e97)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/pkg-stats | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index f2b95e257d..26cba1479e 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -501,7 +501,7 @@ async def check_package_get_latest_version_by_guess(session, pkg, retry=True):
 
             if len(projects) > 0:
                 check_package_latest_version_set_status(pkg,
-                                                        RM_API_STATUS_FOUND_BY_DISTRO,
+                                                        RM_API_STATUS_FOUND_BY_PATTERN,
                                                         projects[0]['version'],
                                                         projects[0]['id'])
                 return True
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
