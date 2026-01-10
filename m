Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75121D277E8
	for <buildroot@archiver.kernel.org>; Sat, 10 Jan 2026 14:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 449A36084B;
	Sat, 10 Jan 2026 14:07:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UFGxOwieNQ-e; Sat, 10 Jan 2026 14:07:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 291B260793
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768054055;
	bh=msDhFRaGEt50IUU4tPBYiFs7VDPJ/CJbwmK8fIdf3GE=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=F1ZCQ1pTRAgRNC65ftHrFnJKXLYrKl70yhzJYhC8nXiOf3xWTeeqgMLwzyZ6M9Jt8
	 ATwhmMQNBroJ5SKke+nbjsYnOOH5Pm0mF0G6ifFpPpOJR2xEsoXnXAnaG7stB3TM/5
	 rcQsQOEFyqYP55OPEI3KPHe/rIpshZ3X0E38d9kULDrKxlHIHebKZEPf8vV2ngJbtb
	 UuDCrBsE0quTLDH9j3EDSMDFNr31BLWJut21ft7Gb5el+RQvfjx6jGvkUy35zU7fLD
	 XtMd8Q2BT4RPU0VNIk77kwDz+D5PEGYr4kRq+meOSvhDZ4ebCrckhhXqJJjlCmZ/i+
	 ipVGWJ75gxyqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 291B260793;
	Sat, 10 Jan 2026 14:07:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A9D5812E
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 14:07:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90E4140681
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 14:07:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JZ1_NBBRw8Gt for <buildroot@buildroot.org>;
 Sat, 10 Jan 2026 14:07:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2A9CA40613
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A9CA40613
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2A9CA40613
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 14:07:29 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 1143B31E0067; Sat, 10 Jan 2026 15:07:27 +0100 (CET)
Date: Sat, 10 Jan 2026 15:07:27 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aWJdHyFAsJcw6JYP@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.57+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1768054048; bh=ZK3KAioVMRr0NoHTZwUWN9Xz9lH381QXQuIIGqCLh/c=;
 h=Date:From:To:Subject:From;
 b=E4ZLQk95KA/cp48WdsPFESdnimR+LUPejDDY7eajonDVuDgA6sA5lMY1lT+/10dGU
 46fGMIrT5dWCWc0nSX44Ot4tJUFRwgq6vXki4fnu1E0DgiaJw38K3RABO1Lt7ER/JW
 FC+MnrDsJ3VP/lhb8XrZDa2r2v4slKzRJN5X3PP85B02M9HMaEaK+SdVovEqJGxF0q
 /R9cWyFKxZFEgLr6gz4HXmMRpJi6fnxof0OfSFSvkwiphd4ecYsknL+Q3P/2gOihHq
 GehfPrFRiJ01t5b2fWi1AJhpjePRLGZaD8c2bsb1/WYNDgmgCEvxkMf3DhfccTNxSg
 tgH/jLeno9heQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=E4ZLQk95
Subject: [Buildroot] [PATCH] package/uclibc: bump to 1.0.56
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

Changes in this release:

Julian Vetter (1):
      libc: kvx: add {get,set,swap,make}context functions

Waldemar Brodkorb (6):
      Add glibc internal macros for 64 Bit architectures
      fix verbose output with make 4.4.1
      nds32: add missing define for TLS
      NPTL: remove attribute_protected from function
      add gettid syscall wrapper
      bump version for 1.0.56 release

tinyusbboard .matrixstorm (1):
      avoid crashes in statical linked binaries when dlopen()

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/uclibc/uclibc.hash | 4 ++--
 package/uclibc/uclibc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index 56174a33b8..6a96e57069 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,4 +1,4 @@
-# From https://downloads.uclibc-ng.org/releases/1.0.55/uClibc-ng-1.0.55.tar.xz.sha256
-sha256  5f7f3aafddb2ca08fb295be45561c0188407103d7446cfd264b9b822fed3ed2d  uClibc-ng-1.0.55.tar.xz
+# From https://downloads.uclibc-ng.org/releases/1.0.56/uClibc-ng-1.0.56.tar.xz.sha256
+sha256  23c9cab54c113e020fb20b9dc06be4a49560df791b78fcbc2ca899a6e8f213dd  uClibc-ng-1.0.56.tar.xz
 # Locally calculated
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 0c303d77f8..e1cf12fa68 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.55
+UCLIBC_VERSION = 1.0.56
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = https://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPL-2.1+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
