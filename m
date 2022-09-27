Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B66D9C6FA82
	for <buildroot@archiver.kernel.org>; Tue, 27 Sep 2022 18:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0DE081096;
	Tue, 27 Sep 2022 18:33:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0DE081096
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iip_UCYKSpYj; Tue, 27 Sep 2022 18:33:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A43F80D8A;
	Tue, 27 Sep 2022 18:33:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A43F80D8A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 695181BF2BE
 for <buildroot@lists.busybox.net>; Tue, 27 Sep 2022 18:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 523DE60A47
 for <buildroot@lists.busybox.net>; Tue, 27 Sep 2022 18:33:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 523DE60A47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id siPQ_V3KJYvF for <buildroot@lists.busybox.net>;
 Tue, 27 Sep 2022 18:33:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0162D607F6
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0162D607F6
 for <buildroot@buildroot.org>; Tue, 27 Sep 2022 18:33:44 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id i26so16965331lfp.11
 for <buildroot@buildroot.org>; Tue, 27 Sep 2022 11:33:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=uaO2e/nIWsufGpFvcBCX9aFZ/HL4k4wU7TOTymu6z/0=;
 b=Rf9jzuroDXZv1nMY7HLO+fDoUhEeakkjyrlW1MRbsqVbbRxczSEyf44N4wyDcjxvyn
 UxtTZMaI9O8kovUfJqvhxc27TFOoWkaA5QOmVig46JsvyQU5kM13nV8bkAuRiC6vCqdt
 o+JDcaQ+tmdw8rIZcu3TlhzzDuEvSbbqNuhCHx0d/B1HSf/XKC0+t8bAMmgE+o/62zdY
 +Ikkb2+2zlw3NxBJf39WYweMMSaTs+MlcNgFzOtFgQIdLoPhocGEAxAkLCP60wdA4Pq3
 72ic882oBjf6uN276j/OXLQWOQ0imvmKXOAVTtHk+sFxrkWl4Pf4KnFqwfQVDRjeH4Sh
 0zOQ==
X-Gm-Message-State: ACrzQf0+JaATWchSDCi8Leth/jJFTxnNK7QGVvReld/++NNtjm/vN2Id
 Rp3Z2R5TctdqGzMNztUdyf1QbdKe+xGMwQQW3MA=
X-Google-Smtp-Source: AMsMyM7Kz2MowN1Dlk+XDFhkbV+zzm4fuCnRk1M8SUEkxnqCkhjFfRuw5Q0uFdayBX73zH+TimSud0Nnhr75vRS9pU4=
X-Received: by 2002:a05:6512:3b91:b0:49f:d530:97 with SMTP id
 g17-20020a0565123b9100b0049fd5300097mr11257305lfv.172.1664303622736; Tue, 27
 Sep 2022 11:33:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220812101718.47491-1-fontaine.fabrice@gmail.com>
 <20220814123748.167ebb02@windsurf> <20220820112842.7bcd12f2@windsurf>
 <CAFSsvmq9vNbvrORfhtv8HvCtq20xrtZg9a4Autt2XDNGamUKkA@mail.gmail.com>
 <CAPi7W81=6Qsv9rSxhMNNEfACR_kP0wAjvhoqxMtnnYoxAkbR5Q@mail.gmail.com>
