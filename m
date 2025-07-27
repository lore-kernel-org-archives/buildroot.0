Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E91C87FCC
	for <buildroot@archiver.kernel.org>; Sun, 27 Jul 2025 10:04:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99FEF84110;
	Sun, 27 Jul 2025 10:04:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pu8-j6AV-UZb; Sun, 27 Jul 2025 10:04:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E12BB83CE1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E12BB83CE1;
	Sun, 27 Jul 2025 10:04:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2203E231
 for <buildroot@buildroot.org>; Sun, 27 Jul 2025 10:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1359E84108
 for <buildroot@buildroot.org>; Sun, 27 Jul 2025 10:04:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KGxj09pWZmjg for <buildroot@buildroot.org>;
 Sun, 27 Jul 2025 10:04:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 01BE680B97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01BE680B97
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 01BE680B97
 for <buildroot@buildroot.org>; Sun, 27 Jul 2025 10:04:21 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4563cfac19cso37376875e9.2
 for <buildroot@buildroot.org>; Sun, 27 Jul 2025 03:04:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753610660; x=1754215460;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MvuB/I0kXuBBgeipdOX9tMTj224eNJduuQ6rqhegmNw=;
 b=f2QYTkImJ/nOCji3132Fe9ynVeDwpKinQLQyf1sdjGv2DvuX+Asw3ojKMKZPVMtMD2
 DuMGlaZvPOrswuTMoRDGKIViQ4mtBrSUVKRDoC67E7flbPpxRu5tLTUHUUmESg8B9z2t
 4tw6zO9hXF8s4/BOT6j2g8guoNK0lIPmnQfrtTDhdzjixn37KxrKjpM/+p5t5YLTfpeF
 ZKd3HJU8KoCCt2k73RCTKqW93KfTuE4zDheNrO1iT6zegc6aa3kshDsOwDcCgixwxrPE
 7LeuYwPvAmWc5wxUa8zhzkl5VlisgtO4x9rZugjDcZrIdPRIuS1u8LtfMmcRi8z8KCGu
 Cdtg==
X-Gm-Message-State: AOJu0YxlTXkF04yNC/rjY9EgTAAemv6eQz6RJaby/CWoXawH2g4Y+oic
 rWoSS0wwupB7Hu6uXbZprUIrHS90s3KaJ6kach2roCdOzsnUDKHDPqHoT7f9VMxSbyPiDh8K5nN
 Mzz+j
X-Gm-Gg: ASbGncsG0YQ2bW6OG9T0L+ljQIMPSL1bW04IbYbFTNXO05f3o055VJiFuqkGvIA8r4A
 p4woWnztIw2yJVkKN/7iKLeWHJZv7dtkN5LabOSrFEifPzK+0Uam6hCIx8HfoErLbyUeZITuvu6
 2n7Z6M0tTX8QxlniTgk/3ygbZQ971v0jk/d5SUrtXS8Y9SC3im70TYsyL35DvwveHoc1cdMXo6G
 DWgdkbMgtJfX7sRFLMB2yV3fhxw/Nq5/xa9PKp6u4BbrOofEJwb/eCaQh8O1GgPI3na05ICE4Vm
 CKJ8GC3hwP/NUrkHeOGHk++wNCDvUanI/wpjmjZdC2Mpf2iQMAJfh/BB+VnRxoiElDqhSzqKT2F
 2yjZfF1lm/rf24g==
X-Google-Smtp-Source: AGHT+IGxVGsxWn/prbymZnxpGptokAnkLU1Zv0j0rORfmCWyqqToPALMYl+oxn+qPu48MoxXN+GiLA==
X-Received: by 2002:a05:600c:810c:b0:442:f97f:8174 with SMTP id
 5b1f17b1804b1-458765475bcmr71050775e9.18.1753610659644; 
 Sun, 27 Jul 2025 03:04:19 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b781d2fb95sm3239989f8f.7.2025.07.27.03.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 03:04:19 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 27 Jul 2025 12:04:18 +0200
Message-ID: <20250727100418.1017348-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1753610660; x=1754215460; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MvuB/I0kXuBBgeipdOX9tMTj224eNJduuQ6rqhegmNw=;
 b=EEFA/hr9kho5aI3FLw6uicKLftoQMWVT5PM6z3f1sTIB1AVwCv25IwItckW7rsC6uX
 Xkgve3D38kyzWWGetY0C37xSGH8zi35rWIyw9hIpf8DfgHGGIyXmDjAl9WNqgodzIY+U
 R79Ft7hLXMOOqFZpmLar3InQz+F9py0OewCmm326XJNfg1DSkI9ou/LbFm0nn1cutl2V
 yxlpUe4FmDgTKx5E0A8irT76Ac1AWfVDwOQI2QFdJVeunqJIP527+MRvfvbgfa5Rskqj
 JrBnFLVKR3jTFhsQpBnWOoIRwg4QBjp3BJ8oBmsG5ZRsHNr7cEaLhYSk6Ru+Gr9syFry
 BH4A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EEFA/hr9
