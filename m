Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72B3C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 19:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F87A40546;
	Thu, 10 Feb 2022 19:31:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6kGnNfMx614O; Thu, 10 Feb 2022 19:31:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5343D4038E;
	Thu, 10 Feb 2022 19:31:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 715161BF3BB
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 19:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C53F81678
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 19:29:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8cVEKK0BeDQj for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 19:29:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6032881985
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 19:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644521347;
 bh=CXFdhnLnb49DTjpnfrFErN6g/mVvP3luoFeGiY0sgIM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=hMo0qTLwFscSJJ8JtOGHmYAds92LnO4s56UvyhkLZkvkzupyJ1nhLQpvwgEWc57RL
 CXFzIY7wYrffvdf6nUhH2Y8XaTglnORh912XQBwRArmxPlYUZg2TmPuJekxCoQTa+i
 vYU7ScDYSnVGePvEmrIycabfLVm2vY6SMgZ2ZZwU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.34]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MhD2O-1nwXh308EE-00ePdb; Thu, 10
 Feb 2022 20:29:07 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 10 Feb 2022 20:28:57 +0100
Message-Id: <20220210192905.4500-6-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220210192905.4500-1-ps.report@gmx.net>
References: <20220210192905.4500-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:a94fYHZ8BrR7A8n52Z/p3cMhVxKG/R6gzWn3D2yXsCWm0jGjnhF
 UxRcH6IyRBETVs8vZnGsSWy7mlR5S5gFjJBoF2Zpm1jEbmE9PRFuLy426elgJLZ+OBQhYBO
 lCz8d26CSfWZs4MBam+VLBSr0DI8hiBOlWPDThjjFMhDbD2rgeV5F0JUGuIZKMOGVfKqT5e
 khFDOX316JZM3q8ccPlKw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:g6e2iyGgkqM=:UowpG3MqkvOEBoq/+6AhLX
 hAlsYYjZ2Wxf+LEOBUZqeitYjbDXPp5hspJRrV2fVr+3MgDWspcC2r/zdIKAzWt5aZOtKSnlg
 n5P+rGd2sHQ4yQOvCkU0s0Qk+P0bpUNIFcUMV/AB1DrKdmwco3xUssCvLv5B74o0f0myvVXIg
 tbskFeDBX61tQVVslDPp97BBj9PX6gZOU+EcksXdXa151MgDfKh4CxroXEU1VmqSzay3S1cmY
 tlYwXpS/zQL/HV9pyywTOFfQcmp8ChRw0AjWw+6cdrH1yY9tPrxoikRIpMBG9jEnfdH9vQPAZ
 /EioeZUUa9C116gayOFeBTqcXPZ3otL80DROHvVn4snurf7nG1npbzjvaooVEiCBkZ5aJI6o5
 wKIYyksjtvVwvN9/7H1BmaN3DbWmor6+c4g9adijCXIyF6m1K4UgyRzoEXJ/Bssq+n1KLfdtc
 8VYGxXr0ZEOOB+sHK/q/aOGeSLIiM1r0MHcEDsms4YXBxLrqYSO0RtIEJno/DPUv6z6pk6sY+
 9kwCmDIrX0OJObalWsul0X49qX0M7AUMYSbskv9U/0kyEe/RCkRddwkmhI5jn0RRs+PNqOGp5
 chC+iXGo06ujll/0xpeKWwtjmAKwC/GsPOLKTe+QctbaxPDZvvX8/bB5VfJWAzBv/pDi5rkac
 jMDYcTrHDcxX92XDVBMVXPKcDxSxC4QfB6d6xQ2X2AVn+V5VWwQGMquaFBWWSI9VI/a59/cJZ
 boiKAzVBW7PsCg45ncGcLOLHxq9oUYyZD6IGfrJ9iqROkbppJ8lEuf2Ib4uNryfq8TsURQft6
 5wlvIFTWbsLpN8DDIcr8P9SLeE15QaG5X95b+GiJ47Nq0BkV555RqloYv7WnosnfSmArhUbt6
 T9PfwFPg84vjkTWyihpbNaf8/kBrhP/BilG56Q7CoJ5ZuH5fqBIXBG3nFGar+0znNARKA7BEa
 +Z2CQEv4ekqXRhu+9cM/ks+cei/NF9rqEEAkgvhgxZUtvCXifofNahWQ/X2uMAUCDrNKUn8sq
 vMcpXI1QyHL18a5UzY7pIzPWyorT+UAI27eV6cZXpzKGCkfSbv7/RiWKN3zYQmcf7PZEIp0g9
 PXr+Dn+p6KY5sU=
Subject: [Buildroot] [PATCH v2 05/13] package/gst1-plugins-ugly: bump
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
