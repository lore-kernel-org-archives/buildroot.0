Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205ECC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 09:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B562D4017E;
	Wed, 27 Jul 2022 09:47:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B562D4017E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IdMf6hYWK1Jx; Wed, 27 Jul 2022 09:47:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA727404B2;
	Wed, 27 Jul 2022 09:47:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA727404B2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6CA381BF57F
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 09:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 460B9408F4
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 09:47:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 460B9408F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rAdYK2PC-tfx for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 09:47:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1D0F40308
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C1D0F40308
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 09:47:26 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id v13so15635210wru.12
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 02:47:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D/FnydF0G6TkfarTC4FttlWwcplkGP803Fn7/UqPCqs=;
 b=gXFSCBW1U1AYiSjACtVVZMYKJrRijT9d6DqC6Wnju9p4mhfF+LM4L4Ulqf8sW71Qfk
 JYiIjobLVV8cg6ZaxTVMORepLASYJ9U/e4c+FYL4naXkvDQlUokvtjHRW6m9OTHTr9rF
 pY0fSQsm3sKj5ZAgqA6mU5YsWL6G5A/r067tiVyOETXEdE10Q7BayF4Bvyy+rIgSwK9f
 uF5mmWjC/hQ1LO8GSfpbNO7zp7n7uSFpXZFgifb6sJDSM7HMDkw+Qts7seDSCC2tA2OK
 HGTiy+CnOEjb7xyC3CfRViXh1rT+0DwRF4pmVcwygwfbXMA1R8HbVrCh+DBa4jHD71Cm
 wH8w==
X-Gm-Message-State: AJIora+fMmwUTqUAW+/cYP8vPwviyO5FIW36J0RRipDAnBeUU5jxJ+8+
 iJEInzRNNA7IfVx5KQJbJrm9AeKTzT4=
X-Google-Smtp-Source: AGRyM1vHcWUFUwUbbQt26ISGw0/M/Nl508yUq/qSE7qV3E8FCI2utgSbmIiIqPn2OwUMb36CmPAnog==
X-Received: by 2002:a5d:5086:0:b0:21e:4eea:eea with SMTP id
 a6-20020a5d5086000000b0021e4eea0eeamr13063198wrt.47.1658915244472; 
 Wed, 27 Jul 2022 02:47:24 -0700 (PDT)
Received: from kali.home (2a01cb0680494f3e376d079efd3cafb3.ipv6.abo.wanadoo.fr.
 [2a01:cb06:8049:4f3e:376d:79e:fd3c:afb3])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a05600c500b00b003a2e42ae9a4sm2086804wmr.14.2022.07.27.02.47.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 02:47:23 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 11:47:18 +0200
Message-Id: <20220727094719.1086106-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D/FnydF0G6TkfarTC4FttlWwcplkGP803Fn7/UqPCqs=;
 b=kGohmlOh0ug98XG3hweRM9lKUQrPTJim/1gdXbTacgIz3P+mavoirO7Nya/tGppslr
 /rC3CceLNBXysTQfR6APyOzKHBqB0ZIkTI17IFL8uGd30rIvS/0ylleOAeimEBgl/6j2
 c+7n8QvjB8WG5nms+8W3OvmWZbowzF/ZOr5E/+G9QEhnYFRinFYpgLLW8dURRLp+NsYg
 FKtyqIub9VHPNTLcpl23a9pZ5WsKZkyZJwLdylDgZSBRnP+okfk6HZ5nsoZu05Wtv44o
 fQzzhAx+oSfn1bfr4HFUJKNuv2Qnnn3IQuYOIlvSrtiDywi1/UaCAvrQrtUjBACmytij
 BAUQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kGohmlOh
Subject: [Buildroot] [PATCH 1/2] package/cryptsetup: add nettle support
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

nettle is a crypto backend since version 1.3.1 and
https://github.com/mbroz/cryptsetup/commit/35d6914779578908e7b37abfdd188ec7c8101404

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cryptsetup/cryptsetup.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 0f5c2dc5ae..6fdda78fe2 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -25,8 +25,8 @@ CRYPTSETUP_AUTORECONF = YES
 CRYPTSETUP_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)"
 CRYPTSETUP_CONF_OPTS += --enable-blkid --enable-libargon2
 
-# cryptsetup uses OpenSSL by default, but can be configured to use libgcrypt
-# or kernel crypto modules instead
+# cryptsetup uses OpenSSL by default, but can be configured to use libgcrypt,
+# nettle or kernel crypto modules instead
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 CRYPTSETUP_DEPENDENCIES += openssl
 CRYPTSETUP_CONF_OPTS += --with-crypto_backend=openssl
@@ -34,6 +34,9 @@ else ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 CRYPTSETUP_DEPENDENCIES += libgcrypt
 CRYPTSETUP_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
 CRYPTSETUP_CONF_OPTS += --with-crypto_backend=gcrypt
+else ifeq ($(BR2_PACKAGE_NETTLE),y)
+CRYPTSETUP_DEPENDENCIES += nettle
+CRYPTSETUP_CONF_OPTS += --with-crypto_backend=nettle
 else
 CRYPTSETUP_CONF_OPTS += --with-crypto_backend=kernel
 endif
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
