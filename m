Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23973107BCE8
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 22:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3D9960603;
	Fri, 13 Mar 2026 22:27:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hyCK7b5w5LHv; Fri, 13 Mar 2026 22:27:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE91260BA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773440837;
	bh=jILyg8K1cMfT6fFog+kahiENiAkyy17MurMDvGBAA+M=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=TbBvr2TJqOrxPAbvBYr8T+t9rsbihZGJClk2P7qIbkXyh7ZEy26NU7UrHVab7xbsL
	 hIl89rj1hEcFkt7FkAeDSG/+tFX1znevzdf8dHipey6XzVUrbWjIyA/4G7e3vg32VD
	 2uzBZO6IjfmsPt2ul2qPFyslj3ZHb7fOUAfmxOjmxeKRIsEnMukwoDcK1JULMo7pA8
	 MWBYIRjwCx+N8osYJZwtd1jxXU/UF6N74fqo+9hVwgqm99swu+VcruiwX+Mp6w6Gwu
	 5R935Kty77HtoQdVSqFz9zmkPy+3Wkuozc1DqjutMTuNo84352qTcPUINSUgkFVXxc
	 2Ef35X/IO8JBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE91260BA7;
	Fri, 13 Mar 2026 22:27:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 92ACF1B4
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 22:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8476960BA7
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 22:27:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YNrD-EzahkuY for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 22:27:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 88E7B60603
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88E7B60603
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 88E7B60603
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 22:27:14 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4853e1ce427so29924455e9.3
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 15:27:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773440832; x=1774045632;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+Zd35pmnrKEOOLjI47Wqv+ASkigT6Ap2MigYOuVzWyA=;
 b=c3Qg1bKt8Bc23xO108X28FPuY67IaVMuwZgM7lR8UaN/WxgHy5nZE6tteYg1Fq1W44
 XTguiWgUYOQ74YtvfXxykF4ItzBlF5gc0T4DWK/mtxBJPVn2Fai4DUTDAoEdZG3CCMiJ
 shYTEHU19Hr+hvR0MMYvQ9+wy+JxPW9IWkOx20lLKRzIDDU15ao1mhv9qfZTYGNGDI0Q
 Eg6PQ+UrmE4bNhzbMP3kKcbElb/RCoJRpXMfafEJy/d1csG08BvoiF6tHSZYe/1+Ivsj
 3Nl7Jqg3RS0iNumVBtJW3leUAun6XA29zWjuF7XPcIO1DpUeebFnyT2kOB4ti4qHJ3Wm
 9aww==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFTwSrmXM5O80Qk13DtyQC1Dnj2jRduwsaFb0+hXKf2yytwWgQLP1ExjB5G4UZqlb2/kjU/5wIARk=@buildroot.org
X-Gm-Message-State: AOJu0YwAItL2MIv0duoCy/vSA3f7T/s571W3BMT7h2cbIBXEUisAT5Ti
 r/6Upf9AZZQ025TJ87omUXIPKvTLrrnBG/0Z2r13FL5oJbHhltrutRd+RJAvBX1fp5jJ1ZUi0Qc
 S4xpw
X-Gm-Gg: ATEYQzxrcVvIZNiuaSVXCYo7Ozm6jVWh4h0JgZHObRpGHqNTi7pCfcBLknzFCBr3Ut0
 QxX/ctjM6l1cCcVC21FN2ho3/7dG/FLFpdkjHpx1hhEW+8uRja9bRNqmqZwlUKRgc5HDxmnGWJB
 lEqxKp0UE+qVwVTS310UdqbQVYLvQZAi/ORykUOiGouA/cRuL9GFXrSgkWWpxGXOzhBm3Pj2X3o
 gmbw1srEJ3iwTMyiiNElnDmIkR3uMKbP8nVxXSHhSjakSyxAOhorsZpOralJWzIZ1Vu3+gsqqxS
 UfB+Ll9daslstbLdAOA0o3nIWnG5qrrvy/35CND6jfJeRgMZwoRm3SM7VTSRqdCdeKSKcY/Zvog
 FICtFJeAFJPY86mMaxWrrKn8vVDCZxGOq3eU30EJqHiywa2zok7/SKXkZjYe6r4sKNVJKC0ONIK
 kfFxaOtzH+1/RIyEDuOHJeiMT7PdR5G4qzhXiVz97roZrJoYkLct343Xf/VNDmO6TvbZHRnKXOu
 wF5wU1A+kljjgXfMtou4ZQOzyCQJFdCUYMexy+Uz21Jx3uPj+yfjMBgfXVZ/6ykfA==
