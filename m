Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CD5EC1EB8
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 13:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D79261115;
	Thu,  5 Feb 2026 13:36:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JhOcdL9FR_Cz; Thu,  5 Feb 2026 13:36:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 319006110C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770298572;
	bh=fG8B8XrMjrQfDPf0TNYnNN4X968jR1OymnFsqeR6CqY=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SXaAdlK/TShRFSoxJG4lZEVxRS5p4quLT+2J7fETDbiOlnc5kq5lhW3zIckbGhLhV
	 Zr143GHJVqjW0iqFDRY1mevwx0EEMIrB2FKKkAfJzoZznzkT4SNroMAh1qdhiwNl1p
	 LO3kqmrmQ2GYrGLlZgoWr/m82/3P7iXDSs+3cdXJO1zhJVk/nEbyGfcx/VZASXeYLR
	 T2gL26LD9DOxrkfxMg0/cozZ8JKFC9NqeHoKtibWrEBEpyWnMdkmOPqFN4yITerX1q
	 rv7nTMTy38IcyWxAA5nGdymhLCdxwKQuvGiIJiQF6MbaK8e7fDPdXFPU7bchM5ERAt
	 ZNdaWpPBmTF5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 319006110C;
	Thu,  5 Feb 2026 13:36:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BA897117
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 13:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B23FF61103
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 13:36:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GKT2rd9e3B0v for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 13:36:10 +0000 (UTC)
X-Greylist: delayed 168673 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 05 Feb 2026 13:36:08 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5AF0A61100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AF0A61100
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.32.96.102;
 helo=10.mo550.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 10.mo550.mail-out.ovh.net (10.mo550.mail-out.ovh.net
 [178.32.96.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5AF0A61100
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 13:36:08 +0000 (UTC)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.109.249.43])
 by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4f6J235pZmz5y1m
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 13:28:11 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-jxmxn (unknown [10.110.168.56])
 by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 29F45C02BB;
 Thu,  5 Feb 2026 13:28:11 +0000 (UTC)
Received: from armadeus.com ([37.59.142.98])
 by ghost-submission-7d8d68f679-jxmxn with ESMTPSA
 id 5k1tAOuahGkAhgAA7U3BbQ
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Thu, 05 Feb 2026 13:28:11 +0000
X-OVh-ClientIp: 90.126.104.208
Message-ID: <e2a9dfc8-3b0b-4397-b453-76c88ca2a781@armadeus.com>
Date: Thu, 5 Feb 2026 14:28:10 +0100
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
 <981f9938-a716-40fe-9e02-af9fd84ac8f3@armadeus.com>
 <fa075240-a629-4f07-87d5-717c8dcca539@gmail.com>
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
In-Reply-To: <fa075240-a629-4f07-87d5-717c8dcca539@gmail.com>
X-Ovh-Tracer-Id: 11163016102312537087
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFIdl34VvxHunBfCRFE2khrGiU0UBweyV4cWPDSBrXUoQ3CAjylH0N6+mkuJ3YWr9nehudG1XvuuoHuhlX9MXSnx3pxDLk0LIIz242Dr5+/STiKAt4rKKyo2Nvh9Vz+vegPjkfyLZhW7h1h4ivn6/WLtislnxmh05LjgX7VFxzsuLtpu0da4pqbtN93FWR+DcASg0CNhw7mhVaeeB0VcS8ifLWebu88q164/CosEwSsi4sYavamXJHs1OpNRBKIPqk+Q34YXTjpXg3Lc5bFGeLpgT/oQh+2TsCAPeoMWqOm5KC/K1IakKjV/OqlmIL0eFKU+SU+rvn7sGl39EgCYmVpRrXCfeyHXzRWD+g9gcNweg/YoP1vkqUm1ZLiQFQrsYeApwaOMTcpLKnn/OeEgxYMuUrjRW0W7Iuj8MrvHrHJbB4UjkX4+ELay41qja4xTUqDwt7Y5M9eC050HTOyfTx5cya6TOuJ+r7u6GrcuigXL1A2zPIjJfdXyt0t6Vbne/JXqdSZ4NWlNw505NkV0tefyHiMfDKgZ9y0R0XKbHD/h4V6IhlRDMXUUv9wvXU/tE3vF4pfRsoW5zcQqY9NhPOsKlbxTKIgvRREezV8JXYKTKIQP8WCZCWqAHlUQOk5GMfqOtW8oPIlmcxUc9PrTPuclQMI2Ka8sDSANwCY2Hcg6Q
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=HmTpBeceJZAIqWQCjKECFERiBDyuqhuYisJAKBgsd2I=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1770298091; v=1;
 b=TynWDDIa8CnkxVjxz+NE1Cp3HRnhBWT688+tM3Nb+pIuD+2kd1ztllaXKIIsuv3ojbf4yc/s
 fLosR/7vNLOYgC9EfXZCjAzS5OeKVNodKIHQz/V7PLI5xdf0kqNDbMJAsUR8UKZElgVrmlM7tjt
 tkfeOUz/sZRJe6M2Ayq05HrkV8dgwImjraDuGubQhckPWuwdT0fh9Mm95QVjnYgNKnaU2Y6h/oA
 CgM/+5KfnTEKB5YMRBBYC3nBBXQFbpxWmjHEHNE/fOoM/Bjn8Fhvr0KBWEguO9hkNgeszto2LD4
 46LS+J7jbPMloNxdkojeEkrwxPhfibGhCTFexBcecQCFA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=TynWDDIa
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-98R00291485677-8dd9-4545-ad87-9a63dd804dcb,
 E3BC16B8B6151699EFFED511E16BA3714B008AB6)
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

