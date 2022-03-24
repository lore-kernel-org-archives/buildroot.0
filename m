Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74338C433F5
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 21:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2BF1641088;
	Thu, 24 Mar 2022 21:43:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wr5UXBwFk9km; Thu, 24 Mar 2022 21:42:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BAC794107C;
	Thu, 24 Mar 2022 21:42:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EFD581BF313
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 21:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEBFC8449F
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 21:42:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vijn2pE49eNF for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 21:42:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CE4C684499
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 21:42:55 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id dr20so11792369ejc.6
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 14:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=vzC2SBZWO26sXYkuh3C0YNCqdECN+52B8YD+zygtUaA=;
 b=dI4HGZ8wtMg/mZTGfpHU+W+RWkCJ8tjGvOfklMFBVqJ1rpckMC+DR3H98qSV+fEKuM
 GEOwSD5LZeLp7cvTCrX9Q/vyQevx3bHkA8xbaqGwrHeaQAC36aguRlbuwPhWdpnxYK89
 /LWoggKAxH5mxWfOzL8y5MD6WI1J7CQujkkp1ZUJ/2SAP6J3GvqVU1aq2ztoShneLtBT
 kvMxji5DnBoI3TYfyu9tRGv2WTpdbk3vl5dz8P3ZtaEzj5aOIfWPvsTGh8S0pz/2Fx70
 xlhlERmkciFDjYLTiDS8sSgtmc7SXb1JOObhJOKPOex6BBNGzToLqVQBghIW5D4deytL
 7cbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=vzC2SBZWO26sXYkuh3C0YNCqdECN+52B8YD+zygtUaA=;
 b=THSP7rbBTZ83i7pS+geDfj95USXNQDMVJRZkoCWA0FICsFoGfwL2moqqrQ90vZkGAz
 jsSG9CN87b+7YuRl5Dhn/V/yzWvMRSGjTpB3+cTvQD2ppULICk8t1KxS03C+YIw5qhDR
 wB9MMGLX8wt7ppNGY78tPfon7mkTX/kDsPUWmSf6foS2Go5+bojxO1aUWKlyVrzQ2MjR
 Ok04/WPrj/M2CssOmYcUNm33H6MOL6uYfvaA2tfIihcDDEF+LoBBgh+C/MV3KvHq0F46
 pndOZzwZ0PX8cMUmzG0Bx7uEIwbQksmBiMZZxFARuXsn+eYHWLQ7WjjQpQPrt3w0n5ft
 arXA==
X-Gm-Message-State: AOAM530ymgqq0mqTLU3UWv9XGtTBatdKGyk9RXL9XjKEG3M8bObrpzid
 TWB+x87Y5fWRnqJ2PyHTpoCmgQ==
X-Google-Smtp-Source: ABdhPJzfEYiaqrw2lqt/UmKmbxsOfNj1JlKAlFbf9Xmsh2+kxsQU2GaeTeME4aC1G8gmrXiFOp3nwA==
X-Received: by 2002:a17:907:8a0d:b0:6d6:dae9:7263 with SMTP id
 sc13-20020a1709078a0d00b006d6dae97263mr7919530ejc.671.1648158174085; 
 Thu, 24 Mar 2022 14:42:54 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 v26-20020a50955a000000b00418ebdb07ddsm1963172eda.56.2022.03.24.14.42.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 14:42:53 -0700 (PDT)
Message-ID: <0f660a9a-f182-05e6-b4a8-143dbb4665a5@mind.be>
Date: Thu, 24 Mar 2022 22:42:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org
References: <20220317163823.2913753-1-foss+buildroot@0leil.net>
 <20220317163823.2913753-2-foss+buildroot@0leil.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220317163823.2913753-2-foss+buildroot@0leil.net>
