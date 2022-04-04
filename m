Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B682EC433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 18:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 727C660FF8;
	Mon,  4 Apr 2022 18:03:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zKa63y9rVi0k; Mon,  4 Apr 2022 18:03:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7438260FE6;
	Mon,  4 Apr 2022 18:03:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 18C3F1BF35C
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 18:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0873B4033A
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 18:03:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id USCcDxN9IyEQ for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 18:03:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED60540360
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 18:03:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 6E26B81250; Mon,  4 Apr 2022 17:53:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 19:51:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e3b8d098e4809f4cf20d88cce3d00479da25bfa6
X-Git-Newrev: b49e3da1abf3a6c8affac08089311fc6590f54d0
X-Patchwork-Hint: ignore
Message-Id: <20220404175353.6E26B81250@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/udpcast: fix build without pod2man
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

commit: https://git.buildroot.net/buildroot/commit/?id=b49e3da1abf3a6c8affac08089311fc6590f54d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
