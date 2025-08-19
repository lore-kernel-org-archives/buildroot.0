Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED63CA0EEB
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 20:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 488B240DBB;
	Tue, 19 Aug 2025 20:44:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E36zE16-rO1U; Tue, 19 Aug 2025 20:44:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58C1440D39
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58C1440D39;
	Tue, 19 Aug 2025 20:44:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 65768DE6
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 20:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BC0A40D39
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 20:44:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zm0nxCaDVcyT for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 20:44:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D151940D13
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D151940D13
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D151940D13
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 20:44:48 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 435564613; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 19 Aug 2025 20:44:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1uoTCG-00DEy8-1s;
 Tue, 19 Aug 2025 22:44:44 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 19 Aug 2025 22:44:42 +0200
Message-Id: <20250819204443.3155790-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=AQoZ1393KA+BJFEeDDtJC56jLOXTX5ja7nOIwizz1UqHcc9r5dbGXQSt/lD856VBEvd7ug36bOygwACuiP22GJMm9khuvxVf209c42jiO6UYdeva9UvrYibUgPYAMr3md9985Hrg2F44k4zsJLfLd9zCI4JUwqxkpLJfpjcYWbmcM5Axj+UryKskcAIGxvrPwzlR3Ir9ir78U1O3VE/VXw+GD4IFSOKDUz1eDdHQhbhXFSNXm+Cp38wRmp8Ic2v+ECD6T77LBdL6rAleFa6BF0J7FzuwZKrK8zzRuNPLACzV3vjdaEjvlvGfStNZY4kRtlsEcUXgPdZZxtvxQUf7zA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=eEjQI9qATn7+727zUy5dgizQbEfqkv59oDfAzQ+wEPs=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=AQoZ1393
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/go: security bump to version 1.23.12
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
Cc: Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

go1.23.11 (released 2025-07-08) includes security fixes to the go command,
as well as bug fixes to the compiler, the linker, and the runtime.

go1.23.12 (released 2025-08-06) includes security fixes to the database/sql
and os/exec packages, as well as bug fixes to the runtime.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 14 +++++++-------
 package/go/go.mk   |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 62e0772e2e..dc88e9beab 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  800a7ae1bff179a227b653a2f644517c800443b8b4abf3273af5e1cb7113de59  go1.23.10.src.tar.gz
-sha256  ded3c0a8d6d2a0ea5e7599c49678efa05cda139d31baaaf7d8d536a9e4cc19b2  go1.23.10.linux-386.tar.gz
-sha256  535f9f81802499f2a7dbfa70abb8fda3793725fcc29460f719815f6e10b5fd60  go1.23.10.linux-amd64.tar.gz
-sha256  bfb1f1df7173f44648ee070a39ab0481068632f595305a699d89cd56a33b8081  go1.23.10.linux-arm64.tar.gz
-sha256  b6e00c9a72406d394b9f167e74670e28b72ed559cca8115b21be1cb9d5316cb4  go1.23.10.linux-armv6l.tar.gz
-sha256  8fb94455cfa5e9a5e8af2bfbc7323a6fed2dabaffda1a69dae5dd41b669bbb57  go1.23.10.linux-ppc64le.tar.gz
-sha256  7d0e8651eb54fce5cfe2d4b412ddfa50144ce21907f72192a6549ffe03db4e1f  go1.23.10.linux-s390x.tar.gz
+sha256  e1cce9379a24e895714a412c7ddd157d2614d9edbe83a84449b6e1840b4f1226  go1.23.12.src.tar.gz
+sha256  3b2fd446e26642555d1446a38ccbefb2a30bba3179d3ef132ed64d3c63b0c42a  go1.23.12.linux-386.tar.gz
+sha256  d3847fef834e9db11bf64e3fb34db9c04db14e068eeb064f49af747010454f90  go1.23.12.linux-amd64.tar.gz
+sha256  52ce172f96e21da53b1ae9079808560d49b02ac86cecfa457217597f9bc28ab3  go1.23.12.linux-arm64.tar.gz
+sha256  9704eba01401a3793f54fac162164b9c5d8cc6f3cab5cee72684bb72294d9f41  go1.23.12.linux-armv6l.tar.gz
+sha256  1a7cc5f7baeaf39125dce5d660a39438e7f0e04d13d3498590d240aae976b565  go1.23.12.linux-ppc64le.tar.gz
+sha256  2f43708aa0922d692da0a1fc775475c343907610bec77002de1bbe37601ea338  go1.23.12.linux-s390x.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 744bb0d3ba..69ca746783 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.23.10
+GO_VERSION = 1.23.12
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
