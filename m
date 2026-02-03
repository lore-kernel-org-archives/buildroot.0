Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5103E87842
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 16:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AC1A60897;
	Tue,  3 Feb 2026 16:31:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eP608ffNtl90; Tue,  3 Feb 2026 16:31:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D3B7608A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770136299;
	bh=Oq8YS9mO7KZi/+Dz60IcrvIEyy8X1MFugSc2vYWGNGc=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fqryYEWYFOEVeVsnVi62IdCtCb+JaZKQpQmhNrQHslQJxSZNiKREi3EofYmNIhj3f
	 XAIUkZvwjxbHuY5w1eeHCjF9nfM4OlFyx0GQnuME1WVL25oW7k0w8VARcRdEjZyLCc
	 7tnJ7kdmZP1VlZkx5GSpUZpXM4qNDTvHi9WeoWQOa+MhLlTe+qME6BZSHIgNvHWEK8
	 9D/4qFIH39vTNW6xzi1Ipt+SswuncguAYzrZZOvBNlxIgZMXxmDfd68AhgT7NH55wx
	 bvAxQplCPmbemWxOOO07JXM8SSfiPNl+TGI9/5LF1JqJ/C8MXwNXRxHPf2QoMf67GT
	 fosfMbRtDeEqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D3B7608A8;
	Tue,  3 Feb 2026 16:31:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A17BF4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 16:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A90D40070
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 16:31:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AI6ziI2Qe70D for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 16:31:36 +0000 (UTC)
X-Greylist: delayed 1821 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 03 Feb 2026 16:31:35 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4094240025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4094240025
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=188.165.39.218;
 helo=6.mo581.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 6.mo581.mail-out.ovh.net (6.mo581.mail-out.ovh.net
 [188.165.39.218])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4094240025
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 16:31:35 +0000 (UTC)
Received: from director7.ghost.mail-out.ovh.net (unknown [10.109.231.5])
 by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4f57Ky64pCz5yCG
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:52:54 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-gdmj2 (unknown [10.110.118.108])
 by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id A2CEBC020D;
 Tue,  3 Feb 2026 15:52:53 +0000 (UTC)
