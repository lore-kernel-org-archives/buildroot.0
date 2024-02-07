Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FEEC4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 10:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9252240136;
	Wed,  7 Feb 2024 10:09:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wxetj0z9OtdU; Wed,  7 Feb 2024 10:09:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D203402E6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D203402E6;
	Wed,  7 Feb 2024 10:09:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A94631BF255
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 10:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A373E42209
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 10:09:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vfV63ch9Ba2B for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 10:09:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9550942207
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9550942207
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9550942207
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 10:09:54 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40efcb37373so3665065e9.2
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 02:09:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707300592; x=1707905392;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H5o9foe1cELiVdzEl/R7f7/ZWYKdIr2wxl0L5fyyh5g=;
 b=B48z/GG1VCxyEaTZXrvqdb4zI4bHcjKaa3egm/+aBttJnelVTv3f2BD2TmPy8SITcl
 mJsUQqyPBbL+lFNesVnJD99UnnpPz4JaVdY7yiRqLpQweqcuX08enCJbV/QgOiQw6p/9
 8m6imrXvdG0fjDzGD+HgTozM8jp04uhYssucZr4GXu1/TbqvDyf1B2ouBDAbYIrNf8Yx
 NyyIM2T/x1V/5IwJbC5QdUmx3P3fdDJtv95StcIYhhnP/n2lx01jrTUglrZw8M3FGJTV
 kGHgLb/ofQUQSQT9k/AvAqvpD1XNhL+9MHZxr2SfPwGymcHzwrPcaht7aq0eu5EaxM87
 cepg==
X-Gm-Message-State: AOJu0YwS4uZAs7CAw9s9esyf4g7pImrs5eWY16gEx1Aj4hZXN2u0YUfd
 v2AZEA0W4tfL972oOQhhBQf2DkoNnfZK2OW0RoYjC2Ey2ESYRtFNgBzsq7t4yPY=
X-Google-Smtp-Source: AGHT+IGqWcd6ypznank3K8NqGp9BulQBAFw4jXvIOJNr3f/UUX5aispYtzrCVVNDKb+h7SgeRom9YQ==
X-Received: by 2002:a05:600c:5204:b0:40f:bdf3:3426 with SMTP id
 fb4-20020a05600c520400b0040fbdf33426mr4897062wmb.31.1707300592339; 
 Wed, 07 Feb 2024 02:09:52 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWGWV1/TJuOk0n2hlZvVV7Oa4NQ51U/L7gMXSIS17Gdy73u4xsS1jnAQ2hk3XrmRIItqTI5XzTBWhpMxULB+63tipcrBq0x1aAcjR+KYOZZs1qviwEqL9kDIj5P0HWsb/Jy9XTvaEWboBpA/k/BcovetDx2jMyU2guRIqN2KjD2416BVFv6TlBHAvgSFn5gZuIR21KTwTCA1AcU9h+wVWiqwcGFAX4zf9Rm8AMfL6y6ragBm6BqGo3vVDtQthEx3GLJsEv6oMI4P+AcIG9k8batNL3Y35WFs+g5GGQwBR0Z2SJX1A5A4reFzbW5Pppx7+/wuVI=
Received: from [192.168.17.126] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 r9-20020a05600c35c900b0040fd18f231fsm1590392wmq.3.2024.02.07.02.09.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 02:09:52 -0800 (PST)
Message-ID: <272a9412-ca98-4e6f-b91c-e5ff58bd0e92@smile.fr>
Date: Wed, 7 Feb 2024 11:09:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20231218081958.506691-1-dario.binacchi@amarulasolutions.com>
 <20231218081958.506691-6-dario.binacchi@amarulasolutions.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20231218081958.506691-6-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707300592; x=1707905392;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H5o9foe1cELiVdzEl/R7f7/ZWYKdIr2wxl0L5fyyh5g=;
 b=YaA4JYrDU1kiU+nQpXZaPGfUR98Ko7GwOLczutvEsNFcf+atp1c533Km512iXhodC4
 n3US99/IbgMQy8N1GOJz+R2NQbXGO0J+coYlkWgV8lh2X3Xqt1mQdqPhmZEvWswMV2Xn
 PjyLCTdGJTcFt25xBGS/RL9sNTLZczgTGofb+szlZ5CkMuVD/b6c02YcTEN4Q7NtDYNL
 ZZq7n9SlcARqyTAkknEh+xchQ7vY5IUGOGzw3cZk0N3SB2foUILsn1NFIX4NUPaFeVZj
 NTHObeZfvl94HiMlM8BLk3ylY5N4kes9izV35A2QsD/2XHhKZWcjULiOW9kTy1Dlt1yl
 nwJQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=YaA4JYrD
