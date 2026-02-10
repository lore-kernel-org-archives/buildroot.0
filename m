Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B646EA3F3A
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 11:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFC4E4118E;
	Tue, 10 Feb 2026 11:14:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NI6Sb44CLoLp; Tue, 10 Feb 2026 11:14:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE7D741190
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770722057;
	bh=u8zXYcc3k3kM+Uynb8SCuWaUnx4xxgNNgqWDKivqzvQ=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=oPYuZTOwoplSGJpS0bpH6Quv8qes/m/oqcs59TJcPofmxCfS4yxyGPBQMO9YmtSB0
	 /AxbkfPJFJWgo05LGlzyuqjfWyE+zG8H/wuHOGroxeu1Hm1Cv42VRHRXXDgwl6bTFr
	 ndRCv29OfNgS3GiTpj+z3KdMrnIQ69UVJ22fLj6Vv7mSzOT8WdHYmfBkiiBv+Zwc+n
	 9lTBAfUnKX0LMbzIDGj/rWn0Hhpx53r1Nm6Rx+engYsTRvdtZwUar3AWd59IZV6s4d
	 194ZaeRjoA6E1jazFYXu/QsI8+lEf+A0ronYIw8DGHxUfLQIIeFac1OGI/l4LvjmRq
	 970bUnpRJHEvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE7D741190;
	Tue, 10 Feb 2026 11:14:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EC6DBF2
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 11:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D121C402F3
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 11:14:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ixv5L1K4JqzR for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 11:14:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C7851401FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7851401FD
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C7851401FD
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 11:14:13 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-64b7318f1b0so5068840a12.2
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 03:14:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770722052; x=1771326852;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hx1VBG9YUEBYWbhXhxMVRUS1YfjjQXliVtm7nO/imdU=;
 b=izrIxg0WKkk7WJ3qvGijdHboMBMZjOJ/2pBluQfHqqwUee2cNJHLkm0w3u8YOZ3tns
 pffeb7whoprr/BXT4lNazirPr5ndkebVz79GWm6rpdnBEPlUZWmchU6Fh0ThgbOMU9G/
 kWU29HLOWnDyNApKU/zHPysgLwVBKGWDH9I63zq0ST9YslXOVmjDsLs8eYQZ3JWRUOEu
 GRgGWW/wVVt+DNBUKtJLfHH1Vqrnsx5Zn/3tvPvNHzeDwwJyNMUR1msqdVCB0AAqsDi1
 Vnm1NIsvco4BzPbgpPPYaxovulPa6hAxYbnZ0HmdKqe5kICZQslRbFnUk7pPUhfYHK6D
 aDNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0LEp7M77+BqnwKCC8VXCbjyVl2/Fte7w8JXYeX+5Px2Ft0ibf2TOUAbivpESexKTWoAJryrf9pyA=@buildroot.org
X-Gm-Message-State: AOJu0YzwvTQz8ZElE/Z3unNmsXVbzLZ5kJdLMthIb1Svr0qyoSCmAwcC
 8djRiNZovhJY3PojVCDYKEla95a73UNbQq+pBDlGXC3ixLhpuRepE5AheJPp+GbJnRuqBAMTj90
 561mjLS4=
X-Gm-Gg: AZuq6aKbaKKQda610W1cWJWoq6tk1SY0JUDLGyD4B7LWSLWVvNzxBqCsXtMMqPBEDwQ
 gGfLDTNK0QdrVOB7ivg3g+8Vruxa1uM4mA7RvjyDrh4DPg2oWvS2qkXXnPE/xvnU6EQ9CWjJAeV
 s1/tVlkwUdt51QFSrOr5m6i5Wly8CbAuU4UHmnIZBRx3cnHB2J9aZfTnZWTJxXbamdNOHW5Tet5
 eEpaZ0eIaCuqBwYUSZ5ZdHiO+uS+VN9AYOyMAHB5PA2/5H3fmrrsMT5u0wI7pKZLFQ1qYwCfxu/
 nPa6zDvCuhHXEtZWLlQjg4bwXhKCUDxUleSNHnV6+lT39vAV/mzL/IPm2clbm30GLIvjmRHhz6P
 mOB11GODgHNLs2go3lBu+D4bsleeR3ncxGXkaJ2GDiq0fo6BA5RyFrCo5fJBZgQUyO80z/HaDFy
 0HOa1bukphOIL0dZ3t+upNEkfV4jqJ7dI7q1GttTExP5uQPubJAi6Qbw1vfQY3PD2Wdl2RrlMxX
 GR2yyGLAlY=
