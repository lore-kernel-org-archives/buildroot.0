Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E061C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 08:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCEB66114C;
	Sun, 18 Sep 2022 08:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCEB66114C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sfWIpmzEAB8q; Sun, 18 Sep 2022 08:56:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F00560E14;
	Sun, 18 Sep 2022 08:56:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F00560E14
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D398B1BF282
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 08:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDB3B60E14
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 08:56:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDB3B60E14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ipBZomWyNZpP for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 08:56:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7ECF660E2F
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 08:56:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7ECF660E2F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 661DF848D5; Sun, 18 Sep 2022 08:56:11 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 10:50:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0104521851e46acbd64e3597bcbef618ddb6f9f4
X-Git-Newrev: eb1e544ad6a7ff31ccfebf0888efcfb29d6bf89c
X-Patchwork-Hint: ignore
Message-Id: <20220918085611.661DF848D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6base: add qt support for
 zstd when using the package
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

commit: https://git.buildroot.net/buildroot/commit/?id=eb1e544ad6a7ff31ccfebf0888efcfb29d6bf89c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6base/qt6base.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 75f4decec2..b1695c3d27 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -129,5 +129,12 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_xml=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+QT6BASE_CONF_OPTS += -DFEATURE_zstd=ON
+QT6BASE_DEPENDENCIES += zstd
+else
+QT6BASE_CONF_OPTS += -DFEATURE_zstd=OFF
+endif
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
