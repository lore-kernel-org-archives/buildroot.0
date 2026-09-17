Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9C3C982D0
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 20:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64D6681125;
	Thu, 17 Sep 2026 20:44:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fqD4dz98NmTJ; Thu, 17 Sep 2026 20:44:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 616258110C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789677843;
	b=OGpEu0KZHGfIfoC/h0Has+Nvo4uI0vJZXF0/ZbrXFqrqe0z/VSgFSEh8KNjsr+rBTZj3
	 fTPQ1PXEVdb6SDj00Mruo9IqjYzmF+3p4uo1uxExanQOnXHIci0Fl8NktxDxbPFNdJbPZ
	 /6NKxNSSAZmdXMd7iFGl/2H6s5aogTpW5jpSqimQZUeQie/Li59HqRZHDYgHDfjDGgO0R
	 GfugQaVxHOPjfwUFbE1AiQTQF3lLusIliDJ8K6n7PR8hmntwr2QDm+ul0D875Ov+Q3KQ6
	 X+S1MxbGKpnY118O8HhRi/212bVkzrSMG2oNVCv0r2n2zFkVDnRgYFox40Iu/3I5qAg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789677843;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=/7bCKeKdLe0YklYm1UzrpUYZ3GYIvPCHOedzb3fL2rY=;
	b=McxShQvY3V2qDwRbN7Lb9b5lbqDIrBN4wMSJ5J5Ew+oJz6+ULT4ryiZgtUY+RSJA7Mb5
	 z68QY//dluUIpvkUXeRATIAgcN79/RWiQiICGoNy8Ll1u/H+/GI0vfmEyFpEnFGLkOS4g
	 PpqTNYMqp2kcoQGIHaRfKAcRxCL98RhIeopoUZmoSzG2tOHPNTRPjmAggYTSZFrHQjdwh
	 tNkcJpFWoX4cEHe90l5Oa18T9NofzCw4PRK1D+v2KCVHU9SNMsHqSLaBzlf4rAd7tVdJO
	 8B5NtFB2tPotQZSI8px2GHHLXrJ8g69c+ZaYZKMDJ+NRhhLEViXgaK7AVZ8Q4f6cD5Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789677843;
	bh=/7bCKeKdLe0YklYm1UzrpUYZ3GYIvPCHOedzb3fL2rY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Wm7M1JzgtV9yzPacStOJjP07NbrWOP8AhH3HIU0yq0hTQYn8lSQKNGG8r7spy6ZCG
	 p9uqG30lzR2LvvZsLALHm0voCASngrNk0rcpybtVaY7+bjl5dIKZ7EVW8TnktJQ9U6
	 jTCFOun0/dDVSXTBNnSFXTCa543vdbT1GjrYh5GnhqPy9BBiAI8ZA8G4Zd4J2Zji2u
	 Ui3onoQ3dKAQBmAj3BdPPT1ckQd8laUeTDQKKd2zisRGpqKNZ3lHzmYlU0m3NeNpM4
	 AVNAMLb9V11cqqamKvi8Zj5SuXNaAiua5kPV5vKecPMZMBjQom943P5TaNIhQZA9Mc
	 XJBzMeVNGtKwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 616258110C;
	Thu, 17 Sep 2026 20:44:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DBFB362
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 20:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3CF260807
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 20:44:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wdP1TNzYdwuU for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 20:44:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2F1EA60852
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789677840;
 b=Aq5m2E7s1i08k9ZUkCXdf4Y+zCUiQ5DUazdfLPYTw98GO1whf5w/hYpshtDiB8gDHWBb
 7AXJUf+Exq02YywPyMjv44m3q+GGsGXmNrk3R+0FmQZsVMgG8VVJUqyjmcNlnJzIrfROU
 f7Q6v/7sEgC1fgsDvzik8MKzHHuSJW1m6v49Y9O5JGKzrV5YMswkGQIrIW27sP96hmaJI
 W1Cd3EHLTF7TSru92HcHvYCrLjViRMtrri2ps68g4aELL8a5R0eGVAtblPJJW03Z3pcHV
 U60qfVlIjw3bulv5VT4dSckTkYSGHSLUKUCSOnWov0hvyEUJShUu79sIZ8et8GzUk9Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789677840;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=9ELZfSWtYy8luAV6CJX1nUQYYxRNIDjiIIWPN4eeL4I=;
 b=IFn+BiGSl6oSuOZq4fxaWKPViPS2e54YJq+4IPTvYU5CYzDaGcS0NO+HVxeGvAov/Iue
 ihB41KEbYnL0bT4c/OTBzJWgivw8iLHHS5icSHn0vTxb3MWSBSVYuER8LftUZlPHKocHF
 j4D63JVvW8VP9wFcWPlId45JJDRykGIkyHEik+UpfuyK4SjffdCD8SXCHr52zdHb1rx1S
 iC0Q+26P9EPjBq3qEEXQrxc1h5tNhavVpaOXZid1ij/DFd/CNjCC3sjJLvPMrVQtkEV6c
 5tGdbt5gOeE1QtCyogrHRNCbG2/nr3niB155DUdItpWcjjTmPruXR3CqFmIkPj/FImA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b="EzzQEo/c"; 
 arc=none smtp.remote-ip=212.227.15.18
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2F1EA60852
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 20:43:59 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MvsEn-1wpVQG0mjX-00v5ZN; Thu, 17
 Sep 2026 22:43:51 +0200