Subject: Re: [Buildroot] [PATCH 2/3] package/qt5/qt5base: remove leftover
 patch
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNy8wMy8yMDIyIDE3OjM4LCBRdWVudGluIFNjaHVseiB3cm90ZToKPiBGcm9tOiBRdWVu
dGluIFNjaHVseiA8cXVlbnRpbi5zY2h1bHpAdGhlb2Jyb21hLXN5c3RlbXMuY29tPgo+IAo+IENW
RS0yMDIxLTM4NTkzIGZpeGVzIG9yaWdpbmFsbHkgbWlzc2VkIGEgdXNlY2FzZSB0aGF0IHdhcyBj
b3ZlcmVkIGJ5IHRoZQo+IHRvLWJlLXJlbW92ZWQgcGF0Y2guIEhvd2V2ZXIsIHRoaXMgcGF0Y2gg
d2FzIGluY29ycmVjdCBhbmQgYWRkZWQgc29tZQo+IGlzc3VlcyBvbiBpdHMgb3duLCB3aGljaCB3
YXMgdGhlbiBmaXhlZCBieSBub3ctcmVtb3ZlZAo+IDAwMTItUmVmaXgtZm9yLWF2b2lkaW5nLWh1
Z2UtbnVtYmVyLW9mLXRpbnktZGFzaGVzLnBhdGNoLgo+IAo+IFVuZm9ydHVuYXRlbHkgZm9yIHVz
LCB0aGUgdG8tYmUtcmVtb3ZlZCBwYXRjaCAoZml4ZWQgYnkKPiAwMDEyLVJlZml4LWZvci1hdm9p
ZGluZy1odWdlLW51bWJlci1vZi10aW55LWRhc2hlcy5wYXRjaCkgY2FuIGFjdHVhbGx5Cj4gYmUg
YXBwbGllZCAod2l0aCBmdXp6OyBieSBgcGF0Y2hgIG9ubHkpIG9uIHRvcCBvZiB0aGUgbm93LXJl
bW92ZWQgcGF0Y2guCj4gV2hlbiB0aGUgbW92ZSB0byBLREUgUXQgZm9yayB3YXMgbWFkZSwgc29t
ZSBwYXRjaGVzIHdlcmUgcmVtb3ZlZCBhcyB0aGV5Cj4gd2VyZSBhbHJlYWR5IHBhcnQgb2YgdGhl
IG5ldyBnaXQgZm9yay4gSG93ZXZlciwgdGhlIHRvLWJlLXJlbW92ZWQgcGF0Y2gKPiB3YXMgbm90
LiBUaGlzIG1lYW5zIHRoZQo+IDAwMTItUmVmaXgtZm9yLWF2b2lkaW5nLWh1Z2UtbnVtYmVyLW9m
LXRpbnktZGFzaGVzLnBhdGNoIHdhcyBhY3R1YWxseQo+IHVuZG9uZSB3aGVuIEJ1aWxkcm9vdCBw
YXRjaGVkIHF0NWJhc2UuCj4gCj4gTGV0J3MgcmVtb3ZlIHRoaXMgcGF0Y2ggdG8gZml4IHRoaXMg
b3ZlcnNpZ2h0Lgo+IAo+IEFzIGEgcmVmZXJlbmNlOgo+IGU3ZWEyZWQyN2MgSW1wcm92ZSBmaXgg
Zm9yIGF2b2lkaW5nIGh1Z2UgbnVtYmVyIG9mIHRpbnkgZGFzaGVzCj4gZml4ZWQgYnkKPiA2NWIz
YWE2YTFjIFJlZml4IGZvciBhdm9pZGluZyBodWdlIG51bWJlciBvZiB0aW55IGRhc2hlcwo+IGlu
IHRoZSBnaXQgcmVwby4KPiAKPiBGaXhlczogNTc3MGE2NDVhM2E0OSAicGFja2FnZS9xdDU6IGJ1
bXAgcGFja2FnZXMgdG8gbGF0ZXN0IGtkZSBzdWJtb2R1bGUgdmVyc2lvbnMiCj4gQ2M6IFF1ZW50
aW4gU2NodWx6IDxmb3NzK2J1aWxkcm9vdEAwbGVpbC5uZXQ+Cj4gU2lnbmVkLW9mZi1ieTogUXVl
bnRpbiBTY2h1bHogPHF1ZW50aW4uc2NodWx6QHRoZW9icm9tYS1zeXN0ZW1zLmNvbT4KCiAgQXBw
bGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCiAgSSd2ZSBhbHNvIHJlbnVtYmVyZWQgcGF0Y2hlcyA3
IGFuZCA4LgoKICBSZWdhcmRzLAogIEFybm91dAoKPiAtLS0KPiAgIC4uLi1hdm9pZGluZy1odWdl
LW51bWJlci1vZi10aW55LWRhc2hlcy5wYXRjaCB8IDM3IC0tLS0tLS0tLS0tLS0tLS0tLS0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCAzNyBkZWxldGlvbnMoLSkKPiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBw
YWNrYWdlL3F0NS9xdDViYXNlLzAwMDYtSW1wcm92ZS1maXgtZm9yLWF2b2lkaW5nLWh1Z2UtbnVt
YmVyLW9mLXRpbnktZGFzaGVzLnBhdGNoCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcXQ1L3F0
NWJhc2UvMDAwNi1JbXByb3ZlLWZpeC1mb3ItYXZvaWRpbmctaHVnZS1udW1iZXItb2YtdGlueS1k
YXNoZXMucGF0Y2ggYi9wYWNrYWdlL3F0NS9xdDViYXNlLzAwMDYtSW1wcm92ZS1maXgtZm9yLWF2
b2lkaW5nLWh1Z2UtbnVtYmVyLW9mLXRpbnktZGFzaGVzLnBhdGNoCj4gZGVsZXRlZCBmaWxlIG1v
ZGUgMTAwNjQ0Cj4gaW5kZXggMTZlMGYyMDIwMC4uMDAwMDAwMDAwMAo+IC0tLSBhL3BhY2thZ2Uv
cXQ1L3F0NWJhc2UvMDAwNi1JbXByb3ZlLWZpeC1mb3ItYXZvaWRpbmctaHVnZS1udW1iZXItb2Yt
dGlueS1kYXNoZXMucGF0Y2gKPiArKysgL2Rldi9udWxsCj4gQEAgLTEsMzcgKzAsMCBAQAo+IC1G
cm9tIDg1NmQxMWY2OTVmYjZlZmZlMjZhMzU5ZjlhZDBlZmRmMjQwNjcwODUgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCj4gLUZyb206IEVpcmlrIEFhdml0c2xhbmQgPGVpcmlrLmFhdml0c2xhbmRA
cXQuaW8+Cj4gLURhdGU6IEZyaSwgMjMgSnVsIDIwMjEgMTU6NTM6NTYgKzAyMDAKPiAtU3ViamVj
dDogW1BBVENIXSBJbXByb3ZlIGZpeCBmb3IgYXZvaWRpbmcgaHVnZSBudW1iZXIgb2YgdGlueSBk
YXNoZXMKPiAtTUlNRS1WZXJzaW9uOiAxLjAKPiAtQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBj
aGFyc2V0PVVURi04Cj4gLUNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKPiAtCj4gLVNv
bWUgcGF0aG9sb2dpY2FsIGNhc2VzIHdlcmUgbm90IGNhdWdodCBieSB0aGUgcHJldmlvdXMgZml4
Lgo+IC0KPiAtRml4ZXM6IFFUQlVHLTk1MjM5Cj4gLVBpY2stdG86IDYuMiA2LjEgNS4xNQo+IC1D
aGFuZ2UtSWQ6IEkwMzM3ZWUzOTIzZmY5M2NjYjM2YzRkN2I4MTBhOWMwNjY3MzU0Y2M1Cj4gLVJl
dmlld2VkLWJ5OiBSb2JlcnQgTMO2aG5pbmcgPHJvYmVydC5sb2VobmluZ0BxdC5pbz4KPiAtKGNo
ZXJyeSBwaWNrZWQgZnJvbSBjb21taXQgNmI0MDBlMzE0N2RjZmQ4Y2MzYTM5M2FjZTFiZDExOGM5
Mzc2MmUwYykKPiAtW1JldHJpZXZlZCBmcm9tOiBodHRwczovL2ludmVudC5rZGUub3JnL3F0L3F0
L3F0YmFzZS8tL2NvbW1pdC9mZWQ1NzEzZWViYTViZjhlMGVlNDEzY2I0ZTc3MTA5YmZhN2MyYmNl
XQo+IC1TaWduZWQtb2ZmLWJ5OiBRdWVudGluIFNjaHVseiA8cXVlbnRpbi5zY2h1bHpAdGhlb2Jy
b21hLXN5c3RlbXMuY29tPgo+IC0tLS0KPiAtIHNyYy9ndWkvcGFpbnRpbmcvcXBhaW50ZW5naW5l
ZXguY3BwIHwgMiArLQo+IC0gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4gLQo+IC1kaWZmIC0tZ2l0IGEvc3JjL2d1aS9wYWludGluZy9xcGFpbnRlbmdpbmVl
eC5jcHAgYi9zcmMvZ3VpL3BhaW50aW5nL3FwYWludGVuZ2luZWV4LmNwcAo+IC1pbmRleCA1NWZk
YjBjMmEwLi4xOWU0YjIzNDIzIDEwMDY0NAo+IC0tLS0gYS9zcmMvZ3VpL3BhaW50aW5nL3FwYWlu
dGVuZ2luZWV4LmNwcAo+IC0rKysgYi9zcmMvZ3VpL3BhaW50aW5nL3FwYWludGVuZ2luZWV4LmNw
cAo+IC1AQCAtNDI2LDcgKzQyNiw3IEBAIHZvaWQgUVBhaW50RW5naW5lRXg6OnN0cm9rZShjb25z
dCBRVmVjdG9yUGF0aCAmcGF0aCwgY29uc3QgUVBlbiAmaW5QZW4pCj4gLSAgICAgICAgICAgICBw
YXR0ZXJuTGVuZ3RoICo9IHBlbi53aWR0aEYoKTsKPiAtICAgICAgICAgaWYgKHFGdXp6eUlzTnVs
bChwYXR0ZXJuTGVuZ3RoKSkgewo+IC0gICAgICAgICAgICAgcGVuLnNldFN0eWxlKFF0OjpOb1Bl
bik7Cj4gLS0gICAgICAgIH0gZWxzZSBpZiAoZXh0ZW50IC8gcGF0dGVybkxlbmd0aCA+IDEwMDAw
KSB7Cj4gLSsgICAgICAgIH0gZWxzZSBpZiAocUZ1enp5SXNOdWxsKGV4dGVudCkgfHwgZXh0ZW50
IC8gcGF0dGVybkxlbmd0aCA+IDEwMDAwKSB7Cj4gLSAgICAgICAgICAgICAvLyBhcHByb3hpbWF0
ZSBzdHJlYW0gb2YgdGlueSBkYXNoZXMgd2l0aCBzZW1pLXRyYW5zcGFyZW50IHNvbGlkIGxpbmUK
PiAtICAgICAgICAgICAgIHBlbi5zZXRTdHlsZShRdDo6U29saWRMaW5lKTsKPiAtICAgICAgICAg
ICAgIFFDb2xvciBjb2xvcihwZW4uY29sb3IoKSk7Cj4gLS0tCj4gLTIuMzQuMQo+IC0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
