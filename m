Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFFAC47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 20:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65087437EE;
	Wed, 10 Jan 2024 20:22:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65087437EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bWyEx3i_gm_p; Wed, 10 Jan 2024 20:22:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43DC9437C5;
	Wed, 10 Jan 2024 20:22:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43DC9437C5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 08C731BF97F
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9D2A436D7
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:22:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9D2A436D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RQ4qq7K_vqd6 for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 20:22:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F2AC436D6
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:22:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F2AC436D6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 884FC85D61; Wed, 10 Jan 2024 20:22:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 20:29:50 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 628138f7e8d340a250f5652b38a9ab0385a5b947
X-Git-Newrev: 095c5f78e4f02e4b674c2898193dcb78dee5c5d2
X-Patchwork-Hint: ignore
Message-Id: <20240110202203.884FC85D61@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] Config.in: rework
 BR2_DOWNLOAD_FORCE_CHECK_HASHES
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

commit: https://git.buildroot.net/buildroot/commit/?id=095c5f78e4f02e4b674c2898193dcb78dee5c5d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

BR2_DOWNLOAD_FORCE_CHECK_HASHES currently has the following
dependency:

	depends on BR2_GLOBAL_PATCH_DIR != ""

However, strictly speaking checking all hashes does not necessarily
require using BR2_GLOBAL_PATCH_DIR, as long as you don't use custom
versions.

But more importantly:

- Having this dependency means that this options is hidden when people
  don't use BR2_GLOBAL_PATCH_DIR. Instead the option should always be
  made visible, encouraging people to turn it on.

- The Config.in comment was there to mitigate this previous argument,
  but this comment then shows up all the time when you have an empty
  global patch dir.

This seems over-complicated, and it sounds much easier to have the
option unconditionally available, and visible, and clarify in its help
text that in order to this to work fully with custom package versions,
BR2_GLOBAL_PATCH_DIR can be used to provide extra hash files.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998@free.fr:
  - fix typo noticed by Peter K.
  - reword kast sentence after review by Peter K.
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5b0c02a77ac13489a625db7b60a204a64cfc37cb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/Config.in b/Config.in
index a6cbdbc00f..c814416d9a 100644
--- a/Config.in
+++ b/Config.in
@@ -701,20 +701,18 @@ config BR2_FORCE_HOST_BUILD
 
 config BR2_DOWNLOAD_FORCE_CHECK_HASHES
 	bool "Force all downloads to have a valid hash"
-	depends on BR2_GLOBAL_PATCH_DIR != ""
 	help
-	  For packages where a custom version or location can be set,
-	  Buildroot does not carry a hash for those custom versions or
-	  locations, so the integrity of such downloads is not verified.
-
 	  Say 'y' here to enforce downloads to have at least one valid
 	  hash (and of course, that all hashes be valid).
 
-	  Those hashes are looked in files in BR2_GLOBAL_PATCH_DIR,
-	  see above.
+	  By default, Buildroot checks hashes of all packages
+	  downloaded, except those for which a custom version is
+	  used.
 
-comment "Forcing all downloads to have a valid hash needs a global patch and hash directory"
-	depends on BR2_GLOBAL_PATCH_DIR = ""
+	  With this option turned on, Buildroot will check hashes of
+	  all packages, including those that use a custom version. In
+	  order to provide hashes for such packages, place additional
+	  hash files in BR2_GLOBAL_PATCH_DIR directories.
 
 config BR2_REPRODUCIBLE
 	bool "Make the build reproducible (experimental)"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
