Return-Path: <SRS0=JPVL=O4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F9EFC433F5
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 21:21:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B69CF60FD9
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 21:21:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B69CF60FD9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F92860EBE;
	Fri,  8 Oct 2021 21:21:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JAJlPzszjBB2; Fri,  8 Oct 2021 21:21:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3D6D60B9A;
	Fri,  8 Oct 2021 21:21:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 79C051BF2F6
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 21:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68388829EE
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 21:21:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a-W41pHQxMSJ for <buildroot@lists.busybox.net>;
 Fri,  8 Oct 2021 21:21:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C8D3D829AF
 for <buildroot@buildroot.org>; Fri,  8 Oct 2021 21:21:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id DDED7E0003;
 Fri,  8 Oct 2021 21:21:40 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri,  8 Oct 2021 23:21:35 +0200
Message-Id: <20211008212136.721533-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211008212136.721533-1-thomas.petazzoni@bootlin.com>
References: <20211008212136.721533-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] support/scripts/pkg-stats: use the new
 'stable_versions' field of release-monitoring.org
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
This should be backported to stable branches of Buildroot, so that the
pkg-stats results generated for those stable branches also benefit
from this logic.
---
 support/scripts/pkg-stats | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 0f1521873f..f7bc300770 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -484,7 +484,7 @@ async def check_package_get_latest_version_by_distro(session, pkg, retry=True):
                 return False
 
             data = await resp.json()
-            version = data['version'] if 'version' in data else None
+            version = data['stable_versions'][0] if 'stable_versions' in data else None
             check_package_latest_version_set_status(pkg,
                                                     RM_API_STATUS_FOUND_BY_DISTRO,
                                                     version,
@@ -507,13 +507,13 @@ async def check_package_get_latest_version_by_guess(session, pkg, retry=True):
 
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
 
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
