Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E0A6C54EAA
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 14:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C791560F95;
	Mon, 30 Jan 2023 14:47:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C791560F95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 32bM65eZ8ITb; Mon, 30 Jan 2023 14:47:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 074B160F69;
	Mon, 30 Jan 2023 14:47:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 074B160F69
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 105D01BF37C
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 14:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEDB640A20
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 14:47:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEDB640A20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GUp0XvgWwhTW for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 14:47:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D3BD405A4
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0D3BD405A4
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 14:47:00 +0000 (UTC)
Received: (Authenticated sender: maxime.chevallier@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4C14FC0004;
 Mon, 30 Jan 2023 14:46:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 30 Jan 2023 15:46:52 +0100
Message-Id: <20230130144655.1193660-2-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130144655.1193660-1-maxime.chevallier@bootlin.com>
References: <20230130144655.1193660-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675090018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wTcWxsC5HI15IlqtWZk/qLi9BQJ3xbA3Pwi3h3AlFis=;
 b=fxqJqOgiBtlSYD2MKBwQgOCAlb88THiMVmtPt402z7iPkZeVNd5/ptY4YdM00NbuJ+UxeW
 vmUgjTj+wf7pD+VFRUuHxE4sBddpbkOoaIVLdnWQG3vw/gKgf9zgsrjVLaE5mgeNrjetoN
 w09DRfrubXuvgZad/P2FZH1wvQgbKHHPpkMAeczdLF0XTCkpJjNIkMcFhccgUU+SkpVSf8
 ZO2gHX0ru6LYNRo3VkmvBm+h5YFGRjx4C2odmYUYKirz8fQ8qwsm1hSSXGCpQvlb5aJHdW
 TZmOWcr9LJUMsgdPc7mlbVcmkZJo/wWYYvIX1gYMEqLN8/f0SZdYKnsPoA0nGw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fxqJqOgi
Subject: [Buildroot] [PATCH 1/4] package/libtraceevent: new package
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

Introduce the libtraceevent library, that used to be bundled with the
trace-cmd tool. This library is now used by several tools and libraries
such as trace-cmd, libtracefs and rtla.

This package tries to install libraries in /usr/local/lib by default,
hence the redefinition of the "prefix" variable, so that the library
gets installed in "/usr/lib" instead.

The same applies to the pkgconfig handling of the proved Makefile, which
installs the .pc files in the /usr/local area by default, hence the
redefinition of the pkgconfig_dir to either the correct directory within the
staging area, or to empty value for the target to avoid installing the .pc
in that case.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 DEVELOPERS                             |  3 +++
 package/Config.in                      |  1 +
 package/libtraceevent/Config.in        |  9 +++++++
 package/libtraceevent/libtraceevent.mk | 33 ++++++++++++++++++++++++++
 4 files changed, 46 insertions(+)
 create mode 100644 package/libtraceevent/Config.in
 create mode 100644 package/libtraceevent/libtraceevent.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 706ee80ece..fcf05e0aa0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2106,6 +2106,9 @@ F:	package/postgresql/
 F:	package/protozero/
 F:	package/timescaledb/
 
+N:	Maxime Chevallier <maxime.chevallier@bootlin.com>
+F:	package/libtraceevent/
+
 N:	Michael Durrant <mdurrant@arcturusnetworks.com>
 F:	board/arcturus/
 F:	configs/arcturus_ucp1020_defconfig
diff --git a/package/Config.in b/package/Config.in
index 83fddf316f..2f0e6dcb18 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -117,6 +117,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/kyua/Config.in"
 	source "package/latencytop/Config.in"
 	source "package/libbpf/Config.in"
+	source "package/libtraceevent/Config.in"
 	source "package/lmbench/Config.in"
 	source "package/lsof/Config.in"
 	source "package/ltp-testsuite/Config.in"
diff --git a/package/libtraceevent/Config.in b/package/libtraceevent/Config.in
new file mode 100644
index 0000000000..d351e3b4de
--- /dev/null
+++ b/package/libtraceevent/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBTRACEEVENT
+	bool "libtraceevent"
+	help
+	  libtraceevent is a library that interfaces with the ftrace
+	  subsystem in the linux kernel.
+	  It used to be bundled directly in the trace-cmd
+	  tool, but it was eventually extracted so that it can be used
+	  by multiple other tools and libraries, such as libtracefs and
+	  rtla.
diff --git a/package/libtraceevent/libtraceevent.mk b/package/libtraceevent/libtraceevent.mk
new file mode 100644
index 0000000000..0125023508
--- /dev/null
+++ b/package/libtraceevent/libtraceevent.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# libtraceevent
+#
+################################################################################
+
+LIBTRACEEVENT_VERSION = 1.7.1
+LIBTRACEEVENT_SITE = https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/snapshot
+LIBTRACEEVENT_INSTALL_STAGING = YES
+LIBTRACEEVENT_LICENSE = GPL-2.0, LGPL-2.1
+LIBTRACEEVENT_LICENSE_FILES = LICENSES/GPL-2.0 LICENSES/LGPL-2.1
+
+define LIBTRACEEVENT_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define LIBTRACEEVENT_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+	DESTDIR=$(STAGING_DIR) \
+	pkgconfig_dir="/usr/lib/pkgconfig" \
+	prefix="/usr" \
+	install
+endef
+
+define LIBTRACEEVENT_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+	DESTDIR=$(TARGET_DIR) \
+	pkgconfig_dir="" \
+	prefix="/usr" \
+	install
+endef
+
+$(eval $(generic-package))
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
