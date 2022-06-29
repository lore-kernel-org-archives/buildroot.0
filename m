Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01EFC43334
	for <buildroot@archiver.kernel.org>; Wed, 29 Jun 2022 07:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B453414C1;
	Wed, 29 Jun 2022 07:56:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B453414C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w3yiEoYkSo8t; Wed, 29 Jun 2022 07:56:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0273A410A6;
	Wed, 29 Jun 2022 07:56:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0273A410A6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A9D601BF57C
 for <buildroot@lists.busybox.net>; Wed, 29 Jun 2022 07:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8349A81A4E
 for <buildroot@lists.busybox.net>; Wed, 29 Jun 2022 07:56:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8349A81A4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HdRc75Hbt-v8 for <buildroot@lists.busybox.net>;
 Wed, 29 Jun 2022 07:56:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27733819FC
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 27733819FC
 for <buildroot@buildroot.org>; Wed, 29 Jun 2022 07:56:03 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B176D20015;
 Wed, 29 Jun 2022 07:56:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 29 Jun 2022 09:55:59 +0200
Message-Id: <20220629075600.1506639-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1656489361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=DufXcXa6GIO2KeQcxewOWfFzEWi4G29X09Zdu26gXxc=;
 b=eFDT7PJ5xrTzUvS5GUwzAreCzmUvK2EkLEOa6mn/TaMj+ec7t4FccE3/+w9M9qY7SNTiYZ
 KdwKKr+rcFweFUNvSTtzuOiQyae7YPctDvls5P8CrqT4OgqVMpwwv1IGe4G0HAGqfQiZAA
 1sY3omSdztRfhi/kAeP2Qd4b8v9c7uD7bKfNahe+GJOtOXutCieTOmqjTEAzg6VptOennm
 gkkUTlLJ/xLmFCVj2VCEDTSBg/N6gn5oONl5SNNVomWzGukWu8crMtnzZw3yyBg4iBi9kA
 v0UP2ieQLSySLaUaCHu9VfydYq41Xjyp/OK6sD3SLV2lV6eYkwOV6H3mfPHsZg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eFDT7PJ5
Subject: [Buildroot] [PATCH] utils/genrandconfig: Add optee-os custom
 tarball handler
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
From: =?utf-8?q?K=C3=B6ry_Maincent_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>
Cc: Kory Maincent <kory.maincent@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Kory Maincent <kory.maincent@bootlin.com>

Add a handler to make sure that a random configuration with empty tarball
location doesn't fail. It reverts to BR2_TARGET_OPTEE_OS_LATEST in that
case.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 utils/genrandconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 6f748fa709..75757917c2 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -463,6 +463,13 @@ def fixup_config(sysinfo, configfile):
         configlines.remove('BR2_TARGET_BAREBOX_USE_DEFCONFIG=y\n')
         configlines.remove('BR2_TARGET_BAREBOX_BOARD_DEFCONFIG=""\n')
 
+    if 'BR2_TARGET_OPTEE_OS=y\n' in configlines and \
+       'BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL=y\n' in configlines and \
+       'BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL_LOCATION=""\n' in configlines:
+        configlines.remove('BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL=y\n')
+        configlines.append('BR2_TARGET_OPTEE_OS_LATEST=y\n')
+        configlines.remove('BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL_LOCATION=""\n')
+
     if 'BR2_TARGET_OPTEE_OS=y\n' in configlines and \
        'BR2_TARGET_OPTEE_OS_PLATFORM=""\n' in configlines:
         configlines.remove('BR2_TARGET_OPTEE_OS=y\n')
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