In-Reply-To: <CAPi7W81=6Qsv9rSxhMNNEfACR_kP0wAjvhoqxMtnnYoxAkbR5Q@mail.gmail.com>
From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 27 Sep 2022 11:33:31 -0700
Message-ID: <CAFSsvmp3TVtjZkBm0tXQk2TEpBKR==NG3ZwWjoZ650WxzRmRMA@mail.gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=uaO2e/nIWsufGpFvcBCX9aFZ/HL4k4wU7TOTymu6z/0=;
 b=mjcy7noWUbT404vTkiDqO080sMOcfVbYTF9v2zvWdlcI/e4vLdgkXjZ5MRFqzC+8ab
 E3Uq2u6ogRYl4gaBQVvc7WXxy7x37zRHcC64deq3yphAOA3l2k+j/hypWfhOujFSuOgy
 5yjtZD/sntlSx3ZpTQdvuBM3hNZcxCDRSYKOocnQ/wzIXdFYxK74Y0eJWGjMFEF3d1iq
 q2jU5uZ/sPidvUnFuEsalgHH+9PKLwqfGOnsJ8WElBDBhd2aCZV+OlFZh6RNqPof24cj
 4McCFuxM5aDLp9YYuHz+V6nXnL41shRN0SE2sfpuif0RL7jeL9U6x+6NwLw8H5kFyNrP
 ZP7w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mjcy7noW
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/poppler: fix introspection build
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRmFicmljZTsKClNvcnJ5IGZvciB0aGUgbGF0ZSByZXBseSwgSSBoYWQgYSBjb2xkIHdo
aWNoIEkgZGlkbid0IGV4cGVjdCB0byBtYWtlCm1lIGZlZWwgc28gdGVycmlibGUhCkkgc2hvdWxk
IGhhdmUgYmVlbiBtb3JlIGNsZWFyIGluIG15IGVhcmxpZXIgcmVzcG9uc2UuIE15IHN1Z2dlc3Rp
b24gaXM6CgotIEJ1bXAgcG9wcGxlcgotIEFkZCAtRElOVFJPU1BFQ1RJT05fQ09NUElMRVJfQVJH
Uz0tLWluY2x1ZGVkaXI9JChTVEFHSU5HX0RJUikvdXNyL3NoYXJlL2dpci0xLjAKCkl0J3MgdGhl
IHNpbXBsZXN0IHNvbHV0aW9uIHRvIHRoZSBwcm9ibGVtIGFuZCBhdm9pZHMgYWRkaW5nIGEgbmV3
CnBhdGNoIHdoaWxlIHJlbW92aW5nIGFuIG9sZCBwYXRjaC4KClRoYW5rcyEKCkFkYW0KCk9uIFdl
ZCwgU2VwIDIxLCAyMDIyIGF0IDE6NDEgUE0gRmFicmljZSBGb250YWluZQo8Zm9udGFpbmUuZmFi
cmljZUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGkgQWRhbSwKPgo+IEJ1bXBpbmcgcG9wcGxlciB3
aWxsIG5vdCBiZWVuIGVub3VnaCB0byBmaXggdGhlIGJ1aWxkIGZhaWx1cmUuCj4gLS1pbmNsdWRl
ZGlyPSQoU1RBR0lOR19ESVIpL3Vzci9zaGFyZS9naXItMS4wIHdpbGwgYWxzbyBoYXZlIHRvIGJl
IHBhc3NlZCBpbiAtRElOVFJPU1BFQ1RJT05fQ09NUElMRVJfQVJHUyBvciBkbyB5b3UgdGhpbmsg
dGhhdCBnLWlyLXNjYW5uZXIgd3JhcHBlciBtdXN0IGhhbmRsZSB0aGlzIGFzIHN1Z2dlc3RlZCBi
eSBUaG9tYXMgYWJvdmU/Cj4KPiBCZXN0IFJlZ2FyZHMsCj4KPiBGYWJyaWNlCj4KPiBMZSBtZXIu
IDIxIHNlcHQuIDIwMjIgw6AgMTk6MzgsIEFkYW0gRHVza2V0dCA8YWR1c2tldHRAZ21haWwuY29t
PiBhIMOpY3JpdCA6Cj4+Cj4+IEhlbGxvOwo+Pgo+PiBUaGUgYWJvdmUgcGF0Y2ggKGFuZCB0aGUg
ZXhpc3RpbmcgcGF0Y2ggY3VycmVudGx5IGluIHBhY2thZ2UvcG9wcGxlcikKPj4gYXJlIGJvdGgg
aW4gdGhlIGxhdGVzdCB2ZXJzaW9uIG9mIHBvcHBsZXIsIHNvIHRoaXMgaXMgcHJvYmFibHkgc2Fm
ZSB0bwo+PiBhcHBseS4KPj4gSG93ZXZlcjsgaXQgbWF5IGJlIG1vcmUgYWR2YW50YWdlb3VzIHRv
IGluc3RlYWQgc2ltcGx5IGJ1bXAgdGhlCj4+IHBvcHBsZXIgcGFja2FnZSBpbnN0ZWFkIG9mIGFw
cGx5aW5nIG1vcmUgcGF0Y2hlcy4KPj4KPj4gVGhvdWdodHM/Cj4+Cj4+IEFkYW0KPj4KPj4gT24g
U2F0LCBBdWcgMjAsIDIwMjIgYXQgMjoyOCBBTSBUaG9tYXMgUGV0YXp6b25pCj4+IDx0aG9tYXMu
cGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPj4gPgo+PiA+IEhlbGxvIEZhYnJpY2UsCj4+
ID4KPj4gPiBEbyB5b3UgaGF2ZSBzb21lIGZlZWRiYWNrPyBPciBwZXJoYXBzIEFkYW0/Cj4+ID4K
Pj4gPiBUaGFua3MhCj4+ID4KPj4gPiBUaG9tYXMKPj4gPgo+PiA+IE9uIFN1biwgMTQgQXVnIDIw
MjIgMTI6Mzc6NDggKzAyMDAKPj4gPiBUaG9tYXMgUGV0YXp6b25pIHZpYSBidWlsZHJvb3QgPGJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToKPj4gPgo+PiA+ID4gSGVsbG8gRmFicmljZSwK
Pj4gPiA+Cj4+ID4gPiArQWRhbSBEdXNrZXR0IGZvciBHT0kgZXhwZXJ0aXNlLgo+PiA+ID4KPj4g
PiA+IE9uIEZyaSwgMTIgQXVnIDIwMjIgMTI6MTc6MTggKzAyMDAKPj4gPiA+IEZhYnJpY2UgRm9u
dGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPiB3cm90ZToKPj4gPiA+Cj4+ID4gPiA+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL3BvcHBsZXIvcG9wcGxlci5tayBiL3BhY2thZ2UvcG9wcGxl
ci9wb3BwbGVyLm1rCj4+ID4gPiA+IGluZGV4IGI1NDI2MmU3YzQuLmRiNmRhMjVkMzkgMTAwNjQ0
Cj4+ID4gPiA+IC0tLSBhL3BhY2thZ2UvcG9wcGxlci9wb3BwbGVyLm1rCj4+ID4gPiA+ICsrKyBi
L3BhY2thZ2UvcG9wcGxlci9wb3BwbGVyLm1rCj4+ID4gPiA+IEBAIC00Nyw3ICs0Nyw4IEBAIFBP
UFBMRVJfREVQRU5ERU5DSUVTICs9IGdvYmplY3QtaW50cm9zcGVjdGlvbgo+PiA+ID4gPiAgUE9Q
UExFUl9DT05GX09QVFMgKz0gXAo+PiA+ID4gPiAgICAgLURFTkFCTEVfR09CSkVDVF9JTlRST1NQ
RUNUSU9OPU9OIFwKPj4gPiA+ID4gICAgIC1ESU5UUk9TUEVDVElPTl9TQ0FOTkVSPSQoU1RBR0lO
R19ESVIpL3Vzci9iaW4vZy1pci1zY2FubmVyIFwKPj4gPiA+ID4gLSAgIC1ESU5UUk9TUEVDVElP
Tl9DT01QSUxFUj0kKFNUQUdJTkdfRElSKS91c3IvYmluL2ctaXItY29tcGlsZXIKPj4gPiA+ID4g
KyAgIC1ESU5UUk9TUEVDVElPTl9DT01QSUxFUj0kKFNUQUdJTkdfRElSKS91c3IvYmluL2ctaXIt
Y29tcGlsZXIgXAo+PiA+ID4gPiArICAgLURJTlRST1NQRUNUSU9OX0NPTVBJTEVSX0FSR1M9Ii0t
aW5jbHVkZWRpcj0kKFNUQUdJTkdfRElSKS91c3Ivc2hhcmUvZ2lyLTEuMCIKPj4gPiA+ID4gIGVs
c2UKPj4gPiA+ID4gIFBPUFBMRVJfQ09ORl9PUFRTICs9IC1ERU5BQkxFX0dPQkpFQ1RfSU5UUk9T
UEVDVElPTj1PRkYKPj4gPiA+ID4gIGVuZGlmCj4+ID4gPgo+PiA+ID4gSSBhbSByZWFsbHkgbm90
IGZhbWlsaWFyIHdpdGggYWxsIHRoZSBnb2JqZWN0LWludHJvc3BlY3Rpb24gc3R1ZmYsIGJ1dAo+
PiA+ID4gSSdtIHdvbmRlcmluZyBpZiB0aGlzIGlzIHRoZSByaWdodCBzb2x1dGlvbiBmb3IgdGhp
cyBwcm9ibGVtLgo+PiA+ID4KPj4gPiA+IEluIHBhY2thZ2UvZ29iamVjdC1pbnRyb3NwZWN0aW9u
LywgSSBjYW4gc2VlIHRoYXQgd2UgY3JlYXRlIGFuZCBpbnN0YWxsCj4+ID4gPiBhIGctaXItc2Nh
bm5lciB3cmFwcGVyIHRoYXQgcGFzc2VzIC0tYWRkLWluY2x1ZGUtcGF0aD0iJChkaXJuYW1lCj4+
ID4gPiAiJDAiKSIvLi4vc2hhcmUvZ2lyLTEuMC4KPj4gPiA+Cj4+ID4gPiBJbiB0aGlzIHNhbWUg
ZGlyZWN0b3J5LCB3ZSBhbHNvIGhhdmUgYSBnLWlyLWNvbXBpbGVyIHdyYXBwZXIsIHdoaWNoIGlz
Cj4+ID4gPiB1c2VkIHRvIGV4ZWN1dGUgdGhpbmdzIGluIFFlbXUuIElmIGEgc3BlY2lhbCBwYXRo
IGlzIG5lZWRlZCwgd2h5IGRvbid0Cj4+ID4gPiB3ZSBwYXNzIGl0IHdpdGhpbiB0aGlzIHdyYXBw
ZXIsIHNvIHRoYXQgdGhlIHNvbHV0aW9uIHdvcmtzIGZvciBhbGwKPj4gPiA+IHBhY2thZ2VzPwo+
PiA+ID4KPj4gPiA+IEFwcGFyZW50bHksIGFjY29yZGluZyB0bwo+PiA+ID4gcGFja2FnZS9saWJn
bGliMi8wMDA0LW1lc29uLmJ1aWxkLWFkZC1naXJkaXItdG8tZ2lvLTIuMC5wYy1hbmQtZ2xpYi0y
LjAucGMucGF0Y2gKPj4gPiA+IHRoZXJlIGFyZSBzb21lIHBhY2thZ2VzIHRoYXQgc2V0IGdpcmRp
ciBpbiB0aGVpciAucGMgZmlsZSBzbyB0aGF0IG90aGVyCj4+ID4gPiBwYWNrYWdlcyBub3cgd2hl
cmUgdG8gZmluZCB0aGUgR0lSIGZpbGVzLgo+PiA+ID4KPj4gPiA+IFJlYWxseSBub3QgY2xlYXIg
aW4gbXkgbWluZCBob3cgYWxsIG9mIHRoaXMgc2hvdWxkIHdvcmsuIE15IG9ubHkKPj4gPiA+IGNv
bmNlcm4gaXMgdGhhdCBJIHdvdWxkIGxpa2UgdXMgdG8gZmluZCBhbmQgdXNlIHRoZSBzYW1lIHNv
bHV0aW9uCj4+ID4gPiBldmVyeXdoZXJlIHRvIHNvbHZlIHRoZSBzYW1lIHByb2JsZW0sIHJhdGhl
ciB0aGFuIGhhdmluZyAxMCBkaWZmZXJlbnQKPj4gPiA+IHNvbHV0aW9ucyBmb3IgZWFjaCBwYWNr
YWdlIGVuY291bnRlcmluZyB0aGUgc2FtZSBpc3N1ZS4KPj4gPiA+Cj4+ID4gPiBUaG9tYXMKPj4g
Pgo+PiA+Cj4+ID4KPj4gPiAtLQo+PiA+IFRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBD
RU8sIEJvb3RsaW4KPj4gPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFu
ZCB0cmFpbmluZwo+PiA+IGh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
