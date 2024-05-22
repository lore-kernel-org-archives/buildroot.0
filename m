Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED92C25B78
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 15:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8BB8B404F8;
	Wed, 22 May 2024 15:20:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gVBQ4l90RShU; Wed, 22 May 2024 15:20:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6005C40454
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6005C40454;
	Wed, 22 May 2024 15:20:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C6B9D1C5C9B
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 15:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C05A360730
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 15:19:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZDmjaiOGiZfp for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 15:19:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com;
 envelope-from=gero.schwaericke@grandcentrix.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 27A1E60712
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27A1E60712
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 27A1E60712
 for <buildroot@buildroot.org>; Wed, 22 May 2024 15:19:57 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-51f174e316eso6150910e87.0
 for <buildroot@buildroot.org>; Wed, 22 May 2024 08:19:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716391196; x=1716995996;
 h=content-transfer-encoding:content-disposition:in-reply-to
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=63QeLhag+s2fDMlvvZtmL1hDyx9i7k/hIE1IYHNR6Ic=;
 b=ufQY6wwRRcooXbHYVob6EX0c+GHb/O3dyPsxp88fJVZ8JHomqUN5H7TZAi6Hmx63j7
 rZpQmAKjr10mF1rU6Pxn5+FAegEMwKAz6Dv7np5jcc9Ioi+fZCEJDKmsM2pqFjby17G8
 klBh5+8F/voGyeLaVbkrm4i6bAShYyTv/yceRkya8d7B4PozaM2petP7+tdJpS3ZvDlJ
 byESWj0QSrnlcJubcOjuoDHPuQAsa/9bmaEr7K63bYc4qcLhBg/q40x3fWjonV3h1CbQ
 sWSZpwRgoT5JMf2qQWR5NO+T3JbFY64rl1vM7gkl2fajxP4mx2ocJIYLoFz5xgYaDj+A
 pJ2Q==
X-Gm-Message-State: AOJu0Yy7AVAkhA/ou20jBid2+9roI6frBOmkoyoFcdY1lQYXaNa660TH
 IWnxBzD1MQbZlFkEzAKUcX69mPU3Z0Bo/GW2bK+bkL+QogjPOkanSvQj81PWKJXN7jzsS5wg4kS
 oTljIyOIUJbX7u2jh0Q5d1QIAZGBBP3u6U/G/ePfDGCkrHBfzwrLtDRBpKHbbrg==
X-Google-Smtp-Source: AGHT+IG+kPoVHi/d6qwtvguowiqh5p5RnOT/c5QV+xScgXeIfS/FO6RajajSF84dWJKl5T6+MiJdlQ==
X-Received: by 2002:ac2:5e29:0:b0:51e:245a:8ed3 with SMTP id
 2adb3069b0e04-526bf268057mr1358651e87.28.1716391195619; 
 Wed, 22 May 2024 08:19:55 -0700 (PDT)
Received: from theia ([2a02:8109:8abb:b200:5511:c468:882a:3860])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1781d294sm1781529666b.28.2024.05.22.08.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 08:19:55 -0700 (PDT)
Date: Wed, 22 May 2024 17:19:53 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240522151953.GA1331364@theia>
Mail-Followup-To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 buildroot@buildroot.org
References: <20240421095353.208034-1-dario.binacchi@amarulasolutions.com>
 <20240421095353.208034-2-dario.binacchi@amarulasolutions.com>
 <20240510215442.3475120a@windsurf>
 <CAOf5uwkDmcxhWJUFhxjw_GJTiTEO5oEexb0Xjh6aNJx+K_9dXA@mail.gmail.com>
 <ZkwwN1NKZ2o1xMba@landeda>
 <CAOf5uwnVbowN6GCYUxFL0xh2YV9AvG2JTkuyQR6rk+56J=3DLQ@mail.gmail.com>
 <ZkzdeFeoYMkyGv7w@landeda>
