Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C350C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 22:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4225783FB6;
	Wed,  5 Feb 2025 22:09:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nwmJCskynARB; Wed,  5 Feb 2025 22:09:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35C0D83FAD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35C0D83FAD;
	Wed,  5 Feb 2025 22:09:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4763EE1
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 22:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 420294135D
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 22:09:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2e5yValOgiHi for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 22:09:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=markus.mayer@broadcom.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A04344135C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A04344135C
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A04344135C
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 22:09:03 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ab7515df1faso52094266b.2
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 14:09:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738793342; x=1739398142;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QrWpOwPo5Zn8HXg5y8IkKvcePmAXVdjYAR+tMziEC7Y=;
 b=RxCQfCyiGUI1ySXmnHDX+zXATDKGJCm8KMMskFKp0dqsdLN97LH/TSKOjXuqhKVKDM
 coetknj+Y6eh+mwF7ydFRRnZheYmuqVZYfSulkuQQ2t2DpRYyvDJQvKyls2uLXngnCkw
 2srwhvHLyG6QoRDkhdme1skrPrFDpvKGpytTkJ1+6I6ukCKkf/06pS5Ve4VMSOrJfvnF
 dZmHsB9FsVjL1M+2nbNDmUxymJdcfzOWWJvG5XyfNgrGFPK8NygZjMr+xdHRP/kUzt6y
 0+dG5Zv5Ye1Wq2aBVHMKVm6n2H8yv9oQYtxVUHD58q5yslhmW9eOc6GhhvPj5euOgJl2
 IC9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4zyWwokauI/YbT4e7MEgvwNkhYrfMMLv7zUMqVezGekrKd5JHn01nFgxPk6f+vaWGrhepPxh+RtE=@buildroot.org
X-Gm-Message-State: AOJu0YxF3UHvS/HFtR24u+742MHkyGc8b7cAZ0CxnG2iohwWZEpwvQpo
 zhZFQ45DGFjWW4zD8RJUP5wAliIvPPB3kaYPBewfccLBhHdsPFtnJPJrGtzuUynw5Dhzw3M35BM
 mnJn/Ed4gRDj4gnN2tz3oGThL1WfBoxnPMxVf
X-Gm-Gg: ASbGncvnBJmO1wmkcgQoUCXilFPq7ZRy5NOuzZ2jhVoPiu+1SLEPuPvyee+SlcP4lk4
 Ju69UDNo92p7KLF02NP37MUmCGPhUFAoGOiwikw2ntJ4yFhRy5ouV4Ka4geFXB3E3RExxJtY=
X-Google-Smtp-Source: AGHT+IExgG4OafFALpC3xrDKPHxCH7MF1HTJXxIfNzoAYDFe+N+lMX1mXsQq6viD18y46Er2J6oHexUdm68NN0r3EZs=
X-Received: by 2002:a17:907:2d92:b0:ab2:dc73:34bd with SMTP id
 a640c23a62f3a-ab75e36430amr427154466b.48.1738793340193; Wed, 05 Feb 2025
 14:09:00 -0800 (PST)
MIME-Version: 1.0
References: <20250127215356.3175741-1-mmayer@broadcom.com>
 <20250128220920.535ecc14@windsurf>
 <CAGt4E5sXA0fiKwYyRummys2Mi+p1sQDG9RQzJNM7g5zSBJcyCQ@mail.gmail.com>
 <90fb464d-759f-429c-a84d-aade53c898a8@mind.be>
In-Reply-To: <90fb464d-759f-429c-a84d-aade53c898a8@mind.be>
Date: Wed, 5 Feb 2025 14:08:48 -0800
X-Gm-Features: AWEUYZmOow4IiO233WKg7t-jelnMOAL6BYlXsnSldHE4usDnG6uDRQnbKZxi11E
Message-ID: <CAGt4E5tH99ymZ8tZs_-LLQdss=Ef=Bkn13VqDkNgtOw2Ffxw+A@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Markus Mayer via buildroot <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1738793342; x=1739398142; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QrWpOwPo5Zn8HXg5y8IkKvcePmAXVdjYAR+tMziEC7Y=;
 b=IqxMMnFZEowYKP2DiQ/zKHE6b7Uqx1G2zzi2qptNEIRg1+HmmAEsi9NAl4pBjgFvqC
 hFRGS6AxB0uge/OJiv8FMdKrOYJQzcNRvu/draqG8SxR0aWff7ShaeTc4NKNd2XzsDtL
 324eYvhiN6FVPd04TaK48Pz2tgRcM3tethls8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=broadcom.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=IqxMMnFZ
