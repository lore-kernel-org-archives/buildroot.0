Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB699C54E67
	for <buildroot@archiver.kernel.org>; Thu, 28 Mar 2024 13:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7AE88401AE;
	Thu, 28 Mar 2024 13:24:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U9cD7U-pRivb; Thu, 28 Mar 2024 13:24:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B6DC4061C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B6DC4061C;
	Thu, 28 Mar 2024 13:24:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EF9921BF405
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 13:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC7174061C
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 13:24:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h7w6afZ-tqZH for <buildroot@lists.busybox.net>;
 Thu, 28 Mar 2024 13:24:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C8D98401AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8D98401AE
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C8D98401AE
 for <buildroot@buildroot.org>; Thu, 28 Mar 2024 13:24:48 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2d094bc2244so9851431fa.1
 for <buildroot@buildroot.org>; Thu, 28 Mar 2024 06:24:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711632286; x=1712237086;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dB+tTpW10ax4clgbpLEpvMqt46Aj7JDKTtdyorCvHKw=;
 b=ByqLEBMfqN7od8M24aB1vDhjPzHSNcATrx1PnSqrADAhKBgpHb5l/8y1DODAYIe2LN
 8fHOoFXQQRrGaTTKaxF3jVIxacEbQR1FNZHzLa6+3lwvetAiCpx78NLWjmWGkCgnSsPy
 P24FhAN20pgPXlOoNIxUgQrVyesQM7VJjiQfNcTAlTfXzxNUVu/GhlQVP4NhulPoXmaG
 9tjkKzMtmAvZ7qHoUQyVJ4t7A5CDfp77XRD3CxBepTttEbnAM3hw1bkTJPGNz/BbxcmR
 Bwd9HZ9iz4WPpzP1E4ZYMQiL6qnKp7MM5VffWM26Jxapvq8utI6WJRDRAD9wqjo0G2Xx
 Ne5Q==
X-Gm-Message-State: AOJu0YwKjL9UUL/yAgT1Km+FRxpH1qEJ/xqhS9G+B7915H3Giq1iyzCs
 HYLCbPcEY+ruvAPDRA0HOrYtBSGEtBGSssPAYJPknD0WB4dSAoyKFV0bBkqjq3FfijiqW+6abJz
 lCVGGRuArhjV5ohF9iTPO7XSqYg0=
X-Google-Smtp-Source: AGHT+IE/WnMB4mJUH2TavUxS3//dKNPGYp2qes7BhmVB4VYX1pKmrMQwBkwbYOo0e++YLcU50/aohmIUJtMRBTwFuaI=
X-Received: by 2002:a05:651c:1a24:b0:2d7:e61:caea with SMTP id
 by36-20020a05651c1a2400b002d70e61caeamr771054ljb.21.1711632286162; Thu, 28
 Mar 2024 06:24:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240328122818.139194-1-heiko.thiery@gmail.com>
 <ZgVtJzC7VLCxua0H@landeda>
In-Reply-To: <ZgVtJzC7VLCxua0H@landeda>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 28 Mar 2024 14:24:34 +0100
Message-ID: <CAEyMn7bE3sXSQwHPSovj0qWjcQTxSSNtVNShW2weJhFoxK3Sfg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711632286; x=1712237086; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dB+tTpW10ax4clgbpLEpvMqt46Aj7JDKTtdyorCvHKw=;
 b=iKtXtEh7m6CwLEcgca0ILG051/BFl0M1T53m8mtrDeJv7Toer2jgo/iEGXEgIFnx7I
 1FHJ3HCfSvkLedW+DNXDM0lz88wak0FG/6mGFaHWowxn0MnF83ngHfxYECUM4ja5vmX+
 YYJCIFh24uVwOq3KnaaNlovl+icvCq/abl4KpS539U68ES3XrsYx5W8sIDFL5c+pzZGW
 1GWPcIy4vOqBXkEHytKvBAPUYPBmr1MI2M7ZF7gYWz81Nb4UW4zqkMGr+tw1ThKK68yI
 jg5mw5G8HSz3HIPXhnapZoet3Uk4gGAvKUpC0J0my93618krtKm5ZcxOh4RQa88JiWkx
 7ZBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iKtXtEh7
