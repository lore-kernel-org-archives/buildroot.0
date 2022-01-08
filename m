Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0605AC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 07:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94D5860B14;
	Sat,  8 Jan 2022 07:50:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RESKqYIh4L9o; Sat,  8 Jan 2022 07:50:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18A3360B4E;
	Sat,  8 Jan 2022 07:50:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4775D1BF36B
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 07:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F3CF400FC
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 07:50:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NfcUo1kE3uUm for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 07:50:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0EB0B400C5
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 07:50:26 +0000 (UTC)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
 by mailout05.t-online.de (Postfix) with SMTP id 45ED32659;
 Sat,  8 Jan 2022 08:50:24 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.177.158]) by fwd73.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1n66UV-01yMlN0; Sat, 8 Jan 2022 08:50:19 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:55008)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1n66UU-00089K-Oa;
 Sat, 08 Jan 2022 08:50:18 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 08:50:18 +0100
Message-Id: <20220108075018.22567-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1641628219-0000C4DD-FCE5F50C/0/0 CLEAN NORMAL
X-TOI-MSGID: d0dd99ab-b7be-4925-b38e-6654beb15c9b
Subject: [Buildroot] [PATCH 1/1] package/libmicrohttpd: fix pthread detection
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
Cc: Will Newton <will.newton@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix autobuild failures after bumping the package to 0.9.75 in commit
8ec001b467e22904c0a7ec5780d83afd44ad78f3:

conftest.c:64:26: error: #error "_REENTRANT must be defined"

Fixes:
http://autobuild.buildroot.net/results/f76/f7668104dd64a93f0b343ce3ebbe50b12584184d/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libmicrohttpd/libmicrohttpd.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index f75178bc0a..344e1443fd 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -12,6 +12,10 @@ LIBMICROHTTPD_INSTALL_STAGING = YES
 LIBMICROHTTPD_CONF_OPTS = --disable-curl --disable-examples
 LIBMICROHTTPD_CFLAGS = $(TARGET_CFLAGS) -std=c99
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+LIBMICROHTTPD_CFLAGS += -D_REENTRANT
+endif
+
 LIBMICROHTTPD_CONF_ENV += CFLAGS="$(LIBMICROHTTPD_CFLAGS)"
 
 ifeq ($(BR2_PACKAGE_LIBMICROHTTPD_SSL),y)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
