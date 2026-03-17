Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A19FF6E82
	for <buildroot@archiver.kernel.org>; Tue, 17 Mar 2026 21:12:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C99214101B;
	Tue, 17 Mar 2026 21:12:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vwf1cU7MNp33; Tue, 17 Mar 2026 21:12:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E735041039
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773781927;
	bh=vO1/SCqNdlA4e15rveHdCneV/t0WBRCd4haZagHXJYU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rBk8+zhHWsNQmA2gjwzDSOgHltdwB05whn3dWN93uU7q77CPMteYIago428e8zDBP
	 upPMe+sLRxc4R1l8qMR+6RmYeki0do/Yx1dNxgMGJ+kYOeVIPBZVWSBLu5I1vFVUhk
	 hgHNbPWQd5+reVW/cYckcYjcd7awxexdWQLSkmoustzf5XznnIjNWDjSi9HYbQrUxp
	 KLWRyeDzGK2eMYkuBTOiUNICC85s7Aqi6gSKVTsoZFwf2+AEO3aK3bGXNVodD/DFS5
	 z4+Bzd5Mzm+eAP8A+vKtMlJ2P9Nugb0rG89qhwQCFmz0s0Lbg6u94XUFPoqeqH4/Aq
	 R1BClBUoQ+Gqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E735041039;
	Tue, 17 Mar 2026 21:12:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C21B1B6
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 21:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A1AF606C2
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 21:12:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JTe6-avbqh1l for <buildroot@buildroot.org>;
 Tue, 17 Mar 2026 21:12:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2F307606B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F307606B4
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2F307606B4
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 21:12:02 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-43b41b545d9so3462194f8f.2
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 14:12:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773781921; x=1774386721;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C7dMwEJRcOlARiLJhUk8z8K8TsU5Jd7iOzJphAk1TTw=;
 b=YVzJazxsQz00mgsrdAuxFKNtbCjnE1qyhTdQDnyi/ngCm4VyTMZfkjwscK+NvdvCjd
 5qnRsMYozO1l85CVCBdoTSyMeTSUCpCtyX+v2OwFmaTvJ+7I4QKxL7dH7pOUGsAL88uI
 1gcibgDRbPwhAp2NFCH+s9LcXfF5jtQSMLhM8YvWqbqRJKv7PYIYvIoMo1dB+Z7mvpwR
 AyzQF6QUizLXxHEr+JmaiWIkeg4oEEasEMmfXDjjSMf7rpI9iNoWuGiJa/w7ilRum1az
 gvN0qD4VbZpMyfprLQLGLrSeabcMkCsyz7Fvjbk6S70r102iWv57/rbrhDKRhYIMmKPa
 s09A==
X-Gm-Message-State: AOJu0YzvCNAi73mnRX5Z44Vr7Jx8BkacwMUacJumHw7zQRYJsNO/WLGv
 fanLR0lImSmszG2ADNQD0E9R8ppTDSdyvMw2aG8eUiYEPmLJSca+Pykb2IHvwxG+yjjAk1Fv5RA
 GqNLS
X-Gm-Gg: ATEYQzznfrA6/9pHuQLIjSffbYiRQRsGAQXspMclM+J1rcGPoIIxE1oSgAkQypYWKam
 s+xKLZ1ynj9GsTEG+YicreUm1Fyq87lpXPfxuL2cInR0Pp6xM/TxF1kEmEUtzhbn7gQl9cAf4cL
 UKnPq/7dkMPaoOuBRiL4KiOSws5LoPxqs2wZ0gcz9o1kitgQyYyk8CNP0mbDjKaveblv/og2/ra
 YqFKn1iXlOUWWUMLHDGGdlPgVlTRoUBe09pvAwLxkxPDkxwrcwDnHslS5Bf76miLUEAYHZsS9g2
 VKInbXvjQHMcyhmG7I6/35Kdf1G2sVWTDAvdd356trT0pLEqlBmylytXfFm74lozvojDUwSdkdy
 u3JFFFyi4UdRTEyfNC+TDLxKWSWnBBVA66aVxv78sqRs85dkHJz3kksdMLuvhXDDO5+TbQXkM8G
 CqioRG+xwBKQiyylZse4axmr60xIfBPjQCL4Yl6afJ1agU3P10bsNLsgi5A1QcD0d5npCV9WHbY
 JgSRyJZ/FcPX7zxVz9zZxljImqzo1ZoXWOuHM4mFTSJhg+oDj6dAntu7iVZI5Gq0g==
X-Received: by 2002:a05:6000:a86:b0:43b:5192:88cc with SMTP id
 ffacd0b85a97d-43b527c8282mr787441f8f.46.1773781920689; 
 Tue, 17 Mar 2026 14:12:00 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b518588a0sm3434146f8f.16.2026.03.17.14.11.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Mar 2026 14:11:59 -0700 (PDT)
