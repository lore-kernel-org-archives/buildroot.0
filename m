Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C363C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 21:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01617402E1;
	Tue,  7 Feb 2023 21:23:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01617402E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RKjE8JDZ0x4D; Tue,  7 Feb 2023 21:23:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC56840292;
	Tue,  7 Feb 2023 21:23:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC56840292
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3BB7A1BF377
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 21:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2241761021
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 21:23:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2241761021
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CuXrMs9J7flw for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 21:23:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7CD960B28
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A7CD960B28
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 21:23:25 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id bg26so12001793wmb.0
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 13:23:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ROR9l85LkQh/xOFQZgPDuYvnkeaHujPfoXh+nrGtxSk=;
 b=xNkqlyrDRV5q1qohkpJXlUiMP+SlPCUwo7V3NXvmKuROFpYqwz+AORzr2AxgZvX3gI
 HlbVl2UtUDSvHQHlxf7UAAx7CD/IayF/5kI9cuUSnDej5k2uZnSPEhx1NSbGVSAL+jtb
 cz2zmvxTWOvhuR1zY+ZAOMO3WL4nQMtEC7dok1FBXruRwoiybCXnIFPqqb8hfCXqeA2r
 NKGS5m8gmVC4+sdiljG15fa5hivzPjSIof3tqnNmc/zHCXEMlU1np5Z55HpDVQ0oyGiU
 1FVRPuksJq2rC/TrAcmUFwnKtc7HE4Cd1GqHAqODbIt7++5bEAkVMELQCABxFtoGDrpM
 /jIw==
X-Gm-Message-State: AO0yUKW84/CNQaLshtdMdxbLhspubTFMmw/er+ugD+fHewRIbet8JGJe
 oZvFlZ+GISpdVZJeI1NCTUA9RA==
X-Google-Smtp-Source: AK7set9y8vpxnTWwK12ziCjEkv0Njji3SRXOFFWz9Fb9IY56r2Jje5+uzdg33W9foxML30Zp5uogKA==
X-Received: by 2002:a05:600c:130f:b0:3cf:7197:e68a with SMTP id
 j15-20020a05600c130f00b003cf7197e68amr4364837wmf.18.1675805003533; 
 Tue, 07 Feb 2023 13:23:23 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a1c540c000000b003dc5b59ed7asm14987wmb.11.2023.02.07.13.23.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 13:23:23 -0800 (PST)
Message-ID: <f790d078-477b-9fb9-2df6-1c01c6e89e4c@smile.fr>
Date: Tue, 7 Feb 2023 22:23:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: fr
To: Matt Flax <flatmax@flatmax.com>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
References: <20230207175116.3043006-1-angelo@amarulasolutions.com>
 <51fbd11a-26ef-78fa-3ced-61648adc5a9f@smile.fr>
 <46eeb5ff-ea1e-acdd-3ab8-3dc945c9fa40@flatmax.com>
 <CA+_SqVb0wRKk9zFsy0-z8TzooKG4dPzOLPt1AJ7KPoWHkeQyQg@mail.gmail.com>
 <ff586649-2362-6420-4101-8babd457951b@flatmax.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <ff586649-2362-6420-4101-8babd457951b@flatmax.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ROR9l85LkQh/xOFQZgPDuYvnkeaHujPfoXh+nrGtxSk=;
 b=UdVxPRSMfnsvwidmV6/9lL26UXKuSHKDwIWxI7iBRAW/gzcKlYooJPFoufbu+kgvrZ
 7jEi87X0yvftRABi3u/kymM0wy7TNxvRQRR2sZbTVCO06MKPlqZWYfEor0rxmC1iPAz9
 mAhm6UBeKNTEfSyLUZtoIyGcwH3P03PDnJreIVFD4mei3493koTUyE5aqR/jxEcZJfRB
 tTGJ5s3e/+OGN1Oezg0H94cLImSSX1sPQDJeaDeyU3FsdtUxBBzZVYnFhM4khH7jaKnr
 r9GzP9Kn1Qd9IntV0a+8NM/Ms5F6YjDEOUF+PlBgKxUadczHukPtov+B1uodbPgERkmg
 Rh2w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=UdVxPRSM
Subject: Re: [Buildroot] [PATCH v4] package/gtkiostream: new package
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

