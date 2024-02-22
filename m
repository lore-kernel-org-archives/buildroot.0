Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF14DC5478C
	for <buildroot@archiver.kernel.org>; Thu, 22 Feb 2024 22:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 761BB40118;
	Thu, 22 Feb 2024 22:43:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g3iG6TaCKjY9; Thu, 22 Feb 2024 22:43:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 163B6403F9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 163B6403F9;
	Thu, 22 Feb 2024 22:43:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 737971BF379
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 22:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DFDA8329D
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 22:43:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kh8gTyKEyTCg for <buildroot@lists.busybox.net>;
 Thu, 22 Feb 2024 22:43:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CB19A81370
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB19A81370
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB19A81370
 for <buildroot@buildroot.org>; Thu, 22 Feb 2024 22:43:28 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a3e82664d53so29318066b.3
 for <buildroot@buildroot.org>; Thu, 22 Feb 2024 14:43:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708641807; x=1709246607;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a0Kc4wwQmxy0zabbCMBejGvr6ftYC0Te7re4AwR/LQA=;
 b=aLc+I3TFQv9U5M3rz8CxbxFCzkv11BezUyd/qyOKm8g/3X9k9iGZIuWh7QZWDbfhhp
 1fmIEwTyHtmmz6pqm3KRBHgQgTdE/I6TK76llOiPubr9JXdRvyLXWR3UyO53RX/bipKV
 GNnmSvFvxsAxQDpgf67yDsqpUKI8QmzCxtMuNw+EmXfnIz7wwQx6TQG5hUBTbFaJbTrs
 eXPO0Ov4hzFxO6m/e+xAlXl70iNcEVkpDHyRjrZMqSIN4AzwE1zlXC+b56u5hX/NLQjy
 uiGxpyeL+fFXuj/F3x8cBSrFW3gz7pfv01we7FhKFgtJVShRxZD624ghCe6U49eREyIt
 zA+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEhjL84GmGfkfXwfHy0WVp22ue31CeEJY3QPUSVd/fSRdl5cB3CLMJFYYKM/eXStiWHs3HppJzV/CXzsFTg30Dt8WDdn4Erw==
X-Gm-Message-State: AOJu0Yz6lW+5mW6heXj5B2TNa7g8EWvOp4uQj9Fe9FWsYtH7tUE12uWU
 7T305YHMkVCz4BmqMxiAInOMz8s1ITx5B+/gSwJMHQghUUTnc4ptjxqCAeYxbTt+vk2X3rG29li
 9jZAUeK5VwfAVdStbI7pU+BUWAh9hwwXu3h7v9gioxn+wg4EX0Qw=
X-Google-Smtp-Source: AGHT+IEuQIgatOM4tMMl0/TvNFZgBgOcAljvX1HS8sJn/X/AvKEODk91NYf6Qf51bPLS2bY5eI/cC5y4KWoKXmOkZpI=
X-Received: by 2002:a17:906:164a:b0:a3f:9c9b:2037 with SMTP id
 n10-20020a170906164a00b00a3f9c9b2037mr122000ejd.67.1708641806778; Thu, 22 Feb
 2024 14:43:26 -0800 (PST)
MIME-Version: 1.0
References: <20240219095155.2758428-1-anaumann@ultratronik.de>
 <ZdPG1PGaE3RfoWHk@landeda> <eca996e7-dda2-4dfb-9cc2-0f2ea90daafa@bubu1.eu>
In-Reply-To: <eca996e7-dda2-4dfb-9cc2-0f2ea90daafa@bubu1.eu>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Thu, 22 Feb 2024 15:43:15 -0700
Message-ID: <CAHDQB6O7x2rxRteJ6sAoLAqqdRGwBAXWocZQ0v+LWHxNmHi0Ew@mail.gmail.com>
To: Marcus Hoffmann <buildroot@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708641807; x=1709246607;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a0Kc4wwQmxy0zabbCMBejGvr6ftYC0Te7re4AwR/LQA=;
 b=V/skTY9S1shHJsmoBH5JB8Q/YhKkEhT7YWEsjMX6UWZ61K5LrKfSpzDdd8cXIsebFW
 29ZO7toKxuZxTyxS7EaN/6pYOrohvV1t0C5pfBH+Hu8iVE04dyIQDBgtG8zn944xPBFM
 Chdxtwjr45/O9AxHvXcgN5qp9Jz+SXFiLjEmI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=V/skTY9S
