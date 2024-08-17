Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC71C52D7F
	for <buildroot@archiver.kernel.org>; Sat, 17 Aug 2024 14:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD0844023A;
	Sat, 17 Aug 2024 14:33:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wkbFAg-QgSH1; Sat, 17 Aug 2024 14:33:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FF104018B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2FF104018B;
	Sat, 17 Aug 2024 14:33:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 85C811BF57B
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 14:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 806C160630
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 14:33:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9awBHLlmwKnl for <buildroot@lists.busybox.net>;
 Sat, 17 Aug 2024 14:33:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=rgallaispou@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 218866061C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 218866061C
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 218866061C
 for <buildroot@buildroot.org>; Sat, 17 Aug 2024 14:33:26 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-427fc97a88cso22614525e9.0
 for <buildroot@buildroot.org>; Sat, 17 Aug 2024 07:33:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723905205; x=1724510005;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hwxJ6WFAb/S9XUFAt7LJqXXBrSEblzBUTb8FJ7a77tg=;
 b=vacjTRsQfR8MAmCkomnzN4pp8FQX+uj1NtdyVLQoWARECtby2vwHdGI7pQavczy6cJ
 HdOt9UxGu0+IWDuYkjXkc4/ZM7TJ0FAIEdB/lbga1swqD/DeltvdTG9VFHRX1bpc6DVy
 JTzgYfamGItLS4XyMnREmLdFY0Ea3Jv/JifozvDNnbtuQNh/9kpM/gURQ0f3FlkkPzZg
 GAe0zYUlsKfUhM/NUkJ39leJM01r8vM5eMCCnvcqj5GRw7szBLqcPaM0w+/7Xqq7xlw5
 DLkpMercjmNTZpdKymVkxecE2GGUGHRtXS/RHljrJRdbvc6xQjPjYTGUBIjNa+mONosF
 cYlg==
X-Gm-Message-State: AOJu0YzjkGvjxFwiiIZFvfzHM0XbzfW2Hh9wS3aKcqecBwLECqePjZFB
 yNOFPY6SQrepqVeRxIKboEallCx2l+Q+PHXAUMxR+FSetBOmyPQzmmUbqg==
X-Google-Smtp-Source: AGHT+IGIUYjOywtmryfRfWdJ17LKCbsRhM8rHAOxNCGG6BW67DQ6fRpxP4sFEIkXUsOs3tUeCG9u2g==
X-Received: by 2002:adf:e50d:0:b0:368:74c0:6721 with SMTP id
 ffacd0b85a97d-371a746c39amr2045095f8f.38.1723905204179; 
 Sat, 17 Aug 2024 07:33:24 -0700 (PDT)
Received: from ?IPV6:2001:861:3385:e20:6384:4cf:52c5:3194?
 ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37189897013sm6012152f8f.66.2024.08.17.07.33.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Aug 2024 07:33:23 -0700 (PDT)
Message-ID: <ff629108-f410-48f7-b95b-2e7d5761c295@gmail.com>
Date: Sat, 17 Aug 2024 16:33:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240814-master-v1-0-7834f3deddcb@gmail.com>
 <20240814-master-v1-2-7834f3deddcb@gmail.com>
 <20240815105603.1a752184@windsurf>
 <b9b52c88-a352-4ff2-856e-430cb65185ed@gmail.com>
 <20240817144800.5a2a813b@windsurf>
Content-Language: en-US, fr
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
In-Reply-To: <20240817144800.5a2a813b@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723905205; x=1724510005; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hwxJ6WFAb/S9XUFAt7LJqXXBrSEblzBUTb8FJ7a77tg=;
 b=SeTBh9QuhzL0DozqnDsAU61/I4WaziBFzhzXqtZk2qidNE5cnEM5IyZ3CyohXlI730
 5Tpby25A5IIYk/+THXQuHOCCocnyh9xmSs3U9O+Bl68TRTJ7+vJcvZoIVgNLY8DmQzfq
 ooSj5wHFpBUYqLNBcurx60pqAdMpogXHljVA0sioOjcI23miJYAjl5zCNWwTsFQEHaYO
 RI3mJvnniMGNX0IxcdVbN37QnRpdTUim4sDiklQS/ZxeL/FyWQQbeNVgS3ZwiqecCG3g
 1Rp978hDPuU9U7PQGK1eR4JpBgRIEzeiuyrqsxstU2JKjWOgqrxzlfqFulIR1ZwFtjOH
 JEZQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=SeTBh9Qu
