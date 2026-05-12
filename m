Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26844CD4851
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 14:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDAA340F86;
	Tue, 12 May 2026 14:53:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Agm2d9QvWBvQ; Tue, 12 May 2026 14:53:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F3EF40F6E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778597607;
	bh=eYJf9e9y4TTaZuv3i6cMTd0k/2GsTQdl5vSpSLRGImo=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oDlFg2BtDWI4nPlrJd2qrrHw3q2Nf67HbRsTFo0GDZXqPKN4SDhcnCLZh+LtEthGy
	 LdMHgDTxPs9i8ycoh1mgXADQOVqXtQe9rGg7tCnEnrWhyyAdDUYErKGw1A7Oau4pT1
	 +dwGknk9TfI8YYb55vyB9qXrPyHqeZM73LzUgSWfiizi6Ze9vVQdVHM65TuxA7hGep
	 fBS6QpQG24hWLGs7UJbpIbCegYERRH1k+t6AE4Xzeks/g+uvsdQzN5bzvlzge5XVNf
	 rv+lKxyZ1DRU5VxcUXVr12gFBYCWE0h0KZkpa64xbjl7NtoxvnMiLVdndbpvBbm3dD
	 5rqY5B9lO0HEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F3EF40F6E;
	Tue, 12 May 2026 14:53:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A3E5F398
 for <buildroot@buildroot.org>; Tue, 12 May 2026 14:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95DD840F6E
 for <buildroot@buildroot.org>; Tue, 12 May 2026 14:53:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id peswCNUI-Ofh for <buildroot@buildroot.org>;
 Tue, 12 May 2026 14:53:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7F7CA40C21
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F7CA40C21
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7F7CA40C21
 for <buildroot@buildroot.org>; Tue, 12 May 2026 14:53:25 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b10b.dip0.t-ipconnect.de [84.161.177.11])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1321FA4C09B3;
 Tue, 12 May 2026 16:52:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45106)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wMoSj-000000004ON-1nHd;
 Tue, 12 May 2026 14:51:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Antoine Tenart <atenart@kernel.org>,
 Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 12 May 2026 16:51:54 +0200
Message-ID: <20260512145156.320992-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260512145156.320992-1-bernd@kuhls.net>
References: <20260512145156.320992-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778597522;
 bh=BU2LGiYt4JPnMnCYaxsAdmvDFCfZHxrn4yfhsglg0FY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=G+NI6w+QVclgNx3Legkjo0Gus8L8qEAnfnd+kD5qdYpYUM7qeEGTpxFvTtOALBH8X
 +YGm1sJ2XOTn8uu1uOjE8tMoFcJ7weVcVw470sgGpwKp14BYb+Z/49rLjrdAvBzza/
 wvtUFsrcXL2+f5//9cbVzA6swKrXMD6Pg78hRGZpPF/Dim51pIWOp1Kg0DX4B32sN7
 T6pYzvGFhkMw2riXONDwgpnkHD0HebduNx/qiZR1/dNpRrBd9fnkhnfLLCpGiQoZlA
 DXmBA1awAlF8WJCZgyTo6LYtahafyEdG/fK9ghPhF8obrxkOMlpRPHvjixu+IQcq14
 iHRmD3SQsXIYg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=G+NI6w+Q
Subject: [Buildroot] [PATCH/next 6/8] package/restorecond: bump version to
 3.10
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

https://github.com/SELinuxProject/selinux/releases/tag/3.10

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/restorecond/restorecond.hash | 2 +-
 package/restorecond/restorecond.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/restorecond/restorecond.hash b/package/restorecond/restorecond.hash
index dcfbd54617..19c1c36473 100644
--- a/package/restorecond/restorecond.hash
+++ b/package/restorecond/restorecond.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  d57b6ffe7eafd01af58e5efa50f8522eca73c0b3cb2955ca3f33397ba074a1a7  restorecond-3.9.tar.gz
+sha256  a1ae64084d4a9dd550669301cc456873879f49fe77f71ee2fca9f9d3a16646a0  restorecond-3.10.tar.gz
 
 # Hash for license file
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/restorecond/restorecond.mk b/package/restorecond/restorecond.mk
index e8f432c88d..c0234aadab 100644
--- a/package/restorecond/restorecond.mk
+++ b/package/restorecond/restorecond.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RESTORECOND_VERSION = 3.9
+RESTORECOND_VERSION = 3.10
 RESTORECOND_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(RESTORECOND_VERSION)
 RESTORECOND_LICENSE = GPL-2.0
 RESTORECOND_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
