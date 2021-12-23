Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767AAC433F5
	for <buildroot@archiver.kernel.org>; Fri, 24 Dec 2021 08:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E05E3832C6;
	Fri, 24 Dec 2021 08:57:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AKmBpC3hUGSB; Fri, 24 Dec 2021 08:57:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E39482A26;
	Fri, 24 Dec 2021 08:57:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 303931BF3C3
 for <buildroot@lists.busybox.net>; Fri, 24 Dec 2021 08:57:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EE7B60A46
 for <buildroot@lists.busybox.net>; Fri, 24 Dec 2021 08:57:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NWPI3Z6m6dzc for <buildroot@lists.busybox.net>;
 Fri, 24 Dec 2021 08:57:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6EA8460808
 for <buildroot@buildroot.org>; Fri, 24 Dec 2021 08:57:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8484082A9C; Fri, 24 Dec 2021 08:51:33 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 23 Dec 2021 18:47:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d9721168b3b0970f9d2985c09e97274d0f429dfc
X-Git-Newrev: c94dd92c0ff28ad72a1f9cda2d3b06d654617d40
X-Patchwork-Hint: ignore
Message-Id: <20211224085133.8484082A9C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pppd: fix build with kernel >= 5.15
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c94dd92c0ff28ad72a1f9cda2d3b06d654617d40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with kernel >= 5.15:

sys-linux.c:148:10: fatal error: linux/ipx.h: No such file or directory
  148 | #include <linux/ipx.h>
      |          ^~~~~~~~~~~~~

This hook could be removed as soon as a new pppd version is released:
https://github.com/ppp-project/ppp/pull/326

Fixes:
 - http://autobuild.buildroot.org/results/5a7f89e5178735f4d3e3f3360f0feb263f6ac431

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pppd/pppd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 71bfceb607..19b6f3ccce 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -57,6 +57,13 @@ ifeq ($(BR2_PACKAGE_PPPD_OVERWRITE_RESOLV_CONF),y)
 PPPD_POST_EXTRACT_HOOKS += PPPD_SET_RESOLV_CONF
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15),y)
+define PPPD_DROP_IPX
+	$(SED) 's/-DIPX_CHANGE//' $(PPPD_DIR)/pppd/Makefile.linux
+endef
+PPPD_POST_EXTRACT_HOOKS += PPPD_DROP_IPX
+endif
+
 define PPPD_CONFIGURE_CMDS
 	$(SED) 's/FILTER=y/#FILTER=y/' $(PPPD_DIR)/pppd/Makefile.linux
 	$(SED) 's/ifneq ($$(wildcard \/usr\/include\/pcap-bpf.h),)/ifdef FILTER/' $(PPPD_DIR)/*/Makefile.linux
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
