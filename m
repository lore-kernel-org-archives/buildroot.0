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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E002BC433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 21:05:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C8C36103B
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 21:05:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C8C36103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E54F60586;
	Mon, 13 Sep 2021 21:05:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sCL2ff6E6f2x; Mon, 13 Sep 2021 21:05:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CA0460626;
	Mon, 13 Sep 2021 21:05:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 32FA21BF97E
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 21:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A19CB40299
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 21:04:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Oe1lG1gTXFEX for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 21:04:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 18184402C1
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 21:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1631567054;
 bh=P8eNgJya7m13bczPj21QTJjSupLdeC44+My0GOw0pCg=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=WpiXVO9pw4FwOzR2bs1ykXFX1wOQiY5om0t5pqPsUJfH6aM2nzVvbsz94kyjMZQi0
 8OzPwYVBch2LRmcazypuKInoDVk+LCmtTFep1Ui/nQ/x8bxvmSGdEW5hpobbJvVeON
 RwP+cukK4s/SwGmuCBEeId0WoBDLVLteqvyKK/fo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.240]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MwfWa-1n9RSu017a-00y9Wl for <buildroot@buildroot.org>; Mon, 13 Sep 2021
 23:04:14 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 23:04:08 +0200
Message-Id: <20210913210412.24042-10-ps.report@gmx.net>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210913210412.24042-1-ps.report@gmx.net>
References: <20210913210412.24042-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:R1mpDU6mmDdlk/YCk35LpWQM5o09SUMR6GVHzT6QH3b07Vfq2zu
 9K+aJoFRKMHxqNBV6wsN2zpourqdlO5F8zsf5TvQCZh6wGyjqfg37dbCEKbDgkUby8rbhZB
 DdhLzN5ovHxtJ3qyF6GSB6ledj6yVVJCO4sjnugmTLKhNqZzTefm0aJwzMICQXJyDK4wcpB
 h8AQfUBnBmz5eT632JXEg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:pl81JbcbzM0=:7mBszUGUlnkVLWoXkmnlTW
 ci4pTWZrSGV644+7nHMTT8XyxA6ICu8YkqC7d2JzaWQnx6WcT7/DyFRBBQWjfcM+BhzJZoGXf
 okjB2c3fbsqkty8XfXnF66OCi/RWrcAqcUPxecWDHOUT/gXDVulWc/FKxoIDp2fQOxXGiKVWM
 86brMF2u/OphuqnZjGfxbs5HSpzMid5RysPeDNQfF1w441/3jhmvftWgv/0tLKYk3kFiHLOLV
 EmlW9YmwmCdSt+ELUnaWH4R8vF1ZOtDfXpfmdM+ddE/xLHSHKFnmp/IPcNeyVfJxItT9DBmNz
 fi2bYlzXnNl7NWdoOHlD5iMemuCSfBx7oV9JnynGAYeHi2I97vJrlnk3zsfmNY8T7kQRYtB0n
 Noe8wrbIHorPR9yGlHu2tNlkr94HtV1+s4WXzAs8i98yzBOYnmpSS1bVBKDBRPcXomEdQEPgo
 RUdTazjXJ43TzvTy2N6JFL1RIQLx6OHxZoqassqF1ldVnlF+tKDuiU9jsjIb2UL8iM/cZZojm
 dUiidYIoXEDiW1ocf94fkgoqlUdeYmtI9fHvLaM7BytR4M8CsDxKaB2PwXSejAqRq4Wl3alAc
 2ARvRLLaD5f+ZFyundUuYhxbJtE++yY/5sQNFu0+uFYgQ0qf6tCY+M9iITeAA/Jskd1vquVeu
 GDFkyGAjeCcBeWyrV3EyiAvhiIW6dGIvhpy05bclwsgidNNFJ5dh0w8AWD/ZlvLmPCs7CKMO9
 cuRTfv4u66m8FneQcmP0nYLtOjL8dv5p9+XF6jZnm4PRgwo7n1iE99gGsDNZ2HWOFXWC3FbCj
 DAC1Lwc5myp376KzV67jw+F66IXaDxiFlVDtpdAEpnbK8wScGu5ihGLjZYt2+ymKZKNwO2TmM
 rFiGJK7C2y0mDZ/TYakFoInUse/2OR6DjGrd3XFJxKNFIPyPIfzXucIHgdmq40D/d2vQJGKOD
 bM3fOcURqkI8wnCX9iEmYkk9Y2AnL2882u4kVR6aic/8H3DNxJhip3w5ryPahreeH/EBy4g03
 8GjHHMqRJUmJnnlQvMQugsMwI69BQz4jG4XDUisoi/4Up+xxbvyzUbn/XtkBb/3XEXif+pe+N
 O6/UxEpV4FLeX0=
Subject: [Buildroot] [PATCH v1 09/13] package/gst1-rtsp-server: bump version
 to 1.18.5
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
 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash | 4 ++--
 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
index b07b24413b..627a451d04 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
@@ -1,4 +1,4 @@
-# From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.18.4.tar.xz.sha256sum
-sha256  a46bb8de40b971a048580279d2660e616796f871ad3ed00c8a95fe4d273a6c94  gst-rtsp-server-1.18.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.18.5.tar.xz.sha256sum
+sha256  04d63bf48816c6f41c73f6de0f912a7cef0aab39c44162a7bcece1923dfc9d1f  gst-rtsp-server-1.18.5.tar.xz
 sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING
 sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING.LIB
diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
index 878195b74d..37942423a5 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_RTSP_SERVER_VERSION = 1.18.4
+GST1_RTSP_SERVER_VERSION = 1.18.5
 GST1_RTSP_SERVER_SOURCE = gst-rtsp-server-$(GST1_RTSP_SERVER_VERSION).tar.xz
 GST1_RTSP_SERVER_SITE = http://gstreamer.freedesktop.org/src/gst-rtsp-server
 GST1_RTSP_SERVER_LICENSE = LGPL-2.0+
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
