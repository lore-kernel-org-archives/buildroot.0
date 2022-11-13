Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82DCBC4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 21:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1EDAD405A7;
	Sun, 13 Nov 2022 21:54:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EDAD405A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1yUbqOhI3BlH; Sun, 13 Nov 2022 21:54:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 440EF405B1;
	Sun, 13 Nov 2022 21:54:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 440EF405B1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 108741BF3AF
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E06534058B
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:54:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E06534058B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I9i2CnLlPLYe for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 21:54:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17CFC405A4
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 21:54:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17CFC405A4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0765983846; Sun, 13 Nov 2022 21:54:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 22:53:59 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 16cf45d5ddfbeec3a715a36d3cdd3f75929104bd
X-Git-Newrev: 3a96199ca1132dc75fbc20130fee40c2491d011a
X-Patchwork-Hint: ignore
Message-Id: <20221113215424.0765983846@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/udisks: add config
 option to support mounting in /media
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

commit: https://git.buildroot.net/buildroot/commit/?id=3a96199ca1132dc75fbc20130fee40c2491d011a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Support mounting in /media instead of /run/media for compatibility
with the Filesystem Hierarchy Standard (FHS). This is also required
for backward compatibility with udisks1.

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/udisks/Config.in | 10 ++++++++++
 package/udisks/udisks.mk |  7 ++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/package/udisks/Config.in b/package/udisks/Config.in
index a3a0f82144..7def58c3a6 100644
--- a/package/udisks/Config.in
+++ b/package/udisks/Config.in
@@ -49,3 +49,13 @@ comment "udisks needs a toolchain with dynamic library, locale, wchar, threads,
 
 comment "udisks can't be built with Optimize for fast"
 	depends on BR2_OPTIMIZE_FAST
+
+if BR2_PACKAGE_UDISKS
+
+config BR2_PACKAGE_UDISKS_FHS_MEDIA
+	bool "Mount devices in /media instead of /run/media"
+	help
+	  Support mounting in /media for compatibility with the
+	  Filesystem Hierarchy Standard (FHS)
+
+endif
diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
index 959333d01f..840f552b04 100644
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -29,7 +29,6 @@ UDISKS_CONF_OPTS = \
 	--disable-acl \
 	--disable-bcache \
 	--disable-btrfs \
-	--disable-fhs-media \
 	--disable-introspection \
 	--disable-iscsi \
 	--disable-lsm \
@@ -40,4 +39,10 @@ UDISKS_CONF_OPTS = \
 	--disable-vdo \
 	--disable-zram
 
+ifeq ($(BR2_PACKAGE_UDISKS_FHS_MEDIA),y)
+UDISKS_CONF_OPTS += --enable-fhs-media
+else
+UDISKS_CONF_OPTS += --disable-fhs-media
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
