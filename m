Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A38EE6B60
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 21:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC09F611C3;
	Fri,  6 Feb 2026 21:00:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 431uQVRDWvA9; Fri,  6 Feb 2026 21:00:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0130661097
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770411612;
	bh=pI5+FvtD+yx1q0lLCkiYxrXx3+RDA9LwRvg97nbLSmY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dDRhZqTQDBUscff52FQNlBwdD/8jOJk/+3Vc0D2PxsqHxJ291pk36fklEITU/7k6H
	 TTE4EkeQdcMLTD5h90M+0FbdBMu8pDNdQiSKjKY0ZkNX1GiHQvwE7U84yXKOlbbKVE
	 FsVjuTFEbbfV6WbFUDNWIDWNOurm/QDDISMO/1lqDCnfMHqCXB8O5HK8qd8pW54qc4
	 uvMJ9XOdba7Yf5bKeUznqqUP+nrkeiZINpQcY0MzhDEklI1+7femBgcEYebuiFQ5P5
	 6QcUobkyxHBZ+B+g8Iyz4oSAGlxAd0OcUUjdwtkRd9t8OgW+GejvTLcExqxxOApRm2
	 5fXetAiEi7Egg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0130661097;
	Fri,  6 Feb 2026 21:00:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F287B2C5
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 21:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E405C61097
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 21:00:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AeqCAiLqJEM9 for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 21:00:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5229060ECB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5229060ECB
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5229060ECB
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 21:00:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 63CF613F879;
 Fri,  6 Feb 2026 22:00:05 +0100 (CET)
Received: from 77.109.103.251.adsl.dyn.edpnet.net ([77.109.103.251:62490])
 via 77.109.103.251.adsl.dyn.edpnet.net ([77.109.103.251])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 06 Feb 2026 22:00:05 +0100
MIME-Version: 1.0
Date: Fri, 06 Feb 2026 22:00:05 +0100
To: Pierre-Yves Kerbrat <pyk@foss.peewhy.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260206193203.1985834-1-pyk@foss.peewhy.fr>
References: <20260206193203.1985834-1-pyk@foss.peewhy.fr>
User-Agent: Webmail Free/1.6.12
Message-ID: <fb90ef6417f7b29e1fcd455fa5f860fa@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770411606;
 bh=SzctlPS0PCB2a43Q724H6x1SstDNCGZo8zXdRtCzsNk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ua/0aVHVmGOCjLeaBf6GLOTLQIrV82dNQ4azPFObS12D3NZpaX4s+85V7SdaxA2nx
 gmG/Y24iQpFEn98gntrxNLMO+/wfp1tivWXxbIp9UEWcOny6nUOJEAZPnzRe0RIM/T
 IbTMXlg5yjHhG1SVhhChwQNGRp9mI1cELlYsOB8somDoVlEq2vpwxH1OxpDI58E1wB
 msC39KJNebVO+1mCHRCwTgMLpm3BbqTe13UrEpucRc7Z/fBNBQy+VxMgqRSdIjOur6
 UfWVvWdwEg3GOxzQgwO1Y8dBHnvf4/ytBtftvnfc68OCC4oHEsE7Ll66CRYpxtLIYr
 hE8xaRqLwxUAQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ua/0aVHV
Subject: Re: [Buildroot] [PATCH] package/nvme: bump package to version 2.16
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

Hi Pierre-Yves,

Thanks for the patch.

On 06/02/2026 20:32, Pierre-Yves Kerbrat via buildroot wrote:
> Changelog:
> https://github.com/linux-nvme/nvme-cli/releases/tag/v2.16
> 
> Signed-off-by: Pierre-Yves Kerbrat <pyk@foss.peewhy.fr>
> ---
[...]
> diff --git a/package/nvme/nvme.mk b/package/nvme/nvme.mk
> index 9f2b086d2a07..afb7d2711204 100644
> --- a/package/nvme/nvme.mk
> +++ b/package/nvme/nvme.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -NVME_VERSION = 2.15
> +NVME_VERSION = 2.16

This new 2.16 version is introducing new build failures. See:
https://gitlab.com/jolivain/buildroot/-/pipelines/2311122007

For reference, the previous version 2.15 is working fine. See:
https://gitlab.com/jolivain/buildroot/-/pipelines/2311144393

>  NVME_SITE = $(call github,linux-nvme,nvme-cli,v$(NVME_VERSION))
>  NVME_LICENSE = GPL-2.0+
>  NVME_LICENSE_FILES = LICENSE
> --
> 2.51.0

Could you have a look, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
