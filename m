Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A019EC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 21:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B0BF41E62;
	Thu,  9 May 2024 21:28:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lHQhShKiqGzZ; Thu,  9 May 2024 21:28:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0799541E87
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0799541E87;
	Thu,  9 May 2024 21:28:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8F67A1BF427
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 21:28:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D1994151B
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 21:28:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZDX33_FeeYML for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 21:28:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::729; helo=mail-qk1-x729.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 02F2D410B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02F2D410B9
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 02F2D410B9
 for <buildroot@buildroot.org>; Thu,  9 May 2024 21:28:53 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-78f05e56cb3so71283085a.1
 for <buildroot@buildroot.org>; Thu, 09 May 2024 14:28:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715290133; x=1715894933;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ECjiI/YYp3m5OaSaDuKrXG5vocX8bTKnJ/IieEF4xpg=;
 b=XHCvUQBezAOFg45OsrJfEYtES/UC5cr1XAS+x+Lb8ytgXpvtu8saF/PirOqy60mUX7
 8ATeWq8qicKcYLXTnmFb/VeMTFZGjaBz5t6OOYeUt5Zfnte7SABxl9uBiHxo9UbIfc0P
 N4foEvh06yq8sZRMSZQE+SEPhnuVd+v10j7Lj5TTuAoHSvMyr6srsdMSjH3om14BrOVy
 i/9Zw6/haFNcikIlLWFbBkYdG9t7oVUIUMFNLniOLC3V7ixN24Pezl3RXyxiDvx88U0y
 B6fXyJRELwNodjj2LvJX/9w6xJxweqMx964chqnahJtIRrz+F4KOEzL6ui4XJFvljw4i
 6ODA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZ1MJx7OkyNCR/mS/DeyQo4c30C4Xx2ZRLLqgT8Q6DS5BDrBaR16YR9xe8ysJKn4foy9Afbg58Y7V3yJT4mTyeS60/ysGiFg==
X-Gm-Message-State: AOJu0YwRSR4H5v47bQ2iuuKbtcaZxyiiEDKJuWAvyEht+pmjUcbU4xMa
 o16Jo9VjNggqOYnfY0fAoktaUVnzfWZm0j7tlBV1MBI9/4PlrR7FcQayytBlPn/P7DBnBuF3EuD
 hVQ251hdobAh2wmNDYsbjDuNTE5g8NoXC
X-Google-Smtp-Source: AGHT+IFzmxrm+o8PSDVgNp6mOFA9Z07B4HXaw+FhQirLkNHT0z+On/EtOqxqxphXipQuWqo0RLqWDFfRdny1sdHLnq8=
X-Received: by 2002:a05:622a:2288:b0:439:a5b2:5e94 with SMTP id
 d75a77b69052e-43dfdababd6mr7431521cf.13.1715290132648; Thu, 09 May 2024
 14:28:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240407115439.872167-1-fontaine.fabrice@gmail.com>
 <aba84998-3aca-4a42-b1ee-40ccf82fc80e@mind.be>
 <CAPi7W828vTKG5W6=e9RvFMLC=0gge42GnQTNrr4m4qs2yNGfmQ@mail.gmail.com>
 <20240509184648.5a3719f4@windsurf>
 <9e8a2daf-327b-4d22-88a6-fda7b38d4d78@mind.be>
In-Reply-To: <9e8a2daf-327b-4d22-88a6-fda7b38d4d78@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 9 May 2024 15:28:39 -0600
Message-ID: <CADvTj4pRXiPoCs1c=QEo4b+5gNV3+u8xDXHwHOPGJDUSr72okw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715290133; x=1715894933; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ECjiI/YYp3m5OaSaDuKrXG5vocX8bTKnJ/IieEF4xpg=;
 b=hiJbckvC9+UbbvGDDKFnykOMSMskTrEMK+MZXg4w/rbKbZs2PrVHnC+pWNlPZHXqms
 IgZp1H4IOcPF7cfW5kfERHgeKiHh30xoMMa5mT5XWUpfECW84/P39wWiZjEFqrybfS11
 4xL1X+XYPbpqX6a2GiuLawBna7WlYotvKpFan9nSvxWUskoY6whXmLi/Q+f/zpu+RC4i
 cRFsKRsByD0b5W7lDlumsoHBSM+wJbmIu7f/x9AylgKb1aKXg55q5e09pk/z55OPos8J
 M8xGj2b46mb3wyEthDuxcFoAJIfaJq5/p4ae5UdqUYnBvekU+VKeWNeN9iQWv3QLJrjC
 tlNQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hiJbckvC
