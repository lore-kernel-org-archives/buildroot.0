Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 073A8C61DBD
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 07:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A21840565;
	Wed, 26 Aug 2026 07:04:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rtyW8TIpvNeE; Wed, 26 Aug 2026 07:04:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787727886;
	bh=FxweSpB7dR1wtF4FQ6ogwK2jv1epJU2rf75TGMpU8zg=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jyuTdhomS4yBC+72K4y7WVxquXjtOEIiOZ+2LDkzJxkAuisHceZs4U4QMktLfiZlY
	 ZdiQCxzUxalCUAwdsMOXbrpuTq3ubJSH3Ce1Ig9zOhwU16q1mHWV6dt4DieDwmYJ4b
	 cSSQlJnLNsOKKlMP6p8MPGfK9yb7byPDWofRIvSGA1LCgJp6Sd2AmHKbkAsvWOk+sZ
	 wmh7eBjy5rAM2V+O0uQ9NPRylkHLqUmwmB3EON0OPHTi/IjdLIQ1fPiPUZURREjsGL
	 akqXO53mquFoluyRtsKYxWuvmPlfTfGzqr9a5sXBqYeokON0B5jokksBOb/jxdk1JX
	 OwOTLNoP+6GAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 596C640550;
	Wed, 26 Aug 2026 07:04:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A30E105
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 07:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F730605FC
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 07:04:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AOFjLGU5i-vi for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 07:04:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 48A49605F4
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 07:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1787727878; bh=Ci6tOa3sACpH5CI29YhbqC1hcDXWeemxjdxXhTxuZgo=;
 h=Date:From:To:Subject:From;
 b=DHTpb9yRV+U6Tda31nuijGwx9kayzWdP70Nj+mW5hjW19Z8sXSPmJCCeR924KbiG+
 TRgvVJ7axNZS4U0d7wlbYpujuDxG8yBHD3WqwR7vwHYWnNIubMBt4f7RjPHwKJWX/A
 p99ewAyFPEiiPzEINlBgYDaWa0ayV9rB0+FxlVOl/Nnw4A84mHiKxVD3BRxkEm8ZCY
 3KSbwnqUcEg8hDZxemNiHK4eg3/gUFoWWUBnTv080KRLC+s1blforLgBGcLg+4zi2I
 YktaffAERUlKdXbzbLLdBjwkGv9TXBZuT0MVNLBP1fqSWyeY8IHinmrKqdYGQWTVa7
 mebd1AM2ntwZg==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 2034A31E03A0; Wed, 26 Aug 2026 09:04:27 +0200 (CEST)
Date: Wed, 26 Aug 2026 09:04:24 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ao6P-CN55B3TiTi2@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.96+deb13-amd64 x86_64
Subject: [Buildroot] [PATCH 2025.02.x] package/libopenssl: security update
 to 3.5.8
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

OpenSSL 3.5.8 is a security patch release. The most severe CVE fixed
in this release is Moderate.

This release incorporates the following bug fixes and mitigations:

    Fixed QUIC server being able to trigger double free when processing
    INITIAL packet.
    (CVE-2026-18798)

    Fixed heap buffer overflow in CMS key unwrapping.
    (CVE-2026-63072)

    Fixed invalid pointer dereference in CMP server via crafted protectionAlg.
    (CVE-2026-63076)

    Fixed unbounded memory growth in QUIC server incoming channel queue.
    (CVE-2026-14456)

    Fixed RPK server signature algorithm selection being able to dereference
    a missing certificate.
    (CVE-2026-14457)

    Fixed excessive memory use buffering DTLS records for a future epoch.
    (CVE-2026-54874)

    Fixed untrusted Sender DN being used as a format string in CMP response
    validation.
    (CVE-2026-63073)

    Fixed CMP indefinite cache growth of extraCerts.
    (CVE-2026-63074)

    Fixed QUIC ACK-only packet retention being able to cause memory exhaustion.
    (CVE-2026-63075)

    Fixed possibility of AEAD forgeries with empty ciphertext when using
    EVP_Cipher().
    (CVE-2026-75803)

    Fixed checking of authentication tags for empty ciphertexts for AEAD ciphers
    in CCM cipher mode.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 8a7186d669..814b4eb0dc 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openssl/openssl/releases/download/openssl-3.5.7/openssl-3.5.7.tar.gz.sha256
-sha256  a8c0d28a529ca480f9f36cf5792e2cd21984552a3c8e4aa11a24aa31aeac98e8  openssl-3.5.7.tar.gz
+# From https://github.com/openssl/openssl/releases/download/openssl-3.5.8/openssl-3.5.8.tar.gz.sha256
+sha256  a8f84a39918ec6415ce765d9b429d313ba97b8143169c172e734b9514464f5b2  openssl-3.5.8.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index a9e18f96ac..674a85be02 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.5.7
+LIBOPENSSL_VERSION = 3.5.8
 LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
