Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84196C433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:43:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47E5B60EE5
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:43:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 47E5B60EE5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AD7D6071B;
	Sun, 26 Sep 2021 21:43:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PcqqzFqCVItG; Sun, 26 Sep 2021 21:43:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 241C36071C;
	Sun, 26 Sep 2021 21:43:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 277361BF370
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 171E9402DC
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:43:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lxbt4a1aQXC0 for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 21:43:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EDF38402D3
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 21:43:22 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id x7so46053787edd.6
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 14:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Ux55ryQBBaEepRnk9PXGPTt63/K1gbSc6YEw/gx9sdM=;
 b=CpKpshDDwu+s+oxG843rye5L5PPbhdLRleWmgp6ok+Pb8ianEOTYsSl2sDgFMFlkIM
 ed3cOsweqP8b+SuXGPavOeZTh8LHW1Hsc2/DP3d5AsXba/wOwMrh2UMrHON5OyHGJtBK
 C39WVwvV81b0hkVDqPvQJupC/5AitSFcYgZvXTRs/DABFNKF07yLjcJm22mv4ekEAWCT
 OeJHWMMq7Q4oH1Fu+sEJGpmhDN3Y0B+G7vCWA9rmfmsF5coqheglmRAaOfm6wfYL8qcS
 1kr9K2NfKDoxweWFyG1rEGKxs+xik0p1RhFdffvsEpHi7zkfmPt0jeMoaffkfmoFs7Ph
 IlvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Ux55ryQBBaEepRnk9PXGPTt63/K1gbSc6YEw/gx9sdM=;
 b=sDuMbfoi1/ZT3EjDMyqdd1zSXV1V0VfiFZftM76tI8A66ma+T/pgG9hg9WalY8y94L
 nvmSH7ChgZFM6Jn4yyWIHBr9/dpR4UfSk/tibCasK6r2qWCks5XtCjAYKtRb5kPWo2jf
 5JXyJiyFQz5A/T0/TzcTqwayM2PEkwJYzhUz9DCM2W6odq/TDezq/Sx/vXX14nsqj7MA
 PoRcwLIi4eZJbijLzF3OHD625EsCH/gEPqnP8ioj4HxNN3A3ngH9UAgl1viME0v2tP+j
 JVB4UrCV0uRVEqIU1/jUWEIsrJHopYhTZ4sg4/FFbZ4QYT5v3brctDeyghe+jt8l+6Jd
 N6CQ==
X-Gm-Message-State: AOAM532dIBkz2gwcSjiRUbZFUcBNwjPhFKPOHoyru6UrTOOwAo81wBPg
 E7xuH6mpMIsA+/5A1hsEeZJ0lA==
X-Google-Smtp-Source: ABdhPJzTbBSbR1l9DrX1JSX2o5OLVvVtomIFOindP6PECF1hlggaMR6wmqZoBzJ75SE+jNPfCh5PWA==
X-Received: by 2002:a05:6402:134d:: with SMTP id
 y13mr19385669edw.264.1632692601173; 
 Sun, 26 Sep 2021 14:43:21 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id r26sm7806243ejd.85.2021.09.26.14.43.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 14:43:20 -0700 (PDT)
