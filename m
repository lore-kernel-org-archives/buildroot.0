Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6265CCD4F25
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 16:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAF0C84402;
	Fri, 15 May 2026 16:06:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PQsfEzT-u4Qv; Fri, 15 May 2026 16:06:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84A29843FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778861207;
	bh=fIakiZCvPVh3K5pd/vBFp0j3joFqX9yMJjQ4tCuY09g=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=hZNqSSfwIkXk6WDl8Zl9il4RwGb6380k39fhCd/0ytKizhcVa7vrfqWbW6JUl4UYa
	 YpxFWEIVeebMYXbr7QKHDEMxt9smW/CaQXCt9T7okUB+Ly9T6JJ+QZfwr/IMw8Fh6w
	 lgUDU/Ikgs+RXJ+VeBLRR0Q/J7GWTQMjDMWDirU1U7DgFIJRx4+INo/lRqu4xv6M+X
	 zz3q8TYUmka0c9AuxXcDC3msoI/PW6UTGVSVLEh9U5cworHy/GagcwLXbV9535mhYh
	 6AWzXXLfHqsd2dOefDSQYViuWqbNF2zP819qU5K2+WiSVXXgDpfQMQzHGiby8bBHCG
	 gpRWdKoNOesUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84A29843FB;
	Fri, 15 May 2026 16:06:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AC8E31295
 for <buildroot@buildroot.org>; Fri, 15 May 2026 16:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E48D6162E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 16:06:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Toay4WpDhU7 for <buildroot@buildroot.org>;
 Fri, 15 May 2026 16:06:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 918256162D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 918256162D
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 918256162D
 for <buildroot@buildroot.org>; Fri, 15 May 2026 16:06:44 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4893940bb5eso57782065e9.3
 for <buildroot@buildroot.org>; Fri, 15 May 2026 09:06:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778861202; x=1779466002;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a24q4Hfz//dPEVpaS+SM4f/IXqfygvtcXquHgorch8s=;
 b=Ym/OIseLhTyOgYE85ItkJHpRb9VPvUdL7ro9yCiWpz4JRt8WFXhE6w0QUUDBUtcn+k
 l8GCycXKTDIHgwhXwqYBM5T60fMyaiurgJHrnyY+QO5hnelEkc74UrG5USxnH5o6Hbkp
 b5V2+HVQ6QTTzw5WZuz+1hfbUJy6ElGGmxHrv4lYcFqLnDVtcRApno0XcGhLQ+7fvMc7
 GhBIXJTedZCxPvSslo3N4r/ojfmPrmkEUKfdxo5sE03miB4dH5yR9er9qmLX0/o+CNjd
 +WV/5hIRxuqddoigwkzDKRUX+W8siQh/AI7HHBSygQez9sVB/lvUcpfO7XA1+cAwCa9B
 E6iA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8M4qry9kvm70HCy+GsN0ZT4YMhtlUpfnv365kcCedPQeY8/vsH9gxS7wZLj3NruXvPqdQOeCeyjrc=@buildroot.org
X-Gm-Message-State: AOJu0YzMTFc9RdbDdjxd6CsGZEnDrZfTsII9JIyXjwA2C58Bhg1Rd8no
 lB+pr/UDqTNABPwqLQkld+bjOjLWLSqyxHFn7cLOiwwyx3hUXoxn93a8g+FHaQl6Q9KIF4cuHmJ
 55qFlH48=
X-Gm-Gg: Acq92OFtz5URcLeIxhU0DQXhn37lnSR5lfaVmIfaQD0NxI+I4PpEgLCy0H9vDHJM2E8
 E1YtgoP/jAFpkPNEJdtdiLe6ZDkMX2DPl2WjimB6RcTKsKRl7n4HPpuMggy0B2hb7Lwq9iERMac
 42rpd3xg2GCKDdng6yjq4LAwtLvVbMGHDn/fh7TSuYW8UkLoD7E7pt3w+YGFJEgOG2F7GKaU/0P
 0GwQYLxqkultoU6fr7pLgiWvAmpjb7UDM1hMSV3jig2+HhvHtvy9s94HWW7bIMLsU1deUCx/gHH
 ZCUwqLIRHcaku2XJthmuRhQnj5Lk1+16oaKmLVL5HcbHnB9iAv8RuaLPGL4jSk9UMYnK+zn6But
 sC27Sn8RRXqjfSrBPpTxoNJz9qgm/wDAv2MWwQ4812+NGu7HBtAWQveMwwIOtgIit5glOnxLth+
 uIblPyRtoTO55oZP1Eav0xYfVKhanawPKyFnl94zb9fGPUaUqPVhozJpaw1PcrS/g/rslcGKFoc
 uNUmtkKx6dzevz5MozU5G2B6NEvSrfR+Xrw3IyGNb2zOr+CqUlNtTTdyfjILjmUcQ==
X-Received: by 2002:a05:600c:8b67:b0:489:1d74:56d with SMTP id
 5b1f17b1804b1-48fe6325a52mr76555015e9.29.1778861202316; 
 Fri, 15 May 2026 09:06:42 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fea5297f7sm25979225e9.0.2026.05.15.09.06.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2026 09:06:41 -0700 (PDT)
