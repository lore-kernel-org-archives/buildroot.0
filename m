Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74A43C433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 21:04:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D5606103B
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 21:04:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1D5606103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9EAC80DEB;
	Mon, 13 Sep 2021 21:04:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XgRJ0GYOJSLw; Mon, 13 Sep 2021 21:04:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EFCF80DD4;
	Mon, 13 Sep 2021 21:04:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 691DE1BF97F
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 21:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BB794041A
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 21:04:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oYdi_0wqACSH for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 21:04:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94E7740293
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 21:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1631567052;
 bh=o8t8f6a5OgdvkSqbt/jjYfdNGeT62MRtPw9CFO2X0xY=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=LqbNxbXhUSv8sQPQC6W6L2cBRKEd+rWwJG29fp1HLdpyYjWtlvO6OIZE4GKF6C5up
 iPRbUyWvDBYFGlrsNpr0gZo/FyfAAo/NlNU8pGidFmFCh/HpdUtk3TS7RDhOPVSIgR
 Ojr44mLAFqXrWuGzBnJm6+4EzSs4dK9PCxLGas1E=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.240]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1M3UUy-1mPL9q1yGw-000Zp5 for <buildroot@buildroot.org>; Mon, 13 Sep 2021
 23:04:12 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 23:03:59 +0200
Message-Id: <20210913210412.24042-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:UyALhWY2EOiNtGWc0k3NFm9KfPYnd/7jDBN6u9yvMbuThzEibuy
 8erRKbDKO6HDI2MNBm48e32D95Bg041/obadH1bqiixIzjE/BJssBwIB/A1QAsGMgQZuLO0
 bU/zhxMn2M+PGyMwn/Z5u6vEaHvqqC7g5uOBZl+7Owu/K4U0wRH9QeHKuRA7gmfGT5IZLAF
 BeMu+YJr6qItvJUjyNPNg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xyi8I5JpB70=:p38LD84ssQDjPvP5BndTC2
 OKVlMCbSqSz/hRhqyq/4fEgk58Kebps6almTOkjeiRg5DXsBzD735RuRMw6seuzf+GlPZHCZw
 ZEpIAQc2a1uTzf4IzqP3gtuks6tzM0lI9HPaSObl/NBDExlDiR0jxTNWX9DfpWAFBMy2P3Qi0
 T3UPjeoFCeaC93OLeKhrl/MOEo/Okv0gPU7cIBHhb7fftft416wGkRB0YwL6GYrC53RlhDhl0
 6eLxcJDco5s5hEwDMshCnT0dTjU9U3eW+p3EpyRGjOdJ6Gmz5JKOny1WouP5pa+iWfTpYSaC0
 ZfNjcgL3Kk8JEz1MN/5ObOCdKKTrVQif9JkQ9n6L81DmPRWtsRTV+evjX7h8hqAjmGu9++FeP
 ZRy6Mteb1kQVEW1a/McVepfVc11V6BfBEBGuhsBZRurm520gCw5MCjLgEHxOpLovGRHNYtsmG
 SZ4E7PksGUAzDRYp0q/MBColPdAL/N6V3vuVHyEt3l7hfz8sQP+mCTbinp7CLkr0w/eLFqtS8
 bCFbvVAsLO2F3E1bghaVbyD/1uvgDgN8WpBXPZASBA6hEyfdWzHeDQUUDIDBnnUW94PkiMY2a
 kicLZWo0YjLd3j3it4Mp+6tAmfGy5zap2/1M4QYYYOI+HL7PYWv6zyAmUVCV/ZQ4yFoMEvG4e
 Jp91AWLHA0Rmq/lv9PKT/Xzn4Qi5cLNie9IQiBGhl3NsPmFXVzKEukoW9e9drZAcQ8LKIqtRE
 FsU9HUhPTSD3FsvTlmlkHUI+O241NgkyPS8i1w3AwkEqrh92lU3XDRuKPVJf8H9A8rhj53DP8
 wqMVkg080DM/y1rHtCCNEOjKYDZgYZsAlar2PNOwz72tXI2SvexpJM8n4vSp1yW9dBctv4kXf
 gE5SF2LQ7d83+PFiiqZgaNwatjcaHvX8OZrtFete4KyYys3C7Jx4gumiPV8bANbmiDeBvZWi8
 PyPuPG5l4k/40kUIggMzy8hlFaQmqyT8h1b4+wJ4WoKOiORoFkUPn9BYIPw1ADX9MW4A5VLrK
 +qyOkEvd3Anjs9CvRNcx8k5+cOJJdgrT/E8klzLl7e9K5aFHB7ie4hToL3kX+qT5j1xgy9loc
 K/3GCDKRj4baL8=
