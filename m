Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8016C433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 21:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F1C940AE3;
	Wed, 16 Mar 2022 21:38:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BJHN6_B7RmMN; Wed, 16 Mar 2022 21:38:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24C1440ADD;
	Wed, 16 Mar 2022 21:38:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6C7311BF2C2
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EDAA40177
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:36:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u1XY_7W_XSwZ for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 21:36:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4431440179
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 21:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1647466576;
 bh=JZFlzhfviM7EYtIZnfbD86ogzqHTJhXRy8bz6aSId+Y=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=elaJaHUo/iGRdl6sZ/R8Fr1BgbjcBSuPb2pomCQFoTMYLOJpK7RaP9ING0rr/Tdig
 cnT463RP51M2yAaoQ7cfEmW8wa7R4kbIM/pHmc0CsN0fEizE1j7zb7ntkpWMfqvY1e
 GDGJQOAn7spRmZSmYpH3fektxt4N7sPTVjMMOr4U=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.226]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MacSe-1o5a1q1KLi-00c7fE for <buildroot@buildroot.org>; Wed, 16 Mar 2022
 22:36:16 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Wed, 16 Mar 2022 22:36:09 +0100
Message-Id: <20220316213614.16878-8-ps.report@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316213614.16878-1-ps.report@gmx.net>
References: <20220316213614.16878-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:2TJ7dqsBVlUq/3vBF3GwRcy01fzZA0qfsQxZLJkxunNrO8wraeL
 Og9C/lU7LHkb07voFbuQSjfd2leKf8+jCSf7WCITrVkP0uLAIOrfC8JOalxJ8QQwNUBuwMO
 aXRvzKrM740ozVYNLYw0W/UrSlYK0+9QS1x4d8BkXerc2b2DJwqnn3vMtgFcKf9MZ6ASZ5h
 uFdBkMMAC2nI+/Jg6AIzQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:A0DNrguCogw=:D6HzrLmQnGHHBE2UXtDNm+
 MTnD5jYbCxpC+WfyLnm9NZiydEtSzNcahjlTkv994KvEBj1BeibsyvzykYOV1JYLtDlpD8QaC
 AJRDibD3C1Kp3O0K0H7ZfiydILJdSliBWsWGuec5kRfabZlLcrZK/XtKfQmMCgWkpWroWKmZe
 LFpeaT0bp/ZbCSKUljJqA+6A6C3gw7JQpxK4uClD9LFmBG9BOoiR5suP5P5mM/HtBG4Gz+yOD
 H59JDg5n4VFQNsC9X3eV4vKUn45C+hm/i40AwAKYjwp6dxS0OEkkZLEsqY2oJJXC2NvfXWX93
 x/yA8KkrH/3CZqt0ZbP0j/YA4MvzwBZTnmIeTm3E+Yi78iro07yQs495zL6XKm3n/PwHBXOwT
 GINtZMxGneMMMQTWAei6uZYEUugAMAJj7W6n3/CLIJGl3798AoqY7dx+SOJWexXPgntqlFlKR
 dF1i/UGOqb0lAdjg65Zg79RcDjTcQ1K5YVxMcTTd9mr4Erf9IpFGQR9vpMQwV9OLgGOVyxI01
 stYaP4Y6WM6u8QnTj6CCfIosQ7V9+uw9UvP/aLYAQ52sc+0PUAq1/tMepnfP2Xu0dHPNSc8bO
 rNKTYxpuAzHu8zWAxzQzUzTewAjCFRowRBB9l7g/+2Ph9zX9ql86jDTmTH3icqVsK9YQFi/t/
 IjaORRoCCf/OAc8zL6cC9370UWocU8rzoyHOat1/UJXlTizMxAI9/GsWJblV6om+bavQMB+dY
 xt7h+TJlnlnFipNOj5WRDHknsT2IPB+QVxZCnLH0R+7RwQhYbV5X7jHfIPCipgoWiedvjIXH9
 zZxkADKwSVQXQzBUuxutMQDbsSUabL7NIyURz5lGXm61FDgJI/6T75fKlq0Ury7etQCYzwxRT
 o1R4qn3W1Y8qOd19WN5qo7BsLz5DxiJvBBRrlnqLTfGP57pHvsVDJU7d3FM5K/mA7/AUfE7ko
 z9otjNQdGx8rsb74d3wiiZ+6R4pKg/ytSXiV7B6wsr/QxM85LfXgmrD7Zm7JQBCv9ycYSvx5R
 y2WXBREiUvRGkmKtwvhLN4iBNou2Yct2XeAXtnaJsA1v+S3dIy4dC4DKfK1IRkWgt93zpWcLF
 p1d5JFi5keBQ0g=
Subject: [Buildroot] [PATCH v1 07/12] package/gst1-libav: bump version to
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
 package/gstreamer1/gst1-libav/gst1-libav.hash | 4 ++--
 package/gstreamer1/gst1-libav/gst1-libav.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-libav/gst1-libav.hash b/package/gstreamer1/gst1-libav/gst1-libav.hash
index 3204de3c14..3f9c849729 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.hash
+++ b/package/gstreamer1/gst1-libav/gst1-libav.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.20.0.tar.xz.sha256sum
-sha256  5eee5ed8d5082a31b500448e41535c722ee30cd5f8224f32982bbaba2eedef17  gst-libav-1.20.0.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.20.1.tar.xz.sha256sum
+sha256  91a71fb633b75e1bd52e22a457845cb0ba563a2972ba5954ec88448f443a9fc7  gst-libav-1.20.1.tar.xz
 sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index f07e5061b4..4e99de45f9 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_LIBAV_VERSION = 1.20.0
+GST1_LIBAV_VERSION = 1.20.1
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = https://gstreamer.freedesktop.org/src/gst-libav
 GST1_LIBAV_LICENSE = LGPL-2.1+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
