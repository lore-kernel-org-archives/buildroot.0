Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF436CD98F6
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 23:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFDED6F8EA;
	Fri, 19 Jun 2026 23:03:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7c-E9opND6G8; Fri, 19 Jun 2026 23:03:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 374B66F8B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781910216;
	bh=38bKIvOH2cxKZQ9Jc1DcphEVmL0/o9QALWC8v1vCDd8=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=cz+PZNUc3sD5r5trMnuNT0nXxog2Ykdp8G3L6xlRULcqhV8bwVxt06Gd2iN5Kb2hu
	 pgCPldbQMI6691hgcJd20xhz7rdzqwTmXO7K5WERt9ZwZhBkKqmIezhxg9cv6FwBO4
	 mz5itaL4+9SeOM2uaxL9YxDjXY0SvkPkBWsy33kjnucSawqkAmVI3jnpdCN7kejFsT
	 eeDV66sbVOUDFPfTqBUN0Uflpx2BQaLvUwbazMfL50pCJUFThtpafuQMT9j38eFWtG
	 JvwuVc0WmRO5Bqef+qG0vNQXEQ/lYFNzeJkqIs9nmAoZqI9LR+fOrkdrbjff7Ubymh
	 JYha6qexizSVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 374B66F8B7;
	Fri, 19 Jun 2026 23:03:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 91896367
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 23:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82DDB4ED24
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 23:03:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Va7ad_Le8vw for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 23:03:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1E9494ED09
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E9494ED09
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1E9494ED09
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 23:03:32 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N0G1d-1xM68i0jCx-00yKdm; Sat, 20
 Jun 2026 01:03:31 +0200
Message-ID: <afadb29d-d0e3-4c7a-bc97-64705fcc1470@gmx.de>
Date: Sat, 20 Jun 2026 01:03:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260619063906.3467492-1-bernd@kuhls.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260619063906.3467492-1-bernd@kuhls.net>
X-Provags-ID: V03:K1:i0r/XOYTnVxhG/BIjemw3WK+zHpOIyHFdaVovt+h+g2CLFuXdQD
 z/1gG/JRK8xbTo+qbK9iimC0aTfcKSHQKDIe7UIPXJ7/S44xXGYjA751uj+MSWeJbIzpccw
 r1hqpSumTZg7QRhwOcbhgJzZdWE5Qls5DqXnz1sTrw1GDqRGnPkQkcJfpvIdvS16Pb64wKq
 sw2TC6hjpOVSWLIc8cUoQ==
UI-OutboundReport: notjunk:1;M01:P0:IulD58FaGvg=;MSGuphpbd82qmT8T56Al0CLg/GQ
 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
 mhiNV98DgeDnbHFXSif0kKUs/4ruHE
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1781910211; x=1782515011; i=fiona.klute@gmx.de;
 bh=Ymj3Rxk3LR68gi9bF/Cy4vhyxDFzxwIqePL/I32+xoA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Y1x/mxpEIqfhGycWRoI3KLs8i1pOLotbKSf3MhF3+VS6DgzXDAbfz6owlIQCUtOH
 THC9lJ59JAoFqY+47Dn3Fj25R41RLMSLljwzpx0GHytPlx038irQwmkhl+cq7XnPQ
 k9cP23/mzUTVQchz1+SAstnrhq77BZZMxobbJImlgxY/xV/2s+UWVAbYFboFgiQjf
 F370mtbPtljSHyQxZVhSWPedEsBoirOdcJAxSDEhJx45vPWmdbJgKORles6vPNb4+
 267GFK9FykZezGZJaNgd3v3Mjr/YA5QRjlP9DnwPnyf1mwk+kqdJ8ZpZ8rVMrzbAi
 BkWl9f9iwlhUf9eCjw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=Y1x/mxpE
Subject: Re: [Buildroot] [PATCH 1/1] package/rrdtool: bump version to 1.10.3
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 19.06.26 um 08:39 schrieb Bernd Kuhls:
> https://github.com/oetiker/rrdtool-1.x/blob/v1.10.3/CHANGES
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thank you!

> ---
> Gitlab pipeline passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/a9ea38c90edfa70108dfa66d77f3b3e9f5a14cf1
> 
>   package/rrdtool/rrdtool.hash | 4 ++--
>   package/rrdtool/rrdtool.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/rrdtool/rrdtool.hash b/package/rrdtool/rrdtool.hash
> index ce1186cb18..85e894a642 100644
> --- a/package/rrdtool/rrdtool.hash
> +++ b/package/rrdtool/rrdtool.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/oetiker/rrdtool-1.x/releases/tag/v1.10.2
> -sha256  9787114551ee9b5db7c72722736388dcc54bf00ded51b5dd47feed11fb179fe4  rrdtool-1.10.2.tar.gz
> +# From https://github.com/oetiker/rrdtool-1.x/releases/tag/v1.10.3
> +sha256  843b7caa2a80a815d44ac5c65daa42920cb64586fe804e36d0bc0783554e0635  rrdtool-1.10.3.tar.gz
>   # Locally calculated
>   sha256  ab6b4646e9e01f1ec287c29c351c886c4cb7f945c11efc0a1be9f6e5e6cc5320  COPYRIGHT
>   sha256  d8c320ffc0030d1b096ae4732b50d2b811cf95e9a9b7377c1127b2563e0a0388  LICENSE
> diff --git a/package/rrdtool/rrdtool.mk b/package/rrdtool/rrdtool.mk
> index 73832cb635..f911d54623 100644
> --- a/package/rrdtool/rrdtool.mk
> +++ b/package/rrdtool/rrdtool.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -RRDTOOL_VERSION = 1.10.2
> +RRDTOOL_VERSION = 1.10.3
>   RRDTOOL_SITE = https://github.com/oetiker/rrdtool-1.x/releases/download/v$(RRDTOOL_VERSION)
>   RRDTOOL_LICENSE = GPL-2.0+ with FLOSS license exceptions as explained in COPYRIGHT
>   RRDTOOL_LICENSE_FILES = COPYRIGHT LICENSE

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
