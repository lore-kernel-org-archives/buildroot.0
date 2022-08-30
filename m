Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA2EECAAA1
	for <buildroot@archiver.kernel.org>; Tue, 30 Aug 2022 22:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4A2C61041;
	Tue, 30 Aug 2022 22:38:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4A2C61041
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9tIzgufNqxOO; Tue, 30 Aug 2022 22:38:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACA4B61047;
	Tue, 30 Aug 2022 22:38:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACA4B61047
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 70E881BF372
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 22:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A449812E1
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 22:37:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A449812E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CwxgfJaTv9kI for <buildroot@lists.busybox.net>;
 Tue, 30 Aug 2022 22:37:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7944C812CF
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 22:37:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7944C812CF
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1E5A3868D2; Tue, 30 Aug 2022 22:22:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 31 Aug 2022 00:34:19 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: ec7bbd66c7e32d4fdcf90cfbc0802f704bb98ac2
X-Git-Newrev: f05c1f5da4c599dd01a24e1d534a540d56c159d3
X-Patchwork-Hint: ignore
Message-Id: <20220830222254.1E5A3868D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 support/scripts/pkg-stats: add better checking in
 check_package_get_latest_version_by_guess()
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

commit: https://git.buildroot.net/buildroot/commit/?id=f05c1f5da4c599dd01a24e1d534a540d56c159d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

The 'rtl8723ds' name, when queried from release-monitoring.org at
https://release-monitoring.org/api/projects/?pattern=rtl8723ds returns
one project, with one "stable_versions" array, which is empty. This
was not expected by the pkg-stats code, causing an exception:

Task exception was never retrieved
future: <Task finished name='Task-764' coro=<check_package_latest_version_get() done, defined at /home/thomas/projets/buildroot/./support/scripts/pkg-stats:558> exception=IndexError('list index out of range')>
Traceback (most recent call last):
  File "/home/thomas/projets/buildroot/./support/scripts/pkg-stats", line 566, in check_package_latest_version_get
    if await check_package_get_latest_version_by_guess(session, pkg):
  File "/home/thomas/projets/buildroot/./support/scripts/pkg-stats", line 544, in check_package_get_latest_version_by_guess
    projects[0]['stable_versions'][0],
IndexError: list index out of range

This commit therefore improves the checks done on the results received
from release-monitoring.org to avoid this issue.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f1e3b2bb01903faf7595ed3151140bbf767681e0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/pkg-stats | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 7da06096ef..06c309565b 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -536,12 +536,17 @@ async def check_package_get_latest_version_by_guess(session, pkg, retry=True):
             projects = [p for p in data['projects'] if p['name'] == pkg.name and 'stable_versions' in p]
             projects.sort(key=lambda x: x['id'])
 
-            if len(projects) > 0:
-                check_package_latest_version_set_status(pkg,
-                                                        RM_API_STATUS_FOUND_BY_PATTERN,
-                                                        projects[0]['stable_versions'][0],
-                                                        projects[0]['id'])
-                return True
+            if len(projects) == 0:
+                return False
+
+            if len(projects[0]['stable_versions']) == 0:
+                return False
+
+            check_package_latest_version_set_status(pkg,
+                                                    RM_API_STATUS_FOUND_BY_PATTERN,
+                                                    projects[0]['stable_versions'][0],
+                                                    projects[0]['id'])
+            return True
 
     except (aiohttp.ClientError, asyncio.TimeoutError):
         if retry:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
