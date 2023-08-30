Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5851EC873C
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BCD383AA4;
	Thu,  7 Sep 2023 15:40:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BCD383AA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bPTs-cW6uVr0; Thu,  7 Sep 2023 15:40:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBCCB83CB4;
	Thu,  7 Sep 2023 15:40:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBCCB83CB4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 052B01BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E487041E3F
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E487041E3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nehg-vf9h5vg for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1ADA41E4E
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1ADA41E4E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD860869E0; Thu,  7 Sep 2023 14:51:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 22:38:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bea949996e193e3d40ea7dd45122f8fce75f8cd0
X-Git-Newrev: 060b88ace6772ceb016a1ebe45d415f10c194c6c
X-Patchwork-Hint: ignore
Message-Id: <20230907145133.CD860869E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gr-osmosdr: add support for HACKRF
 receivers
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6096638887131631505=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6096638887131631505==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=060b88ace6772ceb016a1ebe45d415f10c194c6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Böh <contact@martb.dev>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gr-osmosdr/Config.in     | 13 +++++++++++++
 package/gr-osmosdr/gr-osmosdr.mk |  7 +++++++
 2 files changed, 20 insertions(+)

diff --git a/package/gr-osmosdr/Config.in b/package/gr-osmosdr/Config.in
index d83de75282..72d3c3f481 100644
--- a/package/gr-osmosdr/Config.in
+++ b/package/gr-osmosdr/Config.in
@@ -36,4 +36,17 @@ config BR2_PACKAGE_GR_OSMOSDR_RFSPACE
 	help
 	  Enable RFSPACE Receivers support
 
+config BR2_PACKAGE_GR_OSMOSDR_HACKRF
+	bool "Osmocom HACKRF support"
+	depends on !BR2_STATIC_LIBS # hackrf
+	depends on BR2_TOOLCHAIN_HAS_THREADS # hackrf
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # hackrf
+	select BR2_PACKAGE_HACKRF
+	help
+	  Enable Osmocom HACKRF support
+
+comment "hackrf support needs a toolchain w/ threads, dynamic library, gcc >= 4.9"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
 endif
diff --git a/package/gr-osmosdr/gr-osmosdr.mk b/package/gr-osmosdr/gr-osmosdr.mk
index 6011a67539..8491c005d8 100644
--- a/package/gr-osmosdr/gr-osmosdr.mk
+++ b/package/gr-osmosdr/gr-osmosdr.mk
@@ -54,4 +54,11 @@ else
 GR_OSMOSDR_CONF_OPTS += -DENABLE_RFSPACE=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_GR_OSMOSDR_HACKRF),y)
+GR_OSMOSDR_CONF_OPTS += -DENABLE_HACKRF=ON
+GR_OSMOSDR_DEPENDENCIES += hackrf
+else
+GR_OSMOSDR_CONF_OPTS += -DENABLE_HACKRF=OFF
+endif
+
 $(eval $(cmake-package))

--===============6096638887131631505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6096638887131631505==--
