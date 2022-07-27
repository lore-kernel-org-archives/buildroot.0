Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7595DC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 13:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E88E4409FF;
	Wed, 27 Jul 2022 13:31:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E88E4409FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i_rJJ0UWb80Z; Wed, 27 Jul 2022 13:31:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DED7A40A7A;
	Wed, 27 Jul 2022 13:31:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DED7A40A7A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 51F5A1BF2BA
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 13:31:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3356440A7A
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 13:31:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3356440A7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7WW0Szwc3AMl for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 13:31:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B7A240941
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2B7A240941
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 13:31:05 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id l22so2635448wrz.7
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 06:31:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=DgTojdF4sap88f+Wn1t+AuHk3zqibJNKsYhx90EHN4M=;
 b=jQAN7zPRGh9tK8egqbkEJjiQO8K5hOdnFUyCSsqLZheynKBJ432wDSzb8y74RmwjoD
 PycOEt81Av7Okh1Hg2fX92QrbsRmuW8ueg67sNLt3xNm6p4hQfpRuU01XEzIrdyoCrGV
 CfhgOwHmWA2zT+3xowM0yvrMNvT+eNaV3Uj7xCYMptqbzr3AAhCXTzEf4wKyr5ZdCBR/
 rVjxWkOQMUzp+UjTqVsfyMLyaX0DlI/sjYhvZuSi8VmktofvG0FXVIUUGve5bqJN4TOq
 bSCX3b3q8aKzwwBEDN8dayRDHrNbroBENAExItUV4Lt76MhfGGt7eOmJIsgiAq+nGut6
 E+Jw==
X-Gm-Message-State: AJIora/X45c8pVQgT7oRV7PDkZ7JAEA8BI9DSJGJye1vngJRvn/Ib923
 +vGaCnvRqZrsc7wjEyWNVCcyig==
X-Google-Smtp-Source: AGRyM1uTN+KTHlTN5Tqf0GjWysmSxL6R2HXNwlYG9vwoPGp0PwX8zXp2mt84PcvnuQCsQI+jE/nkpg==
X-Received: by 2002:a1c:2785:0:b0:3a2:dcff:7903 with SMTP id
 n127-20020a1c2785000000b003a2dcff7903mr3271981wmn.113.1658928663360; 
 Wed, 27 Jul 2022 06:31:03 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a05600c0a0b00b003a319bd3278sm3108157wmp.40.2022.07.27.06.31.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 06:31:02 -0700 (PDT)
Message-ID: <ff2a0969-2a0d-9078-bd25-107e4a954c8f@mind.be>
Date: Wed, 27 Jul 2022 15:31:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220108224337.3702128-1-fontaine.fabrice@gmail.com>
 <c1c3040b-d429-dcaf-6e97-5f0c8367b48a@mind.be>
 <CAPi7W82V0nFCRi55MPsHV7DPQFSrGRmy1_mpFAhjj-MEgv6=DA@mail.gmail.com>
 <574b8f3f-6a94-2517-2d7b-b59b102afefe@mind.be>
 <CAPi7W81Rx_xHu4v6QhdkKJ-7cj-Xv9Wef5-xaPzGa63qGRNR_g@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CAPi7W81Rx_xHu4v6QhdkKJ-7cj-Xv9Wef5-xaPzGa63qGRNR_g@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=DgTojdF4sap88f+Wn1t+AuHk3zqibJNKsYhx90EHN4M=;
 b=Q2JXmqvCllXEbLHn+VcUeohfZmvLnxLH1W9NRSx55S4j9zzEFtx4V/U4JcHS+gcGnX
 gcxYYwE4pBn0+bVwqzJDjSCPxEFITlZlUIGCBB/AsvZ5PHcFbNIkx9qPlW+BSfS7T6RI
 wzWMnKMc9jsnMt/ubtLJFuVI/zVpjKb3Z5VcEAh8YKMeKxd1YtXGNbYNzjWpWwTT+XFe
 P+7r5RraKS7CLa4fhHBJrhlf5ODUdgWfrx2vXl8NS86/QGxMP5YUyqHnyaWz1BT4btnS
 aXA8tVsGtKu0pDq+WPDAAb6/LQDhmLkNbHrmEDAA24kiHHC83C2Ffw08lTugTGnR0nZ8
 BO8g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Q2JXmqvC
