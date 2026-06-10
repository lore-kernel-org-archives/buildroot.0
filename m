Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6F9CD8CB2
	for <buildroot@archiver.kernel.org>; Wed, 10 Jun 2026 06:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F27660818;
	Wed, 10 Jun 2026 06:48:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6yydarYBUCWD; Wed, 10 Jun 2026 06:48:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 409D06070D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781074083;
	bh=a2j3gUaK4Xj4yLJDayry3/Z8uCahP02+8LMqPoERI9M=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DEuYC9jbm8S2tiulMVjKwzbNw4ahsfVwRH0LEFYHt+Cl71uZLMHF+De7FQXVTeH2r
	 P34AvDa8JDtMPoQD47meQSlHN4FGBk8+6HQPhhBOx5OLnyuZPzK7OozzKhsV4eq9Eq
	 koKUtXxfJjS8l5OFy/+BV2L12nqoik/BjzTXPJ+Q1jM38Xsb3PxVGSxEc2wt9wWzAQ
	 xBdxXEqJKymp3rwdFCTw/XmkLda7kCPzDaPCxViIXpiKWXoSDUWeJoEUX0EA2/Vxso
	 Jczf5IkzCom/MdbRwH3a5SnBn2VTZGR4bnEBFUG7kE7PKp0gWFQtQcOfgxIIhuVHkE
	 10tnlg7U2U+zQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 409D06070D;
	Wed, 10 Jun 2026 06:48:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D7A7196
 for <buildroot@buildroot.org>; Wed, 10 Jun 2026 06:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F9EF606D3
 for <buildroot@buildroot.org>; Wed, 10 Jun 2026 06:48:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 76jb7nNbp-6d for <buildroot@buildroot.org>;
 Wed, 10 Jun 2026 06:48:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C3A9260818
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3A9260818
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C3A9260818
 for <buildroot@buildroot.org>; Wed, 10 Jun 2026 06:48:00 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1487476332; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 10 Jun 2026 06:47:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1wXCjD-0000000DIoe-3cJu;
 Wed, 10 Jun 2026 08:47:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jun 2026 08:47:53 +0200
Message-ID: <20260610064754.3170578-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=glSSfJ3LfrK2LQYVHSefKcKstl2pR0FFhL0jcnseOfJ7dDc+Yjas6kDy05qIES6tJfKiu1jdF0ZvhlbnVMqCUhVEc43sN570+8Mkmf0ibQuTRRsESOLd0UjFdlCge9z0cXDy+8QyYJyPmVio85WG8oGM16Q/Tnl8lSXodOHAizIsfGOyPJ3MzYJedzAUewo1APOB2HBpvz6KFqZQ9W+h1ZIJY+Ou9ECMqXh7Pn0YZch1HA6urYf2NDWs1BdBE7K8nM9QWyptA3BknOKGTDUe+2xyHbLcVNCUg+3DN9xv+JK4KWR5GIwEOK8TWgG6LHwBCKvJiCl9x8Fvttqjdgt6uw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=v9Jk1JKj1nli85wH5EhavSzqqKpfrofbfbk1xJLgqGs=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=glSSfJ3L
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/libopenssl: security bump to version
 3.6.3
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

Fixes the following security issues:

    Fixed heap use-after-free in PKCS7_verify().
    (CVE-2026-45447)

    Fixed CMS AuthEnvelopedData processing may accept forged messages.
    (CVE-2026-34182)

    Fixed unbounded memory growth in the QUIC PATH_CHALLENGE handler.
    (CVE-2026-34183)

    Fixed double-free when checking OCSP stapled response.
    (CVE-2026-35188)

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

    Fixed NULL dereference in certificate verification with OCSP Checking.
    (CVE-2026-42765)

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

For more details, see the release notes and advisory:

https://github.com/openssl/openssl/releases/tag/openssl-3.6.3
https://openssl-library.org/news/secadv/20260609.txt

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 05777cdac2..fc1a125521 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openssl/openssl/releases/download/openssl-3.6.2/openssl-3.6.2.tar.gz.sha256
-sha256  aaf51a1fe064384f811daeaeb4ec4dce7340ec8bd893027eee676af31e83a04f  openssl-3.6.2.tar.gz
+# From https://github.com/openssl/openssl/releases/download/openssl-3.6.3/openssl-3.6.3.tar.gz.sha256
+sha256  243a86649cf6f23eeb6a2ff2456e09e5d77dd9018a54d3d96b0c6bdd6ba6c7f1  openssl-3.6.3.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index bd4b889c88..e9f795832a 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.6.2
+LIBOPENSSL_VERSION = 3.6.3
 LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
