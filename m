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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30141C433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 21:06:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1A7C60FC1
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 21:06:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E1A7C60FC1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF7C460749;
	Mon, 13 Sep 2021 21:06:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H35IirmMfXYt; Mon, 13 Sep 2021 21:06:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 451426060B;
	Mon, 13 Sep 2021 21:06:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8EB0E1BF318
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 21:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5576F40293
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 21:04:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iPPiH22Ogx0P for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 21:04:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6423F402DB
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 21:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1631567054;
 bh=hmFH7udpxvnVvYsVhhDX/juu+myXqKeWBMp4216diPI=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=CJ7AFj/C4gQwPyifOnuT+Nwp+niCRdgOPBft1On2hKywBQlD/V8ie1ILYYEwlVQI4
 nu1Pu1xmmmkhNBTW2f8Xt/rTMx2o6Dwz7ORzcH1u4APVpNp9jq2kWHuUxNTE6iMpC0
 q3GNad74eLfr+zLnX5cSU7tcRv6F8M1DRErjLlqY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.240]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MNKhs-1maNlM1QjK-00OomB for <buildroot@buildroot.org>; Mon, 13 Sep 2021
 23:04:14 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 23:04:10 +0200
Message-Id: <20210913210412.24042-12-ps.report@gmx.net>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210913210412.24042-1-ps.report@gmx.net>
References: <20210913210412.24042-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:TuLHGpYHeWO6gOz9nuaqsziXs3wlCHdM+qjGaaVFJBNYcPOKInE
 TVXtYMn3lsw08BatwJo8z/tFOpTc7Ym2DkkiyUjLToTLhug6ACknMwbrCV0ISFZ4i7B5JRe
 gR+Wo0+aFk9zqiH4f7/Z9QOvDlzcOt2Td2UvUcE46P7ukh/EQCvfB+nCT2zLZ53daP2u0kW
 tm9hkqv2fTgMoR/K0GViw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Wv3xMeglEXc=:zfAMcz0S5dAMFMmdJlXeQ9
 jbGHZtcfNO5x32Z+M6ZDYoQfkYgWvRajlN1WMkpKkJNFcXn5uzUMFV/aIgYJ8Fvnz57I2IOve
 EhKjc0WWFO/Rd8svqhD/DqWgZNBlUGU/LAyrOmPTsh5njH8Vn2SC69QzSZ3afUK8gzUPBkiva
 8W0KCs1zY91LuKY8YEj0+RDrpYdx1gMneNoHcuw7W7ezXm/aoi4F0SNJ0Y36zDSgSZU64gV9/
 sqKO9yllTjNfDQdPNtVeUvh3Y1ahs4i+qRm97g+ne6nyNBSZjQbVvedFlAQWaXqQoyYXfhUp5
 tSonG79W84xD93G5cUuf7JvdDDE4hszEjuASwWP9YmdtKdMwnkPJjH4+t1nq2ewpL4gEc162d
 FK3UVqCjz/31gxuiN6+sA9mFQ2JIaPp6iNaX5bbHDhU32WeTAdUYVKPYbfoz2rSMCDWjXRJGd
 1zE7fEoc77KSggasXA3DojrkBn2Of6Xl0pnLgUv2DZlbnCNH7jpjOvOIIF/qO+Zp0T4O8A1jD
 gV8iOZCYuQpU4YwbcEfCte41Dq9gGlSsYtdre1SQXkwYn8fcdqD5q+V+BfjYCjF0JNa9lT4rO
 urpJRJ6t/D3FVxS1EK0joEfudPFenJhorgnatOEc/mnRrWk1sSoIRaMxJroN4EhytImqeELfg
 dkU7DBrEAsgEmABxBToMY3woai9YODaDWVJ614DiK7jrxmGavMBlJG5nLYCE9xjj9nn8yNUPE
 0BbmCxYqsw97JjqVwOrS5ABWrby9ix1EgTFKAeGUImWT+4tz74CZTQ+UxQKo6xZxQRSM1griF
 jWrZE2Nr/jiCJQifesP4X4SQ/iYJGePro4ciEK2HcGMQkrs0Xhw6/EaK92vqSutV4CnP6KV9U
 nB3ySL2IxrvizYhET3Sfj1jKViZBx73xJc8bRrWC4ik+glm5PMUFnP+HxamFg5Gj2oXyw4osP
 F+4KpTD0ORu5ONHXLE+JOIG1l52N+a63NNipkCwzK9VAMW1ipsy1Z2kFSHVlW9BeRzJvRYvmv
 TDnUBYCeTrj/0MLI3fGW/DTWxGeBM7a/9PzlKxOlf0tJmpUdnZkd/PfcC+hppWErFHwCgFBzu
 4wSzORu35pslek=
Subject: [Buildroot] [PATCH v1 11/13] package/gst-omx: bump version to 1.18.5
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
 package/gstreamer1/gst-omx/gst-omx.hash | 4 ++--
 package/gstreamer1/gst-omx/gst-omx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst-omx/gst-omx.hash b/package/gstreamer1/gst-omx/gst-omx.hash
index ceeaf4e57f..9040393506 100644
--- a/package/gstreamer1/gst-omx/gst-omx.hash
+++ b/package/gstreamer1/gst-omx/gst-omx.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.18.4.tar.xz.sha256sum
-sha256  e35051cf891eb2f31d6fcf176ff37d985f97f33874ac31b0b3ad3b5b95035043  gst-omx-1.18.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.18.5.tar.xz.sha256sum
+sha256  2cd457c1e8deb1a9b39608048fb36a44f6c9a864a6b6115b1453a32e7be93b42  gst-omx-1.18.5.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
index 36a05be6b6..f7be1d59ef 100644
--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ b/package/gstreamer1/gst-omx/gst-omx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST_OMX_VERSION = 1.18.4
+GST_OMX_VERSION = 1.18.5
 GST_OMX_SOURCE = gst-omx-$(GST_OMX_VERSION).tar.xz
 GST_OMX_SITE = https://gstreamer.freedesktop.org/src/gst-omx
 
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
