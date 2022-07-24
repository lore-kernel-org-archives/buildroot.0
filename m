Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6445CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 22:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01B2483EE5;
	Sun, 24 Jul 2022 22:57:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01B2483EE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5k7bbJCQlELw; Sun, 24 Jul 2022 22:57:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AF3883EDD;
	Sun, 24 Jul 2022 22:57:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AF3883EDD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BC39B1BF424
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 22:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9510483EDD
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 22:57:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9510483EDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a5QBKROQwK9q for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 22:57:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BE5383EDC
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1BE5383EDC
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 22:57:44 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 f24-20020a1cc918000000b003a30178c022so8332957wmb.3
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 15:57:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/ri2LnGGboI/LPLf1GFkKAOdz+oIb11VtMu7a4Nw7As=;
 b=QD9TkkrgTUigEB4mIyQT6J5zJHzxWMVCFIWUpkHcIydctXm4jPr3A/ZyJm7ZMjLbBc
 DIuMtpUD28KPDcsAhX4D2oiPaB8B/s0a2ol+riDlXtoofBXV1C8MDQTMpstNj/fUQeiF
 vUwEGaP51mnKnetrfTfWfQYrprJtOdx7l4sBCsq2ScXVTfgKdlyVUk6e81Jkfqr34iYn
 x3JAbwgpJT44vznCxKS+lHu3piFQllofWpZCKzPRUHAJe4gE1NUsf522FdD2AMHVufA3
 EKhqRnohvce596tyNDPOICOIAI5zMuoj1hsYVhFPh+aSaUNmCqOT2olTHnFw0nG/Wwtc
 hilQ==
X-Gm-Message-State: AJIora8L2Ff+d0Vu9pr9GAA5Z6iuf2HtHxO6jqSos4jdMeXRy6ikbAPD
 19OJMHKdTFFKLEDaTig1TnswoA==
X-Google-Smtp-Source: AGRyM1sAnBSzZ4qepS6F3weWM185RH/r12nEGv7YA8j6qsp+pY0zWeX98+MwzG0Wezhq7AMbIHqiIw==
X-Received: by 2002:a05:600c:4fcf:b0:3a3:40f6:4c4d with SMTP id
 o15-20020a05600c4fcf00b003a340f64c4dmr8914032wmq.60.1658703462743; 
 Sun, 24 Jul 2022 15:57:42 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 o20-20020a05600c4fd400b003a305c0ab06sm17501449wmq.31.2022.07.24.15.57.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 15:57:42 -0700 (PDT)
Message-ID: <a3ce31c0-1567-fa3e-0eab-c28b080de9e0@mind.be>
Date: Mon, 25 Jul 2022 00:57:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: goran.radni@gmail.com, buildroot@buildroot.org
References: <20210217160958.18825-1-goranradni@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210217160958.18825-1-goranradni@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/ri2LnGGboI/LPLf1GFkKAOdz+oIb11VtMu7a4Nw7As=;
 b=SNrfDpH1ws2X+YSOR58B+6/0gPbDje3M+6MshVOnwxWMjNCE6GvlgGq2tagDj+OOkq
 gQmGTCpj5RznpCaK8l15gLdcQ4g6LmxnRRQSBitp5tGyqNQLGnbTmiYUOOgmq8+TIsuj
 KIqhs9sqSj+aG55ynFG18bhASGkH6esL+CENVIaFpyDrVwo/VeJLazsPFqR9d/Ff8A0t
 0zPbJkSa7Ei8SvaulGMCqlHMkmrEKg8Q7d3GODN5S5fkJt8wjHFQmrEBQRUbp55+eETC
 izxBD9lSq3wyRt9zVymnVY8O9TgVVPvFIcWlujO8bEw8ynckaFB0Z9zrkU3Rtaho1to9
 rfVw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SNrfDpH1
