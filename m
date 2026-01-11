Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49136D2502F
	for <buildroot@archiver.kernel.org>; Sun, 11 Jan 2026 10:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58BDF40484;
	Sun, 11 Jan 2026 10:06:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cy4q3kkg40RH; Sun, 11 Jan 2026 10:05:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64EC2403E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768125959;
	bh=4/QjIqb32mVsk+QYHgs+Ohum8VW5nuS/OxLUN2uONDE=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=bVnN9x/+SVWwyM++X4NGerpfxaavGm6E5oRmitQ1hCOFw1PWTsRWYtZyikqPC9HKI
	 Hoh1e9lzpcPzw+VtG1SKCDzrVSrVTTUxbYxB7X347uH1uM8UGWtCHQGnmbMwrgIxpK
	 xLFR9BTmfYdJZz7i48REAbySXAhQ6354NZ87At1cR10bUA7JDr8cvrXiKtxwEjCYus
	 4/iyCyDS1MQ5FdBJ/LzH0aEZRpSvapJO22A+wNkt5VHTnV1ujfLxRGFbmsS+6k3M0A
	 HhDxb4f/B5cCteaduZiK0KpyAqdaPtHoI1TLvetDNV8ZRSUuj/YpJzc3tjurhKc7dI
	 q8S1LxPxPfOWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64EC2403E9;
	Sun, 11 Jan 2026 10:05:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A6B5818D
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 10:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98A6F403E9
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 10:05:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RZW2uhl0va0q for <buildroot@buildroot.org>;
 Sun, 11 Jan 2026 10:05:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EE3DE403B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE3DE403B1
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE3DE403B1
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 10:05:55 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-4327555464cso3209717f8f.1
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 02:05:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768125953; x=1768730753;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=15aUq2quXqICe3cGp8dP9x4DDZmaBGH976nMChHYpMw=;
 b=Mx7sTFP4aPDJDqTBzB0Zx54DQpcXF5GJJwQptYsqo0VSWhB+Rrg1ZA9NoSRqzMqXRy
 KFFZ3vj9hE0K97yNlWyGcFZuGZmZsQ2Gx1piLhp+uJv2IF05d1Kx0O/CkVrPSmOkFzoU
 ADzSnhAS5EzT43GMeApFjNgzPaLEm5W8ljOCjKH2QYyZ1tZWTJimOA/kCYYd2PuV2vIB
 5Rkfaz+YtunA0/90iyME8c3nRBxRxNy8+pZQn4/S0UhS/972eM389R+VHfUkbLjERf0X
 4pb4LpQkFWv0rSR1GpRKBRv8vvq1nJJVlzGpW2uGWO9S0zdXsxmL9Wq9bN7eSH2qkUJf
 x8Mg==
X-Gm-Message-State: AOJu0YwE1slzw1ypBYqQZwibRwrSV+D205H5lSXo2WE7v4UjVRGSy/TZ
 8GCWpvkpW+ikaRFGUwHUdpHUUOW8ff/Z0B/NYlnnyeT6FNDQ9vwAU7069Xwn0LzQvqkGalQKCTM
 +QAWV
X-Gm-Gg: AY/fxX4+IEgbaaCMVX5GTELcqFYh6buMxaf+wFKn0Oce03u4BigK9NA2I9kednlPW36
 L8hZx+/NoUhahUcNPBCn8Kqa8K+QyDS8R3FXTLQn5BfjJjIcbjgKB1E4Qfqppch/zwz4worsywD
 2gUIRNOosU/vCPBSa1BBgUMwpUvX0L97pVr26DdUCL/D/bAIU+rwmABDKJEej8nfRf71AUZ6QUb
 ka9vCQp8DIXEC1bjf31WyatQCN6mMqOP8WhrJLtBMG7SXloMtGlUP8MOW2w99bpog+5ikxrmui9
 ROp+X+LE1wYMPnPwW+aiHUJm5w1irktzKYGzQttZzNOdAHv/cK39B/64OG6wcGickZ75eS9NQJD
 5lXMffNUTMQnMvDNc1+Fk4ccaAt0uVelGMHu9Ri3GGqJLgoslVeogjRwzp2YpsXpUIdwt6yNPe8
 3ot6+hmVEDDf8Hjp7rwDoes2DJ9EGfXs9qfCkGgApy2Wq1VA==
