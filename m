Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56569C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 10:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1616F80BA2;
	Tue, 23 Jul 2024 10:24:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ST17hVIKuVk0; Tue, 23 Jul 2024 10:24:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B35180C67
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B35180C67;
	Tue, 23 Jul 2024 10:24:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E4FC71BF20F
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 10:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF249403B3
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 10:24:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6cbwN35rhzBC for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 10:24:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3B18400B5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3B18400B5
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 10:24:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C711187316; Tue, 23 Jul 2024 10:24:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 12:23:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1395330fe6d9729bd46ad3a6c6497ee6e5a66487
X-Git-Newrev: ef420e2016c4f1746e9aa72e160639e14ae7f406
X-Patchwork-Hint: ignore
Message-Id: <20240723102406.C711187316@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mtd: fix zlib build
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

commit: https://git.buildroot.net/buildroot/commit/?id=ef420e2016c4f1746e9aa72e160639e14ae7f406
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit bb19ffeaab5ba4be0a1033ca326b25d4d4e8203f forgot to move
host-pkgconf dependency from BR2_PACKAGE_MTD_JFFS_UTILS condition to the
new BR2_PACKAGE_ZLIB condition resulting in the following build failure:

hecking for ZLIB... no
configure: error: cannot find zlib

Fixes: bb19ffeaab5ba4be0a1033ca326b25d4d4e8203f
 - http://autobuild.buildroot.org/results/7cbeead738af6302d5f0048a443e3b57d6776bb2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mtd/mtd.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index fe40cf6c06..d3444c88f2 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -28,7 +28,7 @@ MTD_CONF_OPTS += --without-lzo
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-MTD_DEPENDENCIES += zlib
+MTD_DEPENDENCIES += host-pkgconf zlib
 MTD_CONF_OPTS += --with-zlib
 else
 MTD_CONF_OPTS += --without-zlib
@@ -37,7 +37,6 @@ endif
 MTD_CONF_ENV += LDFLAGS="$(MTD_LDFLAGS)"
 
 ifeq ($(BR2_PACKAGE_MTD_JFFS_UTILS),y)
-MTD_DEPENDENCIES += host-pkgconf
 MTD_CONF_OPTS += --with-jffs
 else
 MTD_CONF_OPTS += --without-jffs
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
