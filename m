Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A82C54EED
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 14:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D56860F9C;
	Mon, 30 Jan 2023 14:57:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D56860F9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cVfKTK4bPcaI; Mon, 30 Jan 2023 14:57:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D461960F79;
	Mon, 30 Jan 2023 14:57:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D461960F79
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9DB731BF37C
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 14:57:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 816FA60F79
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 14:57:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 816FA60F79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9kp3hIiv1KmY for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 14:57:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D9B960AEB
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4D9B960AEB
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 14:57:06 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id F1804CCCA6
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 14:47:03 +0000 (UTC)
Received: (Authenticated sender: maxime.chevallier@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 898DFC0005;
 Mon, 30 Jan 2023 14:46:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 30 Jan 2023 15:46:54 +0100
Message-Id: <20230130144655.1193660-4-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130144655.1193660-1-maxime.chevallier@bootlin.com>
References: <20230130144655.1193660-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675090020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fBRk1Jj1L7DY+nljN2f5BZcHFOuRPvMc5f/XNq+zsWg=;
 b=UFk+4gGvUBogOdtThiwJkzRtAW0KROQrNTGH6b7wkRcUr3hkFTUIcMmAc3izPKjjLEbmjr
 vEWCcMeor11gz0s48oExRJp+nKaXC6HbR0ENEOzyZHHd/KgUaQGKgqUDjG7jf+cNonit4A
 NLBIAA/Bk59U/iHHz7gfSR6bJ8YRyS9+MfmsSTy+J6E+721onXQvd8MpLJacb2pJzTxexK
 J6RyDlgVesE5BkE9UhAgIkSsNMwByrs1Ov/FE70iUto6iQ85KCYXEYWfWKhQ8nkscreCJG
 vgSA/RYenKA0UfEX5FekppZe/hIUU9q4HQFJZCtZefTnrVGz7QaCMOEwaUeKHw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UFk+4gGv
Subject: [Buildroot] [PATCH 3/4] package/linux-tools: add rtla
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
From: Maxime Chevallier via buildroot <buildroot@buildroot.org>
Reply-To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Pierre Floury <pierre.floury@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The RealTime Linux Analysis tool includes a set of commands that relies
on the osnoise and timerlat tracers from the ftrace kernel subsystem,
allowing to analyze the lantency sources coming from the hardware and
the kernel itself.

This tool was introduced in v5.17, and relies on libtracefs and
libtraceevent, although libtraceevent itself is already a dependency for
libtracefs.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 DEVELOPERS                                |  1 +
 package/linux-tools/Config.in             | 10 +++++++
 package/linux-tools/linux-tool-rtla.mk.in | 32 +++++++++++++++++++++++
 3 files changed, 43 insertions(+)
 create mode 100644 package/linux-tools/linux-tool-rtla.mk.in

diff --git a/DEVELOPERS b/DEVELOPERS
index fe7194f817..8f459c796a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2109,6 +2109,7 @@ F:	package/timescaledb/
 N:	Maxime Chevallier <maxime.chevallier@bootlin.com>
 F:	package/libtraceevent/
 F:	package/libtracefs
+F:	package/linux-tools/linux-tool-rtla.mk.in
 
 N:	Michael Durrant <mdurrant@arcturusnetworks.com>
 F:	board/arcturus/
diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 8a0b6d5802..186392b816 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -102,6 +102,16 @@ config BR2_PACKAGE_LINUX_TOOLS_PERF_NEEDS_HOST_PYTHON3
 
 endif
 
+config BR2_PACKAGE_LINUX_TOOLS_RTLA
+	bool "rtla"
+	select BR2_PACKAGE_LINUX_TOOLS
+	select BR2_PACKAGE_LIBTRACEFS
+	help
+	  Linux 5.17 and later has 2 new tracers, osnoise and timerlat.
+	  There tracers allow performing latency analysis, for which
+	  the rtla tool provides wrapper commands to visualize and
+	  extrace latency traces and reports.
+
 config BR2_PACKAGE_LINUX_TOOLS_SELFTESTS
 	bool"selftests"
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
diff --git a/package/linux-tools/linux-tool-rtla.mk.in b/package/linux-tools/linux-tool-rtla.mk.in
new file mode 100644
index 0000000000..a736e3b785
--- /dev/null
+++ b/package/linux-tools/linux-tool-rtla.mk.in
@@ -0,0 +1,32 @@
+################################################################################
+#
+# rtla
+#
+################################################################################
+
+LINUX_TOOLS += rtla
+
+RTLA_DEPENDENCIES = host-pkgconf libtracefs
+RTLA_MAKE_OPTS = $(LINUX_MAKE_FLAGS) \
+	CC=$(TARGET_CC) \
+	LDFLAGS="$(TARGET_LDFLAGS)" \
+	PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
+
+define RTLA_BUILD_CMDS
+	$(Q)if ! grep install $(LINUX_DIR)/tools/tracing/rtla/Makefile >/dev/null 2>&1 ; then \
+		echo "Your kernel version is too old and does not implement the rtla tool." ; \
+		echo "At least kernel 5.17 must be used." ; \
+		exit 1 ; \
+	fi
+
+	$(TARGET_MAKE_ENV) \
+	$(MAKE) $(RTLA_MAKE_OPTS) \
+	-C $(LINUX_DIR)/tools/tracing rtla
+endef
+
+define RTLA_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/tracing \
+	$(RTLA_MAKE_OPTS) \
+	DESTDIR=$(TARGET_DIR) \
+	rtla_install
+endef
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