X-Google-Smtp-Source: AGHT+IE4hTmCbHmMrWeBEalnI3nvtLpFia/qAmhj8apFZ8s1ZUJENU2ZdEjypo5VF23Cc+VSomWEtA==
X-Received: by 2002:a05:6000:26c2:b0:431:8f8:7f24 with SMTP id
 ffacd0b85a97d-432c379d19emr17220247f8f.39.1768125952975; 
 Sun, 11 Jan 2026 02:05:52 -0800 (PST)
Received: from arch (94.105.116.200.dyn.edpnet.net. [94.105.116.200])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432d286cdecsm18491794f8f.7.2026.01.11.02.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jan 2026 02:05:52 -0800 (PST)
To: buildroot@buildroot.org
Cc: Joris Lijssens <joris.lijssens@gmail.com>
Date: Sun, 11 Jan 2026 11:05:51 +0100
Message-ID: <20260111100551.34348-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1768125953; x=1768730753; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=15aUq2quXqICe3cGp8dP9x4DDZmaBGH976nMChHYpMw=;
 b=ZXxNpoeJ0H6nYKXPM878/pt4qvIeww6XO+gajEXV5RhTMEprGAfvqoWZf6W69tPNM2
 nM4hnpgYbz46kQXLDRXtflkGoL8Ejni+VSHYTCsta0jzbOv/PEbzIX8yqKAUcUKUjPkc
 hf1z2ghzvnAStYuB3cyRLzW5AWBPyG+yPGufkDkZXvZZdFzseCEByG++Guk2WclvzKbs
 jCPQCzFRf4zROa0PdrsH4pxpJsZQC/CmTD87RNL62Nux0TFfaCRl1aByn+CL0PVsvZ+H
 +jKhtCuxwYkfgSRzlYFco0JIU5bCDl8ht2w9d1BReg7eAoT5dnI0djgW3DyV3UJl7bSC
 /8cQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ZXxNpoeJ
Subject: [Buildroot] [PATCH 1/1] package/libcoap: security bump to v4.3.5a
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

For more info on the release, see:

- https://github.com/obgm/libcoap/compare/v4.3.5...v4.3.5a
- https://github.com/obgm/libcoap/blob/release-4.3.5-patches/ChangeLog

Fixes the following vulnerabilities:

- CVE-2025-59391:
    A memory disclosure vulnerability exists in libcoap's OSCORE
    configuration parser in libcoap before release-4.3.5-patches. An out-
    of-bounds read may occur when parsing certain configuration values,
    allowing an attacker to infer or read memory beyond string boundaries
    in the .rodata section. This could potentially lead to information
    disclosure or denial of service.

    https://www.cve.org/CVERecord?id=CVE-2025-59391

- CVE-2025-65493:
    NULL pointer dereference in src/coap_openssl.c in OISM libcoap 4.3.5
    allows remote attackers to cause a denial of service via a crafted
    DTLS/TLS connection that triggers BIO_get_data() to return NULL.

    https://www.cve.org/CVERecord?id=CVE-2025-65493

- CVE-2025-65494:
    NULL pointer dereference in get_san_or_cn_from_cert() in
    src/coap_openssl.c in OISM libcoap 4.3.5 allows remote attackers to
    cause a denial of service via a crafted X.509 certificate that causes
    sk_GENERAL_NAME_value() to return NULL.

    https://www.cve.org/CVERecord?id=CVE-2025-65494

- CVE-2025-65495:
    Integer signedness error in tls_verify_call_back() in
    src/coap_openssl.c in OISM libcoap 4.3.5 allows remote attackers to
    cause a denial of service via a crafted TLS certificate that causes
    i2d_X509() to return -1 and be misused as a malloc() size parameter.

    https://www.cve.org/CVERecord?id=CVE-2025-65495

