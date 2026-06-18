Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8231FCD98DE
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 06:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8182B83E13;
	Thu, 18 Jun 2026 06:22:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dFdctFOJu4EN; Thu, 18 Jun 2026 06:22:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A10C83BE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781763723;
	bh=H/VLXJJ/8mUrW0Fm/EmSl8zvesubhHh09Rj1cy55WDE=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PmVIbj4l+xjC3soq/ss8k3fVd63bWHBgE4ICXaxw4T7by6xrWosigN2IqKRb+lDoA
	 r2Pc37Wx/91DSXjf5ILIfgphr+7ghd6R+oRtHoI0DckMWyeaHaT7j09AjQrcitzpC8
	 P/8/dsX1y4IKMlTnV/ZVIdhdRDoC03SU/OtlB8kJrTDyGH59WEOz+z3JOmjgxzRo64
	 5Uu1TjE6MmpFZgpokpF/Z8suqZqW0ot/KLmyaVMSD7Su+VEqYVaCdUu3oTi4T/nDO5
	 scQNYNycBJ5fI+g+FtxKzmO7VbFKp4XEjEpN74veB3YI3QRG2PViUCVrqrqDfq6Uij
	 NyxPze5ldpLKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A10C83BE5;
	Thu, 18 Jun 2026 06:22:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 09FFC1F3
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 06:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFA2D40D78
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 06:22:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zhbHRInB3HWX for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 06:22:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CD67340D76
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD67340D76
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD67340D76
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 06:22:00 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 503DB31E0BA3; Thu, 18 Jun 2026 08:21:58 +0200 (CEST)
Date: Thu, 18 Jun 2026 08:21:58 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ajOOhpts_SyBkW3C@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.90+deb13.1-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1781763718; bh=ZTD8gGMzLZSuSyAb2fD0ya9rBpsjoeHZatJ1QCmWpvQ=;
 h=Date:From:To:Subject:From;
 b=wFjwswRrJ3TmRnJsni65yTTYjmzZ1hMOZyvj1GdJxiilcJqDiT5UG2Tf+MpL1mHnT
 V/eiP2nppYGAzVyKU/NRFccfQ11ZADp4RZVE+AYYvtxILI5OcESMB5UEsaFxYTcfja
 yp6c1LyWcPk0B7k4bsoOpVG6RFjo7eGOz0HtX+yJUwM9Nz4K/wZ/P2+9S9e9sfhShw
 WGYL7T08Fq/uCl3H2CAAodmnR41/ye1A/zbIClsj6t4vWF2Md3jUVcKWSeztjS8A9S
 OBZIlEmMFTYXRo2NfF4ehwLRDXdVOo3W5aAP5fnf9CZQdHkZmcbH5Qjj/eQly3NC3q
 nLm4sXFDIkR1Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
Subject: [Buildroot] [PATCH 2025.02.x] package/openssl: security bump to
 3.5.7
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

See here for changes:
https://github.com/openssl/openssl/releases/tag/openssl-3.5.7

This release incorporates the following bug fixes and mitigations:

    Fixed heap use-after-free in PKCS7_verify().
    (CVE-2026-45447)

    Fixed CMS AuthEnvelopedData processing may accept forged messages.
    (CVE-2026-34182)

    Fixed unbounded memory growth in the QUIC PATH_CHALLENGE handler.
    (CVE-2026-34183)

    Fixed NULL pointer dereference in QUIC server initial packet handling.
    (CVE-2026-42764)

    Fixed AES-OCB IV ignored on EVP_Cipher() path.
    (CVE-2026-45445)

    Fixed possible heap buffer overflow in ASN.1 multibyte string conversion.
    (CVE-2026-7383)

    Fixed out-of-bounds read in CMS password-based decryption.
    (CVE-2026-9076)

    Fixed heap buffer over-read in ASN.1 content parsing.
    (CVE-2026-34180)

    Fixed PKCS#12 files with PBMAC1 are accepted with short HMAC keys.
    (CVE-2026-34181)

    Fixed possible NULL dereference in password-dased CMS decryption.
    (CVE-2026-42766)

    Fixed NULL pointer dereference in CRMF EncryptedValue decryption.
    (CVE-2026-42767)

    Fixed multi-RecipientInfo Bleichenbacher Oracle in CMS_decrypt()
    and PKCS7_decrypt().
    (CVE-2026-42768)

    Fixed trust anchor substitution via cert/issuer typo in CMP
    rootCaKeyUpdate.
    (CVE-2026-42769)

    Fixed FFC-DH peer validation uses attacker-supplied q.
    (CVE-2026-42770)

    Fixed incorrect tag processing for empty messages in AES-GCM-SIV
    and AES-SIV modes.
    (CVE-2026-45446)

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 781701532d..8a7186d669 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openssl/openssl/releases/download/openssl-3.5.6/openssl-3.5.6.tar.gz.sha256
-sha256  deae7c80cba99c4b4f940ecadb3c3338b13cb77418409238e57d7f31f2a3b736  openssl-3.5.6.tar.gz
+# From https://github.com/openssl/openssl/releases/download/openssl-3.5.7/openssl-3.5.7.tar.gz.sha256
+sha256  a8c0d28a529ca480f9f36cf5792e2cd21984552a3c8e4aa11a24aa31aeac98e8  openssl-3.5.7.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 837c3f0346..a9e18f96ac 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.5.6
+LIBOPENSSL_VERSION = 3.5.7
 LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
