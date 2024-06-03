Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43E9C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 21:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97BF181234;
	Mon,  3 Jun 2024 21:40:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f2CMCVL3zSCA; Mon,  3 Jun 2024 21:40:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8828C81236
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8828C81236;
	Mon,  3 Jun 2024 21:40:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B81AF1BF2FA
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 21:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFCC7403B8
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 21:40:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EuujxO1xlDxV for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 21:40:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::82d; helo=mail-qt1-x82d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3033240322
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3033240322
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3033240322
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 21:40:12 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id
 d75a77b69052e-43fdbe0f072so27145491cf.3
 for <buildroot@buildroot.org>; Mon, 03 Jun 2024 14:40:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717450812; x=1718055612;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fnteboVGJjlL4loDzIA0GPHp8Y3AMgze//9RfYSCvk8=;
 b=TS/9PZ2V7K5oxVr+0T79JWE3d8fszj1swep2sKvIEtpMeTE1UF7mWZbXay5yQ1XsKL
 7d9P76OuDMEOQ1/KGSNJgoYTattoSoVvqm05vBG4jozNP9UKnSGEuFxI/Y5HTqa6pakk
 IXgfncJzsPKSBOB7gSiqavsvAjAV++6FFqoUDzCHeMrj7o2GUcTBt4oP93NSQBApy/74
 9FAeFYWteTs/K435lrIpFbft3Z2+7KI7ftiWCW/83LuU0a6PNt36P98V+dSPXwnloWFB
 x1brhn4V5t7HyiCr0RVqmuFHS22Dcp6CzF8yIG0hifbIeTaZqwcZysuBS58MyICb8FXw
 dfoQ==
X-Gm-Message-State: AOJu0YweEtCJsBsL5p4x+279mEdaPbs/VS6aqZ62ZT0xeWlj0luRbd0L
 dZT+1p834TLAHnZRD0bFNSlXzIQob8fq+HerZ8BuWNPMmLh6T+MtcZUNdzOInJgnrmfA5lgcpyz
 1xJH3LSHABdt/77sgMNDMgzht8p8Wv/mAqwU=
X-Google-Smtp-Source: AGHT+IEM9ZATQqG1VSfTN9WVx+E3ztgonnmXxrVCv93b0R5DL70W3W4qeykXw9pjyQpG0W5SMSgY8z7dGUKKT3CKZ9Y=
X-Received: by 2002:ac8:5811:0:b0:43a:d7a9:390 with SMTP id
 d75a77b69052e-43ff52592f3mr92158701cf.29.1717450811721; Mon, 03 Jun 2024
 14:40:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240602204139.2508623-1-james.hilliard1@gmail.com>
 <Zl4rvlgxhcew9r6_@landeda>
In-Reply-To: <Zl4rvlgxhcew9r6_@landeda>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 3 Jun 2024 15:40:00 -0600
Message-ID: <CADvTj4pT1Nq8Z09H3_kg0Cydk7S4sYpiE0gUUWPXMx9x6wvLDQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717450812; x=1718055612; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fnteboVGJjlL4loDzIA0GPHp8Y3AMgze//9RfYSCvk8=;
 b=ET/vYfng0w4BzyYhlwuiGq8kyoKxZZxl/mns109JcVmmfWQtVVME6muypirUuPQo80
 iyUY8D4xs33Hp9UBTowFa/X+mLCBVOKOYIvEgAlSwb5UzP3qVaypmZzHoxcJPSf3vNVK
 DOWra1+1DzeuN2Rsskyi9K0zC6AzpfGmq+YFdj2wAChF2ykdnAh5LcVI7FNtYd98JhJJ
 0AvuJlD1sITr1KsLl6oTIdiQI9/qi1TRHIGCcc4pm1xHhWl21e142pHkPIGmjk+/5aoX
 dUXvtGPzovY/6hfLtdB2WqzFiokeYstY38Rz1gtnkR5fRD3U+TTyh4a9rXz+qs0NMhUW
 4CYg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ET/vYfng
Subject: Re: [Buildroot] [PATCH v2 1/1] package/vala: bump to version 0.56.17
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

