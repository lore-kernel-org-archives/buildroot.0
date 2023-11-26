Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067CAC4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 16:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9158660888;
	Sun, 26 Nov 2023 16:19:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9158660888
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yO4Ey6M2ayiA; Sun, 26 Nov 2023 16:19:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D798B607C7;
	Sun, 26 Nov 2023 16:19:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D798B607C7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 559401BF3FF
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 16:19:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 154D9403BF
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 16:19:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 154D9403BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W5VoaEBEWNOY for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 16:19:38 +0000 (UTC)
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A64BC4042D
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 16:19:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A64BC4042D
Received: by mail-qt1-x834.google.com with SMTP id
 d75a77b69052e-41c157bbd30so18736471cf.0
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 08:19:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701015577; x=1701620377;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=89v9qRAj7GH4x72zcXUuNFwXv7+WfsPZKGt3EZkUXEE=;
 b=Kcz2W1V1aKDvp2u3g/N4QgPf6BgcF9GMetGJvl9bao7n5pJAbh9qou3BfdaS2TQ1Q2
 6tCImQ9FTCj6Vmv0moE5pYjLc8u9VraMi4Su5s5qe8RW3g1JZCgSGH9PR4mrg54yQ6sO
 OvfLa5GTLPX8E9pFgb1BURb/doJeVjBPHspH2Tidp9BGwvzgO+lznPcD0Om00d4vnIhd
 i2xSq0+C4Gtnf/B6VL4ZSbP28s7RW/NNsByUrbtKQW283AV0Cv0GRD+N3frhfKZBFMV2
 U3SGBGqw9orWPlSFCHMGUMY6ae4IgmEOQb7fw3gtAnqXORYq0fnFEavgeHseFOq4oppt
 KN3A==
X-Gm-Message-State: AOJu0YwEhHjeVe/7akkotAzfnF6IIlsnzkasbsJHSR4HfHiDHVPPGhRr
 AUN92FEFM2lk31sd/peHW6/YORHi+PdWUYMPjug=
X-Google-Smtp-Source: AGHT+IHVJd/Juzr8Nbc7LwrBfol+YI6TAaCmr5XqJ8vKuYBtv6lKhArUW9HFAkTt6PZ/HCDqFQLhjxgUKV05ZYUqbn0=
X-Received: by 2002:a05:622a:118f:b0:418:1252:9e73 with SMTP id
 m15-20020a05622a118f00b0041812529e73mr11506897qtk.30.1701015577415; Sun, 26
 Nov 2023 08:19:37 -0800 (PST)
MIME-Version: 1.0
References: <20231125081052.881728-1-james.hilliard1@gmail.com>
 <20231125081052.881728-2-james.hilliard1@gmail.com>
 <20231125153609.GJ3177259@scaer>
 <CADvTj4oC_mtb0EymNkFQ969rPRoaw8L8QVvAV2n--knCYB9=iQ@mail.gmail.com>
 <20231126112725.GS3177259@scaer>
In-Reply-To: <20231126112725.GS3177259@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 26 Nov 2023 09:19:25 -0700
Message-ID: <CADvTj4qHe+Puev4JLopaBbH-Kq0+NAR_GH0G43JkcGy125tqXQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701015577; x=1701620377; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=89v9qRAj7GH4x72zcXUuNFwXv7+WfsPZKGt3EZkUXEE=;
 b=i+AgjZzaAhbQr05lVkN9E3dPEfqal0tJS2Nnf5gH+js/QHJlBcNpWyAxlWZRqGWFCn
 PvdnoB+d9OejfaokMMbM0wVbEVoGqFajE0XY1hP2fOlpLGOnC5WWuq3aFd2SiLDbtOM7
 GQh6T1MZu1tsHk6a9tEGv/HM+cCSyV9YJeGYqiziWY8Moo8v9WzOwX/NoyaNUUDiajtd
 S7swMP+M8QmDB6gBTV3K7kL97i+tsNkVsyMD/6o47jSzxH8FX78hI5ulA7AxB7IiPYM6
 ccoVjMDbyP6y9iNY0nLu+fkvQZkyUMMyriMYxBlUkEeMkKuDdX5aGRCFs6OSuwIj1tBJ
 57cQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=i+AgjZza