Message-ID: <94652818-41ae-4504-b724-a7a70a892457@smile.fr>
Date: Tue, 17 Mar 2026 22:11:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>,
 Fabien Lehoussel <fabien.lehoussel@smile.fr>
Cc: buildroot@buildroot.org
References: <20260224133341.1711806-1-fabien.lehoussel@smile.fr>
 <20260224140850.96741-1-thomas.perale@mind.be>
Content-Language: fr
In-Reply-To: <20260224140850.96741-1-thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1773781921; x=1774386721; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C7dMwEJRcOlARiLJhUk8z8K8TsU5Jd7iOzJphAk1TTw=;
 b=GzhegXI+4lEsZizydBoYtZy8iSCXFEQZr2B70uhCJifpftu60/MsW7Xr/CdNu1jo6y
 2IwauxSMeITOa8FGeV+6N2JDjgKhohwuRga5h8LnGDz/FNYl3GNWKtp/eIfPL1Ls07Vv
 ZeE0Rn1FWNKG9rItlgWFkPcQkpGgJC9ZScgeo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=GzhegXI+
Subject: Re: [Buildroot] [PATCH 1/1] cve-check: fix CVE URL format
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

SGVsbG8gRmFiaWVuLCBUaG9tYXMsIEFsbCwKCkxlIDI0LzAyLzIwMjYgw6AgMTU6MDgsIFRob21h
cyBQZXJhbGUgdmlhIGJ1aWxkcm9vdCBhIMOpY3JpdMKgOgo+IFRoYW5rcyBGYWJpZW4uCj4gCj4g
QWNrZWQtQnk6IFRob21hcyBQZXJhbGUgPHRob21hcy5wZXJhbGVAbWluZC5iZT4KCkFwcGxpZWQg
dG8gbWFzdGVyLCB0aGFua3MuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4gSW4gcmVwbHkg
b2Y6Cj4+IFVwZGF0ZSBOVkQgc291cmNlIHRvIGZ1bGwgVVJMIGZvcm1hdCBmb2xsb3dpbmcgQ3lj
bG9uZURDIDEuNgo+PiBzcGVjaWZpY2F0aW9uIFsxXS4KPj4KPj4gQmVmb3JlOiAidXJsIjogImh0
dHBzOi8vbnZkLm5pc3QuZ292LyIKPj4gQWZ0ZXI6ICAidXJsIjogImh0dHBzOi8vbnZkLm5pc3Qu
Z292L3Z1bG4vZGV0YWlsL0NWRS1YWFhYIgo+Pgo+PiBbMV0gaHR0cHM6Ly9jeWNsb25lZHgub3Jn
L2RvY3MvMS42L2pzb24vI3Z1bG5lcmFiaWxpdGllc19pdGVtc19zb3VyY2VfdXJsCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IEZhYmllbiBMZWhvdXNzZWwgPGZhYmllbi5sZWhvdXNzZWxAc21pbGUuZnI+
Cj4gCj4+IC0tLQo+PiAgc3VwcG9ydC9zY3JpcHRzL2N2ZS1jaGVjayB8IDIgKy0KPj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0
IGEvc3VwcG9ydC9zY3JpcHRzL2N2ZS1jaGVjayBiL3N1cHBvcnQvc2NyaXB0cy9jdmUtY2hlY2sK
Pj4gaW5kZXggZmYxNGU0YjIzOC4uYmNkOTcwYmFkOCAxMDA3NTUKPj4gLS0tIGEvc3VwcG9ydC9z
Y3JpcHRzL2N2ZS1jaGVjawo+PiArKysgYi9zdXBwb3J0L3NjcmlwdHMvY3ZlLWNoZWNrCj4+IEBA
IC0xMzEsNyArMTMxLDcgQEAgZGVmIG52ZF9jdmVfdG9fY2R4X3Z1bG5lcmFiaWxpdHkobnZkX2N2
ZSk6Cj4+ICAgICAgICAgICJkZXNjcmlwdGlvbiI6IGN2ZV9hcGlfZ2V0X2xhbmdfZnJvbV9saXN0
KG52ZF9jdmUuZ2V0KCJkZXNjcmlwdGlvbnMiLCBbXSkpIG9yICIiLAo+PiAgICAgICAgICAic291
cmNlIjogewo+PiAgICAgICAgICAgICAgIm5hbWUiOiAiTlZEIiwKPj4gLSAgICAgICAgICAgICJ1
cmwiOiAiaHR0cHM6Ly9udmQubmlzdC5nb3YvIgo+PiArICAgICAgICAgICAgInVybCI6IGYiaHR0
cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwve252ZF9jdmVbJ2lkJ119Igo+PiAgICAgICAg
ICB9LAo+PiAgICAgICAgICAqKih7Cj4+ICAgICAgICAgICAgICAicHVibGlzaGVkIjogbnZkX2N2
ZVsicHVibGlzaGVkIl0sCj4+IC0tIAo+PiAyLjQzLjAKPj4KPj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+
PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
