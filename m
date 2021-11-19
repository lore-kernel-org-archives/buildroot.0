Return-Path: <SRS0=y7vk=QG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10D07C433EF
	for <buildroot@archiver.kernel.org>; Fri, 19 Nov 2021 17:45:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D32F6120F
	for <buildroot@archiver.kernel.org>; Fri, 19 Nov 2021 17:45:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7D32F6120F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A86482969;
	Fri, 19 Nov 2021 17:45:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GlwtswyHS5qo; Fri, 19 Nov 2021 17:45:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BE668294A;
	Fri, 19 Nov 2021 17:45:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 663781BF37C
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 17:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6275B8294A
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 17:45:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FAYJB93JPdwA for <buildroot@lists.busybox.net>;
 Fri, 19 Nov 2021 17:45:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D2EE682925
 for <buildroot@buildroot.org>; Fri, 19 Nov 2021 17:45:50 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id y26so46629922lfa.11
 for <buildroot@buildroot.org>; Fri, 19 Nov 2021 09:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=46gQ/ihxjy8JtDgrJidvEs2f7KaDmP3vdl5wM1/7dic=;
 b=mgXY/e7uC5Ot2X/B/6ZFFtOEdW1L1mzFVcFSbIwf4w+yxXC1Exa3MASkNFWusCZ2np
 3vTcaDSqTwja7FCWoRP7moeKVuslkw1bt5SKIWjmi8CDLLuwqTmeaFdJq5k8tNlF7bt/
 TW+ZqfLPnWZqgDZ0mPHw21f2pD3oAameRTmBs6gvbn73qeTNZlw160TZGcFJlAbHyyyl
 lbItiWqDqvIRWAIltFVFEmxOsw2H2uyaGHb8tPoAVtemNi+WEz6hmjAldcjYLh0USr8k
 YNo9tQNiwCAWIwbIhDdbdDz5UE3ha80SpITKQn80tWVe6mXU+CWUiNn0ge8lSfT9e8hy
 hN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=46gQ/ihxjy8JtDgrJidvEs2f7KaDmP3vdl5wM1/7dic=;
 b=kUBtyg4xobu0NfTfp0gJUTtS7W9Lk1TmX62JAlTHHxMVXSoht3sUjkvXzQM841B5eO
 cmhv/A/wDl/TuCAsLnOJkTWZ5Bz0fqozkNosFkEgIs/iHcodcdD6/JlrwO2dSTgrSnP0
 /iJt6cXxOULiAY5469ITeSuW9UTtV3slCayjZ22ZsMugUZX7kg2xF9YXFzqmdelVxGWD
 q5VscVcKvO3n+PZNpJ1xwocgBzEd7t6uxlYnUCH6N0gSjLvafWgrVbLqLQUa02fmQXqv
 VM1Z1byypgCPFulxb4mlYIFSQKf5SLKo/FhiGZa+6XFvjhrdq1QoeM5PTtc1dii31NEU
 o9Bw==
X-Gm-Message-State: AOAM532waJrmNpHiwxaDHawHwyYCZhu6rCPtYILFEtO2E2rQJkjnSoYt
 UedR9IwpO+JHVElfAgTHNHVtFuChyPe75ccMop0=
X-Google-Smtp-Source: ABdhPJzuOW3c5MbZlDHdmI1uHoh4XQGFeWbp9CfpuFLgxsdfY/k8mPKfoz2BvdD5aoRtqqOtQZmamdTE66m5VFh3PKQ=
X-Received: by 2002:a05:6512:30d:: with SMTP id
 t13mr33624600lfp.322.1637343948729; 
 Fri, 19 Nov 2021 09:45:48 -0800 (PST)
MIME-Version: 1.0
References: <20211119165458.2410686-1-fontaine.fabrice@gmail.com>
 <20211119171046.GQ247986@scaer>
 <CAPi7W81VusJ3puVf8epMCvuHC+sWg-2YbCHcjrpLMoKY9oxkQw@mail.gmail.com>