Subject: Re: [Buildroot] [PATCH 0/2] Fix flutter build failure
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Andreas Naumann <anaumann@ultratronik.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG87CgpTb3JyeSBmb3IgdGhlIGxhdGUgcmVwbHksIEkgaGF2ZSBiZWVuIHF1aXRlIHNpY2sg
dGhlIGxhc3Qgd2VlayBhbmQgZGlkbid0IHdhbnQKdG8gZG8gYW55dGhpbmcgYnV0IGxheSBpbiB0
aGUgYmVkIGFuZCBzbGVlcCEgOikKCgoKCk9uIFR1ZSwgRmViIDIwLCAyMDI0IGF0IDY6MjDigK9B
TSBNYXJjdXMgSG9mZm1hbm4gPGJ1aWxkcm9vdEBidWJ1MS5ldT4gd3JvdGU6Cj4KPiBIaSBBbmRy
ZWFzLCBZYW5uLCBhbGwKPgo+IE9uIDE5LjAyLjI0IDIyOjIzLCBZYW5uIEUuIE1PUklOIHdyb3Rl
Ogo+ID4gQW5kcmVhcywgQWxsLAo+ID4KPiA+IE9uIDIwMjQtMDItMTkgMTA6NTEgKzAxMDAsIEFu
ZHJlYXMgTmF1bWFubiBzcGFrZSB0aHVzbHk6Cj4gPj4gSGVsbG8gQWRhbSwgYWxsLAo+ID4+IEkg
d2FzIG1vdGl2YXRlZCB0byBnaXZlIGZsdXR0ZXIgYSBzcGluIGFmdGVyIHlvdXIgdGFsayBhdCBG
T1NERU0sCldvbmRlcmZ1bCEKCj4gPj4gaG93ZXZlciB0aGUgcmVjZW50IGJ1bXAgdG8gUHl0aG9u
IDMuMTIuMSBicm9rZSBzb21lIHNjcmlwdCBkdXJpbmcKPiA+PiB0aGUgZmx1dHRlci1lbmdpbmUg
Y29uZmlndXJlIHN0ZXAuClRoYXQncyBxdWl0ZSB1bmZvcnR1bmF0ZSEKCj4gPj4gRm9ydHVuYXRl
bHksIG5vdyBhIG5ldyBtYWpvciBzdGFibGUgdmVyc2lvbiBoYXMgYmVlbiByZWxlYXNlZCAzLjE5
LjAsCj4gPj4gd2hpY2ggY29udGFpbnMgYSBwYXRjaCBmb3IgdGhpcy4KPiA+Pgo+ID4+IEFmdGVy
IGJ1bXBpbmcgZW5naW5lIGFuZCBzZGsgdGhleSBzdWNjZXNzZnVsbHkgYnVpbGQgYWdhaW4sIGFz
IGRvZXMKPiA+PiBjcmVhdGluZyB0aGUgZmx1dHRlciBidW5kbGVzIHdoaWNoIHlvdSBwcm92aWRl
ZCBpbgo+ID4+IGh0dHBzOi8vZ2l0aHViLmNvbS9hZHVza2V0dC9idWlsZHJvb3QtZm9zZGVtMjAy
NC1mbHV0dGVyLWRlbW9zCj4gPj4KPiA+PiBJIGhhdmUgbm90IHlldCBiZWVuIGFibGUgdG8gcnVu
IHRoZW0gdXNpbmcgaXZpLWhvbWVzY3JlZW4sIGJ1dCB0aGF0J3MKPiA+PiBwcm9iYWJseSBkdWUg
dG8gbXkgdGFyZ2V0IGRpc3BsYXkvd2F5bGFuZCBzZXR1cC4KPiA+PgpUaGUgeDg2XzY0IGRlZmNv
bmZpZyBoYXMgYSB3YXlsYW5kIGRlbW8uIFlvdSBjYW4gcnVuIGBzdGFydF9zd2F5YAp0byBydW4g
c3dheSwgaGl0IGB3aW5kb3dzICsgZW50ZXJgIHRvIG9wZW4gYSB0ZXJtaW5hbC4KCj4gPj4gSG93
ZXZlciwgdGhlIGZsdXR0ZXItZ2FsbGVyeSBubyBsb25nZXIgYnVpbGRzIHdpdGggMy4xOSwgZXZl
biBhZnRlcgo+ID4+IGJ1bXBpbmcgdG8gdGhlIG1haW4gSEVBRC4gVGhlaXIgZ2l0aHViIFJFQURN
RSBzYXlzCj4gPj4gIk5PVEU6IFRoZSBGbHV0dGVyIEdhbGxlcnkgaXMgbm93IGRlcHJlY2F0ZWQs
IGFuZCBubyBsb25nZXIgYmVpbmcgYWN0aXZlCj4gPj4gbWFpbnRhaW5lZC4iClllcywgSSB0aGlu
ayBJIHdvdWxkIGxpa2UgdG8gc3dpdGNoIHRvIHRoZSBmbHV0dGVyLXBhY2thZ2VzIHJlcG9zaXRv
cnkgZm91bmQKaGVyZTogaHR0cHM6Ly9naXRodWIuY29tL2ZsdXR0ZXIvcGFja2FnZXMKCkkgaGF2
ZSBzZXZlcmFsIG9mIHRoZW0gcG9ydGVkIGFscmVhZHkgZm91bmQgaGVyZToKaHR0cHM6Ly9naXRo
dWIuY29tL2FkdXNrZXR0L2J1aWxkcm9vdC1mb3NkZW0yMDI0LWZsdXR0ZXItZGVtb3MvdHJlZS8y
MDIzLjExLjEvZm9zZGVtL3BhY2thZ2UvZmx1dHRlci1wYWNrYWdlcwpBbHRob3VnaCBJIGFtIG5v
dCBzdXJlIGlmIHRoZSBtYWludGFpbmVycyB3b3VsZCB3YW50IHN1Y2ggYSBwYWNrYWdlLi4uCmVz
cGVjaWFsbHkgaG93IGl0IGlzIGxhaWQgb3V0IGluIHRoZSBhYm92ZSBkaXJlY3RvcnkuCgo+ID4+
IEkgdGhvdWdodCBhYm91dCBpbmNsdWRpbmcgYSBwYXRjaCBmb3IgcmVtb3ZhbCBvZiB0aGUgZ2Fs
bGVyeSBwYWNrYWdlLAo+ID4+IGJ1dCB0aGF0IHdvdWxkIGxlYXZlIHVzIHdpdGggbm8gZXhhbXBs
ZSBmb3IgaG93IHRvIGNyZWF0ZSBhIGZsdXR0ZXIKPiA+PiBidW5kbGUuCj4gPgpZZWFoLCBzZWUg
YWJvdmUuCgo+ID4gVGhlIHVwc3RyZWFtIHJlcG9zaXRvcnkgaGFzIGFsc28gYmVlbiAiYXJjaGl2
ZWQiLCB3aGljaCBtZWFucyBpdCBpcwo+ID4gZnJvemVuIGFuZCB3aWxsIG5ldmVyIGdldCBmaXhl
ZCwgZXZlci4KPiA+Cj4gPiBUaGF0J3MgYSBiaXQgdW5mb3J0dW5hdGUgaW5kZWVkLCBidXQgd2Ug
ZG9uJ3QgaGF2ZSBtdWNoIGNob2ljZSBnb2luZwo+ID4gZm9yd2FyZDogd2UnbGwgaGF2ZSB0byBk
cm9wIHRoYXQgcGFja2FnZSBpbiB0aGUgbmVhciBmdXR1cmUsIGJ1dCBub3QKPiA+IG5vdzogd2Un
cmUgc3RpbGwgY29uc2lkZXJpbmcgcmV2ZXJ0aW5nIHRoZSBweXRob24gMy4xMiB2ZXJzaW9uIGJ1
bXAgZm9yCj4gPiAyMDI0LjAyLCBhcyBpdCBzdGlsbCBjYXVzZXMgaXNzdWVzIGluIHRoZSB0YXJn
ZXQ9PWJ1aWxkIGNhc2UsIHdoaWNoCj4gPiBtZWFucyB3ZSdkIGJlIGFibGUgdG8ga2VlcCB0aGUg
Y3VycmVudCBmbHV0dGVyIHN0YWNrIGZvciAyMDI0LjAyIExUUy4KPiA+Cj4gPiBUaGVuLCB3ZSBj
YW4gcmVpbnRyb2R1Y2UgcHl0aG9uMywgdGhlIGZsdXR0ZXItZW5naW5lIGJ1bXBzIGluIHRoaXMK
PiA+IHNlcmllcywgYW5kIGRyb3AgZmx1dHRlci1nZmFsbGVyeSwgaG9wZWZ1bGx5IGludHJvZHVj
aW5nIGFub3RoZXIgcGFja2FnZQo+ID4gYXMgYW4gZXhhbXBsZSBvbiBob3cgdG8gYnVpbGQgZmx1
dHRlciBwYWNrYWdlcy4uLgo+Cj4gVGhlIGFyY2hpdmVkIHJlcG8gcGFnZSBsaW5rcyB0bwo+IGh0
dHBzOi8vZ2l0aHViLmNvbS9nc2tpbm5lclRlYW0vZmx1dHRlci13b25kZXJvdXMtYXBwIGFuZAo+
IGh0dHBzOi8vZ2l0aHViLmNvbS9mbHV0dGVyL3NhbXBsZXMvdHJlZS9tYWluL21hdGVyaWFsXzNf
ZGVtbyBhcwo+IHJlcGxhY2VtZW50IHNob3djYXNlcy4KPgo+IEkgd29uZGVyIGhvdyBsb25nIHRo
ZXNlIHdpbGwgbGFzdC4uLiA6LS8uCj4KPiBNYXJjdXMKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
