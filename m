Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C068EC433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:06:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4615861053
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:06:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4615861053
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DC7840503;
	Wed,  3 Nov 2021 21:06:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5NhI-IrfDXJv; Wed,  3 Nov 2021 21:06:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67098404FE;
	Wed,  3 Nov 2021 21:06:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4DBBA1BF38A
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B6F6606B3
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:06:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s7YzJtcVCicb for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 21:06:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 44599605E9
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 21:06:47 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id d27so5526546wrb.6
 for <buildroot@buildroot.org>; Wed, 03 Nov 2021 14:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=f0asyV0W+fpGqd7yS73Mk55xLueVmEg0ASEJYUNflbw=;
 b=UrOBoY29Lnfps410iSI8qYT58ChDAWo6PgYT8SWw7XIB31YEtDGn0nbhaoU7jnAyow
 Oud0NomkXX7K1Jvt0Iy7mgDu2zkZKQ3ExImu+/ir850+V4HTV1crdgR8GwwuVu+FBddJ
 7f304fi543iWGgCioXInJ4J6ZPOIUWLIPxFEMb28gNIK8n2l6BViop75XA2lnWYFwG8G
 1vct41fyRDzgnATMBDbaqVcNL3fnKnVQIruE8OPmgaHEkbWWl0YOlUjZ7y8zX+T7V7nc
 lI2lVlrvL3ffwXlzg+/bPKdVx98P4jDCSpxR55vWfM31vS+rsb5ohtpXnNznIuI+7REj
 1E5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=f0asyV0W+fpGqd7yS73Mk55xLueVmEg0ASEJYUNflbw=;
 b=sZKrb5ARpcEXMSuOGr02qOrsABTdBg4QxfCOqyvpqUp/RmN7fNgjw8e5AXVT72y3yt
 oPp7MmeFNX+T/Y2q+lKk5prMDPwp0QSXCD/QksGXq5HLdxjoisG+cpcPuOu8IYpqnJRO
 2BhjaMHc/sum0CJAv/QboDr2Tjf7elKb+ilrPpCpJ86LlAvIXonYt/8W9skdbgHO4dIS
 /tlia4etNx7MHfCs2CbseNE8cM2c67xQad1hZjfS/JQ/chhHHz67K23PdFQVOhPxIXTI
 negTnjEK5E00EmsnGbD2eiTAkIhDkiA/aB/mX+4VbYqIcHtUmQD8gk+5gOarc+9fvQx2
 GOWw==
X-Gm-Message-State: AOAM53187eTIqgOb5ZRDFQldHBf9WNyXA/V6k+b7gBfkR0SnE5ivroWe
 BTN0IL1rFTXoHaJ1YfoZJ1y3EfJ9Vy0=
X-Google-Smtp-Source: ABdhPJx1OVxrUeYl2cqnHy1lG6jZCeSNBw6mS6oZr6J2y30JqFfdb5U3YNoAqdmIpbW+WffM31gGHA==
X-Received: by 2002:adf:e848:: with SMTP id d8mr41219419wrn.3.1635973605591;
 Wed, 03 Nov 2021 14:06:45 -0700 (PDT)
Received: from [192.168.1.39] (arennes-651-1-314-16.w2-12.abo.wanadoo.fr.
 [2.12.73.16])
 by smtp.gmail.com with ESMTPSA id y7sm2960272wrw.55.2021.11.03.14.06.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 14:06:45 -0700 (PDT)
