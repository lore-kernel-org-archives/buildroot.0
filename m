Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC70EC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:15:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CE4360184
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:15:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6CE4360184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 483BA4059A;
	Tue,  3 Aug 2021 22:15:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V4REhEW9plpx; Tue,  3 Aug 2021 22:15:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85C22405C4;
	Tue,  3 Aug 2021 22:15:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 186301BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 656C940435
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OzI9Oeh8h0Sp for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 046AC404BE
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4ADB283875; Tue,  3 Aug 2021 21:09:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 19 May 2021 10:14:31 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9b83bb13826ac3c34e6fb67a5092d94d98ca6a5d
X-Git-Newrev: 9368f3f23d2e86084018811b2df293d5e129e4ed
X-Patchwork-Hint: ignore
Message-Id: <20210803210941.4ADB283875@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/scripts/pkg-stats: add
 is_actual_package() and rework has_valid_infra()
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=9368f3f23d2e86084018811b2df293d5e129e4ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

has_valid_infra() is incorrectly named; it probably should be named
is_actual_package(), and has_valid_infra() would be changed to
actually represent having an actual infra.

This resolves packages reporting as having no valid package infra and
cleans up reporting cases of CPE and CVEs where there isn't a valid version
or package definition outside Buildroot

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Matthew Weber <matthew.weber@collins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/pkg-stats | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 42c36f7f94..0c34388066 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -131,7 +131,15 @@ class Package:
 
     @property
     def has_valid_infra(self):
+        if self.infras is None:
+            return False
+        return len(self.infras) > 0
+
+    @property
+    def is_actual_package(self):
         try:
+            if not self.has_valid_infra:
+                return False
             if self.infras[0][1] == 'virtual':
                 return False
         except IndexError:
@@ -159,7 +167,7 @@ class Package:
         """
         Fills in the .status['license'] and .status['license-files'] fields
         """
-        if not self.has_valid_infra:
+        if not self.is_actual_package:
             self.status['license'] = ("na", "no valid package infra")
             self.status['license-files'] = ("na", "no valid package infra")
             return
@@ -177,7 +185,7 @@ class Package:
         """
         Fills in the .status['hash'] field
         """
-        if not self.has_valid_infra:
+        if not self.is_actual_package:
             self.status['hash'] = ("na", "no valid package infra")
             self.status['hash-license'] = ("na", "no valid package infra")
             return
@@ -192,7 +200,7 @@ class Package:
         """
         Fills in the .patch_count, .patch_files and .status['patches'] fields
         """
-        if not self.has_valid_infra:
+        if not self.is_actual_package:
             self.status['patches'] = ("na", "no valid package infra")
             return
 
@@ -220,7 +228,7 @@ class Package:
         Fills in the .cpeid field
         """
         var = self.pkgvar()
-        if not self.has_valid_infra:
+        if not self.is_actual_package:
             self.status['cpe'] = ("na", "no valid package infra")
             return
 
@@ -551,13 +559,13 @@ async def check_package_latest_version(packages):
       package, as known by release-monitoring.org
     """
 
-    for pkg in [p for p in packages if not p.has_valid_infra]:
+    for pkg in [p for p in packages if not p.is_actual_package]:
         pkg.status['version'] = ("na", "no valid package infra")
 
     tasks = []
     connector = aiohttp.TCPConnector(limit_per_host=5)
     async with aiohttp.ClientSession(connector=connector, trust_env=True) as sess:
-        packages = [p for p in packages if p.has_valid_infra]
+        packages = [p for p in packages if p.is_actual_package]
         for pkg in packages:
             tasks.append(asyncio.ensure_future(check_package_latest_version_get(sess, pkg, len(packages))))
         await asyncio.wait(tasks)
@@ -578,7 +586,7 @@ def check_package_cves(nvd_path, packages):
 
     cpe_product_pkgs = defaultdict(list)
     for pkg in packages:
-        if not pkg.has_valid_infra:
+        if not pkg.is_actual_package:
             pkg.status['cve'] = ("na", "no valid package infra")
             continue
         if not pkg.current_version:
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
