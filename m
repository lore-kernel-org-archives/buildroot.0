Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33980C433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Mar 2022 18:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFC1040602;
	Mon, 14 Mar 2022 18:59:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lwkx4jRMj3FG; Mon, 14 Mar 2022 18:59:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B4914055F;
	Mon, 14 Mar 2022 18:59:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 235981BF263
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 18:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 108DD4055F
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 18:59:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ot8PKu05EKOF for <buildroot@lists.busybox.net>;
 Mon, 14 Mar 2022 18:59:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 10D8440157
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 18:59:50 +0000 (UTC)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
 by mailout10.t-online.de (Postfix) with SMTP id 08DDA132E3;
 Mon, 14 Mar 2022 19:59:48 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.197.92]) by fwd73.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1nTpv0-0DewdN0; Mon, 14 Mar 2022 19:59:46 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:56580)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1nTpuz-0000dL-Ed;
 Mon, 14 Mar 2022 19:59:45 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Mon, 14 Mar 2022 19:59:45 +0100
Message-Id: <20220314185945.2823356-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1647284386-0000C4DD-411F543E/0/0 CLEAN NORMAL
X-TOI-MSGID: e0a47afc-c108-4799-8488-430435f6c5bb
Subject: [Buildroot] [PATCH 1/1] package/libcurl: fix libgsasl support
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Contrary to the helptext
https://github.com/curl/curl/blob/master/configure.ac#L152

the configure option is called --with-libgsasl:
https://github.com/curl/curl/blob/master/configure.ac#L1989

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libcurl/libcurl.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 0db0c088cb..a6e5b06b8f 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -128,9 +128,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBGSASL),y)
 LIBCURL_DEPENDENCIES += libgsasl
-LIBCURL_CONF_OPTS += --with-gsasl
+LIBCURL_CONF_OPTS += --with-libgsasl
 else
-LIBCURL_CONF_OPTS += --without-gsasl
+LIBCURL_CONF_OPTS += --without-libgsasl
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCURL_COOKIES_SUPPORT),y)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
