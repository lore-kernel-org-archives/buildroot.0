Return-Path: <SRS0=/juA=P6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B15EC433EF
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 11:05:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E674461884
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 11:05:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E674461884
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B32FB80F33;
	Thu, 11 Nov 2021 11:05:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r6lGTJzGK7kI; Thu, 11 Nov 2021 11:05:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3753581767;
	Thu, 11 Nov 2021 11:05:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 295AD1BF39F
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 11:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25C4E404E4
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 11:05:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dx6JG76qrNHD for <buildroot@lists.busybox.net>;
 Thu, 11 Nov 2021 11:05:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D32E2404E3
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 11:05:37 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id z200so4718324wmc.1
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 03:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zBpsYL8K4ItZ3vMyTYv+jqzpXe+Rko2TsliOZm7bcZ8=;
 b=ar2UP2XhYL+cq1UU24bA4N36ELg2cTyCvkOFWFd4E3zCOC1akfQPmiMh5iEAKX7DTM
 88zE2c5NLjXja1Mw1TbHQ+bF+8c+l+a7Ia+tFXOFwdoGC0mLiR3goFf+IHeUNkYcApI7
 pxLcV7skHS7UjIrMPY0m8C1zTNeUVYGpOOcQT4SXi6MY4OsDViIlY39CGqYE1+eGSrW5
 YmnSVxHwHz5kWGtmsMTvstH33Lm6hdYeRqiXLWdPQ2HATQ30X2zWF75HptbnNuSpgVXr
 95aOWEvWL/P6qeZBoAxyGQNnCqkNxdD0+lUq55PZcX0JIDmvuhAOTy9g9tSelqnsk5Gt
 rPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zBpsYL8K4ItZ3vMyTYv+jqzpXe+Rko2TsliOZm7bcZ8=;
 b=BNV3MsoLQL1DnAp+LsznqBqpHCgwzARXt5QWNg84hGi6PJzSLIBtEwmh18/KOm6m/N
 5OTbCqUM+cF5Pn0yI2m/QOIO9sEVmHeAfnDCEXK9NEjvNaSUeJEylriN5i63Ieqt/Z2R
 Jhr0FBgUcqggR+5/szO3t23Qjh4gwPfnojaUBlK4JPnUcQMh06IREaV+WTLmoYt4fCbV
 WVPAYyDmWpQW/+173UBUYbEbxSKTtrfCQ0LQawTUMwXr3owJGuTotKOoQvh9EcXZ8fN0
 VfGBAVY2NFUhmtXWmqg1Vnb8UryzklB0Z0CMLUEH7nlH7P33ZKLnhzM1+aOuAXDjQBb2
 kH6w==
X-Gm-Message-State: AOAM531gySBkUkkydV38R3ncd3tgusLQ+FE1rTq1qgkAFhTWoDdtVLf4
 DkqzDVpupNc5rEcGHBNYKe+NdgKxLCs=
X-Google-Smtp-Source: ABdhPJx9ZvpPMgcDBAlSvCVR8Y1Xm0H5/OwV51airC2kCJOT9VMX7rr2ixejo8l+xf7WRCYPRIOSKw==
X-Received: by 2002:a7b:c38d:: with SMTP id s13mr7508524wmj.12.1636628736009; 
 Thu, 11 Nov 2021 03:05:36 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id t8sm2580791wrv.30.2021.11.11.03.05.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 03:05:35 -0800 (PST)
Message-ID: <caa6bdfd-2ba2-94f5-dc05-b5dd0d4da817@gmail.com>
Date: Thu, 11 Nov 2021 12:05:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20211109220328.388872-1-romain.naour@gmail.com>
 <20211111082548.GA2504300@scaer> <20211111110225.50c73fd9@windsurf>
 <20211111101556.GC2504300@scaer>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20211111101556.GC2504300@scaer>
Subject: Re: [Buildroot] [PATCH v2 RFC] support/scripts: don't build board
 defconfigs with Gitlab's pipelines trigged on tag
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

