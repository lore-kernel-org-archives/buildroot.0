Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D3EC87FDA
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 17:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C0B140E76;
	Sun, 10 Aug 2025 17:52:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dAiE4k_qAaVJ; Sun, 10 Aug 2025 17:52:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E6D640E75
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E6D640E75;
	Sun, 10 Aug 2025 17:52:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E748154
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 17:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2074B4089F
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 17:52:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UlAG-niwrwty for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 17:52:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2021B400DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2021B400DA
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2021B400DA
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 17:52:32 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-458ba079338so28403815e9.1
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 10:52:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754848351; x=1755453151;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6JO9jxAEZtq6zbvNsRErVCwFhnyxjTQMDEUXyUvvoDA=;
 b=LOYRNsuLU3XTanC6fqndJR+TfzvJCBJljD1BqNRE7azZFskwHwvcPbmZ9kbgMU8lwi
 8C6NTEqXXwr/4ka5+odjxd6jRdLF6TV+NQZ4lkWx3zjeKuLwEtZ2QWZKo7L72LlBtC5O
 iTtn4Eqy9Yfqs66w3KsMQy8lq1m8TwZAF6jGJin33aZcGGxG1QyPQOEER2elARLdJUo4
 HU4PvDVRzv6fxm2CZ++q/WJcXC795APZKOYg/931sjiYYozdA7fbn9w9P5jCr0PJDw/p
 vLw1VoeYj8ROq6s9vZ7p7NJpXLlGH2f+06lT8ee528ZJM4w4+zNv5gkm2/UumBJ1R5xl
 0Cww==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXdyhxCx8w8IJEFoIeL9XQsEazJYpUlryskDXG6+/Ox1kx//Og0x78A3QC0QHj0i0iYDa1IsBKKZs=@buildroot.org
X-Gm-Message-State: AOJu0YyVvV4XJnQ+udLKOKXKUiCEB+EmeR3HuUpcLRuYPbQ0trry17bi
 Fy5CoxD1Seq5dEN9z5gJZT/aXA/L6lMJlwasIkbcjWar66suenLVx+RqPFbQXaALVXMg272PHYE
 AQsS/
X-Gm-Gg: ASbGncuYaEieQpmhtL8Q11l1GP44gbeoSH5FPFteSb/9D2DHFNp9823+d4PmIia1ccY
 pZShbY1tuhVYCYIV47tAo+uQe1NpnrM5Im6q+t9KBPL8qMxW3cTsyCxGuJx3kw5U5wbE9S559w6
 D6jyQi/ygg44FbvxxU85qyydjoTSv8pKMfvGvxGKlg1UU7bhJvat1R+Xvek9e75ToZ+62z3Nfcl
 wt5nCJBxTGX5dc54tZSep6yLgABLHLfwHAziWcA8KKTH+p/959noAZaRx7BPKDVuCuzcRMilg6M
 PsWaw35s4xH6uXw26X23V8IcRvWXsSKvivahknSrrqvZfCgqAt3T5IMsNd5tQmcNgSx6hjEC2R7
 6fZkxhyPS5M63l3FQWjofgx0ltNM8giRa3zpD2acgee2l0La8UjBSZo/0BDnyJmEsmbhWqzPTNe
 iQwXoPFNI0ALEesxPTs6KHKxephyTPcYhKN5r85q3icMaMbUX4dV77U6COfdb+
X-Google-Smtp-Source: AGHT+IHfgt0kjXXe92Adm7zjGmRMQq2LS8o/74NixLWj0xSk95WgQ3hABruuaKzDGTDW1pU69o4VHw==
X-Received: by 2002:a05:600c:a40d:b0:459:eeee:2759 with SMTP id
 5b1f17b1804b1-459eeee3089mr77728725e9.14.1754848350917; 
 Sun, 10 Aug 2025 10:52:30 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3c4d02sm36770695f8f.33.2025.08.10.10.52.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Aug 2025 10:52:30 -0700 (PDT)
Message-ID: <4973533f-7474-43a9-9fe1-18490e1302c9@smile.fr>
Date: Sun, 10 Aug 2025 19:52:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: marleen.vos@essensium.com, buildroot@buildroot.org
Cc: Marleen Vos <marleen.vos@mind.be>
References: <20250704103913.2271142-1-marleen.vos@mind.be>
Content-Language: fr, en-US
In-Reply-To: <20250704103913.2271142-1-marleen.vos@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754848351; x=1755453151; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6JO9jxAEZtq6zbvNsRErVCwFhnyxjTQMDEUXyUvvoDA=;
 b=M04SUKYJX0cpIbWY7eSOLnF95cZk1uPb3LPZAR1RkTQpD2xHZHzYVTbbAYgADb+UtC
 adZ3d0R0G7ZPHq5WldUFGBwEE/aqNzymj7yhi5crQ8TChJATv5/q6Iw0afN54hja5u6h
 EvyjtRK0r4QE1GW/UYL8p5VK48+ioETtn3fC4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=M04SUKYJ
Subject: Re: [Buildroot] [PATCH 1/1] Fix error with missing atomic_ops in
 autoconf for nginx package on sparc/v8
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

