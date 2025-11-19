Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41307CF394D
	for <buildroot@archiver.kernel.org>; Wed, 19 Nov 2025 16:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AE9A82EB4;
	Wed, 19 Nov 2025 16:16:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rqvHWIseR6cl; Wed, 19 Nov 2025 16:16:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2690D83C3A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2690D83C3A;
	Wed, 19 Nov 2025 16:16:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 119D42A9
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 16:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB5EC607DA
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 16:16:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O5XVYv0jso3k for <buildroot@buildroot.org>;
 Wed, 19 Nov 2025 16:16:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::931; helo=mail-ua1-x931.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1E3C1606E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E3C1606E7
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com
 [IPv6:2607:f8b0:4864:20::931])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E3C1606E7
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 16:16:38 +0000 (UTC)
Received: by mail-ua1-x931.google.com with SMTP id
 a1e0cc1a2514c-935241a7a0eso3485879241.2
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 08:16:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763568998; x=1764173798;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mzOTy8V4ycVIJaDKD4XzYt/LeQ0/fdRcFkRX8LakRdA=;
 b=BXS0eBpBG67QH3kLmP8wTo0kSmmVJ0rb2BdVOdnT7OSTt7yuz3NLD7ONx2qjAhHSBN
 NXcPXonly64uwt0CXX53vguhbJIiwvCglgmnLrPaKQZKE8LlauYHwHaS6viYZvmNVD2x
 ltkEivtd2wpwEw8yB/MAJLq7oiOr3LdwMibIkZAmILky1XTU2KnihY/+QR8gzuhLsgPZ
 4e4LLzVZKcSbqSDahVlrxabPnPM8bd+MrpfRhA/3xWsrn0X2GstzbNvS/weKqTdXfdbm
 Nh7DjKpr4nb2ppY9MMZBLlZ9eQXT3+hy3b/jXuBmw4It1dDjvFDevAuVh/4QIxijN+Ww
 2PEw==
X-Gm-Message-State: AOJu0YxLJXz8mGctEHSECnQ9BK8CwuCvOgA6/ffWTs/noal1d3swoVuK
 Z/kRiNEmIRqbVooGoer1CUezebJO72RRjSh18oRDEqEEYUoXARLnBLN1tLa1mCc4v7zvL5C1akh
 C+uT0g0BJfhi6NVg+izWFxjS5hPVMoyQ=
X-Gm-Gg: ASbGncsIZPZEzGMMEJpzQBFSJlfifSUSfxfrGTkOaBPFFRXBWgICk/he8sqRvnVe90N
 XiZWgjFxbSO5ePZvj4E7NRTgoYxUzQmoGeGga2eSVF3vf9MMxQo1Czk++yCpUv3hxV7jPl/Lr6R
 kLWtdpeTx2LjCgs5zKzOB5k0efXDtUtsaPyXyfLdAU+HTg5cgG3IJgzqGWA3xE7epxgb1GvGFgE
 rQWtIc+/xnspW3CBmczFp/HIkOd3iuADETgpbxGe3LGYX+GdeCWmextooEy9TVQlhRMyTs=
X-Google-Smtp-Source: AGHT+IEHcctgpUu+wPgRzWS0orgEAwOBWGru1mRp+te1pIO3uDnc/+R/OYhZiOPtT6cnpLIGpV9rXUbv9cwnDg3kPrk=
X-Received: by 2002:a05:6102:3a07:b0:5db:d6dd:81c6 with SMTP id
 ada2fe7eead31-5e1bbc716admr24484137.18.1763568997658; Wed, 19 Nov 2025
 08:16:37 -0800 (PST)
