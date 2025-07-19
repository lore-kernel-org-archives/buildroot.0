Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43CE5C83F27
	for <buildroot@archiver.kernel.org>; Sat, 19 Jul 2025 12:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0210E819D1;
	Sat, 19 Jul 2025 12:54:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PvTbI4H3lduz; Sat, 19 Jul 2025 12:54:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E144781779
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E144781779;
	Sat, 19 Jul 2025 12:54:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 402B1117
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 12:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 324A560C2E
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 12:54:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kcnyk1VgTU1y for <buildroot@buildroot.org>;
 Sat, 19 Jul 2025 12:54:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64C6D60A5A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64C6D60A5A
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 12:54:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 539BF867C9; Sat, 19 Jul 2025 12:54:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Jul 2025 14:51:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2bc9a3bf7e154d084ae630bc38972eb8bbcc4cf9
X-Git-Newrev: 24639e0f72f4d0490eaed779817fab14bf9f2dd1
X-Patchwork-Hint: ignore
Message-Id: <20250719125428.539BF867C9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mbedtls: security bump to v3.6.4
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=24639e0f72f4d0490eaed779817fab14bf9f2dd1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
[Julien: fix upstream hash URL in hash file]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mbedtls/mbedtls.hash | 4 ++--
 package/mbedtls/mbedtls.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
