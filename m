Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3ED6C79FB7
	for <buildroot@archiver.kernel.org>; Wed,  9 Sep 2026 14:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CAA3607A2;
	Wed,  9 Sep 2026 14:34:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kJfmF-BSg30t; Wed,  9 Sep 2026 14:34:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 599A660787
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788964449;
	b=VhlhiQguZqkqp8jjMnr7kWDQOoUccf8gkuNDZNsGePqPaI9WhJK4kivXwnGzK82h7q36
	 86Hc73G/yoJtwyuSD+vC+hZUWI+RupyF3a0m7DoE+oLTdoiSwPVZlKf3C9pjbA3nRRaE7
	 I/oIKOaOTFq2cuCAzSdD8FtPfU1OTgvnFdYkfOOoiUajwcZel2JszMelpXoNhIxom2peT
	 GDWVmTP4DW9qex7cO0a4CQ9JsTNhu+FOUt7Rin3nLs37WSffaR1sI3Ymv34g1DMRbfDq8
	 y0OMZTFAVPyTMf6yFUwZv/pu7NxxyZMxmi1Q+nIh1nIBI1LPpEQ85/whu20CDnoG+yg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788964449;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 To:Cc:References:Content-Language:In-Reply-To:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=VDDKNvT5DKUqHBh1iQNBsyKJTkxoSrlKXxshn49jGfE=;
	b=PIh8BgYro4eS0GQ30bdBzwX3bI13arJzWgo6lzetptyHpVMK1GBjLqdGo7Hg02+8mWfj
	 r6wrh5HK3SyALQ/hPRXxO4LhUfMsyFCsRRuVHCxreik+lRgxdk2dw/ZJb0pIsNZ2C1Izp
	 TQLwNOstVowXnHPTvwiiSeYl0fj2AIjubp8zx/FP89QyiA2rR8N+1av3MrglVs05Z8AM8
	 bd1z4em7H9AvfQNO1OnxLgnuKJur21dG0NuOuNGO//zmpax4uIKjer+2vIuWj/pP9Ztny
	 XA/tnAahJY7EUBPSxAFcfri7ZXJ6lgYFL8pTCQOQfJCGovKZbE4KfkhRRSaAV16jVnQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788964449;
	bh=VDDKNvT5DKUqHBh1iQNBsyKJTkxoSrlKXxshn49jGfE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XGL8TMB+Gss47u2X3wZEP4wDH9Ke//t8CJGCtfjAzt6FmyOoYTW8ljJy47OS8ajeu
	 Lx5YJXLk+F1rRChjlgQ6fs+gRyPVxkcRHiZ5ytj+YIh585Il3ww3cAG7UE2yXZqgdx
	 S61t0yhMs3rHX0ReZ+mJgGbHHkW7RXQVl8l0TnOuiXpWWrwQSjZVf5as26uRTjwRP2
	 8UccV4Oxf1+4S6b3SbuH3Q2wAPL5YkfYlZ947NQ8Vy3tybQbujhxwcAf2d1/fMfw/N
	 b5UeDORhhdUe6Md6f+oQqrzx+5sM9O8+k0jGvEkuRKwV5ptk5YdMFoHQBQCJUSNlyE
	 AGIiusPuQo7yg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 599A660787;
	Wed,  9 Sep 2026 14:34:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A77A2E3
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 14:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 181AA401ED
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 14:34:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i4biIOkc0F-N for <buildroot@buildroot.org>;
 Wed,  9 Sep 2026 14:34:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org D45FB400C1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788964447;
 b=MV0nXZhPfBt7SJG+5dciAPE29sqU41bZCnwH0cikCrLuqfEesUj/RugfQSHjC2drlFcW
 pc4susEfBznQ1Tu5K2RA99YzDnBCMqpBz0ReLiy/MYQn1OkTu36fdoSiDfKI7VL5Th7Pz
 VZUrMgEMSBRx0ixNgHP0uxVPJCiOhHbMcosT76jM3b5RTZHs4Zc2fwtSlthg5QQL23dpL
 +Wtjdmeq21ic5UocBVc6bJmqrWnE8rxYujIivZ+wKQBsKw8lYYBK6KiGtG4dTCt35K3yg
 3/VhFXluWHKrW4SwHDDINNJEE4eK+4h3h9YTBfpLDIQ+Dhg0TiGL7ZET93E39NgiIZw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788964447;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=NyHfmobqZADK4RyTzBoMSLm1KQkIZXp4trjY8V44IUg=;
 b=BPGESzCwQW2Imgkrbe85W1WsNKriewM8wM9Niqdw85qD9yz7spdUW+Zub646k1+FJXUQ
 VP10NtuxRANYSlnua6EpMqeCnSvrMgILiIVAf4nM1iiVUg64MVEwPItiTyWtkuoGcl3ub
 xP0tK3heMBKiwinYduzhaYu5l/iXqetWgM2iAxzeavwlUFc/eRu7Z/q5qPgsvyzMsGNjE
 xzTs53/hcvoaJMbqKEabaT1z00ck/xoHyeGzuKO6AfVA+V1GztCs7TXrH7a9AuplovELq
 xH7yhcIOf0xbahVh43HuPit/ay8pU3+g44RFh9ii6VrdvR5KU0QkVh3bXJJq6owxcvw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=smile.fr; 
 dkim=pass header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=j26wjknW; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::431"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D45FB400C1
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 14:34:06 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-485850cbac3so3875129f8f.3
 for <buildroot@buildroot.org>; Wed, 09 Sep 2026 07:34:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788964444; x=1789569244;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NyHfmobqZADK4RyTzBoMSLm1KQkIZXp4trjY8V44IUg=;
 b=W6+Hp+S/VfjFCnDCb1fbXDkeumkrWrikRbAudM8FNlTm66RQdDuBhK54DOMK1yhdko
 d3QoyFbm7H6vTlCf6ceKkq/JghQ4USDI0hcKnVEfffaX9mageU0+RjcN3cWlzQkLXe+D
 Q2PtT+b+IklaACk8Tn7eS6ftAvtL5lLwh1KKZ6ZoZ0BvEydZlWNQHHSJsXDyzxevZJzo
 ZMpGkGk0W+cGvdsiEciVYPqjmhStF2oDvBMNHqefMawKwWiQIgo3Khuq4/FxNL9hog8e
 NLFO1mfa57ZrEhnJ0/Fa0dXehgKaQP5pkMoY6W3oZ3HDk8iQCh5T6nolS+cmxy1qwuNT
 qwuQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzQHnmioJLOmaQxDfdZKXnjBaIU3ZcpFIZiYliwwoeW2cc+ZdVvP3MdQ4uZxmDhGtYB+KahJEktbx8=@buildroot.org