- CVE-2025-65496:
    NULL pointer dereference in coap_dtls_generate_cookie() in
    src/coap_openssl.c in OISM libcoap 4.3.5 allows remote attackers to
    cause a denial of service via a crafted DTLS handshake that triggers
    SSL_get_SSL_CTX() to return NULL.

    https://www.cve.org/CVERecord?id=CVE-2025-65496

- CVE-2025-65497:
    NULL pointer dereference in coap_dtls_generate_cookie() in
    src/coap_openssl.c in OISM libcoap 4.3.5 allows remote attackers to
    cause a denial of service via a crafted DTLS handshake that triggers
    SSL_get_SSL_CTX() to return NULL.

    https://www.cve.org/CVERecord?id=CVE-2025-65497

- CVE-2025-65498:
    NULL pointer dereference in coap_dtls_generate_cookie() in
    src/coap_openssl.c in OISM libcoap 4.3.5 allows remote attackers to
    cause a denial of service via a crafted DTLS handshake that triggers
    SSL_get_SSL_CTX() to return NULL.

    https://www.cve.org/CVERecord?id=CVE-2025-65498

- CVE-2025-65499:
    Array index error in tls_verify_call_back() in src/coap_openssl.c in
    OISM libcoap 4.3.5 allows remote attackers to cause a denial of
    service via a crafted DTLS handshake that triggers
    SSL_get_ex_data_X509_STORE_CTX_idx() to return -1.

    https://www.cve.org/CVERecord?id=CVE-2025-65499

- CVE-2025-65500:
    NULL pointer dereference in coap_dtls_generate_cookie() in
    src/coap_openssl.c in OISM libcoap 4.3.5 allows remote attackers to
    cause a denial of service via a crafted DTLS handshake that triggers
    SSL_get_SSL_CTX() to return NULL.

    https://www.cve.org/CVERecord?id=CVE-2025-65500

- CVE-2025-65501:
    Null pointer dereference in coap_dtls_info_callback() in OISM libcoap
    4.3.5 allows remote attackers to cause a denial of service via a DTLS
    handshake where SSL_get_app_data() returns NULL.

    https://www.cve.org/CVERecord?id=CVE-2025-65501

LICENSE Year updated see [1].

[1] https://github.com/obgm/libcoap/commit/c9135b6b26b978295a3e1312ff59cb7cb9b32251

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libcoap/libcoap.hash | 4 ++--
 package/libcoap/libcoap.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcoap/libcoap.hash b/package/libcoap/libcoap.hash
index fc618fef52..17fce990fa 100644
--- a/package/libcoap/libcoap.hash
+++ b/package/libcoap/libcoap.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  a417ed26ec6c95c041b42353b5b6fad1602e2bf42a6e26c09863450e227b7b5f  libcoap-4.3.5.tar.gz
+sha256  bca78a2076ebb02179f93ab6cf2363b1256d878b540f810c238ea231ad5948ab  libcoap-4.3.5a.tar.gz
 sha256  09dd86a017bad210527085008cbf706609c58210897b69845af14099577e7eb7  COPYING
-sha256  ecff7aa3af994b008dbb57c180753bd2a6c53fa6f8265a2486740f4cfd45280c  LICENSE
+sha256  1ba383ac337111d18334b2e230d02831b60913d137c3b653585d8e8675824111  LICENSE
diff --git a/package/libcoap/libcoap.mk b/package/libcoap/libcoap.mk
index d7c2a78944..bb1321f194 100644
--- a/package/libcoap/libcoap.mk
+++ b/package/libcoap/libcoap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCOAP_VERSION = 4.3.5
+LIBCOAP_VERSION = 4.3.5a
 LIBCOAP_SITE = $(call github,obgm,libcoap,v$(LIBCOAP_VERSION))
 LIBCOAP_INSTALL_STAGING = YES
 LIBCOAP_LICENSE = BSD-2-Clause
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