MIME-Version: 1.0
References: <20251119154819.3416176-1-nolange79@gmail.com>
In-Reply-To: <20251119154819.3416176-1-nolange79@gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 19 Nov 2025 09:16:26 -0700
X-Gm-Features: AWmQ_bl3eNWtbqBT0ptVsiBAh3rsUSdBWLNeWAU90R1tRzl5_Q2ENFlWzczI9kk
Message-ID: <CADvTj4qKBNEobk78FM1Zxj8n1irVV+LaApwWR=rDcbwf8+2mmg@mail.gmail.com>
To: Norbert Lange <nolange79@gmail.com>
Cc: buildroot@buildroot.org, Sen Hastings <sen@hastings.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763568998; x=1764173798; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mzOTy8V4ycVIJaDKD4XzYt/LeQ0/fdRcFkRX8LakRdA=;
 b=JAvKNwBXLUR51lV4YePmvQe62SICu7z++qwi5Fcf0ktwJCibxm/ktG21na4NGuFa4q
 AvH3qdB2yrT485ppRaSQCvIrueoy+HxnLC1eRjSF70O9QlZnTBfjyoR8xZdDc0a+R3yL
 UkaCz2VZKFh1s0iwEga5jy9xgxCN4pxRJ5KqkYAbeD8VNjBSCRFrTfPaIATcW/jOiSxC
 urJ9ascYQ+AXRQE/TkBolQaWF1ShaxFmBQuYSjXhXPideXh2/ZdOG5GzTMA1+jLb7t/8
 VFJ6BnQFD4DhsFoKm13k2+l9oaUobq9by8VribaTHWXNwutLQ+Ac031tCZ4dZA+3b7tU
 k/Iw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JAvKNwBX