Subject: [Buildroot] [PATCH] package/mbedtls: security bump to version 3.6.4
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

This fixes the following vulnerabilities:

- CVE-2025-48965

 Mbed TLS before 3.6.4 has a NULL pointer dereference because
 mbedtls_asn1_store_named_data can trigger conflicting data with val.p
 of NULL but val.len greater than zero.

For more information, see:
  - https://mbed-tls.readthedocs.io/en/latest/tech-updates/security-advisories/
  - https://github.com/Mbed-TLS/mbedtls-docs/blob/main/security-advisories/mbedtls-security-advisory-2025-06-6.md

- CVE-2025-49087

 In Mbed TLS 3.6.1 through 3.6.3 before 3.6.4, a timing discrepancy in
 block cipher padding removal allows an attacker to recover the
 plaintext when PKCS#7 padding mode is used.

For more information, see:
 - https://mbed-tls.readthedocs.io/en/latest/tech-updates/security-advisories/
 - https://github.com/Mbed-TLS/mbedtls-docs/blob/main/security-advisories/mbedtls-security-advisory-2025-06-5.md

- CVE-2025-49601

 In MbedTLS 3.3.0 before 3.6.4, mbedtls_lms_import_public_key does not
 check that the input buffer is at least 4 bytes before reading a
 32-bit field, allowing a possible out-of-bounds read on truncated
 input. Specifically, an out-of-bounds read in
 mbedtls_lms_import_public_key allows context-dependent attackers to
 trigger a crash or limited adjacent-memory disclosure by supplying a
 truncated LMS (Leighton-Micali Signature) public-key buffer under four
 bytes. An LMS public key starts with a 4-byte type indicator. The
 function mbedtls_lms_import_public_key reads this type indicator
 before validating the size of its input.

For more information, see:
 - https://github.com/Mbed-TLS/mbedtls-docs/blob/main/security-advisories/mbedtls-security-advisory-2025-06-4.md

- CVE-2025-52496

 Mbed TLS before 3.6.4 has a race condition in AESNI detection if
 certain compiler optimizations occur. An attacker may be able to
 extract an AES key from a multithreaded program, or perform a GCM
 forgery.

For more information, see:
 - https://github.com/Mbed-TLS/mbedtls-docs/blob/main/security-advisories/mbedtls-security-advisory-2025-06-1.md

- CVE-2025-52497

 Mbed TLS before 3.6.4 has a PEM parsing one-byte heap-based buffer
 underflow, in mbedtls_pem_read_buffer and two mbedtls_pk_parse
 functions, via untrusted PEM input.

For more information, see:
 - https://github.com/Mbed-TLS/mbedtls-docs/blob/main/security-advisories/mbedtls-security-advisory-2025-06-2.md

For more information on the release, see:
 - https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.4

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mbedtls/mbedtls.hash | 4 ++--
 package/mbedtls/mbedtls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index cc15958e3a..8b82313c07 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,4 +1,4 @@
-# From https://github.com/Mbed-TLS/mbedtls/releases/tag/v3.6.3.1:
-sha256  243ed496d5f88a5b3791021be2800aac821b9a4cc16e7134aa413c58b4c20e0c  mbedtls-3.6.3.1.tar.bz2
+# From https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.4:
+sha256  ec35b18a6c593cf98c3e30db8b98ff93e8940a8c4e690e66b41dfc011d678110  mbedtls-3.6.4.tar.bz2
 # Locally calculated
 sha256  9b405ef4c89342f5eae1dd828882f931747f71001cfba7d114801039b52ad09b  LICENSE
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index 563683e739..7777036ab0 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MBEDTLS_VERSION = 3.6.3.1
+MBEDTLS_VERSION = 3.6.4
 MBEDTLS_SITE = https://github.com/Mbed-TLS/mbedtls/releases/download/v$(MBEDTLS_VERSION)
 MBEDTLS_SOURCE = mbedtls-$(MBEDTLS_VERSION).tar.bz2
 MBEDTLS_CONF_OPTS = \
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
