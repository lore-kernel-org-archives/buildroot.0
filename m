Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F212CD4851
	for <buildroot@archiver.kernel.org>; Thu, 14 May 2026 13:06:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CDAF60E82;
	Thu, 14 May 2026 13:06:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tWrFP4x2FktX; Thu, 14 May 2026 13:06:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0304260E7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778764015;
	bh=+V+00xlyiFXhygkihXpNqijA+2KfzovZlKnG4Lnyd1c=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MNl1vOdmOFhfjutJT8aAMy13MMZjhk7KE8aKocfM6aAW8I5hVT34NlvFSF80f4jr9
	 G4AeXUVCWBkjxu6mpt2BeX2FRd9yCXQ+4WSucl75v4vBuPxV3bb9mp/M/hHtVCt1lV
	 sBbZ6dNT5IwE/giMMJw2SPBDREyMcgzrrXgLC9jeyCf6hDWXC2leu2ZIuH/xTBkO5O
	 lt1p8WnF5KtyVCTjyrKHUUNKEkjuD8LneEo4hBeblCxBKEbd30ITsqBajgGNGia783
	 RuEJizRl+8B/WLB9snl2FgC+5IiN8PCbKlN/O4+qOzf48FC6X8vuMp3roiMIE9FBn/
	 nretuA96bIlBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0304260E7E;
	Thu, 14 May 2026 13:06:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AFEE736F
 for <buildroot@buildroot.org>; Thu, 14 May 2026 13:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A090406D6
 for <buildroot@buildroot.org>; Thu, 14 May 2026 13:06:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YwOfvLlxlVAm for <buildroot@buildroot.org>;
 Thu, 14 May 2026 13:06:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7A81B403F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A81B403F8
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A81B403F8
 for <buildroot@buildroot.org>; Thu, 14 May 2026 13:06:52 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4896c22fcbaso68900535e9.0
 for <buildroot@buildroot.org>; Thu, 14 May 2026 06:06:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778764010; x=1779368810;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lGkqrgiTpJ9mRsRd8aEysjdxeTpNZ0l9AOTYEu7IX+Q=;
 b=jpJ204KWwn/xRL57aD81k2dVeVRzVuujrXEQ6kIk75fQLcOwNYbSqwxjpOx4HbBbEO
 4jkoPxkB8VR+IaSSMJYXUxaE1U8Tz/9Ps7/QXyFdqWJOS5FVv19gxXNiUlZydM6ETly0
 /F6YLJIQZhontOF5P79bVIZXTcUKTfbL3d35N0j5y6aYsboMExVWGEEreYggWT+saOEp
 mxz794iEcSF38VUKfH+khmDd/SW2KaXDTO9/O2Yzp+4KrDnwQkP81vnM6Z3yUYZWIjTT
 CRLOs7AowTcx1O+vgh6IvaPqcwFMxD4m++9ueuPhY/48zfOD4JeT/A4e8ml9WFKfwVy4
 IuRA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+cO/KnpWtqoJcUp248vBXAhSp92qhsNC0rXJlbVsdDxj1OCw0lPhJOd03SnvDkQPsaOPvn4WmeVKM=@buildroot.org
X-Gm-Message-State: AOJu0YxAwjyefObuNrXpA8gVP5cdqzenysdf/r+UkXQ6MbLIwLvErxX3
 LZDyZONDoF1inaxebGduaj62Tb3FOrn7kWm3nR+p1qRcqRP3JkwvRuzQjsfi2unlVME=
X-Gm-Gg: Acq92OHdVix4BR0ARqs12HxQ/uSi8jJbSZnW7BlrKU65oqvcGCTSlTdDxY1CYqO/i43
 AZHCxbP2dzTnA5xEzpUetX2w4ooGEpLxr48+/XNANCsTEGDnalzahOPIH3wIyhZA8YCX3z6+yQN
 bDz5c4XiKnE2HS6+pNRflvNELas3M4dkAONRh/tdunutwsogkowNoBJU/9FzLCHXOk4XzgO61wm
 Y5zFqMQHbloacdW7UKs6iHvCHLvdKZMIaboPvTHY0Yw+hK/MoS+M5GDrTBAgrYCaGIJ+3oMTn8W
 FtBR0C7UIMkrm8tdBx3DMdHWTFOIkFwuLnSaPBuo0r/3btdknPCO2lEtju+R4eXpT9/JR6npGYL
 oHEclBmn2H1q6s22ZbTprEZwJCj9ErR7P3zol0vDs6163x+6Y7WglhqLe06bh79PFCS2yCPHE2q
 yCgoz43Gtg7LYx12a27fa7APjK41DF6KW3jOiVCXlQ81e+FtjMie1ROJl8nAzvzNDm9vj6Mq9++
 5FXMRKJ+rSuGmayLycia6Nz2vK3Rm4GP4YriD+02AglnuFDTkaOhvbkWx+J5ncKDg==
