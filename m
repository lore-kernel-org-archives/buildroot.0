Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A68C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 22:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF6D941A64;
	Mon, 25 Jul 2022 22:30:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF6D941A64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id phKzJcNVCswi; Mon, 25 Jul 2022 22:30:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 389B541A52;
	Mon, 25 Jul 2022 22:30:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 389B541A52
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AD22A1BF363
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:29:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF8D583DF1
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:29:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF8D583DF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gFyZ7H1iNCIC for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 22:29:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27C70830E3
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 22:29:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27C70830E3
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C4B7C85E6D; Mon, 25 Jul 2022 22:15:20 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 00:11:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f0e7c687f7fddb47b75740b8278a4ff95aa28336
X-Git-Newrev: f0469f30d6ca569930a5edb277f18fe2cb6aa7b7
X-Patchwork-Hint: ignore
Message-Id: <20220725221520.C4B7C85E6D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpd: add io_uring optional
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=f0469f30d6ca569930a5edb277f18fe2cb6aa7b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since version 0.22 mpd provides an option to use the io_uring kernel interface
for asynchronous access to local files. Buildroot has the necessary library
(package/liburing) since commit 03ca6f4e39874583060317e7e15e9e360220877e.

Add an optional dependency on liburing to enable asynchronous file access using
the kernel io_uring interface.

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mpd/Config.in | 10 ++++++++++
 package/mpd/mpd.mk    |  7 +++++++
 2 files changed, 17 insertions(+)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index fc0f409448..8f0af7b2d3 100644
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
+comment "io_uring support needs a toolchain w/ headers >= 5.1"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
+
 config BR2_PACKAGE_MPD_LIBMPDCLIENT
 	bool "libmpdclient"
 	select BR2_PACKAGE_LIBMPDCLIENT
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index e265a9fc4f..c21426b873 100644
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
