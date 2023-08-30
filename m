Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C442C83F01
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 20:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8971417F5;
	Wed, 30 Aug 2023 20:39:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8971417F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XJBggRpj6sNV; Wed, 30 Aug 2023 20:39:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F179417E9;
	Wed, 30 Aug 2023 20:39:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F179417E9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E37831BF40B
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 20:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD39F60BD8
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 20:39:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD39F60BD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5AIzpLX-1sTQ for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 20:39:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01C9460BBD
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 20:39:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01C9460BBD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E1D7786628; Wed, 30 Aug 2023 20:39:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 22:38:30 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: bea949996e193e3d40ea7dd45122f8fce75f8cd0
X-Git-Newrev: 060b88ace6772ceb016a1ebe45d415f10c194c6c
X-Patchwork-Hint: ignore
Message-Id: <20230830203913.E1D7786628@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gr-osmosdr: add
 support for HACKRF receivers
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
Content-Type: multipart/mixed; boundary="===============2336538923348909695=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2336538923348909695==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=060b88ace6772ceb016a1ebe45d415f10c194c6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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

--===============2336538923348909695==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2336538923348909695==--
