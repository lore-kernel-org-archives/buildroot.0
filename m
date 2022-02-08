Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5420C433EF
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 21:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D336410E3;
	Tue,  8 Feb 2022 21:25:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZiGoLRTnY67v; Tue,  8 Feb 2022 21:25:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C200B410D8;
	Tue,  8 Feb 2022 21:25:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 218DB1BF9A4
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 21:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0FE4340133
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 21:24:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Il0KAFUuI9rp for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 21:24:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C931D408CB
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 21:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644355449;
 bh=8IqmBG+vXyPPV3/D3GU/67y047LGNP+JNySunMiEhjU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Oat+FZB3MeVVjeKFUM8GR9ycqqk5XM1TGt5FW/jACnbfmnq2sY1icqRCPTcPRAQDf
 uMXL1iLQtaV5Gvr4ssydxGp8i5zoAhCWxaWby+ycEofGrS4YHDxRXPhdF7aOtxK3D4
 mCWSiVIu2aau6za8svvzOpO8IT6hv1eVZMfRHmVY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.59]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M9Fnj-1nMkMY0CWd-006M0g; Tue, 08
 Feb 2022 22:24:09 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue,  8 Feb 2022 22:24:04 +0100
Message-Id: <20220208212405.19243-13-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208212405.19243-1-ps.report@gmx.net>
References: <20220208212405.19243-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:3n98ycW2tVucgeG0Bp0KmiWHfJi/xT1kxx09t4EG9O8L9r6BaRY
 LMd4RoboCSDJGLxpWlllGGeEypkKZL4vOkEmxN6s8ROobRzU6TpaUe4XK1io+9sv7iIocg7
 x1ZcgQmnPW+mqtNoiH4cHtDaW7JVRQ4JVMLfHTKU8evDTReCbco3I+3ICtNOIsbvOrogZ9b
 95d/ovMOPD1a10OmiDQ0A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EcZSQuAnoWs=:+l0cF7mmf76bHbZx4lu3Vk
 5qMXllMgByASWCQlEl0CaYG1lsgkzLGoS6be41dZlBiBwsPtjt6UwTXt72pEuFBQ+1RMX+Mf7
 tIkEjza8X6ur/eY123SlmFzuj1UyvENmBGuXi7AJP1209iRwW8FilwBgLdSJJ2I6QXIL4Oa/n
 Bf6c8CVcg3rLedgdD4SRpHIACgicMTmtejtD7KWsgwQv+IFTFwgtCzsdhUR66numRC7g41kVd
 56uDtz3D3qb/u+gxzaGyIe3D7qT32pZFLx9M+5yGYnZMOPd8WLEIOgiUTF40od+7wC2jT81wm
 axizQQsA02VOqA/4H0fuCIRHF9wW7Ubau7bNrp2SK59sxTRZdZDtpdAIwIOIRaKHGKc281RrK
 Lv3QF8A2njMNjtEuEkSBEMQEzNm2C7Pk+AV2/Ey+PTY3TW2+7c7CKYmKJr52CjolMs0hzDWtR
 ZuOUPtt9mx7KklVOEEazoqLHNs99iAZvXKW+jIhJxN9q3oG2hHTIOEAo7xCYwgLpSYm7mB+ZW
 BIysQVYTgMK8Sh5iJKfKzzZJDGFqH5bv/3EbKqCkfDcAwhpMsvgihxCLGU/3K5/etyBHJildt
 W3AOQvyAKX9saltbkxxMqj1yCpbmteWMgp/scksSRYiQcUKjvGvSg1XxY0t1BMyh/i7KEGHq9
 DIe7mVj3xEOaFWnGNlAKBFSN/ffmcaGAuf4ubEOg9xF39q4wAltl2tk4r3shX7xawrHmBjj/h
 thMGakOii2XbSNJx5tXZOi9zL/Fiy6ovBre3mllZ0FlDkUdJF/Fst47VZqVuB2DYnQJN/x6Dz
 5+qfkJChd61SsAqaIAZW94Ra1N7a1Q4eVIbtc/SXvtz0RJQjRak0PYQAmNNQviUJjNetQTni7
 +ndhD9EGEq/zrxogLbylsc23YcRrz8v6BeeEbh/lq6JA9j+JUHxiZuKY12jFG8AXZWxxzNZuH
 1v3fdoYN2bXSNpofDPRjAMtc1GDSunf4gcpW70jcqfVJ25gD1y9NN6tXrqIRl9rtmdTSlH6hf
 5BlX+bMQX2Xp4Zb2gRP0doUxZuXZ2vkoO/xWf+WkoYMb4ISFAbKxDJYVoNGr3xa3kVUOAxrPX
 ggIAqVFdYtFtX8=
Subject: [Buildroot] [PATCH v1 12/13] package/gst1-python: bump version to
 1.20.0
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

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-python/gst1-python.hash | 4 ++--
 package/gstreamer1/gst1-python/gst1-python.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-python/gst1-python.hash b/package/gstreamer1/gst1-python/gst1-python.hash
index a760e53e7d..a2f17583fd 100644
--- a/package/gstreamer1/gst1-python/gst1-python.hash
+++ b/package/gstreamer1/gst1-python/gst1-python.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.18.6.tar.xz.sha256sum
-sha256  bdc0ea22fbd7335ad9decc151561aacc53c51206a9735b81eac700ce5b0bbd4a  gst-python-1.18.6.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.20.0.tar.xz.sha256sum
+sha256  8f67bdc5606ba33606c6bc896e89de7dcd8cf4fca459f71389b1b6fe075b5e54  gst-python-1.20.0.tar.xz
 sha256  ea3ad127610e5ded2210b3a86a46314f2b3b28e438eccffdae19a4d6fbcdb0c2  COPYING
diff --git a/package/gstreamer1/gst1-python/gst1-python.mk b/package/gstreamer1/gst1-python/gst1-python.mk
index 7faab752cd..a9cc32d1d7 100644
--- a/package/gstreamer1/gst1-python/gst1-python.mk
+++ b/package/gstreamer1/gst1-python/gst1-python.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PYTHON_VERSION = 1.18.6
+GST1_PYTHON_VERSION = 1.20.0
 GST1_PYTHON_SOURCE = gst-python-$(GST1_PYTHON_VERSION).tar.xz
 GST1_PYTHON_SITE = https://gstreamer.freedesktop.org/src/gst-python
 GST1_PYTHON_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
