Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D6AEC433F5
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 11:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 087B24070F;
	Tue, 31 May 2022 11:00:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pMGGIQmhtre1; Tue, 31 May 2022 11:00:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E03440502;
	Tue, 31 May 2022 11:00:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CE3FA1BF276
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 10:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE2DB83147
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 10:59:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LBrEkpF3CtOj for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 10:59:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E03883145
 for <buildroot@buildroot.org>; Tue, 31 May 2022 10:59:56 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id wh22so25875633ejb.7
 for <buildroot@buildroot.org>; Tue, 31 May 2022 03:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mFJWGnMxJMiLoEBDdDBgY8MIs7pz+iD8pFunHVStBBE=;
 b=A6rYfvTtFutT02E3csr1/ootSaB1VdquYHjkXaubp+l4Tb8EJXxTutBG6/UleHeJ4q
 gUhGijwqG/W19zYLd4paL/ct0Bj4ApUJ9v47JNWM1y31pldKKzll+1C7oJZU35P2NjrW
 Wl6LmT1PpnYcsiIgLp06QBLEco0PRacrL7yvrQu0GkCZGQRO4BS5FPo+Q80epurE6fZq
 lULu+P049jFKRlNDtcvZjXk78CB/Bqgtn35SibyONabIEO6kpX9zwVn5IjDix9K7HinZ
 /tdcKetgMTPtyF2AekD5RoMQfNPFdDRBZMHfgdZyo6IdSU+os+nRN8gTzRVGzt4tZlb+
 bwRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mFJWGnMxJMiLoEBDdDBgY8MIs7pz+iD8pFunHVStBBE=;
 b=sUeswcGmfmGAtHLOPd9SqP7JUSwunVWzhvsv8qazssHnSEgEiU/OEQzb78pBFsJoIp
 /II+rnZ4KDRsiYtXkOnQ5JqrQhDt/DmtnWifDNaoA4cT+DUrdTRlRt72+/UY1EfBsZMC
 x8GCdqHO0zn0X/bvy6ZDita7dasToQw/Hzt/b0hOf2vR/3N+3xoXXP4Er+zXMj/XQM+/
 C5vthC8Gva6a+hh7lZPOUvugC3/UCs8vKM0fpZz9n15v9lUtw7qD9sGSl8ZIni1PPcgf
 qElt7XxNdK12N6TJls6nFHSG0Dag9ZUIGuVaj8H34KJr1K0xlEff8rcG0LjOrdcGraw6
 yAkA==
X-Gm-Message-State: AOAM531ZOell9lvRZqzNg9mvj7PRTlHAJkwZYVJyJt4aMr1ApMVIRm3n
 6LHXz+2Bw7aEth5AJlvTgsYKqjh6fy201Q==
X-Google-Smtp-Source: ABdhPJy9swo0I7xHFKzCEHg23mzxypCfMtpb9HCja0vz7l7XudAQrPvUSlpdJ5nFNU4QTi8JIOUtvQ==
X-Received: by 2002:a17:907:7f06:b0:6fe:b81f:f885 with SMTP id
 qf6-20020a1709077f0600b006feb81ff885mr44222378ejc.621.1653994795105; 
 Tue, 31 May 2022 03:59:55 -0700 (PDT)
Received: from hthiery.fritz.box ([2a02:810b:5a40:2a43:8e16:45ff:fe22:ad85])
 by smtp.gmail.com with ESMTPSA id
 w14-20020a50c44e000000b0042bdb6a3602sm8188793edf.69.2022.05.31.03.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 03:59:54 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 31 May 2022 12:59:03 +0200
Message-Id: <20220531105902.204022-4-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220531105902.204022-1-heiko.thiery@gmail.com>
References: <20220531105902.204022-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 3/4] package/gnutls: add build support for
 host
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 Matt Weber <matthew.weber@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
v2: no change

 package/gnutls/gnutls.mk | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index f7f3e046e9..ac83bb35d3 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -41,6 +41,31 @@ GNUTLS_CONF_ENV = gl_cv_socket_ipv6=yes \
 	gl_cv_func_gettimeofday_clobber=no
 GNUTLS_INSTALL_STAGING = YES
 
+HOST_GNUTLS_DEPENDENCIES = host-pkgconf host-libtasn1 host-libunistring host-nettle
+HOST_GNUTLS_CONF_OPTS = \
+	--disable-doc \
+	--disable-guile \
+	--disable-libdane \
+	--disable-rpath \
+	--disable-tests \
+	--without-included-unistring \
+	--without-libcrypto-prefix \
+	--without-libdl-prefix \
+	--without-libev-prefix \
+	--without-libiconv-prefix \
+	--without-libintl-prefix \
+	--without-libpthread-prefix \
+	--without-libseccomp-prefix \
+	--without-librt-prefix \
+	--without-libz-prefix \
+	--without-tpm \
+	--disable-openssl-compatibility \
+	--without-libbrotli \
+	--without-idn \
+	--without-p11-kit \
+	--without-zlib \
+	--without-libzstd
+
 ifeq ($(BR2_PACKAGE_GNUTLS_OPENSSL),y)
 GNUTLS_LICENSE += , GPL-3.0+ (gnutls-openssl library)
 GNUTLS_LICENSE_FILES += doc/COPYING
@@ -103,3 +128,4 @@ endif
 GNUTLS_CONF_ENV += LIBS="$(GNUTLS_LIBS)"
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
