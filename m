Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8205DC433F5
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 21:24:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F03760E3A;
	Tue,  8 Feb 2022 21:24:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3qlPRkg9-sfg; Tue,  8 Feb 2022 21:24:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 577C460AB9;
	Tue,  8 Feb 2022 21:24:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7C66B1BF391
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 21:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFC6B60E27
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 21:24:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jNY3wc1UJCsq for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 21:24:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4605E6077D
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 21:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644355446;
 bh=1DquwH4ZUrUXAsoVeCT8210OlZKBYfeCwWTO3HWPct8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=iaooFHqXvicdP66gDNO1bqKO91xbPaFuOQC5BN9DkzJYtgxPK28zvC3Xvs1SvZQj5
 hds+pNnN5WAmBSpWmCfd77DgVroRjTFWgtkOmz0F/1Jj0mjR1XRZ1wu0vXY/N0hGuK
 2JbqPWrs0YT6nkKrlkdn6f1nbGd14ggrp0pXhsX8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.59]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MuUjC-1o7aM81agE-00rYuN; Tue, 08
 Feb 2022 22:24:06 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue,  8 Feb 2022 22:23:52 +0100
Message-Id: <20220208212405.19243-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:UMQ9jueeV2KeoyFL3t/WBCViW+O4iGF7zMpBzAMtZVUgk28U/hS
 ftAF0DLhqwk3ofcbUUxcJ97xU0+dzjyRr4zGTdgIzXbJnHvWh1Hf8RcyXX51x0rh6lYzMgP
 foHrDCgUE15gQm6LzKCGPcCIj751Jd8GCQo+K+iAA+M9Rb7nNMiCIjbMkTfWSG+triKQlo3
 hq3D0xIGYVrZZvHBwKYUQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ec9hXOm/zLE=:mFkrPttiLfC7LsqOGGXXZQ
 q/QEijdQt1d9JV0rUm0toY2YQh60pdEQe1tGXVG17ACLls0U04Xtvx8AeDWq1NdnZNkN65JsM
 ia/vWodCmaD5/bEvGAOxkZJ9Gkfta4pfA68ss3rapXc+i+rufSbZCfXXpE5ctyWbq0qxXSE9V
 bwojaEHn6oDBBW404rLm+nKmpbkH9+dRKtZ95zeIZ2kWMt6aXaktVytFZ3MMO+TJlBrKNRTBs
 pmIl0GYIC2kwrJAVxK3HjY7TKIds7zVGUhvMGmLm2t6Gb+PC+IJqDoFAa7TfudMpcUlmH1OaG
 czgP5Rp3ty3sO25oOv0mnheVnIKk4JEZCe27/OGHS1/ONEFZonMMVIuKIcP8taQJ4wfhDw8Pd
 ojJCT08ux4MJwD6QhFm1+cadsdYwd7frSNaapOoQLwzS11EZzo5cw1UW5FlL+F1aMsYjAWKMv
 gVz0y4rv79PLMxtB6Tgp3+6YtF9KA5qFRkz+uFdRsEuLXdA4w6NAIEL8JMlbfKaDCMDKFBNXJ
 Vu0ixJfvJz3k+VtDCq8WIud0PDKemkMlt3LniVgZBA/79/DHAa01UNYggofYtFaSn0qwn0D78
 NzrtO4bzofKjdVfbqpfPSMKvAZ2v+XCrHi2wZQInki2hRsk/+5dz1OLwYDRfaGtz4VAukNZbe
 oTd/T8+rrUxee/6pCG7lqMEoj0kihFaE2WcqMlZZ2gZbs7IqM/PffFqA2tAW2Q+CtvuthzUIp
 S3dAOwILpvKg9BcYZb5UprqbrxeLOOo3JYyQtE6iUArMyH3cQ5iY03BQEBRbYVAppnagJzLn3
 3x+j/CL3IPBmxtxe/iAvs6bKTvu9c8E7UBNtks899edrgxCeJTswtc/9Ueuen5FtCYHwH8vDs
 kHyYD5teicqHy1RU9HlufeMRpwJmZkCB9kp5Z6CCFSERFVVnS04ab6b1IBUYLf7bkr8AwNr5A
 dCQ/3tiVc5HQ4W17pYx3SOMIKUTVKfwsk54ginvn5MNW+gZStytdJV51voryvBjHyqO7haC96
 ivisV1AkPPWMQgmRfr2J1UKizjURKDsHn8NSFFF1eNXCpLH+T/A77sG7Is3oajnAhg9HIcoAF
 QxUo9aEktO/QaM=