X-Received: by 2002:a05:6402:2690:b0:658:b837:7953 with SMTP id
 4fb4d7f45d1cf-65984147d9emr7664328a12.12.1770722050902; 
 Tue, 10 Feb 2026 03:14:10 -0800 (PST)
Received: from ?IPV6:2a02:a03f:73a7:c001:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:73a7:c001:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65983e5f42esm3807743a12.0.2026.02.10.03.14.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Feb 2026 03:14:10 -0800 (PST)
Message-ID: <547c9175-b7de-42aa-a363-52f18c344877@mind.be>
Date: Tue, 10 Feb 2026 12:14:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yann.morin@orange.com
References: <3c42d6a8803c28ce34156eee659e25875b916075.1770703119.git.yann.morin@orange.com>
 <87tsvpqeqz.fsf@dell.be.48ers.dk> <aYrcaeU2kIm4a7sD@yd-6wlzhs3>
 <8ea6c2c9-ab1e-4262-878c-bbbefa35b554@mind.be> <aYsIfWMrnwXvDB2b@yd-6wlzhs3>
Content-Language: en-US
In-Reply-To: <aYsIfWMrnwXvDB2b@yd-6wlzhs3>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770722052; x=1771326852; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Hx1VBG9YUEBYWbhXhxMVRUS1YfjjQXliVtm7nO/imdU=;
 b=ZQZKvd2JXLWGRhy/89lY91ZJ0+I/562nigplVpyZc6JHY3NQ3mSJdmVZfeHHgqFr/5
 5cKpsbcXQ+kbqPSeES+VQzDhqzzCJwL7xQDJC68FAupVYa1pDXTKEBM/H/MemQWCz1ZX
 1Gn2NYVk4SB2dH3CfNc6VdyYbb+yK3nCL6MuWZ/RMDFJEOjxd1MNgvneA+YXssDPjoP0
 oUHCsu7alPPM86q3yVug53KSct7Tl3WZpESWfJoU9dvlvqTTBwKCXr1hc/TeseElTGIE
 OubRCDNkKL0JNr9CX2yYYhtqfnw30oC0o9MVOuj0hlJIjqvwyUzTo5qQBvf+allByY2X
 iW3w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ZQZKvd2J
Subject: Re: [Buildroot] [PATCH] DEVELOPPERS: adopt mosquitto
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Scott Fan <fancp2007@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rebonjour,

On 10/02/26 11:29, yann.morin@orange.com wrote:
> Titouan, All,
>
> ...
>
>> so I haven't touched that patch
>> since last week. You can find my work in progress over there: https://gitlab.com/essensium-mind/buildroot/-/commit/114db281da52b342a95d2aea6199bbf9c2e20cdb
>> . As you can see, I still need to redact the patches messages, send them
>> upstream, etc
> OK, I see things I haven't yet stumbled upon, while I also hit a few
> other walls already.
On top of my head:
- cjson is now a required dependency
- the http api is enabled by default, so we must disable it if 
libmicrohttpd is not selected
- similarly for the client shell (?) which uses libeditline
>
>> At the moment, it "almost works":
>>
>> |./utils/test-pkg -p mosquitto bootlin-armv5-uclibc [1/6]: OK
>> bootlin-armv7-glibc [2/6]: OK bootlin-armv7m-uclibc [3/6]: FAILED
>> bootlin-x86-64-musl [4/6]: FAILED br-arm-full-static [5/6]: FAILED
>> bootlin-aarch64-glibc-old [6/6]: FAILED|
>>
>> For the remaining failures:
>> - Is getrandom() supported on musl ?
> Yes it is, at least since 1.0.2, 11 years ago. Thing is, the mosquitto
> code is... not accounting for that case.
We can then update that patch 
https://gitlab.com/essensium-mind/buildroot/-/blob/114db281da52b342a95d2aea6199bbf9c2e20cdb/package/mosquitto/0001-Fix-build-with-uclibc.patch
>> - We may need to exclude no-MMU platforms from now on (armv7m) ? As there
>> has been some rework in mosquitto's memory allocator
> I think it is acceptable to drop noMMU builds...
>
>> - Old glibc is not supported (because of getrandom())
> Not sure how we can catter for that case. And anyway, getrandom() has
> been available since glibc 2.25, released in 20217.
> In Mosquitto, getrandom is only used when TLS (openssl) is not
> available; when openssl is available, then that gets used. Maybe we can
> instruct people that have old glibc to enable openssl as a fallback...
Yes that works too
>
>> I hope to make this move forward "soon", otherwise feel free to reuse the
>> commit I just linked above ;-)
> Would you mind if I inject the interesting bits from your patch into
> mine, and credit you as a Co-developped-by ?
Sure, please go ahead :)

>
> Regards,
> Yann E. MORIN.
>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
