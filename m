Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC388C43458
	for <buildroot@archiver.kernel.org>; Mon, 29 Jun 2026 21:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9814560DC0;
	Mon, 29 Jun 2026 21:41:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id obHT9IZwiO0v; Mon, 29 Jun 2026 21:41:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB29A60BA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782769282;
	bh=EyZakg1Ajty96lBKXisz/yW6Y0dqKdL0jwyk7fX0Xp0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SJ6Xp3Zy1irKjI9QAqFy1j9Gtlsz02N9uzuAdWOtdDBF3WdRAvCF/VFe8FN+Tb1IR
	 DFLxnJdEVAG/VFMB4gTJ+Z2LX9PYZ3pGaB/ZV8Og0rgqbtjgFjdC+wgbARAhLPBl8m
	 y8iQansdz8s6HcKTk7hj6QPSLNNLa5P1pZh/QXuiPaBSN4w2EafS5vs0XuWCPYABUQ
	 zV+YMuLXu2xUVDQyBwhtVmApe41W09X7RDmbnF88RDBWG3gorawZydxi29eChso8zO
	 3aQksCq5OcugU5wrQnWk2cy/31jBfCQBfAoJaN4uF2vW8sSNt0PaacMsscniYk03Ao
	 FXQzqZ76Y/8wQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB29A60BA7;
	Mon, 29 Jun 2026 21:41:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2491C34C
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 21:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 227B48217D
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 21:41:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tECydfXnq-1j for <buildroot@buildroot.org>;
 Mon, 29 Jun 2026 21:41:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 364388217E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 364388217E
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 364388217E
 for <buildroot@busybox.net>; Mon, 29 Jun 2026 21:41:21 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-474303f3c72so848652f8f.0
 for <buildroot@busybox.net>; Mon, 29 Jun 2026 14:41:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782769279; x=1783374079;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VXu8+K3W9Xg7ycEn7VpbZCPHQeBL4W5qXnqLp4OY2EM=;
 b=EK06xZy0McGmTrxsYHUQeMd0Io34PetThVjDt4dZ0k+NRY2meEtRijY6NtA3O1YRiG
 uK9+lqmzpzpJWrpv+j+wYT4l8F2js2WlaZ/D6Ih7VdMCvAdSJ5Ah5FNpRewVjtI8lDEd
 oLI7zewJY1hSUnJe9vkGv4ijyyc1oz8K22VYO/DHL81SHfrYNGmq8KDXNokMyRRLIr34
 igQdfFNI/qKF4lvx2zlDT60p3WXzq32rGZs2sCKiDq8F8cLjdCuX48TVSGisUXNU79vy
 OTH486Xb16cA6vacqJpaLYpSfGBWGGtgm0rmwwEKABg1A84NXYy2yetHJCl22F6lsiPN
 rlNQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrV9O3GXVg2adZW0Ola3zrFFCPhjUuUVC4lb/vZSZYhi/CUrCsilYIB+DiG1i3b7Arzz1RrnbwhYGI=@busybox.net
X-Gm-Message-State: AOJu0Ywkd1zePGff3Jq1d8iL9IGYivg1/PMQMBIuUxEINGxJCv+ljs/a
 oRfidwKl/vqkKVK8rRHDKo2tE5neiXxQ7tAVTh6y/pVXZFDyvx08EdSM79cL6+0/NkU=
X-Gm-Gg: AfdE7ckmbSKre3boCkGpqSLXw9u+ScCgYj9B1ZSbzJY1HfeTAimk4z+fPLqtW8pTiYE
 BIx3Hdez+iz4LnLXY/aQWrnxi2mdyGylVkehLh2oVBPW7tCdUfZRyRhhGY+rci4FqwehAxmXAxJ
 xljCAEdAcSZAlzSEwWTjd9Wb/HQeYHIR4AE4Y6WJ+fc0GBcdHUSCfu9IMpCSlZYrqd3vA5hzYwh
 T+Gpo6YzdvdDLIcuEK14ErUoOjUOXbrhegpCaVmAU8WoaRUV6nKkbqA77phBCFkFXsbGvqFGSx+
 OKm7Di4En2Wi+fInuihq9rnwiLtkgWKXK41wL8GBH4UF4fO9+1tiAdrghIxr1Ln6oH7JZHCa3ch
 jj2V387YUEAXxY+XVIWG2YWsfyDaZSyK1GUJQWCIHSVffIwXttDh6rrqpZymeKRYo779v0SiVhG
 MqNONiBWbAA8TTolZeUkSqY1FnZW6h4xDqkE81wvfzwc1X6pcVxjLkjX9DpJYr2q3fFyCpw5/ih
 XB+MyOscGTbalylWOOwnY90JltMiFyZ9Edjn3I2XCZQTTHaGQLnYDA=
