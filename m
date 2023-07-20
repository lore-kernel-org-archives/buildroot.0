Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABBA5EB64DD
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 21:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 371C161261;
	Thu, 20 Jul 2023 21:15:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 371C161261
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I4fn3UjMV6NW; Thu, 20 Jul 2023 21:15:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CC9160A64;
	Thu, 20 Jul 2023 21:15:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CC9160A64
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5C14D1BF4D8
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 433F48272D
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:15:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 433F48272D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lYc2_h5qgqNA for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 21:15:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C344982233
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 21:15:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C344982233
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B08BD874B0; Thu, 20 Jul 2023 21:15:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Jul 2023 23:15:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 79f3d7af7ee2a6ea1a2a78473e572be8902a368b
X-Git-Newrev: 3cd014c71687cc51542b1bec94d167f8c16d1d8f
X-Patchwork-Hint: ignore
Message-Id: <20230720211516.B08BD874B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pound: fix pcre2 detection
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

commit: https://git.buildroot.net/buildroot/commit/?id=3cd014c71687cc51542b1bec94d167f8c16d1d8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Without this fix configure finds the host version of pcre2-config:
checking for pcre2-config... /home/autobuild/autobuild/instance-3/output-1/host/bin/pcre2-config

Fixes:
http://autobuild.buildroot.net/results/1b9/1b98078a28b478018cf60bae35974cb4033e2af0/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pound/pound.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pound/pound.mk b/package/pound/pound.mk
index 550da10513..7bd7eaef2a 100644
--- a/package/pound/pound.mk
+++ b/package/pound/pound.mk
@@ -18,6 +18,8 @@ POUND_CONF_OPTS = \
 
 ifeq ($(BR2_PACKAGE_PCRE2),y)
 POUND_CONF_OPTS += --enable-pcreposix=pcre2
+POUND_CONF_ENV += \
+	ac_cv_path_PCRE2_CONFIG=$(STAGING_DIR)/usr/bin/pcre2-config
 POUND_DEPENDENCIES += pcre2
 else ifeq ($(BR2_PACKAGE_PCRE),y)
 POUND_CONF_OPTS += --enable-pcreposix=pcre1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
