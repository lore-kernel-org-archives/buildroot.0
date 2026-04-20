Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D591F5A8B6
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 20:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 172F661114;
	Mon, 20 Apr 2026 20:20:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jut1jeVoUE0y; Mon, 20 Apr 2026 20:20:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DF9D61115
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776716438;
	bh=oRpirXqXNhYbzNiwB8pR2AOabg1RnyUrxAAna4VaNc8=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=prWmqZnuZwm+uL9IMWhcLVIncNjo7AUsJsgdLosblFJYRV9NzLSs8h+Wx675ro/jK
	 5CFor3BM3roGztPUEBrYBBc8brKpQyjxTv2vJJnPkBPLJapXu+ShQo7pNGlDTW2SzH
	 F/69hS2dt/sNl6e1VBTEjnLQefoM8t28lgKQ1xClonbj8RzsALtCVjwijqaptXJFdl
	 9i+N5r54QCkxg0U6wKK7nFy+sV84uOwvTYGZneFTpDvJzqmuPPI0ox8ETqqRdfgwRV
	 CVVGLbh0NPnF9Q+sqnl001ALLP7nq2oxE81AQnPmMVHffIT4UXGyzD3H9AG+z8EDzz
	 ugOKIQ+4Mk33g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DF9D61115;
	Mon, 20 Apr 2026 20:20:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 23B3624D
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 20:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 158AB40A21
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 20:20:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fuyXfdRatCHy for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 20:20:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D2C40409BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2C40409BC
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D2C40409BC
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 20:20:35 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-488a9033b2cso39632505e9.2
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 13:20:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776716433; x=1777321233;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RrhckuZpSEtaK5iugrHs8u6LUxU5oDUxMYholAL6uUI=;
 b=CU9bSLejgQQg4ePLOsyJ5YamrHyKqDOpxwFt/vv/h5dkP+Z4Rham9H1M5Y4n+K17SZ
 9AtEbQbOYFHc7vFtVeP1uoCZiNY3NySDPGEmBSpVo4pMgzc6Wj1kPI4Pqac4+VcOvJqa
 6dBqgE7OPoe7G+LaE6PAZYex3yynBiGOQLDit8xLKSNsmwIBfBUPz3oKtBFTGnCeg4E1
 B9e51obxal9m7rlA3E8lo4NLwrnPGor2ScmomNXHZZ5EPu/ShfCaKl92RA3gRAu2CBFJ
 4tKc7Mfcf8Jpw2ZAkWTTbnlvNX3pMcUk77xphCwxPhp3gFZh7i1/yKA5S5XQBBa3WNGK
 p8bQ==
X-Gm-Message-State: AOJu0Yz1OL/glGdiYZ4bqyJ4qNx3UKMJ86/BMqI1Zx4o09FgjsmSoCnp
 3wgPnqE87A9YVSaqZaa67Oj3lKUSyV0XFWuV/6T3dh2A+U1zLyvqzB/DEiRXom6vCa/SdMPbwEr
 P/RrA
X-Gm-Gg: AeBDieuxkQ2M4h44gYWFuR/HVGtN6jALWO4CAtl1X0jnnXqPSosgqPY4SIRoWkM2EJZ
 UV5bNRchkA4zMoGsuxEt5Pt5K0NFBPqO0c4tzgdaXfJ0WR62mdoac5vOZ+CJdZfj238JJc4DCf+
 DFYUEbq/3mb9LkWUN3c431tj9sAh9XBiMyWoEXSngc+6tBevobr3hYRwTj+wfMsm1VzL4d7L8Xx
 sBnY4uFyD7f+H7/4qtbY/g45tzs91VIQZgsS5xDynoLV2jWJgWtKKZLbCo09mpeSqXYL8kxg0Ht
 bKsf2artzrxbs9k7jvVceXDvovRv67mT+Q2B6U72BIKWbTgMXjaGFFVKlVj9eqj09JcDN91Vo0U
 oHYCRQPwKQP5mMeUAd4DjHxsZpX7+ANLbm2+aO3kyHjEv13pVRl1tRa5RFH3F0iXJhsB5UyKnTP
 5lsnmrRna8DT4SsGbLQtW7fKrJmP15uhiFWmyKjSNDlAJBC0VOvfgyklLsOWVbCUwFow==
X-Received: by 2002:a05:600c:8b8a:b0:489:149a:f9e7 with SMTP id
 5b1f17b1804b1-489149afa2bmr107736665e9.27.1776716432830; 
 Mon, 20 Apr 2026 13:20:32 -0700 (PDT)
