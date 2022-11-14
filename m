Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE4CC4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 12:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D5EF81DE5;
	Mon,  5 Dec 2022 12:13:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D5EF81DE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xXEEOZSarfH9; Mon,  5 Dec 2022 12:13:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA7FC81E05;
	Mon,  5 Dec 2022 12:13:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA7FC81E05
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 691F71BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 103A2408D7
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 103A2408D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IYpiHfW9tobR for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8214C40895
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8214C40895
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 755B685B9E; Mon,  5 Dec 2022 11:26:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 14 Nov 2022 23:03:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d31447bce49e44e5085fb333528fe70772fc01d2
X-Git-Newrev: 3d8b6e9e253f2abf7469f41093b520da33c28374
X-Patchwork-Hint: ignore
Message-Id: <20221205112609.755B685B9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sbc: add config option to control
 tools build
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

commit: https://git.buildroot.net/buildroot/commit/?id=3d8b6e9e253f2abf7469f41093b520da33c28374
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libsndfile is only needed by the sbctester utility and the library can
be built without this dependency.

Add a config option to cover not just sbctester but the command-line
utilities as well.  While the utilities may be useful for debugging,
normal usage will only need libsbc and these applications can be
omitted.

Signed-off-by: John Keeping <john@metanate.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sbc/Config.in | 11 ++++++++++-
 package/sbc/sbc.mk    | 12 ++++++++++--
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/package/sbc/Config.in b/package/sbc/Config.in
index f1dbc0ec2c..4d1f6297f7 100644
--- a/package/sbc/Config.in
+++ b/package/sbc/Config.in
@@ -1,8 +1,17 @@
 config BR2_PACKAGE_SBC
 	bool "sbc"
-	select BR2_PACKAGE_LIBSNDFILE
 	help
 	  An audio codec to connect bluetooth high quality audio
 	  devices like headphones or loudspeakers.
 
 	  http://www.bluez.org/
+
+if BR2_PACKAGE_SBC
+
+config BR2_PACKAGE_SBC_TOOLS
+	bool "tools"
+	select BR2_PACKAGE_LIBSNDFILE
+	help
+	  Build the command-line SBC tools as well as the library.
+
+endif
diff --git a/package/sbc/sbc.mk b/package/sbc/sbc.mk
index 744ce5f895..7a37a99643 100644
--- a/package/sbc/sbc.mk
+++ b/package/sbc/sbc.mk
@@ -8,8 +8,16 @@ SBC_VERSION = 2.0
 SBC_SOURCE = sbc-$(SBC_VERSION).tar.xz
 SBC_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 SBC_INSTALL_STAGING = YES
-SBC_DEPENDENCIES = libsndfile host-pkgconf
-SBC_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (library)
+SBC_DEPENDENCIES = host-pkgconf
+SBC_LICENSE := LGPL-2.1+ (library)
 SBC_LICENSE_FILES = COPYING COPYING.LIB
 
+ifeq ($(BR2_PACKAGE_SBC_TOOLS),y)
+SBC_DEPENDENCIES += libsndfile
+SBC_CONF_OPTS += --enable-tools --enable-tester
+SBC_LICENSE += , GPL-2.0+ (programs)
+else
+SBC_CONF_OPTS += --disable-tools --disable-tester
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
