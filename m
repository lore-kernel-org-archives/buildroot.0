Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F53D339AE
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 18:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B77F80812;
	Fri,  5 Dec 2025 18:39:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Y9fYRl1Vfgu; Fri,  5 Dec 2025 18:39:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A756F80523
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764959961;
	bh=Mu7vddprzwRr6fhHUbk1Qz3VCoz7p6JGb3QKbdhLXjI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Tar0wL58EAb4nkuNgq+6jQinz+oKqicgaomZgYjvHEj8cbG+34CrKQJTc0hT5Oph1
	 +DIM5rinU2dAwo+ICHweaPgoR4hTy1m1zOOobpMwk80X1C1NBaAn4YtpBaCa7a3Kf/
	 HeNfzjNemaTXKt5bp7DDXHz4b0IpO/FHUcA+UU78NdW3JVwKu6iOcihaDEv1Snujy0
	 SquzSxgKYeOkiruXgqNZT1OMB7GHbPLrRSUrqHhasuSjL1cuUOrxIrjMA9LXrBrLc4
	 bCBG3JDTBg7MQgp+mGS6aa0mpuEduSHCPANlNWH2jqQB0SJJE6hmR1dHfiG4aG6heM
	 b8b8svhFyjF1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A756F80523;
	Fri,  5 Dec 2025 18:39:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CCE6F199
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 18:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B364240176
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 18:39:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Awd6qSGsRcTm for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 18:39:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9695240109
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9695240109
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9695240109
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 18:39:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 38918A4C7909
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 19:39:17 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37682)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vRai4-000000006GS-24iE
 for buildroot@buildroot.org; Fri, 05 Dec 2025 18:39:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  5 Dec 2025 19:39:16 +0100
Message-ID: <20251205183916.1783507-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764959957;
 bh=0dA4tM8adpza/TSIoP1aSzL2O3fv1l8aPXaMo8JDFBk=;
 h=From:To:Subject:Date:From;
 b=tmo6LvUJ8F9NVaLSbHsm84dLagpMvsXWJCNmFv7HMmCaBhOSah2Yovv1QwMrxSeTY
 X30dzEyfrxxIu/E5EzaX7PaoFPQA9TK+1BmCEiX89ZQQTLnLbf/6A7lQmcHm0FMbqr
 DKZFVNHo0mvkCPV02iOFHEE4V1YSE5K9yPQZXe1OtUNO0n86FM/iw8STibHhZp7eyH
 3dF8U4UypGP1enUEbY9DR0T8d2T8SsIojHxO6FFJRxA2OYC5AeJYvQCA5uVGkTIzGA
 AY4PbcP8p5egoUQjhS63MBklejKZMjibdCPsc71eWOsSYuxS95gWEWjfYKC7we4YZO
 X0CWzJIibNv2w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=tmo6LvUJ
Subject: [Buildroot] [PATCH 1/1] package/apache: security bump version to
 2.4.66
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

Changelog:
https://downloads.apache.org/httpd/CHANGES_2.4.66

Fixes CVE-2025-55753, CVE-2025-58098, CVE-2025-59775, CVE-2025-65082 &
CVE-2025-66200.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/apache/apache.hash | 6 +++---
 package/apache/apache.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index 5b0aab0af2..53fb05a5c8 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,5 +1,5 @@
-# From https://archive.apache.org/dist/httpd/httpd-2.4.65.tar.bz2.{sha256,sha512}
-sha256  58b8be97d9940ec17f7656c0c6b9f41b618aac468b894b534148e3296c53b8b3  httpd-2.4.65.tar.bz2
-sha512  202f8bfe2aafcfbcd7315191d466e9c10b9a8c0abafb7864510b6e1abe4cb660aaacc2456aa77d43e48ef7a49e591d0b54170d3daf67abc3e06c3da1c63fdffc  httpd-2.4.65.tar.bz2
+# From https://archive.apache.org/dist/httpd/httpd-2.4.66.tar.bz2.{sha256,sha512}
+sha256  94d7ff2b42acbb828e870ba29e4cbad48e558a79c623ad3596e4116efcfea25a  httpd-2.4.66.tar.bz2
+sha512  49031a3465d956ee3b755e65810b6c35561ddd5fac2c624a273b733c238e115b914cd7b246837e5a3090ccfded6e0b8b3059bfd1f8ce4419081c805a38d05a4b  httpd-2.4.66.tar.bz2
 # Locally computed
 sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 500a45bbca..06f964b083 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.65
+APACHE_VERSION = 2.4.66
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = https://archive.apache.org/dist/httpd
 APACHE_LICENSE = Apache-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