SGVsbG8sCgpMZSAwNy8wMi8yMDIzIMOgIDIxOjU5LCBNYXR0IEZsYXggYSDDqWNyaXTCoDoKPiAK
PiBPbiA4LzIvMjMgMDc6NTAsIEFuZ2VsbyBDb21wYWdudWNjaSB3cm90ZToKPj4KPj4KPj4gT24g
VHVlLCBGZWIgNywgMjAyMyBhdCA5OjQ3IFBNIE1hdHQgRmxheCA8ZmxhdG1heEBmbGF0bWF4LmNv
bT4gd3JvdGU6Cj4+Cj4+Cj4+IMKgwqDCoCBPbiA4LzIvMjMgMDU6MDQsIFJvbWFpbiBOYW91ciB3
cm90ZToKPj4gwqDCoMKgID4gSGVsbG8gQW5nZWxvLAo+PiDCoMKgwqAgPgo+PiDCoMKgwqAgPiBM
ZSAwNy8wMi8yMDIzIMOgIDE4OjUxLCBBbmdlbG8gQ29tcGFnbnVjY2kgYSDDqWNyaXTCoDoKPj4g
wqDCoMKgID4gSXQgYWx3YXlzIHVzZWZ1bCB0byB1c2UgZGlzdHJpYnV0aW9uIHBhY2thZ2luZyB0
byBmaW5kIGFueQo+PiDCoMKgwqAgbWlzc2luZyBkZXBlbmRlbmNpZXMKPj4gwqDCoMKgID4gKG1l
bnRhdG9yeSBvciBvcHRpb25hbCkgbGlrZSBndGsyIChoZW5jZSB0aGUgcGFja2FnZSBuYW1lIDop
ICkKPj4gwqDCoMKgID4KPj4gwqDCoMKgID4KPj4gwqDCoMKgIGh0dHBzOi8vZ2l0aHViLmNvbS9m
bGF0bWF4L2d0a2lvc3RyZWFtL2Jsb2IvbWFzdGVyL2RlYmlhbi9jb250cm9sI0wxNAo+PiDCoMKg
wqAgPgo+PiDCoMKgwqAgPiBDYW4geW91IGRvdWJsZSBjaGVjayA/Cj4+Cj4+Cj4+IMKgwqDCoCBI
ZXkgYWxsLCBncmVhdCB0byBzZWUgbXkgb3JpZ2luYWwgcGF0Y2ggcmV2aXRhbGlzZWQgYWZ0ZXIg
bWFueSBtYW55Cj4+IMKgwqDCoCBtb250aHMgLSBJIGFtIGtlZW4gZm9yIGd0a2lvc3RyZWFtIHRv
IGJlIGFic29yYmVkIGludG8gYnVpbGRyb290Lgo+Pgo+PiDCoMKgwqAgZ3RrMiBhbmQgZ3RrMyBh
cmUgb3B0aW9uYWwgd2l0aCB0aGlzIGxpYnJhcnkgLSBkZXNwaXRlIGl0cyBuYW1lIC0KPj4gwqDC
oMKgIGl0IGlzCj4+IMKgwqDCoCByZWFsbHkgbm93IGZvY3VzZWQgb24gc2lnbmFsIHByb2Nlc3Np
bmcsIEFMU0EgQysrLCBuZXVyYWwgbmV0d29ya3MsCj4+IMKgwqDCoCBzb2Z0d2FyZSBlbmdpbmVl
cmluZywgZXRjLi4gVGhlIGd0ayBzaWRlIG9mIHRoaW5ncyB3b3JrcyBuaWNlbHkgd2l0aAo+PiDC
oMKgwqAgZ3RrMiBidXQgcmVxdWlyZXMgYXR0ZW50aW9uIGZvciBndGszIC0gSSBvcmlnaW5hbGx5
IG9wdGVkIHRvIGxlYXZlCj4+IMKgwqDCoCBndGsyLzMgb3V0IGVudGlyZWx5IGluIGJ1aWxkcm9v
dCAtIEkgdGhpbmsgaXQgaXMgdGhlIGJlc3Qgc29sdXRpb24KPj4gwqDCoMKgIGZvciBub3cuCj4+
Cj4+Cj4+IFRoYW5rcyBNYXR0IGZvciB0aGUgdmVyeSBjbGVhciBleHBsYW5hdGlvbiwgSSB3YXMg
YWJvdXQgdG8gcmVwbHkgZ3RrIGlzIG9wdGlvbmFsLgo+Pgo+PiBFdmVuIG1vcmUgYmVjYXVzZSBp
dCByZXF1aXJlcyB0aGUgYWRkaXRpb24gb2YgbGliZ3RrZGF0YWJveCB3aGljaCBpcyBhY3R1YWxs
eQo+PiBub3QgcHJlc2VudCBpbiBidWlsZHJvb3QuCj4+Cj4+IExvb2tpbmcgYXQgdGhlIGNvZGUs
IEl0J3Mgbm90IGNsZWFyIGlmIG9wZW5jdiBvciBzb3ggYXJlIHJlYWxseSB0aGF0IG5lY2Vzc2Fy
eQo+PiB3aXRob3V0IGEgZ3VpLCBidXQgSSB0aGluayB3ZSBjb3VsZCBsZWF2ZSB0aGVtIG91dC4K
Pj4KPiAKPiBJbmRlZWQuIG9wZW5jdiBpcyBhbiBpbWFnZSBwcm9jZXNzaW5nIHRoaW5nLiBTb3gg
dGhlIGF1ZGlvIHByb2Nlc3NpbmcgbGlicmFyeSBvbgo+IHRoZSBvdGhlciBoYW5kIGlzIGdyZWF0
IHRvIGhhdmUgaW4sIGJ1dCBub3Qgc3RyaWN0bHkgbmVjZXNzYXJ5Lgo+IAo+IFRoYW5rcyBmb3Ig
cmV2aXRhbGlzaW5nIHRoaXMgcGF0Y2guCgpUaGFua3MgZm9yIGV4cGxhbmF0aW9ucyEKCkJlc3Qg
cmVnYXJkcywKUm9tYWluCgoKPiAKPiBNYXR0Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
