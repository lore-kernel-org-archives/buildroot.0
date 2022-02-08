Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CEBDC433F5
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 21:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C6E160AB9;
	Tue,  8 Feb 2022 21:25:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AznH9AxljdaN; Tue,  8 Feb 2022 21:25:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6936960F39;
	Tue,  8 Feb 2022 21:25:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0BD131BF391
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 21:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08D8A60E27
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 21:24:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CTv5s6-LQqmS for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 21:24:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB5BA60AB9
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 21:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644355449;
 bh=9FB/tBH4ZuGe+vgxOXM9TBlTluDyw8oaI2OVUVo7m6M=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=UdK1cSLA22lmaTXLZzDyw5yIDCO2d4cJQj7Peid1/hsOwWrM17sa8LkvJ38tADhYX
 mZ/uDWwmqpLWVDCRwEBnNqzMhrRgyYY9XD8hyTjDgVTxZVap1uFfszd97yJTckepTb
 QbLWZsobrAojZPqoBpUzuUB3DgC/knN1o4YQtgNU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.59]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McpJq-1nq3VS3ToA-00ZtX5; Tue, 08
 Feb 2022 22:24:08 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue,  8 Feb 2022 22:24:03 +0100
Message-Id: <20220208212405.19243-12-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208212405.19243-1-ps.report@gmx.net>
References: <20220208212405.19243-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:WTIGW/jwC7QfK7NjB82QEgUUZRfu8+a713FK8Cpl7ynr+SK0+ck
 oTmXZZFomvoFS+Cu0lVZ9nVILiFxvmQWNifnowm0x0Fnk1peOMPGuOhIjsGAAFDOpw1z6C+
 V8N7Lq++rHeIM8eEMtMcY0ZAIiiMHM4cf6iNVAISwpyuqpvIl4Rip76bd8t67Ly8C1bheyC
 XhCietPUSfY4M1MxWJGFg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lxVdBQu0SZU=:tVvwGlwq2+eMN3Ye58aq/I
 /41gcXMi9jMe/OQxsC4WITCvjDzjd+xvUZXpChKfNlCk4vUoWwTVd7EywjjE8bMY032OsrM+K
 5RGv/EKPJZFnTZcmEI3OQOrRGPjCU5nHHevL3OUj9Z7goH0Af3ON4tPocDMot2xtZiP+l1OCA
 Bu2d+H1+dEx49ySyfeRWAmnmdO503VrsQBQm5KzggOTjBdriUrbUadvG+nFRXz7WZtfBmeBTC
 H8ma7ziYK9sKo82qWUkTFIag2ucpWCU81jm7tvfPUxntE1lRaKmPO4pfuwmNqfUKdtfRPJhrW
 pznC0lFe0gNCJFe22YOIVqODfMIDovGP9LnPPgT/+HriNlEMFjzozkyfFRSMa/SCme5wul+6Z
 BFoBRd2L1K+Ltm891dzEjEMCa4+rnNnYywc7BFA3gIiTUc4Ux23DtHn5QqGqNkOGJR5UPDbOo
 YJka5Q6V3kayFFoa3BPX+8cerPq76fv0BtuJFYI/0vy3Auj5oKsp15ZR9lqQzTWC/xy8vcbHJ
 u8DmZDG9brnW69NbX2y8XOO/0BWDFoddqoujLOqMh8E+cBmYokwJBvt52AmWkwOV8qgdjH0HR
 qFR8l6sfGtRuDADPTnUoGcoOoexi7YxTx9Ofhe1gHsB57dHNN3CQddGVhER4sqdDQ7UTp5lNa
 l48Go7oDNFBpJNCuRcWRckz4UdBJCLJqMmLgFAL2t+tTJDmQYlCbf+mmGqnqkdo4YudonJq2O
 EseYdHFED9vJBjKNcvEttUNt2p9QNJSlXzqss/XKOCNB5h+GHVxtCaxWUNfyqZEeq08CmeN/V
 zucnCCPqwFTEzhKcoqTefw+GK4sJvAHArdZYK3Ub0eYiktAwcFOBkImiP+dgvUHHBzsgMdzsf
 fhROyS3bSMsVt8RxR1HmBdV77/cL8I0LxVHugbOKm//mq101RMSLdpnoZvHCf+7OQiO0nT/Nw
 6kiSh0ZxfnrpX4GuBxp0p80JGp96JtJuRU97Glmm0srufXcHa11dEU2O7qCv6hFVPG1oKTmbK
 jpJXGDyRHDr8uhchFW/S/loBbZGJsax/cF7qEesZ60qS2sZQq0lZFN2oUT6Hlxe/z5U72s841
 mFCVx0furlMR/I=
Subject: [Buildroot] [PATCH v1 11/13] package/gst-omx: bump version to 1.20.0
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
 package/gstreamer1/gst-omx/gst-omx.hash | 4 ++--
 package/gstreamer1/gst-omx/gst-omx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst-omx/gst-omx.hash b/package/gstreamer1/gst-omx/gst-omx.hash
index 47f7cb5893..0b95505c5f 100644
--- a/package/gstreamer1/gst-omx/gst-omx.hash
+++ b/package/gstreamer1/gst-omx/gst-omx.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.18.6.tar.xz.sha256sum
-sha256  b5281c938e959fd2418e989cfb6065fdd9fe5f6f87ee86236c9427166e708163  gst-omx-1.18.6.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.20.0.tar.xz.sha256sum
+sha256  c1e46b70ac379ac7b3646506370c9e1007b56ae293f4d334bc0e724c76c345dd  gst-omx-1.20.0.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
index dc65509244..f71e1242ff 100644
--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ b/package/gstreamer1/gst-omx/gst-omx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST_OMX_VERSION = 1.18.6
+GST_OMX_VERSION = 1.20.0
 GST_OMX_SOURCE = gst-omx-$(GST_OMX_VERSION).tar.xz
 GST_OMX_SITE = https://gstreamer.freedesktop.org/src/gst-omx
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
