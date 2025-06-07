Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E37FC61CE7
	for <buildroot@archiver.kernel.org>; Sat,  7 Jun 2025 12:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4881860E53;
	Sat,  7 Jun 2025 12:20:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FT137h1niAnV; Sat,  7 Jun 2025 12:20:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79CB760E3F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79CB760E3F;
	Sat,  7 Jun 2025 12:20:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D9621F2
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 12:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82B5E60E2E
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 12:20:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yilj5CGdZ7GA for <buildroot@buildroot.org>;
 Sat,  7 Jun 2025 12:20:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 52D9360E3A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52D9360E3A
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 52D9360E3A
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 12:20:05 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1403207441; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 07 Jun 2025 12:19:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1uNsWj-0097uW-0w;
 Sat, 07 Jun 2025 14:19:57 +0200
To: buildroot@buildroot.org
Date: Sat,  7 Jun 2025 14:19:47 +0200
Message-Id: <20250607121948.2175315-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=LKHNAzFCO6H2tcJNeRXsnOd7oU4Y/LmbKdeKiMuxZQv92KZlD1T1zxBV2En27MNcr3/XCa5jY4xocszyBqabXdrgLKyl3qNlarKi1puqSvzeQQtS5paCdRObdaTuKUjbOglDeOeBkPSqA3YVJpw9GcdxEG953cbH8q+8ViC2Dj5dyAwBUlMKO9hiCiGvczVBgaJ9DrkRAYkP3nOhcSb0How6r45OpuydDDo3SSgTUDygEdggM6JTdAA7uCpSHwxvylpKmDTiB1QwJo9VZIKXASBtzCCw1Wu1bahFvr/Dy++MfdXi9KPkVRRpCtHIK9TE4vSVHZyZm11yfGKqA8XxlQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=Met9OKxz++74eHa6h3N2FK9JLD/ANbjRpGTguF3GNsM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=LKHNAzFC
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/go: security bump to version 1.23.10
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
From: Peter Korsgaard via buildroot <buildroot@buildroot.org>
Reply-To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

go1.23.9 (released 2025-05-06) includes fixes to the runtime and the linker.

go1.23.10 (released 2025-06-05) includes security fixes to the net/http and
os packages, as well as bug fixes to the linker.

Fixes the following security vulnerabilities:

- CVE-2025-4673: net/http: sensitive headers not cleared on cross-origin
  redirect

  Proxy-Authorization and Proxy-Authenticate headers persisted on
  cross-origin redirects potentially leaking sensitive information

- CVE-2025-0913: os: inconsistent handling of O_CREATE|O_EXCL on Unix and
  Windows

  os.OpenFile(path, os.O_CREATE|O_EXCL) behaved differently on Unix and
  Windows systems when the target path was a dangling symlink.  On Unix
  systems, OpenFile with O_CREATE and O_EXCL flags never follows symlinks.
  On Windows, when the target path was a symlink to a nonexistent location,
  OpenFile would create a file in that location.

- CVE-2025-22874: crypto/x509: usage of ExtKeyUsageAny disables policy validation

  Calling Verify with a VerifyOptions.KeyUsages that contains ExtKeyUsageAny
  unintentionally disabled policy validation.  This only affected
  certificate chains which contain policy graphs, which are rather uncommon.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 14 +++++++-------
 package/go/go.mk   |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 48ba6b7fd9..62e0772e2e 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  0ca1f1e37ea255e3ce283af3f4e628502fb444587da987a5bb96d6c6f15930d4  go1.23.8.src.tar.gz
-sha256  714b9d004063bfa27686f9ff0e5648bb190b3a5bc1e86b0aa16c134d8d8c315f  go1.23.8.linux-386.tar.gz
-sha256  45b87381172a58d62c977f27c4683c8681ef36580abecd14fd124d24ca306d3f  go1.23.8.linux-amd64.tar.gz
-sha256  9d6d938422724a954832d6f806d397cf85ccfde8c581c201673e50e634fdc992  go1.23.8.linux-arm64.tar.gz
-sha256  d14e0bea9fb25344a0460f395880d5589bbcd413ffd5555be48e46c0de084437  go1.23.8.linux-armv6l.tar.gz
-sha256  0cadab469e612b159f5f68b1a30d75aa7b7e1ed5292746005a6a3c8ff04e6f35  go1.23.8.linux-ppc64le.tar.gz
-sha256  cbe954ee534eb02aa782639716d8c25706dd171445f7c8336bd2fc0b8f6fe38e  go1.23.8.linux-s390x.tar.gz
+sha256  800a7ae1bff179a227b653a2f644517c800443b8b4abf3273af5e1cb7113de59  go1.23.10.src.tar.gz
+sha256  ded3c0a8d6d2a0ea5e7599c49678efa05cda139d31baaaf7d8d536a9e4cc19b2  go1.23.10.linux-386.tar.gz
+sha256  535f9f81802499f2a7dbfa70abb8fda3793725fcc29460f719815f6e10b5fd60  go1.23.10.linux-amd64.tar.gz
+sha256  bfb1f1df7173f44648ee070a39ab0481068632f595305a699d89cd56a33b8081  go1.23.10.linux-arm64.tar.gz
+sha256  b6e00c9a72406d394b9f167e74670e28b72ed559cca8115b21be1cb9d5316cb4  go1.23.10.linux-armv6l.tar.gz
+sha256  8fb94455cfa5e9a5e8af2bfbc7323a6fed2dabaffda1a69dae5dd41b669bbb57  go1.23.10.linux-ppc64le.tar.gz
+sha256  7d0e8651eb54fce5cfe2d4b412ddfa50144ce21907f72192a6549ffe03db4e1f  go1.23.10.linux-s390x.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index d618a7a262..744bb0d3ba 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.23.8
+GO_VERSION = 1.23.10
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
