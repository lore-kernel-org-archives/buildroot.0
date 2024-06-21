Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1139C27C4F
	for <buildroot@archiver.kernel.org>; Fri, 21 Jun 2024 20:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B25B81191;
	Fri, 21 Jun 2024 20:44:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mNzzvwjCGYum; Fri, 21 Jun 2024 20:44:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 396FE812A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 396FE812A3;
	Fri, 21 Jun 2024 20:44:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BFD461BF344
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 20:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B96A8407F1
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 20:44:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lP8iRFwDFUtw for <buildroot@lists.busybox.net>;
 Fri, 21 Jun 2024 20:44:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 268B4407EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 268B4407EA
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 268B4407EA
 for <buildroot@buildroot.org>; Fri, 21 Jun 2024 20:44:21 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52c89d6b4adso2338829e87.3
 for <buildroot@buildroot.org>; Fri, 21 Jun 2024 13:44:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719002659; x=1719607459;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NcOfavd8T/XxxdRdF6bjkl9IIETguBtnGnHcrXJIgGM=;
 b=Ae0/pP02CZ57q/SKX4ePKeW/LpFwhUE+2/+XJEUcpFSASM1z5LbGklL9DrrY3WUin4
 LCVTS9o4eiCIGRFc57jtu6/akTve5ZEbEgtFI1/tr4EbZrNTeJOMxHxPZVObgH+MCgZQ
 UuNfWUFLbOYtpA9fONADFVLRghvnk4QoIGNxKs6TawcybuvmxU/kLUlBeK/zH4NSy5MQ
 EonyAmsKxP/rfzd2hNXakqZbOtmxYYt55pVCnVU/ye+xh7lJJGVZ2IZJnaVvTADMCK+5
 zloTXGSRKpP8fq2pa1/RuCg+Y5cU9A7qfEov2rGFG/Yae44Fxg2/rEOimqspAiWykXOT
 E9tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0UXNUKlE5pFzp4NJTTgHn+7FsxOPsJj1YHgl+Z05HMe6c+n8GIpPd7AFGV+dhcpGJrlaLYSZbfUJoIM/1GAMsj5g1DryfSg==
X-Gm-Message-State: AOJu0YwcoVR5jwYDrUVt/+w2eAb/d3zAdpKXyGpOxFtYos+nqBRfc4cC
 iJwnpjBNEgqz0meLpH3piX9kAfTORdGutWGL+2b5q6SjSnvZVYRLT3ipMcYQSmHNcDogJGtAnAf
 4
X-Google-Smtp-Source: AGHT+IGgsEvUzZAPXwDS0jjL6x8ChuPVHSCHQe4ZXvkPhC0fKr73mb845i7hQrgDk+bCTo7/06jBiQ==
X-Received: by 2002:a19:e04b:0:b0:52c:856a:d45f with SMTP id
 2adb3069b0e04-52ccaa5b881mr4898161e87.19.1719002658775; 
 Fri, 21 Jun 2024 13:44:18 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6fcf560908sm119030066b.184.2024.06.21.13.44.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jun 2024 13:44:18 -0700 (PDT)
Message-ID: <be43edf3-70bf-4669-a4f5-18058dd5c7f9@mind.be>
Date: Fri, 21 Jun 2024 22:44:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patricia Holden <pholden@nklabs.com>, buildroot@buildroot.org
References: <CAJ6EmCeX=u4vfeueqyZWUh9wRWuEbq5on41QavM6NhYtR6PpeQ@mail.gmail.com>
Content-Language: en-GB
In-Reply-To: <CAJ6EmCeX=u4vfeueqyZWUh9wRWuEbq5on41QavM6NhYtR6PpeQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719002659; x=1719607459; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NcOfavd8T/XxxdRdF6bjkl9IIETguBtnGnHcrXJIgGM=;
 b=ZKvUoC9jg5nCmoYg5DR8X4KXE2OKh95Uxi6WEVFYk8NmeJWr0DCaeT29ftI/Ef4uLZ
 6yzjTWjhGa+umuWw7jKn+XggoEfOsJc8+1L/+xsD4CX5n8BRiY/a9bc2WYNfknJMikMA
 JEG2AM6ouGRBkLAJ+rX6xmC5dPhWYxTIuxqQgMyrZv/A9ooFUAcXNsustIwiRx2ahqUA
 8BDPbZzsXgDfM4ODE+YHmqtrS40GyLWD+waBTP4xvgwsPyKftWecrRB9pNntX02Us8UD
 m7saQgZ2NlpUL3blsDwjOcAughpcBJqCJuHGxNJ6mVk7TnwBhs56nzU60Z7W7O0jbPoK
 4qDA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZKvUoC9j
Subject: Re: [Buildroot] general questions
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyMS8wNi8yMDI0IDAwOjEwLCBQYXRyaWNpYSBIb2xkZW4gd3JvdGU6Cj4gV2hlcmUgYXJl
IGFsbCBidWlsZHJvb3QgcGF0Y2hlcyB0aGF0IGFyZSBhdmFpbGFibGXCoGZvciBpbmNsdXNpb24g
bG9jYXRlZCBvbiB0aGUgCj4gYnVpbGRyb290IGRvd25sb2FkIHNpdGU/CgogIEFyZSB5b3UgcmVm
ZXJyaW5nIHRvIHBhdGNod29yayBbMV0gd2hpY2ggaXMgbWVudGlvbmVkIG9uIHRoZSBDb250cmli
dXRlIHdlYiAKcGFnZSBbMl0gYW5kIGluIHRoZSBtYW51YWwgWzNdPwoKPiBPbiByZXBvcnRpbmcg
aXNzdWVzLCB3aGF0IGlzIHRoZSAibmV3IiByZXBvcnRpbmcgc3lzdGVtIHNpdGU/CgogIEFyZSB5
b3UgcmVmZXJyaW5nIHRvIHRoZSBpc3N1ZSB0cmFja2VyIG9uIGdpdGxhYiBbNF0gd2hpY2ggaXMg
cmVmZXJyZWQgdG8gb24gCnRoZSBDb250cmlidXRlIHdlYiBwYWdlIFsyXSBhbmQgaW4gdGhlIG1h
bnVhbCBbM10/CgoKICBSZWdhcmRzLAogIEFybm91dAoKWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLm96
bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvbGlzdC8KWzJdIGh0dHBzOi8vYnVpbGRyb290Lm9y
Zy9jb250cmlidXRlLmh0bWwKWzNdIGh0dHBzOi8vbmlnaHRseS5idWlsZHJvb3Qub3JnL21hbnVh
bC5odG1sI2NvbW11bml0eS1yZXNvdXJjZXMKWzRdIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJv
b3Qub3JnL2J1aWxkcm9vdC8tL2lzc3VlcwoKPiAKPiBUaGFua3MhCj4gCj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBs
aXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