Subject: Re: [Buildroot] [PATCH] package/systemd: remove several Kernel
 config options
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCBOb3YgMTksIDIwMjUgYXQgODo1N+KAr0FNIE5vcmJlcnQgTGFuZ2UgPG5vbGFuZ2U3
OUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gQWxsIHRob3NlIGZlYXR1cmVzIGFyZSBvcHRpb25hbCBh
bmQgcHJldmVudCBjdXN0b21pemF0aW9uIG9mIHRoZSBrZXJuZWwuCj4gRm9yY2luZyBJUHY2IGlz
IHBhcnRpY3VsYXJseSBuYXN0eS4KCldoYXQgaXNzdWUgYXJlIHlvdSBzZWVpbmcgZnJvbSBmb3Jj
aW5nIElQVjY/Cgo+Cj4gVGhpcyByZXZlcnRzIHBhcnRzIG9mICJwYWNrYWdlL3N5c3RlbWQ6IGJ1
bXAgdG8gdmVyc2lvbiAyNTYuNCIKPgo+IFNpZ25lZC1vZmYtYnk6IE5vcmJlcnQgTGFuZ2UgPG5v
bGFuZ2U3OUBnbWFpbC5jb20+Cj4gLS0tCj4gIHBhY2thZ2Uvc3lzdGVtZC9zeXN0ZW1kLm1rIHwg
MTkgLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTkgZGVsZXRpb25zKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9zeXN0ZW1kL3N5c3RlbWQubWsgYi9wYWNrYWdlL3N5
c3RlbWQvc3lzdGVtZC5tawo+IGluZGV4IDEyNmNlNzcxNmYuLjBlZTY4MGU1NWUgMTAwNjQ0Cj4g
LS0tIGEvcGFja2FnZS9zeXN0ZW1kL3N5c3RlbWQubWsKPiArKysgYi9wYWNrYWdlL3N5c3RlbWQv
c3lzdGVtZC5tawo+IEBAIC04NjMsMzUgKzg2MywxNiBAQCBkZWZpbmUgU1lTVEVNRF9MSU5VWF9D
T05GSUdfRklYVVBTCj4KPiAgICAgICAgICQoY2FsbCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklH
X0RNSUlEKQo+Cj4gLSAgICAgICAkKGNhbGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19CTEtf
REVWX0JTRykKPiAtCgpUaGlzIGlzIGxpc3RlZCBhcyByZXF1aXJlZCBmb3IgIlN1cHBvcnQgZm9y
IHNvbWUgU0NTSSBkZXZpY2VzIHNlcmlhbApudW1iZXIgcmV0cmlldmFsIjoKaHR0cHM6Ly9naXRo
dWIuY29tL3N5c3RlbWQvc3lzdGVtZC9ibG9iL3YyNTguMi9SRUFETUUjTDEwNi1MMTA4Cgo+ICAg
ICAgICAgJChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfTkVUX05TKQo+Cj4gICAgICAg
ICAkKGNhbGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19VU0VSX05TKQo+Cj4gICAgICAgICAk
KGNhbGwgS0NPTkZJR19ESVNBQkxFX09QVCxDT05GSUdfU1lTRlNfREVQUkVDQVRFRCkKPgo+IC0g
ICAgICAgJChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfSVBWNikKPiAgICAgICAgICQo
Y2FsbCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklHX0FVVE9GU19GUykKPiAgICAgICAgICQoY2Fs
bCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklHX0FVVE9GUzRfRlMpCj4gICAgICAgICAkKGNhbGwg
S0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19UTVBGU19QT1NJWF9BQ0wpCj4gICAgICAgICAkKGNh
bGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19UTVBGU19YQVRUUikKPiAtICAgICAgICQoY2Fs
bCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklHX1NFQ0NPTVApCj4gLSAgICAgICAkKGNhbGwgS0NP
TkZJR19FTkFCTEVfT1BULENPTkZJR19TRUNDT01QX0ZJTFRFUikKPiAtICAgICAgICQoY2FsbCBL
Q09ORklHX0VOQUJMRV9PUFQsQ09ORklHX0tDTVApCj4gLSAgICAgICAkKGNhbGwgS0NPTkZJR19F
TkFCTEVfT1BULENPTkZJR19ORVRfU0NIRUQpCj4gLSAgICAgICAkKGNhbGwgS0NPTkZJR19FTkFC
TEVfT1BULENPTkZJR19ORVRfU0NIX0ZRX0NPREVMKQoKVGhlc2Ugb3B0aW9ucyBhcmUgIk9wdGlv
bmFsIGJ1dCBzdHJvbmdseSByZWNvbW1lbmRlZCI6Cmh0dHBzOi8vZ2l0aHViLmNvbS9zeXN0ZW1k
L3N5c3RlbWQvYmxvYi92MjU4LjIvUkVBRE1FI0wxMTgtTDEyOAoKPiAtICAgICAgICQoY2FsbCBL
Q09ORklHX0VOQUJMRV9PUFQsQ09ORklHX0NHUk9VUF9TQ0hFRCkKPiAtICAgICAgICQoY2FsbCBL
Q09ORklHX0VOQUJMRV9PUFQsQ09ORklHX0ZBSVJfR1JPVVBfU0NIRUQpCgpUaGVzZSBhcmUgIlJl
cXVpcmVkIGZvciBDUFVTaGFyZXM9IGluIHJlc291cmNlIGNvbnRyb2wgdW5pdCBzZXR0aW5ncyI6
Cmh0dHBzOi8vZ2l0aHViLmNvbS9zeXN0ZW1kL3N5c3RlbWQvYmxvYi92MjU4LjIvUkVBRE1FI0wx
MzAtTDEzMgoKPiAtICAgICAgICQoY2FsbCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklHX0NGU19C
QU5EV0lEVEgpCgpUaGlzIGlzICJSZXF1aXJlZCBmb3IgQ1BVUXVvdGE9IGluIHJlc291cmNlIGNv
bnRyb2wgdW5pdCBzZXR0aW5ncyI6Cmh0dHBzOi8vZ2l0aHViLmNvbS9zeXN0ZW1kL3N5c3RlbWQv
YmxvYi92MjU4LjIvUkVBRE1FI0wxMzQtTDEzNQoKPiAtCj4gLSAgICAgICAkKGNhbGwgS0NPTkZJ
R19FTkFCTEVfT1BULENPTkZJR19FRklWQVJfRlMpCj4gLSAgICAgICAkKGNhbGwgS0NPTkZJR19F
TkFCTEVfT1BULENPTkZJR19FRklfUEFSVElUSU9OKQoKVGhlc2UgYXJlIHJlcXVpcmVkICJGb3Ig
VUVGSSBzeXN0ZW1zIiA6Cmh0dHBzOi8vZ2l0aHViLmNvbS9zeXN0ZW1kL3N5c3RlbWQvYmxvYi92
MjU4LjIvUkVBRE1FI0wxNTMtTDE1NQoKPiAtCj4gLSAgICAgICAkKGNhbGwgS0NPTkZJR19FTkFC
TEVfT1BULENPTkZJR19ETUkpCj4gLSAgICAgICAkKGNhbGwgS0NPTkZJR19FTkFCTEVfT1BULENP
TkZJR19ETUlfU1lTRlMpCgpUaGVzZSBhcmUgIlJlcXVpcmVkIGZvciByZWFkaW5nIGNyZWRlbnRp
YWxzIGZyb20gU01CSU9TIjoKaHR0cHM6Ly9naXRodWIuY29tL3N5c3RlbWQvc3lzdGVtZC9ibG9i
L3YyNTguMi9SRUFETUUjTDE2NkM5LUwxNjgKCj4KPiAgICAgICAgICQoY2FsbCBLQ09ORklHX0RJ
U0FCTEVfT1BULENPTkZJR19SVF9HUk9VUF9TQ0hFRCkKPgo+IC0tCj4gMi40Ny4zCj4KPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
