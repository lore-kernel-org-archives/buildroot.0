Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBDDBCC6B2D
	for <buildroot@archiver.kernel.org>; Wed, 14 Oct 2026 20:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78D9E6077F;
	Wed, 14 Oct 2026 20:53:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h71uN9j14QKU; Wed, 14 Oct 2026 20:53:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8801360896
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792011187;
	b=FMM25TxskunsPVAzRE8478uZEV8AwE+zCwbUH8TumOv+B8Jyvdmom7lU0pQs48afRiwx
	 2iyGKDWA5uQisazV4IqhyqzIbWcuvA81lY7E36NTZBYEraUnp9jvtnkhEKWuR4vGPg5EL
	 Z3sFZlglzLy58CxJ2T++f+jyQqrKZbxLWDPSoeK5gMuMNki2KqKmaG2Sa4Yd9u9pcBX3G
	 E7A/2qth4Z9CqzYmE9iOGaacDABEIuHIOFTVZ9vZ1u5LEA7Ul1FvN0RVnbRJ7znBe9PAR
	 vGZ8d8Jjwa96tglIQd0+hFNLiA9jxSlSFFdRFTQTeRH/r0jLJ8ae0wTcXXb8WirZcgw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792011187;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=4HnotRyyjk/dICjBZtRB9SD87gz0e4sD6zH4XnCh+0g=;
	b=DcaiLvMp94EMez8sJIlo1i4UU4ebrW3mQEoy8jbZdhMO+XD6UvSRfZa2yY1SswvRy5Z4
	 B7g8sOURAtoQcNscsT1RdWIWGWJ2fiIAs+vgSc5U7K1mijNJWl3/0LAvisQZZljJsHCjB
	 kdkMQMvSFr1jo08isPenGrg+JTaJx5xfw3YPKVOXmeSWZOYzSi39eJphZ6xaCjAcbfPJr
	 Q8CO8hXKCnAPhcfx1A1sIA11xuZsMyXB6IIiMA+TRkHtfxJMNFmWd8/Yak8PSSQOZlHLv
	 y68YCyjRYsr+Qb9cowAiv019a4NmBpFQylv5N3MLX+9M+/PUqOT6zZEDHVKW6q25QUw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792011187;
	bh=4HnotRyyjk/dICjBZtRB9SD87gz0e4sD6zH4XnCh+0g=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kLX3WlIOMUsJIjv0icscU/2ZuKHPfnRiwE+FDB0uk26g4qNEam0emXxiyyD/k7ZO4
	 MZzv0wok+rEuaNIQek3z8jcJOo2cRXGsIB0CpqDohBeHqsefhnKq0EwDw6/5Vrrz0K
	 HM4o+qTNW5fqAunD8Fila0HND50oyIpbdgzayOxE/n4yw9k1YEh31YKXgyNjh9AuEX
	 AVCRbO5U5Exa0H5wRT0m1Rdq0Tx++vTsxBND+QZzk4+K0elwL5lnPck5MbcFwqf4+4
	 RCDetLenTX1vQRzFWOmJAM5RjT+8HzpjqFI+sQU/+j77n8RNmlf6rvlcAADXLknf4u
	 DlSoUDvgyeqMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8801360896;
	Wed, 14 Oct 2026 20:53:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C1F80E4D
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 20:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC5EC40223
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 20:53:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QbmbJ1fYASiJ for <buildroot@buildroot.org>;
 Wed, 14 Oct 2026 20:53:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 9DC1C401A4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792011185;
 b=gMQEbWSyqb+ZL3JGPMvjjo0l6wzr5ZFmPBGdMIFTiw6tB4n4no3zRRKTPy9JWGcx3u9p
 3+CS9v3ynB2uFyCYiMYan7GzccOYxnJqfvsRJiwZk6v1rD53iGzmHiJnl/XoUCalOmjM0
 1ONP8GNAClwRryQgo5gcf7g1WEvttDX0XWAl9wuBBTCXAOlBTJLwaTQnFgV/40bgnvMxT
 qmWqCrjcCRsqUuwXJN3IaV1kY8emg7hf7/5MOR92BOoVefN7TOWK5yeH30FzowXvAgXKi
 mTmD7Elu4jrDbmyrvuQyiM8p5k/1Fxed/cO0Z85ZZ1EVEgzXAyA4thxwKicS/utn++w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792011185;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=h+OP6N0RLADA2khF0xv6N9O7b5fDPpobse/hk37EAqE=;
 b=IpZO7s8Z4guQ0URv+5CDRyhGlZIFEm76/teS6jMcd6G6Osf8TKgt4OXcHYWHR1BMxsw1
 7Zg++ikpAnAGxpRqIu3sCsWymCdYe95YaWKVHJSW5K3HY8l5NIEnYQKhubSsEn95ns+uO
 NxwluQ/S9szHgcVr32FoVNnsZHFnhGXUfYD74nU0WNdUXdFkJEmZ4tDYdiXtwRXjV7E+m
 uJ2IZQvGFDwr4f2CE/NlUw7dwWOR+YNcXU+0ncQFnO0S7hlC+/Z7VzxQbSWzyAJH5QjuG
 VSVuLN11olr+NJbFOtdmREAnKNrxY9Ztt0FNFnqoZdfKZykPw+feHOZdx2bfN9jZzRQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=amv30eBm; 
 arc=none smtp.remote-ip=212.227.15.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9DC1C401A4
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 20:53:03 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MF3DW-1xS4K73CLA-006kOp; Wed, 14
 Oct 2026 22:52:55 +0200
