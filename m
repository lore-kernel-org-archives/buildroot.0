Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09016CA5FFC
	for <buildroot@archiver.kernel.org>; Mon,  5 Oct 2026 15:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEDAA60678;
	Mon,  5 Oct 2026 15:58:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vlsxhtkiJkgk; Mon,  5 Oct 2026 15:58:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7FFCD6070C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791215925;
	b=mYVeUwMNABZWwE70Z2GgUXwriP2lcdtFZrkH84lqGohRklBtQFiB+0E4jr8T/1PyJ5tt
	 JZ5U2ZX3+XQHGfoBwZ6ZfPOyvaXENsy7K6x2SWBFHu4OcyqdPpkWCOrZGzIsBkILy6Q2E
	 9jmR+oduLlrUr6QK0lJSZid8iFja403+CmrfP+WQtbkMZrldmHmbgy9KPMeMVHgOGOY38
	 8pRwvwQ/1zfVtoA+mxRKTC2SsiEGPo6Jzqg+18NngfFoE7xRInvwxlgx34Yr5SLCRmW8T
	 6vm2wbWGSej3f9Kua7kPO91UfUvahtTq5o71kkcSmsKxRI/NwoiukGEK7iaCbPt3u5w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791215925;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=YUPjWZApuARv28hc+OiMop/YL2ztRhMzsI+kple2kGQ=;
	b=rHE7UeCD1+2fNB6xEg9k5QQ6tH3p2rWCjdsUGTexuCbrYAhZA89KjMCfylOra/y0TtHT
	 Fgnd4Fvppmd3CkImcglPZwMUX7+NGf3wD7r6J/+mnk71SpBSgKBwBpy8JSkK59ceIumTp
	 ouid9nN26oorrra9V2Q/7AApJroWOGPsY8YwOe/Lhcfl6mGBaOTG30BSK8rnjRTmdAH7S
	 xnxbuHoKBqVOs66sQHWtG4jFBRgMCqgZMJLGDiMReuogzu+91F1GDXsLvzkTe+lQ0bSo9
	 9z4gcLzN+8b22TlAIy/7QIm48c6YpHci88tG914QqupJBlGw45SD3Ow/rfyB1C+wQLw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791215925;
	bh=YUPjWZApuARv28hc+OiMop/YL2ztRhMzsI+kple2kGQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BmARgUNKyGoSf+wwzbOjBLv9fLZITRjtSP54b1DH/8/W2X++fLH5IjyLmwlttS30M
	 rFJ4BrOMTxtp7HrtJsjla1kYqX3Hb+c6hp8yQ1rVbpgLUgke98po8P+4PCDnc1vfF3
	 WKqJvS69mPxJEQamWBWmDsE2iY6fVcJu5+2nsVo2GYv55bxxFZqmCOH8B2jt6LxQlc
	 2CdNAYoKxIC4/JqffTor0RIrVkqSAAlasIZzAtQYP2DcCSoN/WfyfpV6eERDiICdA/
	 2qGGjkBUE+zJYclxV01tircClEJbSCR8F+BPTWyiiDbOiFVzHB361BJpidGWrT564X
	 4MhOVgoKr9POQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FFCD6070C;
	Mon,  5 Oct 2026 15:58:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 86B89338
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 15:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77E0A605E8
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 15:48:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RoKUDzmIi49n for <buildroot@buildroot.org>;
 Mon,  5 Oct 2026 15:48:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5EEDF605DE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791215293;
 b=gvfq/02la1ElG1zbJOgtSjp9Q6lql5AKyY7nnqP5+m8nfziu9JVQhzNLuaaVplJS/mWu
 kLtKJANZn1Dq3en89Q6mMiEoyHJV8DmiojoiRYK3nm9ViVtuD9a7WFcBUz0DQWZiGPyjh
 SXmVrKsgn+pZBtfvEtALJkthAA8EY/6sL0al+rgbHMIdRjeYpha4VqhjKbY+0MZSHJBZJ
 XHo5+SXI++ZcgNDyCtODlIx1RHyM4QDzqRXwakwH++MN4tiB2HgAuvlf4sWCgrRb5VdPw
 ddmKpwXm65BiTVCXgM25OW5JHYIYWg9yQm4LEScEfj6C2FDM4S9zn4tLQMICxtmMr1g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791215293;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=pXzsqigiHrNaarGbSH2xxVzcXkKmkxf0YmlLtVlaejQ=;
 b=D5dlwtGG835+b4LRKLR+f3oZtcdbMeYbqV5u6x/2Z/b9kmKw3j9e00MFsqBpXV2JlrCl
 CdD/O9KseiCyG9N2zAmMtWqIyazKncb1cNIVE78g4acTrJ0BwjeJqglMjV0gaD2vm3POi
 cynCwl4yfDz2BCnc/6eUMFmm/W32RjBRM6lyW5nPUCp7/kJRb2jWrr5qN+rPq4ygVoAJQ
 OMjZOlD91MxFWEK7cSPydQxzYOUIXXI2+PLVV38mMCCFksZTgN2fs2O9Eg+llKcoh33yq
 Mjjj2GGX9oiXxQOI4np78lJo4Te9DBGCKTJwC02KeX4l+Q+sORbtvA++QRM7q0YIY+g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5EEDF605DE
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 15:48:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 98B468D5D4; Mon,  5 Oct 2026 15:46:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Oct 2026 17:45:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ddaa55ead5a12866363f69c562806acf297322cd
X-Git-Newrev: 45903c02e328712370b25c756050155c5fbdc5fd
X-Patchwork-Hint: ignore
Message-Id: <20261005154657.98B468D5D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mbedtls: security bump to v3.6.7
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/45903c02e328712370b25c756050155c5fbdc5fd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For more information about the release, see:

