Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C939FC00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 16:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D0A540B61;
	Mon, 15 Aug 2022 16:01:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D0A540B61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YpxlDOkm86xu; Mon, 15 Aug 2022 16:01:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A7D840B59;
	Mon, 15 Aug 2022 16:01:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A7D840B59
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7D9391BF393
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 16:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 579A0418EF
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 16:01:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 579A0418EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0CDIcbhXV_e3 for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 16:01:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C3B9418E7
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C3B9418E7
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 16:01:33 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id j7so9572681wrh.3
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:01:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=Da1z/Vq8g2dw5Jv8UAYB1WhNsASzHG+HwuwDOoSIiYM=;
 b=L2nJD2kLzsUlvoyntf5orCBeKZ9XDgq8gW79qt17OOqfgJyJviuTjDFBfhFgHEmKuO
 sbeD5zhC7eVDQeo1QZK5s4uiRxmZuu+X+Hx4VeaYyF1z9alP2aXpQlSMc3RoCv5eqX9z
 IzvBvXyAJOvBhiltW7tn5e6NkZl2/sLolVko9NuBzNlB5W5zOGqQ7dotmYAFCizrCjCM
 EE6Blzru+bBVdT1fOyTQv/fTUZ5sMptaiA7Ba2lNnoFvvPCk2i2CBPSFE6sl1hCH5NCc
 p+qmkB8vMIZei2RDo/ZyiXdsRRuv1k7WyL2mrp19HQyteSYOd7CzAyybYIdxPd5DR0o9
 3iWA==
X-Gm-Message-State: ACgBeo13sA2RmxKRLlfnuY2fjcLkqAXW4dpenLs+TvzZ3eaERokZP7tH
 5sAFVqgBGHY+FlTX2I7iQE8C6abbH3Q=
X-Google-Smtp-Source: AA6agR4cdEVJZl4VJ4a0WCUCIXDWZbYYkY4R8Lo3O9L9R8o/TK4HK2bk0aJxSKKMNML+oCZmJLTDFA==
X-Received: by 2002:a05:6000:18c:b0:21f:170d:446e with SMTP id
 p12-20020a056000018c00b0021f170d446emr9021053wrx.304.1660579291022; 
 Mon, 15 Aug 2022 09:01:31 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b0016e6c61061147635.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:16e6:c610:6114:7635])
 by smtp.gmail.com with ESMTPSA id
 p35-20020a05600c1da300b003a35ec4bf4fsm10212174wms.20.2022.08.15.09.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 09:01:30 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 18:01:24 +0200
Message-Id: <20220815160124.5038-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=Da1z/Vq8g2dw5Jv8UAYB1WhNsASzHG+HwuwDOoSIiYM=;
 b=BNn8Prfg0QyCio99Vz8ISxEvnux4bZJxWri9YLoegJfgrNA8WGb4rRQXz7v4aYSPYa
 qCphIrd93JX/M4NXYAQYnSnY+EQiyu0EZBmVY3dvyj4UgK93D02Bt0rJmc5QcnIJR4Xf
 rrfaISn/bmE9PXGo4Niy2l72ChSgiGS/3OYylaDISYTxs6oHWh/Co6Y0GrwtFnP0JkaB
 BL+6fF1LkWNUQ06+rBwuJMXUA8YUHdoMG4FraeroM/Fcg4ChnPajQqmp3J0/AryEVgpq
 4VxnodRhsLe/sa/O7E2WyNzHPAHGL4kOtKJyWR6ul5dGS/focumux0tmnHIScO0gxoPA
 4GAw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BNn8Prfg
Subject: [Buildroot] [PATCH v2,1/1] package/uacme: ualpn needs libopenssl
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Nicola Di Lieto <nicola.dilieto@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ualpn is not compatible with libressl as stated by upstream in
https://github.com/ndilieto/uacme/commit/32546c7caa1626bbef860cf81e53d10e29fca5cb
resulting in the following build failure:

ualpn.c: In function 'ssl_client_hello_cb':
ualpn.c:2038:16: error: 'SSL_CLIENT_HELLO_RETRY' undeclared (first use in this function); did you mean 'SSL_F_CLIENT_HELLO'?
 2038 |         return SSL_CLIENT_HELLO_RETRY;
      |                ^~~~~~~~~~~~~~~~~~~~~~
      |                SSL_F_CLIENT_HELLO

Fixes:
 - http://autobuild.buildroot.org/results/d7d49cfce6f99c59e99c8e15399164fd5ecacc21

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Yann E. Morin):
 - Invert openssl and mbedtls order to avoid a build failure if libressl
   and mbedtls are enabled at the same time

 package/uacme/Config.in | 2 ++
 package/uacme/uacme.mk  | 6 +++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/uacme/Config.in b/package/uacme/Config.in
index 796f54754e..2c6864871c 100644
--- a/package/uacme/Config.in
+++ b/package/uacme/Config.in
@@ -21,6 +21,8 @@ config BR2_PACKAGE_UACME_UALPN
 	bool "enable ualpn"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBEV
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL \
+		if !(BR2_PACKAGE_GNUTLS || BR2_PACKAGE_MBEDTLS)
 	help
 	  Build and install ualpn, the transparent proxying tls-alpn-01
 	  challenge responder.
diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
index 2be96d534e..84e0105762 100644
--- a/package/uacme/uacme.mk
+++ b/package/uacme/uacme.mk
@@ -18,12 +18,12 @@ UACME_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 UACME_CONF_OPTS += --with-gnutls
 UACME_DEPENDENCIES += gnutls
-else ifeq ($(BR2_PACKAGE_OPENSSL),y)
-UACME_CONF_OPTS += --with-openssl
-UACME_DEPENDENCIES += openssl
 else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
 UACME_CONF_OPTS += --with-mbedtls
 UACME_DEPENDENCIES += mbedtls
+else ifeq ($(BR2_PACKAGE_OPENSSL),y)
+UACME_CONF_OPTS += --with-openssl
+UACME_DEPENDENCIES += openssl
 endif
 
 ifeq ($(BR2_PACKAGE_UACME_UALPN),y)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