Subject: Re: [Buildroot] [PATCH] support/scripts/apply-patches.sh: introduce
 envvar BR_PATCH_ARGS
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <mmayer@broadcom.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCA1IEZlYiAyMDI1IGF0IDExOjI4LCBBcm5vdXQgVmFuZGVjYXBwZWxsZSA8YXJub3V0
QG1pbmQuYmU+IHdyb3RlOgo+ID4KPiA+IFdoZW4gd2UgYXJlIGJ1aWxkaW5nIG91ciByb290IGZp
bGUgc3lzdGVtcywgd2Ugc29tZXRpbWVzIGhhdmUgdG8KPiA+IGJ1bmRsZSBvbGRlciB2ZXJzaW9u
cyBvZiBjZXJ0YWluIHBhY2thZ2VzIG9yIHdlIHdhbnQgdG8gYXBwbHkgcGF0Y2hlcwo+ID4gdGhh
dCBhcmUgYmVpbmcgcmV2aWV3ZWQgdXBzdHJlYW0gd2l0aG91dCBoYXZpbmcgYmVlbiBhY2NlcHRl
ZCBhbmQgd2UKPiA+IHdhbnQgdG8gdXNlIHRoZSBzYW1lIHBhdGNoIGZvciBkaWZmZXJlbnQgdmVy
c2lvbnMgb2YgYSBwYWNrYWdlLCBzYXkKPiA+IHByb2Nwcy1uZyBvciB4ZnNwcm9ncy4gVW5kZXIg
c3VjaCBjaXJjdW1zdGFuY2VzLCBsaWZlIGJlY29tZXMgYSBsb3QKPiA+IGVhc2llciBpZiB5b3Ug
Y2FuIHRlbGwgInBhdGNoIiB0byB1c2UgbW9yZSBmdXp6IHdoZW4gYXBwbHlpbmcgYSBwYXRjaAo+
ID4gYXMgaXQnbGwgYXBwbHkgb3ZlciBhIHdpZGVyIHJhbmdlIG9mIHZlcnNpb25zIHdoaWxlIGFs
bG93aW5nIHlvdSB0bwo+ID4gb25seSB0cmFjayBhIHNpbmdsZSBwYXRjaCBmaWxlLgo+Cj4gVGhh
dCdzIGV4YWN0bHkgd2hhdCB5b3UgKmRvbid0KiB3YW50LiBXaXRoIGZ1enosIHRoZSByaXNrIGlz
IHRvbyBncmVhdCB0aGF0Cj4gdGhlIHBhdGNoIF9zZWVtc18gdG8gYXBwbHkgd2hpbGUgaXQgYWN0
dWFsbHkgZG9lc24ndC4KPgo+ICBUaGUgcHJvcGVyIHdheSBpcyB0byBwdXQgcGF0Y2hlcyBpbiB2
ZXJzaW9uIGRpcmVjdG9yaWVzIGZvciBlYWNoIHNwZWNpZmljCj4gdmVyc2lvbiB5b3Ugd2FudCB0
byBzdXBwb3J0LiBZZXMsIGl0IG1lYW5zIHlvdSBoYXZlIHRvICJtYW51YWxseSIgcmViYXNlIHRo
ZQo+IHBhdGNoZXMgZm9yIGVhY2ggdmVyc2lvbiAoYnV0IHlvdSBjYW4gc2NyaXB0IHRoYXQpLiBC
dXQgeW91J3JlIGFueXdheSBfc29tZWhvd18KPiBnb2luZyB0byBoYXZlIHRvIGNoZWNrIHRoYXQg
dGhlIHBhdGNoZXMgcmVhbGx5IGFwcGx5IHRvIHRoYXQgdmVyc2lvbi4KCkdlbmVyYWxseSB0cnVl
LCBidXQgaXQgYWxzbyBkZXBlbmRzLiBUaGVyZSBjYW4gYmUgc3BlY2lmaWMgc2l0dWF0aW9ucwoo
b24gYSBwZXItcGFja2FnZSBiYXNpcykgd2hlcmUgdGhlIHBhdGNoIGlzIHZlcnkgc2ltcGxlIChq
dXN0IGEgZmV3CmxpbmVzKSB3aGVuIGxpZmUgYmVjb21lcyBlYXNpZXIgaWYgeW91IGRvbid0IGhh
dmUgdG8gbWFpbnRhaW4gYSBwYXRjaApmb3IgZWFjaCB2ZXJzaW9uLiBUaGlzIGlzbid0IG1lYW50
IGFzIHRoZSBtYWluIHNvbHV0aW9uIHRvIGFsbApwcm9ibGVtcy4gSXQgaXMgaW50ZW5kZWQgYXMg
YW4gb3B0aW9uIHRvIHVzZSB3aGVuIGl0IG1ha2VzIHNlbnNlLgoKPiA+IFNvIEkgY2FuIHNheQo+
ID4gICAgICBQUk9DUFNfTkdfUEFUQ0hfQVJHUyA9IC1GMgo+ID4gYW5kIHRoZW4gaXQnbGwgdXNl
ICItRjIiIHdoaWxlIGFwcGx5aW5nIHRoZXNlIHBhdGNoZXMsIGJ1dCBpdCBpcwo+ID4gbGltaXRl
ZCB0byBwcm9jcHMtbmcgYW5kIHdvbid0IGNhdXNlIGFueSBzaWRlLWVmZmVjdHMgZWxzZXdoZXJl
Lgo+Cj4gIFdoeSB3b3VsZCB5b3Ugd2FudCB0byBzdXBwb3J0IG11bHRpcGxlIHZlcnNpb25zIG9m
IHByb2Nwcy1uZz8KCkJlY2F1c2UgdGhhdCBpcyBob3cgb3VyIGJ1aWxkIGVudmlyb25tZW50IGNh
biBlbmQgdXAgd29ya2luZyBvdXQuIElmLApmb3Igc29tZSByZWFzb24sIGEgcGFydGljdWxhciB2
ZXJzaW9uIG9mIGEgc29mdHdhcmUgaXMgbmVlZGVkICh3aGlsZQphbGwgdGhlIHJlc3QgaXMgcmVj
ZW50KSwgd2UgbmVlZCB0byBiZSBhYmxlIHRvIGRvIHRoYXQsIGFuZCBpdCBjYW4gYmUKZWFzaWVy
IHRvIG1haW50YWluIGlmIHlvdSBkb24ndCBuZWVkIGRpZmZlcmVudCB2ZXJzaW9ucyBvZiB0aGUg
c2FtZQpwYXRjaC4KCldoYXQgYWxzbyBoYXBwZW5zIGlzIHRoYXQgZGV2ZWxvcG1lbnQgdGFrZXMg
cGxhY2Ugb24gdGhlIG1vc3QgcmVjZW50Cm9mZmljaWFsIHJlbGVhc2UgKGN1cnJlbnRseSB0aGF0
J3MgMjAyNC4xMSkgd2hpbGUgbmlnaHRseSB0ZXN0LWJ1aWxkcwphbHNvIHRyeSBvdXQgd2hhdCds
bCBoYXBwZW4gd2l0aCBidWlsZHJvb3QvbWFzdGVyLiBJZiBJIG5lZWQgdG8gcGF0Y2gKc29tZXRo
aW5nLCBJJ2xsIGlkZWFsbHkgd2FudCB0aGF0IHBhdGNoIHRvIGFwcGx5IHRvIHRoZSBsYXRlc3Qg
cmVsZWFzZQphbmQgdGhlIGN1cnJlbnQgZGV2ZWxvcG1lbnQgdHJlZS4gKEFuZCB5ZXMsIHN1Y2gg
cGF0Y2hlcyB3aWxsCmdlbmVyYWxseSBiZSBzZW50IHVwc3RyZWFtLCBidXQgdW50aWwgdGhleSBh
cmUgYXBwbGllZCBhbmQgYSBuZXcKcmVsZWFzZSBpcyBjdXQsIHRoZSBsb2NhbCBwYXRjaCBoYXMg
dG8gcmVtYWluLikgVGhlIG5lZWQgZm9yIHRoZSBwYXRjaAp0byBhcHBseSB0byB0d28gZGlmZmVy
ZW50IHZlcnNpb25zIG9mIEJ1aWxkcm9vdCBnb2VzIGF3YXkgd2hlbiB0aGUKbmV4dCByZWxlYXNl
IGNvbWVzIG91dCwgc28gdGhlIGZlYXR1cmUgbWlnaHQgYWxzbyBiZSBoYW5keSB0ZW1wb3Jhcmls
eQpkdXJpbmcgYSBkZXZlbG9wbWVudCBjeWNsZS4KCkluIHRoZSBlbmQsIHRoaXMgaXMgbWVhbnQg
YXMgYSBmYWNpbGl0eSB0byBiZSB1c2VkIHNwYXJpbmdseSB3aGlsZQpiZWluZyBhd2FyZSBvZiB3
aGF0IHlvdSBhcmUgZG9pbmcuIE9mIGNvdXJzZSB0aGVyZSB3aWxsIGFsd2F5cyBiZSBhCndheSB0
byByZXNvbHZlIGFueSBpc3N1ZXMgd2l0aG91dCByZXNvcnRpbmcgdG8gdGhpcyBmZWF0dXJlLiBJ
IGp1c3QKZmluZCB0aGF0IHRoaXMgY2FuIGJlIGhhbmR5IGF0IHRpbWVzIOKAkyBhbmQgbWFpbnRh
aW5lcnMgY2FuIGFsd2F5cwplbnN1cmUgaXQgaXNuJ3QgYmVpbmcgYWJ1c2VkIHRvIGhpZGUgYSBw
cm9ibGVtIHRoYXQgc2hvdWxkIGJlIHNvbHZlZAppbiBhIGRpZmZlcmVudCB3YXkuCgpSZWdhcmRz
LAotTWFya3VzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