Received: from arch (94.105.119.19.dyn.edpnet.net. [94.105.119.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e3a397sm34561895f8f.23.2026.04.20.13.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 13:20:32 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 20 Apr 2026 22:20:31 +0200
Message-ID: <20260420202031.210609-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776716433; x=1777321233; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RrhckuZpSEtaK5iugrHs8u6LUxU5oDUxMYholAL6uUI=;
 b=iSZ2A79R4mqso/X7cLs91KZtNSORWlrL8PYT1xTmytMClpbWAuocLXQ4DavjuRTXq2
 1yR30dC/ZFWoCQ9QzcT8Bw3g/AEznBmbZRi76U/A8/JlW2OFQyRjv7Z/2Z6M1E4CZJyT
 azaMwyntGd2Vw9G27l/s3vjoSgMv1R0AsitMRP4XknfMekPWr7CkceoHiN85Ye0smjKZ
 0MlXFMmhh31ZQxLhHcjvS77vTiLnMZxWClsu9RT9WhrLL7aHIQwT/yeyKVx3lCCqfWc+
 aN3lzw/UhRigAhxhl3gK+77gI/zoU4D9kPqkqtVkryKAerfdDemH8eMcOlhNNgA1C1Tc
 yLaQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=iSZ2A79R
Subject: [Buildroot] [PATCH] package/mbedtls: security bump to v3.6.6
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

For more information about the release, see:

- https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.6
- https://github.com/Mbed-TLS/mbedtls/compare/mbedtls-3.6.5..mbedtls-3.6.6

Fixes the following vulnerabilities:

- CVE-2025-66442
    In Mbed TLS through 4.0.0, there is a compiler-induced timing side
    channel (in RSA and CBC/ECB decryption) that only occurs with LLVM's
    select-optimize feature. TF-PSA-Crypto through 1.0.0 is also affected.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2025-66442
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-03-compiler-induced-constant-time-violations/

- CVE-2026-25833:
    Mbed TLS 3.5.0 to 3.6.5 fixed in 3.6.6 and 4.1.0 has a buffer overflow
    in the x509_inet_pton_ipv6() function

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-25833
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-03-inet-pton/

- CVE-2026-25834:
    Mbed TLS v3.3.0 up to 3.6.5 and 4.0.0 allows Algorithm Downgrade.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-25834
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-03-sigalg-injection/

- CVE-2026-25835:
    Mbed TLS before 3.6.6 and TF-PSA-Crypto before 1.1.0 misuse seeds in a
    Pseudo-Random Number Generator (PRNG).

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-25835
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-03-rng-cloning/

- CVE-2026-34871:
    An issue was discovered in Mbed TLS before 3.6.6 and 4.x before 4.1.0
    and TF-PSA-Crypto before 1.1.0. There is a Predictable Seed in a
    Pseudo-Random Number Generator (PRNG).

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-34871
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-03-dev-random/

- CVE-2026-34872:
    An issue was discovered in Mbed TLS 3.5.x and 3.6.x through 3.6.5 and
    TF-PSA-Crypto 1.0. There is a lack of contributory behavior in FFDH
    due to improper input validation. Using finite-field Diffie-Hellman,
    the other party can force the shared secret into a small set of values
    (lack of contributory behavior). This is a problem for protocols that
    depend on contributory behavior (which is not the case for TLS). The
    attack can be carried by the peer, or depending on the protocol by an
    active network attacker (person in the middle).

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-34872
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-03-ffdh-peerkey-checks/

- CVE-2026-34873:
    An issue was discovered in Mbed TLS 3.5.0 through 4.0.0. Client
    impersonation can occur while resuming a TLS 1.3 session.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-34873
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-03-client-impersonation-while-resuming-tls13-session/

- CVE-2026-34874:
    An issue was discovered in Mbed TLS through 3.6.5 and 4.x through
    4.0.0. There is a NULL pointer dereference in distinguished name
    parsing that allows an attacker to write to address 0.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-34874
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-03-null-pointer-dereference-x509/

- CVE-2026-34875:
    An issue was discovered in Mbed TLS through 3.6.5 and TF-PSA-Crypto
    1.0.0. A buffer overflow can occur in public key export for FFDH keys.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-34875
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-03-ffdh-buffer-overflow/

- CVE-2026-34876:
    An issue was discovered in Mbed TLS 3.x before 3.6.6. An out-of-bounds
    read vulnerability in mbedtls_ccm_finish() in library/ccm.c allows
    attackers to obtain adjacent CCM context data via invocation of the
    multipart CCM API with an oversized tag_len parameter. This is caused
    by missing validation of the tag_len parameter against the size of the
    internal 16-byte authentication buffer. The issue affects the public
    multipart CCM API in Mbed TLS 3.x, where mbedtls_ccm_finish() can be
    invoked directly by applications. In Mbed TLS 4.x versions prior to
    the fix, the same missing validation exists in the internal
    implementation; however, the function is not exposed as part of the
    public API. Exploitation requires application-level invocation of the
    multipart CCM API.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-34876
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-03-ccm-finish-boundary-check/

- CVE-2026-34877:
    An issue was discovered in Mbed TLS versions from 2.19.0 up to 3.6.5,
    Mbed TLS 4.0.0. Insufficient protection of serialized SSL context or
    session structures allows an attacker who can modify the serialized
    structures to induce memory corruption, leading to arbitrary code
    execution. This is caused by Incorrect Use of Privileged APIs.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-34877
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-03-serialized-data/

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mbedtls/mbedtls.hash | 4 ++--
 package/mbedtls/mbedtls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index b86c66af3e..f1be074e08 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,4 +1,4 @@
-# From https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.5:
-sha256  4a11f1777bb95bf4ad96721cac945a26e04bf19f57d905f241fe77ebeddf46d8  mbedtls-3.6.5.tar.bz2
+# From https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.6:
+sha256  8fb65fae8dcae5840f793c0a334860a411f884cc537ea290ce1c52bb64ca007a  mbedtls-3.6.6.tar.bz2
 # Locally calculated
 sha256  9b405ef4c89342f5eae1dd828882f931747f71001cfba7d114801039b52ad09b  LICENSE
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index c1aa9f0850..e8bb0a71b9 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MBEDTLS_VERSION = 3.6.5
+MBEDTLS_VERSION = 3.6.6
 MBEDTLS_SITE = https://github.com/Mbed-TLS/mbedtls/releases/download/mbedtls-$(MBEDTLS_VERSION)
 MBEDTLS_SOURCE = mbedtls-$(MBEDTLS_VERSION).tar.bz2
 MBEDTLS_CONF_OPTS = \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