X-Received: by 2002:a05:600c:c048:b0:48f:e245:394e with SMTP id
 5b1f17b1804b1-48fe2453980mr10942985e9.27.1778764010278; 
 Thu, 14 May 2026 06:06:50 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fd769286csm18663555e9.33.2026.05.14.06.06.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 May 2026 06:06:49 -0700 (PDT)
Message-ID: <3aa97696-d579-40b2-8b29-224e02771f72@smile.fr>
Date: Thu, 14 May 2026 15:06:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joseph Kogut <joseph@anodize.com>, buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
References: <20260512-mesa3d-amdgpu-virtio-v2-0-30678b797df9@anodize.com>
 <20260512-mesa3d-amdgpu-virtio-v2-2-30678b797df9@anodize.com>
Content-Language: en-US
In-Reply-To: <20260512-mesa3d-amdgpu-virtio-v2-2-30678b797df9@anodize.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1778764010; x=1779368810; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lGkqrgiTpJ9mRsRd8aEysjdxeTpNZ0l9AOTYEu7IX+Q=;
 b=iOSq/vlh0cjTqYiYsu6ZXmsBahfEIrvy5d+Wyn0Epu6N2rQtrzBNKDaV3qULHc12/z
 cwAauCHOtYieGvi2wlg9JzhHeL3LFtxcBJ84IC//IeEdXAIToI4IIf75z7wDnCjTG/U1
 GBT2I+vlLQ82/0Fqo4J9BKBg+lpI/pv4ycRnE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=iOSq/vlh
Subject: Re: [Buildroot] [PATCH v2 2/4] package/mesa3d: add freedreno-virtio
 config
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

