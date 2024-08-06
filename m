Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D20C3DA64
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 05:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B8E340108;
	Tue,  6 Aug 2024 05:36:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I1x5dgJB0xQk; Tue,  6 Aug 2024 05:36:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 402A540116
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 402A540116;
	Tue,  6 Aug 2024 05:36:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 606AC1BF314
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 05:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D1E44027D
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 05:36:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Zm1kbfsvG1d for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 05:36:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B66E94014E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B66E94014E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B66E94014E
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 05:36:27 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bad7.dip0.t-ipconnect.de [84.161.186.215])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 50F18A4C02E2;
 Tue,  6 Aug 2024 07:36:24 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56480)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1sbCrv-00000000750-2VpY;
 Tue, 06 Aug 2024 05:36:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Aug 2024 07:36:23 +0200
Message-Id: <20240806053623.776588-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1722922584;
 bh=cOeMiWZI9kKfqRlp1PabwDLF8eWTvTHhGNW00rFMjXo=;
 h=From:To:Cc:Subject:Date:From;
 b=pYRw4vDesBrwMZ2V0jQSrTA6/MSjCUnclKpCpdeF26qNqPPgyypEg0gI8HRNmtxAG
 lYO+i116jhF+GS4ZVx3rBLTqUMeIbvwo66nk4rjSx3Mwd/j5U28pdSu9v9ZcXharJr
 GQ3bFqPhNtypmtI0nlWI90RNqqlRROvFS0A7L2iBze77EgNoHLzXd3sxVso/ny+Xa3
 ydJDRzTdN2Bqkbq0WMQO0Aie/swp1mOdlZ7upUnhXbJq793ehoqd+aQ7IjY17ulsSM
 zqVkR10pOecFDxB8kMhIuoaw3Ml49t4KEBLBN2+CmGJMV3/4DBwFwq4GH8dRiEb3RG
 P8uNJ9dhOeEWA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=pYRw4vDe
Subject: [Buildroot] [PATCH 1/1] package/openconnect: Fix openssl support
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable needed OpenSSL options even when GnuTLS is enabled by respecting
BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL=y set by other packages.

Fixes:
http://autobuild.buildroot.net/results/f53/f535a63b80f2efe59709d5d9b59bc27ba66d2c26/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/openconnect/Config.in      | 4 ++--
 package/openconnect/openconnect.mk | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openconnect/Config.in b/package/openconnect/Config.in
index cacf617fb9..6bc747bc2d 100644
--- a/package/openconnect/Config.in
+++ b/package/openconnect/Config.in
@@ -4,8 +4,8 @@ config BR2_PACKAGE_OPENCONNECT
 	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_GNUTLS
 	# configure: error: LibreSSL does not support Cisco DTLS.
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL if !BR2_PACKAGE_GNUTLS
-	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4 if !BR2_PACKAGE_GNUTLS
-	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if !BR2_PACKAGE_GNUTLS
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4 if BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_ZLIB
 	help
diff --git a/package/openconnect/openconnect.mk b/package/openconnect/openconnect.mk
index 3fd9f990b0..20d2e3b4e4 100644
--- a/package/openconnect/openconnect.mk
+++ b/package/openconnect/openconnect.mk
@@ -14,7 +14,7 @@ OPENCONNECT_CONF_OPTS = \
 	--with-vpnc-script=/etc/vpnc/vpnc-script \
 	--without-java
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL),y)
 OPENCONNECT_DEPENDENCIES += openssl
 OPENCONNECT_CONF_OPTS += --without-gnutls --with-openssl
 else ifeq ($(BR2_PACKAGE_GNUTLS),y)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