Subject: [Buildroot] [PATCH v1 00/13] package/gstreamer1/*: bump version to
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

For details see [1] and [2].

[1] https://lists.freedesktop.org/archives/gstreamer-devel/2022-February/079534.html
[2] https://gstreamer.freedesktop.org/releases/1.20/

Peter Seiderer (13):
  package/gstreamer1: bump version to 1.20.0
  package/gst1-plugins-base: bump version to 1.20.0
  package/gst1-plugins-good: bump version to 1.20.0
  package/gst1-plugins-bad: bump version to 1.20.0
  package/gst1-plugins-ugly: bump version to 1.20.0
  package/gst1-devtools: bump version to 1.20.0
  package/gst1-libav: bump version to 1.20.0
  package/gst1-vaapi: bump version to 1.20.0
  package/gst1-rtsp-server: bump version to 1.20.0
  package/gstreamer1-editing-services: bump version to 1.20.0
  package/gst-omx: bump version to 1.20.0
  package/gst1-python: bump version to 1.20.0
  package/gst1-plugins-bayer2rgb-neon: fix plugin install

 Config.in.legacy                              | 22 ++++++----
 package/gstreamer1/gst-omx/gst-omx.hash       |  4 +-
 package/gstreamer1/gst-omx/gst-omx.mk         |  2 +-
 .../gst1-devtools/gst1-devtools.hash          |  4 +-
 .../gstreamer1/gst1-devtools/gst1-devtools.mk | 13 ++++--
 package/gstreamer1/gst1-libav/gst1-libav.hash |  6 +--
 package/gstreamer1/gst1-libav/gst1-libav.mk   |  4 +-
 ...n-Allow-building-against-neon-0-32-x.patch | 29 -------------
 package/gstreamer1/gst1-plugins-bad/Config.in | 31 +++++++++-----
 .../gst1-plugins-bad/gst1-plugins-bad.hash    |  4 +-
 .../gst1-plugins-bad/gst1-plugins-bad.mk      | 36 ++++++++++++----
 .../gst1-plugins-base/gst1-plugins-base.hash  |  6 +--
 .../gst1-plugins-base/gst1-plugins-base.mk    |  5 ++-
 .../gst1-plugins-bayer2rgb-neon.mk            |  4 +-
 .../gst1-plugins-good/gst1-plugins-good.hash  |  4 +-
 .../gst1-plugins-good/gst1-plugins-good.mk    |  2 +-
 .../gst1-plugins-ugly/gst1-plugins-ugly.hash  |  4 +-
 .../gst1-plugins-ugly/gst1-plugins-ugly.mk    |  3 +-
 .../gstreamer1/gst1-python/gst1-python.hash   |  4 +-
 package/gstreamer1/gst1-python/gst1-python.mk |  2 +-
 ...-rtsp-server-meson.build-add-gst_dep.patch | 41 -------------------
 .../gst1-rtsp-server/gst1-rtsp-server.hash    |  8 ++--
 .../gst1-rtsp-server/gst1-rtsp-server.mk      |  4 +-
 package/gstreamer1/gst1-vaapi/gst1-vaapi.hash |  4 +-
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk   |  2 +-
 .../gstreamer1-editing-services.hash          |  4 +-
 .../gstreamer1-editing-services.mk            |  2 +-
 package/gstreamer1/gstreamer1/gstreamer1.hash |  6 +--
 package/gstreamer1/gstreamer1/gstreamer1.mk   |  5 +--
 29 files changed, 119 insertions(+), 146 deletions(-)
 delete mode 100644 package/gstreamer1/gst1-plugins-bad/0001-neon-Allow-building-against-neon-0-32-x.patch
 delete mode 100644 package/gstreamer1/gst1-rtsp-server/0001-gst-rtsp-server-meson.build-add-gst_dep.patch

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