Received: from armadeus.com ([37.59.142.96])
 by ghost-submission-7d8d68f679-gdmj2 with ESMTPSA
 id aW1BFtUZgmlNAwAAHbWGdg
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Tue, 03 Feb 2026 15:52:53 +0000
X-OVh-ClientIp: 90.126.104.208
Message-ID: <981f9938-a716-40fe-9e02-af9fd84ac8f3@armadeus.com>
Date: Tue, 3 Feb 2026 16:52:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>,
 buildroot@buildroot.org
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Erik Larsson <karl.erik.larsson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabio Estevam <festevam@gmail.com>
References: <20260203153617.80012-1-laurentiumihalcea111@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Autocrypt: addr=sebastien.szymanski@armadeus.com; keydata=
 xsBNBFNfZLEBCACv1lqSePHJNpRgcnER+3emy+Arjz84zFax3XkogjY/e3ZneihIgWrVKe5M
 ql16pX4KTkzNgMUKz4bG/XwT3kjcrXshxFLlg7KrHMl287C+W+QOUjnjVeRi/su+SPmjz8VD
 yr11h+ZkVLAWhS+uQJ93jy1NwG8M4t1kBLAVHHD5Vw4FJ+3ouaVYIp1X1Cr8bVKQw33Q1aTd
 ro0kMBb96B9vNu7ciJZ3gvlaBzUEKOgNnq9KaywuLnqrqr4HUIn5JuxZjCjJzt9kTAKcTfp2
 cJM8qpp+2FF5qtbkse9fZ6M64qozgOPr9Tk4Amf9fZEUQ6UNw14mmBZuXSzoHe75gI7TABEB
 AAHNN1PDqWJhc3RpZW4gU1pZTUFOU0tJIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVz
 LmNvbT7CwJAEEwEIADoCGyMHCwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgBYhBJwGygpYm/1C
 /GCmwbCaKeiBMmTiBQJdhIHLAAoJELCaKeiBMmTixXIH/2W3kbzRG0UF81jtRRnp0H83rjDT
 v0H+8fgFMRL/7HCJ1QPArkfRJlM2wlJkN+ChP09CCarYfUEHfRCHlTb7At6Yyrz1jziD7ZwX
 8IWHYRXnZkY5eZc5DsiUgq6JH49kt+GPzK8UVP9MTa6zkBpPCUf7LzZ4pD3FihdkT52BU3gI
 d9P49fSI0TYySlb/VKn815aOhvwEr7+Dh3mZUjSh7saofbRmVUOr7p+R3MvvGI19/IJZjeOE
 ZWliODDOt6HnBOtoGSXMcNIFF6snH52D5N5gY88njZjTwhgGGUBix1bsgf/EY0v4R5itZBXB
 B/Ze4Tm++YHaB75hZK6PQu/YRv7OwE0EU19ksQEIALo7jhXddrXBTRu5SAjelV53jyHBJTX/
 vN4nL/VbbW/saca+NJjDSxx5DBmotZbQdWIyZiSIjU/xnTREvtDrl6ZeSsKWd7ZqiuiY4fSR
 zwuQp9rd0yqRuxesrWeyJB1zCSdEvLyKASERt+nxkOA+IzJ4y1qLtvnWr+SL1AXgTMw+Tkyw
 KIDCRWHTIYas11ldGj82gOIpYeXnapeNLHfT4EQwg0NeWYHynJxAQWiX5aPlw0uSpAQSsBXQ
 FIe3fpoveMSnXK+PG2BBOzexYv7r4S70a6sF9sgTTPpfKqUaqqC+u1+bUX6alTAKhGKJywaF
 6ViqLlgY8PfwohSyAlqlTRMAEQEAAcLAdgQYAQgAIAIbDBYhBJwGygpYm/1C/GCmwbCaKeiB
 MmTiBQJdhIHSAAoJELCaKeiBMmTitU8IAK7NQM3fEwaF5XaKtepYWsVka44CD8A9e4r7NVK9
 ugirKvXirIxBSDmN/Db862NmVpITsZ6ERNSNZLm/7k55N+TexKYiFZeU7G92TEfAM6qPElvx
 DLEcrkNMq9r08YZeUloacsq31AL5fK4LW+xdvXudkdiKRMJsdTpmff3x5kIziGOHjwFP9wve
 ZgEH52gpbRsP8Whx/Z2lNX/BBRmFM8OnEXFsjjqDzYThdxTq85wGPpkgvvUGyPNRD7TpbB1C
 pajOUUkPxgj5LKt77HD1afeZNudWhgcdkbtT5PMQTT0WY6wvMEj9S1+bGPeXRGWLYB7gHQ+L
 JNoSD7Kz6Y9qnKo=