Message-ID: <4c798255-d76b-47b0-9285-7bfd26a1f11f@smile.fr>
Date: Fri, 15 May 2026 18:06:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260508184329.3669575-1-bernd@kuhls.net>
Content-Language: fr
In-Reply-To: <20260508184329.3669575-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1778861202; x=1779466002; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=a24q4Hfz//dPEVpaS+SM4f/IXqfygvtcXquHgorch8s=;
 b=r2B5+xGArzRTeCylj4xu/j2AU/ISTcupcaUjlHa1MwoB/bjZBPyWi+7Zo5AIQBJMaf
 tjTnZy8GKehtgMDcrWchCxZuZ3LWElzck9PWGAcs23qJgD/h8MgQk4SEhwSQBCb/9XSl
 iilvGjI3b37w0rAUK382p4t/EEPpxcjF/mEv4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=r2B5+xGA
Subject: Re: [Buildroot] [PATCH 1/3] package/libks: select
 BR2_PACKAGE_LIBOPENSSL_ENGINES
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

SGVsbG8gQmVybmQsCgpMZSAwOC8wNS8yMDI2IMOgIDIwOjQzLCBCZXJuZCBLdWhscyBhIMOpY3Jp
dMKgOgo+IGxpYmtzIG1ha2VzIHVzZSBvZiBFUlJfKiBmdW5jdGlvbnMgZGVmaW5lZCBpbiBvcGVu
c3NsL2Vyci5oIHdoaWNoIGFyZQo+IGluY2x1ZGVkIGJ5IG9wZW5zc2wvZW5naW5lLmggcmVzdWx0
aW5nIGluIGEgYnVpbGQgZmFpbHVyZSB3aGVuCj4gIUJSMl9QQUNLQUdFX0xJQk9QRU5TU0xfRU5H
SU5FUyBzaW5jZSBjb21taXQKPiA2MjNkM2JiZTQzZTkxOTNhYThlMzM5NTM2N2QwMWFmNTkwNzFi
ODU5Ogo+IAo+IC9ob21lL2J1aWxkcm9vdC9pbnN0YW5jZS0wL291dHB1dC0xL2J1aWxkL2xpYmtz
LTIuMC41L3NyYy9rc19zc2wuYzoxMTE6MTc6Cj4gIGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlv
biBvZiBmdW5jdGlvbiAnRVJSX2ZyZWVfc3RyaW5ncyc7IGRpZCB5b3UgbWVhbgo+ICAnRVJSX2xv
YWRfRUNfc3RyaW5ncyc/IFstV2ltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQo+ICAgMTEx
IHwgICAgICAgICAgICAgICAgIEVSUl9mcmVlX3N0cmluZ3MoKTsKPiAKPiBGaXhlczoKPiBodHRw
czovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvYWFjL2FhYzI1ZTVjNTg0ZWRlOTYy
Y2FjOTVjMzUzYWZkNjRiZjcyMDE5OWMvCj4gCj4gVGhlIG9sZGVzdCBidWlsZCBlcnJvciBvbiB0
aGUgbWFzdGVyIGJyYW5jaCBkYXRlcyBiYWNrIHRvIEZlYiAyMDI1Ogo+IGh0dHBzOi8vYXV0b2J1
aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy84M2EvODNhMjA3YmVlNzk2YWZiYzYxOWI2MmM1ZWNm
ODljNjYyNDg0MTcwZi8KPiBzbyBhIGJhY2twb3J0IHRvIExUUyBicmFuY2hlcyBzaG91bGQgYmUg
Y29uc2lkZXJlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMu
bmV0PgoKQXBwbGllZCB0byBtYXN0ZXIuIFRoYW5rcy4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgo+
IC0tLQo+ICBwYWNrYWdlL2xpYmtzL0NvbmZpZy5pbiB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJrcy9Db25maWcuaW4g
Yi9wYWNrYWdlL2xpYmtzL0NvbmZpZy5pbgo+IGluZGV4IDQ3ODFkMTg4YmYuLjE3YTAwOGQ3YTAg
MTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9saWJrcy9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL2xp
YmtzL0NvbmZpZy5pbgo+IEBAIC00LDYgKzQsNyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfTElCS1MK
PiAgCWRlcGVuZHMgb24gIUJSMl9TVEFUSUNfTElCUyAjIGRsZmNuLmgKPiAgCWRlcGVuZHMgb24g
QlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEU19OUFRMICMgcHRocmVhZF9zZXRuYW1lX25wKCkKPiAg
CXNlbGVjdCBCUjJfUEFDS0FHRV9PUEVOU1NMCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCT1BF
TlNTTF9FTkdJTkVTIGlmIEJSMl9QQUNLQUdFX0xJQk9QRU5TU0wKPiAgCXNlbGVjdCBCUjJfUEFD
S0FHRV9VVElMX0xJTlVYCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfVVRJTF9MSU5VWF9MSUJVVUlE
Cj4gIAloZWxwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
