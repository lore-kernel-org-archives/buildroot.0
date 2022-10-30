Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EBC4ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 18:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7366040325;
	Sun, 30 Oct 2022 18:20:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7366040325
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jty9xwYSpW2W; Sun, 30 Oct 2022 18:20:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A1E34031E;
	Sun, 30 Oct 2022 18:20:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A1E34031E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 163C21BF473
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 18:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF9CD812A3
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 18:20:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF9CD812A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sgJJTX--oS0I for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 18:20:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD9D481298
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD9D481298
 for <buildroot@busybox.net>; Sun, 30 Oct 2022 18:20:22 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 25F014403F9;
 Sun, 30 Oct 2022 20:18:02 +0200 (IST)
To: buildroot@busybox.net
Date: Sun, 30 Oct 2022 20:20:15 +0200
Message-Id: <7568ca93d2d360efc2c6096406b8d9af533dec86.1667154015.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1667153882;
 bh=7xyS5CGr8x/EBeuZGPEkVD3cxUyfNfK5wv7R6gnjME0=;
 h=From:To:Cc:Subject:Date:From;
 b=OCKUdywcAP0euz5HD0pgbZEux0eId7Am/MTabQvHwBA+RXegYus0bo9088n7RrVKP
 8CgRUtJq/AmRG4T196guLac0+ifJGQXGu+fHtKIsiCHftVeQXzHEE/s2v9CF4h7Dt3
 jknTZEEOnfhbJ8DE1ZYwDberjW2UcxLJ0oVs1OZqtLoJrZJ0xDIsIro+roNHZ+UF2c
 2zYb4WPhyxsYMUK6FJj8cLByHyPrAYycOf0q+AfZlUzvq67LGwHiQ8ScWJTj3EJSjC
 pRwchllTOexR3CorJ3VGa/7NIXhwfOWjotxbmYK9QjhlN5Np+/5nEgIKmEDq1w58Yr
 NKTuGI03AYRew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=OCKUdywc
Subject: [Buildroot] [PATCH] package/libcurl: fix crypto backend selection
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since version 7.77 --with-ssl that used to select OpenSSL renamed to
--with-openssl. --without-ssl changed to mean no crypto backend.

Only in version 7.86 setting both --without-ssl and some other crypto
parameter became a hard configure error.

Update OpenSSL selection parameter, and add --without-ssl explicitly for
the case of no selected crypto backend.

Fixes:
http://autobuild.buildroot.net/results/05e9cb71619e640849c27b2984d0df671a9f86c5/
http://autobuild.buildroot.net/results/5a4a905de2a232a38916f03278d0a3cbd8a29711/
http://autobuild.buildroot.net/results/4432314aa13d4acc8fce27f79177f82298ae0626/

Cc: Matt Weber <matthew.weber@collins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libcurl/libcurl.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 3c3ad082fc65..8de43581073d 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -50,6 +50,10 @@ endif
 
 LIBCURL_CONFIG_SCRIPTS = curl-config
 
+ifeq ($(BR2_PACKAGE_LIBCURL_TLS_NONE),y)
+LIBCURL_CONF_OPTS += --without-ssl
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCURL_OPENSSL),y)
 LIBCURL_DEPENDENCIES += openssl
 # configure adds the cross openssl dir to LD_LIBRARY_PATH which screws up
@@ -57,10 +61,10 @@ LIBCURL_DEPENDENCIES += openssl
 # Fix it by setting LD_LIBRARY_PATH to something sensible so those libs
 # are found first.
 LIBCURL_CONF_ENV += LD_LIBRARY_PATH=$(if $(LD_LIBRARY_PATH),$(LD_LIBRARY_PATH):)/lib:/usr/lib
-LIBCURL_CONF_OPTS += --with-ssl=$(STAGING_DIR)/usr \
+LIBCURL_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr \
 	--with-ca-path=/etc/ssl/certs
 else
-LIBCURL_CONF_OPTS += --without-ssl
+LIBCURL_CONF_OPTS += --without-openssl
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCURL_BEARSSL),y)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