T24gTW9uLCBKdW4gMywgMjAyNCBhdCAyOjQ24oCvUE0gWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jp
bi4xOTk4QGZyZWUuZnI+IHdyb3RlOgo+Cj4gSmFtZXMsIEFsbCwKPgo+IE9uIDIwMjQtMDYtMDIg
MTQ6NDEgLTA2MDAsIEphbWVzIEhpbGxpYXJkIHNwYWtlIHRodXNseToKPiA+IFNldCBHSV9HSVJE
SVIgZW52IHZhcmlhYmxlIHdoaWNoIGlzIG5vdyByZXF1aXJlZCBmb3IgY29uZmlndXJlCj4gPiB0
byBmdW5jdGlvbi4KPiA+Cj4gPiBEZXRhaWxzOgo+ID4gaHR0cHM6Ly9naXRsYWIuZ25vbWUub3Jn
L0dOT01FL3ZhbGEvLS9jb21taXQvYTlkMzgwNzBjZTg2ZDc5OTRiOTQ5ZjdjYjQyNmZiZjY3MGE5
NTNkOAo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFy
ZDFAZ21haWwuY29tPgo+ID4gLS0tCj4gPiBDaGFuZ2VzIHYxIC0+IHYyOgo+ID4gICAtIHNldCBH
SV9HSVJESVIgaW4gZW52IGluc3RlYWQgb2YgZGVwZW5kaW5nIG9uIGhvc3QtR09JCj4gPiAtLS0K
PiA+ICBwYWNrYWdlL3ZhbGEvdmFsYS5oYXNoIHwgIDQgKystLQo+ID4gIHBhY2thZ2UvdmFsYS92
YWxhLm1rICAgfCAxMSArKysrKysrKy0tLQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0
aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS92YWxh
L3ZhbGEuaGFzaCBiL3BhY2thZ2UvdmFsYS92YWxhLmhhc2gKPiA+IGluZGV4IGIzNzE2ZjA4NTQu
LmExNjg3NWFjNmEgMTAwNjQ0Cj4gPiAtLS0gYS9wYWNrYWdlL3ZhbGEvdmFsYS5oYXNoCj4gPiAr
KysgYi9wYWNrYWdlL3ZhbGEvdmFsYS5oYXNoCj4gPiBAQCAtMSw0ICsxLDQgQEAKPiA+IC0jIEZy
b20gaHR0cHM6Ly9kb3dubG9hZC5nbm9tZS5vcmcvc291cmNlcy92YWxhLzAuNTYvdmFsYS0wLjU2
LjE0LnNoYTI1NnN1bQo+ID4gLXNoYTI1NiAgOTM4MmMyNjhjYTliZGMwMmFhZWRjODE1MmE5ODE4
YmYzOTM1MjczMDQxZjYyOWM1NmRlNDEwZTM2MGEzZjU1NyAgdmFsYS0wLjU2LjE0LnRhci54ego+
ID4gKyMgRnJvbSBodHRwczovL2Rvd25sb2FkLmdub21lLm9yZy9zb3VyY2VzL3ZhbGEvMC41Ni92
YWxhLTAuNTYuMTcuc2hhMjU2c3VtCj4gPiArc2hhMjU2ICAyNjEwMGM0ZTRlZjAwNDljNjE5Mjc1
ZjE0MGQ5N2NmNTY1ODgzZDAwYzc1NDNjODJiY2NlNWE0MjY5MzRlZDZhICB2YWxhLTAuNTYuMTcu
dGFyLnh6Cj4gPiAgIyBMb2NhbGx5IGNvbXB1dGVkCj4gPiAgc2hhMjU2ICA1ZGYwNzAwNzE5ODk4
OWM2MjJmNWQ0MWRlOGQ3MDNlN2JlZjNkMGU3OWQ2MmUyNDMzMmVlNzM5YTQ1MmFmNjJhICBDT1BZ
SU5HCj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS92YWxhL3ZhbGEubWsgYi9wYWNrYWdlL3ZhbGEv
dmFsYS5tawo+ID4gaW5kZXggNDE1ZDk5NmZhYS4uYTFjMjcyNDBhYyAxMDA2NDQKPiA+IC0tLSBh
L3BhY2thZ2UvdmFsYS92YWxhLm1rCj4gPiArKysgYi9wYWNrYWdlL3ZhbGEvdmFsYS5tawo+ID4g
QEAgLTUsMTcgKzUsMjIgQEAKPiA+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ID4KPiA+ICBW
QUxBX1ZFUlNJT05fTUFKT1IgPSAwLjU2Cj4gPiAtVkFMQV9WRVJTSU9OID0gJChWQUxBX1ZFUlNJ
T05fTUFKT1IpLjE0Cj4gPiArVkFMQV9WRVJTSU9OID0gJChWQUxBX1ZFUlNJT05fTUFKT1IpLjE3
Cj4gPiAgVkFMQV9TSVRFID0gaHR0cDovL2Rvd25sb2FkLmdub21lLm9yZy9zb3VyY2VzL3ZhbGEv
JChWQUxBX1ZFUlNJT05fTUFKT1IpCj4gPiAgVkFMQV9TT1VSQ0UgPSB2YWxhLSQoVkFMQV9WRVJT
SU9OKS50YXIueHoKPiA+ICBWQUxBX0xJQ0VOU0UgPSBMR1BMLTIuMSsKPiA+ICBWQUxBX0xJQ0VO
U0VfRklMRVMgPSBDT1BZSU5HCj4gPiAgVkFMQV9DUEVfSURfVkVORE9SID0gZ25vbWUKPiA+Cj4g
PiAtSE9TVF9WQUxBX0RFUEVOREVOQ0lFUyA9IGhvc3QtYmlzb24gaG9zdC1mbGV4IGhvc3QtbGli
Z2xpYjIKPiA+ICtIT1NUX1ZBTEFfREVQRU5ERU5DSUVTID0gXAo+ID4gKyAgICAgaG9zdC1iaXNv
biBcCj4gPiArICAgICBob3N0LWZsZXggXAo+ID4gKyAgICAgaG9zdC1saWJnbGliMgo+Cj4gQWx0
aG91Z2ggSSBkbyBwcmVmZXIgd2hlbiBtdWx0aS1lbnRyaWVzIGFyZSBtdWx0aS1saW5lcywgdGhp
cyBjaGFuZ2UgaXMKPiBncmF0dWl0b3VzIGluIHRoaXMgY29tbWl0LCBzbyBJIGRyb3BwZWQgaXQg
KGFyZ3VhYmxlLCBidXQgdGhhdCdzIHB1c2hlZAo+IG5vdykuCj4KPiBBcHBsaWVkIHRvIG5leHQs
IHRoYW5rcy4KClRoaXMgcHJvYmFibHkgc2hvdWxkIGhhdmUgZ29uZSBpbiBtYXN0ZXIgc2luY2Ug
aXQncyBuZWVkZWQgZm9yIGJ1aWxkIGhvc3RzCndpdGggR0NDIDE0LgoKT3RoZXJ3aXNlIHdlIGdl
dCBlcnJvciBsaWtlIHRoaXM6Cmh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRz
L2YwOC9mMDg3Yjg3OTE2NzI1MjY5MGVkMTk4ZGU3NzEyOTIxNDJjNjI0OWY4L2J1aWxkLWVuZC5s
b2cKCj4KPiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4uCj4KPiA+ICAjIFllcywgdGhlIGF1dG9j
b25mIHNjcmlwdCB1bmRlcnN0YW5kcyAnOicgYXMgInhzbHRwcm9jIGlzIG5vdAo+ID4gICMgYXZh
aWxhYmxlIi4KPiA+IC1IT1NUX1ZBTEFfQ09ORl9FTlYgPSBhY19jdl9wYXRoX1hTTFRQUk9DPToK
PiA+ICtIT1NUX1ZBTEFfQ09ORl9FTlYgPSBcCj4gPiArICAgICBhY19jdl9wYXRoX1hTTFRQUk9D
PTogXAo+ID4gKyAgICAgR0lfR0lSRElSPSIkKFNUQUdJTkdfRElSKS91c3Ivc2hhcmUvZ2lyLTEu
MCIKPiA+ICBIT1NUX1ZBTEFfQ09ORl9PUFRTICs9IC0tZGlzYWJsZS12YWxhZG9jCj4gPgo+ID4g
ICMgV2Ugd3JhcCB2YWxhLCB2YWxhYyBhbmQgdmFwaWdlbiB0byBwb2ludCB0byB0aGUgcHJvcGVy
IGdpciBhbmQgdmFwaSBkYXRhIGRpcnMKPiA+IC0tCj4gPiAyLjM0LjEKPiA+Cj4gPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gYnVpbGRyb290IG1h
aWxpbmcgbGlzdAo+ID4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+Cj4gLS0KPiAuLS0tLS0t
LS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS0tLgo+IHwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVk
IHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8Cj4gfCArMzMgNjYyIDM3
NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAg
ICAgICAgICAgIHwKPiB8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBY
ICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAo+IHwgaHR0cDovL3ltb3Jpbi5p
cy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJh
Y3kuICB8Cj4gJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0t
LS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
