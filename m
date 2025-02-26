Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF1AC021B8
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 22:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EE99400CB;
	Wed, 26 Feb 2025 22:16:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kFjs7Te6DBpJ; Wed, 26 Feb 2025 22:16:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9BDD41217
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9BDD41217;
	Wed, 26 Feb 2025 22:16:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BDCC711
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 22:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A6AA81FD4
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 22:16:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3P-PdsxHlWD1 for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 22:16:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B47C780E91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B47C780E91
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B47C780E91
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 22:16:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b302.dip0.t-ipconnect.de [84.161.179.2])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1CF74A4C01B7;
 Wed, 26 Feb 2025 23:16:19 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58748)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tnPhS-000000002nT-10ty;
 Wed, 26 Feb 2025 22:16:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 26 Feb 2025 23:16:18 +0100
Message-Id: <20250226221618.2232895-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1740608179;
 bh=C6spcaNg9lF2BSnyiJYAn7g1cAL3+T4zHA8drkw7fus=;
 h=From:To:Cc:Subject:Date:From;
 b=j7MAVFImeQOeNK6hRiJBUn/r5La5XScLFFcGAm/oB5rBhBIgblfIebl2nL7BRLDnw
 Wtz7oug/R3sTj+r59+IyXg8pgi9KVDHwbNluuEPKNRy9Qj2UrM/+1SllOIPpePjB64
 2kIELzKSYDcTHY9XYCJ7Z4WeCJcLbOr1cKI2QSypDRNlO0kMPi8pXZpOS4fiJrHkkn
 3Uzr5Zr/eksh3qkR9zB99swNROtZj//zGIUmmaNVv6caDVbxFep2KPtVWge61zhuWq
 hJ0TQAsr7vugmdJa7bJg6WjM301j+LXqH1ZyBaAiEiPptZCChOw0wqa5v2xal07jmb
 gpvQWQUyvE8UQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=j7MAVFIm
Subject: [Buildroot] [PATCH 1/1] package/exim: security bump version to
 4.98.1
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

Fixes CVE 2025-26794:
https://lists.exim.org/lurker/message/20250221.121401.a509f6c9.en.html
https://exim.org/static/doc/security/CVE-2025-26794.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/exim/exim.hash | 4 ++--
 package/exim/exim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/exim/exim.hash b/package/exim/exim.hash
index de803bb27b..eba73e267f 100644
--- a/package/exim/exim.hash
+++ b/package/exim/exim.hash
@@ -1,6 +1,6 @@
 # From https://ftp.exim.org/pub/exim/exim4/00-sha256sums.txt
-sha256  0ebc108a779f9293ba4b423c20818f9a3db79b60286d96abc6ba6b85a15852f7  exim-4.98.tar.xz
+sha256  d858b75ad2cc6bf71c9071ba26a55b3ea9add26607bd832df3cb54f82221c2ce  exim-4.98.1.tar.xz
 # From https://ftp.exim.org/pub/exim/exim4/00-sha512sums.txt
-sha512  13dd963dd0899bb4d64bee44c20883e720e469a4d77456b877d6693cfc4419805a045cb561508cdf763dbb37cc84fbdc6177d68acc2183934c3224fbd03caf15  exim-4.98.tar.xz
+sha512  8f80999a41ed40e86ee16eea5cfd765e2f164ea149f40eeb410fd02fcf35c23317dc69540efe336e9e0fae930b1cc6771e0180dd70f1314531cdb139740c744e  exim-4.98.1.tar.xz
 # Locally calculated
 sha256  49240db527b7e55b312a46fc59794fde5dd006422e422257f4f057bfd27b3c8f  LICENCE
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 45708d3941..5135d02574 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.98
+EXIM_VERSION = 4.98.1
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
 EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPL-2.0+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