X-Received: by 2002:a05:600c:4689:b0:485:513d:668c with SMTP id
 5b1f17b1804b1-4855670bedfmr72507225e9.25.1773440832161; 
 Fri, 13 Mar 2026 15:27:12 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8cda1fbcd23sm746094385a.1.2026.03.13.15.27.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2026 15:27:11 -0700 (PDT)
Message-ID: <f744e2cb-bcaf-4db1-81ea-295c41188b95@smile.fr>
Date: Fri, 13 Mar 2026 23:27:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
References: <20260309075127.801847-1-neal.frager@amd.com>
 <20260309075127.801847-2-neal.frager@amd.com>
Content-Language: fr, en-US
In-Reply-To: <20260309075127.801847-2-neal.frager@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1773440832; x=1774045632; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+Zd35pmnrKEOOLjI47Wqv+ASkigT6Ap2MigYOuVzWyA=;
 b=DZmC5KckzYKeiEqtU8RPFZcv8eEnKh8j9Xy8ynFJPfIdlX2FsRwBgw6eft2zLLQQxa
 lwAF2U34l5/0mc3rkfskI9w5IWn7WT2Zbw9rIWJMCuRpcllqa9X0buTVMyXYod9PigY6
 /Y5jSM2EFPOl69u5I8Hl/RfPbi1JG19i7h9Ms=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=DZmC5Kck
Subject: Re: [Buildroot] [PATCH v2 2/2] board/versal2/post-image.sh: add
 custom hardware support
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 yann.morin@orange.com, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@gmail.com, michal.simek@amd.com,
 fiona.klute@gmx.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gTmVhbCwgQWxsLAoKTGUgMDkvMDMvMjAyNiDDoCAwODo1MSwgTmVhbCBGcmFnZXIgYSDD
