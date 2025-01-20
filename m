Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 994D2C02181
	for <buildroot@archiver.kernel.org>; Mon, 20 Jan 2025 19:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A1EA82186;
	Mon, 20 Jan 2025 19:57:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 48w9A5a805AE; Mon, 20 Jan 2025 19:57:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37844821F0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37844821F0;
	Mon, 20 Jan 2025 19:57:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 318C6D7
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 19:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12D3782186
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 19:56:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ShZGTF5_9zJS for <buildroot@buildroot.org>;
 Mon, 20 Jan 2025 19:56:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B3C3A8217C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3C3A8217C
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B3C3A8217C
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 19:56:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id B161A78032A;
 Mon, 20 Jan 2025 20:56:53 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:43202])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 20 Jan 2025 20:56:53 +0100
MIME-Version: 1.0
Date: Mon, 20 Jan 2025 20:56:53 +0100
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@laposte.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250120061032.15343-1-vincent.stehle@laposte.net>
References: <20250120061032.15343-1-vincent.stehle@laposte.net>
User-Agent: Webmail Free/1.6.9
Message-ID: <5f680e088fa047e6c0e2e2d98395deb6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737403014;
 bh=Ygb8mp1jjyXvWYbOUavCa+DZ+hl5q/CjdIRMcgSnf+o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vaFUt102lhrcBBrvCunoZUWnl1GThl2fECc0EbyAqMdXgcVnXqhEky0lhdmquY9BE
 UhpobWAWwcHuFsg2fujrT6wbdoLqAE23sD9Dv/56leo670AL2ZJF8ChNl8C4flcYYp
 ShaO6BBkguX9AbqF0miXmGsvhcsa3I6IFp829ji/z6T3Af1f09fo0xDC3+8s1Wx3sO
 BHvAcgWZXQCKoJccehKzrzyYB4gCHhqPkxakNq/BlX6/bkhiutQAwJOnRrR+tCFGgv
 Yy4725FuwRgUK8sQeqQpoMgUeQXLUSBScG/LOdOT38lhCm+VSB+8YN3gvTV9ZHOKNj
 MWFOFyuk+34JQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=vaFUt102