Message-ID: <b6a925a4-9eae-4193-b3aa-06f9755aeb89@gmx.de>
Date: Wed, 14 Oct 2026 22:52:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jarkko Sakkinen <jarkko@kernel.org>, stefanb@linux.ibm.com
Cc: buildroot@buildroot.org
References: <20261014164625.1474866-1-fiona.klute@gmx.de>
 <as_oRSUUVH8SQG-m@kernel.org>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <as_oRSUUVH8SQG-m@kernel.org>
X-Provags-ID: V03:K1:p2smskRYG3S/59/ib7gXeucKnqVyu1F+sGssTa+ipuN/u0fwZBP
 vIhSRmat+vDLUnXv6u+mAHwuKwX+X5FtFHvMADL7q10wwR+bLEPWXijuzsu+IcX3plu9PM1
 cI+QeZ2OJPMyrPTUwszncauxtGMAmXrDKyXGsIiz6AZ/BZbEd9SrBfdHlib6jNvArzQOWTc
 uL8JYpyQ6F2a+zATnmNXg==
UI-OutboundReport: notjunk:1;M01:P0:/4vjGsZkhZA=;xC2sV0uwYcSNXV71mWrRsDARZQU
 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
 mfpZgLzXQlfA6ZFwHvDyABx82mpPMU1m
Subject: Re: [Buildroot] [PATCH 1/3] package/libtpms: fix typo in
 HOST_LIBTPMS_CONF_OPTS
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

Am 14.10.26 um 22:38 schrieb Jarkko Sakkinen:
> On Wed, Oct 14, 2026 at 06:46:23PM +0200, Fiona Klute wrote:
>> From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
>>
>> --with-... arguments need two dashes.
>>
>> Fixes: b2eec8c6265a38cdba1afadf7f60e0fd00f3b448
>>
> 
> By defacto there's no new line here, and it's 12 most significant
> bytes of the hash and short summary in parentheses. This is at
> least how it has always been in Linux but not 100% sure about
> Buildroot. It just looks weird to me.
> 
> E.g., I would instead:
> 
> Fixes: b2eec8c6265a ("package/libtpms: add host package")
> 
> And wold not add the newline. Since this is not kernel, take
> with a grain of salt.

In Buildroot we don't have a defined style for this, but use a newline 
more often then not. Personally I find shortened commit IDs irritating, 
anyway.

>> Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
>> ---
>>   package/libtpms/libtpms.mk | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/package/libtpms/libtpms.mk b/package/libtpms/libtpms.mk
>> index 7bc69a50d6..0ece84ae04 100644
>> --- a/package/libtpms/libtpms.mk
>> +++ b/package/libtpms/libtpms.mk
>> @@ -13,6 +13,6 @@ LIBTPMS_INSTALL_STAGING = YES
>>   # Required because a plain Git clone is used:
>>   HOST_LIBTPMS_AUTORECONF = YES
>>   HOST_LIBTPMS_DEPENDENCIES = host-pkgconf host-openssl
>> -HOST_LIBTPMS_CONF_OPTS = --with-openssl  -with-tpm2
>> +HOST_LIBTPMS_CONF_OPTS = --with-openssl --with-tpm2
>>   
>>   $(eval $(host-autotools-package))
>> -- 
>> 2.55.0
>>
> 
> I'm not saying this is not right but I'm neither sure whether this
> is bug fix or not.
> 
> This is a weird because I've used this almost on a daily basis for
> Linux kernel QA since I contributed this... Stefan can you help out
> resolving the mystery?
I assume it wasn't noticeable because tpm2 support being enabled is the 
default anyway. But we like setting options explicitly in Buildroot. ;-)

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
