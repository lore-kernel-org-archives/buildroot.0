Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 463CDC77B7A
	for <buildroot@archiver.kernel.org>; Fri, 19 May 2023 21:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 890FD410A0;
	Fri, 19 May 2023 21:13:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 890FD410A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id intNU5aspXvx; Fri, 19 May 2023 21:13:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E2DE410BA;
	Fri, 19 May 2023 21:13:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E2DE410BA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AA84D1BF41B
 for <buildroot@lists.busybox.net>; Fri, 19 May 2023 21:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8442B40C2C
 for <buildroot@lists.busybox.net>; Fri, 19 May 2023 21:13:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8442B40C2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G0-K7rk3rMPa for <buildroot@lists.busybox.net>;
 Fri, 19 May 2023 21:13:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3684E40424
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3684E40424
 for <buildroot@buildroot.org>; Fri, 19 May 2023 21:13:20 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f42c86543bso24683185e9.3
 for <buildroot@buildroot.org>; Fri, 19 May 2023 14:13:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684530798; x=1687122798;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IfKVncKDejMITbsF3mR1BnP6p3/jbrv+YTBZ2HmQCn8=;
 b=HmH+MngrGLIO3jIeF38l8n4rg/1fijqe88g9fQqgcDM9K1ko3OLrlkhtcE6w98AyMT
 SPwONJGlNYk6n8yWM51oXdwIHw2Are8YIUDtDqQHkXQX2RpeR43xrRbxJPi+CwaJZTJX
 /aH5mNpVi2Mv0LeQa+Be0Wd0FS+kAPO5g+kux2lE77AZHuqYscGT6ke98PELajJ530UV
 qw13pNQHbLEa27pfdq6UM98LRAcG9p9VZ0CO9FEkVWg4DwZQKYUpA0EGjLjG+EhdVrvx
 4/c7MPhJxQUfLLE3RRucibNgOe7QUcZR1AEwah2sLaoLA6peD1OM7m9F6Ie7IUE/YEbR
 oFzw==
X-Gm-Message-State: AC+VfDw1b9cIUHg6HibC488WA4OeW0iEosP6s50QisNGytLo1bwml2fX
 lFtG8PClgi85aNC5uvhAKLEv7deeL64=
X-Google-Smtp-Source: ACHHUZ6ealITX7mT+5EvFt4hQcNAa6chkozIzefll6dK60N6WohLGj7VzB2xSETTeOotRHiOqbYmpA==
X-Received: by 2002:a7b:ce86:0:b0:3f4:22da:c3f6 with SMTP id
 q6-20020a7bce86000000b003f422dac3f6mr2279667wmj.11.1684530798048; 
 Fri, 19 May 2023 14:13:18 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:945b:7e00:87f8:ae36:66c2:3a18?
 (2a01cb05945b7e0087f8ae3666c23a18.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:87f8:ae36:66c2:3a18])
 by smtp.gmail.com with ESMTPSA id
 x16-20020a1c7c10000000b003f5de41857asm3455766wmc.16.2023.05.19.14.13.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 May 2023 14:13:17 -0700 (PDT)
Message-ID: <5d09151b-3ab5-5b83-25c5-0e29aa185df4@gmail.com>
Date: Fri, 19 May 2023 23:13:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Baruch Siach <baruch@tkos.co.il>
References: <20230518213053.33760-1-romain.naour@gmail.com>
 <87lehlvvm3.fsf@tarshish>
Content-Language: en-US
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <87lehlvvm3.fsf@tarshish>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684530798; x=1687122798;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IfKVncKDejMITbsF3mR1BnP6p3/jbrv+YTBZ2HmQCn8=;
 b=YCLql4mSyOSsgDpCrZ+JNN8n26vAJ8X/aA7bl5QtDLTMzoAgrKbcEfMWQJltYvnah2
 ESYAqd99Hbdv/UTTJ5wAw7F56pS91kyVJU2ER1nv3TmZkeoCtBlVdxs5r71VwHp757Sp
 AB8RSaRbnCzcg2cTbdLM+2m3tcISrdhkVycQdi0WWLZRTZdii8CaYf7TAeDodKbn5+nh
 atImGiCM6TnSXbIFo1a3aeePu/ZyhqgQcEci2YgOLDpv+bCMsAcIGVDBqoxsQvBn3NEY
 mhzkxbLGYGHwt3hsB6nIWGpavW8RonOhZcXqfqm3+0SMxnCBP0jpPQkqLhpK0qDqa8gV
 ZuOA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=YCLql4mS
