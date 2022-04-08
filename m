Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 580E0C433F5
	for <buildroot@archiver.kernel.org>; Fri,  8 Apr 2022 12:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 048E060B83;
	Fri,  8 Apr 2022 12:45:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BnZ-v_SydpZJ; Fri,  8 Apr 2022 12:45:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0371960B35;
	Fri,  8 Apr 2022 12:45:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 966B81BF292
 for <buildroot@lists.busybox.net>; Fri,  8 Apr 2022 12:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85C94842F4
 for <buildroot@lists.busybox.net>; Fri,  8 Apr 2022 12:45:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R9dxRW1cx82Z for <buildroot@lists.busybox.net>;
 Fri,  8 Apr 2022 12:45:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2CBAC842B6
 for <buildroot@buildroot.org>; Fri,  8 Apr 2022 12:45:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 23E70836F7; Fri,  8 Apr 2022 12:35:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 8 Apr 2022 14:39:35 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: ef40ad9e3c22b7ff5d42d4c1583b4a6c15870e81
X-Git-Newrev: 6ac463b65f3e57fcdd0340be47e97bb7d4838643
X-Patchwork-Hint: ignore
Message-Id: <20220408123554.23E70836F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/udpcast: fix
 build without pod2man
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

commit: https://git.buildroot.net/buildroot/commit/?id=6ac463b65f3e57fcdd0340be47e97bb7d4838643
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

udpcast unconditionally build manpages which will raise the following
build failure without pod2man since at least bump to version 20200328 in
commit 4fb91d8b9dff314fc53438144f843b3e3ceaacaa:

sh: line 1: pod2man: command not found

To fix this issue, rework how udpcast is built and installed to always
build and install the sender or the receiver and never build the
manpages. As a side effect, this will also avoid to install the unneeded
rateGovernor.h

Fixes:
 - http://autobuild.buildroot.org/results/ce602a09357e950d79794391cd4a852d565914f1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit b49e3da1abf3a6c8affac08089311fc6590f54d0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/udpcast/Config.in  |  2 ++
 package/udpcast/udpcast.mk | 24 ++++++++----------------
 2 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/package/udpcast/Config.in b/package/udpcast/Config.in
index ef94b30a99..cc38c6e57c 100644
--- a/package/udpcast/Config.in
+++ b/package/udpcast/Config.in
@@ -6,6 +6,8 @@ config BR2_PACKAGE_UDPCAST
 	bool "udpcast"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_UDPCAST_SENDER \
+		if !BR2_PACKAGE_UDPCAST_RECEIVER
 	help
 	  A multicast protocol implementation which happens to
 	  be very handy for imaging drives over the network.
diff --git a/package/udpcast/udpcast.mk b/package/udpcast/udpcast.mk
index 34ebddd2d5..4c151bb41f 100644
--- a/package/udpcast/udpcast.mk
+++ b/package/udpcast/udpcast.mk
@@ -9,23 +9,15 @@ UDPCAST_SITE = http://www.udpcast.linux.lu/download
 UDPCAST_DEPENDENCIES = host-m4
 UDPCAST_LICENSE = BSD-2-Clause, GPL-2.0+
 UDPCAST_LICENSE_FILES = COPYING
+UDPCAST_TARGETS = \
+	$(if $(BR2_PACKAGE_UDPCAST_RECEIVER),udp-receiver) \
+	$(if $(BR2_PACKAGE_UDPCAST_SENDER),udp-sender)
+UDPCAST_MAKE_OPTS = $(UDPCAST_TARGETS)
 
-define UDPCAST_REMOVE_UDP_SENDER
-	rm -f $(TARGET_DIR)/usr/sbin/udp-sender
-	rm -f $(TARGET_DIR)/usr/sbin/udp-sender.1
+define UDPCAST_INSTALL_TARGET_CMDS
+	$(foreach f,$(UDPCAST_TARGETS),\
+		$(INSTALL) -D -m 755 $(@D)/$(f) $(TARGET_DIR)/usr/sbin/$(f)
+	)
 endef
 
-ifneq ($(BR2_PACKAGE_UDPCAST_SENDER),y)
-UDPCAST_POST_INSTALL_TARGET_HOOKS += UDPCAST_REMOVE_UDP_SENDER
-endif
-
-define UDPCAST_REMOVE_UDP_RECEIVER
-	rm -f $(TARGET_DIR)/usr/sbin/udp-receiver
-	rm -f $(TARGET_DIR)/usr/sbin/udp-receiver.1
-endef
-
-ifneq ($(BR2_PACKAGE_UDPCAST_RECEIVER),y)
-UDPCAST_POST_INSTALL_TARGET_HOOKS += UDPCAST_REMOVE_UDP_RECEIVER
-endif
-
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