SGVsbG8gTWFybGVlbiwgQWxsLAoKTGUgMDQvMDcvMjAyNSDDoCAxMjozOSwgTWFybGVlbiBWb3Mg
dmlhIGJ1aWxkcm9vdCBhIMOpY3JpdMKgOgo+IEZyb206IE1hcmxlZW4gVm9zIDxtYXJsZWVuLnZv
c0BtaW5kLmJlPgoKV2UgdXN1YWxseSBwcmVmZXIgYSBjb21taXQgdGl0bGUgInBhY2thZ2Uvbmdp
bng6IC4uLiIKCi1sYXRvbWljIG11c3QgYmUgdXNlZCBvbmx5IGlmIHRvb2xjaGFpbiBoYXMgYXRv
bWljIHN1cHBvcnQKKEJSMl9UT09MQ0hBSU5fSEFTX0xJQkFUT01JQyBpcyBzZXQpLgpPdGhlcndp
c2UgdGhlIGJ1aWxkIHdpbGwgZmFpbCB3aXRoIHRvb2xjaGFpbnMgd2l0aG91dCBsaWJhdG9taWMu
CgpTZWUgWzFdIGFzIGV4YW1wbGUuCgpJcyB0aGUgbGliYXRvbWljIGlzc3VlIHJlYWxseSBzcGVj
aWZpYyB0byBzcGFyYy92OCBhcmNoaXRlY3R1cmU/CgpBdCBsZWFzdCB0aGUgYXV0b2J1aWxkZXJz
IG9ubHkgcmVwb3J0IHRoaXMgaXNzdWUgb24gc3BhcmMvdjg6Cmh0dHBzOi8vYXV0b2J1aWxkLmJ1
aWxkcm9vdC5vcmcvP3JlYXNvbj1uZ2lueC0xLjI2LjMKCkNhbiB5b3Ugc2VuZCBhbiB1cGRhdGVk
IHZlcnNpb24/CgpbMV0KaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290
Ly0vY29tbWl0L2E0NDMwNTc4YWViNmNhNDYwODEzZjRmZjdkODMzY2RkODM5YTMyNDkKCkJlc3Qg
cmVnYXJkcywKUm9tYWluCgoKPiAKPiBGaXhlczogaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290
Lm9yZy9yZXN1bHRzL2NkNS9jZDU5MTgwYjA1NjA4NDI1YWRkZmZiMDIyODEzMDMxZWI2NjZiZjk1
Lwo+IFNpZ25lZC1vZmYtYnk6IE1hcmxlZW4gVm9zIDxtYXJsZWVuLnZvc0BtaW5kLmJlPgo+IC0t
LQo+ICBwYWNrYWdlL25naW54L25naW54Lm1rIHwgNCArKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9u
Z2lueC9uZ2lueC5tayBiL3BhY2thZ2UvbmdpbngvbmdpbngubWsKPiBpbmRleCA2Y2ExYWMyMDc1
Li4xM2M0NmFkNTNkIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbmdpbngvbmdpbngubWsKPiArKysg
Yi9wYWNrYWdlL25naW54L25naW54Lm1rCj4gQEAgLTc1LDYgKzc1LDcgQEAgTkdJTlhfQ09ORl9P
UFRTICs9IC0td2l0aC1saWJhdG9taWMKPiAgTkdJTlhfQ09ORl9FTlYgKz0gbmd4X2ZvcmNlX2hh
dmVfbGliYXRvbWljPXllcwo+ICBpZmVxICgkKEJSMl9zcGFyY192OCkkKEJSMl9zcGFyY19sZW9u
MykseSkKPiAgTkdJTlhfQ0ZMQUdTICs9ICItREFPX05PX1NQQVJDX1Y5Igo+ICtOR0lOWF9MREZM
QUdTICs9IC1sYXRvbWljCj4gIGVuZGlmCj4gIGVsc2UKPiAgTkdJTlhfQ09ORl9FTlYgKz0gbmd4
X2ZvcmNlX2hhdmVfbGliYXRvbWljPW5vCj4gQEAgLTMwMCw3ICszMDEsOCBAQCBkZWZpbmUgTkdJ
TlhfQ09ORklHVVJFX0NNRFMKPiAgCWNkICQoQEQpIDsgJChOR0lOWF9DT05GX0VOVikgXAo+ICAJ
CVBLR19DT05GSUc9IiQoUEtHX0NPTkZJR19IT1NUX0JJTkFSWSkiIFwKPiAgCQkuL2NvbmZpZ3Vy
ZSAkKE5HSU5YX0NPTkZfT1BUUykgXAo+IC0JCQktLXdpdGgtY2Mtb3B0PSIkKFRBUkdFVF9DRkxB
R1MpICQoTkdJTlhfQ0ZMQUdTKSIKPiArCQkJLS13aXRoLWNjLW9wdD0iJChUQVJHRVRfQ0ZMQUdT
KSAkKE5HSU5YX0NGTEFHUykiIFwKPiArCQkJLS13aXRoLWxkLW9wdD0iJChOR0lOWF9MREZMQUdT
KSIKPiAgZW5kZWYKPiAgCj4gIGRlZmluZSBOR0lOWF9CVUlMRF9DTURTCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
