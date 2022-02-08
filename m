Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E37C433EF
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 21:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DCA3827F0;
	Tue,  8 Feb 2022 21:27:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hjE-GesUSpaY; Tue,  8 Feb 2022 21:26:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7086829FE;
	Tue,  8 Feb 2022 21:26:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 850BE1BF9A4
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 21:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 622304024D
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 21:24:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PG1l-N_8SycN for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 21:24:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DDEFF4018B
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 21:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644355447;
 bh=cku/hht+lQTXzfGL2RPLOaw6Zigb8bzL+B/yL3wvyqY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=QFeKyy8iAakrg8c5UoKuxpLvvsFcIfw50tJfdML1A/OARJ6t4X8bN9jaCRi7Ugw5r
 uBiip0zT728PPMa0PWgbbfaqWei6zeQwWquxZuAoE07LRBemplrPI19SojSFBug4l+
 O4g0EP/r96/viE51K0UQjrDIAevva7bwkuFGfdng=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.59]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MS3mt-1njp7M2yhX-00TWda; Tue, 08
 Feb 2022 22:24:07 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue,  8 Feb 2022 22:23:58 +0100
Message-Id: <20220208212405.19243-7-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208212405.19243-1-ps.report@gmx.net>
References: <20220208212405.19243-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:vcCK5m478RmfxGi2xn48YxTNhaWN7KHESPR7DNK+GPyFHX88kMB
 fy6FVIiiK+V+eGxJFw/jlpttKciht1EBflYc7MP83WNERZmONot5zRhjiaH0SB06kZhqXCn
 9Szc+cIudb9qcGTqsLMgAgnVtSca8AHH5N9yhnBCros8gTI28+oAI4+gCqkBICocaKr2wQd
 OKyf8tq4je6eXp6+Q5kVg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:emsbiw22XII=:xeBwqWu5gHOmdZpqFCM72Q
 9hejCc3mliHgiJKqLfKIc/9vsApBdkIpmfGls8uxXjwnRQXYDHAi5bcvm1t21CHFbrVzhBGK2
 e0S7M9dCH/eIs6KsrQBDQuhBY220JaGUX+z93BEY4dhOYRu3SY+xePKOp7waTivx9sa9VmU7W
 xYoJ33rEp42PFmwxbC5yneyBVJ01gtrMLMlftCSm0w09rrYxf9WfSEUfIgukAnUAviWWYxU0a
 dlPVYuMAPqjgVmvq3xaLBOlS7E4IMCHiyhQsCeBOXO1T/9+8tqU4QUKHGmcacj4PIA6XhR/bQ
 VGhb4mRYMnW2bj9xiGXpumqG664mnH8a5v23uXSMA+HKRZFjV74KJgk99DZHQMUNQd3ikUhcx
 HlkN2FUiA8ChZFIfJUE53s3RFEQqIRocjYpe8nrRi34LBFhWBzeDf4T37sQv6HAuwQEEcXOoL
 44G2qE0Vkb3FTd161/vetBC9ze+N7M2RCpM4ngxHNxQDqqizwcOFXmY385LZMjkURZfnp1RBq
 Ky+H/0VBoKSLRcNbZVc5lwLKC/ZJTGsk5aeyyN5stVTz3hDAjJmFCVhx/9ubXjCEGKwO/mV+p
 9+CvVI3/OCjiV1JdMKqhWtnqHGS+yN2JPDN+E8rEXfvzGzl3O6tBY6qu0adVj1T9SzjKLW/01
 cGOyeCuqrlaNRvFo4HlsjBb6ecJMdFluWGBWeFvmdx7SB4csMVZx6qXqIuNrX9w5H2jSdrTt/
 qjDru20C4pQqKv9y7iVh9ysaQ3kOH1GS4/V42GH/dOZaqzEyI8AyIY7kR585moj3wdxoJ7Ogh
 rfg+ayUcmjf0Cg46xBakqWAWZ2UCSW6NLE/GQ0n831r9ZZjkE/pQM4OpuAe/Zgf4nF01WRbwo
 /+U108XSrE/KMOLhzWFooH/lkknV3qynb6DQv0zHYdHBd06Fn9wSk99y92j8o8Lk0mBe+uO2A
 oMN8dJRwrfvHh+c6hVAmCsiI3yNFDhT6DHuZqaXS0xwJFcXN4PCUzkGWfyIVrZOasVeKs8qRS
 h3GxfNXDvv25nP5dAHhpthDSkJKP1KF6jYY1IT1iYdHluHBynGEhEZue3btOjQU4QC/IRTbnq
 /eUqp7Vv8kECX0=
Subject: [Buildroot] [PATCH v1 06/13] package/gst1-devtools: bump version to
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

- use new option cairo ('Build GstValidateVideo') instead pure optional
  dependency on packet cairo

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-devtools/gst1-devtools.hash |  4 ++--
 package/gstreamer1/gst1-devtools/gst1-devtools.mk   | 13 ++++++++++---
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/package/gstreamer1/gst1-devtools/gst1-devtools.hash b/package/gstreamer1/gst1-devtools/gst1-devtools.hash
index 011385e757..dd09280a9c 100644
--- a/package/gstreamer1/gst1-devtools/gst1-devtools.hash
+++ b/package/gstreamer1/gst1-devtools/gst1-devtools.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.18.6.tar.xz.sha256sum
-sha256  3725622c740a635452e54b79d065f963ab7706ca2403de6c43072ae7610a0de4  gst-devtools-1.18.6.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.20.0.tar.xz.sha256sum
+sha256  69fc8756ec9d93e5c5258c99088434f203e91fdbc5af28d1f2c583fd819b7a1d  gst-devtools-1.20.0.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  validate/COPYING
diff --git a/package/gstreamer1/gst1-devtools/gst1-devtools.mk b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
index 66b509ae2c..59a55577cb 100644
--- a/package/gstreamer1/gst1-devtools/gst1-devtools.mk
+++ b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_DEVTOOLS_VERSION = 1.18.6
+GST1_DEVTOOLS_VERSION = 1.20.0
 GST1_DEVTOOLS_SOURCE = gst-devtools-$(GST1_DEVTOOLS_VERSION).tar.xz
 GST1_DEVTOOLS_SITE = https://gstreamer.freedesktop.org/src/gst-devtools
 GST1_DEVTOOLS_LICENSE = LGPL-2.1+
@@ -14,8 +14,7 @@ GST1_DEVTOOLS_INSTALL_STAGING = YES
 GST1_DEVTOOLS_DEPENDENCIES = \
 	gstreamer1 \
 	gst1-plugins-base \
-	json-glib \
-	$(if $(BR2_PACKAGE_CAIRO),cairo)
+	json-glib
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 GST1_DEVTOOLS_DEPENDENCIES += host-python3 python3
@@ -34,4 +33,12 @@ GST1_DEVTOOLS_CONF_OPTS = \
 	-Dtests=disabled \
 	-Ddoc=disabled
 
+# build GstValidateVideo
+ifeq ($(BR2_PACKAGE_CAIRO),y)
+GST1_DEVTOOLS_CONF_OPTS += -Dcairo=enabled
+GST1_DEVTOOLS_DEPENDENCIES += cairo
+else
+GST1_DEVTOOLS_CONF_OPTS += -Dcairo=disabled
+endif
+
 $(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