X-Gm-Message-State: AFuF++mWO8b7azer7zDijIY0SSf7M5eZB3AqgP8TzYN0fOsJk+AGR3te
 kqZaUKcLptn4TlkicFWBFrUPP0w3zPXPFgAmOnG3LR8GCUdld0PDQmgXwxTTVGNiWn2HuuN/o25
 ZN/iziIg=
X-Gm-Gg: AYBFou1++YnqjZXCrHmXObGs4zy4DHXzZyMsIQf8CO7ziL9Ssh/sDc40czEkjI0luqg
 XtDyW6K3l/w6BqFVC57HsTRD8hs81VP+2uLMEqcpKr189/t/4prFJEbgjDIUdVuTVeQwOxDfHqH
 6Uu7y9kdPPoAy+csqNMcA6aoSIMhUMGk5OdCQ1QponEUDZWGZburosEO7C5s/Tb2YaJn214BM+M
 hZ1jKcSARhZdSIvNCsb94e559Xu5dazr1HGSyibOTyWh95Y/YBEsY1VAP9XkVD6ToHEfXqmyDw/
 xaEwtyZGjFUxlZy/IkgllDEipWU8qeh0NtaZyK5d2zOiq1ul7K+z1yruiYkb3/bZ9Xpeks1mVwp
 2KlZow7r0jtGhPuPVNyXe2HiwEDg1kyoawJbB16PYW9rpxXvK0jZI77D/b5g9fEQaYpZNnQKafc
 NxJtto4cXkP0WuJ5D76fxDRA/q9GSkjEXPZa/lJPbdcphkAQhrcVeeMSlwJu/Lr7we+SNJKmmqq
 8OJ6O4WgcrrEmtBkGSoHGbtQri5yX+SQHb8M7QVykKxvjhovNJD3j/SG8BGyeNxr/XpwNGh4w==
X-Received: by 2002:a05:6000:4694:b0:482:ee81:f0ca with SMTP id
 ffacd0b85a97d-485872a56e6mr30904464f8f.12.1788964444226; 
 Wed, 09 Sep 2026 07:34:04 -0700 (PDT)
