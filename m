Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C91C3DA59
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 19:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C3BC40A60;
	Tue, 16 Jul 2024 19:57:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yEi9f0KQEl_4; Tue, 16 Jul 2024 19:57:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F360409FD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F360409FD;
	Tue, 16 Jul 2024 19:57:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 399DC1BF39C
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 19:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D8DA608F0
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 19:57:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fe7oEWDV68VU for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 19:57:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a2b; helo=mail-vk1-xa2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 148BB607A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 148BB607A9
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com
 [IPv6:2607:f8b0:4864:20::a2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 148BB607A9
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 19:57:08 +0000 (UTC)
Received: by mail-vk1-xa2b.google.com with SMTP id
 71dfb90a1353d-4f2f39829a9so223738e0c.2
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 12:57:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721159828; x=1721764628;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RAddQSSUacWmkNfuWFhsBtQXGARfZa5G4VUBgmYNlK4=;
 b=pRgn0kSvupWenbxEQSSZ6zg+v0YxgwwkOKpcusogashjFyBGd4g9lyzxcjmRGkbHKO
 YLDPNb3xfTJHasQGJQRFZ5fwFAZxeHG7mXBrlUS0F8rHez6BJs3dEvIH0rJ9IjDy+5Zc
 wkbVRW19Qwa3FHLM1CtJ1EPIE0gZq3rKRv3M3IWdjO0hG4KsnfnlQ7vgeNcipQdPsK+N
 G5cnBjDpS2iVVKD2nUfT0+gXEz0l1fl2ycMsX4HWltK4JQqipMaOy+oUg7hXqIDqjvGi
 6QyxGAF2Tln3f0SdmffFoEaH7SxIlNX06vafDVjX8d0aaiEl7oFwTEEwd5GHFI+tQcxz
 JKtA==
X-Gm-Message-State: AOJu0YzjLnTIwbsewj2PALqwC7VOGeXL/jrAepf02pf/qsANvuv51D4i
 ktvow0lPzonsiuVOcWvVIIyDR1VRxFR+/4NTe3LFDFE6Y1mC5oPhzmZnwAt8URu+7kzwkZ44xS6
 GolQIIm0XDP2qoq7RISllIKFv1ZI=
X-Google-Smtp-Source: AGHT+IGA0bCQiDu36l6dJjkrsi7lp8rtk4sHZ+z7E7766Yr1urNfx3MmrTGsImSSvu4JDEI6F8cZ+OgY/WcZXmFhEwM=
X-Received: by 2002:a05:6122:308d:b0:4f3:1e1:f10e with SMTP id
 71dfb90a1353d-4f4d721bcbemr2508702e0c.9.1721159827687; Tue, 16 Jul 2024
 12:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240611152202.951202-1-james.hilliard1@gmail.com>
 <20240611152202.951202-4-james.hilliard1@gmail.com>
 <20240716141755.1bf5473b@windsurf>
 <CADvTj4pA9E8H7=S5HKBHwUhgKq8c_+TcRcu1BAMSBxPNTwTX0Q@mail.gmail.com>
 <20240716214724.62a772d4@windsurf>
In-Reply-To: <20240716214724.62a772d4@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 16 Jul 2024 13:56:56 -0600
Message-ID: <CADvTj4pF77Ci9k+DjaXz63DDqrJRatjSUD8kFdYz56MnP3sHwQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721159828; x=1721764628; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RAddQSSUacWmkNfuWFhsBtQXGARfZa5G4VUBgmYNlK4=;
 b=Mcbv2ea7XtDMF57hrdWhvZh4v5nkPs+jRsHyIUx7cTmZHBc0N9MBGI979I8tWchJ4u
 Ea1W3FOW4ugs+lnHsDpuDzO0itU+7lCItoRR+tx4WTedKqZgh67JUlb6ejKLqpYrXvja
 jB0iZ0rcYzcAh8+85Il0b5aX0Hkov4OrpiMOuPvXW65Azu6jlnylLJKTUjD8pJ2oIA9U
 A6q0tOziwsEOC5b7bupENeK3ZaI+YE/Xcp8q2Wp0rEg+2gXaZcpOGdsyrz7fn3rIdOw2
 U4jJBgr2/JX3QVxrYDBVYmmGyxULJg5MxwPxSLg+WT1H2/CpE4HnPO5oI/tEV2ypvMVi
 bQLA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Mcbv2ea7
Subject: Re: [Buildroot] [PATCH v2 4/4] package/fwupd: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBKdWwgMTYsIDIwMjQgYXQgMTo0N+KAr1BNIFRob21hcyBQZXRhenpvbmkKPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGVsbG8gSmFtZXMsCj4KPiBUaGFu
a3MgZm9yIHRoZSBxdWljayB0dXJuYXJvdW5kLiBPbmUgcXVlc3Rpb24gYmVsb3cuCj4KPiBPbiBU
dWUsIDE2IEp1bCAyMDI0IDExOjU1OjE4IC0wNjAwCj4gSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhp
bGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBGaXhlZCBpbiB2MyBieSBzZXR0aW5nIC1E
dWRldmRpcj0vdXNyL2xpYi91ZGV2IHdoaWNoIGVsaW1pbmF0ZXMgdGhlCj4gPiB1ZGV2IGRlcGVu
ZGVuY3kuCj4KPiBJdCBzZWVtcyB2ZXJ5IG9kZCB0byBtZSB0byBzZXQgLUR1ZGV2ZGlyPS91c3Iv
bGliL3VkZXYgd2hlbiB0aGUKPiBkaXJlY3RvcnkgZG9lc24ndCBleGlzdCBiZWNhdXNlIHVkZXYg
aXNuJ3QgZW5hYmxlZC4gQ291bGQgeW91IGNsYXJpZnkKPiBob3cgdGhpcyBjYW4gYmUgY29ycmVj
dD8KClNvIHVkZXZkaXIgaXMgcmVxdWlyZWQgdG8gYmUgZGVmaW5lZCBpZiB1ZGV2IGlzIG5vdCBw
cmVzZW50IGR1ZSB0byB0aGlzOgpodHRwczovL2dpdGh1Yi5jb20vZnd1cGQvZnd1cGQvYmxvYi8x
LjkuMjEvbWVzb24uYnVpbGQjTDI3Ni1MMjgwCgpCdXQgaW5zdGFsbGF0aW9uIGlzIGFjdHVhbGx5
IGNvbmRpdGlvbmFsIGhlcmUgYmFzZWQgb24gZ3VkZXY6Cmh0dHBzOi8vZ2l0aHViLmNvbS9md3Vw
ZC9md3VwZC9ibG9iLzEuOS4yMS9kYXRhL21lc29uLmJ1aWxkI0w2Mi1MNjQKClNvIGFsd2F5cyBz
ZXR0aW5nIC1EdWRldmRpcj0vdXNyL2xpYi91ZGV2IHNlZW1zIHRvIGJlIHRoZSBiZXN0IG9wdGlv
bgphcyB0aGUgYnVpbGQgc3lzdGVtIGFsd2F5cyB3YW50cyB0aGF0IGRlZmluZWQgZXZlbiB3aGVu
IG5vdCB1c2VkLgoKPgo+Cj4gPiA+IFdoaWNoIHByb2JhYmx5IHlvdSBoYWQgbm90IHNlZW4gYmVj
YXVzZSB5b3UgaGFkIGppbmphMiBpbnN0YWxsZWQgb24KPiA+ID4geW91ciBzeXN0ZW0uIENvdWxk
IHlvdSBtYWtlIHN1cmUgdG8gdGVzdCBidWlsZCBwYWNrYWdlcyB3aXRoCj4gPiA+IC4vdXRpbHMv
ZG9ja2VyLXJ1biB0byBjYXRjaCBzdWNoICJzcHVyaW91cyIgaG9zdCBkZXBlbmRlbmNpZXM/Cj4g
Pgo+ID4gSXQgd2FzIG1pc3NlZCBiZWNhdXNlIEkgd2FzIHRlc3Rpbmcgd2l0aCBzeXN0ZW1kIGVu
YWJsZWQsIHdoaWNoIGhhcyBhCj4gPiB0cmFuc2l0aXZlIGRlcGVuZGVuY3kgb24gaG9zdC1weXRo
b24tamluamEyLgo+Cj4gSW5kZWVkLgo+Cj4gPiA+IEkgcXVpY2tseSBncmVwcGVkIGZvciBqaW5q
YTIgaW4gdGhlIHRyZWUsIGJ1dCBpdCB3YXNuJ3QgaW1tZWRpYXRlbHkKPiA+ID4gY2xlYXIgaWYg
aXQgd2FzIGFic29sdXRlbHkgbWFuZGF0b3J5LCBleGFjdGx5IGZvciB3aGF0LCBldGMuIEhvcGVm
dWxseQo+ID4gPiB5b3UnbGwgYmUgYWJsZSB0byBmaWd1cmUgb3V0LiBJdCB3b3VsZCBiZSBuaWNl
IHRvIG5vdCBtYWtlIGl0IGEKPiA+ID4gbWFuZGF0b3J5IGRlcGVuZGVuY3kgdG8gYnVpbGQgZnd1
cGQsIGlmIHBvc3NpYmxlIG9mIGNvdXJzZS4KPiA+Cj4gPiBZZWFoLCBpdCdzIG1hbmRhdG9yeSBm
b3Igc29tZSBzY3JpcHRzLCBmaXhlZCBpbiB2My4KPgo+IE9LLgo+Cj4gPiB2MzoKPiA+IGh0dHBz
Oi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyNDA3MTYx
NzUwMzcuMTg0NDkyOS01LWphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20vCj4KPiBUaGFua3MhCj4K
PiBUaG9tYXMKPiAtLQo+IFRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3Rs
aW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwo+
IGh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