Subject: Re: [Buildroot] [PATCH 1/2] package/minizip: add minizip-zlib
 support
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
Cc: Fabrice Fontaine <fabrice.fontaine@orange.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyNy8wNy8yMDIyIDE1OjEyLCBGYWJyaWNlIEZvbnRhaW5lIHdyb3RlOgo+IAo+IAo+IExl
wqBtZXIuIDI3IGp1aWwuIDIwMjIgw6DCoDE0OjQ5LCBBcm5vdXQgVmFuZGVjYXBwZWxsZSA8YXJu
b3V0QG1pbmQuYmUgCj4gPG1haWx0bzphcm5vdXRAbWluZC5iZT4+IGEgw6ljcml0wqA6Cj4gCj4g
Cj4gCj4gICAgIE9uIDI3LzA3LzIwMjIgMTQ6MDUsIEZhYnJpY2UgRm9udGFpbmUgd3JvdGU6Cj4g
ICAgICA+IEhpIEFybm91dCwKPiAgICAgID4KPiAgICAgID4gTGXCoG1lci4gMjcganVpbC4gMjAy
MiDDoMKgMTM6MDgsIEFybm91dCBWYW5kZWNhcHBlbGxlIDxhcm5vdXRAbWluZC5iZQo+ICAgICA8
bWFpbHRvOmFybm91dEBtaW5kLmJlPgo+ICAgICAgPiA8bWFpbHRvOmFybm91dEBtaW5kLmJlIDxt
YWlsdG86YXJub3V0QG1pbmQuYmU+Pj4gYSDDqWNyaXTCoDoKW3NuaXBdCj4gICAgICDCoCBPaCwg
aGFuZyBvbiAyOiB0aGVyZSBpcyBpbiBmYWN0IGEgTVpfQ09NUEFUIGNtYWtlIG9wdGlvbiB3aGlj
aCB3ZSBjdXJyZW50bHkKPiAgICAgZG9uJ3QgZW5hYmxlLCBhbmQgaXQgbG9va3MgbGlrZSB0aGF0
IG9uZSBkb2VzIGVuYWJsZSB0aGUgY29tcGF0aWJpbGl0eSBoZWFkZXJzLgo+IAo+IAo+IE1aX0NP
TVBBVCB3YXMgZGlzYWJsZWQgYnkgY29tbWl0IGZjMTY2ODk0YjNmMjU3YzRjYjIwZDg0MzY4Yzkx
OGYzMzM1ZGFkZjUgdG8gCj4gYXZvaWQgYSBidWlsZCBmYWlsdXJlIHdpdGggZG9tb3RpY3ouCgog
IFRoYXQgbWF5IGhhdmUgYmVlbiBmaXhlZCBpbiBtaW5pemlwLW5nIGJ5IG5vdy4KCiAgQnV0IGFu
eXdheSwgbXkgb3JpZ2luYWwgcG9pbnQgcmVtYWluczogbWluaXppcC1uZyBkb2Vzbid0IGFjdHVh
bGx5IGluc3RhbGwgCmFueXRoaW5nIHRoYXQgY29uZmxpY3RzIHdpdGggbWluaXppcC16bGliLCBz
byB0aGVyZSdzIG5vIHJlYXNvbiB0byBtYWtlIGl0IGEgCnZpcnR1YWwgcGFja2FnZS4KCiAgQW5k
IEkgbm93IGFsc28gY2hlY2tlZCBpdCB3aXRoIGxpYnppcC4gbGliemlwIGluc3RhbGxzIGluIC91
c3IvaW5jbHVkZSwgCm1pbml6aXAtemxpYiBpbnN0YWxscyBpbiAvdXNyL2luY2x1ZGUvbWluaXpp
cCwgc28gdGhlcmUncyBubyBjb25mbGljdC4KCiAgSnVzdCB0byBiZSBzdXJlLCB5b3UgY2FuIHBl
cmhhcHMgYWxzbyBydW4gYSB0ZXN0IGFnYWluc3QgcGhwIHdpdGggbGliemlwIGVuYWJsZWQ/CgoK
PiAgICAgID7CoCDCoCDCoCDCoCBTbyB0aGVyZSdzIG5vIHJlYXNvbiBhdCBhbGwgdG8gbWFrZSBp
dCBhIHZpcnR1YWwgcGFja2FnZS4KPiAgICAgID4KPiAgICAgID4KPiAgICAgID4gSSBkZWNpZGVk
IHRvIG1ha2UgYSB2aXJ0dWFsIHBhY2thZ2UgYmVjYXVzZSB0aGVyZSB3YXMgYWxyZWFkeSBhIHZp
cnR1YWwKPiAgICAgcGFja2FnZQo+ICAgICAgPiBmb3IgemxpYiBhbmQgemxpYi1uZy4KPiAgICAg
ID4gSSB0aG91Z2h0IHRoYXQgd2Ugd2VyZSBpbiB0aGUgc2FtZSBzaXR1YXRpb24gd2l0aCBtaW5p
emlwKC1uZykgYW5kCj4gICAgIG1pbml6aXAtbGVnYWN5Lgo+IAo+ICAgICAgwqAgemxpYiBhbmQg
emxpYi1uZyBhcmUgYm90aCBtYWludGFpbmVkLCBzbyB0aGF0J3MgZGlmZmVyZW50Lgo+IAo+IAo+
IEFjdHVhbGx5LCBtaW5pemlwIGFuZCBtaW5pemlwKC1uZykgYXJlIGJvdGggbWFpbnRhaW5lZC4g
TGF0ZXN0IGNvbW1pdCBvbiBtaW5pemlwIAo+IHdhcyBtYWRlIG9uIEphbnVhcnk6Cj4gaHR0cHM6
Ly9naXRodWIuY29tL21hZGxlci96bGliL2NvbW1pdHMvbWFzdGVyL2NvbnRyaWIvbWluaXppcC9t
aW5pemlwLmMgCj4gPGh0dHBzOi8vZ2l0aHViLmNvbS9tYWRsZXIvemxpYi9jb21taXRzL21hc3Rl
ci9jb250cmliL21pbml6aXAvbWluaXppcC5jPgoKICBPSwoKCj4gICAgICDCoCBJJ2QgcHJvcG9z
ZSB0aGUgZm9sbG93aW5nOgo+IAo+ICAgICBpZiBNWl9DT01QQVQgd29ya3Mgd2l0aCBkb21vdGlj
ejsgdGhlbgo+ICAgICAgwqAgwqAgwqAgwqAgMS4gQWRkIEJSMl9QQUNLQUdFX01JTklaSVBfTEVH
QUNZCj4gICAgICDCoCDCoCDCoCDCoCAyLiBTZWxlY3QgQlIyX1BBQ0tBR0VfTUlOSVpJUHssX0xF
R0FDWX0gZnJvbSBkb21vdGljego+ICAgICBlbHNlCj4gICAgICDCoCDCoCDCoCDCoCAxLiBJbnRy
b2R1Y2UgbWluaXppcC1sZWdhY3kgYXMgYSB2aXJ0dWFsIHBhY2thZ2UKPiAgICAgIMKgIMKgIMKg
IMKgIDIuIEFkZCBCUjJfUEFDS0FHRV9NSU5JWklQX0xFR0FDWV9DT01QQVQgdG8gbWluaXppcCB0
aGF0IGltcGxlbWVudHMKPiAgICAgdGhlIHZpcnR1YWwKPiAgICAgcGFja2FnZQo+ICAgICAgwqAg
wqAgwqAgwqAgMy4gQWRkIG1pbml6aXAtemxpYiBwYWNrYWdlCj4gICAgICDCoCDCoCDCoCDCoCA0
LiBzZWxlY3QgbWluaXppcC16bGliIGZyb20gZG9tb3RpY3oKPiAgICAgZmkKPiAKPiAgICAgIMKg
IE5vdGUgdGhhdCBmb3IgNC4geW91IG5lZWQgc29tZXRoaW5nIGxpa2Ugd2UgaGF2ZSBmb3Igb3Bl
bnNzbCwgYW4gYWRkaXRpb25hbAo+ICAgICBibGluZCBzeW1ib2wgdGhhdCBhbGxvd3Mgc2VsZWN0
aW5nIGEgc3BlY2lmaWMgbWluaXppcC1sZWdhY3kgaW1wbGVtZW50YXRpb24uCj4gCj4gCj4gT0ss
IEknbGwgZ28gZm9yIHRoZSBzZWNvbmQgb3B0aW9uLgoKICBNeSBjb25kaXRpb25hbCB0cmVlIHdh
cyB3cm9uZyB0aG91Z2guIFRoZXJlIGlzIG5vIHJlYWwgcmVhc29uIGZvciB1cyB0byAKc3VwcG9y
dCB0aGUgY29tcGF0aWJpbGl0eSBtb2RlIG9mIG1pbml6aXAtbmcuIFdlIGNhbiBzaW1wbHkgYWRk
IG1pbmlsaWItemxpYiBhcyAKYW4gaW5kZXBlbmRlbnQsIG5vbi1jb25mbGljdGluZyBwYWNrYWdl
LiBTbzoKCmlmIHRydWU7IHRoZW4KCTEuIEFkZCBtaW5pemlwLXpsaWIgcGFja2FnZQoJMi4gc2Vs
ZWN0IG1pbml6aXAtemxpYiBmcm9tIGRvbW90aWN6CmZpCgogIEl0IHdhcyBqdXN0IHlvdXIgbWVu
dGlvbiBvZiBNWl9DT01QQVQgdGhhdCBnb3QgbWUgY29uZnVzZWQsIHNvcnJ5LgoKCj4gICAgICA+
wqAgwqAgwqAgPsKgIMKgLSB0aGUgY3VycmVudCBtaW5pemlwICh3aGljaCBoYXMgYmVlbiByZW5h
bWVkIG1pbml6aXAtbmcgc2luY2UKPiAgICAgID7CoCDCoCDCoCA+Cj4gICAgICA+Cj4gICAgIGh0
dHBzOi8vZ2l0aHViLmNvbS96bGliLW5nL21pbml6aXAtbmcvY29tbWl0L2RiOTU4OTQ2NDZiODdm
NjE3OGNlYWEzODljYmRiNWIxYmE4Y2Q5N2EKPiAgICAgPGh0dHBzOi8vZ2l0aHViLmNvbS96bGli
LW5nL21pbml6aXAtbmcvY29tbWl0L2RiOTU4OTQ2NDZiODdmNjE3OGNlYWEzODljYmRiNWIxYmE4
Y2Q5N2E+Cj4gICAgICA+ICAgCj4gICAgICDCoDxodHRwczovL2dpdGh1Yi5jb20vemxpYi1uZy9t
aW5pemlwLW5nL2NvbW1pdC9kYjk1ODk0NjQ2Yjg3ZjYxNzhjZWFhMzg5Y2JkYjViMWJhOGNkOTdh
IDxodHRwczovL2dpdGh1Yi5jb20vemxpYi1uZy9taW5pemlwLW5nL2NvbW1pdC9kYjk1ODk0NjQ2
Yjg3ZjYxNzhjZWFhMzg5Y2JkYjViMWJhOGNkOTdhPj4pCj4gICAgICA+Cj4gICAgICA+wqAgwqAg
wqAgwqAgSXQgd291bGQgbWFrZSBtb3JlIHNlbnNlIHRvIHN3aXRjaCB0aGUgZXhpc3RpbmcgbWlu
aXppcCBwYWNrYWdlIHRvCj4gICAgIHRoaXMgbmV3Cj4gICAgICA+wqAgwqAgwqB1cHN0cmVhbSBy
ZXBvc2l0b3J5Lgo+ICAgICAgPgo+ICAgICAgPgo+ICAgICAgPiBBY3R1YWxseSwgd2UncmUgYWxy
ZWFkeSBzaGlwcGluZyBtaW5pemlwLW5nIGFzIG1pbml6aXAuCj4gCj4gICAgICDCoCBZZXMsIGJ1
dCB3ZSBhcmUgY3VycmVudGx5IHVzaW5nIGEgZGlmZmVyZW50IGdpdGh1YiBwcm9qZWN0Lgo+IAo+
ICAgICAgwqAgU28gYmVmb3JlIChvciBpbmRlcGVuZGVudCkgb2YgYWxsIHRoZSByZXN0LCBJJ2Qg
c2VuZCBhIHBhdGNoIHRoYXQganVzdAo+ICAgICBjaGFuZ2VzCj4gICAgIHRoZSBTSVRFIHVzZWQg
YnkgbWluaXppcC4KPiAKPiAKPiBPSywgSSdsbCBzZW5kIGEgcGF0Y2ggYnV0IGJhc2ljYWxseSB0
aGlzIGlzIHRoZSBzYW1lIGdpdGh1YiBwcm9qZWN0Ogo+IGh0dHBzOi8vZ2l0aHViLmNvbS9ubW9p
bnZhei9taW5pemlwLW5nIDxodHRwczovL2dpdGh1Yi5jb20vbm1vaW52YXovbWluaXppcC1uZz4g
Cj4gaXMganVzdCBhIHN5bWxpbmsgdG8KPiBodHRwczovL2dpdGh1Yi5jb20vemxpYi1uZy9taW5p
emlwLW5nIDxodHRwczovL2dpdGh1Yi5jb20vemxpYi1uZy9taW5pemlwLW5nPgoKICBZZXMsIGJ1
dCB3ZSBwcmVmZXIgdG8gaGF2ZSB0aGUgcmVhbCBwcm9qZWN0IHJhdGhlciB0aGFuIGEgc3ltbGlu
ay4uLgoKCiAgUmVnYXJkcywKICBBcm5vdXQKCltzbmlwXQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
