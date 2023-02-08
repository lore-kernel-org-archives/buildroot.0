Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC97AC05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 13:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 714DF40BE8;
	Wed,  8 Feb 2023 13:51:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 714DF40BE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dHXBjnrVopYK; Wed,  8 Feb 2023 13:51:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C46E40BE7;
	Wed,  8 Feb 2023 13:51:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C46E40BE7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DC07B1BF3FD
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 13:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C30C040BE4
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 13:51:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C30C040BE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b0S6Ckb21m1P for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 13:51:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9849D40B48
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9849D40B48
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 13:51:23 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id bu23so969615wrb.8
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 05:51:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MuttMTF+H8STMh19Np/kG6QRqGQAKE9otZh2pH/1+P8=;
 b=di46aPDq/4Zp8Dc0GBS84gNUx+Hmh1dgyqrsARjJObk6aPFHSOssrQFApVb3calTqk
 Zh/itEyKKDOekzjbf1+z2oFfphqzehDCsXx6Q14z+9WMoefi6j0S+FactXezuYuMdTJI
 Oo5hc7zv8zyWXFOZOIDVtBwSnbTkuHZ+hYiaOdQd5FHWVLUIv3pPiFfY7anGHlX5qqzm
 jFl/J5/bpJWvW+N4W4qojkVOKbmtjW5HRJplQSuFe+B7WN1CrWiqSIxVrNjjhVtWjJKh
 xswMilC7zIYLXmhxV60QGy/HqtYKcuI5hEc5ywvXXVYTiBp9jWtjBUEPbjs362JnQH4b
 eTLQ==
X-Gm-Message-State: AO0yUKWw/IOoH44GTa4XJE2rYhKau+vyKl4qaW5mv5Olg2xHA3TEHkbC
 HgFmjmMxoa6/APr2rqedINc+Yw==
X-Google-Smtp-Source: AK7set+JoAOnktmCOvKQji32rySeA9aFqMY8Qc/sFlSbSaP8382S3dI69we2vtb6+wW3tpRviSgpqw==
X-Received: by 2002:adf:eac4:0:b0:2c3:f472:84ad with SMTP id
 o4-20020adfeac4000000b002c3f47284admr1864982wrn.65.1675864281669; 
 Wed, 08 Feb 2023 05:51:21 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a5d69c2000000b002c3de83be0csm11046877wrw.87.2023.02.08.05.51.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 05:51:21 -0800 (PST)
Message-ID: <eaaa6d53-ad35-8cf8-7823-0874b268fa88@smile.fr>
Date: Wed, 8 Feb 2023 14:51:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20220925192030.1648496-1-thomas.petazzoni@bootlin.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220925192030.1648496-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MuttMTF+H8STMh19Np/kG6QRqGQAKE9otZh2pH/1+P8=;
 b=AhefSPOsZATqxuq6NgQ/bbQuMCZsSQihdhS1mBL9T4u34p0gl6H1yfMsQrhmqQ03/c
 5BaM3RMfd+Y1swYQzHnAcg8rCvNCv4XOC86cB9NG3sdj8zw4CuEn6hVz8SyRy65if51/
 v4ietkA0hfAMxxyNACvIzNSoQ1qZnNHctqvuYRUhGaTnzFu5SEMu+HS8pL0T5tTzdbiL
 +4tA7ZWoPk4F5i4T09vnaJZcoPQv/072PNOCjFgLLQQa23IQD2YTms3iFIXIcLrGsvhZ
 MxI+CNBgl6p3GSPc++w2XWo+vv4F15IH5PjMT/JQep3k0oC6y0geRI+QsbcukIcXS2j1
 +tvQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=AhefSPOs