X-Received: by 2002:a05:6000:40e1:b0:46b:ea12:2912 with SMTP id
 ffacd0b85a97d-475509c8d16mr1329210f8f.5.1782769279182; 
 Mon, 29 Jun 2026 14:41:19 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47563e0eee5sm1372620f8f.5.2026.06.29.14.41.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 14:41:18 -0700 (PDT)
Message-ID: <588cc82b-85bc-4ce4-93d0-c256b7f54afa@smile.fr>
Date: Mon, 29 Jun 2026 23:41:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@busybox.net
Cc: buildroot@uclibc.org
References: <20260627064155.1938273-1-bernd@kuhls.net>
 <c145e709-580f-447e-99c3-03bab062cf7f__16883.8836414338$1782762233$gmane$org@smile.fr>
 <pan$490ec$abd6358e$72d9a434$58d2a609@ID-313208.user.individual.net>
 <382a70ee-a73f-485c-95ed-822f04135349@smile.fr>
 <pan$58e00$81199e4f$edc9570b$a6a61b05@ID-313208.user.individual.net>
Content-Language: fr, en-US
In-Reply-To: <pan$58e00$81199e4f$edc9570b$a6a61b05@ID-313208.user.individual.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1782769279; x=1783374079; darn=busybox.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VXu8+K3W9Xg7ycEn7VpbZCPHQeBL4W5qXnqLp4OY2EM=;
 b=PtUnnlKZx113SoOMq5rGaqs7mu8DX+5A1192OFozf3SaCJwpsQLyjyK1AED+sDrENJ
 OsojLI5SqJ/uxBlXx9xtqbpRfVQqGw9m9zjtgG9qwubiz/tDzQOxKW93sRIjCinh0UNu
 46rGB1zpJ+FCnJ4zJfUv+o+BCycA1srZnRmC0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=PtUnnlKZ
Subject: Re: [Buildroot] [PATCH 1/2] package/gcc: bump 15.x series to 15.3.0
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQmVybmQsIEFsbCwKTGUgMjkvMDYvMjAyNiDDoCAyMzozMiwgQmVybmQgS3VobHMgYSDDqWNy
aXTCoDoKPiBBbSBNb24sIDI5IEp1biAyMDI2IDIzOjAzOjAwICswMjAwIHNjaHJpZWIgUm9tYWlu
IE5hb3VyIHZpYSBidWlsZHJvb3Q6Cj4gCj4+IEkgaGFkIGFuIGlzc3VlIHdoaWxlIGFwcGx5aW5n
IHlvdXIgcGF0Y2ggZnJvbSBwYXRjaHdvcmssIHlvdXIgcGF0Y2ggZ290Cj4+IGNvcnJ1cHRlZCBi
eSBwYXRjaHdvcmsgc29tZWhvdy4KPiAKPiBIaSBSb21haW4sCj4gCj4gbGluZSA0NzFbMV0gb3Jp
Z2luYWxseSBoYXMgMTI4MyBjaGFycyBidXQgZ290IHNwbGl0IGR1cmluZyBTTVRQIHRyYW5zZmVy
IAo+IHRvIHBhdGNod29ya3MgYXQgOTk4IGNoYXJzIGFjY29yZGluZyB0byBSRkMyODIyOiAiRWFj
aCBsaW5lIG9mIGNoYXJhY3RlcnMgCj4gTVVTVCBiZSBubyBtb3JlIHRoYW4gOTk4IGNoYXJhY3Rl
cnMiLgo+IAo+IEEgcXVpY2sgc2VhcmNoIHNob3dzIHRoYXQgdGhpcyBpcyBub3QgYSBuZXcgcHJv
YmxlbToKPiBodHRwczovL2dpdC52Z2VyLmtlcm5lbC5uYXJraXZlLmNvbS9DUnVoSVBVWi9idWct
c2VuZC1lbWFpbC1icmFrZXMtCj4gcGF0Y2hlcy13aXRoLXZlcnktbG9uZy1saW5lcwoKSW5kZWVk
LCB3ZSBzdGlsbCBuZWVkIHRvIGJlIGNhcmVmdWwgd2l0aCBwYXRjaGVzIHNlbmQgYnkgZW1haWws
IGhhbmRsZWQgaW4KcGF0Y2h3b3JrIGV0Yy4KCkl0J3MgZGVmaW5pdGl2ZWx5IG15IGZhdWx0IGhl
cmUg8J+ZggoKU29ycnkgZm9yIG1lc3NpbmcgdXAgeW91ciBwYXRjaCB0b2RheS4KCkJlc3QgcmVn
YXJkcywKUm9tYWluCgo+IAo+IFJlZ2FyZHMsIEJlcm5kCj4gCj4gWzFdICJsaWJ0b29sOiBjb21w
aWxlOiAgL3Vzci9zcmMvdDItc3JjL3NyYy5nY2MuaWE2NFsuLi5dIgo+IAo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcg
bGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
