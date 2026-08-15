Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61179C5AD5A
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 14:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DDE340977;
	Sat, 15 Aug 2026 14:48:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n-LK4sBiaVRr; Sat, 15 Aug 2026 14:48:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98E234064D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786805303;
	bh=dtG8a8EyAdagBlwb8YsKkmxILI4Tj0CcRYLX7NZ2YLY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=knkN0XQ1Ql1I32eRUJtxCHYxg8eibacJM9k082v7AmoHZWgZsxZUtbbJyid1mOjN2
	 PtXOdVwPJL57llii6oGFvbxcv1G4I8offDTwizihqg9W2aUDoLuPfFQ8P3Rga4B7JR
	 +nng6sEqEKYjXe2IlCPnmK/rK+IqRAy/JkCWY/blXIBdV+hCyDpuu/+KMilfmq5yr1
	 STFhE8upXfrgd/Zth9kKvDBi3w7/IgwJKPx60DjtfRINbBHLhT3mOiVsMeCEP5np2C
	 bEpYYokeqqoTJcSk8cmM6mxEZABzM2H459Z9M2itBXfGeKzcprkboT35cyYb5WT3A3
	 JGUzjPQXB9w3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98E234064D;
	Sat, 15 Aug 2026 14:48:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B48D9109
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 14:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B29AC4004D
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 14:48:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uKOtUMn0ykr5 for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 14:48:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C8B6F40026
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8B6F40026
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C8B6F40026
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 14:48:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 2D3A819F57B;
 Sat, 15 Aug 2026 16:48:12 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 15 Aug 2026 16:48:12 +0200
MIME-Version: 1.0
Date: Sat, 15 Aug 2026 16:48:12 +0200
To: Quentin Schulz <foss+buildroot@0leil.net>
Cc: buildroot@buildroot.org, Dick Olsson <hi@senzilla.io>, Sergey
 Matyukevich <geomatsi@gmail.com>, Etienne Carriere
 <etienne.carriere@foss.st.com>, Fabrice Fontaine
 <fontaine.fabrice@gmail.com>, Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260625-tf-cpe-update-v1-1-b315a596d23b@cherry.de>
References: <20260625-tf-cpe-update-v1-0-b315a596d23b@cherry.de>
 <20260625-tf-cpe-update-v1-1-b315a596d23b@cherry.de>
User-Agent: Webmail Free/1.6.17
Message-ID: <c1ca71902823729c08c14bbe7c6e4003@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/3] boot/arm-trusted-firmware: fix CPE
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

On 25/06/2026 17:37, Quentin Schulz via buildroot wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> A new (and hopefully definitive) CPE is to be used for TF-A:
> 
> cpe:2.3:o:trustedfirmware:trusted_firmware-a:
> 
> as reported in TF-A directly[1]. NVD correctly reports[2] the new CPE
> deprecates the "old" one Buildroot was using.
> 
> CVEs for projects under the TrustedFirmware umbrella are now seemingly
> handled under the CPE vendor "trustedfirmware".
> 
> [1] 
> https://review.trustedfirmware.org/plugins/gitiles/TF-A/trusted-firmware-a/+/efd7b189fa259c349699957462c7b52bf640e27b%5E%21/
> [2] 
> https://nvd.nist.gov/products/cpe/detail/2E1BD3E8-DF65-42E3-A0BA-747137D6DEF2
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