Subject: Re: [Buildroot] [PATCH] package/mesa3d: fix glxinfo crash when
 gles1 is disabled
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQmFydWNoLAoKTGUgMTkvMDUvMjAyMyDDoCAwNTozNSwgQmFydWNoIFNpYWNoIGEgw6ljcml0
wqA6Cj4gSGkgUm9tYWluLAo+IAo+IE9uIFRodSwgTWF5IDE4IDIwMjMsIFJvbWFpbiBOYW91ciB3
cm90ZToKPj4gbWVzYTNkIDIzLjEgaW50cm9kdWNlZCBhIHJlZ3Jlc3Npb24gY3Jhc2hpbmcgZ2x4
aW5mbyAoYW5kIHNvbWUgcGlnbGl0IHRlc3RzKQo+PiB3aGVuIGdsZXMxIGlzIGRpc2FibGVkLgo+
PiBTZWU6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvLS9pc3N1ZXMv
OTAzOAo+Pgo+PiBGaXhlczoKPj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVp
bGRyb290Ly0vam9icy80Mjg3OTgzNDkwCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFJvbWFpbiBOYW91
ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4KPj4gQ2M6IEJlcm5kIEt1aGxzIDxiZXJuZC5rdWhs
c0B0LW9ubGluZS5kZT4KPj4gLS0tCj4+ICAuY2hlY2twYWNrYWdlaWdub3JlICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgMSArCj4+ICAuLi5hcmx5LXdoZW4tdHJ5aW5nLXRvLWNyZWF0ZS1h
bi11bnN1cHAucGF0Y2ggfCA1MCArKysrKysrKysrKysrKysrKysrCj4+ICAyIGZpbGVzIGNoYW5n
ZWQsIDUxIGluc2VydGlvbnMoKykKPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL21lc2Ez
ZC8wMDA1LW1lc2EtbWFpbi1FeGl0LWVhcmx5LXdoZW4tdHJ5aW5nLXRvLWNyZWF0ZS1hbi11bnN1
cHAucGF0Y2gKPj4KPj4gZGlmZiAtLWdpdCBhLy5jaGVja3BhY2thZ2VpZ25vcmUgYi8uY2hlY2tw
YWNrYWdlaWdub3JlCj4+IGluZGV4IDk0N2Y0NjA2YWEuLmViNTcyZGU5ZjEgMTAwNjQ0Cj4+IC0t
LSBhLy5jaGVja3BhY2thZ2VpZ25vcmUKPj4gKysrIGIvLmNoZWNrcGFja2FnZWlnbm9yZQo+PiBA
QCAtOTk1LDYgKzk5NSw3IEBAIHBhY2thZ2UvbWVuZGVyLWNvbm5lY3QvUzQzbWVuZGVyLWNvbm5l
Y3QgU2hlbGxjaGVjawo+PiAgcGFja2FnZS9tZW51LWNhY2hlLzAwMDEtU3VwcG9ydC1nY2MxMC1j
b21waWxhdGlvbi5wYXRjaCBVcHN0cmVhbQo+PiAgcGFja2FnZS9tZXNhM2QtZGVtb3MvMDAwMS1k
ZW1vcy1tYWtlcy1vcGVuZ2wtYW4tb3B0aW9uYWwtY29tcG9uZW50LnBhdGNoIFVwc3RyZWFtCj4+
ICBwYWNrYWdlL21lc2EzZC8wMDAxLW1lc29uLVNldC1wcm9wZXItdmFsdWUtZm9yLUxJQkNMQ19J
TkNMVURFRElSLnBhdGNoIFVwc3RyZWFtCj4+ICtwYWNrYWdlL21lc2EzZC8wMDA1LW1lc2EtbWFp
bi1FeGl0LWVhcmx5LXdoZW4tdHJ5aW5nLXRvLWNyZWF0ZS1hbi11bnN1cHAucGF0Y2ggVXBzdHJl
YW0KPiAKPiBJIHRoaW5rIHRoZSBwYXRjaCBzaG91bGQgaGF2ZSBwcm9wZXIgVXBzdHJlYW0gdGFn
IGFzIGRlc2NyaWJlZCBpbiB0aGUKPiBtYW51YWwgKGRvY3MvbWFudWFsL3BhdGNoLXBvbGljeS50
eHQpLiAuY2hlY2twYWNrYWdlaWdub3JlIGlzIG9ubHkgZm9yCj4gZXhpc3Rpbmcgbm9uIGNvbmZv
cm1pbmcgcGF0Y2hlcy4KCk9rIHRoYW5rcywgSSBoYXZlbid0IGNsb3NlbHkgZm9sbG93ZWQgcmVj
ZW50IGNoYW5nZXMgYWJvdXQgcGF0Y2ggcG9saWN5LgpJIHRob3VnaHQgdGhhdCBpdCB3YXMgZW5v
dWdoIHdpdGggIihjaGVycnkgcGlja2VkIGZyb20gY29tbWl0IC4uLiIgKGdlbmVyYXRlZCBieQpn
aXQgY2hlcnJ5LXBpY2sgLXgpIHRvIGF2b2lkIHRoZSBjaGVja3BhY2thZ2Ugd2FybmluZy4KCkJl
c3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBiYXJ1Y2gKPiAKPj4gIHBhY2thZ2UvbWVzb24tdG9v
bHMvMDAwMS1hbWxib290ZW5jLWd4bC1yZW1vdmUtbm9uLXN0ZC1DLWNvbnZlbnRpb24taW4tZm9y
LnBhdGNoIFVwc3RyZWFtCj4+ICBwYWNrYWdlL21lc29uLzAwMDEtUHJlZmVyLWV4dC1zdGF0aWMt
bGlicy13aGVuLWRlZmF1bHQtbGlicmFyeS1zdGF0aWMucGF0Y2ggVXBzdHJlYW0KPj4gIHBhY2th
Z2UvbWVzb24vMDAwMi1tZXNvbmJ1aWxkLWRlcGVuZGVuY2llcy1iYXNlLnB5LWFkZC1wa2dfY29u
ZmlnX3N0YXRpLnBhdGNoIFVwc3RyZWFtCj4+IGRpZmYgLS1naXQKPj4gYS9wYWNrYWdlL21lc2Ez
ZC8wMDA1LW1lc2EtbWFpbi1FeGl0LWVhcmx5LXdoZW4tdHJ5aW5nLXRvLWNyZWF0ZS1hbi11bnN1
cHAucGF0Y2gKPj4gYi9wYWNrYWdlL21lc2EzZC8wMDA1LW1lc2EtbWFpbi1FeGl0LWVhcmx5LXdo
ZW4tdHJ5aW5nLXRvLWNyZWF0ZS1hbi11bnN1cHAucGF0Y2gKPj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQKPj4gaW5kZXggMDAwMDAwMDAwMC4uNjA4MGE1NTFjYwo+PiAtLS0gL2Rldi9udWxsCj4+ICsr
KyBiL3BhY2thZ2UvbWVzYTNkLzAwMDUtbWVzYS1tYWluLUV4aXQtZWFybHktd2hlbi10cnlpbmct
dG8tY3JlYXRlLWFuLXVuc3VwcC5wYXRjaAo+PiBAQCAtMCwwICsxLDUwIEBACj4+ICtGcm9tIDJh
NjkwOGZmNGM5NDI4NGIzOWMzY2Q0Yzk3ZTEwNjk4NzY3MjBlYjcgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCj4+ICtGcm9tOiBKb3JkYW4gSnVzdGVuIDxqb3JkYW4ubC5qdXN0ZW5AaW50ZWwuY29t
Pgo+PiArRGF0ZTogVHVlLCAxNiBNYXkgMjAyMyAxODo0Njo1MCAtMDcwMAo+PiArU3ViamVjdDog
W1BBVENIXSBtZXNhL21haW46IEV4aXQgZWFybHkgd2hlbiB0cnlpbmcgdG8gY3JlYXRlIGFuIHVu
c3VwcG9ydGVkCj4+ICsgY29udGV4dCBBUEkKPj4gKwo+PiArRml4ZXM6IGFkYmU4YjZjMTdhICgi
bWVzYTogb3B0aW1pemUgb3V0IF9tZXNhX2lzX2Rlc2t0b3BfZ2wqKCkgYW5kIF9tZXNhX2lzX2ds
ZXMqKCkgY2FsbHMgd2hlbiBub3QgYnVpbHQiKQo+PiArQ2xvc2VzOiBodHRwczovL2dpdGxhYi5m
cmVlZGVza3RvcC5vcmcvbWVzYS9tZXNhLy0vaXNzdWVzLzkwMzgKPj4gK1NpZ25lZC1vZmYtYnk6
IEpvcmRhbiBKdXN0ZW4gPGpvcmRhbi5sLmp1c3RlbkBpbnRlbC5jb20+Cj4+ICtSZXZpZXdlZC1i
eTogRXJpYyBFbmdlc3Ryb20gPGVyaWNAZW5nZXN0cm9tLmNoPgo+PiArUGFydC1vZjogPGh0dHBz
Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvLS9tZXJnZV9yZXF1ZXN0cy8yMzA2
OD4KPj4gKyhjaGVycnkgcGlja2VkIGZyb20gY29tbWl0IDhiYjFlY2FhMDIxNzc3MjA3NTgyNTVi
ZGQ3ZWMzNGE1ZDE1ZmVjYTQpCj4+ICtbUm9tYWluOiBiYWNrcG9ydCB0byAyMy4xXQo+PiArU2ln
bmVkLW9mZi1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgo+PiArLS0t
Cj4+ICsgc3JjL21lc2EvbWFpbi9jb250ZXh0LmMgfCAxOCArKysrKysrKysrKysrKysrKysKPj4g
KyAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKQo+PiArCj4+ICtkaWZmIC0tZ2l0IGEv
c3JjL21lc2EvbWFpbi9jb250ZXh0LmMgYi9zcmMvbWVzYS9tYWluL2NvbnRleHQuYwo+PiAraW5k
ZXggZDhlZWEyZWE4NjcuLjJiODEwYjBkODYzIDEwMDY0NAo+PiArLS0tIGEvc3JjL21lc2EvbWFp
bi9jb250ZXh0LmMKPj4gKysrKyBiL3NyYy9tZXNhL21haW4vY29udGV4dC5jCj4+ICtAQCAtOTk2
LDYgKzk5NiwyNCBAQCBfbWVzYV9pbml0aWFsaXplX2NvbnRleHQoc3RydWN0IGdsX2NvbnRleHQg
KmN0eCwKPj4gKyAgICBzdHJ1Y3QgZ2xfc2hhcmVkX3N0YXRlICpzaGFyZWQ7Cj4+ICsgICAgaW50
IGk7Cj4+ICsgCj4+ICsrICAgc3dpdGNoIChhcGkpIHsKPj4gKysgICBjYXNlIEFQSV9PUEVOR0xf
Q09NUEFUOgo+PiArKyAgIGNhc2UgQVBJX09QRU5HTF9DT1JFOgo+PiArKyAgICAgIGlmICghSEFW
RV9PUEVOR0wpCj4+ICsrICAgICAgICAgcmV0dXJuIEdMX0ZBTFNFOwo+PiArKyAgICAgIGJyZWFr
Owo+PiArKyAgIGNhc2UgQVBJX09QRU5HTEVTMjoKPj4gKysgICAgICBpZiAoIUhBVkVfT1BFTkdM
X0VTXzIpCj4+ICsrICAgICAgICAgcmV0dXJuIEdMX0ZBTFNFOwo+PiArKyAgICAgIGJyZWFrOwo+
PiArKyAgIGNhc2UgQVBJX09QRU5HTEVTOgo+PiArKyAgICAgIGlmICghSEFWRV9PUEVOR0xfRVNf
MSkKPj4gKysgICAgICAgICByZXR1cm4gR0xfRkFMU0U7Cj4+ICsrICAgICAgYnJlYWs7Cj4+ICsr
ICAgZGVmYXVsdDoKPj4gKysgICAgICByZXR1cm4gR0xfRkFMU0U7Cj4+ICsrICAgfQo+PiArKwo+
PiArICAgIGN0eC0+QVBJID0gYXBpOwo+PiArICAgIGN0eC0+RHJhd0J1ZmZlciA9IE5VTEw7Cj4+
ICsgICAgY3R4LT5SZWFkQnVmZmVyID0gTlVMTDsKPj4gKy0tIAo+PiArMi40MC4xCj4+ICsKPiAK
PiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
