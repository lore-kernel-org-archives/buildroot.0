Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD1FAC433F5
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 21:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B3C08293F;
	Tue,  8 Feb 2022 21:25:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v-sHPe7Uv2X4; Tue,  8 Feb 2022 21:25:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7C01827F0;
	Tue,  8 Feb 2022 21:25:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 26F591BF9AD
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 21:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 386C64024D
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 21:24:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xyp6Q7Jf4AFV for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 21:24:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F00CF402AD
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 21:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644355447;
 bh=CXFdhnLnb49DTjpnfrFErN6g/mVvP3luoFeGiY0sgIM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Wv9fiHhDZMiVoLWCUamv2YnMlNXxXVl29eR2FOY8pJevcvezeSy5oQvIS1x2xeN/B
 WL2nPApC1+mOINKVkQTa0DIsSOdYZpOJ6ajRo1e7lW6PVhJ+ZqTHfLaduPPqDis4vd
 lupIu1aqnw+w/RY+SDM3dpQNaNQnzVGvrhwQ3BFk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.59]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MUowb-1niBUM259l-00QmoO; Tue, 08
 Feb 2022 22:24:07 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue,  8 Feb 2022 22:23:57 +0100
Message-Id: <20220208212405.19243-6-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208212405.19243-1-ps.report@gmx.net>
References: <20220208212405.19243-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:bL6xHvLZ1klZghYOu9Wv2yhb45g/tYIidB0xwPRM9dloFZtSyw3
 LDytK5k3GZPPLC5Xs6lio2DvCca8nmtfMs5lD7e6Yevk7UfKLPeLduseLtvqycDID6/ZKw0
 JBH/1mwctnm7DAS1Y6mLnTIu3cd5DNtjfeyotTeAKhfkaDusicr24o8NkpJF1LiQqBYXMG2
 H51qw6qSXa6Ul20WOPBgg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FIOmKwf7U5I=:EEMp2b3QuauIa3PwWQTdo1
 fI4e8C1zMTd2Yua0JVCLBhmSLOgv5UMs/IRdB4r7dqkW4/Hzp4737oIlXrco6uYiNyRJcgAvf
 txzfq0EcJLpfRuJJbHNwhmCfbJMwOsIUEQlVmgSp+gNKH3ivqkAMnCZjrwvjC+FE7Ceve4jke
 LqZhQCplzEdeVrsHWQRrrJJIlNJYtCn3SMEk59nliKPTsPELgPAmUFuM05KhhujtiAgv0gDac
 1sBIVIJHeaCyI4WdX+YSHgduckxrB1vLdPo+HN/86OnRVBWNbTjRMmCs4dZPCvYm7R6vGSK5A
 BPODDTHadJ73JNcQXTE5hPBgAbicuv4eFeDXY+4GgTnwSpraIok/A2P30grCapiNjCyVzrNsu
 kZS+CpwoWto1TX7pqehNgXJ5CTwOItsdoj7Cq8Es2sQ8i/1rlxHBNeJDxxaSyWT43joDLt2eo
 Kkx/ZRxzRiVpdvlqHqIYnEfXqpwqg1/b3wulogq8x9WsBSW2x9zViUfJWcLNi7UxasmqvzdR/
 dyGH+YgG0zZw8eoPKdY02tkQwOJJ9AlQO5iAy1ojoqKyl9xY7snYwZDqFWJcHYgagMlEadLQS
 H0aydFsGjLUpcMj6Dg9EvR8VaUuqhmlFt2bmWRDGOcxKXwp2LamhU02CrCGb5AsnnToKlVyOq
 bCw8qZRWcnWnvw5j3jvDSfuhq8LkCkfD2z/5Z6vUEfhGjKxoOLyk6cPeyU69aIHfK8ekzwKb7
 N1VO/XphQyrYLMQePrb4k/ujMxw+XCLecJyX99cpQ9e8d/OZiVeAn5CZh+SGTQ5rci7VJhNL/
 HKhWmAH1YOMrBWQTQ/sNborPHVD/KuPrCfzMpQPVZh3G/n9n68hcCGTJm/XjUbq7aBBMxcImz
 QbRSnHrEBf+J/GXMwFqAPlmaPSTN7P+kWsQZnGz0V7LSSgRsDJdp5SP9DJKNAUdYfzoSKHQ2V
 y3I1i0xxuqa+4uCL7ztexyocFIyDndxguBJqrJGBQtFWFzcRZBnEPfxeZiKz4hF43msRvzCd4
 POUqstt9fwqeSxiBF5msppRERQm8tNorL7cbclOGZYBzCs3Hz1mk0iAXxSfhi4hcVqSV8mlcY
 Jo1KruBK0tfCoQ=
Subject: [Buildroot] [PATCH v1 05/13] package/gst1-plugins-ugly: bump
 version to 1.20.0
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

- enable new gpl option ('Allow build plugins that have GPL-licensed
  dependencies') in case gpl plugin enabled

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash | 4 ++--
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk   | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
index 26fd0fd9ac..d16134f24b 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.18.6.tar.xz.sha256sum
-sha256  4969c409cb6a88317d2108b8577108e18623b2333d7b587ae3f39459c70e3a7f  gst-plugins-ugly-1.18.6.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.20.0.tar.xz.sha256sum
+sha256  4e8dcb5d26552f0a4937f6bc6279bd9070f55ca6ae0eaa32d72d264c44001c2e  gst-plugins-ugly-1.20.0.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index 7f483deb81..05b1fab304 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_UGLY_VERSION = 1.18.6
+GST1_PLUGINS_UGLY_VERSION = 1.20.0
 GST1_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST1_PLUGINS_UGLY_VERSION).tar.xz
 GST1_PLUGINS_UGLY_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-ugly
 GST1_PLUGINS_UGLY_LICENSE_FILES = COPYING
@@ -89,6 +89,7 @@ endif
 
 # Add GPL license if GPL plugins enabled.
 ifeq ($(GST1_PLUGINS_UGLY_HAS_GPL_LICENSE),y)
+GST1_PLUGINS_UGLY_CONF_OPTS += -Dgpl=enabled
 GST1_PLUGINS_UGLY_LICENSE += , GPL-2.0
 endif
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
