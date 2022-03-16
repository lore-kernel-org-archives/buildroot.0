Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1BAEC433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 21:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86B4F40AA7;
	Wed, 16 Mar 2022 21:48:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TZeb_QMWcAJO; Wed, 16 Mar 2022 21:48:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49E3F4041C;
	Wed, 16 Mar 2022 21:48:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B7C0A1BF2C2
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4BA040262
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:48:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sWjPOW2UaZWh for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 21:48:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9CBFC40A00
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 21:48:52 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 833DCFF805;
 Wed, 16 Mar 2022 21:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647467329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=otDK47Pw/aUCRoGIhpg6CSAuDYJXijGO5ryw9o1vfjQ=;
 b=Pa1a9mY8TzHZ3Zph8o7KfRjNsk7J1VKIJGrXxvr3QvFs2cZNN/Q12DvMCDloGi5k2bQkeU
 CxHEHKj4u98UTPBC/YyW7quctzDhyl/8+W82gIi+JDxsSr/PnjFWoCkCkMZvambksrJr+0
 kGaKoUPjP3TEjvyWQDbEFgG78cY9mIN/ldT4ngFWOhHISqsy8p/ctZNLUR7UrNP8bxICdC
 Mj8VMa8BDeb57LmwKjWahc7LVEF3PB/nRkfsC3p3HL4fCDYkhJPmavaU4RnUHo4/opGg+/
 jKwIeWVdJY/w4IRJXdPXCD8bD9SuZ1/Moj2Mw9X/3qMq/UnIu1/8ExDx3U7sBA==
To: Buildroot List <buildroot@buildroot.org>
Date: Wed, 16 Mar 2022 22:48:46 +0100
Message-Id: <20220316214848.448925-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] support/scripts/pkg-stats: strengthen version
 check in check_package_get_latest_version_by_distro()
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 support/scripts/pkg-stats | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index c235d99407..f57041cee4 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -486,7 +486,12 @@ async def check_package_get_latest_version_by_distro(session, pkg, retry=True):
                 return False
 
             data = await resp.json()
-            version = data['stable_versions'][0] if 'stable_versions' in data else data['version'] if 'version' in data else None
+            if 'stable_versions' in data and len(data['stable_versions']) > 0:
+                version = data['stable_versions'][0]
+            elif 'version' in data:
+                version = data['version']
+            else:
+                version = None
             check_package_latest_version_set_status(pkg,
                                                     RM_API_STATUS_FOUND_BY_DISTRO,
                                                     version,
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
