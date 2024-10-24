Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFF9D0E3F7
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 19:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5A0860A5F;
	Thu, 24 Oct 2024 19:32:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qckvE9a4i3X2; Thu, 24 Oct 2024 19:32:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2FB1607E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2FB1607E4;
	Thu, 24 Oct 2024 19:32:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CFB15A5A
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 19:32:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E319E4089A
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 19:32:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4VKiwYn43Fq9 for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 19:32:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A75BE40892
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A75BE40892
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A75BE40892
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 19:32:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E937F240003;
 Thu, 24 Oct 2024 19:32:40 +0000 (UTC)
Date: Thu, 24 Oct 2024 21:32:39 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
Message-ID: <20241024213239.6f90356f@windsurf>
In-Reply-To: <Zxo11uCFAYwoDq4p@waldemar-brodkorb.de>
References: <Zxo11uCFAYwoDq4p@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729798361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iFTGR3lKDGMWht+JMM+sAIk+eXEqmfX/NWG+AAE3LUc=;
 b=e9wDRH+kAoeQz+GThM+nMNpUmBo/GNFYpGtWBzJp0a21x09p0omqojTBKtptpNVEOcm8sl
 sa7P6YM/AtaUrIaNtY+Eg29/9g/BoTQRsjG4D9JzDHdMnK3Pe0YzBLxhKkiSRnapJRayB6
 2Ygt9c/ZfcCty67HM6HRkk/ujfNUcOrPrPmL0ox2mqP9hT2L+Do+e317fF3B7YgJH+3heE
 CXxzId7FfKY7iEKp2zoG/fkJQrhpJvU0FdkmFaPsIykC/CuCvU/uwcEBQ6SQ6Jz9im9tMD
 MwmtnPy0YODiDcTx41zkVLM+RnTXQUDupzhAEzBTRQ+ZIZNR0d6c6LrFYgFCfg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=e9wDRH+k
Subject: Re: [Buildroot] [PATCH] package/xfsprogs: update to 6.11.0
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

On Thu, 24 Oct 2024 13:56:06 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Patch 0002 no longer required, upstream fixed the situation.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ...-do-not-try-to-run-the-crc32selftest.patch | 47 -------------------
>  package/xfsprogs/xfsprogs.hash                |  2 +-
>  package/xfsprogs/xfsprogs.mk                  |  2 +-
>  3 files changed, 2 insertions(+), 49 deletions(-)
>  delete mode 100644 package/xfsprogs/0002-libxfs-do-not-try-to-run-the-crc32selftest.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
