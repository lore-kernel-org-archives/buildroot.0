Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A524BC83F17
	for <buildroot@archiver.kernel.org>; Fri, 18 Jul 2025 14:58:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7388D40DB9;
	Fri, 18 Jul 2025 14:58:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hGkDfCgT-Bh2; Fri, 18 Jul 2025 14:58:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49AB240C80
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49AB240C80;
	Fri, 18 Jul 2025 14:58:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F206236
 for <buildroot@buildroot.org>; Fri, 18 Jul 2025 14:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3544E401A0
 for <buildroot@buildroot.org>; Fri, 18 Jul 2025 14:58:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DHC4Rv9vF43E for <buildroot@buildroot.org>;
 Fri, 18 Jul 2025 14:58:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D8CF740083
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8CF740083
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D8CF740083
 for <buildroot@buildroot.org>; Fri, 18 Jul 2025 14:58:15 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4561514c7f0so22361155e9.0
 for <buildroot@buildroot.org>; Fri, 18 Jul 2025 07:58:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752850693; x=1753455493;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+NZmSYQlDb1iuufnWt9i6TMKF6uojWyCKUbDXZZwXmU=;
 b=DEujw65i7NRAntJ3ygRSnsKXA2bHYRiv5bo98KZGfJ8X0SJ7u3+aGE7lzpKV1e8CRc
 2UXCeZCXBo9wzasWCBUN1XG5rNyfKScdqqOF6bKVbhPfX2EcMbTFe8wPeSxqN+wgqedP
 VIwJrc101iYdJEsAGDU4VyRsfOCsj93OJdM3qhC9CFc3ZN9U8x8043lKUlSW8l2Kr4i6
 qXRtP+tA8bLplI1HMaegJGEH3AiaBmFIriWBZnp1zC433upkIGBAVxiW6JcHTToncY5j
 Wq6tbE6fzNnmB/+oExKI/JgarpFk94Lkm8GACQtQDm/smSPQjaajMO1Z629+5NfwTfGR
 mLCQ==
X-Gm-Message-State: AOJu0YzM20UAeO0qH4pJDGan+1BWeIk6pMcY6nx1YB6Qxe+CDODJ6A0m
 st+tVuOG8Na2qZhxwYvWRXVcuni2qS7SfoB/hAoI3MP9lxr/nEx2MKu3JdyPsdAbm+IJlmHXVt2
 nkQmm
X-Gm-Gg: ASbGncv3/XAK/MnwuyDbb4XXGIqHr9Gt0TcmZPGZ3/tmROWIqF48OvRhNmSv72SVm4x
 glhA3beLPB4egvekefBCNmYMx1mc2qbyyotDFhiMXEjSGmFeSGkCPlOe1nrjbWIwKU+9Z4B274O
 7SlTdxmQr9kCxESSNX40nPj85pPG7ONq5dTBv1zAapQ59toIwxnOYY7jBuXz8l37UT845FFd5Lg
 hvZExL+7QA4C4tKGD5krW4EtTwKF5n/1LMYOyeik5EKwk/YHj2wPlNRXtdCzcDf+gpNtPiu9dAN
 qsPYow/Ovu680xFRXdDZMh8UoZXQ3iGBZNt2J8jorbLS/R8xAHRS/N+WSN96v7CjDXIWeZHYVgG
 V0YX20AsC6OeRcs3dF0LcWYAFmdaKXCpuk6kOL2GK9bccvdR8OsCqSw==
X-Google-Smtp-Source: AGHT+IHaTQC0hs4yyMETyf0OHYHwPqTUCPIs1sA/Xjn36QvjcekUGsgkH7l0LLH4bb+nA/1uZSUQ1A==
X-Received: by 2002:a05:600c:4fc5:b0:456:1156:e5f5 with SMTP id
 5b1f17b1804b1-456359ee0a4mr71087945e9.31.1752850693260; 
 Fri, 18 Jul 2025 07:58:13 -0700 (PDT)
Received: from dragon.local.ess-mail.com
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca4d48bsm2084103f8f.62.2025.07.18.07.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 07:58:12 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 18 Jul 2025 16:57:45 +0200
Message-ID: <20250718145745.79845-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752850693; x=1753455493; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+NZmSYQlDb1iuufnWt9i6TMKF6uojWyCKUbDXZZwXmU=;
 b=SiP//NOIrnpMw5JcP8lknu0jjFTUqWObovtazhHDxeKXI5PY2V/84nRVvHyoGqr21a
 jZxoBzTntGyZ2tdCfB7LqTpJfM/K0uJBPlChTh7dWqcsureG72UmXtuEd2F+7A54eGr+
 S84Gt5NGJ7P8gpSgSLH0K55usl2IPTxOrp7laz9AYQr3gCuBQDvKDvl9Dmvg3AqcHIys
 gwUOOcLjUZa4hWXuscHSvvge/679e3wXgg6yObHCWDIrGhJzkC6ba2yvnxi05/A63bIE
 bKosMmJ5XtJa4fv0sZNTLhiZ/O7tiQ+hWwHFOLjdL+TPo7A96P9SoZ1WjxtgP5p7E8mn
 8AHg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=SiP//NOI
