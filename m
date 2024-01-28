Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273A8C47DDF
	for <buildroot@archiver.kernel.org>; Sun, 28 Jan 2024 08:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 937CF403E7;
	Sun, 28 Jan 2024 08:54:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 937CF403E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FOv8HtP9YQCH; Sun, 28 Jan 2024 08:54:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3114400CF;
	Sun, 28 Jan 2024 08:54:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3114400CF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 106BA1BF38D
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 08:54:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D989C82512
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 08:54:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D989C82512
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HmPyHRd3hi_d for <buildroot@lists.busybox.net>;
 Sun, 28 Jan 2024 08:54:30 +0000 (UTC)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E59A1824EF
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 08:54:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E59A1824EF
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-510f37d673aso521441e87.0
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 00:54:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706432067; x=1707036867;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QxE8Ic1URzvU37cPKzK7k7Sy76di1I7a8oxte/wUB5o=;
 b=Op4yZZhItuNUYFKrakh3xlOEYECeCcW2/zCGUoYvnQ4WEOhabnSuDr7chJ9FvLdKAq
 yxzMKD8Sf8IpVz3Jpt0U/I9ohubc+N2vP1ytx77O+SZY5N4rtDLrWnx35SOXTY3baIsG
 sN3iwajvP8fTEA2lkTr8L161/TMXRDocvBAtFFMB/ANPRqC5mG44u7GLTzPr/Wih13QE
 8050ProXxnRL/bUQLAzW3j81elgoD3+mNXkK9Xm5CcMcWDb/CUIuUx7eRg9LfEFhaiBQ
 2VmvUQYcN9H+PjYfKbMtnkhRCH1AXXU5bGavPAFbiVkFV1p38elzyyqE7q1L6yNS85U1
 Jg7A==
X-Gm-Message-State: AOJu0YwNU+lCTAS7A+Jctg5OBXbgTQXQjgxOdV9Is3gYVekVEEoJcu5V
 Oge8UM8WNhqqGeKBkcFtvyKi+ghVpa3wqgg81tUsyc+LK4MQIBbW
X-Google-Smtp-Source: AGHT+IE1zaPbis4KIPI7WN2STi5YEggaftFuGusfyn1L+wvXIXHqj8SfFX7ll0d7SGx8M48MIvZamA==
X-Received: by 2002:ac2:55a8:0:b0:510:27a7:cccd with SMTP id
 y8-20020ac255a8000000b0051027a7cccdmr2615496lfg.2.1706432067246; 
 Sun, 28 Jan 2024 00:54:27 -0800 (PST)
Received: from [10.0.228.44] ([176.10.248.204])
 by smtp.gmail.com with ESMTPSA id
 v18-20020ac25932000000b005100a2b3a49sm762735lfi.243.2024.01.28.00.54.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jan 2024 00:54:26 -0800 (PST)
Message-ID: <9054edf3962106a2b089c40a953f8ccbd3dc5b47.camel@gmail.com>
From: troglobit@gmail.com
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Sun, 28 Jan 2024 09:54:25 +0100
In-Reply-To: <ZbU68sY6d4uvT-M0@landeda>
References: <20240115074112.157216-1-troglobit@gmail.com>
 <20240115074112.157216-3-troglobit@gmail.com> <ZbU68sY6d4uvT-M0@landeda>
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706432067; x=1707036867; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=QxE8Ic1URzvU37cPKzK7k7Sy76di1I7a8oxte/wUB5o=;
 b=Ov7QUdBJZ6jq+Bich1F5nyw+GyDbfj33JiYWRANC+U5OAj6jZOfBLGsIzY3JQO5HRM
 Qovz72C6wPMddtkrio4JiCeCOp/l8lqfap9rmpJ9t5sWPRIuQ6D1JZNEvMotvcIov+p1
 eQq02imJmFX1wd3r75yHA6fFkuL4xjdaTLqa1bCMB+aT+r5ABBMloeqiBIrtEp0kYhLl
 Aruf0edFJ51epHNJ2dBX/a9xR9DVVWzUZReJP0iuL7MpjuAQodECF7YvDPYIw1V61y0r
 1mKW7EI7A6DjJx0ODP4hzyb7/5KRyVBq2Mi1vgEE6Xyr9BWQx7FsX4YaHniYnwr2dcvv
 Da6g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Ov7QUdBJ