Subject: Re: [Buildroot] [PATCH v2 1/2] package/nodejs: add patch to adjust
 default NodeJS search path
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
Cc: Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKTGUgMjUvMDkvMjAyMiDDoCAyMToyMCwgVGhvbWFzIFBldGF6em9uaSBh
IMOpY3JpdMKgOgo+IEJ5IGRlZmF1bHQsIE5vZGVKUyBzZWFyY2hlcyBnbG9iYWwgbW9kdWxlcyBp
biAvdXNyL2xpYi9ub2RlLCBidXQgTlBNCj4gaW5zdGFsbHMgdGhlbSBpbiAvdXNyL2xpYi9ub2Rl
X21vZHVsZXMvLiBUaGVyZWZvcmUgYnkgZGVmYXVsdCwgaWYgb25lCj4gaW5zdGFsbHMgbW9kdWxl
cyB3aXRoIEJSMl9QQUNLQUdFX05PREVKU19NT0RVTEVTX0FERElUSU9OQUwsIHRoZXkgYXJlCj4g
bm90IGFjY2Vzc2libGUgYnkgTm9kZUpTLCB1bmxlc3MgYnkgcGFzc2luZyBhCj4gTk9ERV9QQVRI
PS91c3IvbGliL25vZGVfbW9kdWxlcy8gdmFyaWFibGUuIFNpbmNlIHRoaXMgaXMgbm90IG9idmlv
dXMsCj4gYW5kIGl0J3MgbmljZXIgd2hlbiB0aGluZ3Mgd29yayBvdXQgb2YgdGhlIGJveCwgd2Ug
c2ltcGx5IHBhdGNoIE5vZGVKUwo+IHRvIGxvb2sgZm9yIG1vZHVsZXMgYXQgdGhlIHJpZ2h0IHBs
YWNlLgo+IAo+IFNlZQo+IGh0dHBzOi8vc3RhY2tvdmVyZmxvdy5jb20vcXVlc3Rpb25zLzE1NjM2
MzY3L25vZGVqcy1yZXF1aXJlLWEtZ2xvYmFsLW1vZHVsZS1wYWNrYWdlCj4gZm9yIHNvbWUgZGlz
Y3Vzc2lvbnMgb24gdGhpcyB0b3BpYy4KCk5vdGU6IFRoZSBub2RlanMgcGFja2FnZSBoYXMgYmVl
biB1cGRhdGUgdG8gMTYuMTguMSBzaW5jZSB5b3VyIHYyIG9mIG5vZGVqcyBzZXJpZXMuCgpSZXZp
ZXdlZC1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+CgpCZXN0IHJlZ2Fy
ZHMsClJvbWFpbgoKCj4gCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFz
LnBldGF6em9uaUBib290bGluLmNvbT4KPiAtLS0KPiBDaGFuZ2VzIHNpbmNlIHYxOgo+IC0gU2Vh
cmNoIGZvciBib3RoIC91c3IvbGliL25vZGUgYW5kIC91c3IvbGliL25vZGVfbW9kdWxlcyBhcyBz
dWdnZXN0ZWQKPiAgIGJ5IFlhbm4KPiAtLS0KPiAgLi4udWxlcy1janMtbG9hZGVyLmpzLWFkanVz
dC1kZWZhdWx0LXBhLnBhdGNoIHwgMzYgKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hh
bmdlZCwgMzYgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9ub2Rl
anMvMDAwNC1saWItaW50ZXJuYWwtbW9kdWxlcy1janMtbG9hZGVyLmpzLWFkanVzdC1kZWZhdWx0
LXBhLnBhdGNoCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvbm9kZWpzLzAwMDQtbGliLWludGVy
bmFsLW1vZHVsZXMtY2pzLWxvYWRlci5qcy1hZGp1c3QtZGVmYXVsdC1wYS5wYXRjaCBiL3BhY2th
Z2Uvbm9kZWpzLzAwMDQtbGliLWludGVybmFsLW1vZHVsZXMtY2pzLWxvYWRlci5qcy1hZGp1c3Qt
ZGVmYXVsdC1wYS5wYXRjaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAw
MC4uNWI5Mzk5OGU1ZQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL25vZGVqcy8wMDA0
LWxpYi1pbnRlcm5hbC1tb2R1bGVzLWNqcy1sb2FkZXIuanMtYWRqdXN0LWRlZmF1bHQtcGEucGF0
Y2gKPiBAQCAtMCwwICsxLDM2IEBACj4gK0Zyb20gYTMxNDI1YmRmY2I1ZDY5NWFiMjVjM2QyOTU4
OTgzMjY3ODRjZmZlYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTogVGhvbWFzIFBl
dGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KPiArRGF0ZTogU3VuLCAyNSBT
ZXAgMjAyMiAxMToxMDowNiArMDIwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIGxpYi9pbnRlcm5hbC9t
b2R1bGVzL2Nqcy9sb2FkZXIuanM6IGFkanVzdCBkZWZhdWx0IHBhdGggdG8KPiArIHNlYXJjaCBt
b2R1bGVzCj4gKwo+ICtOUE0gaW5zdGFsbHMgbW9kdWxlcyBpbiAvdXNyL2xpYi9ub2RlX21vZHVs
ZXMvLCBidXQgYnkgZGVmYXVsdCBOb2RlSlMKPiArc2VhcmNoZXMgZm9yIHRoZW0gb25seSBpbiAv
dXNyL2xpYi9ub2RlLy4gV2UgY291bGQgYWxzbyBzZXQgdGhlCj4gK05PREVfUEFUSCBlbnZpcm9u
bWVudCB2YXJpYWJsZSwgYnV0IGl0IGlzIG1vcmUgY29udmllbmllbnQgdG8gaGF2ZQo+ICtOb2Rl
SlMgY29uZmlndXJlZCBieSBkZWZhdWx0IHRvIGZpbmQgbW9kdWxlcyB3aGVyZSB0aGV5IGFyZSBp
bnN0YWxsZWQuCj4gKwo+ICtUaGlzIGlzc3VlIGlzIGRpc2N1c3NlZCBhdAo+ICtodHRwczovL3N0
YWNrb3ZlcmZsb3cuY29tL3F1ZXN0aW9ucy8xNTYzNjM2Ny9ub2RlanMtcmVxdWlyZS1hLWdsb2Jh
bC1tb2R1bGUtcGFja2FnZS4KPiArCj4gK1NpZ25lZC1vZmYtYnk6IFRob21hcyBQZXRhenpvbmkg
PHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+Cj4gKy0tLQo+ICsgbGliL2ludGVybmFsL21v
ZHVsZXMvY2pzL2xvYWRlci5qcyB8IDMgKystCj4gKyAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4gKwo+ICtkaWZmIC0tZ2l0IGEvbGliL2ludGVybmFsL21v
ZHVsZXMvY2pzL2xvYWRlci5qcyBiL2xpYi9pbnRlcm5hbC9tb2R1bGVzL2Nqcy9sb2FkZXIuanMK
PiAraW5kZXggZjE5NzFjNDBhNC4uNWZlMzg4NDE1NiAxMDA2NDQKPiArLS0tIGEvbGliL2ludGVy
bmFsL21vZHVsZXMvY2pzL2xvYWRlci5qcwo+ICsrKysgYi9saWIvaW50ZXJuYWwvbW9kdWxlcy9j
anMvbG9hZGVyLmpzCj4gK0BAIC0xMjYxLDcgKzEyNjEsOCBAQCBNb2R1bGUuX2luaXRQYXRocyA9
IGZ1bmN0aW9uKCkgewo+ICsgICAgIHBhdGgucmVzb2x2ZShwcm9jZXNzLmV4ZWNQYXRoLCAnLi4n
KSA6Cj4gKyAgICAgcGF0aC5yZXNvbHZlKHByb2Nlc3MuZXhlY1BhdGgsICcuLicsICcuLicpOwo+
ICsgCj4gKy0gIGNvbnN0IHBhdGhzID0gW3BhdGgucmVzb2x2ZShwcmVmaXhEaXIsICdsaWInLCAn
bm9kZScpXTsKPiArKyAgY29uc3QgcGF0aHMgPSBbcGF0aC5yZXNvbHZlKHByZWZpeERpciwgJ2xp
YicsICdub2RlJyksCj4gKysgICAgICAgICAgICAgICAgIHBhdGgucmVzb2x2ZShwcmVmaXhEaXIs
ICdsaWInLCAnbm9kZV9tb2R1bGVzJyldOwo+ICsgCj4gKyAgIGlmIChob21lRGlyKSB7Cj4gKyAg
ICAgQXJyYXlQcm90b3R5cGVVbnNoaWZ0KHBhdGhzLCBwYXRoLnJlc29sdmUoaG9tZURpciwgJy5u
b2RlX2xpYnJhcmllcycpKTsKPiArLS0gCj4gKzIuMzcuMwo+ICsKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