MIME-Version: 1.0
In-Reply-To: <ZkzdeFeoYMkyGv7w@landeda>
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grandcentrix.net; s=google; t=1716391196; x=1716995996; darn=buildroot.org; 
 h=content-transfer-encoding:content-disposition:in-reply-to
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=63QeLhag+s2fDMlvvZtmL1hDyx9i7k/hIE1IYHNR6Ic=;
 b=SsS9KTDA11Cdv4twEFfWUgcFPVtcF/QPjbyPG/HoCn3gWMK2fJRMZmMIWdA2UnPBcw
 xgwa36EtXw9qb6/A0oHBDguuQ+jf9Tvmn/2IzVgHDmAy6vZygSsmDPtDxviM8L/JfKw9
 x6xgDpQN4B6QGmQBllX9F2/YsT5DaiFKv4rsX8Sf0ZJ0QGxO90kVafKPtKYxTVHaHCYG
 bGJw51wvgpIFXl5McR690H6YBsEIUnOkGvwEpjv8pG8UZ8GDUJw/68cH4cDQegS5w7uo
 zO9Hh8o6SbJKAIhKFOqu6QK7Y52oR03rZmmRGKskLxsSAwGskDjbqHHrcxaNScCUcbyJ
 hTgw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grandcentrix.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grandcentrix.net header.i=@grandcentrix.net
 header.a=rsa-sha256 header.s=google header.b=SsS9KTDA
