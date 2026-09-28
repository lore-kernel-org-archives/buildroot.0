Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23318CA5FA2
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 20:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADCAE605D4;
	Mon, 28 Sep 2026 20:23:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BPg13GMqUjKZ; Mon, 28 Sep 2026 20:23:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CC4D6605E7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790626980;
	b=DmprG11zli/3DQvE8K/I1Js72YujY0i23DWTFq0D65fRSy/O0mikJjZ6gtLZpBrcc5Dw
	 Lvkw+HV3BygJin7hY1AlNmHINQHooSakvLby9fe1m0v3gtGonYCXD7lgnnNZgQOmAOdr9
	 QQevbUe0zqB++inVsGpTW0Jf4esn7y+tvLTH6MtpfeahriTjmEpDcRTQ4EMdAaZJgq7Z9
	 gqW2bj9Phurs5gFdraZ8a0pDfuv/kGwZhpT2ehzOyVo8wpEI5TvHkUy7PhZvyA4+zLdLP
	 NsOyfqFbiy8cFFtSdlHxaEFKP9yMC5HOUNaL6L9Wa3aitjtKEOD6mbiDSgfFhi0F8Wg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790626980;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 References:Content-Language:Autocrypt:Cc:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=H5ot4Pq1VohIE8pHGKfpojcuM0uRO+ywHZSbtSOqNdA=;
	b=d3h6gJpsDGK3e2qQWCkwa4xMdPNguM8foq7sNCL1bdb9cVnSDDSitzpMWDm3ohTb7yGY
	 5nYOwiBm+diXxOLLBo8J3ql/KTyG5m2fw7lgyDUv9sRA9z87h/Kfm1k1iO3+kvWyRw9uA
	 X7YIcX3a+MyvZjMYXO1p8iiojlUiL40Js/HywINEsYXY2KMErnegIUk3y5BuEARyccLKh
	 UCS+Mo6CdctQPJ3f6MUJu5POgBj/kfU8juWpYRmQ3xe8sVCJhHH+BrPWmEtvyfCaOITTo
	 GBXvsn+QeDhRlKzjTTCNbZtzfDlaQgY71jH+ey7yZGjHEHgDsC/KydpeopCdzZF4Efw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790626980;
	bh=H5ot4Pq1VohIE8pHGKfpojcuM0uRO+ywHZSbtSOqNdA=;
	h=Date:To:References:Cc:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=b0tPWf5YVkAPtQ3CwVEGonaYVaHQLr2Lt1C9VNyYRyQHMt8kqzPoX+puDhXEWqwVF
	 9olJNIB7h6rElnXXSMyx97cptb6GmKl3D3Ha63f8GXjjp8a4mFJSPG6gPNiLuQfOnp
	 FDfeWlYOm73ovJvWTqR6qkVGZUc5L0qTml1xGNgdgxsZWWzM47rZ/YNW1VyDyFpKWV
	 R1b+p5EaIYmB/L5k0wPRfYhje4GdsuaPCaq/V1qPz4ZSbZlxYLCZnuOkLSC0ye0mGg
	 5No/IXcSB2TvV80DgB8EleIol9xKFO0/VNRHp6nAh0KhVph5JQAT8W3rGhReFKmOPY
	 9dN85XTnT9e6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC4D6605E7;
	Mon, 28 Sep 2026 20:23:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A7E9C147
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 20:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 912AF605E7
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 20:22:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ov8qyBaKQXAg for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 20:22:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1A2D9605D4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790626977;
 b=VA04sWsnnAgafU5a1TKRjTz/4SC3VuXPkv2vTWxj7zV/e2Psl3XcoZdh4/Bse6i5uOFb
 UU9mXJQIMcBNSkwEoIn0oZqAzLQ1Or55LlbkhG5tuBcKjdNU3xo+uacWtisdUGF9y0uGI
 OnE3j1o+mQD9IV3xJaDjQgdnIOx2zlX5mYH5J4nI4Rg98dlepWg+bUd3BpsREL30tRb8Z
 v0ECibc38Dzd9npMPyn77CmHUQ8lgITV1B4HxuMyC4i7UJcGJaLAWkxRKgRfMfI50ZKRP
 r41KBXYG62BSPiDC27jGzSKHfawGZNSW0L2wvWT2kGR3dINFmB2Nz5EjAp6K5Ur1hUA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790626977;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
 From:Autocrypt:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=o3CxLJcuTdSMLjQnO6URiNO8E/WxMtUq8P7YWCvhKeA=;
 b=oAqgAUkvynK8B/9sBkGIk4PGc5nRHN68SqKHW3h9rYA5LmXzVXNrn1ydjWA9aeNwIpgA
 voDNfLRor4qzvQroBuGlHTvTeXCzaVof0wWF3sNDCl4tt9MLeZg91Zjlm0Aadhrc5ubD8
 UBWItncv42su5PoLNfH8WisETsovUqGw8TRhLlFee3ufU8GXMc5CveQMXTS97fT4N1OOk
 dfwgAxpQsWIYFE8wLuUOehqeKBFfvNv5GPhfG+4TLTEDJL6rPnwOV3SnuW3SIABsM/xSW
 hQoDXtQspGmV2h/1v/1HLNwvtsLeVnik/8quOafhRjam4gNld6bDxg6Zhd5h2gB4/6w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=VYIrJxQH; 
 arc=none smtp.remote-ip=212.227.17.21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1A2D9605D4
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 20:22:54 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McH9Y-1waq3c0CUO-00jVKQ; Mon, 28
 Sep 2026 22:22:52 +0200