In-Reply-To: <20260203153617.80012-1-laurentiumihalcea111@gmail.com>
X-Ovh-Tracer-Id: 1861675496749001727
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFGHKWFin2yVHFChA4hJpFmqUs3w9Np6ZdndggLvAD91oDrJvRIrHtdWyjqoUFbec3Vsf4bzpPjL2rr3RWWmna7HTkK34nP+P7MMwZcvMvAre1l9UqazomMt/cN5ar74Gl8utbVG7sRq/pYedIk7av6YnojjkErhlPwMAsl4ekU+0spFwEReZGh08Rb2FxuOtKy5nSfYqjX+XNEEnqugwKPhTJm7fBEHs/lfUJfltsMean60WiIAIvfeBHCEWlFeR5F9V5lyfpy7j2MA1qAAlu0SBrUl18Duyu84fZnSW1nOOuqVJam2TlIzmkrQATercwo5RdV0JEdjspKNHToGnGeS6V3VGnlQrfHyJVdrSdrTH0G4FgewUySStayQLbxpC67hNPPCEOa1WdlctbbrNbB+ZcjWlTg+gohR7DRTkbDimVKr3QIAeBz3XddI2A/1dMwCWLx/JmrYUldbMc2+BKgcxNqRmcd2SlE8SHQ3WS+vsnAvGIHqTGxYoBVSJSHt9wfUsIC5vxqZf522L0xz21p8/I+n6IiiLMeXvEE4hR6OebjXiOWzfcFZRnbpTNrRfbaHRu4ZmsNpL+8CKDnk4UKkkM8NfefkVUcERCQXhSCyA10kLmasdSCEkGEsrLSj/kiIqI4aATpmkBXkb2TbPZhJDNQX6XEhzuw9euH14MYpw
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=ok+MUGSdIQMVWQ6CvH7/WiDoWSupg/gCmS0Uk7DoHkk=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1770133975; v=1;
 b=A+neOsXcwsA78oL2RDgC2qMP5JMW4Zj6MD4mEfjRS//VVbaNPS8Y7OKaDL5O5P0AFrDLebcy
 rg0yZQ1iiZKGS0n5KK33aGTVyxbkBNB3X5Gr4YtBS+zjhA9+FThHTFXbIStXynwcrBogUmAkWWf
 dhmoaoJelnvAkqqEWEItSgQiQqkluhkid0IE4/1JMn6qWwsfnlDVFx85CGYe+nwG+aZQ8ARPV2Q
 nzCyu94SywUZw2eOfnbWBiU/webyCFXr6OcOVFidGMaVg47DXZgIKoMU3RgPk0Ne7OgSTfwgJMR
 dTfau5p6eoLgmocL683XEE0jJm2c3oZax2KLdnsHxPz1A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=A+neOsXc
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0010f2d752f-011e-40c5-a585-e6cc73773b10,
 004BD5E907DC429EAD4B1A0856BA767B03FD8B65)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: Re: [Buildroot] [PATCH 00/10] Add support for IMX95-15x15-FRDM board
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

