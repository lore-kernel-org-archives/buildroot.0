Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF86C61DB9
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 19:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5640680F5C;
	Fri, 28 Aug 2026 19:41:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T00bXZdrTVRC; Fri, 28 Aug 2026 19:41:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787946066;
	bh=PLaimhSFWxvcUwgAUzCpJ9teYOVrCYvbhfcvfvGt/hM=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=IhCLa9NK9AQ8jtywCPOmRBIv6D8Znq+d8spQFH6ksLgqca57zQrkfPLA/qqYjMbxh
	 NvL4KPCL5r9qMwqXSGFFX8oyL3gtx8kayB0BUdUHQF/dFoYgTI0xuTBWXHJEd/CgY9
	 vCFYvP+z0ihhvdvTFgdmtkVW7kaTmm1PrGNQgXjB35zqDzU8v5T/szLg10z983Nl6j
	 u1yZ7GnIVdmDAm5gV7+F/42LainiGAP1J2ZyhEg5dZA/VBuXet7K+ypKwYjIWv0CxZ
	 b1TQvie+i1C25NvggY5M0idIKz/yb21htjsHxb4Uzjt456QTVv+B1g3pypM+3QsB0C
	 jlN/7ocX6/u7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1F7A80EE6;
	Fri, 28 Aug 2026 19:41:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0718323E
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 19:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F269E40081
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 19:41:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nMOi0I_gWKJj for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 19:41:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E1E1340063
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 19:41:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 4D3B51A18B3;
 Fri, 28 Aug 2026 19:41:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1B13860537;
 Fri, 28 Aug 2026 19:41:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 308FE11C780D1; 
 Fri, 28 Aug 2026 21:41:00 +0200 (CEST)
To: Buildroot List <buildroot@buildroot.org>
Cc: Andreas Ziegler <br025@umbiko.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Aug 2026 21:40:55 +0200
Message-ID: <20260828194058.2405217-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH v3 0/2] libnfs fix and bump
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

Hello,

This is a small v3 that builds on top of what Andreas Ziegler
proposed.

Changes v2 -> v3:

- Properly add my own changes that I had forgotten to integrate in the
  libnfs bump commit

Changes v1 -> v2:

- split the fix into a separate commit that can be backported to
  2026.05.x

- bump to 7.0.1 instead of 7.0.0

Best regards,

Thomas Petazzoni

Andreas Ziegler (1):
  package/libnfs: bump version to 7.0.1

Thomas Petazzoni (1):
  package/libnfs: fix gnutls support

 ...t-and-use-const-qualifier-from-point.patch |  37 ------
 ...t-qualifier-from-pointer-target-type.patch | 117 ------------------
 ...void-cast-to-allow-compile-for-arm32.patch |  68 ----------
 package/libnfs/libnfs.hash                    |   2 +-
 package/libnfs/libnfs.mk                      |   2 +-
 5 files changed, 2 insertions(+), 224 deletions(-)
 delete mode 100644 package/libnfs/0001-Do-not-edit-const-and-use-const-qualifier-from-point.patch
 delete mode 100644 package/libnfs/0002-use-const-qualifier-from-pointer-target-type.patch
 delete mode 100644 package/libnfs/0003-socket-use-void-cast-to-allow-compile-for-arm32.patch

-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
