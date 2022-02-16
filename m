Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D125C433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 15:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64851400E6;
	Wed, 16 Feb 2022 15:50:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mn000jGCNgkJ; Wed, 16 Feb 2022 15:50:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DBEE409CD;
	Wed, 16 Feb 2022 15:50:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 395B41BF2BF
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 15:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2757261013
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 15:50:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8e3YnoN0pljU for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 15:50:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DBF6360ACC
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 15:50:01 +0000 (UTC)
Received: from iago.. (ip5f5be916.dynamic.kabel-deutschland.de [95.91.233.22])
 by serv15.avernis.de (Postfix) with ESMTPSA id EA4F9C608D36;
 Wed, 16 Feb 2022 16:49:58 +0100 (CET)
From: Andreas Ziegler <br015@umbiko.net>
To: buildroot@buildroot.org
Date: Wed, 16 Feb 2022 16:49:10 +0100
Message-Id: <20220216154910.8627-1-br015@umbiko.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at serv15.avernis.de
X-Virus-Status: Clean
Subject: [Buildroot] [PATCH 1/1] package/mpd: add option for async file
 access using io_uring
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
Cc: Andreas Ziegler <br015@umbiko.net>,
 =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In version 0.22 mpd added an option to use the io_uring kernel interface for 
asynchronous access to local files. Buildroot added the necessary library 
(package/liburing) in commit 03ca6f4e39874583060317e7e15e9e360220877e.

Add an option for mpd to optionally enable asynchronous file access using 
io_uring (via liburing).

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
---
 package/mpd/Config.in | 10 ++++++++++
 package/mpd/mpd.mk    |  7 +++++++
 2 files changed, 17 insertions(+)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index fc0f409448..c5a50898e2 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -347,6 +347,16 @@ config BR2_PACKAGE_MPD_AVAHI_SUPPORT
 comment "avahi support needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
 
+config BR2_PACKAGE_MPD_IO_URING
+	bool "io_uring"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
+	select BR2_PACKAGE_LIBURING
+	help
+	  Asynchronous I/O using kernel io_uring subsystem
+
+comment "io_uring needs at least kernel version 5.1"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
+
 config BR2_PACKAGE_MPD_LIBMPDCLIENT
 	bool "libmpdclient"
 	select BR2_PACKAGE_LIBMPDCLIENT
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index a55e4adde2..a0cebedc64 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -119,6 +119,13 @@ else
 MPD_CONF_OPTS += -Did3tag=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_MPD_IO_URING),y)
+MPD_DEPENDENCIES += liburing
+MPD_CONF_OPTS += -Dio_uring=enabled
+else
+MPD_CONF_OPTS += -Dio_uring=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_MPD_JACK2),y)
 MPD_DEPENDENCIES += jack2
 MPD_CONF_OPTS += -Djack=enabled
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
