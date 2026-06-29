Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24337C43327
	for <buildroot@archiver.kernel.org>; Mon, 29 Jun 2026 10:23:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2BCD812F6;
	Mon, 29 Jun 2026 10:23:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MK8VTWZvSKF2; Mon, 29 Jun 2026 10:23:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D104881337
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782728596;
	bh=5nc5B6+eDuvDGQMxDBJvMbpQDm/4eaz8wbwznSQM5do=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=PSpnJ4o0CCVH5IHyh1XqvnPZqxk6CrTQrDTUGZD9V+WkSo5WWtOTCJENJ5YiIqAWo
	 2HfGthFX2UByl3iA5Sac29MPd+wxBk9M1FyS84lTZObf9lKpFtCDmjPIqp4MOqdBlp
	 MfmENzN3/7Ac7QF/rxZmWy/GAyOZO5clLKEDY4ZlpJEdzagBKrkmtWOeeE8nPlDduT
	 hqcLZcSoTzAklf5udgQFIGgC9aK+8yAgsmWDbaW5pInl1TVmF0eG+Td43yQ5suP44h
	 vGAzQ/PZc0bVK/VUZHEjNM2Yppv2AJGb/cC5DfYTM11hZGJIi9flw/6gEJCEEg8D2f
	 Vu/27kmypkcsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D104881337;
	Mon, 29 Jun 2026 10:23:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E9D9264
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 10:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2427B81337
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 10:23:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RNDr2sazTqMm for <buildroot@buildroot.org>;
 Mon, 29 Jun 2026 10:23:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 125B4812F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 125B4812F6
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 125B4812F6
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 10:23:13 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-471eeac43bfso1633125f8f.3
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 03:23:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782728591; x=1783333391;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aI/3GlDT5qjYbSjU8FIcw7RfwyXw1yxeaX+ZtLLRr14=;
 b=DguPrIPxzU2zgOg9SW7IJ+12w5exTknc6aYtxx3qrgQ3OadNSZoi6gsCqKJ3jyJjMn
 HIFc/F8xXKE3dDk9lJ5Utggv5Iv7JceGFBHyfFoITT4DYYLGTld8JyIH5DYs+CV1pjxC
 /KkSD0j0s+thOyhSRYfF5A7vbapm7khtLPtDUjuheTx0cl93dGWstWBrHp1QqGJ4KAvb
 9UhdclWrEEA8Llz+eJoDePmhnm3eEklzjrgBmF50rD5KScrLkEYJU0JyW3If987JWYdM
 L3cLpPocfCEjvzaKSUfJkCO9/myUKYfUMliFSDcPVKnBwO17NvPGJt7Oz+RPXGPcMmAx
 5BWQ==
X-Gm-Message-State: AOJu0YxYLkdut0Yz9iFfzamCSE8yYA9EO/ugwFhRJx3syhS6gXpPnWC1
 4EbcIuSRRn/h3svVjr17ztxJlcZF4YkB+5f75/SbTQOkMTLKifJGZbKtvt4+kTYCGAftnG6/sAo
 23IOp
X-Gm-Gg: AfdE7cmEbZDaAkMSZbanKh374RDZYYK/SOrKZLeAnQPdDvVen/ESwxxij3GBrBnaJ4t
 GfW4kqrWEqd93Q8vKI0sNXGxJPVTfy+y9xrQTAY9731mSOyIMVpaprv7rECyYSnHGThGctTmQtN
 VcPkg0lR5xK2khm+/JepqKllHHZoRP0t0dIkUDSaBOJ7bwiMTue1zxZ3Z//4Rht+lmaUVCqFZnP
 CUd1y0plYv3aeRj21E1BrKHJpNNbWfQ6W4uI11mAkWG9L1yaIh701CERN1faDlgvBM3iUHjkRy+
 B7DRKqWCVD4d5xjcnrkgtr8V7Sp1kspP9RXEulotKxJ333h9Iyp18Csv7alqt1cUCkA4YRSQd03
 M7vjLYYQXvpOFKOPGNiu6DmF/pjePhkIoolIxb8p3IwZEy2xADfiggDepVrtmkfhdWqR3ddkakp
 mWVQ50tjwL8ZOETMIQArXsI22GT8MuWT8leVO6ng76NTj/hxmw0INS22mqgstSkvTszA==
X-Received: by 2002:a05:6000:2483:b0:472:79bc:3919 with SMTP id
 ffacd0b85a97d-47279bc3aa5mr8483090f8f.39.1782728591339; 
 Mon, 29 Jun 2026 03:23:11 -0700 (PDT)
