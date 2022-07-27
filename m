Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D98C8C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 21:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67F3660E8C;
	Wed, 27 Jul 2022 21:23:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67F3660E8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5tdVzxKPGMuu; Wed, 27 Jul 2022 21:23:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A01860E65;
	Wed, 27 Jul 2022 21:23:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A01860E65
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6E0A01BF405
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 21:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C085941573
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 21:22:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C085941573
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gw1zqmVv4flh for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 21:22:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F6EA4160D
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 21:22:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F6EA4160D
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id BC56F86743; Wed, 27 Jul 2022 21:09:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 23:12:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e58e0d17c796f46c54b9cd86b12844756b917a05
X-Git-Newrev: f1e3b2bb01903faf7595ed3151140bbf767681e0
X-Patchwork-Hint: ignore
Message-Id: <20220727210911.BC56F86743@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: add better
 checking in check_package_get_latest_version_by_guess()
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f1e3b2bb01903faf7595ed3151140bbf767681e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 support/scripts/pkg-stats | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index fe549ce1ca..9c37506cd4 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -537,12 +537,17 @@ async def check_package_get_latest_version_by_guess(session, pkg, retry=True):
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
