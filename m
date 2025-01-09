Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF8EE77197
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 17:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5F1660BAE;
	Thu,  9 Jan 2025 17:03:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OSu4JwUOlXts; Thu,  9 Jan 2025 17:03:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F4F960BA5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F4F960BA5;
	Thu,  9 Jan 2025 17:03:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C87A76C
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 17:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22B23831FB
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 17:03:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1eI6CvLZXczW for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 17:03:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EA6E7831F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA6E7831F2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA6E7831F2
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 17:03:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b1c1.dip0.t-ipconnect.de [84.161.177.193])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2B257A4C43A5
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 18:03:27 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58760)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tVvwM-000000007Ej-3ZaQ
 for buildroot@buildroot.org; Thu, 09 Jan 2025 17:03:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  9 Jan 2025 18:03:24 +0100
Message-Id: <20250109170326.34279-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1736442207;
 bh=WGcBmYhpVtTOtkmV+3YAzoQK8KbA2+uCcHYcvFYrwYI=;
 h=From:To:Subject:Date:From;
 b=lJtUk9keCkfIOpNv28S8no6Cy4pJSoBfP9e9snx4dTwFK5MWvu4lXXG26rksGM0w5
 FRMkjFVSMHs8VUBHIThYUCvq0ta9MgwjTb8V+bJ3Xs2YBdUTMxJSk21qY6FvGd4DtI
 ZZty0wEu7LI1Tkb2vgm/+dUl5GQbvSw2Ngn8+h8WClBuXHR/uJ1rvMgoPGgHtGu9/o
 op6CX16H2JwtlrOuVKbbvgpRkjeMmoM8JccVKQlD0quR7FN7prxKqcO43ThiCvWiim
 mUeOQPlw4W9gs3NW48OJmg1hCjPsSBqpjOrJxeOJr2+wxjPMEwn8vfArMY/U497Oab
 sUisu1/bxXkeg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=lJtUk9ke
Subject: [Buildroot] [PATCH 1/3] package/kodi-peripheral-joystick: bump
 version to 21.1.20-Omega
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash | 2 +-
 package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
index a9d27bd70d..ba434e58b9 100644
--- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
+++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  226366b69536579d1adccb8548ba20c1b094876ce481bab81f744affa71bb305  kodi-peripheral-joystick-21.1.18-Omega.tar.gz
+sha256  f7304c4ec4897ce5bb345fcd9a81e2d8b144dadc4031cbc15d7dc1a770770c62  kodi-peripheral-joystick-21.1.20-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
index aceefba55a..cafd9004f1 100644
--- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
+++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PERIPHERAL_JOYSTICK_VERSION = 21.1.18-Omega
+KODI_PERIPHERAL_JOYSTICK_VERSION = 21.1.20-Omega
 KODI_PERIPHERAL_JOYSTICK_SITE = $(call github,xbmc,peripheral.joystick,$(KODI_PERIPHERAL_JOYSTICK_VERSION))
 KODI_PERIPHERAL_JOYSTICK_LICENSE = GPL-2.0+
 KODI_PERIPHERAL_JOYSTICK_LICENSE_FILES = LICENSE.md
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