In-Reply-To: <CAPi7W81VusJ3puVf8epMCvuHC+sWg-2YbCHcjrpLMoKY9oxkQw@mail.gmail.com>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 19 Nov 2021 18:43:26 +0100
Message-ID: <CAPi7W81Q5geT6Qd_mKdu4UPOF3qzmUJd1=4L7tBLagJ0dhJ6jQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 1/2] Revert "package/log4cxx: select boost
 chrono and date-time with gcc < 7"
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgdmVuLiAxOSBub3YuIDIwMjEgw6AgMTg6MzEsIEZhYnJpY2UgRm9udGFpbmUKPGZvbnRhaW5l
LmZhYnJpY2VAZ21haWwuY29tPiBhIMOpY3JpdCA6Cj4KPiBIaSBZYW5uLAo+Cj4gTGUgdmVuLiAx
OSBub3YuIDIwMjEgw6AgMTg6MTAsIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVl
LmZyPiBhIMOpY3JpdCA6Cj4gPgo+ID4gRmFicmljZSwgQWxsLAo+ID4KPiA+IE9uIDIwMjEtMTEt
MTkgMTc6NTQgKzAxMDAsIEZhYnJpY2UgRm9udGFpbmUgc3Bha2UgdGh1c2x5Ogo+ID4gPiBUaGlz
IHJldmVydHMgY29tbWl0IDNjMjI0NWNiNjU3NDFjOTY1ZjRiYjg3ZDM1YWMzYzY0ZjI1MGExYWUg
dG8gbW92ZQo+ID4gPiB0aGVzZSBzZWxlY3RzIG9uIGJvb3N0IHNpZGUgYXMgdGhlIGJ1aWxkIGZh
aWx1cmUgd2FzIHJhaXNlZCB3aXRoIGdjYyA+PQo+ID4gPiA3Lgo+ID4KPiA+IFNvLCBpZiBJIHVu
ZGVyc3RhbmQgY29ycmVjdGx5LCBpZiB3ZSBqdXN0IGFwcGx5IHRoaXMgcmV2ZXJ0LCBidXQgbm90
IHRoZQo+ID4gZm9sbG93aW5nIHBhdGNoLCB3ZSBicmVhayB0aGUgYnVpbGQgYWdhaW4sIHJpZ2h0
PyBJZiBzbywgdGhlbiBpdCBtYWtlcwo+ID4gdGhlIGhpc3Rvcnkgbm90IGJpLXNlY3RhYmxlLgo+
IE5vLCBiYXNpY2FsbHkgdGhlIHBhdGNoIHRoYXQgSSdtIHJldmVydGluZyBpcyBhICJuby1vcCIu
Cj4gSXQgZG9lcyBub3QgZml4IGFueXRoaW5nIGFzIHRoZSBidWlsZCBmYWlsdXJlIGlzIHJhaXNl
ZCB3aXRoIGdjYyA+PTcsCj4gbm90IGdjYyA8IDcuCj4gSSBtYWRlIHRoaXMgbWlzdGFrZSwgYmVj
YXVzZSB0aGUgYnVpbGQgZmFpbHVyZSBpcyBvbmx5IHJhaXNlZCBzaW5jZQo+IGNtYWtlID49IDMu
MjEuMyBhbmQKSW4gZmFjdCwgSSBtYWRlIGFub3RoZXIgbWlzdGFrZSwgdGhlIGJ1aWxkIGZhaWx1
cmUgaXMgcmFpc2VkIHdpdGgKY21ha2UgPCAzLjIxLjMuCkkgcmVhbGx5IGhhdGUgY21ha2UgOy0p
LiBJJ2xsIHNlbmQgYSB2MiB3aXRoIGFuIHVwZGF0ZWQgY29tbWl0IGxvZy4KPiBodHRwczovL2dp
dGh1Yi5jb20vS2l0d2FyZS9DTWFrZS9jb21taXQvMWFkMGM1YWU1M2ZjMGM0Zjc3NDE2NjMzN2Yw
ZTljOTNjNTc4Y2Y5Yi4KPgo+IGNtYWtlIGhhcyB0aGUgZm9sbG93aW5nIGJlaGF2aW9yOgo+ICAt
IGlmIGl0ICJyZWNvZ25pemVzIiB0aGUgYm9vc3QgdmVyc2lvbiwgaXQgd2lsbCBzZXQgdGhlIGJv
b3N0IHRocmVhZAo+IGRlcGVuZGVuY2llcyB0byBjaHJvbm8gZGF0ZV90aW1lIGF0b21pYy4KPiAg
LSBIb3dldmVyLCBpZiBpdCBkb2VzIG5vdCByZWNvZ25pemUgaXQgKGkuZS4gd2l0aCBjbWFrZSA8
IDMuMjEuMyBhbmQKPiBib29zdCAxLjc3LjApLCBpdCB3aWxsIHNldCB0aGUgYm9vc3QgdGhyZWFk
IGRlcGVuZGVuY2llcyB0byBjaHJvbm8KPiBhdG9taWMuCj4gPgo+ID4gSW5zdGVhZCwgdGhlIGJv
b3N0IHBhdGNoIG11c3QgYmUgYXBwbGllZCBmaXJzdCwgYW5kIG9uY2UgdGhhdCBpcyBkb25lLAo+
ID4gdGhlbiB3ZSBjYW4gYXBwbHkgdGhpcyByZXZlcnQuCj4gPgo+ID4gSWYgdGhlIGFib3ZlIGlz
IGNvcnJlY3QsIGp1c3Qgc2F5IHNvLCB3ZSBjYW4gcmUtb3JkZXIgdGhlIHBhdGNoZXMgd2hlbgo+
ID4gYXBwbHlpbmcuLi4KPiA+Cj4gPiBSZWdhcmRzLAo+ID4gWWFubiBFLiBNT1JJTi4KPiA+Cj4g
PiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21h
aWwuY29tPgo+ID4gPiAtLS0KPiA+ID4gIHBhY2thZ2UvbG9nNGN4eC9Db25maWcuaW4gfCAyIC0t
Cj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKPiA+ID4KPiA+ID4gZGlmZiAt
LWdpdCBhL3BhY2thZ2UvbG9nNGN4eC9Db25maWcuaW4gYi9wYWNrYWdlL2xvZzRjeHgvQ29uZmln
LmluCj4gPiA+IGluZGV4IDI3YTVmMDY5ODguLjZmMTk1NmY4MjkgMTAwNjQ0Cj4gPiA+IC0tLSBh
L3BhY2thZ2UvbG9nNGN4eC9Db25maWcuaW4KPiA+ID4gKysrIGIvcGFja2FnZS9sb2c0Y3h4L0Nv
bmZpZy5pbgo+ID4gPiBAQCAtMTIsOCArMTIsNiBAQCBjb25maWcgQlIyX1BBQ0tBR0VfTE9HNENY
WAo+ID4gPiAgICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfQVBSX1VUSUwKPiA+ID4gICAgICAgc2Vs
ZWN0IEJSMl9QQUNLQUdFX0JPT1NUIGlmICFCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF83Cj4g
PiA+ICAgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9CT09TVF9BVE9NSUMgaWYgIUJSMl9UT09MQ0hB
SU5fR0NDX0FUX0xFQVNUXzcKPiA+ID4gLSAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX0JPT1NUX0NI
Uk9OTyBpZiAhQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfNwo+ID4gPiAtICAgICBzZWxlY3Qg
QlIyX1BBQ0tBR0VfQk9PU1RfREFURV9USU1FIGlmICFCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFT
VF83Cj4gPiA+ICAgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9CT09TVF9USFJFQUQgaWYgIUJSMl9U
T09MQ0hBSU5fR0NDX0FUX0xFQVNUXzcKPiA+ID4gICAgICAgaGVscAo+ID4gPiAgICAgICAgIEFw
YWNoZSBsb2c0Y3h4IGlzIGEgbG9nZ2luZyBmcmFtZXdvcmsgZm9yIEMrKyBwYXR0ZXJuZWQKPiA+
ID4gLS0KPiA+ID4gMi4zMy4wCj4gPiA+Cj4gPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gPiA+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiA+ID4g
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiA+ID4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gPgo+ID4gLS0KPiA+IC4tLS0tLS0tLS0tLS0t
LS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0t
LS0tLS0tLS0uCj4gPiB8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8i
XCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAo+ID4gfCArMzMgNjYyIDM3NiAw
NTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAg
ICAgICAgIHwKPiA+IHwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFgg
IEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8Cj4gPiB8IGh0dHA6Ly95bW9yaW4u
aXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGly
YWN5LiAgfAo+ID4gJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0t
LS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKPiBCZXN0IFJlZ2FyZHMsCj4KPiBG
YWJyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