Subject: [Buildroot] [PATCH v1 00/13] GStreamer 1.18.5 stable bug fix release
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

GStreamer 1.18.5 stable bug fix release

For details see [1].

[1] https://gstreamer.freedesktop.org/releases/1.18/#1.18.5

Peter Seiderer (13):
  package/gstreamer1: bump version to 1.18.5
  package/gst1-plugins-base: bump version to 1.18.5
  package/gst1-plugins-good: bump version to 1.18.5
  package/gst1-plugins-bad: bump version to 1.18.5
  package/gst1-plugins-ugly: bump version to 1.18.5
  package/gst1-devtools: bump version to 1.18.5
  package/gst1-libav: bump version to 1.18.5
  package/gst1-vaapi: bump version to 1.18.5
  package/gst1-rtsp-server: bump version to 1.18.5
  package/gstreamer1-editing-services: bump version to 1.18.5
  package/gst-omx: bump version to 1.18.5
  package/gst1-python: bump version to 1.18.5
  package/gst1-interpipe: bump version to 1.1.5

 package/gstreamer1/gst-omx/gst-omx.hash       |  4 +-
 package/gstreamer1/gst-omx/gst-omx.mk         |  2 +-
 .../gst1-devtools/gst1-devtools.hash          |  4 +-
 .../gstreamer1/gst1-devtools/gst1-devtools.mk |  2 +-
 .../gst1-interpipe/gst1-interpipe.hash        |  2 +-
 .../gst1-interpipe/gst1-interpipe.mk          |  2 +-
 package/gstreamer1/gst1-libav/gst1-libav.hash |  4 +-
 package/gstreamer1/gst1-libav/gst1-libav.mk   |  2 +-
 .../gst1-plugins-bad/gst1-plugins-bad.hash    |  4 +-
 .../gst1-plugins-bad/gst1-plugins-bad.mk      |  2 +-
 ...gstgl-Fix-build-when-Meson-0.58.0rc1.patch | 51 -------------------
 .../gst1-plugins-base/gst1-plugins-base.hash  |  4 +-
 .../gst1-plugins-base/gst1-plugins-base.mk    |  2 +-
 .../gst1-plugins-good/gst1-plugins-good.hash  |  4 +-
 .../gst1-plugins-good/gst1-plugins-good.mk    |  2 +-
 .../gst1-plugins-ugly/gst1-plugins-ugly.hash  |  4 +-
 .../gst1-plugins-ugly/gst1-plugins-ugly.mk    |  2 +-
 .../gstreamer1/gst1-python/gst1-python.hash   |  4 +-
 package/gstreamer1/gst1-python/gst1-python.mk |  2 +-
 .../gst1-rtsp-server/gst1-rtsp-server.hash    |  4 +-
 .../gst1-rtsp-server/gst1-rtsp-server.mk      |  2 +-
 package/gstreamer1/gst1-vaapi/gst1-vaapi.hash |  4 +-
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk   |  2 +-
 .../gstreamer1-editing-services.hash          |  4 +-
 .../gstreamer1-editing-services.mk            |  2 +-
 package/gstreamer1/gstreamer1/gstreamer1.hash |  4 +-
 package/gstreamer1/gstreamer1/gstreamer1.mk   |  2 +-
 27 files changed, 38 insertions(+), 89 deletions(-)
 delete mode 100644 package/gstreamer1/gst1-plugins-base/0002-gstgl-Fix-build-when-Meson-0.58.0rc1.patch

-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
