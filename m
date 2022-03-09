Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7A2C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 23:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D2354185C;
	Wed,  9 Mar 2022 23:07:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A1KyL5LW4I-u; Wed,  9 Mar 2022 23:07:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E11041856;
	Wed,  9 Mar 2022 23:07:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DEE281BF2F7
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 23:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD67760C2D
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 23:07:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=rockwellcollins.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SvWwNt0OcAhD for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 23:07:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from da1vs05.rockwellcollins.com (da1vs05.rockwellcollins.com
 [205.175.227.130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C051D60AF0
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 23:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rockwellcollins.com; s=hrcrc2020;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yYBU0Ff8Hv6vOGQFatDlCycpi56Rt/yx0o3v8Wo5KLE=;
 b=Ml6wAfi8+2StsUZn1UwSHKmRuKKxH7jnaLf9M0qCY5OXPPtlHGf1ezyU
 MHVDNVx6Eq/bdm0CW3o9Z4Dg97RTA4uWgqLzcLTTK/ykxgmXdISwJBzOb
 7tEnTe0K97Qtonx7E4Ic0zQmcNKaz0s2/LBziNCkF+5wlW2R/Ej1HEHbc
 xvO6aoMXqmV6H9n17L9L3lEXyomSGd4XARvHBkU2Vxa+WHBKnZAb+rwgw
 hdz32Jn1wq7JmfAnR/jC2xkmWK1VgUcq7D228jANsZueb7AEKZbwSmECC
 +ycEIqK1BFNEJa6Z5LIQsfErJDZTKMJWwEdfYWq6NVZNjzf/MYJ5NZv5Y w==;
IronPort-SDR: xVLcxuDXne6F/92z1GraPj3vyEBWEpe8sicS4F8Vd6yyGwk9/fFUHVgvZYQmIfKdmhUia6gsx2
 7r3euwnt3GuZIblSDJs254vbj18tbRQe5NcEu3gI3ZeDoAehXJmQXmQBZA577n/zM/PbQ+xSAG
 /VzN9MxvmyCoTnIS06jcM0xce4ALsFJ34c1xxRumvejB/zlxhyj8R0nZmY2mLSXO6qJz8wqm44
 ItHnpbSGgeY+TpoP4188ayJMAFjKGLwCqvqOCutI+Tz/Zz49rh6FYTjcTzEIIp/w0ONICAHYPu
 szU=
Received: from ofwda1n02.rockwellcollins.com (HELO
 dtulimr01.rockwellcollins.com) ([205.175.227.14])
 by da1vs05.rockwellcollins.com with ESMTP; 09 Mar 2022 17:07:49 -0600
X-Received: from righttwix.rockwellcollins.com (righttwix.rockwellcollins.com
 [192.168.141.218])
 by dtulimr01.rockwellcollins.com (Postfix) with ESMTP id A668A60293;
 Wed,  9 Mar 2022 17:07:48 -0600 (CST)
From: clayton.shotwell@rockwellcollins.com
To: buildroot@buildroot.org
Date: Wed,  9 Mar 2022 17:07:45 -0600
Message-Id: <20220309230745.143885-1-clayton.shotwell@rockwellcollins.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] fs: Change default fakeroot shell to bash
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
Cc: Clayton Shotwell <clayton.shotwell@collins.com>, matthew.weber@collins.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Clayton Shotwell <clayton.shotwell@collins.com>

The addition of the removal of the /run and /tmp contents using a
non-POSIX pattern causes the file system creation to fail on systems
where /bin/sh does not default to bash. Switching the fakeroot script
to a bash shell addresses the problem.

Fixes:
https://bugs.buildroot.org/show_bug.cgi?id=14661

Signed-off-by: Clayton Shotwell <clayton.shotwell@collins.com>
---
 fs/common.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/common.mk b/fs/common.mk
index 45beb5ae7b..09edf41c21 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -172,7 +172,7 @@ $$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME): $$(ROOTFS_$(2)_DEPENDENCIES)
 		$$(BASE_TARGET_DIR)/ \
 		$$(TARGET_DIR)
 
-	echo '#!/bin/sh' > $$(FAKEROOT_SCRIPT)
+	echo '#!/bin/bash' > $$(FAKEROOT_SCRIPT)
 	echo "set -e" >> $$(FAKEROOT_SCRIPT)
 
 	echo "chown -h -R 0:0 $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
-- 
2.29.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
