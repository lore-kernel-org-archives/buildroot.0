Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED266C43458
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 13:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B5F040733;
	Tue, 14 Jul 2026 13:51:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BIWIpifqMU4x; Tue, 14 Jul 2026 13:51:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB10740713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784037078;
	bh=1DR969Pv04yJZy1MpSbgwu6Av/OiDsz4vmmDIFp8l6w=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IasLGkL3BQnM81jsuQLS1VHz6dNz8uoeuAyyMfu4Z9+YT74ZFxWPAACxSDw5ONzPL
	 UEqC+MjDcxvr3C8zc8Z2ppickfdleavBoPWC/gQwsBgo2pNr56ARcAt1DxmKUY62EM
	 2sUV82EUqy5wRsl26fxbKDy3Ip0EjarawDo1Vfikkeyk/N7/qXfFpL/ZrHxDuys706
	 JznCbCpqaT5Nq9CafN8rfoF6fG5inEiZN27mnwDymF8nEs1MHGHbkDweLZyAwm9cV9
	 ztOx2oDbNfxaSjrQf3mvZn6phtiJZP6PXhkPtX1rDJbQp/gjHqBkzDpOGmy444ZnZc
	 cN9k9GUMjsFKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB10740713;
	Tue, 14 Jul 2026 13:51:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B6D529CF
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 13:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F5CD811BD
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 13:51:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zNFu2SrGsXeO for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 13:51:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BE6BE81155
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE6BE81155
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE6BE81155
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 13:51:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 7CCEC19F5B2;
 Tue, 14 Jul 2026 15:51:11 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Jul 2026 15:51:11 +0200
MIME-Version: 1.0
Date: Tue, 14 Jul 2026 15:51:11 +0200
To: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20260409152520.5894-1-flaviu.nistor@gmail.com>
References: <20260409152520.5894-1-flaviu.nistor@gmail.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <7376de4344196ca92c2326ee21beb770@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784037073;
 bh=AhSmjW/lhl1GMJ6SMk5f8l/t7I7C4NF+LGuol5V/0Ko=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EO5btToVi/MsAmP62a3uVcLYbqazlnVkXhxzvED81Nu0I3jDo2bQLf6g+oK6Yvhvi
 NxzdeE+5bep6aH0qDv0RLDgcfOQ7wNI15Nwvry7J+FvA5KRCOCdc54rdnHl1/Lbxrb
 UdtDbge4JYLep4+tiCVSDphxdl3uST+8R27mzEkis0AMFwbDe1meZf4MX4ksk/Bss0
 Ecg38sgb4P3hX/mm6s7n/9MCfaQytX5HYwhRPU7AB141aZAxCKS00gmJc9qfd9yF55
 EyIlQzyRF4U6SjbcPuFdW6bmJv8+g9zVw3bK3DH+FoRhEMwrCGeGx2Fe3fRm9rB9wP
 TyAkhPxKOkZ7g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EO5btToV
Subject: Re: [Buildroot] [PATCH 1/1] package/python-snappy: bump version to
 0.7.2
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

Hi Flaviu,

Thanks for the patch. I have a comment, see below.

On 09/04/2026 17:25, Flaviu Nistor wrote:
> Even if there is a 0.7.3 on Pypi, there is no 0.7.3 release
> on the project homepage, hence the bump to 0.7.2.
> Add also PYTHON_SNAPPY_SOURCE for correct package on Pypi.
> 
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
> ---
>  package/python-snappy/python-snappy.hash | 4 ++--
>  package/python-snappy/python-snappy.mk   | 5 +++--
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-snappy/python-snappy.hash 
> b/package/python-snappy/python-snappy.hash
> index c4dbc72077..13cce0e484 100644
> --- a/package/python-snappy/python-snappy.hash
> +++ b/package/python-snappy/python-snappy.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/python-snappy/json
> -md5  fc84cfa3526fba06d66f0d0b2e764300  python-snappy-0.6.1.tar.gz
> -sha256  
> b6a107ab06206acc5359d4c5632bd9b22d448702a79b3169b0c62e0fb808bb2a  
> python-snappy-0.6.1.tar.gz
> +md5  04a4e58b0a932403bb285900e67c778d  python-snappy-0.7.2.tar.gz
> +sha256  
> 04bf182f9d9f67b7a846dae2f1df36180ceeee8d3380e4b6799deff5272c4978  
> python-snappy-0.7.2.tar.gz

Running the command "make python-snappy-legal-info" fails with the 
error:

ERROR: No hash found for python_snappy-0.7.2.tar.gz

Could you fix that and send an updated patch, please?

>  # Locally computed sha256 checksums
>  sha256  
> d007cb05f143d99d16d5cd0d1bf291daf037adb36800344e440ec26edb938f9a  
> LICENSE

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