Subject: Re: [Buildroot] [PATCH v3 05/11] package/python-referencing: add
 host variant
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGFyaW8sIEFsbCwKCkxlIDE4LzEyLzIwMjMgw6AgMDk6MTksIERhcmlvIEJpbmFjY2hp
IGEgw6ljcml0wqA6Cj4gUmVjZW50IHZlcnNpb24gb2YgVS1Cb290IHVzZSBiaW5tYW4gdG8gcHJv
dmlkZSBhIG1lY2hhbmlzbSBmb3IgYnVpbGRpbmcKPiBpbWFnZXMsIGZyb20gc2ltcGxlIFNQTCAr
IFUtQm9vdCBjb21iaW5hdGlvbnMsIHRvIG1vcmUgY29tcGxleAo+IGFycmFuZ2VtZW50cyB3aXRo
IG1hbnkgcGFydHMuIFRoaXMgcGFja2FnZSBpcyByZXF1aXJlZCBieSBiaW5tYW4uCj4gCj4gQ28t
ZGV2ZWxvcGVkLWJ5OiBNaWNoYWVsIFRyaW1hcmNoaSA8bWljaGFlbEBhbWFydWxhc29sdXRpb25z
LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFRyaW1hcmNoaSA8bWljaGFlbEBhbWFydWxh
c29sdXRpb25zLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmlu
YWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gCj4gLS0tCj4gCj4gQ2hhbmdlcyBpbiB2MzoK
PiAtIERyb3AgQ29uZmlnLmluLmhvc3QKPiAKPiAgcGFja2FnZS9weXRob24tcmVmZXJlbmNpbmcv
cHl0aG9uLXJlZmVyZW5jaW5nLm1rIHwgNyArKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGlu
c2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tcmVmZXJlbmNpbmcv
cHl0aG9uLXJlZmVyZW5jaW5nLm1rIGIvcGFja2FnZS9weXRob24tcmVmZXJlbmNpbmcvcHl0aG9u
LXJlZmVyZW5jaW5nLm1rCj4gaW5kZXggNGQxMWM5OWRlYjNiLi45ZDhmYzVhMmY1NDEgMTAwNjQ0
Cj4gLS0tIGEvcGFja2FnZS9weXRob24tcmVmZXJlbmNpbmcvcHl0aG9uLXJlZmVyZW5jaW5nLm1r
Cj4gKysrIGIvcGFja2FnZS9weXRob24tcmVmZXJlbmNpbmcvcHl0aG9uLXJlZmVyZW5jaW5nLm1r
Cj4gQEAgLTExLDcgKzExLDE0IEBAIFBZVEhPTl9SRUZFUkVOQ0lOR19TRVRVUF9UWVBFID0gcGVw
NTE3Cj4gIFBZVEhPTl9SRUZFUkVOQ0lOR19MSUNFTlNFID0gTUlUCj4gIFBZVEhPTl9SRUZFUkVO
Q0lOR19MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwo+ICBQWVRIT05fUkVGRVJFTkNJTkdfREVQRU5E
RU5DSUVTID0gXAo+ICsJaG9zdC1weXRob24tYXR0cnMgXAo+ICsJaG9zdC1weXRob24taGF0Y2hs
aW5nIFwKPiArCWhvc3QtcHl0aG9uLWhhdGNoLXZjcwoKV2h5IGFyZSB5b3UgYWRkaW5nIGhvc3Qt
cHl0aG9uLWF0dHJzIGluIGRlcGVuZGVuY3k/IGlzIGhvc3QtcHl0aG9uLWF0dHJzIGFscmVhZHkK
bWlzc2luZyBhbmQgc2hvdWxkIGJlIGZpeGVkIGluIGEgc2VwYXJhdGUgcGF0Y2g/CgpCZXN0IHJl
Z2FyZHMsClJvbWFpbgoKCj4gKwo+ICtIT1NUX1BZVEhPTl9SRUZFUkVOQ0lOR19ERVBFTkRFTkNJ
RVMgPSBcCj4gKwlob3N0LXB5dGhvbi1hdHRycyBcCj4gIAlob3N0LXB5dGhvbi1oYXRjaGxpbmcg
XAo+ICAJaG9zdC1weXRob24taGF0Y2gtdmNzCj4gIAo+ICAkKGV2YWwgJChweXRob24tcGFja2Fn
ZSkpCj4gKyQoZXZhbCAkKGhvc3QtcHl0aG9uLXBhY2thZ2UpKQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
