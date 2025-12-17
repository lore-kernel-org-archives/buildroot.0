Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23AB8D66B85
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 21:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8FAA40C85;
	Wed, 17 Dec 2025 21:01:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wOh6aXqCAIw0; Wed, 17 Dec 2025 21:01:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B07F40AC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766005289;
	bh=lHfskBSQ+j+ViIq8H9v4nrqzmFPZpzRMIcyRylrRdZo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WdgJh+Q1IeGX6AL+ksGU9Y5QQkJY+04PxKBdVuheHBSevB17yCWac9+LImG5eLgrv
	 TC3mlVtlwoeTUBfTNvzDi8emRvU1LlZUH3itLN28mQlLH7CWyzguNe77byILjxy238
	 vznvYNQ1/wsvoD6LxP5BKrxVt+MagxAIT66QLnXQPf/t2Nt/mtDS1Ew25Pqu/DWoP/
	 PAPZlEqlP/rA8sdYybLVQNx67VLB8zVHvPaG5HTsNf+GFgtsJu/TJgrDH6+xlBQuqS
	 2pME63mB3sLY4wUPuLV1Jrrtb0TpesbAp7/tEkZPGHd8TL3SdTbZi0aDNVlj5YJYiQ
	 Zxse2VzeG8i8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B07F40AC2;
	Wed, 17 Dec 2025 21:01:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 682AA35B
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E07861099
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:01:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x_RrN6fSrF4h for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 21:01:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8129960B1A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8129960B1A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8129960B1A
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:01:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 28335B00539;
 Wed, 17 Dec 2025 22:01:21 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 17 Dec 2025 22:01:21 +0100
MIME-Version: 1.0
Date: Wed, 17 Dec 2025 22:01:21 +0100
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20251216153322.653758-1-buildroot@bubu1.eu>
References: <20251216153322.653758-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.12
Message-ID: <c67838d8f34216809e091a3b348b2fe5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766005284;
 bh=xsIw9ZXfaj2uRE7ySJGE2LTvHxjSCoC8baWXov+rSuA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=d3yYxKeR2g/TKpVbQrKXxvF6iGGlhB/NNaEUqf5VIp9B0mF05eVNBiibi5F3QHZFv
 23F2hBFkrCftsnhO7hkUycCs89W/C6N3tQUWjQEW/qzP2J2+rnKkcu8ss15pQC/3p3
 bc1e3rz0/EnTtF4aXSBvvihoTphnRvl4wh1Mg4zmbyw9Mx1bA22BJmY29QdPVUW8Ss
 4p28gjSl6Y1qRvXP/fpO4mBO+LBPo2u7nLLUy2caTZG84QSSSmzzX8JZ/i0/HrfyDB
 yBdMYJSD01MgtpJ6NU79i3BEA2ImdUH4L9FJTtz5Egx2OEIcVo6x04GYiv3R+xW0Sx
 TNpIPL49M3Wpg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=d3yYxKeR
Subject: Re: [Buildroot] [PATCH] package/python-fastapi: bump to 0.124.4
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

On 16/12/2025 16:33, Marcus Hoffmann via buildroot wrote:
> Two more bugfix releases:
> 
> * https://github.com/fastapi/fastapi/releases/tag/0.124.3
> * https://github.com/fastapi/fastapi/releases/tag/0.124.4
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