Message-ID: <cdba324c-c923-4d60-9f68-0d3717189078@gmx.de>
Date: Thu, 17 Sep 2026 22:43:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 agennart <antoine.gennart@quimesis.be>
Cc: buildroot@buildroot.org
References: <20260917070632.1930848-1-antoine.gennart@quimesis.be>
 <aquxRk4m83QOof4l@windsurf>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <aquxRk4m83QOof4l@windsurf>
X-Provags-ID: V03:K1:NXpOS5WF+sWWybUmS1Nfmg/epCYduxJyU+Lh5Q3GEtrpHwa0E6P
 f+9mDs5RKGRKC0fOCLOKyNZgl/+AlZ+fcKVgPsv5xwnbpRdNdsR8Ao1ulCcpGSfWs0snCc+
 zZ1xZ7SjyAm9OO2CD5Fw6yKQ8nwz0pdfh/fBCKaf3WQCxJBmvtyivutGSjicQ3PCkH4Cxz0
 yLDAIYqVRIo22XhYWm1lw==
UI-OutboundReport: notjunk:1;M01:P0:sVM7uY4aDrw=;DVSt3dnnXMKN10ncTXFsJcFpVI6
 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
 +ate7q6jkVFhv
Subject: Re: [Buildroot] [PATCH 1/2] package/nxp-mwifiex: bump version to
 lf-6.18.20_2.0.0
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

Am 17.09.26 um 11:22 schrieb Thomas Petazzoni via buildroot:
> Hello,
> 
> On Thu, Sep 17, 2026 at 09:06:30AM +0200, agennart wrote:
>> The previous version fails to build with Linux 6.13 and newer because
>> mlinux/moal_main.h includes the removed net/lib80211.h header.
>>
>> The header was removed by Linux commit 02f220b52670 ("wifi:
>> ipw2x00/lib80211: move remaining lib80211 into libipw").
>>
>> The new NXP release skips this obsolete header for kernels newer
>> than 6.12.12 and includes the corresponding Linux 6.13 cfg80211 API
>> compatibility fixes.
>>
>> Signed-off-by: agennart <antoine.gennart@quimesis.be>
> 
> Sorry to be annoying, but could you fix your From and Signed-off-by to
> use your first name / last name?
> 
> When I apply your patch, I have:
> 
> WARNING: Author is a single name: "agennart"
While that is a reasonable complaint in this case (as the mail address 
shows), I have to point out that the warning is questionable in itself: 
The given name/family name split is far from universal around the world. 
See e.g. the W3C guidance on handling personal names [1]:

> Similarly, *don't require that people supply a family name.* In
> cultures such as parts of Southern India, Malaysia and Indonesia, a
> large number of people have names that consist of a given name only,
> with no patronym. If you require family names, you may create
> significant problems in these cultures, as users enter garbage data
> like "." or "Mr." in the family name field just to escape the form.

I actually know someone personally who's affected by that, she ended up 
basically making up a family name to satisfy all sorts of forms. Of 
course Git doesn't stop anyone from making commits unless they specify a 
family name, but constant warnings must be annoying.

Do you know where the warning comes from? I can't find the error message 
in Git or Buildroot.

Best regards,
Fiona


[1] https://www.w3.org/International/questions/qa-personal-names.en
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
