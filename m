Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED01C07545
	for <buildroot@archiver.kernel.org>; Wed, 25 Oct 2023 14:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8363743370;
	Wed, 25 Oct 2023 14:50:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8363743370
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3LrumNnMo7FI; Wed, 25 Oct 2023 14:50:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C850B43394;
	Wed, 25 Oct 2023 14:50:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C850B43394
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 568531BF392
 for <buildroot@lists.busybox.net>; Wed, 25 Oct 2023 14:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C3C670496
 for <buildroot@lists.busybox.net>; Wed, 25 Oct 2023 14:50:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C3C670496
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z24HXrbrVVOi for <buildroot@lists.busybox.net>;
 Wed, 25 Oct 2023 14:50:06 +0000 (UTC)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6AD547048B
 for <buildroot@buildroot.org>; Wed, 25 Oct 2023 14:50:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AD547048B
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-507be298d2aso8489291e87.1
 for <buildroot@buildroot.org>; Wed, 25 Oct 2023 07:50:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698245404; x=1698850204;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nUpRZnvdhWhN1Z51b17WI++dPEWabQUBo4ExsRi8wwA=;
 b=UcMKKl32nnidMqqMcMKAZHkRQyPWMZa6j/3V3dVOOtyOOaM5BEGhNNm0dt4pAeTVej
 SG1Ua29H09qzvkB+SHsMvIGPMwRprXGEVRNyargY8FFJPDVZdf8TQBWlNjWDqlxHGowM
 H0JQSQCB2c2mySA+rZro57lTYheAxDOMdVUboLob5c5SmsByrzeLN57rNy18CkhULhvP
 qVDnImhDPi7jU83Wc31z87//Jnw4j5BtVqQGWMqa6x+jmiT9f0xjQNaG2ulnJI36qZ4w
 LK9Vuyg9h0dt/Z7AJmjaJ6UDhskD2ekkkkTECnRwZaimR0gcd3s5Fm+ox8VIbsWXDByL
 +y1w==
X-Gm-Message-State: AOJu0YydFPpqMg/PzhXyinvo+Hu+wt4bd8e+WfDiK8JkPDL0RWFruKQD
 OqpnHaRFIuvgyQz3vwJV6+egwA==
X-Google-Smtp-Source: AGHT+IGKPjKiM3T21OSAfz+cKmln1TfEn7MK6FuX9h4U3OJGq2uFrHW/ELu0QJI9HKDFvtahJddyAg==
X-Received: by 2002:a05:6512:3e0a:b0:508:1a25:b092 with SMTP id
 i10-20020a0565123e0a00b005081a25b092mr1052847lfv.24.1698245404145; 
 Wed, 25 Oct 2023 07:50:04 -0700 (PDT)
Received: from [10.5.3.222]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 v19-20020a05600c471300b00405959bbf4fsm14983731wmo.19.2023.10.25.07.50.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Oct 2023 07:50:03 -0700 (PDT)
Message-ID: <b16fd091-eb7b-48e3-84ea-d4c3b71f7db3@smile.fr>
Date: Wed, 25 Oct 2023 16:50:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@mind.be>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
References: <20230817230844.450092-1-romain.naour@gmail.com>
 <20230817230844.450092-4-romain.naour@gmail.com>
 <35a394cd-799f-9a00-68b1-2e2b6e14bdcc@mind.be>
Content-Language: fr, en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <35a394cd-799f-9a00-68b1-2e2b6e14bdcc@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1698245404; x=1698850204;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nUpRZnvdhWhN1Z51b17WI++dPEWabQUBo4ExsRi8wwA=;
 b=s27lcNfVOAMm/qBtqSdN/x9UgBQ8olbfMuFWoIld71nuhh7ekPDbtfTArgr8Bbb4H5
 5bbxw85Ilaxm1+cWkQfb7zKKtwZ7lMpinqfhVH0yKhR5dKLEGtQLTT2bAzG/zyHZiRTH
 gTs6i+i+M6XPXI+D6uwmLn3PuYfqZS2CGsCmAjPbmGMy/5jbOI6/6wS5LrljH2rdYdQg
 APFQTUCaTGdj8TE4Z41J+mP0tOrw+A2aiY0XH0/1E4L4YVrykM2zCzq96wYEfnQjHSvC
 hUzwZT+Twn5zcMIauePidjSqpjJumijbBJx5bhVbTiF426t+FhmvhsdziZRmsDCSOFkd
 Lu6w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=s27lcNfV