Subject: Re: [Buildroot] [PATCH RESEND 2/2] configs/stm32mp135f-dk: new
 defconfig
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
Cc: Bartosz Bilas <b.bilas@grinn-global.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marleen Vos <marleen.vos@mind.be>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpMZSAxNy8wOC8yMDI0IMOgIDE0OjQ4LCBUaG9tYXMgUGV0YXp6b25pIGEgw6ljcml0wqA6Cj4g
SGVsbG8gUmFwaGFlbCwKPiAKPiBPbiBTYXQsIDE3IEF1ZyAyMDI0IDEyOjU1OjQ3ICswMjAwCj4g
UmFwaGHDq2wgR2FsbGFpcy1Qb3UgPHJnYWxsYWlzcG91QGdtYWlsLmNvbT4gd3JvdGU6Cj4gCj4+
PiBUaGFua3MgZm9yIHRoZSByZXNlbmQsIGJ1dCB0aGVyZSB3YXMgbm8gbmVlZCB0byByZXNlbmQ6
IHlvdXIgcHJldmlvdXMKPj4+IHBhdGNoIHdhcyBzdGlsbCBpbiBvdXIgcXVldWUgb2YgcGF0Y2hl
cyB0byByZXZpZXcvbWVyZ2UuIEkgaGF2ZSBhCj4+PiBudW1iZXIgb2YgY29tbWVudHMgYmVsb3cu
Cj4+Cj4+IFNvcnJ5IGZvciB0aGUgaW5jb252ZW5pZW5jZS4gSSBoYWQgbm8gbmV3cyBvZiB0aGUg
cGF0Y2hzZXQgd2hpY2ggbGVkIG1lCj4+IHRvIHJlc2VuZCBpdC4gVGhhbmtzIGZvciB0YWtpbmcg
dGhlIHRpbWUgdG8gcmV2aWV3IHRoaXMgb25lIGFuZCBtZXJnZQo+PiB0aGUgcHJldmlldy4KPiAK
PiBQYXRjaGVzIGFyZSBuZXZlciBmb3Jnb3R0ZW46IHRoZXkgYXJlIHRyYWNrZWQgdW5kZXIgcGF0
Y2h3b3JrIGFzIHNvb24KPiBhcyB0aGV5IGFyZSBwb3N0ZWQgb24gdGhlIG1haWxpbmcgbGlzdC4g
SWYgeW91IGhhdmUgbm8gbmV3cywgeW91IGNhbgo+IHBpbmcgb24gdGhlIHBhdGNoIHNlcmllcyBp
ZiB5b3Ugd2FudCwgYnV0IHJlc2VuZGluZyB3aXRob3V0IGFueSBjaGFuZ2VzCj4gaXNuJ3QgdmVy
eSB1c2VmdWwuCgpVbmRlcnN0b29kLiBJIHdpbGwgcGluZyBpZiBJIGVuY291bnRlciB0aGlzIHNp
dHVhdGlvbiBhZ2Fpbi4gVGhhbmsgeW91IApmb3IgeW91ciBjbGFyaWZpY2F0aW9uLgoKPiAKPj4+
IEZpcnN0IG9mIGFsbCwgeW91IG5lZWQgdG8gZW5hYmxlIEJSMl9ET1dOTE9BRF9GT1JDRV9DSEVD
S19IQVNIRVM9eSwKPj4+IHdoaWNoIHJlcXVpcmVzIGFkZGluZzoKPj4+Cj4+PiBCUjJfR0xPQkFM
X1BBVENIX0RJUj0iYm9hcmQvc3RtaWNyb2VsZWN0cm9uaWNzL3N0bTMybXAxMzVmLWRrL3BhdGNo
ZXMvIgo+Pj4KPj4+IGFuZCB0aGVuIHJ1biAuL3V0aWxzL2FkZC1jdXN0b20taGFzaGVzLCB3aGlj
aCB3aWxsIGF1dG9tYXRpY2FsbHkKPj4+IHBvcHVsYXRlIHRoaXMgZm9sZGVyLgo+Pgo+PiBGb3Ig
dGhpcyBvbmUgSSB0aGluayB0aGF0IGl0IHdpbGwgYmUgYmV0dGVyIHRvIHNldCB0aGUgZGlyZWN0
b3J5IGFzIHRoZQo+PiBzYW1lIG9mIHRoZSBjb21tb24gZGlyZWN0b3J5LCBlZy4KPj4gImJvYXJk
L3N0bWljcm9lbGVjdHJvbmljcy9jb21tb24vc3RtMzJtcDF4eC9wYXRjaGVzLyIuIFNvIHRoYXQg
dGhlCj4+IHZlcnNpb25zIGJldHdlZW4gVEYtQS9VLUJvb3QsIHRoZSBMaW51eCBrZXJuZWwgYXMg
d2VsbCBhcyBPUC1URUUsIGlmIGl0Cj4+IGlzIGFjdGl2YXRlZCBpbiB0aGUgZnV0dXJlIGZvciB0
aGUgb3RoZXIgcGxhdGZvcm1zLCB3aWxsIGJlIHN5bmNlZAo+PiBiZXR3ZWVuIGFsbCBzdG0zMm1w
MSogcGxhdGZvcm1zLgo+IAo+IEJ1dCB0aGVuIGl0IG1lYW5zIHRoYXQgYWxsIHRoZSBzdG0zMm1w
MSBkZWZjb25maWdzIG11c3QgYmUgdXBkYXRlZCBpbgo+IHN5bmMgd2hlbmV2ZXIgTGludXgsIFUt
Qm9vdCwgVEYtQSBvciBPUC1URUUgYXJlIGJ1bXBlZC4KClllcywgaW5kZWVkLgoKU2luY2Ugc3Rt
MzJtcDE1N2MtZGsyLCBzdG0zMm1wMTU3YS1kazEgYW5kIHN0bTMybXAxMzVmLWRrIGFyZSBwcmV0
dHkgCm11Y2ggdGhlIHNhbWUgcHJvZHVjdCBsaW5lLCBJIGZpZ3VyZWQgdGhhdCB3b3VsZCBiZSBl
YXNpZXIgdG8gdGllIHRoZWlyIApjb21wb25lbnQgdmVyc2lvbnMgdG9nZXRoZXIuIFRoYXQgd291
bGQgYmUgZWFzaWVyIHRvIG1haW50YWluIElNSE8uCgo+IAo+IAo+Pj4gSSBzZWUgb24gU1RNMzJN
UDE1Nywgd2UncmUgdXNpbmcgc29tZSBjdXN0b20ga2VybmVsIGNvbmZpZ3VyYXRpb24KPj4+IGZp
bGVzLCB3aXRoIHByZXN1bWFibHkgYSBtb3JlICJvcHRpbWl6ZWQiIGNvbmZpZ3VyYXRpb24gdGhh
biBtdWx0aV92Ny4KPj4+IFNob3VsZCB3ZSBkbyB0aGUgc2FtZSBoZXJlPwo+Pgo+PiBFZmZlY3Rp
dmVseSB0aGlzIHJlZHVjZXMgdGhlIG92ZXJhbGwga2VybmVsIHNpemUuIE15IHRob3VnaHQgb24g
dGhpcwo+PiB3b3VsZCBiZSB0byBzZXQgdGhlIGdlbmVyYWwgbXVsdGlfdjcga2VybmVsIGRlZmNv
bmZpZyBvbiB0aGUgaW5pdGlhbAo+PiBzdG0zMm1wMTMgc3VwcG9ydCwgYW5kIGZpbmUgdHVuZSBh
ZnRlci4gQmVjYXVzZSB0aGVyZSBpcyBtYW55IGhhcmR3YXJlCj4+IGRpZmZlcmVuY2VzIGJldHdl
ZW4gc3RtMzJtcDE1IGFuZCBzdG0zMm1wMTMgcGxhdGZvcm1zIChmb3IgZXhhbXBsZSB0aGVyZQo+
PiBpcyBubyBhdWRpbyBqYWNrIGluIG15IGtub3dsZWRnZSksIEkgZmVlbCBsaWtlIHRoaXMgd291
bGQgdGFrZSBxdWl0ZQo+PiBzb21lIHRpbWUgZm9yIG1lIHRvIHNvcnQgZXZlcnkgZHJpdmVycy4K
Pj4KPj4gV2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQgdGhpcyBwcm9jZXNzID8KPiAKPiBXaHkgbm90
LCBidXQgc2luY2Ugd2UnbGwgaGF2ZSBhIHNpbmdsZSBjb21tb24ga2VybmVsIGNvbmZpZyBmb3Ig
YWxsLAo+IHRoaXMgc3Rvcnkgb2YgIm5vdCBoYXZpbmcgYXVkaW8gamFjayBvbiBTVE0zMk1QMTMi
IGlzIG5vdCB2ZXJ5Cj4gcmVsZXZhbnQuIEkuZSwgd2hhdCBub3QganVzdCB1c2UgdGhlIGV4aXN0
aW5nIGtlcm5lbCBjb25maWd1cmF0aW9uIHVzZWQKPiBmb3IgTVAxNSBhbHNvIGZvciBNUDEzLCBh
bmQganVzdCBhZGQgd2hhdCdzIG1pc3NpbmcgaW4gdGhpcyBjb21tb24KPiBjb25maWd1cmF0aW9u
PyBXZSdyZSBhbHNvIG5vdCB0cnlpbmcgdG8gbWFrZSB0aGUgc3VwZXIgc3VwZXIgb3B0aW1pemVk
Cj4ga2VybmVsIGNvbmZpZ3VyYXRpb24gd2l0aCBvbmx5IHN0cmljdGx5IHdoYXQncyBuZWVkZWQu
IEJ1dCBtdWx0aV92NyBpcwo+IG1hc3NpdmVseSBibG9hdGVkLgoKSSBhYnNvbHV0ZWx5IGFncmVl
LiBJIHdpbGwgdXNlIHRoZSBtcDE1IHRoZW4sIGFuZCBkbyBzb21lIGNoZWNraW5nIHdpdGggCm1w
MTMuIElmIHNvbWUgZHJpdmVycyB3ZXJlIG1pc3NlZCwgdGhleSB3aWxsIGJlIGFkZGVkIGFzIHdl
IGdvIGFsb25nLgoKPiAKPj4+IFBsZWFzZSB1c2UgdGhlICJjdXN0b20iIHZlcnNpb24gbWVjaGFu
aXNtIHRvIHNwZWNpZnkgdGhlIGV4YWN0IHZlcnNpb24KPj4+IG9mIE9QLVRFRSB0byBiZSB1c2Vk
LCBsaWtlIHlvdSBkaWQgZm9yIFRGLUEsIExpbnV4IGFuZCBVLUJvb3QuCj4+Cj4+IEFjaywgZm9y
Z290IGFib3V0IHRoYXQgb25lLiBJIHNhdyB0aGF0IHRoZXJlIHdhcyBubyAiY3VzdG9tIHZlcnNp
b24iCj4+IG9wdGlvbiwgbGlrZSB0aGVyZSBpcyBmb3IgVS1Cb290IGFuZCB0aGUgS2VybmVsLiBB
bmQgZ3JlcGluZyB0aHJvdWdoIHRoZQo+PiBvdGhlciBkZWZjb25maWcgdGhlcmUgaXMgbm8gaGFy
ZGNvZGVkIHZlcnNpb25zLiBNYXliZSB0aGlzIGNhbiBiZSBhIGlkZWEKPj4gZm9yIHRoZSBmdXR1
cmUuIEZvciBub3cgSSB3aWxsIHNldCBhIGN1c3RvbSB0YXJiYWxsIHBvaW50aW5nIHRvIHRoZQo+
PiBvZmZpY2lhbCA0LjMuMCB0YXJiYWxsLiBXb3VsZCB0aGlzIGJlIG9rYXkgPwo+Pgo+PiBjZi4g
aHR0cHM6Ly9naXRodWIuY29tL09QLVRFRS9vcHRlZV9vcy9hcmNoaXZlL3JlZnMvdGFncy80LjMu
MC50YXIuZ3oKPiAKPiBXZWxsLCB0aGVyZSBpcyBkZWZpbml0ZWx5IGEgY3VzdG9tIHZlcnNpb24g
Zm9yIE9QLVRFRSwgbGlrZSB0aGVyZSBpcwo+IGZvciBMaW51eCBhbmQgVS1Cb290Ogo+IAo+IGNo
b2ljZQo+ICAgICAgICAgIHByb21wdCAiT1AtVEVFIE9TIHZlcnNpb24iCj4gICAgICAgICAgZGVm
YXVsdCBCUjJfVEFSR0VUX09QVEVFX09TX0xBVEVTVCBpZiBCUjJfUEFDS0FHRV9IT1NUX1JVU1RD
X0FSQ0hfU1VQUE9SVFMKPiAgICAgICAgICBoZWxwCj4gICAgICAgICAgICBTZWxlY3QgdGhlIHZl
cnNpb24gb2YgT1AtVEVFIE9TIHlvdSB3YW50IHRvIHVzZQo+IAo+IGNvbmZpZyBCUjJfVEFSR0VU
X09QVEVFX09TX0xBVEVTVAo+ICAgICAgICAgIGJvb2wgIjQuMy4wIgo+ICAgICAgICAgIGRlcGVu
ZHMgb24gQlIyX1BBQ0tBR0VfSE9TVF9SVVNUQ19BUkNIX1NVUFBPUlRTCj4gICAgICAgICAgc2Vs
ZWN0IEJSMl9UQVJHRVRfT1BURUVfT1NfTkVFRFNfUFlUSE9OX0NSWVBUT0dSQVBIWQo+ICAgICAg
ICAgIGhlbHAKPiAgICAgICAgICAgIFVzZSB0aGUgbGF0ZXN0IHJlbGVhc2UgdGFnIGZyb20gdGhl
IE9QLVRFRSBPUyBvZmZpY2lhbCBHaXQKPiAgICAgICAgICAgIHJlcG9zaXRvcnkuCj4gCj4gY29u
ZmlnIEJSMl9UQVJHRVRfT1BURUVfT1NfQ1VTVE9NX1RBUkJBTEwKPiAgICAgICAgICBib29sICJD
dXN0b20gdGFyYmFsbCIKPiAgICAgICAgICBoZWxwCj4gICAgICAgICAgICBUaGlzIG9wdGlvbiBh
bGxvd3MgdG8gc3BlY2lmeSBhIFVSTCBwb2ludGluZyB0byBhbiBPUC1URUUgT1MKPiAgICAgICAg
ICAgIHNvdXJjZSB0YXJiYWxsLiBUaGlzIFVSTCBjYW4gdXNlIGFueSBwcm90b2NvbCByZWNvZ25p
emVkIGJ5Cj4gICAgICAgICAgICBCdWlsZHJvb3QsIGxpa2UgaHR0cDovLywgZnRwOi8vLCBmaWxl
Oi8vIG9yIHNjcDovLy4KPiAKPiAgICAgICAgICAgIFdoZW4gcG9pbnRpbmcgdG8gYSBsb2NhbCB0
YXJiYWxsIHVzaW5nIGZpbGU6Ly8sIHlvdSBtYXkgd2FudAo+ICAgICAgICAgICAgdG8gdXNlIGEg
bWFrZSB2YXJpYWJsZSBsaWtlICQoVE9QRElSKSB0byByZWZlcmVuY2UgdGhlIHJvb3Qgb2YKPiAg
ICAgICAgICAgIHRoZSBCdWlsZHJvb3QgdHJlZS4KPiAKPiBjb25maWcgQlIyX1RBUkdFVF9PUFRF
RV9PU19DVVNUT01fR0lUCj4gICAgICAgICAgYm9vbCAiQ3VzdG9tIEdpdCByZXBvc2l0b3J5Igo+
ICAgICAgICAgIGhlbHAKPiAgICAgICAgICAgIFVzZSBhIGN1c3RvbSB2ZXJzaW9uIGZldGNoZWQg
ZnJvbSBhIEdpdCByZXBvc2l0b3J5Lgo+IAo+IGVuZGNob2ljZQo+IAo+IFNvIGRvIHRoZSBzYW1l
IGFzIHdoYXQgeW91IGRvIGZvciBMaW51eCBhbmQgVS1Cb290IDotKQoKU29ycnksIEkgYW0gY29u
ZnVzZWQuIFRoZSBvcHRpb24gc2V0IHRvIGhhcmRjb2RlIHRoZSB2ZXJzaW9ucyBmb3IgTGludXgg
CmFuZCBVLUJvb3Qgb24gc3RtMzJtcDE1KiBpcyBzb21ldGhpbmcgbGlrZSBCUjJfWFhYX0NVU1RP
TV9WRVJTSU9OX1ZBTFVFLgpUaGlzIGRvZXMgbm90IGFwcGVhciBmb3IgT1AtVEVFIGluIHRoZSBj
b2RlIHNob3duIGFib3ZlLCB3aGljaCBsZWF2ZSB1cyAKd2l0aCBlaXRoZXIgdGhlIGN1c3RvbSB0
YXJiYWxsIG9yIGN1c3RvbSBnaXQgcmVwb3NpdG9yeSBtZXRob2RzLgoKQW0gSSBtaXNzaW5nIHNv
bWV0aGluZyA/CgpSZWdhcmRzLApSYXBoYcOrbAoKCj4gCj4+PiBQbGVhc2UgZHJvcCwgd2UgZG9u
J3QgZW5hYmxlIGJtYXAtdG9vbHMgaW4gb3VyIGRlZmNvbmZpZ3MsIHdlIGxlYXZlCj4+PiB0aGF0
IGNob2ljZSB1cCB0byB0aGUgdXNlci4KPj4KPj4gQWNrLiBNaW5kIHRoYXQgSSB3aWxsIGxlYXZl
IHRoZSBCUjJfUEFDS0FHRV9IT1NUX0dFTklNQUdFPXkgb3B0aW9uIHNpbmNlCj4+IGl0IGlzIG1h
bmRhdG9yeSBmb3IgYnVpbGRpbmcgdGhlIGltYWdlLgo+IAo+IEFic29sdXRlbHkhCj4gCj4gVGhh
bmtzIGEgbG90IQo+IAo+IFRob21hcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