Received: from dragon.home (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c221d93eesm46941432f8f.20.2026.06.29.03.23.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 03:23:11 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pierre-Jean Texier <texier.pj2@gmail.com>, thomas.perale@mind.be
Date: Mon, 29 Jun 2026 12:22:20 +0200
Message-ID: <20260629102220.2654363-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782728591; x=1783333391; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aI/3GlDT5qjYbSjU8FIcw7RfwyXw1yxeaX+ZtLLRr14=;
 b=XfUkzncdoLZ9qTR1Q2q0/hQPaQwdDsBkvOLcdquqMv4BrEntq0wu0LtqTzgULGjbML
 px0t3nNqfCgbZxmRybcFVYX+5JogxwI+0YxVA+GPxxlvpb//crLMn/rn0KJVxKfPcjS2
 7iisMKMBYYCUaxR3INyd073VXziXcn00i+JT0VXOmRQZZRYyHH+S61u/aU1nZTMI8wTX
 VFns1u6FdIH/DlefG3t0LhcmhyKwah/gWJdypYS9mIpvX/TFtw3qDnF+i9zZ5VdtotVr
 e3NAvM8H2PBwOW1NMw7AXFRjpuDh94d3af7hsZX853BEo3yOl6TwrdhAaQhqAxHSu90Y
 MoDQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=XfUkzncd
Subject: [Buildroot] [PATCH for 2025.02.x] package/mongoose: security bump
 to v7.22
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As indicated in the release notes:
https://github.com/cesanta/mongoose/releases/tag/7.22

    This release includes a substantial number of security fixes,
    reflecting increased use of AI-powered security tools and valuable
    contributions from the security research community.

    Please note that many of the resolved issues have not yet been assigned
    CVE identifiers. The assignment process is underway, and these release
    notes will be updated as additional CVEs become available.

Given the large number of security fixes included in that release, bump the
version for Buildroot LTS instead of applying individual patches

Along with the version bump:
- Remove patch for a security issue fixed by the version bump
- Update license hash following the update of the copyright year in
  https://github.com/cesanta/mongoose/commit/1f9e1a38b55455ed63a616aeb7b1070f2a2d4ddd

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 .../mongoose/0001-improve-resiliency.patch    | 37 -------------------
 package/mongoose/mongoose.hash                |  4 +-
 package/mongoose/mongoose.mk                  |  5 +--
 3 files changed, 3 insertions(+), 43 deletions(-)
 delete mode 100644 package/mongoose/0001-improve-resiliency.patch

diff --git a/package/mongoose/0001-improve-resiliency.patch b/package/mongoose/0001-improve-resiliency.patch
deleted file mode 100644
index edeea4efba..0000000000
--- a/package/mongoose/0001-improve-resiliency.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 64abf061bf018fd78f31c200a57a3fb04f9f3ef2 Mon Sep 17 00:00:00 2001
-From: "Sergio R. Caprile" <scaprile@cesanta.com>
-Date: Mon, 13 Oct 2025 10:43:45 -0300
-Subject: [PATCH] improve resiliency
-
-CVE: CVE-2025-65502
-Upstream: https://github.com/cesanta/mongoose/commit/64abf061bf018fd78f31c200a57a3fb04f9f3ef2
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- mongoose.c        | 1 +
- src/tls_openssl.c | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/mongoose.c b/mongoose.c
-index 4c72be8201..f860ab3b07 100644
---- a/mongoose.c
-+++ b/mongoose.c
-@@ -14581,6 +14581,7 @@ static STACK_OF(X509_INFO) * load_ca_certs(struct mg_str ca) {
- static bool add_ca_certs(SSL_CTX *ctx, STACK_OF(X509_INFO) * certs) {
-   int i;
-   X509_STORE *cert_store = SSL_CTX_get_cert_store(ctx);
-+  if (cert_store == NULL) return false;
-   for (i = 0; i < sk_X509_INFO_num(certs); i++) {
-     X509_INFO *cert_info = sk_X509_INFO_value(certs, i);
-     if (cert_info->x509 && !X509_STORE_add_cert(cert_store, cert_info->x509))
-diff --git a/src/tls_openssl.c b/src/tls_openssl.c
-index 37838d95ba..f51d6dd8b7 100644
---- a/src/tls_openssl.c
-+++ b/src/tls_openssl.c
-@@ -39,6 +39,7 @@ static STACK_OF(X509_INFO) * load_ca_certs(struct mg_str ca) {
- static bool add_ca_certs(SSL_CTX *ctx, STACK_OF(X509_INFO) * certs) {
-   int i;
-   X509_STORE *cert_store = SSL_CTX_get_cert_store(ctx);
-+  if (cert_store == NULL) return false;
-   for (i = 0; i < sk_X509_INFO_num(certs); i++) {
-     X509_INFO *cert_info = sk_X509_INFO_value(certs, i);
-     if (cert_info->x509 && !X509_STORE_add_cert(cert_store, cert_info->x509))
diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
index 18b5e222ac..1a60b0c89c 100644
--- a/package/mongoose/mongoose.hash
+++ b/package/mongoose/mongoose.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  b6a6f69912c2cd0c67f85633c6b578d4dcdf385c3628acdcd21de28787c676e5  mongoose-7.17.tar.gz
-sha256  9abc2509d90c01ff2a0c91abf73582cdbcf1d2dbcc0b7973097eced43cf4cdd4  LICENSE
+sha256  87727cd2c240ff559b16e9710d44b61ba3513dbee50428bd8ee1596d7c58460a  mongoose-7.22.tar.gz
+sha256  f0d9cfd6f7d92f6ec061a5fb2882f67d2521a151bf09a637c33ca6181834b048  LICENSE
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 9b8920a9f3..207d31cdfa 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGOOSE_VERSION = 7.17
+MONGOOSE_VERSION = 7.22
 MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 MONGOOSE_LICENSE = GPL-2.0
 MONGOOSE_LICENSE_FILES = LICENSE
@@ -13,9 +13,6 @@ MONGOOSE_INSTALL_STAGING = YES
 # static library
 MONGOOSE_INSTALL_TARGET = NO
 
-# 0001-improve-resiliency.patch
-MONGOOSE_IGNORE_CVES += CVE-2025-65502
-
 MONGOOSE_CFLAGS = $(TARGET_CFLAGS) -std=gnu99
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