Subject: [Buildroot] [PATCH] package/mbedtls: security bump to v3.6.4
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

This is a security release of the Long Term Support branch, see release notes:
https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.4

Also update the download location, because upstream changed the tag naming
scheme from v<...> to mbedtls-<...>

This fixes the following vulnerabilities:

- CVE-2025-47917
    Fix possible use-after-free or double-free in code calling
    mbedtls_x509_string_to_names(). This was caused by the function calling
    mbedtls_asn1_free_named_data_list() on its head argument, while the
    documentation did no suggest it did, making it likely for callers relying
    on the documented behaviour to still hold pointers to memory blocks after
    they were free()d, resulting in high risk of use-after-free or double-free,
    with consequences ranging up to arbitrary code execution.
    In particular, the two sample programs x509/cert_write and x509/cert_req
    were affected (use-after-free if the san string contains more than one DN).
    Code that does not call mbedtls_string_to_names() directly is not affected.

- CVE-2025-48965
    Fix a bug in mbedtls_asn1_store_named_data() where it would sometimes leave
    an item in the output list in an inconsistent state with val.p == NULL but
    val.len > 0. This impacts applications that call this function directly,
    or indirectly via mbedtls_x509_string_to_names() or one of the
    mbedtls_x509write_{crt,csr}set{subject,issuer}_name() functions. The
    inconsistent state of the output could then cause a NULL dereference either
    inside the same call to mbedtls_x509_string_to_names(), or in subsequent
    users of the output structure, such as mbedtls_x509_write_names(). This
    only affects applications that create (as opposed to consume) X.509
    certificates, CSRs or CRLs, or that call mbedtls_asn1_store_named_data()

- CVE-2025-49087
    Fix a timing side channel in the implementation of PKCS#7 padding
    which would allow an attacker who can request decryption of arbitrary
    ciphertexts to recover the plaintext through a timing oracle attack.

- CVE-2025-49600:
    In MbedTLS 3.3.0 before 3.6.4, mbedtls_lms_verify may accept invalid
    signatures if hash computation fails and internal errors go unchecked,
    enabling LMS (Leighton-Micali Signature) forgery in a fault scenario.
    Specifically, unchecked return values in mbedtls_lms_verify allow an
    attacker (who can induce a hardware hash accelerator fault) to bypass
    LMS signature verification by reusing stale stack data, resulting in
    acceptance of an invalid signature. In mbedtls_lms_verify, the return
    values of the internal Merkle tree functions create_merkle_leaf_value
    and create_merkle_internal_value are not checked. These functions
    return an integer that indicates whether the call succeeded or not. If
    a failure occurs, the output buffer (Tc_candidate_root_node) may
    remain uninitialized, and the result of the signature verification is
    unpredictable. When the software implementation of SHA-256 is used,
    these functions will not fail. However, with hardware-accelerated
    hashing, an attacker could use fault injection against the accelerator
    to bypass verification.
    https://www.cve.org/CVERecord?id=CVE-2025-49600

- CVE-2025-49601:
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
    https://www.cve.org/CVERecord?id=CVE-2025-49601

- CVE-2025-52496:
    Mbed TLS before 3.6.4 has a race condition in AESNI detection if
    certain compiler optimizations occur. An attacker may be able to
    extract an AES key from a multithreaded program, or perform a GCM
    forgery.
    https://www.cve.org/CVERecord?id=CVE-2025-52496

- CVE-2025-52497:
    Mbed TLS before 3.6.4 has a PEM parsing one-byte heap-based buffer
    underflow, in mbedtls_pem_read_buffer and two mbedtls_pk_parse
    functions, via untrusted PEM input.
    https://www.cve.org/CVERecord?id=CVE-2025-52497

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/mbedtls/mbedtls.hash | 4 ++--
 package/mbedtls/mbedtls.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index cc15958e3a..bf1db1fecd 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,4 +1,4 @@
-# From https://github.com/Mbed-TLS/mbedtls/releases/tag/v3.6.3.1:
-sha256  243ed496d5f88a5b3791021be2800aac821b9a4cc16e7134aa413c58b4c20e0c  mbedtls-3.6.3.1.tar.bz2
+# From https://github.com/Mbed-TLS/mbedtls/releases/tag/v3.6.4:
+sha256  ec35b18a6c593cf98c3e30db8b98ff93e8940a8c4e690e66b41dfc011d678110  mbedtls-3.6.4.tar.bz2
 # Locally calculated
 sha256  9b405ef4c89342f5eae1dd828882f931747f71001cfba7d114801039b52ad09b  LICENSE
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index 563683e739..b46bbe888a 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MBEDTLS_VERSION = 3.6.3.1
-MBEDTLS_SITE = https://github.com/Mbed-TLS/mbedtls/releases/download/v$(MBEDTLS_VERSION)
+MBEDTLS_VERSION = 3.6.4
+MBEDTLS_SITE = https://github.com/Mbed-TLS/mbedtls/releases/download/mbedtls-$(MBEDTLS_VERSION)
 MBEDTLS_SOURCE = mbedtls-$(MBEDTLS_VERSION).tar.bz2
 MBEDTLS_CONF_OPTS = \
 	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -std=c99" \
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
