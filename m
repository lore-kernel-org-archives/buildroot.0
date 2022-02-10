Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 113A1C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 19:29:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBC0E60B68;
	Thu, 10 Feb 2022 19:29:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TwivsLm7XYAH; Thu, 10 Feb 2022 19:29:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECDBA607F9;
	Thu, 10 Feb 2022 19:29:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E46D41C1135
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 19:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D28DA40873
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 19:29:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IntZonGYkcJY for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 19:29:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 88D7340872
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 19:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644521346;
 bh=VPOFTIpXDmp4vonuPzbaa3C+SCD44Xnyne7QyVBVpSw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=biUO/rYZqRKJ8vnOLKohmKHzTYBlavuKlepQPx3kQigbnGUBR/vhl2KD+yMaMYSe1
 ZWQjSlZehurrfma+PAY8FKByK6P9aolQcaW5/Qh4riSZ2zijFqSiXHD8UhOteOJSRD
 TYj7ViRnRLjeyQUq6Sa5/fWxWRI7KJ4eoGzhh++w=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.34]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MHXFr-1nV9Ix1Yyf-00DYzo; Thu, 10
 Feb 2022 20:29:06 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 10 Feb 2022 20:28:54 +0100
Message-Id: <20220210192905.4500-3-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220210192905.4500-1-ps.report@gmx.net>
References: <20220210192905.4500-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:qoxIwJpMdkbU0n7VBmCN3b1AW8yk+/U/OU41HA8wON3uSEu171W
 MoUY+lR4aub98/FOtbVZrFOX8U+90SNherKmDCalZsLZU32KTboJAq9a/orcrjtlkyLLaVG
 fAVfqXzIky6b2cu4gzaLDPYkVkJrCoGwcV/H0KQ7PHlXTZYRFOMDpFJVsrcgKuV9hetg4hx
 UBFpERDHOvQh4f8VkyvAQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Okywflb3KXg=:kIOpNbcVKsPk+OtUcbjM5D
 dGK+nENeZ6TcktRQHDgWmTgi/HznKA/3dqtaOzJfHGMbcYR8JRp9tM2P82m6bMiKYKYqrv20z
 HdDLm/MCAs0A3VxpaoNrCDUi5tC1dvOMnpOTBF0HLoNujyH4iMmcE9DoQC5ytyNWFwsQV/UB0
 0GkvIyEK497edS+2AredJhlx3X/zgsmDouJTQg5ZGQ05qYVIoTbsG9DEVMHNHYYpsR+WEbQnn
 jLrD9cGPbrz/YEO/SScmTKZk9eDQTPEnHfeQoszJwzp2UM4xT5a7j0hR1NQjCoBLmcEbL73Q0
 mMgrahi4UiScpGeADzKRUXnmJSfbK3umczqKGs7wobtOGt2QWEZ+FoJFGCtA85jVG12ofm0tL
 2knfVaD3ulZ+BiRvp6PTIp6m6lRicTaROz8H76Hh5t9zCd2ganZqu95JniiLJT5M+q10enGla
 SklMV9PPTOCT6VhMB9Z7/ZWbwUa0Lkh/0aHuTh0DeaiLZnnX/wtvYwKmu3i3qCccvHw/ml0h3
 +e33PLHvWsJJS8AsSpXtdoHZM+SQLuK5bRW7nmNqyk8KLfWXsy0sLznxbG9sBtjvFjcblIKQ7
 KaLeg55QUFPyBM/i2MwigyMJ2JJUcM4mrh59mcS3EUyzCQNmiY4Iu7wPuQMaC1zShk1qBvIso
 gTJmIuRacnkgG/dKEJb+TWse54THBXGIfvAgxrtES/mMWXt5APWGH/YCLA3GgXT5XbMKBrRr9
 YdKpZ6YeO6SSzsWcwLlDnWPCvfhM7OkEdzD/en1mREIZNwCb100UGkpHVLM5uNXll092bP7gu
 qiMx3Js9WaR+3cu43T6tOVen+zYFV+5078XkestoLKmFDVSHn6zuzhIyOT2Rnt9UnkxfcNXAT
 8Qrt19wZakHf6uXHe6ePEXeFWgNnffRvXuaRFLP4ja2Hh2Hpn1Lv2IJ9AMWkTtCZPiS1C9FZ6
 Nd+TOZORZCIQD6Mn3sIkJ+NNwFURVAN7PuzKNvIr9ZVcuT/rP8B/btiVQMbjRwg7T4lFIChzY
 dVYZrW5AuTOhTIVIKlaqod0+GA7YQ1eIocuP2+YAolftf3HOgvAfTJMJTh2Kjl2pwGyY8pqs9
 7ycJdgBWimzAGs=
Subject: [Buildroot] [PATCH v2 02/13] package/gst1-plugins-base: bump
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