Message-ID: <778e3550-5870-44cc-baeb-406be671b8e7@gmx.de>
Date: Mon, 28 Sep 2026 22:22:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
 <18301a0d-ac0c-45c5-9d4c-63a15c70ab61@kuhls.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
Cc: Buildroot ML <buildroot@buildroot.org>
In-Reply-To: <18301a0d-ac0c-45c5-9d4c-63a15c70ab61@kuhls.net>
X-Provags-ID: V03:K1:QTfujFVAwsf3+uol3lUe3IUxhJYIZARjhGi5j/tKnfl3vKd/NYx
 Bihbk1NVW56kgVxLUUL2cXeFUDluQMlNAXevVJILA5PlVbDXii8rqoJVuAUI58NvTlbJw24
 R9j24yDsH0Sz5fN4bq3DThY8YRkAThPVOC/VdCDmzu+bFZofM3K8I8Vr/XF9k7zGJtoOywy
 IF0lmGMDPQUoFa8/onhMQ==
UI-OutboundReport: notjunk:1;M01:P0:7LoPssbInSE=;2et/TcSuwWFH24MdiYEURdIg+AR
 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
Subject: Re: [Buildroot] [PATCH v6 67/82] package/rauc: Fix build with
 OpenSSL 4.0.0
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

Hi Bernd!

Am 28.09.26 um 22:04 schrieb Bernd Kuhls:
> [This mail was also posted to gmane.comp.lib.uclibc.buildroot.]
> 
> Hi Fiona,
> 
> Am Mon, 28 Sep 2026 21:23:30 +0200 schrieb Fiona Klute via buildroot:
> 
>> Hi Bernd,
>>
>> if I apply the patch and build with package/libopenssl 3.6.4 I get a lot
>> of deprecation warnings about the engine API, which gets removed in
>> OpenSSL 4.0.
> 
> this is expected but not caused by this patch.

I'm aware those aren't caused by this patch, question is if it indeed 
breaks with OpenSSL 4.0.

>> From the Meson definitions I expect you'd also need to set
>> -Dpkcs11_engine=false to disable using the engine API (which
>> unfortunately disables PKCS#11 support for signing keys, which is
>> problematic).
> 
> Yes, this is part of the libopenssl bump:
> https://patchwork.buildroot.org/project/buildroot/patch/
> 20260927104301.1801638-83-bernd@kuhls.net/
> 
>> Are you sure the patch is sufficient?
> 
> Yes, this patch ( https://patchwork.buildroot.org/project/buildroot/patch/
> 20260927104301.1801638-68-bernd@kuhls.net/ ) only fixes a build error 
> caused by libopenssl 4.x, it uses code which is already present in 3.6.x 
> so it can be applied before the libopenssl bump.
> 
>> I admit I haven't tested with OpenSSL 4.0 though.
> 
> With this patch alone rauc will be broken, the engine support needs to 
> be removed. Upstream does not support the new pkcs11_providers yet:
> https://github.com/rauc/rauc/pull/1779
And that answers my question, thank you. I consider "builds but result 
does not work" an insufficient fix. ;-)

As I understand the config, disabling the PKCS#11 engine would make RAUC 
work for people who don't use PKCS#11, but I doubt that's a reasonable 
restriction for Buildroot. Thanks for pointing out the PR, I hope that 
gets resolved soon and we don't have to worry about this.

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
