Return-Path: <SRS0=JPVL=O4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76C60C433EF
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 21:21:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1593E60F92
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 21:21:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1593E60F92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0F0660B10;
	Fri,  8 Oct 2021 21:21:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 65lXqU9aocF7; Fri,  8 Oct 2021 21:21:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40B6760AF7;
	Fri,  8 Oct 2021 21:21:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B40D71BF2F6
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 21:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A20EE40295
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 21:21:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R--aLCJDttIz for <buildroot@lists.busybox.net>;
 Fri,  8 Oct 2021 21:21:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F6884000B
 for <buildroot@buildroot.org>; Fri,  8 Oct 2021 21:21:40 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id C943EFF803;
 Fri,  8 Oct 2021 21:21:38 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri,  8 Oct 2021 23:21:34 +0200
Message-Id: <20211008212136.721533-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] support/scripts/pkg-stats: fix the status
 for packages found by guess
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

The pkg-stats scripts tries to match packages against
release-monitoring.org in two days:

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
---
This should be backported to stable branches of Buildroot.
---
 support/scripts/pkg-stats | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index cc91d13167..0f1521873f 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -512,7 +512,7 @@ async def check_package_get_latest_version_by_guess(session, pkg, retry=True):
 
             if len(projects) > 0:
                 check_package_latest_version_set_status(pkg,
-                                                        RM_API_STATUS_FOUND_BY_DISTRO,
+                                                        RM_API_STATUS_FOUND_BY_PATTERN,
                                                         projects[0]['version'],
                                                         projects[0]['id'])
                 return True
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