Subject: Re: [Buildroot] [PATCH 1/1] qt5doc: Add package with qt quick demos
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
Cc: =?UTF-8?B?R29yYW4gUmHEkWVub3ZpxIc=?= <gradenovic@ultratronik.de>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNy8wMi8yMDIxIDE3OjA5LCBnb3Jhbi5yYWRuaUBnbWFpbC5jb20gd3JvdGU6Cj4gRnJv
bTogR29yYW4gUmHEkWVub3ZpxIcgPGdyYWRlbm92aWNAdWx0cmF0cm9uaWsuZGU+Cj4gCj4gU2lu
Y2UgcXQgNS4xMiwgcXVpY2sgZGVtb3MgYXJlIG1vdmVkIGluIHRoZSBxdDVkb2MgcGFja2FnZS4K
PiBJbiBvcmRlciB0byB1c2UgcXVpY2sgZGVtb3MsIHF0NWRvYyBoYXMgdG8gYmUgYnVpbHQuCj4g
cXQ1ZG9jIGlzIGEgYml0IG1pc2xlYWRpbmcgbmFtZSBmb3IgdGhlIHBhY2thZ2UsIHdoaWxlIGl0
J3MKPiBiYXNpYyBjb250ZW50IGFyZSB0aGUgcXVpY2sgZGVtb3MuIHFkb2MgdG9vbCBpdHNlbGYg
aXMgYSBwYXJ0Cj4gb2YgcXQ1dG9vbHMuCj4gCj4gU2lnbmVkLW9mZi1ieTogR29yYW4gUmHEkWVu
b3ZpxIcgPGdyYWRlbm92aWNAdWx0cmF0cm9uaWsuZGU+CgogIEFwcGxpZWQgdG8gbWFzdGVyIChm
aW5hbGx5ISksIHRoYW5rcy4KCiAgSSBkaWRuJ3QgY2hhbmdlIHRoZSBuYW1lIGFmdGVyIGFsbCAt
IHdlIGdlbmVyYWxseSBwcmVmZXIgdGhlIG5hbWUgdG8gCmNvcnJlc3BvbmQgdG8gdGhlIHVwc3Ry
ZWFtIG9uZSwgYW5kIHRoZSBmYWN0IHRoYXQgaXQncyBkZW1vcyBhbmQgZXhhbXBsZXMgaXMgCmNs
ZWFybHkgaW5kaWNhdGVkIGluIHRoZSBiZXR3ZWVuIHBhcmVudGhlc2lzIHBhcnQgb2YgdGhlIG1l
bnUgcHJvbXB0LgoKICBJIGRpZCBuZWVkIHRvIG1ha2UgYSBudW1iZXIgb2Ygb3RoZXIgY2hhbmdl
cyBob3dldmVyOgogICAgICAtIGZpeCBjaGVjay1wYWNrYWdlIHdhcm5pbmdzOwogICAgICAtIHVw
ZGF0ZSB0byBKYW4gMzEgMjAyMiB2ZXJzaW9uIG9mIGtkZS81LjE1IGJyYW5jaDsKICAgICAgLSBh
ZGQgc2VsZWN0IG9mIEJSMl9QQUNLQUdFX1FUNUJBU0VfRVhBTVBMRVM7CiAgICAgIC0gYWRkIGhh
c2ggZm9yIGxpY2Vuc2UgZmlsZS4KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4gLS0tCj4gICBwYWNr
YWdlL3F0NS9Db25maWcuaW4gICAgICAgICAgfCAgMSArCj4gICBwYWNrYWdlL3F0NS9xdDVkb2Mv
Q29uZmlnLmluICAgfCAxMyArKysrKysrKysrKysrCj4gICBwYWNrYWdlL3F0NS9xdDVkb2MvcXQ1
ZG9jLmhhc2ggfCAgMiArKwo+ICAgcGFja2FnZS9xdDUvcXQ1ZG9jL3F0NWRvYy5tayAgIHwgMjgg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAgNCBmaWxlcyBjaGFuZ2VkLCA0NCBpbnNl
cnRpb25zKCspCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9xdDUvcXQ1ZG9jL0NvbmZp
Zy5pbgo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcXQ1L3F0NWRvYy9xdDVkb2MuaGFz
aAo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcXQ1L3F0NWRvYy9xdDVkb2MubWsKPiAK
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9xdDUvQ29uZmlnLmluIGIvcGFja2FnZS9xdDUvQ29uZmln
LmluCj4gaW5kZXggNjcxNGM2MjcxZC4uYTY2YjZhM2UyNCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdl
L3F0NS9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL3F0NS9Db25maWcuaW4KPiBAQCAtNDMsNiAr
NDMsNyBAQCBzb3VyY2UgInBhY2thZ2UvcXQ1L3F0NWNoYXJ0cy9Db25maWcuaW4iCj4gICBzb3Vy
Y2UgInBhY2thZ2UvcXQ1L3F0NWNvYXAvQ29uZmlnLmluIgo+ICAgc291cmNlICJwYWNrYWdlL3F0
NS9xdDVjb25uZWN0aXZpdHkvQ29uZmlnLmluIgo+ICAgc291cmNlICJwYWNrYWdlL3F0NS9xdDVk
ZWNsYXJhdGl2ZS9Db25maWcuaW4iCj4gK3NvdXJjZSAicGFja2FnZS9xdDUvcXQ1ZG9jL0NvbmZp
Zy5pbiIKPiAgIHNvdXJjZSAicGFja2FnZS9xdDUvcXQ1ZW5naW5pby9Db25maWcuaW4iCj4gICBz
b3VyY2UgInBhY2thZ2UvcXQ1L3F0NWdyYXBoaWNhbGVmZmVjdHMvQ29uZmlnLmluIgo+ICAgc291
cmNlICJwYWNrYWdlL3F0NS9xdDVpbWFnZWZvcm1hdHMvQ29uZmlnLmluIgo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL3F0NS9xdDVkb2MvQ29uZmlnLmluIGIvcGFja2FnZS9xdDUvcXQ1ZG9jL0NvbmZp
Zy5pbgo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uN2ZmNjhkNTg1
Ygo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL3F0NS9xdDVkb2MvQ29uZmlnLmluCj4g
QEAgLTAsMCArMSwxMyBAQAo+ICtjb25maWcgQlIyX1BBQ0tBR0VfUVQ1RE9DCj4gKwlib29sICJx
dDVkb2MgKGluY2x1ZGVzIHF1aWNrIGRlbW9zKSIKPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9RVDVE
RUNMQVJBVElWRQo+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX1FUNURFQ0xBUkFUSVZFX1FVSUNLCj4g
KwloZWxwCj4gKwkgIFF0IGlzIGEgY3Jvc3MtcGxhdGZvcm0gYXBwbGljYXRpb24gYW5kIFVJIGZy
YW1ld29yayBmb3IKPiArCSAgZGV2ZWxvcGVycyB1c2luZyBDKysuCj4gKwo+ICsJICBRdGRvYyBj
b250YWlucyB0aGUgbWFpbiBRdCBSZWZlcmVuY2UgRG9jdW1lbnRhdGlvbiwgd2hpY2ggaW5jbHVk
ZXMKPiArCSAgb3ZlcnZpZXdzLCBRdCB0b3BpY3MsIGFuZCBleGFtcGxlcyBub3Qgc3BlY2lmaWMg
dG8gYW55IFF0IG1vZHVsZS5UaGUKPiArCSAgY29uZmlndXJhdGlvbiBmaWxlcyBhcmUgbG9jYXRl
ZCBpbiBxdGRvYy9kb2MvY29uZmlnIGFuZCB0aGUgYXJ0aWNsZXMgaW4KPiArCSAgcXRkb2MvZG9j
L3NyYy4gTm90ZSB0aGF0IFFEb2MgaXMgbG9jYXRlZCBpbiBxdGJhc2UuCj4gKwo+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL3F0NS9xdDVkb2MvcXQ1ZG9jLmhhc2ggYi9wYWNrYWdlL3F0NS9xdDVkb2Mv
cXQ1ZG9jLmhhc2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLmEy
NmU3ZTM3Y2IKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9xdDUvcXQ1ZG9jL3F0NWRv
Yy5oYXNoCj4gQEAgLTAsMCArMSwyIEBACj4gKyMgSGFzaCBmcm9tOiBodHRwczovL2Rvd25sb2Fk
LnF0LmlvL29mZmljaWFsX3JlbGVhc2VzL3F0LzUuMTIvNS4xMi43L3N1Ym1vZHVsZXMvcXRkb2Mt
ZXZlcnl3aGVyZS1zcmMtNS4xNS4yLnRhci54ego+ICtzaGEyNTYgYTQ3ODA5ZjAwZjFiZDY5MGNh
NGU2OTljYjMyZmZlNzcxN2Q0M2RhODRlMDE2N2QxZjU2MjIxMGRhNzcxNGNlNCBxdGRvYy1ldmVy
eXdoZXJlLXNyYy01LjE1LjIudGFyLnh6Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcXQ1L3F0NWRv
Yy9xdDVkb2MubWsgYi9wYWNrYWdlL3F0NS9xdDVkb2MvcXQ1ZG9jLm1rCj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi4xMDY3MTFlZTU2Cj4gLS0tIC9kZXYvbnVsbAo+
ICsrKyBiL3BhY2thZ2UvcXQ1L3F0NWRvYy9xdDVkb2MubWsKPiBAQCAtMCwwICsxLDI4IEBACj4g
KyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gKyMKPiArIyBxdDVkb2MKPiArIwo+ICsjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIwo+ICsKPiArUVQ1RE9DX1ZFUlNJT04gPSAkKFFUNV9WRVJTSU9OKQo+
ICtRVDVET0NfU0lURSA9ICQoUVQ1X1NJVEUpCj4gK1FUNURPQ19TT1VSQ0UgPSBxdGRvYy0kKFFU
NV9TT1VSQ0VfVEFSQkFMTF9QUkVGSVgpLSQoUVQ1RE9DX1ZFUlNJT04pLnRhci54ego+ICtRVDVE
T0NfREVQRU5ERU5DSUVTID0gcXQ1ZGVjbGFyYXRpdmUKPiArUVQ1RE9DX0lOU1RBTExfU1RBR0lO
RyA9IFlFUwo+ICsKPiAraWZlcSAoJChCUjJfUEFDS0FHRV9RVDVRVUlDS0NPTlRST0xTKSx5KQo+
ICtRVDVET0NfREVQRU5ERU5DSUVTICs9IHF0NXF1aWNrY29udHJvbHMKPiArZW5kaWYKPiArCj4g
K2lmZXEgKCQoQlIyX1BBQ0tBR0VfUVQ1UVVJQ0tDT05UUk9MUzIpLHkpCj4gK1FUNURPQ19ERVBF
TkRFTkNJRVMgKz0gcXQ1cXVpY2tjb250cm9sczIKPiArZW5kaWYKPiArCj4gK2lmZXEgKCQoQlIy
X1BBQ0tBR0VfUVQ1WE1MUEFUVEVSTlMpLHkpCj4gK1FUNURPQ19ERVBFTkRFTkNJRVMgKz0gcXQ1
eG1scGF0dGVybnMKPiArZW5kaWYKPiArCj4gK1FUNURPQ19MSUNFTlNFID0gR0ZETC0xLjMKPiAr
UVQ1RE9DX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFLkZETAo+ICsKPiArJChldmFsICQocW1ha2Ut
cGFja2FnZSkpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