Subject: Re: [Buildroot] [RFC PATCH 1/2] support/scripts/genimage.sh:
 support creating a bmap image
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
From: =?utf-8?q?Gero_Schw=C3=A4ricke_via_buildroot?= <buildroot@buildroot.org>
Reply-To: Gero =?utf-8?Q?Schw=C3=A4ricke?= <gero.schwaericke@grandcentrix.net>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBNYXkgMjEsIDIwMjQgYXQgMDc6NDQ6MjRQTSArMDIwMCwgWWFubiBFLiBNT1JJTiB3
cm90ZToKPiBNaWNoYWVsLCBBbGwsCj4gCj4gT24gMjAyNC0wNS0yMSAxMToyOCArMDIwMCwgTWlj
aGFlbCBOYXp6YXJlbm8gVHJpbWFyY2hpIHNwYWtlIHRodXNseToKPiA+IE9uIFR1ZSwgTWF5IDIx
LCAyMDI0IGF0IDc6MjXigK9BTSBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5m
cj4gd3JvdGU6Cj4gPiA+IEkgdGhpbmsgdGhlIHF1ZXN0aW9uIGJ5IFRob21hcyB3YXMgd2hldGhl
ciwgZ2l2ZW4gYW4gaW5wdXQgc3BhcnNlIGZpbGUsCj4gPiA+IGdlbmltYWdlIHdpbGwga2VlcCB0
aGUgZ2VuZXJhdGVkIGltYWdlIHNwYXJzZSBpbiB0aGUgc2FtZSBwbGFjZXMgdGhlCj4gPiA+IGlu
cHV0IGZpbGUgd2FzIChvbmx5IHNoaWZ0ZWQgYnkgdGhlIG9mZnNldCB0aGF0IGlucHV0IGZpbGUg
d2FzIGNvcGllZAo+ID4gPiBhdCBpbiB0aGUgaW1hZ2UpLgo+IFstLVNOSVAtLV0KPiA+IFNlZW1z
IEkgZGlkIG5vdCB1bmRlcnN0YW5kIHRoZSBxdWVzdGlvbi4gTXkgaWRlYSBvbiB0aGUgdG9waWMg
aXMgaG93Cj4gPiB3ZSBjYW4gZ2VuZXJhdGUKPiA+IGltYWdlcyB0aGF0IHdlIGNhbiBlYXNpbHkg
Zmxhc2guIE5vdyBJIHVuZGVyc3RhbmQgdGhlIHF1ZXN0aW9uIG9mCj4gPiBUaG9tYXMgYW5kIHRo
YW5rIHlvdS4KPiA+IAo+ID4gWWFubiBjYW4gSSBhc2sgaG93IHdlIGNhbiB1c2UgYW4gaW1hZ2Ug
Z2VuZXJhdGVkIGFzIHlvdSBkZXNjcmliZSBiZWZvcmU/Cj4gCj4gICAgICQgbWFrZSBwY194ODZf
NjRfZWZpX2RlZmNvbmZpZwo+ICAgICAkIG1ha2UKPiAgICAgJCBscyAtc2wgb3V0cHV0L2ltYWdl
cy97cm9vdGZzLmV4dDIsZGlzay5pbWd9Cj4gCj4gSSB0cmllZCBhIGJpdCBlYXJsaWVyLCBhbmQg
dGhlIGdlbmltYWdlIGZpbGUgaXMgaW5kZWVkIHNwYXJzZSwgYnV0IEkKPiBjb3VsZCBub3QgZmlu
ZCBhIHRvb2wgdGhhdCB3b3VsZCByZXBvcnQgdGhlIGxpc3Qgb2YgaG9sZXMvbm9uLWhvbGVzIGlu
IGEKPiBmaWxlLCBhbmQgdGhlaXIgb2Zmc2V0LCBlLmcuIHNvbWV0aGluZyBsaWtlOgo+IAo+ICAg
ICAgICAgICAgICAgICBzaXplICAgIG9mZnNldAo+ICAgICBub24taG9sZSAgICAyTWlCICAgIEAw
Cj4gICAgIGhvbGUgICAgICAgIDFNaUIgICAgQDJNaUIKPiAgICAgbm9uLWhvbGUgICAgMTZNaUIg
ICBAM01pQgo+ICBhbmQgc28gb24uLi4KPiAKPiBTbyBJIGNvdWxkIG5vdCB2YWxpZGF0ZSB3aGV0
aGVyIHRoZSBob2xlL25vbi1ob2xlIHN0cnVjdHVyZSBpcyB0aGUgc2FtZQo+IGluIHRoZSBnZW5l
cmF0ZWQgZGlzay5pbWcgYW5kIHRoZSByb290ZnMuZXh0Mi4gSWYgeW91IGhhdmUgYW55IGlkZWEg
aG93Cj4gdG8gZG8gdGhhdCwgSSdtIGFsbCBleWVzLgoKSGkgWWFubiwKCmlpdWMsIHRoZSBibWFw
dG9vbCBtYWlubHkgdXNlcyB0aGUgRklFTUFQIGlvY3RsLiBJIGZvdW5kIHRoaXMgdG9vbCBbMV0s
IAp3aGljaCBwcmludHMgdGhlIEZJRU1BUCB2YWx1ZXMuCgpIZXJlJ3MgYSBxdWljayB0ZXN0IEkg
ZGlkOgoKJCB0cnVuY2F0ZSAtcyAxRyAvdG1wL2ltYWdlLnJhdwokIC4vZmllbWFwIC90bXAvaW1h
Z2UucmF3CkZpbGUgL3RtcC9pbWFnZS5yYXcgaGFzIDAgZXh0ZW50czoKIyAgICAgICBMb2dpY2Fs
ICAgICAgICAgIFBoeXNpY2FsICAgICAgICAgTGVuZ3RoICAgICAgICAgICBGbGFncwoKJCBzdGF0
IC90bXAvaW1hZ2UucmF3IAogIEZpbGU6IC90bXAvaW1hZ2UucmF3CiAgU2l6ZTogMTA3Mzc0MTgy
NCAgICAgIEJsb2NrczogMCAgICAgICAgICBJTyBCbG9jazogNDA5NiAgIHJlZ3VsYXIgZmlsZQpE
ZXZpY2U6IDEwMzA1aC82NjMwOWQgICBJbm9kZTogMjU2OTIxMDggICAgTGlua3M6IDEKQWNjZXNz
OiAoMDY2NC8tcnctcnctci0tKSAgVWlkOiAoIDEwMDAvZ3NjaHdhZXIpICAgR2lkOiAoIDEwMDAv
Z3NjaHdhZXIpCkFjY2VzczogMjAyNC0wNS0yMiAxNzowOTo0MS40NjM0NDE5NDYgKzAyMDAKTW9k
aWZ5OiAyMDI0LTA1LTIyIDE3OjA5OjQxLjQ2MzQ0MTk0NiArMDIwMApDaGFuZ2U6IDIwMjQtMDUt
MjIgMTc6MDk6NDEuNDYzNDQxOTQ2ICswMjAwCiBCaXJ0aDogLQokIGVjaG8gdGVzdCA+PiAvdG1w
L2ltYWdlLnJhdyAKJCAuL2ZpZW1hcCAvdG1wL2ltYWdlLnJhdwpGaWxlIC90bXAvaW1hZ2UucmF3
IGhhcyAxIGV4dGVudHM6CiMgICAgICAgTG9naWNhbCAgICAgICAgICBQaHlzaWNhbCAgICAgICAg
IExlbmd0aCAgICAgICAgICAgRmxhZ3MKMDogICAgICAwMDAwMDAwMDQwMDAwMDAwIDAwMDAwMDYy
MDgyMjQwMDAgMDAwMDAwMDAwMDAwMTAwMCAwMDAxCiQgc3RhdCAvdG1wL2ltYWdlLnJhdyAKICBG
aWxlOiAvdG1wL2ltYWdlLnJhdwogIFNpemU6IDEwNzM3NDE4MjkgICAgICBCbG9ja3M6IDggICAg
ICAgICAgSU8gQmxvY2s6IDQwOTYgICByZWd1bGFyIGZpbGUKRGV2aWNlOiAxMDMwNWgvNjYzMDlk
ICAgSW5vZGU6IDI1NjkyMTE0ICAgIExpbmtzOiAxCkFjY2VzczogKDA2NjQvLXJ3LXJ3LXItLSkg
IFVpZDogKCAxMDAwL2dzY2h3YWVyKSAgIEdpZDogKCAxMDAwL2dzY2h3YWVyKQpBY2Nlc3M6IDIw
MjQtMDUtMjIgMTY6NTQ6NDguNzI5NTc2NjA0ICswMjAwCk1vZGlmeTogMjAyNC0wNS0yMiAxNjo1
OToyNC45MDU2Mzg3MDggKzAyMDAKQ2hhbmdlOiAyMDI0LTA1LTIyIDE2OjU5OjI0LjkwNTYzODcw
OCArMDIwMAogQmlydGg6IC0KCllvdSBjYW4gc2VlIHRoZSBhbGxvY2F0ZWQgc2VjdGlvbiBzdGFy
dGluZyBhdCBsb2dpY2FsIDB4NDAwMDAwMDAgKDFHKS4KV2l0aG91dCB0aGUgYGVjaG9gIGxpbmUs
IHRoZSBleHRlbnRzIGxpc3QgaXMgZW1wdHksIHN1Z2dlc3RpbmcgdGhlIGZpbGUKaGFzIHplcm8g
YWxsb2NhdGVkIGJsb2Nrcy4gYHN0YXRgIGFsc28gaGludHMgdGhhdCB0aGUgZmlsZSBpcyBzcGFy
c2UsCmJ5IHRoZSBzbWFsbCBudW1iZXIgb2YgYmxvY2tzICh3aHkgOD8gaWRrKS4gSSB0aGluayB0
aGlzIGNhbiBiZSB1c2VkIHRvCnZlcmlmeSB0aGUgYmVoYXZpb3Igb2YgZ2VuaW1hZ2UuCgpbMV0g
aHR0cHM6Ly9naXRodWIuY29tL0NvbGluSWFuS2luZy9maWVtYXAKCkJlc3QsCkdlcm8KCj4gCj4g
UmVnYXJkcywKPiBZYW5uIEUuIE1PUklOLgo+IAo+IC0tIAo+IC4tLS0tLS0tLS0tLS0tLS0tLS4t
LS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0t
LS0uCj4gfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkg
UklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKPiB8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3
YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAo+
IHwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAg
ICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8Cj4gfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcv
IHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKPiAnLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0t
LS0tLS0tLS0tLS0tLS0tLS0tJwo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290CgotLSAKCgoK4oCT4oCT4oCTCgoKZ3JhbmRjZW50cml4IEdtYkggfCBBIFZvZGFmb25l
IENvbXBhbnnCoMK3wqBIb2x6bWFya3QgMcKgwrfCoDUwNjc2IAoqQ29sb2duZSrCoHzCoFBob2Vu
aXhzZWVzdHJhc3NlIDE4wqDCt8KgNDQyNjMgKkRvcnRtdW5kKsKgwrfCoEdlcm1hbnkKfMKgaW4g
CjxodHRwczovL3d3dy5saW5rZWRpbi5jb20vY29tcGFueS9ncmFuZGNlbnRyaXg+IHwgcGhvbmU6
ICs0OS0yMjEtNjc3LTg2MC0wIAp8wqBlbWFpbDogaGVsbG9AZ3JhbmRjZW50cml4Lm5ldCA8bWFp
bHRvOmhlbGxvQGdyYW5kY2VudHJpeC5uZXQ+CgoKZ3JhbmRjZW50cml4IGNhcmVzIGFib3V0wqBw
cml2YWN5IAo8aHR0cHM6Ly9ncmFuZGNlbnRyaXgubmV0L2RlL3BhZ2VzL3ByaXZhY3ltYWlsLz4K
CkFtdHNnZXJpY2h0IEvDtmxuIHwgSFJCIMKgCjcwMTE5IHwgR2VzY2jDpGZ0c2bDvGhyZXI6IE0u
IEtyw7ZtZXIswqAgUi4gSMOkbmVsIHwgVVN0Li1JZE5yLjogREUyNjYzMzM5NjkKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
