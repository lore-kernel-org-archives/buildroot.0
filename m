Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81295C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 19:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40B1760BDB;
	Thu, 10 Feb 2022 19:31:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vWB0GYRf1xIt; Thu, 10 Feb 2022 19:31:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 771E160BCD;
	Thu, 10 Feb 2022 19:31:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 84DB91BF3BB
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 19:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF30981775
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 19:29:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cq254oxk1XJT for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 19:29:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F005819C8
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 19:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644521347;
 bh=JFvIto7VnGWafrb2Sjv3BmUIM39/z3/eW8HmfwsNOfw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=f3nXyU0VSxnDJBlq6DDo+ut3bkiZ1AJY8Ey7gHU4WUdhyaBk+9TgAfs7pnNEOB7fL
 Csv4LHuGjFN7uwtnhLx1VVnbG/8nrHXqaZVPvGbl8x8ROsqYMQY1xwyiRAeyjEcEca
 S9CPSHGmnGTzVddQPPjmnhrasXSn4SSukdA24qQs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.34]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MHG8g-1nVQQ72jpo-00DI0v; Thu, 10
 Feb 2022 20:29:07 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 10 Feb 2022 20:29:00 +0100
Message-Id: <20220210192905.4500-9-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220210192905.4500-1-ps.report@gmx.net>
References: <20220210192905.4500-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:KiMMb0+j1Cl5fACSmUZLK+1be3GQvvYiDYJCxqtAAwLxZ92DmxI
 eyhKo7ozSwE3aCQImHvMat6IIgSM+DtoIo0BGEaILYYoK96uXSj3Np3A3/4GYQ9xMQZ13Jr
 SWNF1AVZHQ5Xpu/O/r4F9LKkM5NJQG+EkWh0wZLdXOVZ2jhD8GXiiBSLg+bzH27SOmqX7jr
 /xCfrH0lABzKgtP6IXvrA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JQMewlhBcAQ=:STTXP+7KbB+9UbwkXB0Cjd
 KVMk5Kp1A40AB+ETqHUT1j2kCT149ppzqyC2xcrYcXnwd4D80SDq3XTjdJGwnuy2JGG426Xsc
 OdmYiIieNybJ21C1o/6eUAdv/khXbFnYlUjlspi2P7VVfz+JFLbBe6+W7BY4nYOdlvG1OKiyl
 CrYJS7/7NM02Fzb4RGN2fMTEv80hnNi+JYSg5nxHOivB8qSdNjVK0ScLcL4R/xIaxEZFDLvoU
 snfSF18sCCsYXCWMvpbI4dTAS/eAca+zlFSHhXsRHGoxKSN8579ibFspGeRcGMwpSAgC9/kW1
 IyerrQMTIJphU5z+sBfNBFmKmcVpGEEGAKvIIY0oA24RijToX9/nGEusajMvbjPR3hk8sJHdV
 lZIuZg436zVtP6ohzLpd1du8HKMMJSyhYArpgMOuBE/1og2Q29GwxKXymDT8qfjyPNgzRXUG+
 ojnsmzOIE/5clQqfZ1POblEl+oUgjUn+2pwpzxh5CKK2vPxAwqUn9PT4A2Jd8gr+qd5JxvkZy
 itRqu4X4EdOAs2Nyel3M8WSIjySgdlOcMpcYCxuiLzBAw5ai8RlT+BTkPK4wUQGCzl7h5m9Px
 /ib9O+ajc9luRFMIsgR8VTT1OCU6orFI9TckI+lSC0Z5c0ZZhMaKVvvkmESXBA7UL82ceGEDC
 5gEDdZVGPXokobshc3DdtWGMP1Hl8+J541yufPsRFV8xpiZKN8irLGuzcWB1adjRsD/lb3orV
 Fzzf92TcXtIcaIicduhTBQ6SPosyUk9vCtrMfzm5yGcA/ZFcl4i8wVrMgKQoG7r15WrRX9YxI
 KyhCI1hMrTLoNv7HFhwmSOsKgE+/0lB6zmD+j0bzIqZezwuP+OMdtB5UaCLb4ugk/5X/wN1hR
 GEJG1M2/dZGgGOR4t2oV5egxjKmkRW9qF1+dS8A/ZQ8qrE97tTpLi7AND6oYtrmzIKd5ly79/
 pk/DUDvaZHUiYVHNqsza6qyfBOkKDpY2n2BVOKLLL+yptExpX5XtCaiuYF0IJ00NqvO1YQM4Z
 7IMFXb8hYueYP3L2G+uhzs5K9wqtLSxJv80KV5j3E7UjSXwsuqHmLNQy9C+J5Tf3wzNpaBjoS
 o1STIdSWYzs9e0=
Subject: [Buildroot] [PATCH v2 08/13] package/gst1-vaapi: bump version to
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
 package/gstreamer1/gst1-vaapi/gst1-vaapi.hash | 4 ++--
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
index 7e22774c11..b32d91e1e2 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.18.6.tar.xz.sha256sum
-sha256  ab6270f1e5e4546fbe6f5ea246d86ca3d196282eb863d46e6cdcc96f867449e0  gstreamer-vaapi-1.18.6.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.20.0.tar.xz.sha256sum
+sha256  f79a47346dfd5e585e063e77078e5fc498b06dee895bfcbf47d8863fcac9ea32  gstreamer-vaapi-1.20.0.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
index 6af851602f..19ee625703 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VAAPI_VERSION = 1.18.6
+GST1_VAAPI_VERSION = 1.20.0
 GST1_VAAPI_SITE = https://gstreamer.freedesktop.org/src/gstreamer-vaapi
 GST1_VAAPI_SOURCE = gstreamer-vaapi-$(GST1_VAAPI_VERSION).tar.xz
 GST1_VAAPI_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