Subject: Re: [Buildroot] [PATCH 1/1] package/python-remi: fix pep517 build
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Vincent Fazio <vfazio@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCBNYXkgOSwgMjAyNCBhdCAyOjU04oCvUE0gQXJub3V0IFZhbmRlY2FwcGVsbGUgPGFy
bm91dEBtaW5kLmJlPiB3cm90ZToKPgo+Cj4KPiBPbiAwOS8wNS8yMDI0IDE4OjQ2LCBUaG9tYXMg
UGV0YXp6b25pIHdyb3RlOgo+ID4gSGVsbG8sCj4gPgo+ID4gV291bGQgYmUgZ29vZCB0byBnZXQg
c29tZSBpbnB1dCBmcm9tIFB5dGhvbiBleHBlcnRzIGhlcmUuIEphbWVzPyBWaW5jZW50Pwo+ID4K
PiA+IE9uIFN1biwgNyBBcHIgMjAyNCAyMTo1ODo0NSArMDIwMAo+ID4gRmFicmljZSBGb250YWlu
ZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+Pj4gICAgSWYgdGhl
IHBhY2thZ2UgX2RvZXNfIGJ1aWxkIHdpdGhvdXQgc2V0dXB0b29sc19zY20sIGl0IG1lYW5zIHRo
YXQgdGhlCj4gPj4+IHNldHVwLmNmZyBpcyB3cm9uZy4gU28gYW4gdXBzdHJlYW0gcGF0Y2ggdG8g
Zml4IHRoYXQgd291bGQgYmUgYmV0dGVyLi4KPiA+Pgo+ID4+ICBGcm9tIG15IHVuZGVyc3RhbmRp
bmcsIHVwc3RyZWFtIHVzZXMgc2V0dXB0b29sc19zY20gdG8gcmV0cmlldmUgdmVyc2lvbiBzaW5j
ZQo+ID4+IGh0dHBzOi8vZ2l0aHViLmNvbS9yYXdweXRob24vcmVtaS9wdWxsLzQwNC9jb21taXRz
L2YyNzYzMDcyMWQyYmJjZmJjZTUxNWRjMmU2YmUzMTY3ZjZhMDZhMzQKPiA+Pgo+ID4+IFNvIHNl
dHVwdG9vbHNfc2NtIGlzIG5vdCAic3RyaWN0bHkiIG5lZWRlZC4KPiA+Pgo+ID4+IEkgdXNlZCAt
LXNraXAtZGVwZW5kZW5jeS1jaGVjayBiZWNhdXNlIGl0IGlzIGFscmVhZHkgZG9uZSBpbiA2IG90
aGVyCj4gPj4gcGFja2FnZXMgc2luY2UgY29tbWl0IDg5MzdkYjhkZDU5NWUwOTg4NzUxZTVkYmI1
NjhlODcwYjA3YjM5Y2MKPiA+Cj4gPiBCdXQgaXNuJ3QgaXQgc3VwZXIgY3JhcHB5IHRvIHNraXAg
dGhlIGRlcGVuZGVuY3kgY2hlY2tzPyBJIG1lYW4gdGhlICMxCj4gPiBpc3N1ZSB0aGF0IEJ1aWxk
cm9vdCB0cmllcyB0byBkZWFsIHdpdGggYXJlIGRlcGVuZGVuY2llcyBvZiBwYWNrYWdlcy4KPiA+
IFNvIGlmIHdlIGFzayB0aGVtIHRvIHRoZW4gc2tpcCB0aGVpciBkZXBlbmRlbmN5IGNoZWNrcywg
aG93IHdpbGwgd2UKPiA+IG1ha2Ugc3VyZSB0aGF0IGFsbCBuZWNlc3NhcnkgZGVwZW5kZW5jaWVz
IGFyZSBpbnN0YWxsZWQ/Cj4gPgo+ID4gSSB1bmRlcnN0YW5kIHRoYXQgc2V0dXB0b29sc19zY20g
bWF5IG5vdCBiZSBzdHJpY3RseSBuZWVkZWQsIGJ1dCBieQo+ID4gcGFzc2luZyAtLXNraXAtZGVw
ZW5kZW5jeS1jaGVjaywgZG9uJ3Qgd2UgYWxzbyBza2lwIGNoZWNraW5nIG90aGVyCj4gPiBpbXBv
cnRhbnQvbWFuZGF0b3J5IGRlcGVuZGVuY2llcz8KPgo+ICAgVGhlb3JldGljYWxseSBJIGFncmVl
LiBIb3dldmVyLCBJSVVDLCB0aGUgZGVwZW5kZW5jaWVzIHRoYXQgYXJlIGNoZWNrZWQgYXJlCj4g
dXN1YWxseSBfcnVudGltZV8gZGVwZW5kZW5jaWVzIGFueXdheSwgc28gd2UgZG9uJ3QgaGF2ZSBp
dCBhcyBhbiBhY3R1YWwKPiBkZXBlbmRlbmN5LiBTbyBJIHRoaW5rIHRoZSBkZXBlbmRlbmN5IGNo
ZWNrcyBhcmUgcHJvYmFibHkgZmFpcmx5IHVzZWxlc3MgZm9yIHVzLgoKVGhlIHBlcDUxNyBpbmZy
YXN0cnVjdHVyZSB3ZSB1c2UgZG9lcyBub3QgY2hlY2sgcnVudGltZSBkZXBlbmRlbmNpZXMsCm9u
bHkgYnVpbGQgZGVwZW5kZW5jaWVzLgoKSSB0aGluayBpdCdzIGJlc3QgdG8ganVzdCBhZGQgdGhl
IGhvc3QtcHl0aG9uLXNldHVwdG9vbHMtc2NtIGRlcGVuZGVuY3kgaW4KdGhpcyBjYXNlLiBJTU8g
d2Ugc2hvdWxkIG5vdCB1c2UgLS1za2lwLWRlcGVuZGVuY3ktY2hlY2sgd2l0aG91dCBhIGdvb2QK
cmVhc29uIGFzIHRoaXMgY2FuIHJlc3VsdCBpbiBweXRob24gcGFja2FnZXMgdXNpbmcgbm9uLWlk
ZWFsIGZhbGxiYWNrCmNvZGVwYXRocyhpLmUuIHBhY2thZ2VzIG1heSBidWlsZCB3aXRob3V0IG9w
dGltaXphdGlvbnMgaWYgY2VydGFpbiBidWlsZApkZXBlbmRlbmNpZXMgYXJlIG1pc3NpbmcpLgoK
Tm90ZSB0aGF0IHNjYW5weXBpIGNoZWNrcyBydW50aW1lIGRlcGVuZGVuY2llcyBidXQgaXMgcHJv
YmFibHkgbm90IHRoYXQKcmVsaWFibGUgYXQgdGhlIG1vbWVudC4KCj4KPiAgIElkZWFsbHksIHRo
ZXJlIHdvdWxkIGJlIGEgd2F5IHRvIGRvIGEgZGVwZW5kZW5jeSBjaGVjayBvbiBvdXIgcnVudGlt
ZQo+IGRlcGVuZGVuY2llcywgYnV0IHRoYXQgY2FuJ3QgcG9zc2libHkgYmUgZG9uZSBieSBhbnl0
aGluZyB1cHN0cmVhbS4KPgo+ICAgUmVnYXJkcywKPiAgIEFybm91dApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
