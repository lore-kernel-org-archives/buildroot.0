Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE41C433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 17:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EB2B82656;
	Sat,  5 Feb 2022 17:40:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G13WYqfFWy6o; Sat,  5 Feb 2022 17:40:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 851EA82542;
	Sat,  5 Feb 2022 17:40:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 56C971BF30E
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 17:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4573582542
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 17:40:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J_Jy3ZO6BQ1q for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 17:40:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 014B382531
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 17:40:50 +0000 (UTC)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
 by mailout07.t-online.de (Postfix) with SMTP id 4B878176BB
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 18:40:48 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.189.21]) by fwd76.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1nGP3G-0pjfVJ0; Sat, 5 Feb 2022 18:40:47 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:44584)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1nGP3G-0006cu-I5
 for buildroot@buildroot.org; Sat, 05 Feb 2022 18:40:46 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  5 Feb 2022 18:40:46 +0100
Message-Id: <20220205174046.1850152-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1644082847-0001619A-9952A232/0/0 CLEAN NORMAL
X-TOI-MSGID: d8fe5058-67e9-42e2-a74a-56fb72b956c8
Subject: [Buildroot] [PATCH v2 1/1] package/libldns: enable dane-verify for
 OpenSSL
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the bump of libopenssl to 1.1.x support for offline DANE
verification can be enabled.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: enable only for libopenssl, libressl does not support SSL_get0_dane
    (Peter)

 package/libldns/libldns.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/libldns/libldns.mk b/package/libldns/libldns.mk
index 7deca978da..86e7c0eafc 100644
--- a/package/libldns/libldns.mk
+++ b/package/libldns/libldns.mk
@@ -13,11 +13,9 @@ LIBLDNS_CPE_ID_VENDOR = nlnetlabs
 LIBLDNS_CPE_ID_PRODUCT = ldns
 LIBLDNS_INSTALL_STAGING = YES
 LIBLDNS_DEPENDENCIES = openssl
-# --disable-dane-verify can be removed after openssl bump to 1.1.x
 LIBLDNS_CONF_OPTS = \
 	--with-ssl=$(STAGING_DIR)/usr \
 	--enable-dane \
-	--disable-dane-verify \
 	--enable-ecdsa \
 	--enable-gost \
 	--enable-sha2 \
@@ -26,6 +24,12 @@ LIBLDNS_CONF_OPTS = \
 	--without-pyldns \
 	--without-pyldnsx
 
+ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
+LIBLDNS_CONF_OPTS += --enable-dane-verify
+else
+LIBLDNS_CONF_OPTS += --disable-dane-verify
+endif
+
 ifeq ($(BR2_STATIC_LIBS),y)
 LIBLDNS_DEPENDENCIES += host-pkgconf
 # missing -lz breaks configure, add it using pkgconf
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