qWNyaXTCoDoKPiBVc2VycyB3aWxsIHVsdGltYXRlbHkgbmVlZCB0aGUgQlIyX0xJTlVYX0tFUk5F
TF9DVVNUT01fRFRTX0RJUiBjb25maWcgdG8KPiBpbXBvcnQgY3VzdG9tIGR0cyBmaWxlcyBmb3Ig
Y3VzdG9tIHZlcnNhbDIgaGFyZHdhcmUuIEltcHJvdmUgdGhlIHBvc3QtaW1hZ2Uuc2gKPiB0byBz
dXBwb3J0IGVpdGhlciB0aGUgZGVmYXVsdCBkZXZpY2UgdHJlZSB3aGljaCBjb21lcyBmcm9tIHUt
Ym9vdCBvciBhCj4gY3VzdG9tIGRldmljZSB0cmVlIGZvciBjdXN0b20gaGFyZHdhcmUuCj4gCj4g
VG8ga2VlcCB0aGUgZXhhbXBsZSBwb3N0LWltYWdlIHNjcmlwdCBhcyBzaW1wbGUgYXMgcG9zc2li
bGUsIGl0IGFzc3VtZXMgdGhhdAo+IHRoZSBmaXJzdCBEVEIgaW4gdGhlIExJTlVYX0RUQlMgbGlz
dCBpcyB0aGUgb25lIGZvciBjcmVhdGluZyB0aGUgc3lzdGVtLmR0Ygo+IGZpbGVuYW1lIHRoYXQg
dS1ib290IHdpbGwgdXNlIGZvciBib290aW5nLiBVc2VycyBhcmUgZnJlZSB0byBpbXBsZW1lbnQg
dGhlaXIKPiBvd24gcG9zdC1pbWFnZSBzY3JpcHRzIGZvciB1c2UgY2FzZXMgd2l0aCBtdWx0aXBs
ZSBEVEJzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE5lYWwgRnJhZ2VyIDxuZWFsLmZyYWdlckBhbWQu
Y29tPgo+IC0tLQo+IFYxLT5WMjoKPiAtIG5ldyB0byBwYXRjaCBzZXJpZXMKPiAtLS0KPiAgYm9h
cmQvdmVyc2FsMi9wb3N0LWltYWdlLnNoIHwgMTYgKysrKysrKysrKysrLS0tLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvYm9hcmQvdmVyc2FsMi9wb3N0LWltYWdlLnNoIGIvYm9hcmQvdmVyc2FsMi9wb3N0LWltYWdl
LnNoCj4gaW5kZXggYWY1MDkwOWZiMS4uZGJlZjMzZGIyOCAxMDA3NTUKPiAtLS0gYS9ib2FyZC92
ZXJzYWwyL3Bvc3QtaW1hZ2Uuc2gKPiArKysgYi9ib2FyZC92ZXJzYWwyL3Bvc3QtaW1hZ2Uuc2gK
PiBAQCAtMSw5ICsxLDE3IEBACj4gICMhL2Jpbi9zaAo+ICAKPiAtIyBCeSBkZWZhdWx0IFUtQm9v
dCBsb2FkcyBEVEIgZnJvbSBhIGZpbGUgbmFtZWQgInN5c3RlbS5kdGIiLCBhbmQKPiAtIyB3aXRo
IHZlcnNhbDIsIHRoZSBMaW51eCBEVEIgaXMgdGhlIHNhbWUgYXMgdGhlIFUtQm9vdCBEVEIsIHNv
Cj4gLSMgbGV0J3MgdXNlIGEgc3ltbGluayBzaW5jZSB0aGUgRFRCIGlzIHRoZSBzYW1lLgo+IC1s
biAtZnMgInUtYm9vdC5kdGIiICIke0JJTkFSSUVTX0RJUn0vc3lzdGVtLmR0YiIKCj4gKyMgQnkg
ZGVmYXVsdCBVLUJvb3QgbG9hZHMgRFRCIGZyb20gYSBmaWxlIG5hbWVkICJzeXN0ZW0uZHRiIi4K
PiArIyBXaXRoIHZlcnNhbDIsIHRoZXJlIGlzIG5vIGRlZmF1bHQgZHRzIGluIHRoZSBMaW51eCBr
ZXJuZWwgdHJlZQo+ICsjIGJlY2F1c2UgdGhlIGRlZmF1bHQgaXMgdGhlIHNhbWUgYXMgdGhlIHUt
Ym9vdC5kdGIuIFRoaXMgbWVhbnMKPiArIyBpdCBpcyBuZWNlc3NhcnkgdG8gY292ZXIgdHdvIGNh
c2VzLCBhIGN1c3RvbSBkdHMgb3IgdGhlIGRlZmF1bHQuCj4gKyMgVGhlIEJSMl9MSU5VWF9LRVJO
RUxfRFRTX1NVUFBPUlQgd2lsbCBvbmx5IGJlIHNldCBmb3IgY3VzdG9tIGR0cwo+ICsjIGZpbGVz
LCBzbyBpdCBjYW4gYmUgdXNlZCBmb3IgY2hlY2tpbmcgd2hpY2ggY2FzZSBpcyBjb25maWd1cmVk
Lgo+ICtpZiBncmVwIC1FcSAiXkJSMl9MSU5VWF9LRVJORUxfRFRTX1NVUFBPUlQ9eSQiICIke0JS
Ml9DT05GSUd9IjsgdGhlbgo+ICsJTElOVVhfRFRCUz0iJChtYWtlIC0tbm8tcHJpbnQtZGlyZWN0
b3J5IFZBUlM9TElOVVhfRFRCUyBwcmludHZhcnMpIgo+ICsJbG4gLWZzICIkKGJhc2VuYW1lICR7
TElOVVhfRFRCUyUlICp9KSIgIiR7QklOQVJJRVNfRElSfS9zeXN0ZW0uZHRiIgoKVGhpcyB0cmln
Z2VyIGEgc2hlbGxzaGVjayB3YXJuaW5nLCBjYW4geW91IGRvdWJsZSBjaGVjaz8KCkknbSBub3Qg
c3VyZSBhYm91dCB0aGlzIGNoYW5nZSwgTElOVVhfRFRCUyBtYXkgYWxzbyBjb250YWluIGEgZHRi
by4KV2hhdCBoYXBwZW4gaWYgYSBkZXZpY2V0cmVlIG92ZXJsYXkgaXMgYnVpbHQ/CgpCZXN0IHJl
Z2FyZHMsClJvbWFpbgoKCj4gK2Vsc2UKPiArCWxuIC1mcyAidS1ib290LmR0YiIgIiR7QklOQVJJ
RVNfRElSfS9zeXN0ZW0uZHRiIgo+ICtmaQo+ICAKPiAgQk9BUkRfRElSPSIkKGRpcm5hbWUgIiQw
IikiCj4gIAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
