Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88DC9C433FE
	for <buildroot@archiver.kernel.org>; Tue,  8 Nov 2022 19:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 351CE81E75;
	Tue,  8 Nov 2022 19:58:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 351CE81E75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VmHQ_-tsr5lf; Tue,  8 Nov 2022 19:58:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51BA081B23;
	Tue,  8 Nov 2022 19:58:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51BA081B23
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 14BEF1BF422
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 19:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E31CF60E45
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 19:58:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E31CF60E45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EMrIhCnBO1gS for <buildroot@lists.busybox.net>;
 Tue,  8 Nov 2022 19:58:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0AFE260E31
 for <buildroot@buildroot.org>; Tue,  8 Nov 2022 19:58:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AFE260E31
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EEFAF802AC; Tue,  8 Nov 2022 19:58:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 8 Nov 2022 20:48:32 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 6490a079d866270649f7d123d6858ad1df756733
X-Git-Newrev: eaab840e13275dc995f64d0e3bce275afd7b10d8
X-Patchwork-Hint: ignore
Message-Id: <20221108195809.EEFAF802AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libcurl: fix
 crypto backend selection
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

commit: https://git.buildroot.net/buildroot/commit/?id=eaab840e13275dc995f64d0e3bce275afd7b10d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f39810149ebe4041c77ca02560c58c93328de723)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index fda7ed83e2..f2c679f162 100644
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