SGVsbG8gSm9zZXBoLAoKTGUgMTMvMDUvMjAyNiDDoCAwMDowNCwgSm9zZXBoIEtvZ3V0IGEgw6lj
cml0wqA6Cj4gQWRkIGEgY29uZmlnIGZvciBlbmFibGluZyB0aGUgZnJlZWRyZW5vIHZpcnRpbyBL
TUQgYmFja2VuZCwgaW4gdGhlIHNhbWUKPiBwYXR0ZXJuIGFzIGFtZGdwdS12aXJ0aW8uCj4gCj4g
U2lnbmVkLW9mZi1ieTogSm9zZXBoIEtvZ3V0IDxqb3NlcGhAYW5vZGl6ZS5jb20+Cj4gLS0tCj4g
IHBhY2thZ2UvbWVzYTNkL0NvbmZpZy5pbiB8IDEyICsrKysrKysrKysrKwo+ICBwYWNrYWdlL21l
c2EzZC9tZXNhM2QubWsgfCAxMCArKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjIgaW5z
ZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL21lc2EzZC9Db25maWcuaW4gYi9w
YWNrYWdlL21lc2EzZC9Db25maWcuaW4KPiBpbmRleCA2MzNmOWVlYzFmLi5kNGUwOTg3YTljIDEw
MDY0NAo+IC0tLSBhL3BhY2thZ2UvbWVzYTNkL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvbWVz
YTNkL0NvbmZpZy5pbgo+IEBAIC0xNTAsNiArMTUwLDcgQEAgY29uZmlnIEJSMl9QQUNLQUdFX01F
U0EzRF9HQUxMSVVNX0RSSVZFUl9GUkVFRFJFTk8KPiAgCSMgdGhlIHRvb2xjaGFpbiBoYXZpbmcg
c3luYzQgcHJpbWl0aXZlcywgd2hpY2ggaXMgYWx3YXlzIGEgZ2l2ZW4KPiAgCSMgZm9yIGFybS9h
YXJjaDY0Lgo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX01FU0EzRF9HQUxMSVVNX0RSSVZFUgo+ICsJ
c2VsZWN0IEJSMl9QQUNLQUdFX01FU0EzRF9IT1NUX05BVElWRV9DT05URVhUX1NVUFBPUlRFRF9E
UklWRVIKPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJEUk1fRlJFRURSRU5PCj4gIAloZWxwCj4g
IAkgIE1lc2EgZHJpdmVyIGZvciBGcmVlZHJlbm8gR1BVcy4KPiBAQCAtNDI4LDYgKzQyOSwxNyBA
QCBjb25maWcgQlIyX1BBQ0tBR0VfTUVTQTNEX0hPU1RfTkFUSVZFX0NPTlRFWFRfRFJJVkVSX0FN
REdQVQo+ICAJICBTZWxlY3QgdGhpcyB3aGVuIHJ1bm5pbmcgTWVzYSBpbnNpZGUgYSB2aXJ0dWFs
IG1hY2hpbmUKPiAgCSAgd2l0aCB2aXJ0aW8tZ3B1IGhvc3QgbmF0aXZlIGNvbnRleHQgc3VwcG9y
dC4KPiAgCj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9NRVNBM0RfSE9TVF9OQVRJVkVfQ09OVEVYVF9E
UklWRVJfRlJFRURSRU5PCj4gKwlib29sICJmcmVlZHJlbm8tdmlydGlvIgo+ICsJZGVwZW5kcyBv
biBCUjJfUEFDS0FHRV9NRVNBM0RfR0FMTElVTV9EUklWRVJfRlJFRURSRU5PCj4gKwloZWxwCj4g
KwkgIEVuYWJsZSBWaXJ0SU8gc3VwcG9ydCBmb3IgZnJlZWRyZW5vIG5hdGl2ZSBjb250ZXh0cwo+
ICsJICB1c2VkIGJ5IHRoZSBmcmVlZHJlbm8gKE9wZW5HTCkgYW5kIHR1cm5pcCAoVnVsa2FuKQo+
ICsJICBkcml2ZXJzLgoKVHVybmlwIChWdWxrYW4pIHN1cHBvcnQgaXMgYWRkZWQgYnkgdGhlIG5l
eHQgcGF0Y2gsIHRoZSBoZWxwIHRleHQgc2hvdWxkIG5vdAptZW50aW9uICJ0dXJuaXAgKFZ1bGth
bikgZHJpdmVycyIgeWV0LgoKT3RoZXJ3aXNlIHRoaXMgc2VyaWVzIGlzIG9rIGFzIGlzIGZvciBt
ZS4KClJldmlld2VkLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KCkJl
c3QgcmVnYXJkcywKUm9tYWluCgo+ICsKPiArCSAgU2VsZWN0IHRoaXMgd2hlbiBydW5uaW5nIE1l
c2EgaW5zaWRlIGEgdmlydHVhbCBtYWNoaW5lCj4gKwkgIHdpdGggdmlydGlvLWdwdSBob3N0IG5h
dGl2ZSBjb250ZXh0IHN1cHBvcnQuCj4gKwo+ICBjb25maWcgQlIyX1BBQ0tBR0VfTUVTQTNEX0hP
U1RfTkFUSVZFX0NPTlRFWFRfU1VQUE9SVEVEX0RSSVZFUgo+ICAJYm9vbAo+ICAKPiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9tZXNhM2QvbWVzYTNkLm1rIGIvcGFja2FnZS9tZXNhM2QvbWVzYTNkLm1r
Cj4gaW5kZXggMzQ1OTc5NjZhZi4uZDk5MTZjYTM1OSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL21l
c2EzZC9tZXNhM2QubWsKPiArKysgYi9wYWNrYWdlL21lc2EzZC9tZXNhM2QubWsKPiBAQCAtMTU3
LDYgKzE1NywxNiBAQCBlbHNlCj4gIE1FU0EzRF9DT05GX09QVFMgKz0gLURhbWRncHUtdmlydGlv
PWZhbHNlCj4gIGVuZGlmCj4gIAo+ICtpZmVxICgkKEJSMl9QQUNLQUdFX01FU0EzRF9HQUxMSVVN
X0RSSVZFUl9GUkVFRFJFTk8pLHkpCj4gK01FU0EzRF9GUkVFRFJFTk9fS01EUyA9IG1zbQo+ICtp
ZmVxICgkKEJSMl9QQUNLQUdFX01FU0EzRF9IT1NUX05BVElWRV9DT05URVhUX0RSSVZFUl9GUkVF
RFJFTk8pLHkpCj4gK01FU0EzRF9GUkVFRFJFTk9fS01EUyArPSB2aXJ0aW8KPiArZW5kaWYKPiAr
Cj4gK01FU0EzRF9DT05GX09QVFMgKz0gXAo+ICsJLURmcmVlZHJlbm8ta21kcz0kKHN1YnN0ICQo
c3BhY2UpLCQoY29tbWEpLCQoTUVTQTNEX0ZSRUVEUkVOT19LTURTKSkKPiArZW5kaWYKPiArCj4g
IGlmZXEgKCQoQlIyX1BBQ0tBR0VfTUVTQTNEX1ZVTEtBTl9EUklWRVJfSU5URUwpLHkpCj4gIE1F
U0EzRF9ERVBFTkRFTkNJRVMgKz0gaG9zdC1weXRob24tcGx5Cj4gIGVuZGlmCj4gCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
