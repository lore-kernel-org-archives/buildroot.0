Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 924D4F46456
	for <buildroot@archiver.kernel.org>; Mon, 16 Mar 2026 11:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56EFD821B7;
	Mon, 16 Mar 2026 11:37:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JOy5Ez83L07R; Mon, 16 Mar 2026 11:37:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EA8D82208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773661043;
	bh=h+rmZ7nSzmgvyELw/NaSLHoCgScTeBv/JgwbrtZf3G0=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=O/bepcRxVljyhJYLz1wr0bwZShaQIfN1ANfUXXR8L/GDXYmhMIU81IesuiPm1Dw55
	 lBh8W3xI4VRh6A/voKTnClJA/7dJFUyVbss85LPotSMoMOnGSM0RPgXo5V0JYhFvNE
	 m42Jd9vJ27+SRfEv1jgkQwXWjUqynWdAGXfzBaF4UOLKzHDr9wRGdCn0FX5eqwDuCx
	 n8WgHBVprnWIV9gcFxd8kVdcEymMH/C4lwxGM2iooj/CPyUDgsMTMfFX4qzW7Y4MlJ
	 O43zr/Iz3CUg8e3k5z+GaKY2I7AxgNDZDxrJRhJmMbhUxkOyAnpK/DX6MDd+aag3ln
	 sZ3JMta5UBG5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EA8D82208;
	Mon, 16 Mar 2026 11:37:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 624033BE
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 11:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5EB3740432
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 11:37:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i8OrfxHDG_Ep for <buildroot@buildroot.org>;
 Mon, 16 Mar 2026 11:37:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 797C240366
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 797C240366
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 797C240366
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 11:37:20 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-439b9b1900bso2880263f8f.1
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 04:37:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773661038; x=1774265838;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NTtz6fRErN0P+TvflzKWKEeXYPg67fzJNWLrFqauAaQ=;
 b=jL+F5S3SAFSNI/RBpPsRhap+1R5/YsAVBfw5njMJxPZ5fj0RlMBHw419vBzYfVMXR+
 gQLb/O3BKmEXaP55nRHxVeo6n2+DGsJbfiXk4n7Xw9ZGYKi/YBoCrPGv6u/Wa8viXhfP
 yPv+YbkcZUGgjSPVyXjGgpKjhyGTkG5+NX9Uu1oXQ/0tjD3gmOv9Fuk2xFjypkaRMPNF
 OCKXdMY2bpp0ju+fPHK4deYFucgNtF1Jsyoqc9YtfqN/wxDMfN1mrLFDm2IWN47CEx8p
 M1Y82SEgfswKgsVf/NvtO0cNIq924ygQHr/S0T+KMS0K+TW7QmLGdYD7MgnMtwLDNgrN
 DaJQ==
X-Gm-Message-State: AOJu0YyHyPrcIX8lS2kkTodnduymHEn+UQ40DBP4yAwdK44BynNPRpqH
 qp6rmkMtZtc/GZrB27nrevkA5oRW12b+A0sFhbJjPNwE2mo52ED82dCrpJChzlaVtpfiSKIHRLo
 JEO3f/VU=
X-Gm-Gg: ATEYQzzu/z4ygQKnnJQIfZQzdMGf60gZgQMETFCR1wR7IZFbl0EJjJED8AGlU8f5t6R
 PlG0CJ+J51K5JbCrNU4QHNSyCGxoTr6Z/9RfUk/d1jAmFIesbajxemVOy5+kzeY4/cQhL0ALiuD
 wpq/o+IlR8P03hiKtzWywpIsTvp1H2nbgJCXNSMUv6q7Vb9pyuAxqkAb+h1DYux9kTkTVTeh6Tr
 UZEA3gQ+VTYajwQYvMDjePeLItpKfyCV5SurU9m3TTy/wj+lmNaXHxu8jhL1cf9rkoAQtkeV00W
 59jLxTGAaA8VUSeuOfJ21eixsVg81T4f1vkj6aCDbHcLeFKnMjRq7o4x1p3ObGnehyPy6rHT7ee
 3W/Nxrz+iM7NRmH2L3PU8GJJ54YDURcLGChwk2rMC90xDJwxIhCYmmcHwIsqRj6rCjVYz9pM4t4
 lqiWgjYN5YcO10CdBL9ULFnu4zTJsB23sFT6L++fBs8PQjENRs9Lm843apPkj8
X-Received: by 2002:a05:6000:2403:b0:439:b564:7a71 with SMTP id
 ffacd0b85a97d-43a04d782c1mr21823946f8f.1.1773661037761; 
 Mon, 16 Mar 2026 04:37:17 -0700 (PDT)