Received: from [10.5.90.78]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485885bfe14sm44769823f8f.35.2026.09.09.07.34.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2026 07:34:03 -0700 (PDT)
Message-ID: <03ed7bbd-66eb-456f-ad79-07188a4ea2df@smile.fr>
Date: Wed, 9 Sep 2026 16:34:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: El Mehdi YOUNES <elmehdi.younes@smile.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>, Romain Naour <romain.naour@gmail.com>
References: <20260906233048.692559-1-bernd@kuhls.net>
 <20260906233048.692559-5-bernd@kuhls.net>
Content-Language: fr
In-Reply-To: <20260906233048.692559-5-bernd@kuhls.net>
Subject: Re: [Buildroot] [PATCH 5/6] package/mesa-libclc: new package
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

SGVsbG8gQmVybmQsIEFsbCwKCkxlIDA3LzA5LzIwMjYgw6AgMDE6MzAsIEJlcm5kIEt1aGxzIGEg
w6ljcml0wqA6Cj4gU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4K
PiAtLS0KPiAgREVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ICBw
YWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4gIHBhY2thZ2UvbWVz
YS1saWJjbGMvQ29uZmlnLmluICAgICAgICB8IDEzICsrKysrKysrKwo+ICBwYWNrYWdlL21lc2Et
bGliY2xjL21lc2EtbGliY2xjLmhhc2ggfCAgMyArKwo+ICBwYWNrYWdlL21lc2EtbGliY2xjL21l
c2EtbGliY2xjLm1rICAgfCA0MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDUgZmls
ZXMgY2hhbmdlZCwgNjAgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2Fn
ZS9tZXNhLWxpYmNsYy9Db25maWcuaW4KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbWVz
YS1saWJjbGMvbWVzYS1saWJjbGMuaGFzaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9t
ZXNhLWxpYmNsYy9tZXNhLWxpYmNsYy5tawo+IAo+IGRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIv
REVWRUxPUEVSUwo+IGluZGV4IDFmZDkzYjFkZTUuLjAxOWI1MjdmNTQgMTAwNjQ0Cj4gLS0tIGEv
REVWRUxPUEVSUwo+ICsrKyBiL0RFVkVMT1BFUlMKPiBAQCAtNDY5LDYgKzQ2OSw3IEBAIEY6CXBh
Y2thZ2UvbGliemlwcHAvCj4gIEY6CXBhY2thZ2UvbGludXgtZmlybXdhcmUvCj4gIEY6CXBhY2th
Z2UvbWMvCj4gIEY6CXBhY2thZ2UvbWVzYTNkLwo+ICtGOglwYWNrYWdlL21lc2EtbGliY2xjLwo+
ICBGOglwYWNrYWdlL21pbmlkbG5hLwo+ICBGOglwYWNrYWdlL21qcGctc3RyZWFtZXIvCj4gIEY6
CXBhY2thZ2UvbXBnMTIzLwo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL0NvbmZpZy5pbiBiL3BhY2th
Z2UvQ29uZmlnLmluCj4gaW5kZXggMzA3ZjdjZTg2YS4uYjRkN2YzYzEzMyAxMDA2NDQKPiAtLS0g
YS9wYWNrYWdlL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvQ29uZmlnLmluCj4gQEAgLTIyNzEs
NiArMjI3MSw3IEBAIGVuZGlmCj4gIAlzb3VyY2UgInBhY2thZ2UvbGx2bS1wcm9qZWN0L2xsdm0v
Q29uZmlnLmluIgo+ICAJc291cmNlICJwYWNrYWdlL2x0dG5nLWxpYnVzdC9Db25maWcuaW4iCj4g
IAlzb3VyY2UgInBhY2thZ2UvbWF0aW8vQ29uZmlnLmluIgo+ICsJc291cmNlICJwYWNrYWdlL21l
c2EtbGliY2xjL0NvbmZpZy5pbiIKPiAgCXNvdXJjZSAicGFja2FnZS9tcGMvQ29uZmlnLmluIgo+
ICAJc291cmNlICJwYWNrYWdlL21wZGVjaW1hbC9Db25maWcuaW4iCj4gIAlzb3VyY2UgInBhY2th
Z2UvbXBmci9Db25maWcuaW4iCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbWVzYS1saWJjbGMvQ29u
ZmlnLmluIGIvcGFja2FnZS9tZXNhLWxpYmNsYy9Db25maWcuaW4KPiBuZXcgZmlsZSBtb2RlIDEw
MDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjYyMGJmYjEzZTgKPiAtLS0gL2Rldi9udWxsCj4gKysr
IGIvcGFja2FnZS9tZXNhLWxpYmNsYy9Db25maWcuaW4KPiBAQCAtMCwwICsxLDEzIEBACj4gK2Nv
bmZpZyBCUjJfUEFDS0FHRV9NRVNBX0xJQkNMQwoKSSBndWVzcyBtZXNhLWxpYmNsYyBhbmQgbGli
Y2xjIHNob3VsZCBub3QgYmUgc2VsZWN0ZWQgYXQgdGhlIHNhbWUgdGltZS4KCj4gKwlib29sICJt
ZXNhLWxpYmNsYyIKPiArCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfTExWTQo+ICsJc2VsZWN0IEJS
Ml9QQUNLQUdFX0xMVk1fQU1ER1BVCgpXaHk/IFRoaXMgaXMgdXN1YWxseSBzZWxlY3RlZCBieSBB
VEkvQU1EIGRyaXZlci4KCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTExWTV9SVFRJCgpUaGlzIGlz
IGFscmVhZHkgc2VsZWN0ZWQgYnkgcnVzdGljbCBzdXBwb3J0IHRoYXQgcmVxdWlyZXMgbGliY2xj
IGF0IHJ1bnRpbWUuCgo+ICsJaGVscAo+ICsJICBUaGlzIGlzIGEgZm9yayBvZiBMTFZNJ3MgbGli
Y2xjIGFwcGx5aW5nIHNvbWUgZml4ZXMgb2YgYQo+ICsJICBrbm93biBnb29kIHN0YXRlIHRvIGJl
IHVzZWQgYnkgTWVzYTNELgo+ICsKPiArCSAgaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3Jn
L2thcm9saGVyYnN0L21lc2EtbGliY2xjCj4gKwo+ICtjb21tZW50ICJtZXNhLWxpYmNsYyBuZWVk
cyBsbHZtIgo+ICsJZGVwZW5kcyBvbiAhQlIyX1BBQ0tBR0VfTExWTQo+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL21lc2EtbGliY2xjL21lc2EtbGliY2xjLmhhc2ggYi9wYWNrYWdlL21lc2EtbGliY2xj
L21lc2EtbGliY2xjLmhhc2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAw
MDAuLmEwMzI3NDg2N2UKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9tZXNhLWxpYmNs
Yy9tZXNhLWxpYmNsYy5oYXNoCj4gQEAgLTAsMCArMSwzIEBACj4gKyMgTG9jYWxseSBjYWxjdWxh
dGVkCj4gK3NoYTI1NiAgYzc3ZmMxMTA0ZmJjMmQyNTRhNDhkMjE3NmEzM2NiZWM5MTVkZGU5YTQ4
YmVkYTdhMjc0ZjJlODM3Yjc5NjM4NiAgbWVzYS1saWJjbGMtMjIuMS44LjMtZ2l0NC50YXIuZ3oK
PiArc2hhMjU2ICAzYzUzNmMwNTJkYjlhZmQ5OTc4MDllMzg3ODVjOWYyYTllNTRlMjg5MjMzMGZh
N2M1YjQzOGUxOGE3NDEzNDc5ICBMSUNFTlNFLlRYVAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL21l
c2EtbGliY2xjL21lc2EtbGliY2xjLm1rIGIvcGFja2FnZS9tZXNhLWxpYmNsYy9tZXNhLWxpYmNs
Yy5tawo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uNjJkN2ZlZjY5
ZQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL21lc2EtbGliY2xjL21lc2EtbGliY2xj
Lm1rCj4gQEAgLTAsMCArMSw0MiBAQAo+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsjCj4g
KyMgbWVzYS1saWJjbGMKPiArIwo+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsKPiArTUVT
QV9MSUJDTENfVkVSU0lPTiA9IDIyLjEuOC4zCgpUaGlzIHZlcnNpb24gaXMgY3VyZW50bHkgaW4g
c3luYyB3aXRoIGxsdm0tcHJvamVjdCBwYWNrYWdlcyB2ZXJzaW9uIGJ1dCBjYW4gYnVtcAp0aGVt
IGF0IGFueXRpbWUuCgpIYXZlIHlvdSBjb25zaWRlcmVkIGFkZGluZyBtZXNhIGNoYW5nZXMgdG8g
bGx2bS1saWJjbGMgcGFja2FnZSBpdHNlbGY/CgpodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5v
cmcva2Fyb2xoZXJic3QvbWVzYS1saWJjbGMvLS9ibG9iL21haW4vUkVBRE1FLm1kP3JlZl90eXBl
PWhlYWRzJnBsYWluPTEjTDE5CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gK01FU0FfTElCQ0xD
X1NJVEUgPSBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcva2Fyb2xoZXJic3QvbWVzYS1s
aWJjbGMuZ2l0Cj4gK01FU0FfTElCQ0xDX1NJVEVfTUVUSE9EID0gZ2l0Cj4gK01FU0FfTElCQ0xD
X0xJQ0VOU0UgPSBBcGFjaGUtMi4wIHdpdGggZXhjZXB0aW9ucyBvciBNSVQKPiArTUVTQV9MSUJD
TENfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UuVFhUCj4gK01FU0FfTElCQ0xDX0RFUEVOREVOQ0lF
UyA9IGhvc3QtY2xhbmcgaG9zdC1sbHZtIGhvc3Qtc3BpcnYtbGx2bS10cmFuc2xhdG9yCj4gK0hP
U1RfTUVTQV9MSUJDTENfREVQRU5ERU5DSUVTID0gaG9zdC1jbGFuZyBob3N0LWxsdm0gaG9zdC1z
cGlydi1sbHZtLXRyYW5zbGF0b3IKPiArTUVTQV9MSUJDTENfSU5TVEFMTF9TVEFHSU5HID0gWUVT
Cj4gKwo+ICsjIENNQUtFXypfQ09NUElMRVJfRk9SQ0VEPU9OIHNraXBzIHRlc3RpbmcgdGhlIHRv
b2xzIGFuZCBhc3N1bWVzCj4gKyMgbGx2bS1jb25maWcgcHJvdmlkZWQgdmFsdWVzCj4gKyMKPiAr
IyBDTUFLRV8qX0NPTVBJTEVSIGhhcyB0byBiZSBzZXQgdG8gdGhlIGhvc3QgY29tcGlsZXIgdG8g
YnVpbGQgYSBob3N0Cj4gKyMgJ3ByZXBhcmVfYnVpbHRpbnMnIHRvb2wgdXNlZCBkdXJpbmcgdGhl
IGJ1aWxkIHByb2Nlc3MKPiArIwo+ICsjIFRoZSBoZWFkZXJzIGFyZSBpbnN0YWxsZWQgaW4gL3Vz
ci9zaGFyZSBhbmQgbm90IC91c3IvaW5jbHVkZSwKPiArIyBiZWNhdXNlIHRoZXkgYXJlIG5lZWRl
ZCBhdCBydW50aW1lIG9uIHRoZSB0YXJnZXQgdG8gYnVpbGQgdGhlIE9wZW5DTAo+ICsjIGtlcm5l
bHMuCj4gK01FU0FfTElCQ0xDX0NPTkZfT1BUUyA9IFwKPiArCS1EQ01BS0VfU1lTUk9PVD0iIiBc
Cj4gKwktRENNQUtFX0NfQ09NUElMRVJfRk9SQ0VEPU9OIFwKPiArCS1EQ01BS0VfSU5TVEFMTF9E
QVRBRElSPSJzaGFyZSIgXAo+ICsJLURDTUFLRV9GSU5EX1JPT1RfUEFUSD0iJChIT1NUX0RJUiki
IFwKPiArCS1EQ01BS0VfQ19GTEFHUz0iJChIT1NUX0NGTEFHUykiIFwKPiArCS1EQ01BS0VfRVhF
X0xJTktFUl9GTEFHUz0iJChIT1NUX0xERkxBR1MpIiBcCj4gKwktRENNQUtFX1NIQVJFRF9MSU5L
RVJfRkxBR1M9IiQoSE9TVF9MREZMQUdTKSIgXAo+ICsJLURDTUFLRV9NT0RVTEVfTElOS0VSX0ZM
QUdTPSIkKEhPU1RfTERGTEFHUykiIFwKPiArCS1EQ01BS0VfQ19DT01QSUxFUj0iJChDTUFLRV9I
T1NUX0NfQ09NUElMRVIpIiBcCj4gKwktRExMVk1fQ01BS0VfRElSPSIkKEhPU1RfRElSKS9saWIv
Y21ha2UvbGx2bSIgXAo+ICsJLURMSUJDTENfQ1VTVE9NX0xMVk1fVE9PTFNfQklOQVJZX0RJUj0i
JChIT1NUX0RJUikvYmluIgo+ICsKPiArSE9TVF9NRVNBX0xJQkNMQ19DT05GX09QVFMgPSBcCj4g
KwktRExJQkNMQ19UQVJHRVRTX1RPX0JVSUxEPXNwaXJ2NjQtbWVzYTNkLQo+ICsKPiArJChldmFs
ICQoY21ha2UtcGFja2FnZSkpCj4gKyQoZXZhbCAkKGhvc3QtY21ha2UtcGFja2FnZSkpCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
