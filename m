Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5688C52D70
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 16:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 187184038B;
	Tue,  6 Aug 2024 16:44:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LadqIYNaTb27; Tue,  6 Aug 2024 16:44:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6927540325
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6927540325;
	Tue,  6 Aug 2024 16:44:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B9FD01BF32A
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 16:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A7BAE607B8
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 16:44:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2aNf6DmuBLb5 for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 16:44:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a30; helo=mail-vk1-xa30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5FE726079F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FE726079F
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com
 [IPv6:2607:f8b0:4864:20::a30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5FE726079F
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 16:44:06 +0000 (UTC)
Received: by mail-vk1-xa30.google.com with SMTP id
 71dfb90a1353d-4f6abcf0567so349424e0c.0
 for <buildroot@buildroot.org>; Tue, 06 Aug 2024 09:44:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722962645; x=1723567445;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gac5nJvSvshV1d0vHIg8M17voGurdPKFnqVsTsKvt7k=;
 b=Pidxdz8TkR2yafHGabqRp5mQydQuLjDy/QnafSLnuPsklpoJleWLeQOr6C5qncEs2p
 zp/qnuld7KHS6Fe5IzjyB24ibLJkiAcIHwpwZrDt2BVjew1IIZDt9hCm44hnk7Zs/UJ9
 rR1jf0xXEbXAQhZspuis2Dlr+LhLtJDdLzG5TNXrGfQ52E/jXDEcCAfJDxrCNNa4oCVb
 Bm3HVSbYByHa6fEKtu2lMaIZyVqFNuYcg2FqJ9suW0rJucFX7m8kz8YSX+/vfuEKLKWL
 CL5qhQv7EqY//DGDwAOJpYPo6d2bRo7C2hnzS7g4XxfhfkJ11dMYw6aNCoUIt1zI3Kse
 bGjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpDHIlLGYkRdijh1iZ8xtthcXCf3883xIGyQwpDmcbZvGePD9avEYu9ji8xRvLIBQ+cTgcW4ORhtadQSFeuefkDfZOBdhYGg==
X-Gm-Message-State: AOJu0YyjNRzCwoQyradMYNZpqWWEoBV4lwVC8039KVt/AN0jlhOVEepg
 Lukj38EpR+jGRGPW4zF3hx/BZT/D9tyPk/ywzE1mzY8Pgxr5jtChtTVhg9PS3X0DqVUbcJT0eKR
 vuUnOTEEkZOfKiCFsVIeh5NQcrMTSbdcQq4T/5A==
X-Google-Smtp-Source: AGHT+IH1zi67z99bET73QiRypsPNugPmvksTEKJFQUP8X4yaVLsbAfJCqY9hZnx16WK2++sj04lFUQdObARyhXtByY8=
X-Received: by 2002:a05:6122:4105:b0:4df:1d06:eeb7 with SMTP id
 71dfb90a1353d-4f89ff1625emr17978214e0c.1.1722962644865; Tue, 06 Aug 2024
 09:44:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240805163133.4126564-1-james.hilliard1@gmail.com>
 <CA+h8R2oQGKFFH-vMX27WUO1uEAGyt4cz9MCwn9Cofwyujx1xDA@mail.gmail.com>
 <20240805223152.09ed915b@windsurf>
 <CADvTj4o_CnzCth+QqoxhVovBRinvYfbMf7r+SWnnY0tfVbKgbw@mail.gmail.com>
 <CA+h8R2obsR-CzMhWDpQ-A0oeEPaG-P=aCwF7BS4J-3eShmHJgg@mail.gmail.com>
 <20240806165050.234235b4@windsurf>
 <CADvTj4pOK8-2YXy0POUg1qOKa1MrjsxbnS-r1F7YMk_YXFmEAQ@mail.gmail.com>
 <CA+h8R2reErtSWPO1hGpX7tT5Xejb_SNqiuSCnXvJZKHwhzdcZg@mail.gmail.com>
In-Reply-To: <CA+h8R2reErtSWPO1hGpX7tT5Xejb_SNqiuSCnXvJZKHwhzdcZg@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 6 Aug 2024 10:43:53 -0600
Message-ID: <CADvTj4pTnPfJtpyiwzvRUo4gUpuaBBOw3PfT4gbOA06LDjQ+NQ@mail.gmail.com>
To: Christian Stewart <christian@aperture.us>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722962645; x=1723567445; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gac5nJvSvshV1d0vHIg8M17voGurdPKFnqVsTsKvt7k=;
 b=WfAifoGtB4CUtlUNEb8yoT9nxhP6yqH0kSbJhhmS8fVvUByoCy+5pfCClmCVSKAB/D
 S5fm9GH36tq6iGvjYYKw7ymEVSjoAzmQnREpevXEtUaf0dwXq9T+9NYtBlgeL6yyBt8r
 V+ml6mi/Dp4inlA6oNXdYHpwjI8+fIi6gdQS4GkU8934Y8ZezBEGFeyIY5f0lOGRtQ3b
 dotVu7DzH88+vGjsvxhgZPrW3+iYSwtPNNt9FIjTVdgPD3AqnmRDqqIuvkG6S9kBDxEp
 z8o4Y+ec/EEegJYG9M2jA1DcRG5/m6pcqVlf8qBCyNxjB9iUJ3sTrxjR+1MefzIZDDJ9
 voHA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WfAifoGt
Subject: Re: [Buildroot] [PATCH v4 1/2] package/pkg-golang.mk: allow
 packages to override download GOPROXY
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
Cc: Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Christian Stewart via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBBdWcgNiwgMjAyNCBhdCAxMDoxNOKAr0FNIENocmlzdGlhbiBTdGV3YXJ0IDxjaHJp
c3RpYW5AYXBlcnR1cmUudXM+IHdyb3RlOgo+Cj4gVGhvbWFzLCBKYW1lcywKPgo+IE9uIFR1ZSwg
QXVnIDYsIDIwMjQsIDg6NDnigK9BTSBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdt
YWlsLmNvbT4gd3JvdGU6Cj4+Cj4+IE9uIFR1ZSwgQXVnIDYsIDIwMjQgYXQgODo1MOKAr0FNIFRo
b21hcyBQZXRhenpvbmkKPj4gPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+
PiA+Cj4+ID4gT24gTW9uLCA1IEF1ZyAyMDI0IDE4OjA3OjM3IC0wNzAwCj4+ID4gQ2hyaXN0aWFu
IFN0ZXdhcnQgPGNocmlzdGlhbkBhcGVydHVyZS51cz4gd3JvdGU6Cj4+ID4KPj4gPiA+IE15IHN1
Z2dlc3Rpb24gaXMgdG8gZWl0aGVyIHNldCBHT1BST1hZPWRpcmVjdCBmb3IgYWxsIHBhY2thZ2Vz
LCBvciBmb3IKPj4gPiA+IG5vbmUgb2YgdGhlbS4KPj4gPiA+Cj4+ID4gPiBXZSBjb3VsZCBkZWZh
dWx0IHRvIHNldHRpbmcgR09QUk9YWSB0byBlbXB0eSwgd2hpY2ggdXNlcyB0aGUgZGVmYXVsdAo+
PiA+ID4gR29vZ2xlIHByb3h5Lgo+Pgo+PiBXaHkgd2VyZW4ndCB3ZSBqdXN0IHVzaW5nIHRoZSBk
ZWZhdWx0IHNldHRpbmdzIGluIHRoZSBmaXJzdCBwbGFjZT8gSSBtZWFuCj4+IGlmIHVwc3RyZWFt
cyBiYXNpY2FsbHkgb25seSB0ZXN0IHdpdGggZGVmYXVsdCBzZXR0aW5ncyBoZXJlIHRoZW4gdXNp
bmcKPj4gc29tZXRoaW5nIGRpZmZlcmVudCBzZWVtcyBwcm9ibGVtYXRpYyBpbiBnZW5lcmFsLgo+
Pgo+Pgo+PiBUaGVyZSdzIHJlcG9ydHMgdGhhdCBHT1BST1hZPWRpcmVjdCBpcyBraW5kYSBicm9r
ZW46Cj4+IGh0dHBzOi8vZHJld2RldmF1bHQuY29tLzIwMjEvMDgvMDYvZ29wcm94eS1icmVha3Mt
Z28uaHRtbAo+Pgo+PiA+Cj4+ID4gQ291bGQgeW91IGV4cGxhaW4gdG8gYSBHbyBpZ25vcmFudCBs
aWtlIG1lIGhvdyBpcyB0aGlzIHByb3h5IHRoaW5nCj4+ID4gaGVscGluZyBpbiBzb2x2aW5nIHRo
aXMgaXNzdWU/IFNob3VsZCBhIHByb3h5IGp1c3QgInNwZWVkIHVwIiB0aGUKPj4gPiBkb3dubG9h
ZD8gV2h5IGRvZXMgaXQgZXhoaWJpdCBhIGRpZmZlcmVudCBiZWhhdmlvciBiZXR3ZWVuIGEKPj4g
PiBHT1BST1hZPWRpcmVjdCBidWlsZCBhbmQgYSBHT1BST1hZPXNvbWV0aGluZ2Vsc2UgPwo+Pgo+
PiBQcmVzdW1hYmx5IHRoZSBwcm94eSBhY3RzIGFzIGEgY2FjaGUgd2hpY2ggcHJldmVudHMgYnJl
YWthZ2UgaWYKPj4gdGhlIGRlcGVuZGVuY3kgZGlyZWN0IHNvdXJjZSBjaGFuZ2VzIG9yIHNvbWV0
aGluZyBsaWtlIHRoYXQuCj4KPgo+IFRoZSByZWFzb25pbmcgZm9yIHVzaW5nIEdPUFJPWFk9ZGly
ZWN0IGlzIGFzIGZvbGxvd3M6Cj4KPiBXaGVuIHdlIGVuYWJsZSB0aGUgcHJveHksIHRoZSBHbyB0
b29sIHdpbGwgZG93bmxvYWQgdGhlIHNvdXJjZXMgZm9yIHRoZSBkZXBlbmRlbmNpZXMgZnJvbSBH
b29nbGUuCj4KPiBUaGlzIGlzIE9LIGluIGdlbmVyYWwsIGJ1dCBpbiB0aGUgY29udGV4dCBvZiBi
dWlsZHJvb3Qgd2UgdHlwaWNhbGx5IGRvd25sb2FkIHNvdXJjZXMgZnJvbSB0aGVpciB1cHN0cmVh
bSByZWxlYXNlcyBvciBHaXQgcmVwb3NpdG9yaWVzLgoKRm9yIGNhcmdvIHdoaWNoIEkgdGhpbmsg
aXMgdGhlIG1vc3Qgc2ltaWxhciB0byBob3cgd2UgaGFuZGxlIGRlcGVuZGVuY2llcwpmb3IgZ29s
YW5nIHdlIHZlbmRvciBkZXBlbmRlbmNpZXMgZnJvbSBodHRwczovL2NyYXRlcy5pby8gZG93bmxv
YWRzIEFGQUlVLgoKU28gSSBkb24ndCB0aGluayBpdCdzIG5vcm1hbCBmb3IgdXMgdG8gZG93bmxv
YWQgdmVuZG9yZWQgc291cmNlcyBmcm9tIHRoZWlyCnVwc3RyZWFtIGxvY2F0aW9ucyBkaXJlY3Rs
eS4KCj4KPiBHT1BST1hZIGlzIG5vdCBicm9rZW4uCj4KPiBUaGF0IHNhaWQsIGEgbG90IG9mIGRl
cGVuZGVuY2llcyBjYXVzZSBwcm9ibGVtcyB3aGVuIHRoZXkgY2hhbmdlIHdoYXQgdGFnIGEgZ2l0
IHJlbGVhc2UgcG9pbnRzIHRvIHJldHJvYWN0aXZlbHkgKHJhcmUgYnV0IGhhcHBlbnMpLCBvciBk
ZWxldGUgYSBvbGRlciBjb21taXQgZnJvbSB0aGVpciByZXBvc2l0b3J5ICh3aGljaCBoYXBwZW5z
IGV4dHJlbWVseSByYXJlbHkpLgo+Cj4gVGhlIHByb3h5IHNtb290aHMgdGhpcyBvdmVyIGJ5IGFs
d2F5cyBzZXJ2aW5nIHRoZSBzYW1lIHRoaW5nIGZvciBhIGdpdCB0YWcgb3IgY29tbWl0IGhhc2gu
CgpTbyB1cHN0cmVhbXMgc2VlbSB0byBleHBlY3QgdGhpcyBjYWNoaW5nIGJlaGF2aW9yLgoKPgo+
IFRoZSBwcm9ibGVtIHdpdGggdGhpcyBpcywgbm93IHdlIGhhdmUgc29tZXRoaW5nIGRpZmZlcmVu
dCBiZWluZyByZXR1cm5lZCBmb3IgYSBkZXBlbmRlbmN5IHRoYW4gd2hhdCBpdCBzYXlzIGluIGdv
Lm1vZC4KPgo+IFRoZSBnby5tb2QgbWlnaHQgc2F5IHdlIGFyZSBmZXRjaGluZyBmb28gYXQgdmVy
c2lvbiAxLjAuMCwgYnV0IGluIGZhY3QsIGlmIHlvdSBnbyB0byB0aGUgcmVwb3NpdG9yeSBmb3Ig
Zm9vLCBhbmQgZ28gdG8gdmVyc2lvbiAxLjAuMCwgaXQgY291bGQgYmUgYSBjb21wbGV0ZWx5IGRp
ZmZlcmVudCBzb3VyY2UgdHJlZSBmcm9tIHRoZSBvbmUgd2UgZ2V0IGluIHRoZSBwcm94aWVkIGRv
d25sb2FkLgo+Cj4gVGhpcyBvcGVucyB1cCB0aGUgb3Bwb3J0dW5pdHkgZm9yIGJhZCBhY3RvcnMg
dG8gaGlkZSBjb2RlIGluIHRoZSBwcm94aWVkIHZlcnNpb24gYW5kIHRoZW4gcmV0cm9hY3RpdmVs
eSBjaGFuZ2UgdGhlIGdpdCB0YWcgdG8gaGlkZSB0aGF0IGJhZCBjb2RlLgoKSSBtZWFuLCB0aGUg
ZGVwZW5kZW5jaWVzIGFyZSBhbGwgbG9ja2VkIHRvIHRoZSB1cHN0cmVhbSBoYXNoZXMgZWl0aGVy
IHdheS4KCj4KPiBGb3IgdGhpcyByZWFzb24gdGhlIGRlZmF1bHQgd2FzIHNldCB0byBhbHdheXMg
dXNlIEdpdCB0byBmZXRjaCB0aGUgZGVwZW5kZW5jaWVzIGZvciBCdWlsZHJvb3QgYXMgd2Ugd291
bGQgcHJlZmVyIHRvIGRldGVjdCB0aGUgbWlzbWF0Y2ggYW5kIGRlYWwgd2l0aCBpdCB1cCBmcm9u
dCwgcG9zc2libHkgZmFsbGluZyBiYWNrIHRvIGZldGNoaW5nIHRoZSAudGFyLmd6IGZyb20gb3Vy
IG93biBtaXJyb3IsIHJhdGhlciB0aGFuIGRlcGVuZCBvbiB0aGlzIGJlaGF2aW9yIGZyb20gdGhl
IEdvb2dsZSBwcm94eSB0byBhbHdheXMgYmUgdGhlcmUgYW5kIHNhdmUgdXMuCgpJIGRvbid0IHJl
YWxseSBzZWUgYW55dGhpbmcgd3Jvbmcgd2l0aCB1c2luZyBnb29nbGUgaWYgdGhhdCdzIHdoYXQg
YWxsCnVwc3RyZWFtcyBzZWVtIHRvIGV4cGVjdC4KCj4KPiBBcyB5b3UgY2FuIHNlZSB3ZSBoYXZl
IG5ldmVyIGhhZCBhbiBpc3N1ZSB3aXRoIHRoaXMgc2V0dGluZyB1bnRpbCBub3csIHdoZW4gd2Ug
aGF2ZSBhbiBhY3R1YWwgYnJva2VuIGRlcGVuZGVuY3kgc29tZXdoZXJlLCBhbmQgaXRzIHdoZW4g
d2UgYXJlIGFkZGluZyB0aGUgcGFja2FnZSwgbm90IHJldHJvYWN0aXZlbHksIHRoYXQgdGhlIGlz
c3VlIGlzIGZvdW5kIGFuZCBzb2x2ZWQuCgpXZSBhbHNvIGRvbid0IHNlZW0gdG8gaGF2ZSBhIGxv
dCBvZiBnb2xhbmcgcGFja2FnZXMuCgo+Cj4gVGhpcyBpcyBteSBwaXRjaCBmb3Iga2VlcGluZyBH
T1BST1hZPWRpcmVjdC4gSWYgd2Ugd2FudCB0byB1c2UgdGhlIEdvb2dsZSBwcm94eSB3aXRoIGFs
bCB0aGUgY2F2ZXRzIEkgbWVudGlvbmVkIGFib3ZlLCB3ZSBjb3VsZCBhZGQgdGhlIG9wdGlvbiBI
T1NUX0dPX0dPUFJPWFkgYW5kIGRlZmF1bHQgaXQgdG8gdGhlIEdvb2dsZSBwcm94eS4gQnV0IHBl
cnNvbmFsbHkgSSB3aWxsIHN0aWxsIGFsd2F5cyBvdmVycmlkZSB0aGlzIHZhbHVlIHRvIGRpcmVj
dCBpbiBteSBwcm9qZWN0cy4KCkknbSBub3Qgc2VlaW5nIG11Y2ggZGlmZmVyZW5jZSB3aGVuIHRo
ZSB1cHN0cmVhbSBwcm9qZWN0IGlzIHVzaW5nIGhhc2gKYmFzZWQgZGVwZW5kZW5jeSBsb2NrIGZp
bGVzIGhvd2V2ZXIsIGxpa2UgYXMgbG9uZyBhcyB0aGUgaGFzaGVzIG1hdGNoCndlIGtub3cgd2Ug
aGF2ZSB0aGUgc291cmNlcyBzcGVjaWZpZWQgYnkgdGhlIHVwc3RyZWFtLiBJZiB0aGUgdXBzdHJl
YW0KaXRzZWxmIGNhbid0IGJlIHRydXN0ZWQgdGhlbiB0aGF0J3MgYSB3aG9sZSBkaWZmZXJlbnQg
aXNzdWUgSU1PIGFuZCB0aGUKR09QUk9YWSBzZXR0aW5ncyB3b24ndCBtYWtlIG11Y2ggb2YgYSBk
aWZmZXJlbmNlIHRoZXJlLgoKPgo+IEZvciBub3cgd2UgY2FuIGp1c3QgaW5jbHVkZSB0aGUgbGF0
ZXN0IGNvbW1pdCBoYXNoIG9mIHRhaWxzY2FsZSB1bnRpbCB0aGV5IG1ha2UgYSBuZXcgcmVsZWFz
ZSBhbmQgbm90aGluZyBlbHNlIG5lZWRzIHRvIGJlIGNoYW5nZWQuCgpJTU8gc3dpdGNoaW5nIHRv
IHRoZSBkZWZhdWx0IEdPUFJPWFkgc2V0dGluZ3MgaXMgcHJvYmFibHkgYmVzdC4KCkknbSBzb21l
d2hhdCB3YXJ5IG9mIHVzaW5nIGEgY29tbWl0IGhhc2ggZm9yIHNvbWV0aGluZyBsaWtlIHRhaWxz
Y2FsZQp3aGljaCBpbnRlcmZhY2VzIHdpdGggYW4gZXh0ZXJuYWwgc2VydmljZS4KCj4KPiBUaGFu
a3MsCj4gQ2hyaXN0aWFuIFN0ZXdhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
