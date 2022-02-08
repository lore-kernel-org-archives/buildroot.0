Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E225C433F5
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 21:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FDC9408DF;
	Tue,  8 Feb 2022 21:24:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sc1iCl053LMx; Tue,  8 Feb 2022 21:24:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A6464024D;
	Tue,  8 Feb 2022 21:24:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2CB631BF9A4
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 21:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BC0181360
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 21:24:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9MOYL9iiChrO for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 21:24:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7E9281350
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 21:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644355447;
 bh=VPOFTIpXDmp4vonuPzbaa3C+SCD44Xnyne7QyVBVpSw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=cZka+dMOfBiUb6l+17eIo+1/3t2AVbYEIRoN8Ggo1TyM2+9ZTuaJ0Bm28BCdprCls
 wm/OYPh8iN4metZQ8tzExnvcvDfspNIzW/WqmOP1DG1H7VzN5E0W3++VsiK6KKnMcF
 ldjXFFrdLrCEH3App8bFfI3ggA1SLEY08oinbd74=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.59]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MoO24-1o60zu3V9c-00omz7; Tue, 08
 Feb 2022 22:24:06 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue,  8 Feb 2022 22:23:54 +0100
Message-Id: <20220208212405.19243-3-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208212405.19243-1-ps.report@gmx.net>
References: <20220208212405.19243-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:cbg+0l3mAY2kc1n9bT3IN8MlE+mOWZpVLZZpDIvkLBBMluzqZC0
 cvYtOOxPg4Zdusn30CdjKayWWnVp3hCBUaNi6p7eAQROEws+iYE6a6yAP+7MFyBpYwoo+kg
 Dsw6NJXExgPlWNtK7Bu2nafV4LUIOuTfBTz4tlLeRuzUALI3ZGyW/No+aXJ3BXxk49q5JR6
 gjaIZDiF//mQsW5tNBz4A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:n6qV4w+3Zb4=:7MwV9/vuj+Ic3iEYJXmlz/
 Y8eKyURLPHXlF2djsFaCzz0LVh5QW6n8GARV1ZvYp/VL3IjL/4FscxLUtrnxWtbOveHNGWlRO
 9hXVOcdy/Zo6+8xXDS1aDpTJm8Aw+kPzswiyI7nf3xYXuyVLsdCO6q583lOH86V6HSchdEfcb
 gVe0S5sZ2MBlCZP/Ul9FT/SHwoq4QapFjXCCo7qwqEdz/iSfaW+569pEMMScUpFBm4FyNJfV0
 sR4cWB4ECPrY/DtIw8AFz7Z0kra7kGPcC5j+FnUd7fyQvcLGpQBDEV1TlmwSjmjrKz5qce4Va
 Vcu6N28/BD5J4wvEoZq64cfTz7chXSVI+heSGPBIzNEkVq8mT8sgS/D/QXkbPONo9xd941qzo
 bGCGNs6Q5ODnjWbpqnKlahUJhtITqzgOuzw4qfwGPfyM/ziW5g/p5d2Q7TGcnA4gjmZIlk4+F
 4WTzmdVoQcTJUAmssvjkkmJpWupuT9K8H8PG+K7HeD/b8VNkUjIuBCLKRzsyHr3Zz7nN9TSAO
 p1VI349/s/gZsRyDY7B+UuRpPIp7Dn2fvyBw5ieE7UkYoCTVYRodsL1fdc88dH4tcNuVeoR50
 3pUpRdAYGWS6286RTdBXman3EeuQs6w0oz7vd6+VRyQNJ6pWC9sBmnCoze/cJzw/mUooinLa/
 4Uk+fFnC9w6SMILzxjgdVjJ/9mqzums1ZMnN/cZiUjubjbtS+Mpe98mQiehoMyzIviKqDTw8F
 a6FNDy0PPvX6ppCGBQBTzniIW+xwbmU/VRPH94EnFAs7Bz5HpVb6cwHY7dd+74X8v4rZyjTn5
 ZHM+jSI3eWyKKHfbU3kCkFu0a9jviOYsxopswjR7VQuElLjdiYCeOOUCSmC5DPCqE+IMdVd9g
 BgBBBQDMD1BHHKYu+rGFzKDlusZE5zk1joH5C/p0Vh3cZQdhX3hmUXP7MxPLKfOdbcYi48z2i
 sQtQYOGCBOxqhAeHK0TL0J6hS+TuUBr/rTi+GQb1YopU7dNgSisZvbf2rCtGcVRuanE0295fq
 wqmBhRyUw7K2AbSw52UKdBaz0Y67uxgyYqwbciqdcnZ0mHSerDTWH2EibniH4SpkbAuLA59s1
 AUpr3yxW3/NSfE=
Subject: [Buildroot] [PATCH v1 02/13] package/gst1-plugins-base: bump
 version to 1.20.0
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
Cc: Eloi Bail <eloi.bail@savoirfairelinux.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- disable new qt5 (Qt5 QML examples) option (suboption of already disabled
  tests/examples)

- update COPYING hash (license text update from LGPL-2.0+ to LGPL-2.1+,
  see [1]) and adjust GST1_PLUGINS_BASE_LICENSE accordingly

[1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/d157b23fb0ce175b167611a4cb019599d9017042.patch

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash | 6 +++---
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk   | 5 +++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
index 081dc6f213..ffc3445cda 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.18.6.tar.xz.sha256sum
-sha256  56a9ff2fe9e6603b9e658cf6897d412a173d2180829fe01e92568549c6bd0f5b  gst-plugins-base-1.18.6.tar.xz
-sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING
+# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.20.0.tar.xz.sha256sum
+sha256  4cb66fccf730b1037e6533862c2128990912a6db4e5bbd14e0ef914450eb4c7c  gst-plugins-base-1.20.0.tar.xz
+sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index c99eeb6c59..68281738fa 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BASE_VERSION = 1.18.6
+GST1_PLUGINS_BASE_VERSION = 1.20.0
 GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
 GST1_PLUGINS_BASE_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES
 GST1_PLUGINS_BASE_LICENSE_FILES = COPYING
-GST1_PLUGINS_BASE_LICENSE = LGPL-2.0+, LGPL-2.1+
+GST1_PLUGINS_BASE_LICENSE = LGPL-2.1+
 
 GST1_PLUGINS_BASE_CONF_OPTS = \
 	-Dexamples=disabled \
@@ -17,6 +17,7 @@ GST1_PLUGINS_BASE_CONF_OPTS = \
 	-Dgobject-cast-checks=disabled \
 	-Dglib-asserts=disabled \
 	-Dglib-checks=disabled \
+	-Dqt5=disabled \
 	-Ddoc=disabled
 
 # Options which require currently unpackaged libraries
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
