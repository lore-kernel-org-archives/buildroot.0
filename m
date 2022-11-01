Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA426C433FE
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 06:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2249340184;
	Tue,  1 Nov 2022 06:03:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2249340184
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YUzLC6RaFg3n; Tue,  1 Nov 2022 06:03:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD74F40170;
	Tue,  1 Nov 2022 06:03:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD74F40170
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C1BFE1BF340
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 06:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 964158131D
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 06:03:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 964158131D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cCQqx4J1XH0D for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 06:03:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F1858131B
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F1858131B
 for <buildroot@busybox.net>; Tue,  1 Nov 2022 06:03:29 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id h9so18838293wrt.0
 for <buildroot@busybox.net>; Mon, 31 Oct 2022 23:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ut+aQltyZPq3QgFND/SmwaXJL6+IoVeHdx+kynk+btA=;
 b=HNT3IhHngcOe5q5P0cz1YEe1KBOJ9xNK8dNrZUTz6yrt//OihCtvFgRLleUR8TJJIU
 TTtl4OiG9m7iSimdc8YratjHz4iDbioUMz2XzfToxB9ugfpUj/dHu2WQp68JcT3l2fJZ
 g92xxkUsgUkpnBBwLxwNLqwpcRAUWk1qookcqJltTRxWa4eXYFlmn82r5pvqJTPbBhQS
 96ETT1+iqV729eGWw/fFs6cK6RoxXWzU4XVyVtLmt1+2bjOyw1vp5hMlNe4AVsswqKhz
 QtmTkxToXx/WPgjun4p0WnYlcpr4tl22cpGeeMROBl1trXx46pANwHHckII6uK4Lb/lp
 mwqg==
X-Gm-Message-State: ACrzQf2u6dMDFN/1Ow7jdwQLYROPy5lcfNGpJK496RKtMYScTx3q4jqX
 yWjPkMgy61uDb3ch+kP6x3/DoF7P6Ds=
X-Google-Smtp-Source: AMsMyM5I8lZOj2eV4vbh6TJE2vcvYBi2j7pgJgNlTpeRwgRAKtLp/ezzar3jqQ+VSIcdE7wbRxqzcQ==
X-Received: by 2002:a5d:6347:0:b0:22a:f91f:674a with SMTP id
 b7-20020a5d6347000000b0022af91f674amr44532wrw.214.1667282607378; 
 Mon, 31 Oct 2022 23:03:27 -0700 (PDT)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a05600c42c600b003c6deb5c1edsm10143085wme.45.2022.10.31.23.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 23:03:26 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue,  1 Nov 2022 07:03:21 +0100
Message-Id: <20221101060321.1488881-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ut+aQltyZPq3QgFND/SmwaXJL6+IoVeHdx+kynk+btA=;
 b=MASyPgc92HLQNr9OoizJQ+OlAuSJAm5nGBKvbxAArBVBUw1Av75oar6MpOdOEcAf39
 pdPKPLqpykSU8RIxJ9c+qWWCv08koOxH8eXReoWWO4ZNiGoVtLqpNT6nW5MDSDa8vJe0
 QNIJoJgV2pEu2vUqBMSCnOzo/wE5ZOr5rfGGipMxJLD4EPpYibnbsfmuXNbC7F/4UFpT
 rqJRMH8mm0ZaHX4gOvcIFYlL1fk9WLl0aspYHQKsiLYmeYQAv0pEmV/Z0v7oTluIbel1
 YqzG3DHCw/SxlrPzUmuz45aFDNGU6evgZlwmqCHlT9HB8yfcIHiwkFbHen8hX1aHIocz
 J09g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MASyPgc9
Subject: [Buildroot] [PATCH] package/libressl: bump to version 3.6.1
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch | 2 +-
 package/libressl/libressl.hash                              | 2 +-
 package/libressl/libressl.mk                                | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch b/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch
index 1c59aec72..48f3fa16e 100644
--- a/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch
+++ b/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch
@@ -20,7 +20,7 @@ diff --git a/include/openssl/ssl.h b/include/openssl/ssl.h
 index 46f24b2ea..4048a6e63 100644
 --- a/include/openssl/ssl.h
 +++ b/include/openssl/ssl.h
-@@ -408,11 +408,7 @@ typedef int (*tls_session_secret_cb_fn)(SSL *s, void *secret, int *secret_len,
+@@ -412,11 +412,7 @@ typedef int (*tls_session_secret_cb_fn)(SSL *s, void *secret, int *secret_len,
  #define SSL_OP_NO_TLSv1					0x04000000L
  #define SSL_OP_NO_TLSv1_2				0x08000000L
  #define SSL_OP_NO_TLSv1_1				0x10000000L
diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
index 7a7638b2d..0988e6a36 100644
--- a/package/libressl/libressl.hash
+++ b/package/libressl/libressl.hash
@@ -1,4 +1,4 @@
 # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
-sha256  3ab5e5eaef69ce20c6b170ee64d785b42235f48f2e62b095fca5d7b6672b8b28  libressl-3.5.3.tar.gz
+sha256  acfac61316e93b919c28d62d53037ca734de85c46b4d703f19fd8395cf006774  libressl-3.6.1.tar.gz
 # Locally computed
 sha256  5c63613f008f16a9c0025c096bbd736cecf720494d121b5c5203e0ec6e5955b1  COPYING
diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index 85d1fe5e3..8fd7bccbc 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRESSL_VERSION = 3.5.3
+LIBRESSL_VERSION = 3.6.1
 LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
 LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
 LIBRESSL_LICENSE_FILES = COPYING
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