Subject: Re: [Buildroot] [PATCH 2/3] package/python-pydantic-core: new
 package
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCBOb3YgMjYsIDIwMjMgYXQgNDoyN+KAr0FNIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9y
aW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPgo+IEphbWVzLCBBbGwsCj4KPiBPbiAyMDIzLTExLTI1
IDE3OjExIC0wNzAwLCBKYW1lcyBIaWxsaWFyZCBzcGFrZSB0aHVzbHk6Cj4gPiBPbiBTYXQsIE5v
diAyNSwgMjAyMyBhdCA4OjM24oCvQU0gWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZy
ZWUuZnI+IHdyb3RlOgo+IFstLVNOSVAtLV0KPiA+ID4gU28gd2hhdCBoYXBwZW5zIGlmIEkgYXBw
bHkgdGhpcyBwYXRjaCwgd2hpY2ggYWRkcyBweWRhbnRpYy1jb3JlLCBidXQgSQo+ID4gPiBkbyBu
b3QgYXBwbHkgdGhlIG5leHQgb25lLCB3aGljaCBidW1wcyBweWRhbnRpYywgc28gd2UgZW5kIHVw
IGluIGEKPiA+ID4gc2l0dWF0aW9uIHdpdGggYW4gb2xkIHB5ZGFudGljLCB3aXRoIHRoZSBuZXcg
Y29yZSBhbHNvIGluc3RhbGxlZD8KPiA+ID4KPiA+ID4gRG8gdGhlIHR3byBjb25mbGljdCwgb3Ig
aXMgaXQgYW4gT0sgc2l0dWF0aW9uIChvYnZpb3VzbHkgdGhlCj4gPiA+IHB5ZGFudGljLWNvcmUg
d291bGQgYmUgb2YgbGl0dGxlIHVzZSk/Cj4gPiA+Cj4gPiA+IElmIHRoZXJlIGlzIGEgY29uZmxp
Y3QsIHRoZW4gd2Ugd2lsbCB3YW50IHRvIGludHJvZHVjZSB0aGUgbmV3IHBhY2thZ2UKPiA+ID4g
YXQgdGhlIHNhbWUgdGltZSB3ZSBkbyB0aGUgYnVtcCwgYW5kIHRoYXQgc2hvdWxkIGJlIGV4cGxh
aW5lZCBpbnQgaGUKPiA+ID4gY29tbWl0IGxvZy4KPiA+ID4KPiA+ID4gSWYgdGhlcmUgaXMgbm8g
Y29uZmxpY3QsIHRoZW4ganVzdCBzYXksIHdlIGNhbiBhbW1lbmQgdGhlIGNvbW1pdCBsb2cKPiA+
ID4gYWNjb3JkaWdubHkuCj4gPgo+ID4gVGhlcmUncyBubyBjb25mbGljdCBzaW5jZSBweWRhbnRp
Yy1jb3JlIGlzIGEgbmV3IHBhY2thZ2Ugd2l0aCBubyByZXZlcnNlCj4gPiBkZXBlbmRlbmNpZXMu
Cj4KPiBJdCBpcyBub3QganVzdCBhYm91dCByZXZlcnNlIGRlcGVuZGVuY2llcy4gQXNzdW1pbmcg
d2UganVzdCBhcHBseSB0aGUKPiBweWRhbnRpYy1jb3JlIG5ldyBwYWNrYWdlLCBhbmQga2VlcCB0
aGUgb2xkIHB5ZGFudGljIChlLmcgd2UgaGF2ZSB0bwo+IHJldmVydCB0aGUgYnVtcCBsYXRlciBm
b3IgdmFyaW91cyByZWFzb25zKSwgd2hhdCBoYXBwZW5zIGF0IGJ1aWxkIHRpbWUKPiBvciBhdCBy
dW50aW1lLCBpZiB0aGUgdXNlciBlbmFibGVzIHB5ZGFudGljLWNvcmUgYW5kIHB5ZGFudGljICh0
aGUgb2xkKT8KClNvIHB5ZGFudGljLWNvcmUgaXMganVzdCBhIG5ldyBkZXBlbmRlbmN5IGZvciBw
eWRhbnRpYyB0byBoYW5kbGUgY29yZQp2YWxpZGF0aW9uIGxvZ2ljLiBJZiBweWRhbnRpYy1jb3Jl
IGlzIHVzZWQgd2l0aCBvbGQgcHlkYW50aWMgdGhlcmUgc2hvdWxkbid0CmJlIGFueSBidWlsZC9y
dW50aW1lIGlzc3VlcyBhcyB0aGV5IHdvdWxkIG5vdCBjb25mbGljdCBpbiBhbnkgd2F5LgoKPgo+
IElmIHRoYXQgbWFrZXMgcHlkYW50aWMtb2xkIGZhaWwgdG8gYnVpbGQgb3IgcnVuLCB0aGF0IGlz
IHdoYXQgd2UgY2FyZQo+IGFib3V0LgoKV2h5IHdvdWxkIGl0IG1ha2UgcHlkYW50aWMtb2xkIGZh
aWw/IFRoZSBweWRhbnRpYy1jb3JlIHBhY2thZ2UgdXNlcyBhCmRpZmZlcmVudCBtb2R1bGUgbmFt
ZXNwYWNlIHdoaWNoIGlzIHR5cGljYWxseSBob3cgcHl0aG9uIHBhY2thZ2VzCnByZXZlbnQgaW1w
b3J0IGNvbmZsaWN0cyBpbiBnZW5lcmFsLgoKVG8gaW1wb3J0IGZyb20gcHlkYW50aWMtY29yZSB5
b3UgaW1wb3J0IGxpa2U6CmZyb20gcHlkYW50aWNfY29yZSBpbXBvcnQgU2NoZW1hVmFsaWRhdG9y
LCBWYWxpZGF0aW9uRXJyb3IKClRvIGltcG9ydCBmcm9tIHB5ZGFudGljIHlvdSBpbXBvcnQgbGlr
ZToKZnJvbSBweWRhbnRpYyBpbXBvcnQgQmFzZU1vZGVsCgpOZXcgcHlkYW50aWMgc2ltcGx5IGlu
dGVybmFsbHkgaW1wb3J0cyBmcm9tIHB5ZGFudGljX2NvcmUgYnV0IG9sZApweWRhbnRpYyBkb2Vz
IG5vdCBhbmQgd2lsbCBmdW5jdGlvbiB0aGUgc2FtZSB3aGV0aGVyIG9yIG5vdCB3ZSBoYXZlCnB5
ZGFudGljX2NvcmUgaW5zdGFsbGVkLgoKCgo+Cj4gWy0tU05JUC0tXQo+ID4gPiBDb3VsZCB5b3Ug
cGxlYXNlIGV4dGVuZCB0aGUgbWFudWFsIHRvIGRlc2NyYmUgdGhlIGFkZGl0aW9uYWwgc2V0dXAg
dHlwZXMKPiA+ID4gdGhhdCBhcmUgY3VycmVudGx5IHN1cHBvcnRlZCBieSBCdWlsZHJvb3QsIHBs
ZWFzZT8KPiA+IFllYWgsIHNvIHdlJ3JlIHByZXR0eSBjbG9zZSByaWdodCBub3cgdG8gaGF2aW5n
IGFsbCBvdXIgcHl0aG9uIGluZnJhc3RydWN0dXJlCj4gPiBtaWdyYXRlZCB0byBwZXA1MTcgc28g
SSB3YXMgdGhpbmtpbmcgb25jZSB3ZSBoYXZlIHRoYXQgdGhlbiBhIGxvdCBvZiB0aGluZ3MKPiA+
IGluY2x1ZGluZyB0aGUgZG9jdW1lbnRhdGlvbiBjYW4gYmUgc2lnbmlmaWNhbnRseSBzaW1wbGlm
aWVkIGFzIG1hdHVyaW4gYW5kCj4gPiBzZXR1cHRvb2xzLXJ1c3QgaW5mcmFzdHJ1Y3R1cmUgd2ls
bCBiZSBwZXA1MTcgYmFzZWQgYW5kIHdlIGNhbiBkcm9wIGFsbCB0aGUKPiA+IGxlZ2FjeSBkb2Nz
IGxpa2UgZGlzdHV0aWxzIGFuZCB0aGUgZG9jcyByZWxhdGVkIHRvIGxlZ2FjeSBub24tcGVwNTE3
IHNldHVwdG9vbHMuCj4KPiBCdXQgbm9uZSBvZiB0aGF0IGlzIG9uIG1hc3RlciwgZm9yIHRoZSBy
ZWxlYXNlIHRvIGNvbWUsIHNvIHdlIHdvdWxkIHN0aWwKPiBuZWVkIHRoZSBtYW51YWwgdG8gYmUg
dXAtdG8tZGF0ZSBmb3IgbWFzdGVyLgo+Cj4gUmVnYXJkcywKPiBZYW5uIEUuIE1PUklOLgo+Cj4g
LS0KPiAuLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0t
LS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgo+IHwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1U
aW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8Cj4g
fCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAg
IHwgIF9fXyAgICAgICAgICAgICAgIHwKPiB8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0t
Li0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAo+IHwgaHR0
cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAg
diAgIGNvbnNwaXJhY3kuICB8Cj4gJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0t
LS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
