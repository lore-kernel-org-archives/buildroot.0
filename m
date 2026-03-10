Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B630FD88C0
	for <buildroot@archiver.kernel.org>; Tue, 10 Mar 2026 22:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE71C40C75;
	Tue, 10 Mar 2026 22:16:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZLezjk-daD5i; Tue, 10 Mar 2026 22:16:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E75340B69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773180991;
	bh=IJobsrl9cF3YS0HwyLab4CUs7mKZivtqLXunwEGHmIo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=X2H9IU9NYe4XIta0kP6j23e+eBTx/S+U5WkFhsfhGAj7jXNDG62yh5jjz+9D/dycq
	 +nPeZ6uSWPoSZIiYp4v8zLD1McOT+tYJ9uslGZH3dvS8AFrHw2OeYhOjVYiBJA//PQ
	 b38JCX6FM9VB3d8rwJN3psBK5iLqtuHYYtwd1ctTKGBKSFcrMPL+hqCEjz1yHY61fp
	 8lhkogdlBLL8X0bcoU/ic8AO/mfELWECdK1FbrKRAySqIAt+u/OPvf+B8ZzloD5YzO
	 qWtIW+IkQaGNiStpb/ScS0AsIj16awmpwsY1Eih2WQdgDi2JnmpOHW8zQmbQWDsjqw
	 CwoUoPDfx3lIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E75340B69;
	Tue, 10 Mar 2026 22:16:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CE819201
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:16:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B49DE4093C
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:16:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SqQPuF_MHGii for <buildroot@buildroot.org>;
 Tue, 10 Mar 2026 22:16:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C6DCA40469
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6DCA40469
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C6DCA40469
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:16:28 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-439bc14dcf4so275037f8f.1
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 15:16:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773180987; x=1773785787;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=blIH4yaltUhZAAGcOE7rTeGdJgDEBwV1TQVxhJUfOWg=;
 b=DZB5StDUjP5qfZ2y0d9b5fLHMm2x0rgcy1sNvW2CneeiwWTWNp5I0t13b83GcUTjDb
 +3LIm6/qDjrGxSbl+86IWTmefyinzWqTNS1MfL6BnnRcXF9hngiiTJkih/MA5cWsmHWi
 NkF2o/GtDfx0IUy79Lbmai+sH5fVOWgHd13+QPM87p3mWfztK2uqXSSHWxT7WGSvN3Nz
 eVb6DVvOdqq0KZBOa/InC/P1rXBQwwaj3lWYas9zi5eVqLONwu+EjWNa9j1NRPbzES9T
 hUd7Z9z+kacaGk777BCEmlaxW+VFpeellywPwFS8vsG5MdMBe2DnAuBuhBgos3tKfIFK
 snLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcX6aLq3heaXt09WgrMLGp/R76UmDOHBXftMoZFaTw8Gf+gau7PFtpofXOy0fqLH5+XtpmiZoJBxk=@buildroot.org
X-Gm-Message-State: AOJu0YyqMA5Ffm3i16pdLfQppyo6uvDUzsiUaXuRvoNiCyc6TXCHDXJR
 udpVSpOmbHYj29hg7QGMeZ6x2ZQbH6Vmp7rZxnpTicdaZBh4AH9uIyhCqTN/uz5ac5o=
X-Gm-Gg: ATEYQzwakIrbysVQbbq63L6fhvvJkw3ZqxYkXEw0al7ri6kO4u9XZdREHLtD9frDxR8
 4kTBG8JjL51yX/ZpITNhRdoR2bqgDcPe/pc9MmiYO8rK5imbHm1Jg8Aoyl5tMCN2AtvjfMOW4PI
 OD8j1OdhQP7u0ji8+pnUPixGSasbeTKPoWrw1q2dIYUsHi9EE7SG5IOhpw7/HsEghMnDLHFAeIl
 u2QuY2CVqFr61wduPu/+Pk7SpxS0uTZzSubpXpFsc8ZeVbSjpFljpZ8jfOAioBHE/wF+ITl2nrd
 9pXHFHbB8IL5ZtyS5wQVNCWUY4jG/3Mleqx7wAMKw0cPYPidF8JcK8FS/z8sIk7pWMpHARc8dBj
 piWKKlHnmsZRtlIhA3ocEovmPDywtvIAkHYYbsceKUBtvWedPsPWbpkGPgYoczRgwER5DYo0bH/
 lJzUyyZZch1NOjIImsi/PtxBGafe6bkroJxtkNwn8mMNw5v9nN1DUubvFUxcpKY5jqEjKd91YkP
 PPUns/R6JxZ0rKlFtvIYcUz2/0AqwHGnylVDdMBVS+tWXOqKBDx4kh6wSz4sBxwvA==
X-Received: by 2002:a05:6000:1886:b0:439:df59:abc5 with SMTP id
 ffacd0b85a97d-439eff1bc51mr9974993f8f.12.1773180986609; 
 Tue, 10 Mar 2026 15:16:26 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439f81a0480sm1367871f8f.12.2026.03.10.15.16.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2026 15:16:26 -0700 (PDT)
