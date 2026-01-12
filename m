Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A1FBD25050
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6082160724;
	Mon, 12 Jan 2026 08:41:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WD0s65IdoEje; Mon, 12 Jan 2026 08:41:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87B4F6074F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207268;
	bh=crBW5qHNClYuPSC6Gvsjgkc/2M5spyHvcvwCDVdKaeA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HOPhlSl5aLGkbXErA7zBjoPEtCi5sI1BDsVnOvO4DLBRFvJ8bHOpgKSYZ8XAfVYd3
	 58p8b9Jbmut77CfsMbGURre9VMh0F03TY2Tg7jN7ghFGVl3y1C2WEDBXJGaLO08KpH
	 5HFRHAfO8O6WJ30oFqcDz0FLl3llA0fabP9ESLFNvqiGayIMd3FC6YbH5n9QVh0Rqw
	 K8dxuPkOa56YCj+pLBX4fBZIU1uT+BYJumEIP+XclBtu1McpdA9COZqen6bxj9QeEX
	 mG8PiPHxusnL4Kiu7lKn2rx2QVrkqLmbeiKPLMZLg8IjBpovyrlr7VXykSbxXENIh2
	 sfcYsSp2RSveQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87B4F6074F;
	Mon, 12 Jan 2026 08:41:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C00D71CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A707040052
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:41:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9vVVV5FyWjd9 for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:41:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8E3D54004D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E3D54004D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E3D54004D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:41:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 39651A4C31C5
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:42 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJ9-000000007z0-1BMC
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:28:15 +0100
Message-ID: <20260112082950.2528445-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206642;
 bh=dQcP/6te4PZf3YA09I1kuf+hymglemWd8If/3/1Qnlk=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=OQa7eHh6tDrnUIMX2x8JktHfimPfjIWCQQwFjJLyFFjCy5rOLu/hCwS1BKJqMRnDI
 q58+R7Q8UUz1O548CRymoAI94iHrR8s7AZopZ00l5xtJLIqb9tbDhv4/FFXCo/z7TN
 Z4bjb3M7fEMxjKmi877ucUX1MOIgq4jFnphOt1uut1JMri/wcpMkZt+5dJuSKrybg8
 VIPZ7Xm5xKwyrcVsWTjguVdH1J7iQmWme6x1NDbASG2i+Z2garwg7QV+TBax2FH4Dd
 rSKdwOSEGdS/i+bIk7yY8xk7HyoRfmcWa7lrPyeQ8AR5kck25ZVsusUXkgaKqp6NhH
 kXHR+KW2PmuTg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=OQa7eHh6
Subject: [Buildroot] [PATCH 007/102] package/x11r7/xapp_xkbcomp: security
 bump version to 1.5.0
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

https://lists.x.org/archives/xorg-announce/2025-December/003645.html
https://lists.x.org/archives/xorg-announce/2024-February/003450.html

Fixes CVE-2018-15863, CVE-2018-15861, CVE-2018-15859 & CVE-2018-15853:
https://lists.x.org/archives/xorg-announce/2025-December/003644.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash | 6 +++---
 package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash
index b626e50236..dfebd08e07 100644
--- a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash
+++ b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003283.html
-sha256  fa50d611ef41e034487af7bd8d8c718df53dd18002f591cca16b0384afc58e98  xkbcomp-1.4.6.tar.xz
-sha512  90e69dd1c78c28f77a5acc7821b43afec1b9ac4895bc6f3462b4902baaadc26f3869da69e3bd023b4bc74adb5f1be0c43ca24b3dab37ac9a479c5622684baa81  xkbcomp-1.4.6.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-December/003645.html
+sha256  2ac31f26600776db6d9cd79b3fcd272263faebac7eb85fb2f33c7141b8486060  xkbcomp-1.5.0.tar.xz
+sha512  d8ef4906261251e2600b3650660fbe88ed99a44694f1e59b433e0811f1ab5234c4f2f0b3647fa5372fb0f46b56eac60c0219a762bf1af0ab06226b63e4a6b081  xkbcomp-1.5.0.tar.xz
 # Locally computed
 sha256  6b833fdc05906ce57f016dc791db86830d49ee4da2861ce45806c50b3f4dda9e  COPYING
diff --git a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
index 61922c7cc9..97e131f353 100644
--- a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
+++ b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XKBCOMP_VERSION = 1.4.6
+XAPP_XKBCOMP_VERSION = 1.5.0
 XAPP_XKBCOMP_SOURCE = xkbcomp-$(XAPP_XKBCOMP_VERSION).tar.xz
-XAPP_XKBCOMP_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XKBCOMP_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XKBCOMP_LICENSE = MIT
 XAPP_XKBCOMP_LICENSE_FILES = COPYING
 XAPP_XKBCOMP_DEPENDENCIES = xlib_libX11 xlib_libxkbfile
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
