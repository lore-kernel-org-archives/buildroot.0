Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C67C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 21:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECB6181C6F;
	Sun, 19 Jun 2022 21:04:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECB6181C6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id brLTdcC0wyRb; Sun, 19 Jun 2022 21:04:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1076E81C11;
	Sun, 19 Jun 2022 21:04:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1076E81C11
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2AC5B1BF292
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 21:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2AE1409FA
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 21:04:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2AE1409FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jq-JOoWCExbo for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 21:04:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CCB1409F8
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1CCB1409F8
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 21:04:09 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id m1so4362038wrb.2
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 14:04:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Te5Z/m+/3NHNlTPs3AKG+dzPaJX+opJm1yVft7ibnzM=;
 b=AFDnqp94VJburVDR5aIgAblmyHoZ8o6YCwWDKd/7E1I0o2GBalDbXDWLoVxPc/pxOI
 Cnwuz6yv2uhAnGS1erziPf+irnSW+JjjR/v6RwLtWZE0t5preREqXS2ODjOoqsUglbRJ
 EPt3mW6Bwbv2+PsAEO+mMmqw3Q+TFKk4ipZBV/M0YCm0BCs7MNDzH0dnHWi9++dXQYJ3
 v1FFm9eKoOKXc+5OSyB8MoY8oczKrE56H+q7ve9OpdFPAjSfl3a5qitFuBSCvxBliUJg
 T1fwGxT6DcQY3XPR1qQHvvrQ84zU+J6f6m0geXePaFRqyIDLHw42ox0mv3N2NoXZnZk8
 eHSw==
X-Gm-Message-State: AJIora/qYi97KVAt5bw2bPCNxOhbHlcDsaFNz3e5oZxFiXtDN+41SKju
 zD+n/Y5gCp92Iz+5Yw+Zp4HeU0mLEcM=
X-Google-Smtp-Source: AGRyM1soVvMfB/iCokJzSlyoxaerc0HBG1qxBfrp9EiyD1H7PV33kQAr6wXI1e+a+r1CfBerR8U8ww==
X-Received: by 2002:a5d:5847:0:b0:219:b512:3be2 with SMTP id
 i7-20020a5d5847000000b00219b5123be2mr20016969wrf.651.1655672646906; 
 Sun, 19 Jun 2022 14:04:06 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 h81-20020a1c2154000000b0039c41686421sm15677994wmh.17.2022.06.19.14.04.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 14:04:06 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 23:01:00 +0200
Message-Id: <20220619210102.1021263-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Te5Z/m+/3NHNlTPs3AKG+dzPaJX+opJm1yVft7ibnzM=;
 b=NmSaUXSX95ltE36y4JXl4Tnk+Lszj+D3XdBTWG7Ga8D3E4jksfkbWWGNZILfggaDws
 iimsO9RTwczC9ZOdSYYSKZYZgLlVfl33FBs1atMoFddMMzp66j5SVohUD4q6pS0W6mMm
 qDRSLyaQjhzzQmxu605rQ33S6z9nPbn1P1U2ymsAlnbJ+ClZzO4nptDHMZdEgXQ30cZU
 9Y//eOdhxtrX5uMUddswnH9tB/YzGLMcP6MJ3lfUM0ltSi+1UChgyM0hUbNn02D9hXiy
 tt0rN5dQOP+6xwr9u+M4Q/SYSGyeI+4F4XMIg5OEoEU1gWqFY9Lq9mINNDJonkY6Ov09
 4eYg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NmSaUXSX
Subject: [Buildroot] [PATCH 1/3] package/bind: drop unrecognized options
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--enable-threads, --with-randomdev, --enable-filter-aaaa, --with-ecdsa,
--with-eddsa, --with-aes, --with-gost are all unrecognized since bump to
version 9.16.26 in commit 8adeaec8afacbc680edebae91524f6144926ac92:

configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --disable-dependency-tracking, --enable-ipv6, --enable-nls, --enable-threads, --with-randomdev, --enable-filter-aaaa, --with-ecdsa, --with-eddsa, --with-aes, --with-gost

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bind/bind.mk | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 5164001ab5..0ce78d08cb 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -31,17 +31,11 @@ BIND_CONF_ENV = \
 	BUILD_CFLAGS="$(TARGET_CFLAGS)" \
 	LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 BIND_CONF_OPTS = \
-	$(if $(BR2_TOOLCHAIN_HAS_THREADS),--enable-threads,--disable-threads) \
 	--without-lmdb \
 	--with-json-c=no \
-	--with-randomdev=/dev/urandom \
 	--enable-epoll \
-	--enable-filter-aaaa \
 	--disable-backtrace \
-	--with-openssl=$(STAGING_DIR)/usr \
-	--with-ecdsa=yes \
-	--with-eddsa=no \
-	--with-aes=yes
+	--with-openssl=$(STAGING_DIR)/usr
 
 BIND_DEPENDENCIES = host-pkgconf libuv openssl
 
@@ -73,13 +67,6 @@ else
 BIND_CONF_OPTS += --with-libxml2=no
 endif
 
-# GOST cipher support requires openssl extra engines
-ifeq ($(BR2_PACKAGE_OPENSSL_ENGINES),y)
-BIND_CONF_OPTS += --with-gost=yes
-else
-BIND_CONF_OPTS += --with-gost=no
-endif
-
 # Used by dnssec-keymgr
 ifeq ($(BR2_PACKAGE_PYTHON_PLY),y)
 BIND_DEPENDENCIES += host-python-ply
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