Subject: Re: [Buildroot] [PATCH 4/4] configs/avenger96_defconfig: bump ATF
 version to 2.9 for binutils 2.39+ support
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
Cc: Marleen Vos <marleen.vos@mind.be>, Dario Binacchi <dariobin@libero.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQXJub3V0LCBBbGwsCgpMZSAyMC8xMC8yMDIzIMOgIDEyOjA3LCBBcm5vdXQgVmFuZGVj
YXBwZWxsZSB2aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gwqBIaSBSb21haW4sCj4gCj4gT24g
MTgvMDgvMjAyMyAwMTowOCwgUm9tYWluIE5hb3VyIHdyb3RlOgo+PiBUaGlzIG5ldyBiaW51dGls
cyB2ZXJzaW9uIGJyZWFrIHRoZSBBVEYgYnVpbGQgZHVlIHRvIG5ldyBsaW5rZXIgd2FybmluZ3M6
Cj4+Cj4+IMKgIGxkLmJmZDogd2FybmluZzogYmwyLmVsZiBoYXMgYSBMT0FEIHNlZ21lbnQgd2l0
aCBSV1ggcGVybWlzc2lvbnMKPj4KPj4gwqBGcm9tIFsxXQo+PiAiVXNlcnMgb2YgR05VIGxkIChC
UEYpIGZyb20gYmludXRpbHMgMi4zOSsgd2lsbCBvYnNlcnZlIG11bHRpcGxlIGluc3RhY2VzCj4+
IMKgIG9mIGEgbmV3IHdhcm5pbmcgd2hlbiBsaW5raW5nIHRoZSBibCouZWxmIGluIHRoZSBmb3Jt
Ogo+Pgo+PiDCoCBsZC5iZmQ6IHdhcm5pbmc6IHN0bTMybXAxX2hlbHBlci5vOiBtaXNzaW5nIC5u
b3RlLkdOVS1zdGFjayBzZWN0aW9uIGltcGxpZXMKPj4gZXhlY3V0YWJsZSBzdGFjawo+PiDCoCBs
ZC5iZmQ6IE5PVEU6IFRoaXMgYmVoYXZpb3VyIGlzIGRlcHJlY2F0ZWQgYW5kIHdpbGwgYmUgcmVt
b3ZlZCBpbiBhIGZ1dHVyZQo+PiB2ZXJzaW9uIG9mIHRoZSBsaW5rZXIKPj4gwqAgbGQuYmZkOiB3
YXJuaW5nOiBibDIuZWxmIGhhcyBhIExPQUQgc2VnbWVudCB3aXRoIFJXWCBwZXJtaXNzaW9ucwo+
PiDCoCBsZC5iZmQ6IHdhcm5pbmc6IGJsMzIuZWxmIGhhcyBhIExPQUQgc2VnbWVudCB3aXRoIFJX
WCBwZXJtaXNzaW9ucwo+Pgo+PiBUaGVzZSBuZXcgd2FybmluZ3MgYXJlIGVuYmFsZWQgYnkgZGVm
YXVsdCB0byBzZWN1cmUgZWxmIGJpbmFyaWVzOgo+PiDCoMKgIC0KPj4gaHR0cHM6Ly9zb3VyY2V3
YXJlLm9yZy9naXQvP3A9YmludXRpbHMtZ2RiLmdpdDthPWNvbW1pdDtoPWJhOTUxYWZiOTk5MTJk
YTAxYTZlODQzNDEyNmI4ZmFjN2FhNzUxMDcKPj4gwqDCoCAtCj4+IGh0dHBzOi8vc291cmNld2Fy
ZS5vcmcvZ2l0Lz9wPWJpbnV0aWxzLWdkYi5naXQ7YT1jb21taXQ7aD0wZDM4NTc2YTM0ZWM2NGEx
YjQ1MDBjOTI3N2E4ZTlkMGYwN2U2Nzc0Cj4+ICIKPj4KPj4gQnVtcCB0aGUgQVRGIGN1c3RvbSB2
ZXJzaW9uIHRvIDIuOSBmb3IgYmludXRpbHMgMi4zOSsgc3VwcG9ydC4KPiAKPiDCoERpZCB5b3Ug
dGVzdCB0aGlzIG9uIHRoZSBib2FyZD8gSSBub3cgaGF2ZSBhbiBhdmVuZ2VyOTYgYm9hcmQgKCop
IHRoYW5rcyB0bwo+IEVtYmVkZGVkIFJlY2lwZXMsIGFuZCBJIGRpZCBhIHF1aWNrIHRlc3Qgb2Yg
dGhpcyBkZWZjb25maWcgYW5kIGl0IGdpdmVzIGFuIGVycm9yCj4gaW4gVEYtQS4uLgoKVGhpcyBp
cyBteSBiZXN0IGVmZm9ydCBhdHRlbXB0IHRvIGZpeCBiaW51dGlscyAyLjM5KyBpc3N1ZXMgb24g
Ym9hcmRzIEkgZG9uJ3QKaGF2ZS4uLiBIZW5jZSB0aGUgZGlzY3Vzc2lvbiB3ZSBoYWQgZHVyaW5n
IHRoZSBsYXN0IG1lZXRpbmcgYWJvdXQgdXNpbmcgcHJlYnVpbHQKdG9vbGNoYWluIGZvciBib2Fy
ZHMgZGVmY29uZmlnLiBJbmRlZWQsIHRvb2xjaGFpbiBwYXJ0IGFyZSB1cGRhdGVkIGZhc3RlciB0
aGFuCnNvbWUgQlNQIGJvYXJkLgoKYmludXRpbHM6IDIgcmVsZWFzZXMgcGVyIHllYXIKZ2NjOiAx
IHJlbGVhc2UgcGVyIHllYXIKZ2xpYmM6IDIgcmVsZWFzZXMgcGVyIHllYXIKCkkgd291bGQgc3Vn
Z2VzdCB0byByZXZlcnQgdGhpcyBjb21taXQgYW5kIHN3aXRjaCB0byBhIHByZWJ1aWx0IHRvb2xj
aGFpbiB1c2luZwphbiBvbGQgYmludXRpbHMgdmVyc2lvbiBpZiB3ZSBjYW4ndCB1cGRhdGUgdGhp
cyBkZWZjb25maWcuCgo+IAo+IMKgRGFyaW8sIFBldGVyLCBJIGJlbGlldmUgYm90aCBvZiB5b3Ug
YWxzbyBoYWQgYW4gYXZlbmdlcjk2IGJvYXJkLCBkaWQgeW91IHRlc3QKPiBpdCByZWNlbnRseT8K
ClRoZSBpc3N1ZSBpcyBhcHBlYXIgb24gdGhlIGdpdGxhYi1jaSBzaW5jZSBiaW51dGlscyAyLjM5
IGlzIHRoZSBkZWZhdWx0IHZlcnNpb246CgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9y
Zy9idWlsZHJvb3QvLS9qb2JzLzQ2MDM5OTU4ODIKCmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJv
b3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1pdC9mYjUwZWFiOGE1ZTZiODJkZDBhMjkxNmI2ODA1YWI3
MTJkNGQ3MzUwCgpidXQgdGhlIGF2ZW5nZXI5Nl9kZWZjb25maWcgaGFzIGJlZW4gYWRkZWQgYmFj
ayBpbiAyMDIxLjAyIChhbmQgbmV2ZXIgdXBkYXRlZApzaW5jZSB0aGVuKS4KCmh0dHBzOi8vZ2l0
bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1pdC8yMTA3ZjdhNzViZjcwZGY4
NWNlMWEwZDhmN2YyZjY3ZWQ2MmEyOTIxCgpTbyB0b2RheSB3ZSBhcmUgdXNpbmcgYSB0b29sY2hh
aW4gdXNpbmcgcmVsZWFzZXMgdGhhdCB3ZXJlIG5vdCB5ZXQgYXZhaWxhYmxlIGF0CnRoZSB0aW1l
IHRoYXQgdGhlIGF2ZW5nZXI5Nl9kZWZjb25maWcgd2FzIGNvbnRyaWJ1dGVkLgoKQmVzdCByZWdh
cmRzLApSb21haW4KCj4gCj4gCj4gwqBSZWdhcmRzLAo+IMKgQXJub3V0Cj4gCj4gKCopIEFjdHVh
bGx5IEkgbm8gbG9uZ2VyIGhhdmUgaXQsIEkgZ2F2ZSBpdCB0byBteSBjb2xsZWFndWUgTWFybGVl
biAoaW4gQ2MpCj4gCj4+Cj4+IEZpeGVzOgo+PiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290
Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzQ4ODk0MzYyODMKPj4KPj4gU2lnbmVkLW9mZi1ieTogUm9t
YWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgo+PiAtLS0KPj4gwqAgY29uZmlncy9h
dmVuZ2VyOTZfZGVmY29uZmlnIHwgMiArLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3MvYXZlbmdlcjk2
X2RlZmNvbmZpZyBiL2NvbmZpZ3MvYXZlbmdlcjk2X2RlZmNvbmZpZwo+PiBpbmRleCAxZjhlN2E1
MGQxLi5hZGZkNzU4NWM0IDEwMDY0NAo+PiAtLS0gYS9jb25maWdzL2F2ZW5nZXI5Nl9kZWZjb25m
aWcKPj4gKysrIGIvY29uZmlncy9hdmVuZ2VyOTZfZGVmY29uZmlnCj4+IEBAIC0xNyw3ICsxNyw3
IEBAIEJSMl9UQVJHRVRfUk9PVEZTX0VYVDJfU0laRT0iMTIwTSIKPj4gwqAgIyBCUjJfVEFSR0VU
X1JPT1RGU19UQVIgaXMgbm90IHNldAo+PiDCoCBCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1X
QVJFPXkKPj4gwqAgQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9DVVNUT01fVkVSU0lP
Tj15Cj4+IC1CUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0NVU1RPTV9WRVJTSU9OX1ZB
TFVFPSJ2Mi4yIgo+PiArQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9DVVNUT01fVkVS
U0lPTl9WQUxVRT0idjIuOSIKPj4gwqAgQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9Q
TEFURk9STT0ic3RtMzJtcDEiCj4+IMKgIEJSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVf
QURESVRJT05BTF9WQVJJQUJMRVM9IlNUTTMyTVBfU0RNTUM9MQo+PiBBQVJDSDMyX1NQPXNwX21p
biBEVEJfRklMRV9OQU1FPXN0bTMybXAxNTdhLWF2ZW5nZXI5Ni5kdGIiCj4+IMKgIEJSMl9UQVJH
RVRfQVJNX1RSVVNURURfRklSTVdBUkVfREVCVUc9eQo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
