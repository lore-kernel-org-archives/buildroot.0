Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06924C43458
	for <buildroot@archiver.kernel.org>; Sun, 12 Jul 2026 14:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AECB581286;
	Sun, 12 Jul 2026 14:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sA_t8vNvmJa8; Sun, 12 Jul 2026 14:47:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E7488126E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783867633;
	bh=CN5UVatjEdp2leTF1vnzgk2GGPz6MmvZaOQgc3zZlFw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kWJaNwnCvHHYWaeFSw+YKKr6gnweYdSd401NdV1fw6a+YOWUMdpASDl2exuhT3p+r
	 H0Bluur3uIKhiQ+VRGQeR7IgA3lm0GTuBxpgnb9l6O2hRbctPDLoBqKs5XX8nTQTfy
	 DWILHt1Exfy1l/t47yuuKrCUR3+jO4XnOi17mqJTKBcx4dWEjL5201IUlu49EcDV4S
	 /n0/P88Fke5VUAUg2a6HJoGCTEWeJyUkLyhlMSctoOlr+8Jz/RkO0Ql6O4RBwSHwjk
	 X7EcUxHaeQcjbJuTDEJP/GgSDAzybCENJmn7SR3wpMWQudPFLSDmSAjF36G5YrWJZS
	 XeqlbS8+oAhCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E7488126E;
	Sun, 12 Jul 2026 14:47:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DE3E22F
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 14:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63B414019E
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 14:47:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Iax05ObYCnx for <buildroot@buildroot.org>;
 Sun, 12 Jul 2026 14:47:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 99DAB40108
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99DAB40108
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 99DAB40108
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 14:47:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 6D35B19F5C2;
 Sun, 12 Jul 2026 16:47:06 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Jul 2026 16:47:06 +0200
MIME-Version: 1.0
Date: Sun, 12 Jul 2026 16:47:06 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com, Lothar
 Felten <lothar.felten@gmail.com>
In-Reply-To: <20260711044505.69824-1-dario.binacchi@amarulasolutions.com>
References: <20260711044505.69824-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <c1533a71ff39d16f3fe57a8143adb4b0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783867629;
 bh=XQ7wZwUw3WX3WPJ7SG+pYdBlWbS0QA9ls9HgmMwDMTA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=V3oA8Z8ssIQ6MtxXDwgMP+RD+lpbM0x37vk1QuShbGmiGNRkz138l55HSCWQpZ4bv
 9poXMgy67wWSFOuPWUXxua9SZSQa+tX+q3kPqYXAVVXrQP810m8xwFKoCB5ORqSeex
 nnY1jqlvExNZ7dfMnrGv4y7WebcldL6xP+iGFa5kFVQ9Q6VnQL2wIx+sFL6kzOBjOa
 zapM88RVektV4WOzaUHrOpYjxZm0Ro6/H2vvsRompFcAQXTuFPDRmc6TsjMfexLkGz
 1dYWxhWFgn76ClpXS9PP6cUXYy/lbRZlrdZw0LNx5o+FW6DRilDSj/HP6yi4tcouo0
 A5L25LtyOq/Aw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=V3oA8Z8s
Subject: Re: [Buildroot] [PATCH 1/1] configs/beaglebone: bump Linux to
 6.18.38 and U-Boot to 2026.07
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 11/07/2026 06:45, Dario Binacchi wrote:
> The patch bumps the Linux kernel to version 6.18.38 and U-Boot to
> version 2026.07.
> 
> Tested on beaglebone black.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
