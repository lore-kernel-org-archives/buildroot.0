Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF25C433F5
	for <buildroot@archiver.kernel.org>; Wed, 15 Dec 2021 22:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC16182EA1;
	Wed, 15 Dec 2021 22:40:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id slmBEKt1YJXc; Wed, 15 Dec 2021 22:40:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54D7082E29;
	Wed, 15 Dec 2021 22:40:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E89F1BF44A
 for <buildroot@lists.busybox.net>; Wed, 15 Dec 2021 22:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D4F060FA0
 for <buildroot@lists.busybox.net>; Wed, 15 Dec 2021 22:40:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 22ZsA_0S1zTr for <buildroot@lists.busybox.net>;
 Wed, 15 Dec 2021 22:40:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 769F260F9F
 for <buildroot@buildroot.org>; Wed, 15 Dec 2021 22:40:42 +0000 (UTC)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
 by mailout10.t-online.de (Postfix) with SMTP id 41616D6DB;
 Wed, 15 Dec 2021 23:39:14 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.188.64]) by fwd73.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mxcvS-0ZbYcz0; Wed, 15 Dec 2021 23:39:06 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:40184)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mxcvR-0002yd-Q1;
 Wed, 15 Dec 2021 23:39:05 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Wed, 15 Dec 2021 23:39:05 +0100
Message-Id: <20211215223905.1844641-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1639607946-0000147C-76B5250E/0/0 CLEAN NORMAL
X-TOI-MSGID: 6e5e87b2-4abb-4410-a336-30d57d14c347
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: add optional support for
 pcre2
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

pcre2 takes precedence of pcre:
https://github.com/tvheadend/tvheadend/blob/master/configure#L473

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tvheadend/tvheadend.mk | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 27443307da..4e84e496bf 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -121,11 +121,14 @@ TVHEADEND_DEPENDENCIES += liburiparser
 TVHEADEND_CFLAGS += $(if $(BR2_USE_WCHAR),,-DURI_NO_UNICODE)
 endif
 
-ifeq ($(BR2_PACKAGE_PCRE),y)
+ifeq ($(BR2_PACKAGE_PCRE2),y)
+TVHEADEND_DEPENDENCIES += pcre2
+TVHEADEND_CONF_OPTS += --disable-pcre --enable-pcre2
+else ifeq ($(BR2_PACKAGE_PCRE),y)
 TVHEADEND_DEPENDENCIES += pcre
-TVHEADEND_CONF_OPTS += --enable-pcre
+TVHEADEND_CONF_OPTS += --enable-pcre --disable-pcre2
 else
-TVHEADEND_CONF_OPTS += --disable-pcre
+TVHEADEND_CONF_OPTS += --disable-pcre --disable-pcre2
 endif
 
 ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
