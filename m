Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A9ECC6B38
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 20:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A93F8086E;
	Thu, 15 Oct 2026 20:23:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P_Bqw-c0T4p1; Thu, 15 Oct 2026 20:23:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1D3D980DFA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792095834;
	b=maTSg19BVhXv7h4VP1M8tI0AmoLSHwKvef8Vt8lYao8Q5OpFFP0uBrFgosjHzsLJwr1B
	 L4Z0tiN7hLO6VBh7w8xiW4/jN7p7Pa5ZQz77p2o6yXFO5KcST3yVeCskXrQlk4ttYU7dH
	 bd487bZrajle0sVBTy07xDtUkNAcEw/LnKyjHfnOKtIWzS4ztY2eZmVVPS28sQcVSiD3W
	 5QGTo4O0Vip8UsilyY3MyG7nBTuuT9E4lHMvzOcLxOEf85HpcJpycUMDpfz7rAsG7aYfp
	 ExHkeuJgEhP5n1AAgCW7UxSzUIB8WbldyeauFwAcLvi+9vNFl7FnrGOwCqnw/BWRXoQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792095834;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Cc:Content-Transfer-Encoding:
	 Content-Type:Errors-To:Sender;
	bh=ekwhHwD+Hogcr34/OTbrzcl5HWOIvM32FE0YgOK47Cc=;
	b=Z+nPTkkgIEZmdcCSZsCYdDf8X3pJleN5C5dlnkmqw8Pn8EhDpbqIxB3dIFhyMD/3JEth
	 xtqbZLWOmoAI/XgJGAv6uqEcVGeBrJzWGbUjNvXECTSxU/SnVU8swRZNpC0lKFO27cbcZ
	 R/pEn/hs/H+bZgxP8teLL0CCdMJzPikCj+Sh5jeAvgiprkVTYMsbgduj8PAc246KcNU1n
	 ea+L6WWM5RIX1LSHTd6vX8b4J1kGlRtnduIQwQqT0qlwV5+q0iv+6I5PHpkam7twwTAGX
	 C+Nw/y2zn5X/fm0JVHLCTtvZktRlUBF1BDgGjF4lzMTOR9EIEIthlXBQ5seZwA3Oosw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792095834;
	bh=ekwhHwD+Hogcr34/OTbrzcl5HWOIvM32FE0YgOK47Cc=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=p9GcrAIlhMqJG5MTdzd9IOPGz3oPceFTkdjyPi+yCRUnhjunHkdmgYOFZGTBf/PTP
	 V32afqSFbpznCxtlxU9OSJm9yNe1m1vZJO3FQMJjDtx8w3QLcQRHR3l6mWOPkMmLbu
	 m7ywgZ5usOkSohhwJFdjGMQgcjA/R02uTCLwSBF2qX/xoPTjmQ9qQ7EMad1Hsd9c/y
	 V0HRQfMWr1+qVcZY2ho+6KCXXgtund/NFEKYkiHyvpROf7fRFKMiKAAsCrE7jS9d/u
	 Uc+lJc/txMGFNgeFW/cdrtyoPhc0W17+6yEeCsH27mtJNi5xaXp3Ivdkn3OtfTqCk/
	 nCj2dY1jSQYcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D3D980DFA;
	Thu, 15 Oct 2026 20:23:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BB58263
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9938060A3E
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:23:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GKrEox60jAnM for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 20:23:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 479B860906
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792095832;
 b=QlVTSjcDco7nP4aYglBw8qzQqOuX8TmkudHVrwSzgbG5tbDJAvFEArQjfVLN5/d8/W5p
 quqTlDPoxO8VE8iXxWsNxZJ8MqrZRC4mOgufdMlcOy3u6LVeBFdXdKWooB9KaymFaWEAU
 HXLQgJ09vub3agt1TBAFYiGvI3cM49k+3EHMH1l/MiDsR4HW50A843Ug6qMIB6Qdy32zv
 q0e864RWbRUDAbutq049Xv/anks94l2Nx3MX1S/ksVBv5f49p5PT4tvQ5WhV5fLjCCbiT
 9dzlm9Vn/Ax8b+Mm4oWAb91XbsukTnusCFDzrrUXZnksgX04aDH51NzhNQZnt4XXGQw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792095832;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=gMqbzZNl0pHd/IYjd5fW2z7QJ3BDqoGEkR9hzg+h0Bk=;
 b=D7NeIpXrOW7LiF+9A774Otcv2mU4OYlv+OG3xkScnFqQZgtA7PtxL4XZvWhr1b9ZlAca
 nyT05DFxswO1WpuejwTcWj5+ICX3SaivKyc3wZwPt5gMSJaSMm5rNWapiKb1qvBLFw+JC
 v29zS0UWwtbt9pWCKYqYATazde7XhC95cbnXvjDcRXoqd+GHbxf6kmZr0HUhzk7oUei0t
 4dYhWyQ9XWpIxbTMAbcKrfbjQ97spUAVhnF3R5zcQdpnnuhGEAPFGBgGGK0xoltQaH1IL
 2aAtNOI+jksIRMhLWsnswVMEnip5pUjzQ63GUTW+5k/xQ9HNvm5d/p757Cg0vkRxYIQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=FeSwrohL; 
 arc=none smtp.remote-ip=212.227.15.18
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 479B860906
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:23:49 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MtwUw-1wUAFd1dsa-0131XB; Thu, 15
 Oct 2026 22:23:41 +0200
