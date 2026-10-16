Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EADACC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1757E60B21;
	Fri, 16 Oct 2026 13:08:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sazN0oTLhGDV; Fri, 16 Oct 2026 13:08:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5B1F560B6C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156135;
	b=Q8OuhKIWMv1FKT4hQ3Fv2vIt31PSmDpzQYYgUlhahpcRF3jzLbrgridom1UQL6x9OVty
	 2SiYMt/FUoeaH2H3QzvweXohVJViYoPNXfa8NKj3xAc338gKlx74DuYnvi7jXJvFeh5qW
	 3cgKYjUTnnl77CsE1bpSfTWQ+FQ7YvUy0wTcMJyF3OJd+0fDxQ3NWJsDNqo9Tu9Q9WcNb
	 ALQVnlsyrZn3ygnfN2POt5G3Rmoe8L8Vb3aKYXuSNyNhDh0fvllEqD9+kaR5TXRasUdwc
	 3dSj5oA8Svsn0brvA7qTjZlUAnlSGTzBfwy0Uu4GgR2xqEBQZ0cYM/+alnXJlx2p6vQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156135;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=ydm123mGL8fwAKZrVR0TWH7rgYODtU/Y50sJYco2ssE=;
	b=Z+nw39OhT9vo7otDL9zoIMqP+1JPz/bxWpXdOW24Zbss52qxdAusAOGGIv2JAjdgqmqP
	 fphXoYAAoHET8YcuWuYzRGf37lcGZLGLq0jTAwrrrUhDxAJ4K/gDdvs0RKtUdC2JPmimR
	 yCTM6NB3EnvFY6NoxhcSfPBlgiht1VhndvdKkGImbX7SLnOPQ4KR7ekPV8RwyV3UQpAD4
	 iCK0lP7vkIwR6z2hlXF4ORhuxQMFQbIyyYYREfhRogR2WEOU2D7Iv9rcBmgpusYuKwfNZ
	 of6ItCxE+X4piKa7GCtpjOd9gDkKaZtXZJhDfG9uyyW1nEemnN8tEr/Oq6CEMzxq39w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156135;
	bh=ydm123mGL8fwAKZrVR0TWH7rgYODtU/Y50sJYco2ssE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CUcJj9Ccg7RYe7sKSf+wTObYbzO8Htdn5QA+o57B1R378Mo6xhGv5SMopng+hwup5
	 IeYhU+fTCze79gDOOvQENzfx8JdxuswbD235dlqZt9W7PON3Iyx+yNm2gYErR60t5F
	 8UbB1al65LB95AgMJaykDW/XnKWhCYXrWWzIic3DpsS6VUjbx0GMyII/Vsi13R28fi
	 3NrR8OfxhrB7ofpfQ5oDjydVmpbD/q2SuHBr9ftJyvywvStjq5W0SuHQ9+/O2Rlktf
	 lrUxb4fXShAN+buytX39H+eCFYGmOPTtWpcaRFgL6bxRTRQ/1lhqLO6+PA7ilhHqzS
	 JZTt/YIUXOL6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B1F560B6C;
	Fri, 16 Oct 2026 13:08:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EBEFF45
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E7B3814FE
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yayXcz6L_PvT for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C9B6C81489
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156106;
 b=Z6MBaYI92K+CZwdaMx9x8ZgTUab+45nY2Asw9bQcP5HAMr2243UC1QkzCwSEpGS1pmmL
 8OiIpaoRKUEurNIQr9BCTfO0eW1zALNzfoginoYERO4T7XLa8hQCAh6vQT+CpqYEAk1B7
 7bEACzIrFpC1RQMh6LdeXPLiu1mIVZKBjgFWMfIznHQVjt5e+KklTD82/4E0+5+t+zQt+
 xU1RkqUOiuI5bNCrNeZvbHghaI8pE80Rg18P+qnqjNm9ExKjLEv862pHolNBWNUUQDvIh
 JPSvjDJE03BeYH/8YrffStWfSYzwkEMsBlpBdzlhm5bJc3WzaJzbverGffckt7YH2iw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156106;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=H7KY0+jjMIuzr3NDeZUxQcFsRTBCQMwfdNJRmDWr/oM=;
 b=aaw7y5kgdLcx4pKlvESEY1a/RCgjztPTDhMNfMhPTUpyKKxxcBeOHIu0FHjRGajPRNym
 4+oY/TX7Z/QVLS23Pdxp8x3nuBT5vA1kY6n/ysl5G1tyYFp3n9gwj1y4ZvX2sSI89qAHj
 iWYex/V8WJMmUKByAkWZld3GVAVo80RflHi4fB6z/K4qfs1AqgJap/cviZz/PMCbhI5jE
 bjAqvPs8CkXXjEpLXUT/YpGLHCaktDMCeVgrAXOubFMwe9NgZ1gKqdVGhg5Nf+SNiOjnF
 dHMYUdp+OYSasHikGxwShYMwIC0HWhZm55RXh/rEqoZ5mLSg7Ao8RP7ycZVPXy5LR9Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9B6C81489
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B8286960DA; Fri, 16 Oct 2026 13:07:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 7acb39ec283fe02393ca469c6e8c53f442a7ad91
X-Git-Newrev: 7d2d6f17772479a4508ac2113696d0d83672fa2d
X-Patchwork-Hint: ignore
Message-Id: <20261016130705.B8286960DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/mbedtls: security
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4835153790886487509=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4835153790886487509==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7d2d6f17772479a4508ac2113696d0d83672fa2d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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

--===============4835153790886487509==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4835153790886487509==--
