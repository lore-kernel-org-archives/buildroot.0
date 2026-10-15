Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84968CCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0ECA861174;
	Fri, 16 Oct 2026 13:11:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8enWClXQcG3Q; Fri, 16 Oct 2026 13:11:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8F40E610C4
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156285;
	b=giSue+ZBHVroNNIumTIDIg1VSQmqulZeazXHdenNHs0C5X87F2nHMw6tjPbD9ziH2msm
	 G9IETm0E1bx0MXKM005C2iSRIIT+v3qMgKuAolCmxko3ME0Vy4TF8fBRZOv2jFTdI442p
	 sB+cWcC7aICM9NhgIJ85dyUh/Je1GA1cwsu0I2NAhp7EVzfLEVLUOMNxfm4kP/Lahvlms
	 q//3ZOqWsU/JmYosZlUxwzBvag1q7QOBqloUuM0VYVuYYVGQmb6U4V7uMczZJtoozkC5K
	 Hjcy1aNctBCo9qVVy9VEXjkbAG1jh0s15v8Ke4hqdjS0V2g6ADFIDuQDZaV/eQ30Kag==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156285;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=Q2tkNid6lMgwrQduggWbLOjMqKukYyibxWcvAx13mqU=;
	b=c64tf1g6//ylTuC3ysjvk1BicWiThhVxCoaGeiXPzDC6ObSWlgjjqeha9vX8ie0zs3qf
	 3hx7W0QdaunR5vl/MiX4AQeP9tzf+xMQ0+USf/cCYpKcqOQCHrM7OTsazyFG0GJQp5s6a
	 5e10t5/DXUxymhTYNMVJgQwj6LA2o39LxvCjHDPlh8gGoPRvxH/fIbi6t/2ih3+ZUIqBM
	 8v/SWcQYG5l4tXNuoQgdllhJOFGUfz81BaNSzz/ST1f7D4BPI5ocmWqkxQcbue4Xxh/Cb
	 tMSWSS8TCa+frIf9Tn7BdCJFqmCmtBq9P/e3pN8eJc5ULr4gaWeoXeoz59nSJktVmhg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156285;
	bh=Q2tkNid6lMgwrQduggWbLOjMqKukYyibxWcvAx13mqU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Sx0NPCZdjXrXN8Peh/RaRkpWK2/43CYl2DxMW5hC1zqOztOYaQaNhXjZHWJFVVYoP
	 ZYJ6IDOdiooTSlD92o76FwzSyFgnPdrhL5ul75fM85AmP8VbEFXWhuHBFeub4HzaUV
	 YO263YFputdJ777b8nj1JhRHw2Q39U047mubdG4N54ZPnONJlh0vHzoJ7c1sf/smGL
	 29EkM6T5p7RMs6if0D0Q/HHt2cyh8++kNQypnsE2hWVcHM9Y2DqDUXJsdRR0Lot3NX
	 D5439h/QuWChfWOJdYt7UE4fwv1rRVK2y0G3vihsxjkcgqlBQ4btCReNIH5fD15Ivu
	 2XEJ8a+96UcFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F40E610C4;
	Fri, 16 Oct 2026 13:11:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 88A0B769
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6906240042
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6IV7RHUNcAtA for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D744C4048F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156190;
 b=WEuXrufRLUytrgduFUVa8KLl112EykHjbdE2Qj/8E4e4ps/izFuVuvJhUXNhT8j1m7VS
 JZIZMBWsjX9LRBtyjrUBYROsBGtJvL0FqwUYT9W8re3iYp5dCU9jemR8MokX06HaFAEcu
 YJFGgGGh4ylAWbJo5IB6Ipqdl3Yv+mh8RGSvKyHNBlKlinWbbEf4g3sWC7HtuCVtH4zoc
 PzCANJ2s2pxJQqKsEw+VKbEGiQiCLMdQtXOPGrq+oLRa5oltEFV9mOhM1p7JEySjiVmcS
 FeceBouLhQuaNIOtKiE+iO6W4wWLNcRU+81hmzbmjh+dQ6lRhJu7799jkBVWzx3jCVA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156190;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=rkMDvCvzLaHlF3bjn5SIilRVSHl4NRF0l/sdnELV08Y=;
 b=nbj3j7dMuATE59MnAziXqlwrQyGxJtv4OQDlPNhE9HTvFaAzH81FsozoBukYmYxDrKXw
 V8IahUiSU6xebQGOASyRgIjIxMxok6cUPbsxMcgX0Bc79YijVNvTNV51va1r9Ca/2c5s8
 FTZd1w2L+7KI/9plbs11kMcGPuCb2Acj5PKsIQhgrU4TVjWHYkBzc/ILSGB5t0jX0uwB3
 je6ItIgG9SeMONGVZ4ac//506rmjjO02G3ZZfpWGu0VX4GC4dpUCbHBPQB5rLq1jmidEk
 uCmdaqYr6PrkrrNcYUdZ+3xb2v0xQF6U5b8EVq8J+0ncsxZL626qzkVqqjCkninc98w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D744C4048F
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C70B9960D9; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 13:17:42 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: e2071312ca2d8ff15241af7eefb327abbb408cc4
X-Git-Newrev: 08c78948dd1eafdadc02a96ce97133137f760df1
X-Patchwork-Hint: ignore
Message-Id: <20261016130829.C70B9960D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/mbedtls: security
 bump to v3.6.7
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8393284290274931798=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8393284290274931798==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/08c78948dd1eafdadc02a96ce97133137f760df1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
(cherry picked from commit 45903c02e328712370b25c756050155c5fbdc5fd)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
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

--===============8393284290274931798==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8393284290274931798==--
