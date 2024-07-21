Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B86C3DA61
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 09:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEDBC802CE;
	Sun, 21 Jul 2024 09:01:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PE4IlmMP_mfG; Sun, 21 Jul 2024 09:01:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D60C380A60
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D60C380A60;
	Sun, 21 Jul 2024 09:00:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 28E3C1BF2BC
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 09:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D367D402E9
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 09:00:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JFDhkcdeIQWL for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 09:00:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 62400403D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62400403D1
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 62400403D1
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 09:00:31 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-427d2c8c632so22464195e9.2
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 02:00:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721552429; x=1722157229;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AZBrs7GwqFDwQWl5PP17+YWOdEzwWuyXefZpnrL6XkM=;
 b=dLzrAht46e8L0LFrHyaEEf8PJsWvbtwK0pgfhWVTulYW25Naw+xP/euN8HzFxyPhoA
 k++Ogyx8nnidPh263iJs4W+CIV1jnkLJrlioScNHnLckdemX4V7bW4C2RmPPHUvKcBy+
 XTGtXz9kC57z0mA8SxR/cSYG+ZhkJoOTF8pVHGCAdJAv7LjtijD7Z8RMPMvpMKeqaZci
 6wMqvsT/kUGPGf799Kj4KIWytlhdc1N6Rub+yaHeXZFUjwGZBO0CI+BlPR94jqTGDY9o
 AevQB6EAWT9UPUkSIHtY8OFJCv5k3L7yWYdYuVl8q2pUlQaH+0TfjzwDGKm3l6lDQvuJ
 0gFw==
X-Gm-Message-State: AOJu0YwPGedQpfJGJ3PdMlxjar5OWPJ70PnzeHJZ4wZgF+WKjqbS8iZn
 EsWMqGQrzAoDnJETGd4jsxFL2/htca/wRcUwWrtlCXPYnTwwegv/nbzRTw==
X-Google-Smtp-Source: AGHT+IFaEXazQUM1MsknVCJJWBKK/qrp2qKCax9YmZ1fZdUBzjVZMTmBnHRvviw8jxrOcBnZIBqyNg==
X-Received: by 2002:a05:600c:198f:b0:426:5fbc:f319 with SMTP id
 5b1f17b1804b1-427dc59eac8mr17032515e9.33.1721552428753; 
 Sun, 21 Jul 2024 02:00:28 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d8e68ba0sm74061035e9.21.2024.07.21.02.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jul 2024 02:00:28 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Jul 2024 11:00:24 +0200
Message-ID: <20240721090024.371743-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721552429; x=1722157229; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AZBrs7GwqFDwQWl5PP17+YWOdEzwWuyXefZpnrL6XkM=;
 b=BIYMw6v4IAEIVXrq2Njq5M2Nu9ByRIe6aP2dWE+SStS6YQvQuvrdt9rXlTjYtQsFQ+
 KNZrrEyOMsILHvMl/QynU64x89xTjhOwQaU6GdIyxW4VyzTxlWmYZgdLfmX52Jb6qHYw
 Wc1YYWrLpc89VyI/uJbDmyOhAJfgyWV0zvqA+xqxfAb2qTeFiTA444frPB1jI8C7ym4M
 gOcqEGRwWChW9bO2Tv1zdnEGcKQvCrBSq3VvJ686LBINHFbZSIEpimVAgMS2ishusOZq
 fCmaJ3bvOdwuy75OP+r7AtYvh4AraW6IgdBjtzD47qXs1QilKZmp9wQ3m16ZbVM0/S3t
 LxfQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BIYMw6v4
Subject: [Buildroot] [PATCH 1/1] Revert "package/gnutls: add tpm2-tss
 optional dependency"
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

This reverts commit caff4179a4481233257f5f475ca57ce9061af900 as the
following circular dependency is created if BR2_PACKAGE_TPM2_TSS_FAPI
is selected: tpm2-tss -> libcurl -> gnutls -> tmp2-tss
resulting in the following build failure of libcurl or rtmpdump:

configure: error: TLS not detected, you will not be able to use HTTPS, FTPS, NTLM and more.
Use --with-openssl, --with-gnutls, --with-wolfssl, --with-mbedtls, --with-schannel, --with-secure-transport, --with-amissl, --with-bearssl or --with-rustls to address this.

[...]

In file included from rtmp.c:32:
rtmp_sys.h:110:10: fatal error: gnutls/gnutls.h: No such file or directory
  110 | #include <gnutls/gnutls.h>
      |          ^~~~~~~~~~~~~~~~~

Fixes: caff4179a4481233257f5f475ca57ce9061af900
 - http://autobuild.buildroot.org/results/72e1843de650c9ed4795f1141e9fd485b71a14c3
 - http://autobuild.buildroot.org/results/918f0f7efa810b17f6d2266a890bf0150cbed146

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gnutls/gnutls.mk | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 8302194812..8a4f3345aa 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -57,7 +57,6 @@ HOST_GNUTLS_CONF_OPTS = \
 	--without-librt-prefix \
 	--without-libz-prefix \
 	--without-tpm \
-	--without-tpm2 \
 	--disable-openssl-compatibility \
 	--without-libbrotli \
 	--without-idn \
@@ -99,13 +98,6 @@ else
 GNUTLS_CONF_OPTS += --without-p11-kit
 endif
 
-ifeq ($(BR2_PACKAGE_TPM2_TSS),y)
-GNUTLS_CONF_OPTS += --with-tpm2
-GNUTLS_DEPENDENCIES += tpm2-tss
-else
-GNUTLS_CONF_OPTS += --without-tpm2
-endif
-
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 GNUTLS_CONF_OPTS += --with-zlib
 GNUTLS_DEPENDENCIES += zlib
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
