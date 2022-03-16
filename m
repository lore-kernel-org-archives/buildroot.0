Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8F7C433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 21:37:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D10360F70;
	Wed, 16 Mar 2022 21:37:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QEfbeompeRlw; Wed, 16 Mar 2022 21:37:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC78B61249;
	Wed, 16 Mar 2022 21:37:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 49BF21BF9C2
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4656360C15
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:36:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uq7Z0l0wIhrc for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 21:36:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 19EDD60AD6
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 21:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1647466576;
 bh=HcMU/eK3Hwxg/Fmok73LbVSmm87caHE0FsXKWz1GpM0=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=R+LQ96iqfKX3+9aVYjshxYYvTdqX2lP2Hg3RCf6/MQqJOuaqY2ra1ahoZD9tPD5RH
 fKcWUK0C5BHNz7XACMguBa4DlXjrY82y8P6uNWujbGkP1bHP+0kOT/W7WAfpW5QZJz
 sXBs8EOK6t/ysUaZiKW4xzP1ZZheqLJEU92VgeDY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.226]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MA7Ka-1nNTmk0aAk-00BYGu for <buildroot@buildroot.org>; Wed, 16 Mar 2022
 22:36:16 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Wed, 16 Mar 2022 22:36:08 +0100
Message-Id: <20220316213614.16878-7-ps.report@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316213614.16878-1-ps.report@gmx.net>
References: <20220316213614.16878-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:HXYiOdquKqqgTKarV+5G/WLR2UHyQ+YHh0hIHm78ew+LU/mX+Lg
 q2pJLpApzkJcj9d2GAQ7cpVy8Ubmsa60a8LySQ/c2Od1saAH+qDeEAZJzUv8Tmj2CS4fcY+
 aP2uu0g3X7vTi0PlbBekVqOb0cqsbQbE9faUwf5DOYUWmpuWMnTcqvljoWrV8ihI2OEtPnh
 ceJEpvJ6lRMASpNnVgVfw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SrN96waAYcs=:ee6Ozs0sTH/GIdctwLqS2N
 dFIfI1fI+qDlWzM/TY9TABkaB4YsfIR2kyMbApjNSE9M9lwVVL33oLDEhI8Yi6Kq5iCaS3vFF
 jVALIDbYTlGavlJ2HHqAXppq0SeMLTq1SGb2dOx0TUSD7Vb59n1OUR1CfY31Hx1Owib23Us5O
 gc1VGyBkngliIwjQtKWENebi7eDQr8ixYqRk4YzNZXEbhf3xwPWh9NLwkYOs6bhIXLnADwGvg
 Ee4G0ZS1LpigIokmdZltzF8y4kUaoU4N+72CFPXHPBa78fKMvtVSvLs/2dIcmy9uO8d3SYK1K
 W8JV1fTWVoVUCwolMXC9/Fz7Xq0Ajv3bOaQPsCdlm4lrVrAGxev6Xk8bg55kOQTx62jBphHv2
 EgR2Qz591huFE+Tjx6lYrEXA8hjqKdDl6B0sxHSzrDNqjJmCl7Is6tM17kdHaCqeuyMUZ96Yu
 riMweoilWnCb9wcgS7jrMVA/QC26CotPu9RYa2YuNWiM8ZCfD+oY2gQkcp/e3DXJhqda24CMQ
 biEqX1HDIgszONEPgz4wuhcmc7SzOrNAzHv34VlWWLNowC0jRwHqDaw1lh3xCzXCCvlshxXfZ
 B75XrQ+ohz+IRyg+Oq5ZzFBK68ngfzY+e+uW0edIoep/x+Ztzp1x45Q8dlhnj3MZw23Sbafil
 ooMJCrrQcTgg3Etw0aESWpukE/hBIxppjqGtVClDTw6+lax0joj4dtCjnHS8KQmdP/9HQlq9M
 MVtPiCWt38stlBbILEuKY1SxmOoAMsM3Uk4M56hVJCUpbkf3cqk520WG945hLnhw0cllVgd8R
 hy5pqn9R3UH6hNcwJ55do8svhE343KDs/QbYsjtqf5OjM8qyYBhB/8zwt3oF/ydUItLNkMOPa
 1uUSs1HwVVWB6fBfGLLnUOn1HehSTUjzMJusUEZc/+7mJ1ic/sChMpRItDf/NqePsvk4OEQPy
 UOWt6WpLGUx9vedsvHQ9u0F+z9y/Mi7c/akqBxxuybO3CDn91sHtaogA+rQkwRfCnu9Yrvnjg
 r0DhXY7uolns0qlzKtUVZ1BoE/1u62TDtldHuNnrNfxuTy81iuATs1dq14O9d/vdEIH/yT45K
 tuuazuZGWcyvfw=
Subject: [Buildroot] [PATCH v1 06/12] package/gst1-devtools: bump version to
 1.20.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-devtools/gst1-devtools.hash | 4 ++--
 package/gstreamer1/gst1-devtools/gst1-devtools.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-devtools/gst1-devtools.hash b/package/gstreamer1/gst1-devtools/gst1-devtools.hash
index dd09280a9c..7173dbe266 100644
--- a/package/gstreamer1/gst1-devtools/gst1-devtools.hash
+++ b/package/gstreamer1/gst1-devtools/gst1-devtools.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.20.0.tar.xz.sha256sum
-sha256  69fc8756ec9d93e5c5258c99088434f203e91fdbc5af28d1f2c583fd819b7a1d  gst-devtools-1.20.0.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.20.1.tar.xz.sha256sum
+sha256  81f1c7ef105b8bdb63412638952f6320723b3161c96a80f113b020e2de554b2b  gst-devtools-1.20.1.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  validate/COPYING
diff --git a/package/gstreamer1/gst1-devtools/gst1-devtools.mk b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
index f72df9cf71..8c430800d2 100644
--- a/package/gstreamer1/gst1-devtools/gst1-devtools.mk
+++ b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_DEVTOOLS_VERSION = 1.20.0
+GST1_DEVTOOLS_VERSION = 1.20.1
 GST1_DEVTOOLS_SOURCE = gst-devtools-$(GST1_DEVTOOLS_VERSION).tar.xz
 GST1_DEVTOOLS_SITE = https://gstreamer.freedesktop.org/src/gst-devtools
 GST1_DEVTOOLS_LICENSE = LGPL-2.1+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