Received: from mindpad (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b3a09e453sm19809750f8f.0.2026.03.16.04.37.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2026 04:37:17 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Mon, 16 Mar 2026 12:37:14 +0100
Message-ID: <20260316113716.208738-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1773661038; x=1774265838; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NTtz6fRErN0P+TvflzKWKEeXYPg67fzJNWLrFqauAaQ=;
 b=JN2WgaYWBlLJdylo3jP6Gda4rqKFTdHmbf4sKokGOA/mfmceowiC+GlvGhjiea3hTd
 EtuggWgfT2Izir4bg2YU0MzAvkA2QpTo6xMGENqW5JKCw5YWno6f5QbIrMnIQdMYACSf
 DwhOqcxTrYg9cLMEqRP6UQrAYFBp4yJIE35oT1tIS9NSR0OHW9uhhOeW374JVp6nQl6Y
 3jAKayi7wj/py1K3oel0slT9zvTgFVYw1T0hGdgV+XA6t8v4R0hmg/IWCBtaBHiM/WEv
 2dpnbG9us1kGLnjEzDMsVARyeDF/nZdGEPf4Kkojy7FRbUCv2NgdGTPjI4zv+M1bMdZE
 v73w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=JN2WgaYW
Subject: [Buildroot] [2025.02.x,
 PATCH 1/3] package/mongoose: patch CVE-2025-65502
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- CVE-2025-65502:
    Null pointer dereference in add_ca_certs() in Cesanta Mongoose before
    7.2 allows remote attackers to cause a denial of service via TLS
    initialization where SSL_CTX_get_cert_store() returns NULL.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-65502
  - https://github.com/cesanta/mongoose/commit/64abf061bf018fd78f31c200a57a3fb04f9f3ef2

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../mongoose/0001-improve-resiliency.patch    | 37 +++++++++++++++++++
 package/mongoose/mongoose.mk                  |  3 ++
 2 files changed, 40 insertions(+)
 create mode 100644 package/mongoose/0001-improve-resiliency.patch

diff --git a/package/mongoose/0001-improve-resiliency.patch b/package/mongoose/0001-improve-resiliency.patch
new file mode 100644
index 0000000000..edeea4efba
--- /dev/null
+++ b/package/mongoose/0001-improve-resiliency.patch
@@ -0,0 +1,37 @@
+From 64abf061bf018fd78f31c200a57a3fb04f9f3ef2 Mon Sep 17 00:00:00 2001
+From: "Sergio R. Caprile" <scaprile@cesanta.com>
+Date: Mon, 13 Oct 2025 10:43:45 -0300
+Subject: [PATCH] improve resiliency
+
+CVE: CVE-2025-65502
+Upstream: https://github.com/cesanta/mongoose/commit/64abf061bf018fd78f31c200a57a3fb04f9f3ef2
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ mongoose.c        | 1 +
+ src/tls_openssl.c | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/mongoose.c b/mongoose.c
+index 4c72be8201..f860ab3b07 100644
+--- a/mongoose.c
++++ b/mongoose.c
+@@ -14581,6 +14581,7 @@ static STACK_OF(X509_INFO) * load_ca_certs(struct mg_str ca) {
+ static bool add_ca_certs(SSL_CTX *ctx, STACK_OF(X509_INFO) * certs) {
+   int i;
+   X509_STORE *cert_store = SSL_CTX_get_cert_store(ctx);
++  if (cert_store == NULL) return false;
+   for (i = 0; i < sk_X509_INFO_num(certs); i++) {
+     X509_INFO *cert_info = sk_X509_INFO_value(certs, i);
+     if (cert_info->x509 && !X509_STORE_add_cert(cert_store, cert_info->x509))
+diff --git a/src/tls_openssl.c b/src/tls_openssl.c
+index 37838d95ba..f51d6dd8b7 100644
+--- a/src/tls_openssl.c
++++ b/src/tls_openssl.c
+@@ -39,6 +39,7 @@ static STACK_OF(X509_INFO) * load_ca_certs(struct mg_str ca) {
+ static bool add_ca_certs(SSL_CTX *ctx, STACK_OF(X509_INFO) * certs) {
+   int i;
+   X509_STORE *cert_store = SSL_CTX_get_cert_store(ctx);
++  if (cert_store == NULL) return false;
+   for (i = 0; i < sk_X509_INFO_num(certs); i++) {
+     X509_INFO *cert_info = sk_X509_INFO_value(certs, i);
+     if (cert_info->x509 && !X509_STORE_add_cert(cert_store, cert_info->x509))
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 8316a8d59a..02c2ac5626 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -13,6 +13,9 @@ MONGOOSE_INSTALL_STAGING = YES
 # static library
 MONGOOSE_INSTALL_TARGET = NO
 
+# 0001-improve-resiliency.patch
+MONGOOSE_IGNORE_CVES += CVE-2025-65502
+
 MONGOOSE_CFLAGS = $(TARGET_CFLAGS) -std=gnu99
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