Subject: Re: [Buildroot] [PATCH] support/testing: test_xen: repair and
 leverage xen tools
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVmluY2VudCwKClRoYW5rcyBmb3IgdGhpcyBuaWNlIGltcHJvdmVtZW50IQoKSSBoYXZlIG9u
ZSBjb21tZW50LCBzZWUgYmVsb3c6CgpPbiAyMC8wMS8yMDI1IDA3OjEwLCBWaW5jZW50IFN0ZWhs
w6kgdmlhIGJ1aWxkcm9vdCB3cm90ZToKPiBDdXJyZW50IHRlc3QgcnVucyBhIFhlbiBoeXBlcnZp
c29yIGFuZCBhIExpbnV4IGRvbTAsIGZyb20gd2hpY2ggd2UgY2FuCj4gZGV0ZWN0IHRoYXQgd2Ug
cnVuIHVuZGVyIFhlbiBidXQgbm90IG11Y2ggbW9yZS4gSW5kZWVkLCB3aXRoIGN1cnJlbnQKPiB0
ZXN0J3Mgc2V0dXAgdGhlIFhlbiB0b29scyBhcmUgbm90IGZ1bmN0aW9uYWwuCj4gCj4gV2UgZG8g
dGhlIGZvbGxvd2luZyBhZGp1c3RtZW50cyB0byB0aGUgdGVzdCBzZXR1cCB0byByZXBhaXIgWGVu
IHRvb2xzOgo+IAo+IC0gU3dpdGNoIHRvIGJhc2ggYXMgZGVmYXVsdCBzaGVsbCB0byByZXBhaXIg
WGVuIHN0YXJ0dXAgc2NyaXB0cy4KPiAtIEFkZCBiYWNrIG5ldHdvcmtpbmcgdG8gb3VyIHN0cmlw
cGVkLWRvd24ga2VybmVsIGNvbmZpZy4KPiAKPiBXaXRoIFhlbiB0b29scyBmdW5jdGlvbmFscywg
d2UgY2FuIGVuaGFuY2UgdGhlIHRlc3Qgd2l0aCB0aGUgY3JlYXRpb24gCj4gb2YKPiBhIFZNLiBU
byBiZSBhYmxlIHRvIHVzZSB0aGUgcm9vdGZzIHRoYXQgd2UgYnVpbGQgaW4gYm90aCB0aGUgZG9t
MCBhbmQgCj4gaW4KPiB0aGlzIG5ldyBkb20xLCB3ZSBzd2l0Y2ggdG8gYW4gaW5pdHJhbWZzOyBu
byBtb3JlIHJvb3RmcyBwYXJ0aXRpb24gaW4KPiB0aGUgaW1hZ2UuIEFmdGVyIHN0cmlwcGluZyB0
aGUgcmFtZGlzayBhIGJpdCB3ZSBjYW4gZXZlbiByZWR1Y2UgUWVtdSdzCj4gbWVtb3J5IHRvIDEg
R0IuCj4gCj4gU3VnZ2VzdGVkLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPgo+IFNp
Z25lZC1vZmYtYnk6IFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAbGFwb3N0ZS5uZXQ+
Cj4gLS0tCgpbLi4uXQoKPiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2th
Z2UvdGVzdF94ZW4ucHkgCj4gYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3hl
bi5weQo+IGluZGV4IDg3NWJhMTllNzAuLjI0Y2FiZThkOGQgMTAwNjQ0Cj4gLS0tIGEvc3VwcG9y
dC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF94ZW4ucHkKPiArKysgYi9zdXBwb3J0L3Rlc3Rp
bmcvdGVzdHMvcGFja2FnZS90ZXN0X3hlbi5weQo+IEBAIC0xLDE1ICsxLDIxIEBACj4gIGltcG9y
dCBvcwo+ICtpbXBvcnQgcGV4cGVjdAo+ICBpbXBvcnQgaW5mcmEuYmFzZXRlc3QKPiAKPiAKPiAg
Y2xhc3MgVGVzdFhlbihpbmZyYS5iYXNldGVzdC5CUlRlc3QpOgo+ICAgICAgIyBXZSBoYXZlIGEg
Y3VzdG9tIGtlcm5lbCBjb25maWcgdG8gcmVkdWNlIGJ1aWxkIHRpbWUuCj4gICAgICAjIE91ciBn
ZW5pbWFnZS5jZmcgaXMgaW5zcGlyZWQgZnJvbSBxZW11X2FhcmNoNjRfZWJicl9kZWZjb25maWcg
YXMgCj4gd2UgYm9vdAo+IC0gICAgIyBYZW4gd2l0aCBVRUZJLgo+ICsgICAgIyBYZW4gd2l0aCBV
RUZJLiBXZSBydW4gb25seSBpbiB0aGUgaW5pdHJhbWZzOyB0aGlzIGFsbG93cyB0byB1c2UgCj4g
YSBzaW5nbGUKPiArICAgICMgcmFtZGlzayBpbWFnZSBmb3IgYm90aCB0aGUgaG9zdCBhbmQgdGhl
IGd1ZXN0Lgo+ICsgICAgIyBUaGUgWGVuIHN0YXJ0dXAgc2NyaXB0cyBuZWVkIGJhc2guCj4gICAg
ICBjb25maWcgPSBcCj4gICAgICAgICAgIiIiCj4gICAgICAgICAgQlIyX2FhcmNoNjQ9eQo+ICAg
ICAgICAgIEJSMl9UT09MQ0hBSU5fRVhURVJOQUw9eQo+ICsgICAgICAgIEJSMl9TWVNURU1fQklO
X1NIX0JBU0g9eQoKSSB0aGluayB0aGlzIHRlc3Qgc2hvdWxkIG5vdCBzZWxlY3QgQlIyX1NZU1RF
TV9CSU5fU0hfQkFTSD15IGhlcmUuClRoZSBiYXNoIHJlcXVpcmVtZW50IGNvbWVzIGZyb20gdGhl
IFhlbiB0b29scyBzY3JpcHRzLAppbnN0YWxsZWQgYnkgdGhlIHBhY2thZ2UgaXRzZWxmLiBTZWU6
Cmh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9YmxvYjtmPXRvb2xz
L2hvdHBsdWcvTGludXgvaW5pdC5kL3hlbmNvbW1vbnMuaW47aGI9UkVMRUFTRS00LjE0LjYjbDEK
b3Igb3RoZXIgc2NyaXB0czoKaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5n
aXQ7YT1ibG9iO2Y9dG9vbHMvaG90cGx1Zy9MaW51eC92aWYtc2V0dXAuaW47aGI9UkVMRUFTRS00
LjE0LjYjbDEKQWxzbywgdGhpcyB0ZXN0IGRvZXMgbm90IHJlYWxseSBuZWVkIHRvIGhhdmUgYmFz
aCBhcyB0aGUgc3lzdGVtIAovYmluL2Jhc2gsCnRoZSByZWFsIHJlcXVpcmVtZW50IGlzIHRvIGhh
dmUgYmFzaCBpbnN0YWxsZWQuCgpTbyBtYXliZSB0aGlzIGNvdWxkIGJlIGZpeGVkIGluIGEgc2Vw
YXJhdGUgY29tbWl0IGluIHRoZSBwYWNrYWdlLApmb3IgZXhhbXBsZSwgZW50aXRsZWQ6CiJwYWNr
YWdlL3hlbjogeGVuIHRvb2xzIG5lZWRzIGJhc2ggYXQgcnVudGltZSIKaW46Cmh0dHBzOi8vZ2l0
bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2Jsb2IvMjAyNC4xMS4xL3BhY2thZ2Uv
eGVuL0NvbmZpZy5pbiNMMjAKYWRkaW5nOgoKICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfQkFTSCAj
IHJ1bnRpbWUgKHNjcmlwdHMpCiAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX0JVU1lCT1hfU0hPV19P
VEhFUlMgaWYgQlIyX1BBQ0tBR0VfQlVTWUJPWCAjIGJhc2gKClRoZW4sIHlvdXIgdGVzdCwganVz
dCBieSBzZWxlY3RpbmcgQlIyX1BBQ0tBR0VfWEVOX1RPT0xTPXkgd2lsbCBoYXZlCmV2ZXJ5dGhp
bmcgbmVlZGVkIHRvIHdvcmsuCgo+ICsgICAgICAgIAo+IEJSMl9ST09URlNfT1ZFUkxBWT0ic3Vw
cG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF94ZW4vb3ZlcmxheSIKPiArICAgICAgICAK
PiBCUjJfUk9PVEZTX1BPU1RfQlVJTERfU0NSSVBUPSJzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFj
a2FnZS90ZXN0X3hlbi9wb3N0LWJ1aWxkLnNoIgo+ICAgICAgICAgIAo+IEJSMl9ST09URlNfUE9T
VF9JTUFHRV9TQ1JJUFQ9InN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfeGVuL3Bv
c3QtaW1hZ2Uuc2ggCj4gc3VwcG9ydC9zY3JpcHRzL2dlbmltYWdlLnNoIgo+ICAgICAgICAgIEJS
Ml9ST09URlNfUE9TVF9TQ1JJUFRfQVJHUz0iLWMgCj4gc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3Bh
Y2thZ2UvdGVzdF94ZW4vZ2VuaW1hZ2UuY2ZnIgo+ICAgICAgICAgIEJSMl9MSU5VWF9LRVJORUw9
eQo+IEBAIC0xOCwxMiArMjQsMTEgQEAgY2xhc3MgVGVzdFhlbihpbmZyYS5iYXNldGVzdC5CUlRl
c3QpOgo+ICAgICAgICAgIEJSMl9MSU5VWF9LRVJORUxfVVNFX0NVU1RPTV9DT05GSUc9eQo+ICAg
ICAgICAgIAo+IEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0NPTkZJR19GSUxFPSJzdXBwb3J0L3Rl
c3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3hlbi9saW51eC5jb25maWciCj4gICAgICAgICAgQlIy
X0xJTlVYX0tFUk5FTF9ORUVEU19IT1NUX09QRU5TU0w9eQo+ICsgICAgICAgIEJSMl9QQUNLQUdF
X0JVU1lCT1hfU0hPV19PVEhFUlM9eQoKVGhpcyBCUjJfUEFDS0FHRV9CVVNZQk9YX1NIT1dfT1RI
RVJTPXkgY2FuIGFsc28gYmUgcmVtb3ZlZCwgc2luY2UgaXQgCnNob3VsZApzZWxlY3RlZCBieSB0
aGUgcGFja2FnZS4KCkNhbiB5b3Ugc2VuZCBhbiB1cGRhdGVkIHBhdGNoIHdpdGggdGhvc2UgY2hh
bmdlcywgcGxlYXNlPwoKQmVzdCByZWdhcmRzLAoKSnVsaWVuLgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
