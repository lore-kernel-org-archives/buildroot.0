Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36209C433EF
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 21:15:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53E9C61151
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 21:15:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 53E9C61151
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2B3240439;
	Fri, 15 Oct 2021 21:15:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DR8v8mQRNWcG; Fri, 15 Oct 2021 21:15:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DE72407C5;
	Fri, 15 Oct 2021 21:15:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 411151BF417
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 21:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3045460661
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 21:15:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D7alnMcAzmzn for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 21:15:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2D928605F9
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 21:15:20 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id d3so42731407edp.3
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 14:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MdeNJZzFDErIIyJ0Xr739AGXUmz0A4TO4wWUxrf/+JM=;
 b=IIcI6UB58s2wtIrteWPoAhmjU5WaaxLvZAs6EzVo0TU9jk4hN/imMGjlPslwkUl19R
 kJc/Dknq92kzCzvO+a+I26RtikSYABlZAUhHH2mxCfU+lCdDcfe/wQcVf6VdjnUymYDq
 /7EGjXrhcDDxTjbWgvYHTQoNWHFYBoXq+A8BQCQDtvTCGcA///1SGujpW2F3T/Kn+ei7
 ntyVs1w/A9kZzaqxOLkfiiflxZbZ0kecC3hxDm9C0vKd6cq6fjKJWD5nTjKx2Ufy1VQX
 yPXjJqmK705ibFaqxw2rFS+NYRVQ3/ecszXzPHUmFcLaxHkdCt0yucFUqigA7LJw0T3w
 fzRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MdeNJZzFDErIIyJ0Xr739AGXUmz0A4TO4wWUxrf/+JM=;
 b=XYpv3mNzdiK98RDQLZgvkcmGSK7qCLLCBD8j+rhBjiaCV69DaVA3JEAJiCfrTKlu9k
 TMyd6J1akidDVAcqtc9HymNQPrZV+Dxd6zUWyzF5CCm/5BPFzj8YyeRyCjDfdsqvcddr
 rt1TVaxKBJxx9r8N/GyFT9HiWWaO07/eGF5YDs8fQ3HgSUouq/EZ/mG6ZWatfMjnCfi0
 P1Dk1UFTgrUfv7NubMspOSENklDWqA6I2m3PT9MG+lvIck0j6nk0/I3el2miVyH9wN+0
 bGoB0kQJix84ZMWZ3kwjxcqCZuSeonW+AhK1Q9ftrTfEF1e95LSo6gtZBLJgteKkG954
 l1tw==
X-Gm-Message-State: AOAM532CwYZqABc6IJwiiG6ARX0MelbztPnHLelN0JnIhP0F/DwfY7nE
 q+GcmnLsC2b+wrHS11usqL4KTA==
X-Google-Smtp-Source: ABdhPJx6Uids2VxAjzgWUnvTMdpNazRZ1m0TdeU2zbsR4WpsUgec6Apd5RKQUbM63bGf7dqEFVUiQQ==
X-Received: by 2002:a05:6402:11c9:: with SMTP id
 j9mr20552419edw.373.1634332519256; 
 Fri, 15 Oct 2021 14:15:19 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id ck13sm5575207edb.0.2021.10.15.14.15.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 14:15:18 -0700 (PDT)
Message-ID: <ba34a87f-65a9-ab02-b6f2-4231fbc482cd@mind.be>
Date: Fri, 15 Oct 2021 23:15:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: =?UTF-8?Q?S=c3=a9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>,
 buildroot@buildroot.org