Subject: Re: [Buildroot] [PATCH] Add
 BR2_ROOTFS_POST_{PRE_BUILD|POST_BUILD|FAKEROOT|IMAGE}_SCRIPT_ARGS
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
Cc: Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwKCkFtIERvLiwgMjguIE3DpHJ6IDIwMjQgdW0gMTQ6MTQgVWhyIHNjaHJpZWIgWWFu
biBFLiBNT1JJTgo8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+Ogo+Cj4gSGVpa28sIEFsbCwKPgo+
IE9uIDIwMjQtMDMtMjggMTM6MjggKzAxMDAsIEhlaWtvIFRoaWVyeSBzcGFrZSB0aHVzbHk6Cj4g
PiBZb3Ugb25seSBjYW4gc3BlY2lmeSBvbmUgbGlzdCBvZiBhcmd1bWVudHMgdGhhdCBhcmUgcGFz
c2VkIHRvIHNldmVyYWwKPiA+IHNjcmlwdHMgKEJSMl9ST09URlNfUFJFX0JVSUxEX1NDUklQVCwg
QlIyX1JPT1RGU19QT1NUX0JVSUxEX1NDUklQVCwKPiA+IEJSMl9ST09URlNfUE9TVF9GQUtFUk9P
VF9TQ1JJUFQgYW5kIEJSMl9ST09URlNfUE9TVF9JTUFHRV9TQ1JJUFRfQVJHUykuCj4gPgo+ID4g
U28geW91IGhhdmUgdG8gYmUgY2FyZWZ1bCB0aGF0IHRoZSBhcmd1bWVudHMgZm9yIHRoZXNlIHNj
cmlwdHMgZG8gbm90IGNvbGxpZGUuCj4gPgo+ID4gVG8gYWxsb3cgc3BlY2lmaXlpbmcgZGVkaWNh
dGVkIGFyZ3VtZW50cyB0byBlYWNoIG9mIHRoZSBzY3JpcHQgdGhlIG5ldwo+ID4gY29uZmlnIG9w
dGlvbnMgYXJlIGludHJvZHVjZWQuIEZvciBiYWNrd2FyZCBjb21wYXRpYmlsaXR5IHRoZSB2YWx1
ZSBvZgo+ID4gQlIyX1JPT1RGU19QT1NUX1NDUklQVF9BUkdTIGlzIHBhc3NlZCB0byB0aGUgc2Ny
aXB0cyBpbiBjYXNlIHRoZQo+ID4gc3BlY2lmaWMgYXJndW1lbnQgdmFsdWVzIGFyZSBub3QgcHJl
c2VudC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBIZWlrbyBUaGllcnkgPGhlaWtvLnRoaWVyeUBn
bWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBNYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDkgKystLQo+ID4gIGRvY3MvbWFudWFsL2N1c3RvbWl6ZS1wb3N0LWltYWdlLmFkb2Mg
fCAgNSArKysKPiA+ICBkb2NzL21hbnVhbC9jdXN0b21pemUtcm9vdGZzLmFkb2MgICAgIHwgIDYg
KysrCj4gPiAgZnMvY29tbW9uLm1rICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4g
PiAgc3lzdGVtL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICB8IDY0ICsrKysrKysrKysr
KysrKysrKysrKysrKy0tLQo+ID4gIDUgZmlsZXMgY2hhbmdlZCwgNzYgaW5zZXJ0aW9ucygrKSwg
MTAgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL01ha2VmaWxlIGIvTWFrZWZpbGUK
PiA+IGluZGV4IDkxOTczY2NhNjAuLmIyZmQzZTg4MWIgMTAwNjQ0Cj4gPiAtLS0gYS9NYWtlZmls
ZQo+ID4gKysrIGIvTWFrZWZpbGUKPiA+IEBAIC01ODQsNyArNTg0LDggQEAgJChCVUlMRF9ESVIp
L2J1aWxkcm9vdC1jb25maWcvYXV0by5jb25mOiAkKEJSMl9DT05GSUcpCj4gPiAgcHJlcGFyZTog
JChCVUlMRF9ESVIpL2J1aWxkcm9vdC1jb25maWcvYXV0by5jb25mCj4gPiAgICAgICBAJChmb3Jl
YWNoIHMsICQoY2FsbCBxc3RyaXAsJChCUjJfUk9PVEZTX1BSRV9CVUlMRF9TQ1JJUFQpKSwgXAo+
ID4gICAgICAgICAgICAgICAkKGNhbGwgTUVTU0FHRSwiRXhlY3V0aW5nIHByZS1idWlsZCBzY3Jp
cHQgJChzKSIpOyBcCj4gPiAtICAgICAgICAgICAgICQoRVhUUkFfRU5WKSAkKHMpICQoVEFSR0VU
X0RJUikgJChjYWxsIHFzdHJpcCwkKEJSMl9ST09URlNfUE9TVF9TQ1JJUFRfQVJHUykpJChzZXAp
KQo+ID4gKyAgICAgICAgICAgICAkKEVYVFJBX0VOVikgJChzKSAkKFRBUkdFVF9ESVIpIFwKPiA+
ICsgICAgICAgICAgICAgJChpZiAkKGNhbGwgcXN0cmlwLCQoQlIyX1JPT1RGU19QUkVfQlVJTERf
U0NSSVBUX0FSR1MpKSwkKGNhbGwgcXN0cmlwLCQoQlIyX1JPT1RGU19QUkVfQlVJTERfU0NSSVBU
X0FSR1MpKSwkKGNhbGwgcXN0cmlwLCQoQlIyX1JPT1RGU19QT1NUX1NDUklQVF9BUkdTKSkpJChz
ZXApKQo+Cj4gSSB0aGluayBJIHdvdWxkIGp1c3QgaGF2ZSBnb25lIHdpdGggYSBtdWNoIHNpbXBs
ZXIgc29sdXRpb246Cj4KPiAgICAgJChFWFRSQV9FTlYpICQocykgJChUQVJHRVRfRElSKSBcCj4g
ICAgICAgICAkKGNhbGwgcXN0cmlwLCQoQlIyX1JPT1RGU19QT1NUX1NDUklQVF9BUkdTKSBcCj4g
ICAgICAgICAtLSBcCj4gICAgICAgICAkKGNhbGwgcXN0cmlwLCQoQlIyX1JPT1RGU19QUkVfQlVJ
TERfU0NSSVBUX0FSR1MpKQo+Cj4gSS5lLiBhbHdheXMgcGFzcyB0aGUgZ2VuZXJpYyBhcmd1bWVu
dHMgYXMgdGhleSBhcmUgcGFzc2VkIHRvZGF5LCBhZGQgYQo+IHNlcGFyYXRpbmcgbWFya2VyICh0
aGUgdXN1YWwgLS0pLCBhbmQgdGhlbiB0aGUgbmV3IGFyZ3VtZW50cy4KPgo+IFRoZSBhZHZhbnRn
ZSBpcyB0aGF0IGl0IHN0aWxsIGFsbG93cyB0byBlYXNpbHkgcGFzcyBjb21tb24gYXJndW1lbnRz
IHRvCj4gYWxsIHNjcmlwdHMsIGFkZHMgdGhlIHBvc3NpYmlsaXR5IHRvIHBhc3MgY3VzdG9tIGFy
Z3MgdG8gdGhlIGRpZmZlcmVudAo+IHR5cGVzIG9mIHNjcmlwdHMgKHBvc3QgYnVpbGQsIGZha2Vy
b290LCBhbmQgcG9zdCBpbWFnZSkuCj4KPiBUaGUgZHJhd2JhY2sgaXMgdGhhdCBpdCBjb3VsZCBi
cmVhayBleGlzdGluZyBzY3JpcHRzIHRoYXQgZG8gaXRlcmF0ZQo+IG92ZXIgdGhlaXIgYXJndW1l
bnRzLCBpbiB0aGV5IGFyZSBub3QgcHJlcGFyZWQgdG8gY29wZSB3aXRoIC0tLiBJIGhhdmUKPiBu
byBpZGVhIGhvdyBwcmV2YWxlbnQgdGhhdCB1c2FnZSBpczsgSSB3b3VsZCB0aGluayB0aGF0IHNj
cmlwdHMgbW9zdGx5Cj4gZXhwZWN0cyBhIGZpeGVkIG51bWJlciBvZiBhcmd1bWVudHMsIGFuZCBy
ZWZlciB0byB0aGVtIHdpdGggZXhwbGljaXQKPiBwb3NpdGlvbmFsIGFyZ3MgKCR7MX0sICR7Mn0u
Li4pLCBvciB0aGF0IHRoZXkgYXJlIGV4cGVjdGluZyBzdGFuZGFyZAo+IGdldG9wdCBhcmdzLCBs
aWtlIG91ciBnZW5lcmljIHN1cHBvcnQvc2NyaXB0cy9nZW5pbWFnZS5zaCwgd2hpY2ggd291bGQK
PiB0aGVuIHN0b3AgcHJvY2Vzc2luZyBzdHVmZiB3aGVuIGVuY291bnRlcmluZyAnLS0nLgo+Cj4g
T3IgZXZlbiBzaW1wbGVyIHlldCwganVzdCBwYXNzIGJvdGg6Cj4KPiAgICAgJChFWFRSQV9FTlYp
ICQocykgXAo+ICAgICAgICAgJChUQVJHRVRfRElSKSBcCj4gICAgICAgICAkKGNhbGwgcXN0cmlw
LCQoQlIyX1JPT1RGU19QT1NUX1NDUklQVF9BUkdTKSBcCj4gICAgICAgICAkKGNhbGwgcXN0cmlw
LCQoQlIyX1JPT1RGU19QUkVfQlVJTERfU0NSSVBUX0FSR1MpKQoKSSB0aGluayB0aGlzIGlzIHJl
YWxseSBhIGVhc2llciBzb2x1dGlvbiB3aXRoIHRoZSBhZHZhbnRhZ2Ugb2YgaGF2aW5nCmNvbW1v
biBhcmdzIGFjcm9vcyBhbGwgc2NyaXB0IHR5cGVzLgoKPiBUaGUgcmVhc29uaW5nIGhlcmUgaXMg
ZXZlbiBzaW1wbGVyOgo+Cj4gIDEuIGlmIHBlb3BsZSBwcm92aWRlIHNjcmlwdHMgdGhhdCBoYXZl
IGEgc2NvbW1vbiBzZXQgb2YgYXJncywgYW5kIGVhY2gKPiAgICAgdHlwZSBvZiBzY3JpcHRzIGhh
dmUgc3BlY2lhbCBhcmdzLCB0aGF0IGp1c3Qgd29ya3M6Cj4gICAgIC0gaWYgYXJncyBhcmUgb25s
eSBwb3NpdGlvbmFsLCBzY3JpcHRzIGhhdmUgdG8gaGFyZGNvZGUgdGhhdAo+ICAgICAgIGtub3ds
ZWRnZSwgc28gdGhleSBrbm93IGhvdyB0byBpbnRlcnByZXQgdGhlIHBvc2l0aW9ubCBhcmdzLAo+
ICAgICAtIGlmIHNjcmlwdHMgdXNlIG9wdGlvbiBwYXJzaW5nLCBsaWtlIHdpdGggZ2V0b3B0LCB0
aGVuIHRoYXQgYWxzbwo+ICAgICAgIGF1dG9tYWdpY2FsbHkgd29ya3MKPiAgICAgSW4gYm90aCBj
YXNlcywgdGhleSBjYW4gZGVjaWRlIHRvIHBhc3MgdGhlIGNvbW1vbiBhcmdzIHdpdGggdGhlCj4g
ICAgIGV4aXN0aW5nIEJSMl9ST09URlNfUE9TVF9TQ1JJUFRfQVJHUywgYW5kIHRoZSBzcGVjaWZp
YyBhcmdzIHdpdGggdGhlCj4gICAgIG5ldyBCUjJfUk9PVEZTX1BSRV9CVUlMRF9TQ1JJUFRfQVJH
Uywgb3IgdGhleSBjYW4gZGVjaWRlIHRvIGlnbm9yZQo+ICAgICBoZSBmb3JtZXIgIGFuZCBpb25s
eSB1c2UgdGhlIGxhdHRlcjsKPgo+ICAyLiBpZiBwZW9wbGUgcHJvdmlkZSBzY3JpcHRzIHRoYXQg
aGF2ZSBubyBjb21tb24gYXJncywgdGhlbiB0aGV5J3JlCj4gICAgIGJhY2sgdG8gdGhlIHNpdHVh
dGlvbiBhYm92ZSwgd2hlcmUgdGhlIHNldCBvZiBjb21tb24gYXJncyBpcyBqdXN0Cj4gICAgIGVt
cHR5Lgo+Cj4gU28sIEkgdGhpbmsgdGhpcyBsYXN0LCBzaW1wbGVyIG9wdGlvbiBpcyB0aGUgYmVz
dCBzb2x0dWlvbi4KPgo+IFRob3VnaHRzPwoKSSB3aWxsIHJld29yayB0aGUgcGF0Y2ggYW5kIHBy
b3ZpZGUgYW4gdXBkYXRlZCBvbmUuCgotLSAKSGVpa28KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