SGVsbG8gTGF1cmVudGl1LCBhbGwsCgpPbiAyLzMvMjYgNDozNiBQTSwgTGF1cmVudGl1IE1paGFs
Y2VhIHdyb3RlOgo+IEZyb206IExhdXJlbnRpdSBNaWhhbGNlYSA8bGF1cmVudGl1Lm1paGFsY2Vh
QG54cC5jb20+Cj4gCj4gSGkgZm9sa3MsCj4gCj4gVGhpcyBzZXJpZXMgaW50cm9kdWNlcyBzdXBw
b3J0IGZvciBOWFAncyBJTVg5NS0xNXgxNS1GUkRNIGJvYXJkLgoKTmljZSEgSSB3YXMgd29ya2lu
ZyBvbiBhZGRpbmcgaS5NWDk1IHRvbyBhbmQganVzdCBzYXcgeW91ciBwYXRjaGVzISBJIAp3aWxs
IHRyeSB5b3UgcGF0Y2hlcyB0aGVuIQoKPiAKPiBTbywgYSBsaXR0bGUgYml0IGFib3V0IHRoZSBi
b2FyZDogYXMgb2YgdG9kYXksIHRoZSBib2FyZCBoYXNuJ3QgYmVlbgo+IG9mZmljaWFsbHkgbGF1
bmNoZWQsIGJ1dCwgYXMgZmFyIGFzIEkgd2FzIHRvbGQsIHRoaXMgc2hvdWxkIGhhcHBlbiBpbiB0
aGlzCj4gcXVhcnRlci4gQmVjYXVzZSBvZiB0aGlzLCB3ZSBzdGlsbCBoYXZlIHNvbWUgZ2FwcyB0
byBmaWxsIGluIHRoZQo+IGRvY3VtZW50YXRpb24gKHNlZSBtaXNzaW5nIGxpbmtzIGZyb20gdGhl
IGJvYXJkJ3MgcmVhZG1lLnR4dCkuCj4gCj4gU29tZSBoYXJkd2FyZS1yZWxhdGVkIGluZm9ybWF0
aW9uIGZvciB0aGUgYm9hcmQgKG5vdCBleGhhdXN0aXZlKToKPiAKPiAgICAxKSBCYXNlZCBvbiBN
WDk1IDE1eDE1IEIwIHNpbGljb24uCj4gICAgMikgOEdCIExQRERSNFggRFJBTQo+ICAgIDMpIDMy
R0IgZU1NQwo+ICAgIDQpIDIgeCBFTkVUIDFHQnMKPiAKPiBTb21lIGNvbW1lbnRzIHJlZ2FyZGlu
ZyB0aGUgY2hhbmdlcyBpbnRyb2R1Y2VkIGJ5IHRoaXMgc2VyaWVzOgo+IAo+ICAgIDEpIGlteC1t
a2ltYWdlIHZlcnNpb24gYnVtcCB3YXMgZG9uZSBiZWNhdXNlIHRoZSBib2FyZCBkaWRuJ3Qgc2Vl
bQo+ICAgIHRvIGJlIGFibGUgdG8gYm9vdCB1c2luZyB0aGUgcHJldmlvdXMgdmVyc2lvbi4KPiAK
PiAgICAyKSBmaXJtd2FyZS1lbGUtaW14IHZlcnNpb24gYnVtcCB3YXMgZG9uZSBiZWNhdXNlIHBy
ZXZpb3VzIHZlcnNpb24KPiAgICBkaWRuJ3QgaW5jbHVkZSB0aGUgZmlybXdhcmUgZm9yIEIwIHJl
dmlzaW9uIChpdCBvbmx5IHNlZW1lZCB0byBpbmNsdWRlCj4gICAgdGhlIG9uZSBmb3IgQTApLgoK
SSBoYXZlIHNlbnQgcGF0Y2hlcyB0byBidW1wIHNldmVyYWwgaS5NWCBwYWNrYWdlczoKCmh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2J1aWxkcm9vdC8yMDI2MDIwMy1idW1wLWlteC1wYWNrYWdlcy1s
Zi02LTEyLTQ5LTItMi0wLXYxLTEtNTQ4ZjNmYzc3YTU5QGFybWFkZXVzLmNvbS8KClJlZ2FyZHMs
Cgo+IAo+ICAgIDMpIE1YOTUgc2VyaWVzIChhcyB3ZWxsIGFzIE1YOTQpIHJlcXVpcmVzIHN5c3Rl
bSBtYW5hZ2VyIChTTSkgYW5kIEREUgo+ICAgIE9FSSAocGVyaGFwcyBldmVuIHRoZSBUQ00gb25l
IGlmIG9sZGVyIHNpbGljb24gcmV2aXNpb24sIGJ1dCB3ZSBkb24ndAo+ICAgIGhhbmRsZSB0aGF0
IHlldCksIHdoaWNoIGlzIHdoeSB3ZSBoYXZlIDIgbmV3IHBhY2thZ2VzLgo+IAo+ICAgIDQpIExQ
RERSNHggRERSIEZXIGhhbmRsaW5nIHNlZW1zIHRvIGRpZmZlciBhIGJpdCBmcm9tIHByZXZpb3Vz
Cj4gICAgdmVyc2lvbnMsIHRodXMgdGhlIGNoYW5nZXMgdG8gdGhlIGZpcm13YXJlLWlteCBwYWNr
YWdlLgo+IAo+IE90aGVyIHRoYW4gdGhpcywgd2UgaGF2ZSB0aGUgRFRTIHN1cHBvcnQgYWxyZWFk
eSBtZXJnZWQgaW4gbGludXgtbmV4dCB2aWEKPiBbMV0gc28gaG9wZWZ1bGx5IHdlJ2xsIGJlIGFi
bGUgdG8gdHJhbnNpdGlvbiB0byBhbiB1cHN0cmVhbSBrZXJuZWwgc29vbi4KPiAKPiBbMV06IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWRldmljZXRyZWUvMjAyNjAxMTYtMTI3LXYzLTAt
M2RjNDk1NDVhNzQ1QG54cC5jb20vCj4gCj4gVGhhbmtzLAo+IExhdXJlbnRpdQo+IAo+IExhdXJl
bnRpdSBNaWhhbGNlYSAoMTApOgo+ICAgIHBhY2thZ2UvZnJlZXNjYWxlLWlteDogYWRkIGkuTVg5
NSBzdXBwb3J0Cj4gICAgYm9hcmQvZnJlZXNjYWxlL2NvbW1vbi9pbXgvcG9zdC1pbWFnZS5zaDog
YWRkIGkuTVg5NSBzdXBwb3J0Cj4gICAgcGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC1zbTogYWRk
IFNNIHBhY2thZ2UKPiAgICBwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LW9laTogYWRkIE9FSSBw
YWNrYWdlCj4gICAgcGFja2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJlLWVsZS1pbXg6IGJ1bXAg
dG8gdmVyc2lvbiAyLjAuNAo+ICAgIHBhY2thZ2UvZnJlZXNjYWxlLWlteC9maXJtd2FyZS1lbGUt
aW14OiBhZGQgaS5NWDk1IEIwIHN1cHBvcnQKPiAgICBwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvZmly
bXdhcmUtaW14OiBzdXBwb3J0IGkuTVg5NSdzIExQRERSNHggRlcKPiAgICBwYWNrYWdlL2lteC1t
a2ltYWdlOiBidW1wIHRvIHZlcnNpb24gbGYtNi4xMi40OS0yLjIuMAo+ICAgIGJvYXJkL2ZyZWVz
Y2FsZTogYWRkIGkuTVg5NSBzdXBwb3J0Cj4gICAgY29uZmlncy9mcmVlc2NhbGVfaW14OTVfMTV4
MTVfZnJkbTogbmV3IGRlZmNvbmZpZwo+IAo+ICAgREVWRUxPUEVSUyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDQgKysKPiAgIC4uLi9jb21tb24vaW14L2lteDk1LWJvb3Rs
b2FkZXItcHJlcGFyZS5zaCAgICB8IDYwICsrKysrKysrKysrKysrKysrKwo+ICAgYm9hcmQvZnJl
ZXNjYWxlL2NvbW1vbi9pbXgvcG9zdC1pbWFnZS5zaCAgICAgIHwgIDIgKwo+ICAgLi4uL2FybS10
cnVzdGVkLWZpcm13YXJlLmhhc2ggICAgICAgICAgICAgICAgIHwgIDIgKwo+ICAgLi4uL3BhdGNo
ZXMvbGludXgtaGVhZGVycy9saW51eC1oZWFkZXJzLmhhc2ggIHwgIDEgKwo+ICAgLi4uL2lteDk1
LTE1eDE1LWZyZG0vcGF0Y2hlcy9saW51eC9saW51eC5oYXNoIHwgIDIgKwo+ICAgLi4uL2lteDk1
LTE1eDE1LWZyZG0vcGF0Y2hlcy91Ym9vdC91Ym9vdC5oYXNoIHwgIDIgKwo+ICAgYm9hcmQvZnJl
ZXNjYWxlL2lteDk1LTE1eDE1LWZyZG0vcmVhZG1lLnR4dCAgIHwgNjMgKysrKysrKysrKysrKysr
KysrKwo+ICAgY29uZmlncy9mcmVlc2NhbGVfaW14OTVfMTV4MTVfZnJkbV9kZWZjb25maWcgIHwg
MzcgKysrKysrKysrKysKPiAgIHBhY2thZ2UvZnJlZXNjYWxlLWlteC9Db25maWcuaW4gICAgICAg
ICAgICAgICB8IDIzICsrKysrKy0KPiAgIC4uLi9mcmVlc2NhbGUtaW14L2Zpcm13YXJlLWVsZS1p
bXgvQ29uZmlnLmluICB8ICAxICsKPiAgIC4uLi9maXJtd2FyZS1lbGUtaW14L2Zpcm13YXJlLWVs
ZS1pbXguaGFzaCAgICB8ICA2ICstCj4gICAuLi4vZmlybXdhcmUtZWxlLWlteC9maXJtd2FyZS1l
bGUtaW14Lm1rICAgICAgfCAgNCArLQo+ICAgcGFja2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJl
LWlteC9Db25maWcuaW4gIHwgMTMgKysrLQo+ICAgLi4uL2Zpcm13YXJlLWlteC9maXJtd2FyZS1p
bXgubWsgICAgICAgICAgICAgIHwgMzkgKysrKysrKysrKysrCj4gICBwYWNrYWdlL2ZyZWVzY2Fs
ZS1pbXgvaW14LW9laS9Db25maWcuaW4gICAgICAgfCAyMSArKysrKysrCj4gICBwYWNrYWdlL2Zy
ZWVzY2FsZS1pbXgvaW14LW9laS9pbXgtb2VpLmhhc2ggICAgfCAgNCArKwo+ICAgcGFja2FnZS9m
cmVlc2NhbGUtaW14L2lteC1vZWkvaW14LW9laS5tayAgICAgIHwgMjkgKysrKysrKysrCj4gICBw
YWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LXNtL0NvbmZpZy5pbiAgICAgICAgfCAxNSArKysrKwo+
ICAgcGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC1zbS9pbXgtc20uaGFzaCAgICAgIHwgIDQgKysK
PiAgIHBhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtc20vaW14LXNtLm1rICAgICAgICB8IDMzICsr
KysrKysrKysKPiAgIHBhY2thZ2UvaW14LW1raW1hZ2UvaW14LW1raW1hZ2UuaGFzaCAgICAgICAg
ICB8ICAyICstCj4gICBwYWNrYWdlL2lteC1ta2ltYWdlL2lteC1ta2ltYWdlLm1rICAgICAgICAg
ICAgfCAgMiArLQo+ICAgMjMgZmlsZXMgY2hhbmdlZCwgMzYwIGluc2VydGlvbnMoKyksIDkgZGVs
ZXRpb25zKC0pCj4gICBjcmVhdGUgbW9kZSAxMDA3NTUgYm9hcmQvZnJlZXNjYWxlL2NvbW1vbi9p
bXgvaW14OTUtYm9vdGxvYWRlci1wcmVwYXJlLnNoCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgYm9h
cmQvZnJlZXNjYWxlL2lteDk1LTE1eDE1LWZyZG0vcGF0Y2hlcy9hcm0tdHJ1c3RlZC1maXJtd2Fy
ZS9hcm0tdHJ1c3RlZC1maXJtd2FyZS5oYXNoCj4gICBjcmVhdGUgbW9kZSAxMjAwMDAgYm9hcmQv
ZnJlZXNjYWxlL2lteDk1LTE1eDE1LWZyZG0vcGF0Y2hlcy9saW51eC1oZWFkZXJzL2xpbnV4LWhl
YWRlcnMuaGFzaAo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGJvYXJkL2ZyZWVzY2FsZS9pbXg5NS0x
NXgxNS1mcmRtL3BhdGNoZXMvbGludXgvbGludXguaGFzaAo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGJvYXJkL2ZyZWVzY2FsZS9pbXg5NS0xNXgxNS1mcmRtL3BhdGNoZXMvdWJvb3QvdWJvb3QuaGFz
aAo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGJvYXJkL2ZyZWVzY2FsZS9pbXg5NS0xNXgxNS1mcmRt
L3JlYWRtZS50eHQKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25maWdzL2ZyZWVzY2FsZV9pbXg5
NV8xNXgxNV9mcmRtX2RlZmNvbmZpZwo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvZnJl
ZXNjYWxlLWlteC9pbXgtb2VpL0NvbmZpZy5pbgo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2th
Z2UvZnJlZXNjYWxlLWlteC9pbXgtb2VpL2lteC1vZWkuaGFzaAo+ICAgY3JlYXRlIG1vZGUgMTAw
NjQ0IHBhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtb2VpL2lteC1vZWkubWsKPiAgIGNyZWF0ZSBt
b2RlIDEwMDY0NCBwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LXNtL0NvbmZpZy5pbgo+ICAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtc20vaW14LXNtLmhhc2gK
PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LXNtL2lteC1z
bS5tawo+IAoKCi0tIApTw6liYXN0aWVuIFN6eW1hbnNraSwgQXJtYWRldXMgU3lzdGVtcwpTb2Z0
d2FyZSBlbmdpbmVlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
