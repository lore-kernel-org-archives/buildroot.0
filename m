Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B973C4707C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 21:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DB607046B;
	Fri, 12 Jan 2024 21:44:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DB607046B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kZBu8uzJg7Wb; Fri, 12 Jan 2024 21:44:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1D6770450;
	Fri, 12 Jan 2024 21:44:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1D6770450
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E9041BF2C5
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 21:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7B7284F26
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 21:44:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7B7284F26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2eStgzNb1eeu for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 21:44:48 +0000 (UTC)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 280AB84F25
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 21:44:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 280AB84F25
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-50eabfac2b7so7971314e87.0
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 13:44:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705095886; x=1705700686;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GBXMLe92IRhwy9JVQn7ekj6C6OqKJArLa1Ad7rUpip0=;
 b=Kn47jgWIQSJ1QbgpX+0KCLnoyouO/0H1eL46jqmM4HvbyNYAeFakzPogASQ3mt1Zwb
 n5JyeNGFqMvOATZbvF/tNKG+h8VMlDr8LqAcjXWIaHEHfy+3Mlm9JcF1FRCtE0c/FCUd
 vCKbYSHCrfyzRNwISrodMsjCjPOL83plSEk6l1XSL2lMdKlaY7rW/x1WEaTDncG188Eo
 7auSl5D26wOuNnfJ5ffPw+CC/wLe0oGCxQUPkZ0RyOeV8lw17shB9mjn5LqH5gOYOupl
 EQRLbVu2lELlIOx5hBe5/UH/WUUtJQFyyzEysAdQ6+Y1lpJVbuNyZUy81V3ebq09P9OJ
 FBpA==
X-Gm-Message-State: AOJu0Yzmh5ops2Uh1+R43R/KPQxuDaC1mAKG2CWGjzvaxCuW/Ygu3kum
 1fRQH0Bw6ZFJ5w6pbAFGpX9uJLLDqCw=
X-Google-Smtp-Source: AGHT+IFWs8f36rkUHBvTpfKXi/HJjAvIG6MOUpyNN5AluPSdM08ZD5DGVKHUVX6FU9my2aBvEkGGGA==
X-Received: by 2002:a05:6512:38d2:b0:50e:af1a:1dcf with SMTP id
 p18-20020a05651238d200b0050eaf1a1dcfmr792575lft.87.1705095885796; 
 Fri, 12 Jan 2024 13:44:45 -0800 (PST)
Received: from [192.168.10.7] ([188.191.245.106])
 by smtp.gmail.com with ESMTPSA id
 i10-20020a056512340a00b0050e48ad03a1sm610087lfr.149.2024.01.12.13.44.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jan 2024 13:44:45 -0800 (PST)
Message-ID: <da9e5f79-69f8-4fc6-bd49-57ebe4760803@gmail.com>
Date: Sat, 13 Jan 2024 00:44:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: ru-RU
To: Marcin Niestroj <m.niestroj@grinn-global.com>, buildroot@buildroot.org
References: <20240112194000.925982-1-m.niestroj@grinn-global.com>
From: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
In-Reply-To: <20240112194000.925982-1-m.niestroj@grinn-global.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705095886; x=1705700686; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GBXMLe92IRhwy9JVQn7ekj6C6OqKJArLa1Ad7rUpip0=;
 b=NhzUmqsDa2C37LKcHQzenurDtfWU6vvNcnRSItQc6ke7xBd5AqcEzsugDZlxFTOW4A
 6nfOCb85X9fV3F4C4rKg1st1EfveDy/ATndFb/M4vNFDAvJ8UrWZq2bCnmGTutOiiUro
 SNJGsKWfyH4aC5ZHq/RR43WSbpQFeDGuucUkx5GFxMRWy3dfkWvLs3hw/Po7DZOJhHOk
 QjFH0fqCtkYHRPxWXmKDWFFLCfFh46qkq7QW782SwU4aDvJAr3Mq+eBgWT1/eHVzKflk
 s37QqlhgWFpIbwtUiZBhYUowTX0wKmuIkEx4ARQ1gHQ31Jo/IYB1ESU1B2HRlLg2MMpf
 /DBw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NhzUmqsD
Subject: Re: [Buildroot] [PATCH 1/2] configs/orangepi_zero3: bump ARM
 Trusted Firmware to 2.10
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksIE1hcmNpbiBOaWVzdHJvaiwKVGhhbmtzIGZvciB0aGUgdXBkYXRlIQpUZXN0ZWQtYnk6IFNl
cmdleSBLdXptaW5vdiA8a3V6bWlub3Yuc2VyZ2V5ODFAZ21haWwuY29tPgoKMTIuMDEuMjAyNCAy
MjozOSwgTWFyY2luIE5pZXN0cm9qINC/0LjRiNC10YI6Cj4gU2lnbmVkLW9mZi1ieTogTWFyY2lu
IE5pZXN0cm9qIDxtLm5pZXN0cm9qQGdyaW5uLWdsb2JhbC5jb20+Cj4gLS0tCj4gICBjb25maWdz
L29yYW5nZXBpX3plcm8zX2RlZmNvbmZpZyB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9jb25maWdzL29yYW5n
ZXBpX3plcm8zX2RlZmNvbmZpZyBiL2NvbmZpZ3Mvb3JhbmdlcGlfemVybzNfZGVmY29uZmlnCj4g
aW5kZXggNTFhNmVmZDNlZC4uZjRmYmY4NjgxMiAxMDA2NDQKPiAtLS0gYS9jb25maWdzL29yYW5n
ZXBpX3plcm8zX2RlZmNvbmZpZwo+ICsrKyBiL2NvbmZpZ3Mvb3JhbmdlcGlfemVybzNfZGVmY29u
ZmlnCj4gQEAgLTksNyArOSw3IEBAIEJSMl9TWVNURU1fREhDUD0iZXRoMCIKPiAgICMgRmlybXdh
cmUKPiAgIEJSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkU9eQo+ICAgQlIyX1RBUkdFVF9B
Uk1fVFJVU1RFRF9GSVJNV0FSRV9DVVNUT01fVkVSU0lPTj15Cj4gLUJSMl9UQVJHRVRfQVJNX1RS
VVNURURfRklSTVdBUkVfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9InYyLjkiCj4gK0JSMl9UQVJHRVRf
QVJNX1RSVVNURURfRklSTVdBUkVfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9InYyLjEwIgo+ICAgQlIy
X1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9QTEFURk9STT0ic3VuNTBpX2g2MTYiCj4gICBC
UjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0JMMzE9eQo+ICAgCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