SGVsbG8gTGF1cmVudGl1LCBhbGwsCgpPbiAyLzMvMjYgNTo0MCBQTSwgTGF1cmVudGl1IE1paGFs
Y2VhIHdyb3RlOgo+IAo+IE9uIDIvMy8yMDI2IDU6NTIgUE0sIFPDqWJhc3RpZW4gU3p5bWFuc2tp
IHdyb3RlOgo+PiBIZWxsbyBMYXVyZW50aXUsIGFsbCwKPj4KPj4gT24gMi8zLzI2IDQ6MzYgUE0s
IExhdXJlbnRpdSBNaWhhbGNlYSB3cm90ZToKPj4+IEZyb206IExhdXJlbnRpdSBNaWhhbGNlYSA8
bGF1cmVudGl1Lm1paGFsY2VhQG54cC5jb20+Cj4+Pgo+Pj4gSGkgZm9sa3MsCj4+Pgo+Pj4gVGhp
cyBzZXJpZXMgaW50cm9kdWNlcyBzdXBwb3J0IGZvciBOWFAncyBJTVg5NS0xNXgxNS1GUkRNIGJv
YXJkLgo+Pgo+PiBOaWNlISBJIHdhcyB3b3JraW5nIG9uIGFkZGluZyBpLk1YOTUgdG9vIGFuZCBq
dXN0IHNhdyB5b3VyIHBhdGNoZXMhIEkgd2lsbCB0cnkgeW91IHBhdGNoZXMgdGhlbiEKPiAKPiAK
PiBUaGFua3MsIGxldCBtZSBrbm93IGlmIHlvdSBoYXZlIGFueSBmZWVkYmFjayA6KQoKSSB3YXMg
aG9waW5nIHRvIGJlIGFibGUgdG8gdGVzdCB5b3VyIHBhdGNoZXMgb24gbXkgTVg5NUxQNFhFVkst
MTUgYnV0IGl0IApoYXMgYW4gaU1YOTUgQTEgOi8gSXQgbG9va3MgbGlrZSB0aGUgbGF0ZXN0IHJl
bGVhc2UgKExGNi4xMi40OS0yLjIuMCkgCm9ubHkgc3VwcG9ydHMgQjAsIHJpZ2h0ID8KClJlZ2Fy
ZHMsCgo+IAo+IAo+Pgo+Pj4KPj4+IFNvLCBhIGxpdHRsZSBiaXQgYWJvdXQgdGhlIGJvYXJkOiBh
cyBvZiB0b2RheSwgdGhlIGJvYXJkIGhhc24ndCBiZWVuCj4+PiBvZmZpY2lhbGx5IGxhdW5jaGVk
LCBidXQsIGFzIGZhciBhcyBJIHdhcyB0b2xkLCB0aGlzIHNob3VsZCBoYXBwZW4gaW4gdGhpcwo+
Pj4gcXVhcnRlci4gQmVjYXVzZSBvZiB0aGlzLCB3ZSBzdGlsbCBoYXZlIHNvbWUgZ2FwcyB0byBm
aWxsIGluIHRoZQo+Pj4gZG9jdW1lbnRhdGlvbiAoc2VlIG1pc3NpbmcgbGlua3MgZnJvbSB0aGUg
Ym9hcmQncyByZWFkbWUudHh0KS4KPj4+Cj4+PiBTb21lIGhhcmR3YXJlLXJlbGF0ZWQgaW5mb3Jt
YXRpb24gZm9yIHRoZSBib2FyZCAobm90IGV4aGF1c3RpdmUpOgo+Pj4KPj4+ICDCoMKgIDEpIEJh
c2VkIG9uIE1YOTUgMTV4MTUgQjAgc2lsaWNvbi4KPj4+ICDCoMKgIDIpIDhHQiBMUEREUjRYIERS
QU0KPj4+ICDCoMKgIDMpIDMyR0IgZU1NQwo+Pj4gIMKgwqAgNCkgMiB4IEVORVQgMUdCcwo+Pj4K
Pj4+IFNvbWUgY29tbWVudHMgcmVnYXJkaW5nIHRoZSBjaGFuZ2VzIGludHJvZHVjZWQgYnkgdGhp
cyBzZXJpZXM6Cj4+Pgo+Pj4gIMKgwqAgMSkgaW14LW1raW1hZ2UgdmVyc2lvbiBidW1wIHdhcyBk
b25lIGJlY2F1c2UgdGhlIGJvYXJkIGRpZG4ndCBzZWVtCj4+PiAgwqDCoCB0byBiZSBhYmxlIHRv
IGJvb3QgdXNpbmcgdGhlIHByZXZpb3VzIHZlcnNpb24uCj4+Pgo+Pj4gIMKgwqAgMikgZmlybXdh
cmUtZWxlLWlteCB2ZXJzaW9uIGJ1bXAgd2FzIGRvbmUgYmVjYXVzZSBwcmV2aW91cyB2ZXJzaW9u
Cj4+PiAgwqDCoCBkaWRuJ3QgaW5jbHVkZSB0aGUgZmlybXdhcmUgZm9yIEIwIHJldmlzaW9uIChp
dCBvbmx5IHNlZW1lZCB0byBpbmNsdWRlCj4+PiAgwqDCoCB0aGUgb25lIGZvciBBMCkuCj4+Cj4+
IEkgaGF2ZSBzZW50IHBhdGNoZXMgdG8gYnVtcCBzZXZlcmFsIGkuTVggcGFja2FnZXM6Cj4+Cj4+
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2J1aWxkcm9vdC8yMDI2MDIwMy1idW1wLWlteC1wYWNr
YWdlcy1sZi02LTEyLTQ5LTItMi0wLXYxLTEtNTQ4ZjNmYzc3YTU5QGFybWFkZXVzLmNvbS8KPj4K
Pj4gUmVnYXJkcywKPiAKPiAKPiBBaCwgdmVyeSBzb3JyeSBmb3IgdGhlIGR1cGxpY2F0aW9uLiBZ
b3VyIHBhdGNoZXMgc2hvdWxkIGJlIGFsbCB0aGUgYnVtcHMgd2UgbmVlZC4KPiAKPiBXaWxsIGRy
b3AgdGhlIHVwZGF0ZXMgZnJvbSB0aGlzIHNlcmllcyBvbmNlIHlvdXJzIGxhbmRzLgo+IAo+IAo+
IFRoYW5rcywKPiAKPiBMYXVyZW50aXUKPiAKCgotLSAKU8OpYmFzdGllbiBTenltYW5za2ksIEFy
bWFkZXVzIFN5c3RlbXMKU29mdHdhcmUgZW5naW5lZXIKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
