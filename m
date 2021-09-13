Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AECCC433EF
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 21:06:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 478B260FC1
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 21:06:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 478B260FC1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CBC140195;
	Mon, 13 Sep 2021 21:06:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W6BI1DD9N4Xe; Mon, 13 Sep 2021 21:06:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F042240252;
	Mon, 13 Sep 2021 21:06:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AEE0D1BF97E
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 21:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E16740297
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 21:04:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mp_lVqWZaz_g for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 21:04:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 67BF240292
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 21:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1631567053;
 bh=i4n0iqbAGyV94/BbpNVrln363aY/C3vi3xPvipINCTs=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=BFtSSRcxhaKxVLdG5ySBvyR95F8YS6qSVlDy9EB1ClIH5EM901Zg6yFAnhbnsCn5A
 Z7UwZNVy3n9wsqmjvLUVWc5Zno94CtFaK86eHaaxj+y9HlmYYqZxwN4XS/cJ2dAEN9
 4fnLDBc4VtPE1pTmq/6nre4OYdO41sQH4vplU35w=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.240]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1N0oFz-1nAouW22Fx-00wn9Q for <buildroot@buildroot.org>; Mon, 13 Sep 2021
 23:04:13 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 23:04:05 +0200
Message-Id: <20210913210412.24042-7-ps.report@gmx.net>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210913210412.24042-1-ps.report@gmx.net>
References: <20210913210412.24042-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:1q4n81YG2Qh65B0ZHF5XAWFA7pjFACC3nMTbQ/RC5YhRzTbmiA7
 cpHXyFysJa8rhgUiC60s5vI116uUJXetUcgCUJrhtqFOu2F//fxL8H/ewnKrsLvJPTDfQbZ
 q/Gyg1L9pJEv0kzx5yg8UHyYoq9P851k8zjYPrxVI4hRvN6bJldblkkxjRlWgz2GUGS2Pbf
 XnL2D0B2A0OLC6+vczxOA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kEuwZVrW768=:HW1U8C7ZQVV+krAzKANvcy
 S9X4fJML+70iKlFDHAdhX899EsI4EhyP5q1yWNQuJPKoaYtYcgRDk2afyCO/LJNe6/O7+RD1i
 yBERk4fZf7KMgXfB3yw08xPV7128R96VxbgInHLiJN/pm6rWARYaO+2Nu6KGGLmiZ/lbqYhym
 OwzMF/dkCLBoDIXvaJp9WdQFUeoubQA0ZuxysPL4mhYHuP70nxGnpLVt+hBLJaO/lcttF3108
 Er/06c9mq2oVKlETAG5z0xY9G66SE8E3MVdR8EPem9O8BhW1ifAHqXH7Z2Z4YgmU5GcUOUyzW
 6wvBYw2pvGLOtODsXp7r3JubPxwMaKNx0R4eDldMrm3c0dsrl2sifCfVIYGgSVe/ACaq1g04B
 qAmDp6CGMghKH3NUrC1gWAldXdQ4WTzFcFws51FjiWWpHp9VpEiqWIAXwNxouohoEmTn/eZPI
 8fzZe/6WbiIyz5S35R+iU1VSMmQW4sYAFj57TyDUVk1wDt4Y205Pjt6iEdxMv9bo+eBXSRxCY
 YnK5untda21ORI/WePMIrGoZaUsmLhRlImQe+XAo+J5oCyDLF0wrHVbsP0za99aEZ9ghC3Cb6
 r57BXoep3R4vnrrL/gyl+xV9j6uBOOYjm4rVqChcz0pD2X4qN8HQ4amrLJCtUqrGiiNWvvZDu
 KArbHpdnPMglurK7l5YMapP2jFOkGkzx9bNbSsOBzbJ4BpFWZmeRlWtVnyPNngK/Xrd6NmxEz
 6vcJT4FX42/5vsPE+ge9k1Zsbf8B4TwgX90gKhG7/Veg4MGosGavvyRVoUDkA3WWvh28BtRoX
 t/178jSrobSj2N+91vWzkr6lbEDLBCHn43zNAXo+Rb1ws7ejqsGJlm6+2bGOezwAV5ejIaeWh
 srcy86hhl+ZqV5WyVqN5e1lxqU2Mga7FYtQflpZ67jcCvHIif9QFUtzNp1LEEospis4DzXmfS
 sbaKlxvfZvMVXYliFpX6WZMR05YMvej6IIlEpAUxp0/3b18V3ke3HO7W35wVBS1JgpJZMQ376
 FTUjBlKc5XpmmZNSg1ut6DR6qo0l/AXNMs7PXQeLodGdeBfGuIe/fJLEJ99FhBr5mnu5ZjS/l
 6zt1bnIg2VZsbU=
Subject: [Buildroot] [PATCH v1 06/13] package/gst1-devtools: bump version to
 1.18.5
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-devtools/gst1-devtools.hash | 4 ++--
 package/gstreamer1/gst1-devtools/gst1-devtools.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-devtools/gst1-devtools.hash b/package/gstreamer1/gst1-devtools/gst1-devtools.hash
index 4c0c5b5b02..c19254c195 100644
--- a/package/gstreamer1/gst1-devtools/gst1-devtools.hash
+++ b/package/gstreamer1/gst1-devtools/gst1-devtools.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.18.4.tar.xz.sha256sum
-sha256  ffbd194c40912cb5e7fca2863648bf9dd8257b7af97d3a60c4fcd4efd8526ccf  gst-devtools-1.18.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.18.5.tar.xz.sha256sum
+sha256  fecffc86447daf5c2a06843c757a991d745caa2069446a0d746e99b13f7cb079  gst-devtools-1.18.5.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  validate/COPYING
diff --git a/package/gstreamer1/gst1-devtools/gst1-devtools.mk b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
index 5a10e4fab3..1c25823953 100644
--- a/package/gstreamer1/gst1-devtools/gst1-devtools.mk
+++ b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_DEVTOOLS_VERSION = 1.18.4
+GST1_DEVTOOLS_VERSION = 1.18.5
 GST1_DEVTOOLS_SOURCE = gst-devtools-$(GST1_DEVTOOLS_VERSION).tar.xz
 GST1_DEVTOOLS_SITE = https://gstreamer.freedesktop.org/src/gst-devtools
 GST1_DEVTOOLS_LICENSE = LGPL-2.1+
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