- https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.7
- https://github.com/Mbed-TLS/mbedtls/compare/mbedtls-3.6.6..mbedtls-3.6.7

Fixes the following vulnerabilities:

- CVE-2026-50587:
    Timing side-channel in RSA PKCS#1 v1.5 decryption

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-50587
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-rsa-pkcs1-v15-decryption-timing-side-channel/

- CVE-2026-50581:
    Extended master secret calculation failure ignored

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-50581
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-extended-master-secret-calculation-failure-ignored/

- CVE-2026-50640:
    Ignored TLS 1.3 resumption secret derivation error

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-50640
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-ignored-tls13-resumption-secret-derivation-error/

- CVE-2026-50713:
    Heap corruption with early renegotiation after corrupted record
    in DTLS

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-50713
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-heap-corruption-early-renegotiation-corrupted-dtls-record/

- CVE-2026-50584:
    ChaCha20 counter overflow can reuse keystream

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-50584
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-chacha20-counter-overflow-keystream-reuse/

- CVE-2026-73096:
    TLS 1.3 early data integrity failure due to buffered plaintext
    across key change

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-73096
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-tls13-early-data-integrity-failure-key-change/

- CVE-2026-35336:
    Possible buffer overflow in mbedtls_ecdh_calc_secret()

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-35336
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-possible-buffer-overflow-ecdh-calc-secret/

- CVE-2026-50580:
    Remote buffer overflow in TLS 1.2 ECDHE-PSK client handshake

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-50580
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-tls12-ecdhe-psk-client-buffer-overflow/

- CVE-2026-54435:
    Side channel leak in ECC optimized modp

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-54435
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-ecc-optimized-modp-side-channel/

- CVE-2026-50586:
    Information disclosure in TLS 1.2 NewSessionTicket

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-50586
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-tls12-newsessionticket-information-disclosure/

- CVE-2026-50583:
    Out-of-bounds read when parsing a zero-length ECC public key

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-50583
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-zero-length-ecc-public-key-oob-read/

- CVE-2026-50588:
    Out-of-bounds read in TLS 1.2 EC J-PAKE ServerKeyExchange
    parsing

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-50588
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-tls12-ecjpake-serverkeyexchange-oob-read/

- CVE-2026-50579:
    Use-after-free in mbedtls_pkcs7_free() when reusing a PKCS7
    context

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-50579
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-use-after-free-pkcs7-free-reused-context/

- CVE-2026-54441:
    Signature algorithm restrictions not enforced on certificate
    chain

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-54441
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-signature-algorithm-restrictions-certificate-chain/

- CVE-2026-50585:
    Incomplete context reset in mbedtls_ssl_session_reset()

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-50585
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-ssl-session-reset-incomplete-context-reset/

- CVE-2026-73064:
    A random generator fault can compromise TLS data integrity

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-73064
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-random-generator-fault-tls-integrity/

- CVE-2026-25832:
    TLS 1.3 client accepts HelloRetryRequest selecting an
    unadvertised group

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-25832
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-tls13-hrr-unadvertised-group/

- CVE-2026-49300:
    X.509 CA bit forgery via invalid basicConstraints extension

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-49300
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-x509-ca-bit-forgery-invalid-basicconstraints/

It also fixes the following issue, which has no CVE identifier:

- PKCS7 signed data verification accepts weak hash algorithms

For more information, see:
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-pkcs7-weak-hash-algorithms-accepted/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mbedtls/mbedtls.hash | 4 ++--
 package/mbedtls/mbedtls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index f1be074e08..71c5612b48 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,4 +1,4 @@
-# From https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.6:
-sha256  8fb65fae8dcae5840f793c0a334860a411f884cc537ea290ce1c52bb64ca007a  mbedtls-3.6.6.tar.bz2
+# From https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.7:
+sha256  a7e8bcbec0e6f761b4af24f25677626b35f762f68eef79c08677a363212d11f6  mbedtls-3.6.7.tar.bz2
 # Locally calculated
 sha256  9b405ef4c89342f5eae1dd828882f931747f71001cfba7d114801039b52ad09b  LICENSE
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index 9def876808..3545c42ad0 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MBEDTLS_VERSION = 3.6.6
+MBEDTLS_VERSION = 3.6.7
 MBEDTLS_SITE = https://github.com/Mbed-TLS/mbedtls/releases/download/mbedtls-$(MBEDTLS_VERSION)
 MBEDTLS_SOURCE = mbedtls-$(MBEDTLS_VERSION).tar.bz2
 MBEDTLS_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
