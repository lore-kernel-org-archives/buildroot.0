Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E19FAC61DB9
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 20:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B7D080C11;
	Tue, 25 Aug 2026 20:28:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eaiz5o0QTDmA; Tue, 25 Aug 2026 20:28:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787689720;
	bh=9gcQqjwhSd2hOpNJiTJ4uvxtXTzvwpy9attIHG8KdTo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eoi8Ljnrraxruga0NiFQjXRoSbDb3xLx3C7PGHL4xPj6x/e3dBES4s9j4c+ASNK8A
	 CRbBL5UE3Jy8ZhBeOnLR2/Bp+QErnVy1DDjDZjbndM2rAHBtXaKEnUXzN/svJbt12e
	 nsLaY3CAFkkloPV4zSDYbb1wLR7kioY9LAfViHtQIYE9xsncaGEbgcMfI2/16/a+Zj
	 Li4KWXNst8xrA/lr+hFgtuqXZKSJeZmSO216YG4EWfhyLaCir/g96KGGDdf4vhYtW5
	 yMPuMHT2xgP69EdEPO69UP3eFZhXA7E/T0YGTBVXZHVHF8dzsZw+OKePMsI6bPMLBo
	 cSRjPg0hu407Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4493980C38;
	Tue, 25 Aug 2026 20:28:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D9C22FD
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 20:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13CCE80C38
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 20:28:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j8TkvAwdmKgC for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 20:28:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=egf6AA3I
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B09E80C11
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 20:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1787689713;
 bh=0vHYoBLN5LnFFfwPbfezzskgYf6pftQxXJqgI/dUG38=;
 h=From:To:Subject:Date:From;
 b=egf6AA3IT1L7+UCJsxgtQJQkVMa4xVn/PeAzW2neiNohqMfbJ+xo+6m0LLCnH95Sr
 ZswCVodw1dekgYU1R/8O736+JBAd310O8kEuS0c9xqocXGoPTLiFVhi4XhYyMIdLqO
 jY2+Wo8iG5PLm6Qpa+xGZ9wXA9Nv1kA2xeKz2T50/5Qr7P+RhnBEJYjnuGekV9DC73
 Q29ljuAwHq5uofylFObtxVp+pk13j0GnrYsw40/FLb/Y55eD4K7Uuc4NRdfJXRWWou
 bMRXLIS7n4BLLMd2bZHGG/bxomZQK9vxCo5KWbuwjtMvnNo4R7jznXBUie4BAxoZfO
 hccUE1v3uawNg==
Received: from fli4l.lan.fli4l (p54a1b0c8.dip0.t-ipconnect.de [84.161.176.200])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8734DA4C2D39
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 22:28:33 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59126)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wyxl3-000000007QJ-1nZP
 for buildroot@buildroot.org; Tue, 25 Aug 2026 20:28:33 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 25 Aug 2026 22:28:33 +0200
Message-ID: <20260825202833.3005742-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 1/1] package/libopenssl: security bump to
 version 3.6.4
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

https://github.com/openssl/openssl/releases/tag/openssl-3.6.4

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

Fixed client-side memory leak in OCSP response checking.
(CVE-2026-54876)

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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/2a5d83eac421f7fd60ba5d82e0997b9e69a8e926

 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index fc1a125521..46ac5589dc 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openssl/openssl/releases/download/openssl-3.6.3/openssl-3.6.3.tar.gz.sha256
-sha256  243a86649cf6f23eeb6a2ff2456e09e5d77dd9018a54d3d96b0c6bdd6ba6c7f1  openssl-3.6.3.tar.gz
+# From https://github.com/openssl/openssl/releases/download/openssl-3.6.4/openssl-3.6.4.tar.gz.sha256
+sha256  9bffaa1ad1e07b354c21bd3324ec02fa15579f45a7d0494b3e74bc449b7333ef  openssl-3.6.4.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index e9f795832a..9ddc85c197 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.6.3
+LIBOPENSSL_VERSION = 3.6.4
 LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