Subject: Re: [Buildroot] [PATCH 2/3] package/watchdogd: convert Config.in
 options, int -> bool
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWFubiwKCnRoYW5rIHlvdSBmb3IgdGFraW5nIHRoZSB0aW1lIHRvIHJldmlldyBteSBwYXRjaCEK
SSdsbCBkbyBhIHJlc3BpbiBhbmQgc2VuZCB0byB0aGUgbGlzdCBsYXRlciB0b2RheS4KCk9uIFNh
dCwgMjAyNC0wMS0yNyBhdCAxODoxOCArMDEwMCwgWWFubiBFLiBNT1JJTiB3cm90ZToKPiBPbiAy
MDI0LTAxLTE1IDA4OjQxICswMTAwLCBKb2FjaGltIFdpYmVyZyBzcGFrZSB0aHVzbHk6Cj4gPiBb
c25pcF0KPiA+IFRoaXMgcGF0Y2ggY29udmVydHMgdGhlIG1lbnVjb25maWcgb3B0aW9ucyBmcm9t
IGludCB0byBib29sIGJ5Cj4gPiByZW5hbWluZyB0aGUgY29uZmlnIG9wdGlvbnMgYW5kIGFkZGlu
ZyBsZWdhY3kgb3B0aW9uIGNvbnZlcnNpb24KPiA+IHN1cHBvcnQuCj4gVGhpcyBjaGFuZ2Ugc2hv
dWxkIGJlIGRvbmUgYXMgcGFydCBvZiB0aGUgdmVyc2lvbiBidW1wLiBJbmRlZWQsIGlmCj4gdGhl
IHZlcnNpb24gYnVtcCB3YXMgYXBwbGllZCBidXQgbm90IHRoaXMgcGF0aCAoc2VlIGJlbG93IHdo
eSksIHRoZQo+IC5tayB3b3VsZCBub3Qgc2V0IHRoZSBwcm9wZXIgb3B0aW9ucyBhdCBidWlsZCB0
aW1lLgo+IAo+IFNvIHRoaXMgcmVhbGx5IGJlbG9uZ3MgdG8gdGhlIHZlcnNpb24gYnVtcCwgYW5k
IEkgd2FzIGFib3V0IHRvIG1lcmdlCj4gdGhlIHR3byB0b2dldGhlciwgd2hlbi4uLgo+IAo+IMKg
wqDCoCAkIG1ha2UgY2hlY2stcGFja2FnZQo+IMKgwqDCoCBwYWNrYWdlL3dhdGNoZG9nZC9Db25m
aWcuaW46MzI6Cj4gQlIyX1BBQ0tBR0VfV0FUQ0hET0dEX0dFTkVSSUNfUE9MTCByZWZlcmVuY2Vk
IGJ1dCBub3QgZGVmaW5lZAo+IMKgwqDCoCBwYWNrYWdlL3dhdGNoZG9nZC9Db25maWcuaW46Mzg6
Cj4gQlIyX1BBQ0tBR0VfV0FUQ0hET0dEX0xPQURBVkdfUE9MTCByZWZlcmVuY2VkIGJ1dCBub3Qg
ZGVmaW5lZAo+IMKgwqDCoCBwYWNrYWdlL3dhdGNoZG9nZC9Db25maWcuaW46NDQ6IEJSMl9QQUNL
QUdFX1dBVENIRE9HRF9GSUxFTlJfUE9MTAo+IHJlZmVyZW5jZWQgYnV0IG5vdCBkZWZpbmVkCj4g
wqDCoMKgIHBhY2thZ2Uvd2F0Y2hkb2dkL0NvbmZpZy5pbjo1MDoKPiBCUjJfUEFDS0FHRV9XQVRD
SERPR0RfTUVNSU5GT19QT0xMIHJlZmVyZW5jZWQgYnV0IG5vdCBkZWZpbmVkCj4gCj4gW3NuaXBd
Cj4gLi4uIEluZGVlZCBCUjJfUEFDS0FHRV9XQVRDSERPR0RfR0VORVJJQ19QT0xMIGlzIHRoZSBv
bGQgY29uZmlnCj4gb3B0aW9uIG5hbWUuIGJ1dCBpdCBpcyBub3cgZGVmaW5lZCBub3doZXJlLgoK
T3VjaCwgZGlkbid0IHRoaW5rIG9mIHRoYXQsIHRoYW5rcyEKCj4gV2hlbiB3ZSB3YW50IHRvIGhh
bmRsZSBsZWdhY3kgc3ltYm9scywgd2UgYWRkIHRoZSBvbGQgc3ltYm9scyB0byB0aGUKPiB0b3At
bGV2ZWwgQ29uZmlnLmluLmxlZ2FjeSBmaWxlLiBGb3IgYm9vbHdlYW5zLCBpdCBpcyB0cml2aWFs
LCBidXQKPiBmb3IgaW50IChvciBzdHJpbmdzKSB3ZSBuZWVkIGEgbGl0dGxlIHRyaWNrLCBsaWtl
IChhZGFwdCB0aGUgaGVscAo+IHRleHQgYXMgYXBwcm9wcmlhdGUsIEknbSBtb3N0bHkgbWFraW5n
IHRoZSByZWFzb24gdXApOgo+IAo+IMKgwqDCoCBDb25maWcuaW4ubGVnYWN5Ogo+IAo+IMKgwqDC
oCBjb25maWcgQlIyX1BBQ0tBR0VfV0FUQ0hET0dEX0dFTkVSSUNfUE9MTAo+IMKgwqDCoMKgwqDC
oMKgIGludAo+IMKgwqDCoMKgwqDCoMKgIGRlZmF1bHQgMAo+IMKgwqDCoMKgwqDCoMKgIGhlbHAK
PiDCoMKgwqDCoMKgwqDCoMKgwqAgVGhlIEJSMl9QQUNLQUdFX1dBVENIRE9HRF9HRU5FUklDX1BP
TEwgdmFsdWUgaXMgbm93IHJ1bnRpbWUKPiDCoMKgwqDCoMKgwqDCoMKgwqAgY29uZmlndXJhYmxl
LCBhbmQgb25seSB0aGUgZ2VuZXJpYyBmZWF0dXJlIGlzIGNvbmZpZ3VyYWJsZQo+IMKgwqDCoMKg
wqDCoMKgwqDCoCB3aXRoIEJSMl9QQUNLQUdFX1dBVENIRE9HRF9HRU5FUklDLgo+IAo+IMKgwqDC
oCBjb25maWcgQlIyX1BBQ0tBR0VfV0FUQ0hET0dEX0dFTkVSSUNfUE9MTF9XUkFQCj4gwqDCoMKg
wqDCoMKgwqAgYm9vbAo+IMKgwqDCoMKgwqDCoMKgIGRlZmF1bHQgeSBpZiBCUjJfUEFDS0FHRV9X
QVRDSERPR0RfR0VORVJJQ19QT0xMICE9IDAKPiDCoMKgwqDCoMKgwqDCoCBzZWxlY3QgQlIyX0xF
R0FDWQoKQWhhYWEsIHllYWggSSB3YXMgaG9waW5nIHRvIGdldCBzb21lIGd1aWRhbmNlIG9uIHRo
YXQgcGFydC4gIEdyZWF0IQoKPiBDYXJlIHRvIGZpeCB1cCwgc3F1YXNoIHBhdGNoZXMgMSBhbmQg
MiwgYW5kIHJlc3BpbiwgcGxlYXNlPwoKQWJzb2x1dGVseSwgdjIgY29taW5nIHVwIQoKIC9KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
