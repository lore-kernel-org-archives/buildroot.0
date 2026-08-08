Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04317C5AD48
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 15:28:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DFC96077A;
	Sat,  8 Aug 2026 15:28:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jvfk4P5AC7EW; Sat,  8 Aug 2026 15:28:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 816976070F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786202896;
	bh=LAkq8oGdudK/5ZUn4yIg/gq4RzsdWjdv7lycXUeZkdE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=s1riQ5VYp0lNGIww5p7zxNHYIPMknIEMFkmIiwKx1UNFqo9jydS9W+wMzq28t1ZkQ
	 pNDK8jKAP0H2v7DmnUkgEr9rwaq2JLnxS4N2lQFp6KB9MDsJYHk3KgSMyvyIdwfAYV
	 jwhrLme/C/H2XZJEw8qDTqzIIpUBGjiT75AT1xFUb2CF+xh1EiQ5nlgMbm36Lcw/ng
	 EIFoXniH0cUijLEckJMrQbLvEFw5/+vyD9gaLAhcqmbtp/4qXeRhnkCm4C8X8Y6GZJ
	 iCVcbCJ5nn19Ex+/diViJuf5WoxLhPt1WGs+dODyYlgUo1nFuFm/KyGln2WABdjyKv
	 1OeA09G8u9SWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 816976070F;
	Sat,  8 Aug 2026 15:28:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CD3F6282
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 15:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF90680E9B
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 15:28:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VAaVUZYhbxye for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 15:28:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8868F80E86
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8868F80E86
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8868F80E86
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 15:28:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id E71C01A14EC;
 Sat,  8 Aug 2026 15:28:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BDDE46045E;
 Sat,  8 Aug 2026 15:28:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A76E011C4855B; 
 Sat,  8 Aug 2026 17:28:07 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 ARC Maintainers <arc-buildroot@synopsys.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Sat,  8 Aug 2026 17:27:51 +0200
Message-ID: <20260808152753.1278414-5-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260808152753.1278414-1-thomas.petazzoni@bootlin.com>
References: <20260808152753.1278414-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1786202888; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=qUQsqRnnyBRDq3GRD+INd4XLiGgGkC6TAr84+/3DrHc=;
 b=aiIyvAbtfmun6/XkUt73bmRQco6HOgEgssHWhM9ucrnvG3VIWa87cPiPHrsTO487nnTHGZ
 HXzUYF22IkPdMKLeBPrQi+yR69b082cMNW1l00TxyfGKlpdCLsAzha94uncFLKenlqCbcW
 bEVpR4K9j4svffPEBOggAdsHdVjrQK2E3pCSL8OQ85h3YIe+6fruj3wH3kOu5gucQUeq7F
 FrtV4H5OUfTDVoEkONLL4820YREQ34m59xLMg6fwhGIZFf7f5RX3uvSMfllj4OoBINjaun
 Lh53D7vsdYl0h22upR7EX1w1Nqh58xj8NazP9DhaDKzW4aJuePGXr79wVrs37A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=aiIyvAbt
Subject: [Buildroot] [PATCH 5/5] package/gcc: drop ARC-specific
 host-flex/host-bison dependency
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

host-flex/host-bison are needed when building GCC from Git or from a
snapshot, not from release tarballs. The condition for the dependency
was actually incorrect: it was needed for the ARC-specific gcc
version (BR2_GCC_VERSION_ARC) but not for the ARC architecture in
general: building upstream GCC release tarballs for ARC does not
require host-flex/host-bison.

Cc: ARC Maintainers <arc-buildroot@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/gcc.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 9109777bd7..04ba70c52c 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -198,10 +198,6 @@ else
 HOST_GCC_COMMON_CONF_OPTS += --without-isl --without-cloog
 endif
 
-ifeq ($(BR2_arc),y)
-HOST_GCC_COMMON_DEPENDENCIES += host-flex host-bison
-endif
-
 ifeq ($(BR2_SOFT_FLOAT),y)
 # only mips*-*-*, arm*-*-* and sparc*-*-* accept --with-float
 # powerpc seems to be needing it as well
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