SGVsbG8gVGhvbWFzLCBZYW5uLCBBbGwsCgpMZSAxMS8xMS8yMDIxIMOgIDExOjE1LCBZYW5uIEUu
IE1PUklOIGEgw6ljcml0wqA6Cj4gVGhvbWFzLCBBbGwsCj4gCj4gT24gMjAyMS0xMS0xMSAxMTow
MiArMDEwMCwgVGhvbWFzIFBldGF6em9uaSBzcGFrZSB0aHVzbHk6Cj4+IE9uIFRodSwgMTEgTm92
IDIwMjEgMDk6MjU6NDggKzAxMDAKPj4gIllhbm4gRS4gTU9SSU4iIDx5YW5uLm1vcmluLjE5OThA
ZnJlZS5mcj4gd3JvdGU6Cj4+PiBPbiAyMDIxLTExLTA5IDIzOjAzICswMTAwLCBSb21haW4gTmFv
dXIgc3Bha2UgdGh1c2x5Ogo+Pj4+IEluIG9yZGVyIHRvIHJlZHVjZSB0aGUgbnVtYmVyIG9mIGxv
bmcgam9icywgZG9uJ3QgYnVpbGQgYm9hcmQKPj4+PiBkZWZjb25maWdzIHdpdGggcGlwZWxpbmVz
IHRyaWdnZWQgb24gdGFnLCBrZWVwaW5nIG9ubHkgdGhlIHJ1bnRpbWUKPj4+PiB0ZXN0cyBhbmQg
dGhlIFFlbXUncyBkZWZjb25maWdzLgo+Pj4gQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KPj4g
SSBoYWRuJ3QgaGFkIHRoZSBjaGFuY2UgdG8gY2hpbWUgaW4gb24gdGhpcyBvbmUsCj4gCj4gU29y
cnksIEkgY291bGQgaGF2ZSB3YWl0ZWQgYSBiaXQgbW9yZSBpbmRlZWQuLi4KPiAKPj4gYnV0IEkg
ZG9uJ3QgZW50aXJlbHkKPj4gYWdyZWUgd2l0aCB0aGUgY2hhbmdlIChJIGFsc28gZG9uJ3QgZW50
aXJlbHkgZGlzYWdyZWUhKS4gSW5kZWVkLCBJCj4+IGJlbGlldmUgd2UgZG8gd2FudCB0byBoYXZl
IHRoZSByZXN1bHRzIG9mIHRoZSBkZWZjb25maWdzIGJ1aWxkcyBvbgo+PiB0YWdzLiBJZiB3ZSBt
aXNzZWQgc29tZXRoaW5nLCBhbmQgb25lIG9mIG91ciByZWxlYXNlIGhhcyBkZWZjb25maWdzCj4+
IGJyb2tlbiwgd2UgZGVmaW5pdGVseSB3YW50IHRvIGtub3cgaXQgYW5kIGZpeCBpdC4KPiAKPiBP
biBwcmluY2lwbGUsIEkgZG8gYWdyZWUgd2l0aCB0aGF0LCBhbmQgdGhhdCdzIHdoYXQgSSBpbml0
aWFsbHkgY29kZWQgaW4KPiB0aGF0IHNjcmlwdC4KPiAKPj4gVGhpcyBkaXNhYmxpbmcgb2YgZGVm
Y29uZmlnIGJ1aWxkcyBpcyBvbmx5IGRvbmUgYmVjYXVzZSB0aGVyZSBpcyBhbgo+PiBpbmZyYXN0
cnVjdHVyZSBpc3N1ZS4gQnV0IHJlYWxseSwgZnJvbSBhIHByb3BlciBRQS9DSSBwb2ludCBvZiB2
aWV3LCB3ZQo+PiByZWFsbHkgd2FudCB0byBidWlsZCB0aGUgZGVmY29uZmlncyBvbiB0YWdzIEkg
dGhpbmsuCj4gCj4gQWdhaW4sIGFncmVlZCBvbiBwcmluY2lwbGUuCgpJbmRlZWQsIElkZWFsbHkg
ZGVmY29uZmlncyBzaG91bGQgYmUgdGVzdGVkIG9uIHJlbGVhc2UuCgpCdXQgZWFjaCBkZWZjb25m
aWcgc3BlbmQgbW9zdCBvZiB0aGUgdGltZSB0byBidWlsZCB0aGUgaW50ZXJuYWwgdG9vbGNoYWlu
IG1heWJlCmFub3RoZXIgc29sdXRpb24gaXMgdG8gdXNlIGFuIHByZWJ1aWx0IHRvb2xjaGFpbi4g
U3RpbGwgYnVpbGRpbmcgYSBrZXJuZWwgdGFrZXMKc29tZSB0aW1lLgoKU2luY2UgbW9zdCBvZiBk
ZWZjb25maWdzIGpvYnMgYXJlIGV4ZWN1dGVkIGJlZm9yZSB0aGUgdGVzdHN1aXRlIGpvYnMsIGl0
IGRlbGF5CnRvbyBtdWNoIHRoZSB0ZXN0c3VpdGUgcmVzdWx0cy4KCj4gCj4gQnV0IGFzIFJvbWFp
biBleHBsYWluZWQsIHRoYXQgY3JlYXRlcyB0b28gbXVjaCBqb2JzIHdoZW4gYSB0YWcgaXMgY3V0
LAo+IHNvIG11Y2ggc28gdGhhdCBhIGxvdCBvZiB0aGVtIGRvIG5vdCBldmVuIHN0YW5kIGEgY2hh
bmNlIHRvIGV2ZW4gc3RhcnQuCgpTZWUgYWdhaW4gd2hhdCBoYXBwZW5lZCB5ZXN0ZXJkYXkgd2hl
biBQZXRlciBkaWQgdHdvIEJ1aWxkcm9vdCByZWxlYXNlcyBhdCB0aGUKc2FtZSB0aW1lICgyMDIx
LjAyLjcgYW5kIDIwMjEuMDguMikuIFRoZSBwaXBlbGluZSBmb3IgdGhlIExUUyAyMDIxLjAyLjcg
ZGlkbid0CmV2ZW4gc3RhcnRlZCB5ZXQgYW5kIHdpbGwgcHJvYmFibHkgcmVhY2ggdGhlIDI0aCB0
aW1lb3V0LgoKPiAKPiBJbiB0aGF0IGNhc2UsIHRoZSBDSSBpcyBub3QgdXNlZnVsbCBhdCBhbGwg
ZWl0aGVyLgo+IAo+IE9uIHRoZSBvdGhlciBoYW5kLCB0aGUgZGVmY29uZmlncyBhcmUgYWxyZWFk
eSBidWlsdCByZWFzb25hYmx5IG9mdGVuLAo+IGV2ZXJ5IHdlZWssIHdpdGggYSBzY2hlZHVsZWQg
cGlwZWxpbmUuIEl0IGlzIHRodXMgcHJldHR5IHF1aWNrIHRvIG5vdGljZQo+IGEgYnVpbGQgZmFp
bHVyZS4KPiAKPiBTbywgbXkgb3BpbmlvbiBpcyB0aGF0IEkgcHJlZmVyIGEgcGFydGlhbCBDSSB0
aGF0IGlzIHN0YWJsZSBhbmQKPiBkZXBlbmRhYmxlLCB3aGVyZSBlYWNoIGZhaWx1cmUgaXMgYW4g
YWN0dWFsIGZhaWx1cmUsIHJhdGhlciB0aGFuIGEKPiBmdWxsLXJhbmdlIENJIHRoYXQgaGFzIGEg
dmVyeSBsb3cgU05SLCB3aGVyZSBwZW9wbGUgZXZlbnR1YWxseSBzdG9wCj4gY2FyaW5nIGFib3V0
IGZhaWx1cmUgcmVwb3J0cyBiZWNhdXNlIHRoZXkgYXJlIG9mdGVuIHNwdXJpb3VzIGZhaWx1cmVz
LgoKU2luY2UgSSBjYXJlIGFib3V0IHRoZSBnaXRsYWItY2ksIEkgcmVzdGFydGVkIGEgbG90IG9m
IGpvYnMgdGhhdCBmYWlsZWQgZHVlIHRvCnRpbWVvdXQgYnV0IHRoaXMgaXMgYW4gYW5ub3lpbmcg
d29yay4uLgoKPiAKPiBPZiBjb3Vyc2UsIHdlIGNhbiByZXZlcnNlIGNvdXJzZSBvbiB0aGF0IGNv
bW1pdDsgYWZ0ZXIgYWxsLCB0aGF0J3Mgd2hhdAo+IGdpdC1yZXZlcnQgaXMgZm9yISA7LSkKCkkg
d291bGQgYmUgaGFwcHkgdG8gcmV2ZXJ0IHRoaXMgcGF0Y2ggOikKCj4gCj4gVGhlIGJldHRlciBj
b3Vyc2Ugb2YgYWN0aW9uLCBvYnZpb3VzbHksIHdvdWxkIGJlIHRvIGhhdmUgYW4gaW5mcmEgdGhh
dAo+IGlzIHN0cm9uZyBlbm91Z2ggdG8gYWJzb3JiIGFsbCB0aGF0IGxvYWQgd2hlbiB3ZSBwdXNo
IGEgdGFnLCBidXQgdGhhdCdzCj4gYW4gb3JkZXIgb2YgbWFnbml0dWRlIG1vcmUgY29tcGxleCB0
byBhY2hpZXZlLgo+IAo+IE9uZSB0aGluZywgdGhvdWdoOiBtYXliZSBzb21lIG9mIHRoZSBydW5u
ZXJzIGNvdWxkIGJlIGNvbmZpZ3VyZWQgdG8KPiBhY2NlcHQgbW9yZSBqb2JzIGF0IG9uY2UsIHNv
IGV2ZW4gaWYgZWFjaCBqb2IgdGhlbiB0YWtlcyBsb25nZXIgdG8gcnVuLAo+IHdlIHN0YXJ0IHRo
ZW0gZmFzdGVyIGFuZCB0aHVzIGRvIG5vdCBoaXQgdGhlIDI0LWhvdXIgYmxvY2thZ2UgbGltaXQu
CgpJJ20gbm90IHN1cmUgaWYgdGhpcyBzb2x1dGlvbiBjYW4gc2NhbGUuIFdlIHN0aWxsIGFkZCBz
b21lIG5ldyBib2FyZCBkZWZjb25maWcgOikKCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBS
ZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4uCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