References: <20211011171314.22564-1-sebastien.szymanski@armadeus.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211011171314.22564-1-sebastien.szymanski@armadeus.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/stress-ng: bump to version
 0.13.04
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxMS8xMC8yMDIxIDE5OjEzLCBTw6liYXN0aWVuIFN6eW1hbnNraSB3cm90ZToKPiBTaWdu
ZWQtb2ZmLWJ5OiBTw6liYXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1h
ZGV1cy5jb20+Cj4gLS0tCj4gICBwYWNrYWdlL3N0cmVzcy1uZy9zdHJlc3MtbmcuaGFzaCB8IDIg
Ky0KPiAgIHBhY2thZ2Uvc3RyZXNzLW5nL3N0cmVzcy1uZy5tayAgIHwgMiArLQo+ICAgMiBmaWxl
cyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL3BhY2thZ2Uvc3RyZXNzLW5nL3N0cmVzcy1uZy5oYXNoIGIvcGFja2FnZS9zdHJlc3Mtbmcv
c3RyZXNzLW5nLmhhc2gKPiBpbmRleCBmM2ViNzZmYTgyLi4yZmRkODlhNDkxIDEwMDY0NAo+IC0t
LSBhL3BhY2thZ2Uvc3RyZXNzLW5nL3N0cmVzcy1uZy5oYXNoCj4gKysrIGIvcGFja2FnZS9zdHJl
c3Mtbmcvc3RyZXNzLW5nLmhhc2gKPiBAQCAtMSwzICsxLDMgQEAKPiAgICMgTG9jYWxseSBjYWxj
dWxhdGVkCj4gLXNoYTI1NiAgZjM3ZjczOWU0ZDE1MzQzMzYwYTQ3OTgwYjY3ZGM4YjJhNmJmM2Q0
ZDNlZjcyN2Q1NWUyZGQ5OWEwYjY0ZjllYSAgc3RyZXNzLW5nLTAuMTMuMDEudGFyLnh6Cj4gK3No
YTI1NiAgMDI3Nzk0MzAzM2ZjOTc1MGFhODY5YjNmYTEwOTY2M2YzNTQwZDIzM2EzZGRjMzAwZDNh
ODY5ZWNiZDU2ZjQ1MSAgc3RyZXNzLW5nLTAuMTMuMDQudGFyLnh6Cj4gICBzaGEyNTYgIDgxNzdm
OTc1MTMyMTM1MjZkZjJjZjYxODRkOGZmOTg2YzY3NWFmYjUxNGQ0ZTY4YTQwNDAxMDUyMWI4ODA2
NDMgIENPUFlJTkcKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9zdHJlc3Mtbmcvc3RyZXNzLW5nLm1r
IGIvcGFja2FnZS9zdHJlc3Mtbmcvc3RyZXNzLW5nLm1rCj4gaW5kZXggZTBiMzg1ZTc1Ni4uYjhm
N2NlOTU2YiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3N0cmVzcy1uZy9zdHJlc3MtbmcubWsKPiAr
KysgYi9wYWNrYWdlL3N0cmVzcy1uZy9zdHJlc3MtbmcubWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAg
ICMKPiAgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gICAKPiAtU1RSRVNTX05HX1ZFUlNJT04g
PSAwLjEzLjAxCj4gK1NUUkVTU19OR19WRVJTSU9OID0gMC4xMy4wNAoKPj4+IHN0cmVzcy1uZyAw
LjEzLjA0IERvd25sb2FkaW5nCndnZXQgLS1wYXNzaXZlLWZ0cCAtbmQgLXQgMyAtTyAKJy9ob21l
L2Fybm91dC9zcmMvYnVpbGRyb290L291dHB1dC9idWlsZC8uc3RyZXNzLW5nLTAuMTMuMDQudGFy
Lnh6LmFVNkZtQy9vdXRwdXQnIAonaHR0cHM6Ly9rZXJuZWwudWJ1bnR1LmNvbS9+Y2tpbmcvdGFy
YmFsbHMvc3RyZXNzLW5nL3N0cmVzcy1uZy0wLjEzLjA0LnRhci54eicKLTIwMjEtMTAtMTUgMjM6
MDQ6MDMtLSAKaHR0cHM6Ly9rZXJuZWwudWJ1bnR1LmNvbS9+Y2tpbmcvdGFyYmFsbHMvc3RyZXNz
LW5nL3N0cmVzcy1uZy0wLjEzLjA0LnRhci54egpSZXNvbHZpbmcga2VybmVsLnVidW50dS5jb20g
KGtlcm5lbC51YnVudHUuY29tKS4uLiA5MS4xODkuOTQuMjE2CkNvbm5lY3RpbmcgdG8ga2VybmVs
LnVidW50dS5jb20gKGtlcm5lbC51YnVudHUuY29tKXw5MS4xODkuOTQuMjE2fDo0NDMuLi4gY29u
bmVjdGVkLgpIVFRQIHJlcXVlc3Qgc2VudCwgYXdhaXRpbmcgcmVzcG9uc2UuLi4gNDA0IE5vdCBG
b3VuZAoyMDIxLTEwLTE1IDIzOjA0OjAzIEVSUk9SIDQwNDogTm90IEZvdW5kLgoKCiAgVGhlIHdo
b2xlIGNraW5nIGRpcmVjdG9yeSBzZWVtcyB0byBoYXZlIHZhbmlzaGVkLi4uCgogIFJlZ2FyZHMs
CiAgQXJub3V0Cgo+ICAgU1RSRVNTX05HX1NPVVJDRSA9IHN0cmVzcy1uZy0kKFNUUkVTU19OR19W
RVJTSU9OKS50YXIueHoKPiAgIFNUUkVTU19OR19TSVRFID0gaHR0cHM6Ly9rZXJuZWwudWJ1bnR1
LmNvbS9+Y2tpbmcvdGFyYmFsbHMvc3RyZXNzLW5nCj4gICBTVFJFU1NfTkdfTElDRU5TRSA9IEdQ
TC0yLjArCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