Message-ID: <538fe6fa-3195-44db-82e1-7dba9f48fb7a@gmx.de>
Date: Thu, 15 Oct 2026 22:23:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20261015193243.3299884-1-james.hilliard1@gmail.com>
 <20261015193243.3299884-9-james.hilliard1@gmail.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20261015193243.3299884-9-james.hilliard1@gmail.com>
X-Provags-ID: V03:K1:UXxFaR0MJIavGwov37kGx3ydqLMMKIJvlzLSx2/K36ll+ijWAyf
 n98mE7BKWX3BHdKF1P+dc4Knav8bnAlYZFSjZk55U4m+8IpG9L5rGNIq4VbImA2opYdbwQG
 mpCW1avSEYc0MDXNrhjFutce3pU8BdZNOCVohI8GEXGbcdYV0xpb7FIIO0IbxpfDu/1aWVD
 ijR5ta4VLQ+FqNNgoDUVQ==
UI-OutboundReport: notjunk:1;M01:P0:3TcQ3/zgsRU=;sMausuIIlIQ9VEzl2iXnWFLwD/c
 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
 w5pXr7HLDL60qjuS18xvUBm
Subject: Re: [Buildroot] [PATCH v2 9/9] boot/uboot: add
 host-python-pkg-resources dependency
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 15.10.26 um 21:32 schrieb James Hilliard:
> U-Boot configurations selecting BR2_TARGET_UBOOT_NEEDS_PYTHON3 already
> depend on host-python-setuptools, which provided pkg_resources before
> its removal in setuptools 82.
> 
> Add the standalone host package under the same condition to preserve
> pkg_resources availability for older U-Boot releases and vendor trees,
> including versions whose Binman still imports it.

I'd still like a separate option. We need pkg_resources as a "least bad" 
solution so old U-Boot versions build without Buildroot getting stuck on 
old setuptools, but otherwise it should not be used at all. I know that 
means defconfigs will break until updated to use that option (or 
hopefully a current U-Boot version), but that seems better to me than 
dragging it into every U-Boot build that uses Python.

Best regards,
Fiona

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> 
> ---
> Changes v1 -> v2:
>    - Tie host-python-pkg-resources to BR2_TARGET_UBOOT_NEEDS_PYTHON3
>      instead of BR2_TARGET_UBOOT_USE_BINMAN.
> ---
>   boot/uboot/uboot.mk | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 96b8cd0d2e..daa841309c 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -268,7 +268,10 @@ UBOOT_MAKE_OPTS += DTC=$(HOST_DIR)/bin/dtc
>   endif
>   
>   ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYTHON3),y)
> -UBOOT_DEPENDENCIES += host-python3 host-python-setuptools
> +UBOOT_DEPENDENCIES += \
> +	host-python3 \
> +	host-python-pkg-resources \
> +	host-python-setuptools
>   endif
>   
>   ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYLIBFDT),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
