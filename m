Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11632C433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 22:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACF35402FB;
	Sun, 20 Mar 2022 22:39:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oEnv88OBtkR6; Sun, 20 Mar 2022 22:39:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF45440170;
	Sun, 20 Mar 2022 22:39:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B8F7D1BF402
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 22:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4FEA405C1
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 22:38:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uSXTrNorHvmj for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 22:38:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C59084056F
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 22:38:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8314B846D4; Sun, 20 Mar 2022 22:30:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 23:38:30 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 84a9bdb30e7510cb6426d02f39109c53fd1dc420
X-Git-Newrev: 6788e82f45d38cff560c33392f4b556e9d79e476
X-Patchwork-Hint: ignore
Message-Id: <20220320223004.8314B846D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 support/scripts/pkg-stats: strengthen version check in
 check_package_get_latest_version_by_distro()
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

commit: https://git.buildroot.net/buildroot/commit/?id=6788e82f45d38cff560c33392f4b556e9d79e476
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

The check_package_get_latest_version_by_distro() function analyzes the
data returned by release-monitoring.org. For two of our
packages (bento4 and qextserialport), release-monitoring.org returns
something that is a bit odd: it returns an entry with a
"stable_versions" field that contains an empty array. Our code was
ready to have or not have a "stable_versions" entry, but when it is
present, we assumed it was not an empty array. These two packages, for
some reason, break this assumption.

In order to solve this problem, this commit is more careful, and uses
the stable_versions field only if it exists and it has at least one
entry. The code is also reworked as a sequence of "if...elif...else"
to be more readable.

This fixes the following exception when running pkg-stats on the full
package set:

Task exception was never retrieved
future: <Task finished name='Task-10772' coro=<check_package_latest_version_get() done, defined at ./support/scripts/pkg-stats:532> exception=IndexError('list index out of range')>
Traceback (most recent call last):
  File "./support/scripts/pkg-stats", line 535, in check_package_latest_version_get
    if await check_package_get_latest_version_by_distro(session, pkg):
  File "./support/scripts/pkg-stats", line 489, in check_package_get_latest_version_by_distro
    version = data['stable_versions'][0] if 'stable_versions' in data else data['version'] if 'version' in data else None
IndexError: list index out of range

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998@free.fr: non-sequence tests as True]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c72f3f2b43f4607ed94d51a21abe5e3d909efb36)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/pkg-stats | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index c235d99407..8cc64a54d1 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -486,7 +486,12 @@ async def check_package_get_latest_version_by_distro(session, pkg, retry=True):
                 return False
 
             data = await resp.json()
-            version = data['stable_versions'][0] if 'stable_versions' in data else data['version'] if 'version' in data else None
+            if 'stable_versions' in data and data['stable_versions']:
+                version = data['stable_versions'][0]
+            elif 'version' in data:
+                version = data['version']
+            else:
+                version = None
             check_package_latest_version_set_status(pkg,
                                                     RM_API_STATUS_FOUND_BY_DISTRO,
                                                     version,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