Message-ID: <b08f0641-06ec-c4ce-6960-2df5898cf6c2@gmail.com>
Date: Wed, 3 Nov 2021 22:06:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Adam Duskett <aduskett@gmail.com>
References: <20211031224207.1385633-1-romain.naour@gmail.com>
 <BY5PR19MB36687517E13A0EE264B37A5FFB8A9@BY5PR19MB3668.namprd19.prod.outlook.com>
 <7a877d3b-95b9-55dc-8756-88fa9bb51876@gmail.com>
 <CAFSsvmqUvKZVr+uCFCpinRM5sK-3UdBrMXUXzJ1kF=i1xnXNxQ@mail.gmail.com>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <CAFSsvmqUvKZVr+uCFCpinRM5sK-3UdBrMXUXzJ1kF=i1xnXNxQ@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH] package/refpolicy: enable refpolicy's xdg
 module when systemd is enabled
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
Cc: Antoine Tenart <atenart@kernel.org>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQWRhbSwKCkxlIDAyLzExLzIwMjEgw6AgMTg6MjYsIEFkYW0gRHVza2V0dCBhIMOpY3Jp
dMKgOgo+IEhleSBSb21haW47Cj4gCj4gU29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5IQo+IAo+IAo+
IE9uIE1vbiwgTm92IDEsIDIwMjEgYXQgMjoyMyBBTSBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91
ckBnbWFpbC5jb20+IHdyb3RlOgo+Pgo+PiBIZWxsbyBBZGFtLAo+Pgo+PiBMZSAwMS8xMS8yMDIx
IMOgIDA3OjEwLCByYXRiZXJ0OTAgYSDDqWNyaXQgOgo+Pj4gSGVsbG87Cj4+Pgo+Pj4gU2hvdWxk
buKAmXQgdGhpcyBnbyBpbiBzeXN0ZW1kLm1rPwo+Pgo+PiBJJ20gbm90IHN1cmUgdG8gdW5kZXJz
dGFuZCwgd2hhdCBkbyB5b3UgbWVhbj8KPj4KPj4gSXQncyBhYm91dCBhIHJlZnBvbGljeSBtb2R1
bGUgbm90IHNlbGludXggbW9kdWxlIChTWVNURU1EX1NFTElOVVhfTU9EVUxFUykuCj4gCj4gUmVm
cG9saWN5IG1vZHVsZXMgYXJlIFNFTGludXggbW9kdWxlcyEKPiAKPiBJIGp1c3QgdGVzdGVkIGJ5
IGFkZGluZyB4ZGcgdG8gU1lTVEVNRF9TRUxJTlVYX01PRFVMRVMgd2hpY2ggZG9lcwo+IGluZGVl
ZCBmaXggdGhlIGlzc3VlLgoKb2sgYnV0IGl0J3Mgbm90IGNsZWFyIHRvIG1lIGlmIHdlIG5lZWQg
dG8gYWRkIHhkZyB0byBTWVNURU1EX1NFTElOVVhfTU9EVUxFUyBvcgpSRUZQT0xJQ1lfTU9EVUxF
Uy4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBBZGFtCj4+Cj4+IEFub3RoZXIgd2F5IHRv
IGZpeCB0aGUgaXNzdWUgaXMgdG8gYWRkIHhkcCB0byBCUjJfUkVGUE9MSUNZX0VYVFJBX01PRFVM
RVMgaW4gdGhlCj4+IHRlc3QgY29uZmlnLi4uIGJ1dCBJIGRvbid0IHRoaW5rIGl0J3MgdGhlIHJp
Z2h0IGZpeC4KPj4KPj4gQmVzdCByZWdhcmRzLAo+PiBSb21haW4KPj4KPj4KPj4+Cj4+PiBBZGFt
Cj4+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+Pj4gKkRhOiogYnVpbGRyb290IDxidWlsZHJv
b3QtYm91bmNlc0BidWlsZHJvb3Qub3JnPiBwZXIgY29udG8gZGkgUm9tYWluIE5hb3VyCj4+PiA8
cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4KPj4+ICpJbnZpYXRvOiogU3VuZGF5LCBPY3RvYmVyIDMx
LCAyMDIxIDM6NDI6MDcgUE0KPj4+ICpBOiogYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcgPGJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnPgo+Pj4gKkNjOiogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJA
Z21haWwuY29tPjsgQW50b2luZSBUZW5hcnQgPGF0ZW5hcnRAa2VybmVsLm9yZz4KPj4+ICpPZ2dl
dHRvOiogW0J1aWxkcm9vdF0gW1BBVENIXSBwYWNrYWdlL3JlZnBvbGljeTogZW5hYmxlIHJlZnBv
bGljeSdzIHhkZyBtb2R1bGUKPj4+IHdoZW4gc3lzdGVtZCBpcyBlbmFibGVkCj4+Pgo+Pj4gcG9s
aWN5L21vZHVsZXMvc3lzdGVtL3N5c3RlbWQudGUgcmVxdWlyZXMgeGRnIG1vZHVsZSBlbmFibGVk
IFsxXQo+Pj4gb3RoZXJ3aXNlIHJlZnBvbGljeSBmYWlsIHRvIGJ1aWxkOgo+Pj4KPj4+IHBvbGlj
eS9tb2R1bGVzL3N5c3RlbS9zeXN0ZW1kLnRlOjI4ODpFUlJPUiAnYXR0cmlidXRlIHhkZ19jb25m
aWdfdHlwZSBpcyBub3QKPj4+IGRlY2xhcmVkJyBhdCB0b2tlbiAnOycgb24gbGluZSA1MDg0NDc6
Cj4+Pgo+Pj4gRml4ZXM6Cj4+PiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWls
ZHJvb3QvLS9qb2JzLzE3MTA1NTI0NjgKPj4+IDxodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290
Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzE3MTA1NTI0Njg+Cj4+PiBodHRwczovL2dpdGxhYi5jb20v
YnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzE3MTA1NTI0NzAKPj4+IDxodHRwczovL2dp
dGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzE3MTA1NTI0NzA+Cj4+Pgo+
Pj4gWzFdCj4+PiBodHRwczovL2dpdGh1Yi5jb20vU0VMaW51eFByb2plY3QvcmVmcG9saWN5L2Js
b2IvUkVMRUFTRV8yXzIwMjEwOTA4L3BvbGljeS9tb2R1bGVzL3N5c3RlbS9zeXN0ZW1kLnRlI0wy
ODgKPj4+IDxodHRwczovL2dpdGh1Yi5jb20vU0VMaW51eFByb2plY3QvcmVmcG9saWN5L2Jsb2Iv
UkVMRUFTRV8yXzIwMjEwOTA4L3BvbGljeS9tb2R1bGVzL3N5c3RlbS9zeXN0ZW1kLnRlI0wyODg+
Cj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwu
Y29tPgo+Pj4gQ2M6IEFudG9pbmUgVGVuYXJ0IDxhdGVuYXJ0QGtlcm5lbC5vcmc+Cj4+PiAtLS0K
Pj4+ICBwYWNrYWdlL3JlZnBvbGljeS9yZWZwb2xpY3kubWsgfCAxICsKPj4+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9yZWZwb2xp
Y3kvcmVmcG9saWN5Lm1rIGIvcGFja2FnZS9yZWZwb2xpY3kvcmVmcG9saWN5Lm1rCj4+PiBpbmRl
eCA5NzVjM2I1ODRjLi5iMWQxMDFlMzExIDEwMDY0NAo+Pj4gLS0tIGEvcGFja2FnZS9yZWZwb2xp
Y3kvcmVmcG9saWN5Lm1rCj4+PiArKysgYi9wYWNrYWdlL3JlZnBvbGljeS9yZWZwb2xpY3kubWsK
Pj4+IEBAIC02OSw2ICs2OSw3IEBAIFJFRlBPTElDWV9NT0RVTEVTID0gXAo+Pj4gICAgICAgICAg
c3lzbmV0d29yayBcCj4+PiAgICAgICAgICB1bmNvbmZpbmVkIFwKPj4+ICAgICAgICAgIHVzZXJk
b21haW4gXAo+Pj4gKyAgICAgICAkKGlmICQoQlIyX1BBQ0tBR0VfU1lTVEVNRCkseGRnKSBcCj4+
PiAgICAgICAgICAkKFBBQ0tBR0VTX1NFTElOVVhfTU9EVUxFUykgXAo+Pj4gICAgICAgICAgJChj
YWxsIHFzdHJpcCwkKEJSMl9SRUZQT0xJQ1lfRVhUUkFfTU9EVUxFUykpIFwKPj4+ICAgICAgICAg
ICQoZm9yZWFjaCBkLCQoUkVGUE9MSUNZX0VYVFJBX01PRFVMRVNfRElSUyksXAo+Pj4gLS0KPj4+
IDIuMzEuMQo+Pj4KPj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+PiBidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwo+Pj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cj4+PiA8aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Pgo+PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
