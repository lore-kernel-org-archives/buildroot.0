Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB81ACD4F4A
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 18:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2222360687;
	Mon, 18 May 2026 18:04:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QrSfFaqD7QMS; Mon, 18 May 2026 18:04:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3680B6067F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779127483;
	bh=/O/6vlmIYAuHGjzorxjbBoJotbiiFxZUdUbKeW0v6fI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WLLOqX602+7uD1grWEEOkS2YiC/Migm3yf/vZjIO5axdmlfvvM6insqmzb6abRY4S
	 97u8sHc8oINN5GQecdlbx//pK1+3/4+i2kgdBpPf05o0zeJ4Rnu4ppucwLs7xxk9Pm
	 MpVtq318zkYyjmPe2MYQsB2PBk0qxeJ/p+odKa1rJoeXsD8oVbYcx3I1h6HUXbQvux
	 O0TLNoFf7bho3UfDYre1BMiTKHicLGAb5WbgaE1zTLrbQeX3b3SteQT2SjzDrPM9W6
	 7kLALzYC1bDsW3Hx7MVIErkYhXcBNoyRRz4BqvXVlB7lzl4oS3ZS97p9/ZYvx/LFz/
	 OSF0daBLklR0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3680B6067F;
	Mon, 18 May 2026 18:04:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 88CC8265
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E9E46067F
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:04:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NIC0H2Tjn4kp for <buildroot@buildroot.org>;
 Mon, 18 May 2026 18:04:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C9B266067E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9B266067E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C9B266067E
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:04:39 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b8c8.dip0.t-ipconnect.de [84.161.184.200])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A1308A4C10D8;
 Mon, 18 May 2026 20:04:36 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34430)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wP2KS-000000006q1-25XX;
 Mon, 18 May 2026 18:04:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Mon, 18 May 2026 20:04:36 +0200
Message-ID: <20260518180436.101380-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779127476;
 bh=cQ86Cl25vq6L5bPS/YdxGl8K//w+XEOFV63/OfjcWPM=;
 h=From:To:Cc:Subject:Date:From;
 b=WttehX15inftiDK25xdUN2kkUUcz2K2U1BXaq4jty7VwAWTucgNOF5KTE6xO2zsiR
 5jiovJo6VbizeeOe/ywu248qD6SG/+Sd5C0uyXD1WFNF1rBmDirLPy2Ru12gkVG2rJ
 GXU13BUekqgeOmjNwOUNyrZqMb0x8Iw2aziF2dO9/B/hvsMV0Ph/ssZUxNjPVQeavU
 Wss7ufKmqtS0tJ/QaaT0IJMtRWwFB+P2Of+RS4hKqk/nwzd+Y98sL/dSxJMDHowA4b
 +pIC/AMlBdTkZplydutPdqfnlRIpfLtVJyMHvR4O7vQ1WJp5Bb+tUj2blxD9xqWLIA
 /zQU9uz4jJR8A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=WttehX15
Subject: [Buildroot] [PATCH 1/1] package/gnupg2: security bump version to
 2.5.20
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

https://lists.gnupg.org/pipermail/gnupg-announce/2026q2/000505.html
"This release adds two features to gpgsm and fixes a some minor security
 bugs."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/gnupg2/gnupg2.hash | 4 ++--
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index 2aab6111b4..f69b7c6eac 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  dbe9ce2aca9d553ed4367692575cee15204a95a6  gnupg-2.5.19.tar.bz2
-sha256  722aa8a426dd9b44e0d194b73bfee3a3e617d65674cd4d1d062e6df29f1788c6  gnupg-2.5.19.tar.bz2
+sha1  96371ec0260da5a22edbf8e4d3bf0e54b3ea5b8e  gnupg-2.5.20.tar.bz2
+sha256  6461266e99c308419a379abe6c356d54c214136c4589bd65951091138989ffc6  gnupg-2.5.20.tar.bz2
 # Locally calculated
 sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 499532c551..7756023798 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.5.19
+GNUPG2_VERSION = 2.5.20
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
