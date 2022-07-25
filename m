Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C23C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 12:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FD66419A5;
	Mon, 25 Jul 2022 12:30:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FD66419A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NnHgngibOsAY; Mon, 25 Jul 2022 12:30:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 104CA4199C;
	Mon, 25 Jul 2022 12:30:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 104CA4199C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5D2CC1BF215
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 12:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3714884C46
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 12:30:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3714884C46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1GyhqlInChb5 for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 12:30:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B891E813C0
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B891E813C0
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 12:30:46 +0000 (UTC)
Received: from iago.. (ip5f5bf989.dynamic.kabel-deutschland.de [95.91.249.137])
 by serv15.avernis.de (Postfix) with ESMTPSA id 760A6BDEC91F;
 Mon, 25 Jul 2022 14:30:43 +0200 (CEST)
From: Andreas Ziegler <br015@umbiko.net>
To: buildroot@buildroot.org
Date: Mon, 25 Jul 2022 14:30:02 +0200
Message-Id: <20220725123002.2967-1-br015@umbiko.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <a4133389-1182-11aa-9edc-215ffd82eb48@smile.fr>
References: <a4133389-1182-11aa-9edc-215ffd82eb48@smile.fr>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at serv15.avernis.de
X-Virus-Status: Clean
Subject: [Buildroot] [PATCH v2 1/1] package/mpd: add io_uring optional
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
Cc: Romain Naour <romain.naour@smile.fr>,
 =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>,
 Andreas Ziegler <br015@umbiko.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since version 0.22 mpd provides an option to use the io_uring kernel interface 
for asynchronous access to local files. Buildroot has the necessary library 
(package/liburing) since commit 03ca6f4e39874583060317e7e15e9e360220877e.

Add an optional dependency on liburing to enable asynchronous file access using 
the kernel io_uring interface.

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
---
Changes v1 -> v2:
  Commit message (Romain Naour)
  Dependency comment (Romain Naour)
  Modify patch description to match commit message

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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
