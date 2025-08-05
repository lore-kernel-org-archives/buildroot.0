Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70013C87FCB
	for <buildroot@archiver.kernel.org>; Tue,  5 Aug 2025 12:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28D3C41C09;
	Tue,  5 Aug 2025 12:50:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LAFMbO3Yjgrf; Tue,  5 Aug 2025 12:50:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DDC341BF6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DDC341BF6;
	Tue,  5 Aug 2025 12:50:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 16B6E12C
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 12:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F07D68221E
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 12:49:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NXaNQ_CAEcjJ for <buildroot@buildroot.org>;
 Tue,  5 Aug 2025 12:49:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5B3F482233
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B3F482233
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B3F482233
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 12:49:57 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1451096486; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 05 Aug 2025 12:49:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1ujH74-00Fg8p-2g;
 Tue, 05 Aug 2025 14:49:54 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue,  5 Aug 2025 14:49:53 +0200
Message-Id: <20250805124954.3736900-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=ELL08VwDNPkbU+nTtgwzBIrwkPTbUoEXi0W64jwdEwJiWmvfmufm0YXoPP+Km9iI8Bp4YQ54DB2zlsuqQlJ2kqnrmP7t7GLWvXWAabG7t+75Eo/02YEcOzph2ilgXlXzkWHDj342IXi7WdQtnGFIgx7RaUOdUOUUt0l2LxSrL8M9ZFOKDaNuX34es83hgXMeVcDxUEGBufBvd711PQzdHPuAkcULREhNhIEosr3mRa7PjXiAP2B4vKmtz555SgDs5oTySjegIApy67m8aeOFptn/krFFFlDSoLdLVyEohSVShKBMADzcy6UOSzH+baZTUAlPvoZXiRhlizL1s15IoQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=veUzrVLHzFS63sdzqmgF2aKGYyHMzFGEJkVUEzQZ+hQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=ELL08VwD
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/gnutls: security bump to version 3.8.10
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

GNUTLS-SA-2025-07-08-1 CVE-2025-32989
Severity Medium; Heap read buffer overflow

When an X.509 certificate contains an SCT (signed certificate timestamp)
extension and its length field is malformed, the library could read the memory
buffer past the boundary. The issue was reported in the issue tracker as
<https://gitlab.com/gnutls/gnutls/-/issues/1695>.

------------------------------------------------------------------------------

GNUTLS-SA-2025-07-08-2 CVE-2025-32988
Severity Low; Memory corruption on error path

When any error occurs during exporting a certificate with an otherName in the
SAN (subject alternative name) extension, the library could potentially double
free the ASN.1 structure. The issue was reported in the issue tracker as
<https://gitlab.com/gnutls/gnutls/-/issues/1694>.

------------------------------------------------------------------------------

GNUTLS-SA-2025-07-08-3 CVE-2025-32990
Severity Low; Heap write buffer overflow

When the certtool program is invoked with a template file with a number of
string pairs for a single keyword, a NULL pointer could be written past the
memory boundary. The issue was reported in the issue tracker as
<https://gitlab.com/gnutls/gnutls/-/issues/1696>.

------------------------------------------------------------------------------

GNUTLS-SA-2025-07-08-4 CVE-2025-6395
Severity Medium; Denial of service

When a TLS 1.3 handshake involves a Hello Retry Request and the second
Client Hello omits the PSK which was present in the first Client Hello,
the GnuTLS server can dereference a NULL pointer. The issue was reported
in the issue tracker as <https://gitlab.com/gnutls/gnutls/-/issues/1718>.

https://lists.gnupg.org/pipermail/gnutls-help/2025-July/004883.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnutls/gnutls.hash | 4 ++--
 package/gnutls/gnutls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index dcfe201f3d..1b2a7ba9b5 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.9.tar.xz.sig
-sha256  69e113d802d1670c4d5ac1b99040b1f2d5c7c05daec5003813c049b5184820ed  gnutls-3.8.9.tar.xz
+# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.10.tar.xz.sig
+sha256  db7fab7cce791e7727ebbef2334301c821d79a550ec55c9ef096b610b03eb6b7  gnutls-3.8.10.tar.xz
 # Locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
 sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING.LESSERv2
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index e71e411cf0..7536189429 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -6,7 +6,7 @@
 
 # When bumping, make sure *all* --without-libfoo-prefix options are in GNUTLS_CONF_OPTS
 GNUTLS_VERSION_MAJOR = 3.8
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).9
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).10
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library)
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