Message-ID: <ea3d98c0-c69b-43bb-8785-70f029532700@smile.fr>
Date: Tue, 10 Mar 2026 23:16:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 buildroot@buildroot.org
Cc: Thomas Huth <huth@tuxfamily.org>, Thomas Huth <th.huth+br@posteo.eu>,
 Cyril Bur <cyrilbur@gmail.com>
References: <20260225105537.1420002-1-alex.bennee@linaro.org>
 <20260225105537.1420002-5-alex.bennee@linaro.org>
Content-Language: fr
In-Reply-To: <20260225105537.1420002-5-alex.bennee@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1773180987; x=1773785787; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=blIH4yaltUhZAAGcOE7rTeGdJgDEBwV1TQVxhJUfOWg=;
 b=Gfbr/6vTFqcA5Jwd3Iv0DJVou8wb62M37BFdDwbUgKvCPWMhMczGiHojYPjJB3/mtt
 RBTW0Jfj9DF/eTSuD8p1V99CXKXLWg0Zr2B+chXKRLOiQb/YmToRf/b7+gTLKPVBDg61
 OvEvsRM+++dddCjNzdFPt0ip3XtrwFQa3wQPQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=Gfbr/6vT
Subject: Re: [Buildroot] [PATCH v6 4/6] package/kvm-unit-tests: honour
 BR2_ARM64_PAGE_SIZE
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

SGVsbG8gQWxleCwgQWxsLAoKTGUgMjUvMDIvMjAyNiDDoCAxMTo1NSwgQWxleCBCZW5uw6llIGEg
w6ljcml0wqA6Cj4gVGhlIGxhdGVzdCBrdm0tdW5pdC10ZXN0cyBkZWZhdWx0cyB0byA0ayBidXQg
dGhlcmUgaXMgbm8gcmVhc29uIHdoeSB3ZQo+IHNob3VsZG4ndCBob25vdXIgdGhlIHN5c3RlbSBw
YWdlIHNpemUgaWYgaXQgaXMgc2V0LgoKSW5kZWVkLiBIYXZlIHlvdXIgdHJpZWQgdGhlIGt2bS11
bml0LXRlc3RzIHJ1bnRpbWUgdGVzdCB3aXRoIGRpZmZlcmVudCBwYWdlIHNpemU/CgpSZXZpZXdl
ZC1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+CgpCZXN0IHJlZ2FyZHMs
ClJvbWFpbgoKPiAKPiBSZXZpZXdlZC1ieTogVGhvbWFzIEh1dGggPGh1dGhAdHV4ZmFtaWx5Lm9y
Zz4KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+
Cj4gLS0tCj4gIHBhY2thZ2Uva3ZtLXVuaXQtdGVzdHMva3ZtLXVuaXQtdGVzdHMubWsgfCA4ICsr
KysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0
IGEvcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9rdm0tdW5pdC10ZXN0cy5tayBiL3BhY2thZ2Uva3Zt
LXVuaXQtdGVzdHMva3ZtLXVuaXQtdGVzdHMubWsKPiBpbmRleCAxZDdlZWMyZDIxLi5lZmMzYzg1
OWFhIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMva3ZtLXVuaXQtdGVzdHMu
bWsKPiArKysgYi9wYWNrYWdlL2t2bS11bml0LXRlc3RzL2t2bS11bml0LXRlc3RzLm1rCj4gQEAg
LTQwLDYgKzQwLDE0IEBAIEtWTV9VTklUX1RFU1RTX0NPTkZfT1BUUyA9XAo+ICAJLS1wcm9jZXNz
b3I9IiQoR0NDX1RBUkdFVF9DUFUpIiBcCj4gIAktLWVuZGlhbj0iJChLVk1fVU5JVF9URVNUU19F
TkRJQU4pIgo+ICAKPiAraWZlcSAoJChCUjJfQVJNNjRfUEFHRV9TSVpFXzRLKSx5KQo+ICtLVk1f
VU5JVF9URVNUU19DT05GX09QVFMgKz0gLS1wYWdlLXNpemU9NGsKPiArZWxzZSBpZmVxICgkKEJS
Ml9BUk02NF9QQUdFX1NJWkVfMTZLKSx5KQo+ICtLVk1fVU5JVF9URVNUU19DT05GX09QVFMgKz0g
LS1wYWdlLXNpemU9MTZrCj4gK2Vsc2UgaWZlcSAoJChCUjJfQVJNNjRfUEFHRV9TSVpFXzY0Syks
eSkKPiArS1ZNX1VOSVRfVEVTVFNfQ09ORl9PUFRTICs9IC0tcGFnZS1zaXplPTY0awo+ICtlbmRp
Zgo+ICsKPiAgIyBGb3IgYWxsIGFyY2hpdGVjdHVyZXMgYnV0IHg4Ni02NCwgd2UgdXNlIHRoZSB0
YXJnZXQKPiAgIyBjb21waWxlci4gSG93ZXZlciwgZm9yIHg4Ni02NCwgd2UgdXNlIHRoZSBob3N0
IGNvbXBpbGVyLCBhcwo+ICAjIGt2bS11bml0LXRlc3RzIGJ1aWxkcyAzMiBiaXQgY29kZSwgd2hp
Y2ggQnVpbGRyb290IHRvb2xjaGFpbnMgZm9yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