Message-ID: <7db5eac7-8ab3-cf3d-c497-1a9e1ddf5b92@mind.be>
Date: Sun, 26 Sep 2021 23:43:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
References: <20210920173017.695537-1-aduskett@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210920173017.695537-1-aduskett@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/libglib2: bump version to
 2.68.4
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyMC8wOS8yMDIxIDE5OjMwLCBBZGFtIER1c2tldHQgd3JvdGU6Cj4gU2lnbmVkLW9mZi1i
eTogQWRhbSBEdXNrZXR0IDxhZHVza2V0dEBnbWFpbC5jb20+CgogIEFwcGxpZWQgdG8gbWFzdGVy
LCB0aGFua3MuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IC0tLQo+IENoYW5nZXMgVjEgLT4gVjI6
Cj4gICAgLSBSZWZhY3RvciBhZ2FpbnN0IG1hc3RlciBicmFuY2ggaW5zdGVhZCBvZiBuZXh0Lgo+
IAo+ICAgLi4uLzAwMDItcmVtb3ZlLWNwcC1yZXF1aXJlbWVudC5wYXRjaCAgICAgICAgIHwgIDIg
Ky0KPiAgIC4uLnRseS11c2UtMy1wYXJhbWV0ZXJzLWZvci1jbG9zZV9yYW5nZS5wYXRjaCB8IDMz
IC0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgIHBhY2thZ2UvbGliZ2xpYjIvbGliZ2xpYjIuaGFzaCAg
ICAgICAgICAgICAgICB8ICA0ICstLQo+ICAgcGFja2FnZS9saWJnbGliMi9saWJnbGliMi5tayAg
ICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgIDQgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCAzNyBkZWxldGlvbnMoLSkKPiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xpYmds
aWIyLzAwMDQtY29ycmVjdGx5LXVzZS0zLXBhcmFtZXRlcnMtZm9yLWNsb3NlX3JhbmdlLnBhdGNo
Cj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGliZ2xpYjIvMDAwMi1yZW1vdmUtY3BwLXJlcXVp
cmVtZW50LnBhdGNoIGIvcGFja2FnZS9saWJnbGliMi8wMDAyLXJlbW92ZS1jcHAtcmVxdWlyZW1l
bnQucGF0Y2gKPiBpbmRleCA5MzkzYmQyNThhLi5jNDAyY2JhZmE1IDEwMDY0NAo+IC0tLSBhL3Bh
Y2thZ2UvbGliZ2xpYjIvMDAwMi1yZW1vdmUtY3BwLXJlcXVpcmVtZW50LnBhdGNoCj4gKysrIGIv
cGFja2FnZS9saWJnbGliMi8wMDAyLXJlbW92ZS1jcHAtcmVxdWlyZW1lbnQucGF0Y2gKPiBAQCAt
MzUsNyArMzUsNyBAQCBpbmRleCA0YmJmNGMyLi5hYzU5ZjRlIDEwMDY0NAo+ICAgQEAgLTEsNCAr
MSw0IEBACj4gICAtcHJvamVjdCgnZ2xpYicsICdjJywgJ2NwcCcsCj4gICArcHJvamVjdCgnZ2xp
YicsICdjJywKPiAtICAgdmVyc2lvbiA6ICcyLjY4LjInLAo+ICsgICB2ZXJzaW9uIDogJzIuNjgu
NCcsCj4gICAgICAjIE5PVEU6IFdlIGtlZXAgdGhpcyBwaW5uZWQgYXQgMC40OSBiZWNhdXNlIHRo
YXQncyB3aGF0IERlYmlhbiAxMCBzaGlwcwo+ICAgICAgbWVzb25fdmVyc2lvbiA6ICc+PSAwLjQ5
LjInLAo+ICAgQEAgLTEwLDcgKzEwLDYgQEAgcHJvamVjdCgnZ2xpYicsICdjJywgJ2NwcCcsCj4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGliZ2xpYjIvMDAwNC1jb3JyZWN0bHktdXNlLTMtcGFyYW1l
dGVycy1mb3ItY2xvc2VfcmFuZ2UucGF0Y2ggYi9wYWNrYWdlL2xpYmdsaWIyLzAwMDQtY29ycmVj
dGx5LXVzZS0zLXBhcmFtZXRlcnMtZm9yLWNsb3NlX3JhbmdlLnBhdGNoCj4gZGVsZXRlZCBmaWxl
IG1vZGUgMTAwNjQ0Cj4gaW5kZXggYmZjYTRiMTRlZi4uMDAwMDAwMDAwMAo+IC0tLSBhL3BhY2th
Z2UvbGliZ2xpYjIvMDAwNC1jb3JyZWN0bHktdXNlLTMtcGFyYW1ldGVycy1mb3ItY2xvc2VfcmFu
Z2UucGF0Y2gKPiArKysgL2Rldi9udWxsCj4gQEAgLTEsMzMgKzAsMCBAQAo+IC1Gcm9tIGI3MTEx
N2Q4OTQzNGRiODNkMzRiYzFiOTgxY2EwM2Q0YmUyOTk1NzYgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCj4gLUZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+Cj4gLURhdGU6IFRodSwg
OCBKdWwgMjAyMSAxNzoyNjo0MyAtMDcwMAo+IC1TdWJqZWN0OiBbUEFUQ0hdIGNvcnJlY3RseSB1
c2UgMyBwYXJhbWV0ZXJzIGZvciBjbG9zZV9yYW5nZQo+IC0KPiAtbGliYyBpbXBsZW1lbnRhdGlv
biBoYXMgMyBwYXJhbWV0ZXIgZS5nLgo+IC1odHRwczovL3d3dy5mcmVlYnNkLm9yZy9jZ2kvbWFu
LmNnaT9xdWVyeT1jbG9zZV9yYW5nZSZzZWt0aW9uPTImZm9ybWF0PWh0bWwKPiAtCj4gLVNpZ25l
ZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+Cj4gLQo+IC1bUmV0cmlldmVk
IGZyb206Cj4gLWh0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9nbGliLy0vY29tbWl0L2I3
MTExN2Q4OTQzNGRiODNkMzRiYzFiOTgxY2EwM2Q0YmUyOTk1NzZdCj4gLVNpZ25lZC1vZmYtYnk6
IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+IC0tLS0KPiAt
IGdsaWIvZ3NwYXduLmMgfCAyICstCj4gLSAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKPiAtCj4gLWRpZmYgLS1naXQgYS9nbGliL2dzcGF3bi5jIGIvZ2xpYi9n
c3Bhd24uYwo+IC1pbmRleCA4OTk2NDdjMmYuLjMwNzNhMTBhNCAxMDA2NDQKPiAtLS0tIGEvZ2xp
Yi9nc3Bhd24uYwo+IC0rKysgYi9nbGliL2dzcGF3bi5jCj4gLUBAIC0xNTIwLDcgKzE1MjAsNyBA
QCBzYWZlX2Nsb3NlZnJvbSAoaW50IGxvd2ZkKQo+IC0gICAgKgo+IC0gICAgKiBIYW5kbGUgRU5P
U1lTIGluIGNhc2UgaXTigJlzIHN1cHBvcnRlZCBpbiBsaWJjIGJ1dCBub3QgdGhlIGtlcm5lbDsg
aWYgc28sCj4gLSAgICAqIGZhbGwgYmFjayB0byBzYWZlX2Zkd2FsaygpLiAqLwo+IC0tICBpZiAo
Y2xvc2VfcmFuZ2UgKGxvd2ZkLCBHX01BWFVJTlQpICE9IDAgJiYgZXJybm8gPT0gRU5PU1lTKQo+
IC0rICBpZiAoY2xvc2VfcmFuZ2UgKGxvd2ZkLCBHX01BWFVJTlQsIDApICE9IDAgJiYgZXJybm8g
PT0gRU5PU1lTKQo+IC0gI2VuZGlmICAvKiBIQVZFX0NMT1NFX1JBTkdFICovCj4gLSAgICh2b2lk
KSBzYWZlX2Zkd2FsayAoY2xvc2VfZnVuYywgR0lOVF9UT19QT0lOVEVSIChsb3dmZCkpOwo+IC0g
I2VuZGlmCj4gLS0tCj4gLUdpdExhYgo+IC0KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJnbGli
Mi9saWJnbGliMi5oYXNoIGIvcGFja2FnZS9saWJnbGliMi9saWJnbGliMi5oYXNoCj4gaW5kZXgg
MTVlMDA4NWY3OC4uZDQyMWUwMjVmZiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2xpYmdsaWIyL2xp
YmdsaWIyLmhhc2gKPiArKysgYi9wYWNrYWdlL2xpYmdsaWIyL2xpYmdsaWIyLmhhc2gKPiBAQCAt
MSw0ICsxLDQgQEAKPiAtIyBodHRwczovL2Rvd25sb2FkLmdub21lLm9yZy9zb3VyY2VzL2dsaWIv
Mi42OC9nbGliLTIuNjguMi5zaGEyNTZzdW0KPiAtc2hhMjU2ICBlY2M3Nzk4YTljYzAzNGVhYmRm
ZDdmMjQ2ZTZkZDQ2MWNkYmYxMTc1ZmNjMmU5ODY3Y2M3ZGE3YjczMDllMGZiICBnbGliLTIuNjgu
Mi50YXIueHoKPiArIyBodHRwczovL2Rvd25sb2FkLmdub21lLm9yZy9zb3VyY2VzL2dsaWIvMi42
OC9nbGliLTIuNjguNC5zaGEyNTZzdW0KPiArc2hhMjU2ICA2MmZkMDYxZDA4YTc1NDkyNjE3ZTYy
NWE3M2UyYzA1ZTI1OWY4MzFhY2JiOGUxZjhiOWM4MWYyM2Y3OTkzYTNiICBnbGliLTIuNjguNC50
YXIueHoKPiAgICMgTGljZW5zZSBmaWxlcywgbG9jYWxseSBjYWxjdWxhdGVkCj4gICBzaGEyNTYg
IGRjNjI2NTIwZGNkNTNhMjJmNzI3YWYzZWU0MmM3NzBlNTZjOTdhNjRmZTNhZGIwNjM3OTlkOGFi
MDMyZmU1NTEgIENPUFlJTkcKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJnbGliMi9saWJnbGli
Mi5tayBiL3BhY2thZ2UvbGliZ2xpYjIvbGliZ2xpYjIubWsKPiBpbmRleCA0ZjEzNjIyZTM2Li5h
ZjczYWViM2JmIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbGliZ2xpYjIvbGliZ2xpYjIubWsKPiAr
KysgYi9wYWNrYWdlL2xpYmdsaWIyL2xpYmdsaWIyLm1rCj4gQEAgLTUsNyArNSw3IEBACj4gICAj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAgCj4gICBMSUJHTElCMl9WRVJTSU9OX01BSk9SID0g
Mi42OAo+IC1MSUJHTElCMl9WRVJTSU9OID0gJChMSUJHTElCMl9WRVJTSU9OX01BSk9SKS4yCj4g
K0xJQkdMSUIyX1ZFUlNJT04gPSAkKExJQkdMSUIyX1ZFUlNJT05fTUFKT1IpLjQKPiAgIExJQkdM
SUIyX1NPVVJDRSA9IGdsaWItJChMSUJHTElCMl9WRVJTSU9OKS50YXIueHoKPiAgIExJQkdMSUIy
X1NJVEUgPSBodHRwOi8vZnRwLmdub21lLm9yZy9wdWIvZ25vbWUvc291cmNlcy9nbGliLyQoTElC
R0xJQjJfVkVSU0lPTl9NQUpPUikKPiAgIExJQkdMSUIyX0xJQ0VOU0UgPSBMR1BMLTIuMSsKPiAK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
