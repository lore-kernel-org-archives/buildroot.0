Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4473CAC59A
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 18:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86A6E41459;
	Wed, 17 Sep 2025 18:24:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nZ4luPHv-qfl; Wed, 17 Sep 2025 18:24:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B60C841461
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B60C841461;
	Wed, 17 Sep 2025 18:24:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BAEFB279
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 18:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A119841457
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 18:24:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wOxorKQa2BRd for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 18:24:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a29; helo=mail-vk1-xa29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B455E41448
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B455E41448
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com
 [IPv6:2607:f8b0:4864:20::a29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B455E41448
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 18:24:40 +0000 (UTC)
Received: by mail-vk1-xa29.google.com with SMTP id
 71dfb90a1353d-54a1bef404fso58130e0c.0
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 11:24:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758133479; x=1758738279;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NWOTr6s7MWYgUoeR301ulaP9+KS40/XYFMzyDl4ITns=;
 b=rW4omvdgmgfo9WSBo8UdSC/PUODetA5gS+T8COZAaywiWuNEM6TnVoz3I1gxByV1uo
 kZPGXrb74quBjTnkaQnhzPsIHjEiSzH/BaH5n3va+2FZO6KeABvCgn1kowr9hCQeL7gA
 bVB+9abaMNlmWJz1Yzh1R1fRne698THelirv3tllUcuDi9YSs4yeBhIxvEnfr+FYyhKs
 hFpp3nZLuG6zYua7o7rMT+mhNd1cQluf1DLDK/lfbaNIEIPa8ye3I65tjuZc3dMAWcVt
 qd2hk5ONXfpZf8GbGyXcjeO10R3sa5Ntu37R+pAkZcCMMkOfZUM2Uj+4DE96ZD6lyQTN
 vAEw==
X-Gm-Message-State: AOJu0Yxg3zDJUH4NWPbqP9whRCSRSr8rJQN80h9z+BX3KZa3++bEcq7L
 6RvqYPh8IKEoazcY7zBXKv1R75pMoMwprlNqLTxRzA7eNoJTA5dUJV1vRcilKqVPwZf7y9bmBME
 NoF954dAdf56lnUsNEKYFj12aY3Bll1M=
X-Gm-Gg: ASbGncv6wXmuhqF9wvVAZBb9I5ijQ53DEYPoa2aeaL25oBpspq8UM3LCgW7ZSr7RKpu
 pRKfl8SVILQL3bPHdlHYEyA1IAgEeopfYfAIOVqw1dQeTf7kCFrgBciQ3ZfNKp21S57K/wTvtsL
 uZ8P4mvjareNaTHwSh67TIeZhH1u5tdWeRrySNE0n52jkoGZHHEGzuoRCdlKYhy03Qbko1488xZ
 9TpDzYR
X-Google-Smtp-Source: AGHT+IES4ABJnc+5y4Is+YrVZKAEIN2ShbBAE+QVSg8emwyL+2OOgFmoKynZ2WV63pLEYIUhCroRt0mJb4CwJ2N1YHc=
X-Received: by 2002:a05:6122:a0a:b0:544:9313:8387 with SMTP id
 71dfb90a1353d-54a60c9b8e7mr1297501e0c.15.1758133479349; Wed, 17 Sep 2025
 11:24:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250916003036.2506534-1-james.hilliard1@gmail.com>
 <e334751a5a70b13d39c4cb67e47626b1@free.fr>
 <CADvTj4rD4nNXkrwpJQJKxX1nUpfg_DVa-9Lr-8FRqa+s5LYpXw@mail.gmail.com>
 <969f8476e23d93622312df6ff5dcfb3d@free.fr>
In-Reply-To: <969f8476e23d93622312df6ff5dcfb3d@free.fr>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 17 Sep 2025 12:24:27 -0600
X-Gm-Features: AS18NWDRgRJ-9AeU5YhJagjYv5qVZ2qyNG5Pl_m4AvOWl2rAkLcLKhiDHBX-YrU
Message-ID: <CADvTj4p4s9jbx=hVBHhPJQ5yfqQmrL=1XTxJbdkJLRbQr4cO3Q@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Marcus Hoffmann <bubu@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758133479; x=1758738279; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NWOTr6s7MWYgUoeR301ulaP9+KS40/XYFMzyDl4ITns=;
 b=Yroh9QZuIyELPI1CI6hN3xuDe0Mf3AjMnPK6O+3wyieidRUPyQw+5HeuLhj1QeOZGy
 rQDnIFpkTThIlayXQ6eHg+EQkXxpdgAREDSsv9ZiWJMYF+ll19mufOLG9dDNo92e5fKX
 EetC0XrGQlYw2egnvq3R+R4weFg1StziLQMGhMEIpfUZEi4CM/1hxNkfApGwYEKUiMDH
 8NdNEqB/3uRTw6nvyfF6cuMjiXtzde+PkNM1zlttEq5UK2h3nwxJ6Zg8GctkPPP7aRTM
 HsVL1ZKqiCBu2tSu6etoMm6UdcLdUX0z4PzBSxLsjrSxAkitDrfQnpWe+IRqe0Xph3Kw
 Oljw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Yroh9QZu
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pydantic-core: bump to
 version 2.39.0
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

T24gV2VkLCBTZXAgMTcsIDIwMjUgYXQgMTE6NTLigK9BTSBKdWxpZW4gT2xpdmFpbiA8anUub0Bm
cmVlLmZyPiB3cm90ZToKPgo+IEhpIEphbWVzLAo+Cj4gT24gMTcvMDkvMjAyNSAxOToyOSwgSmFt
ZXMgSGlsbGlhcmQgd3JvdGU6Cj4gPiBPbiBXZWQsIFNlcCAxNywgMjAyNSBhdCAxMToxOeKAr0FN
IEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUuZnI+IHdyb3RlOgo+ID4+Cj4gPj4gSGkgSmFtZXMs
Cj4gPj4KPiA+PiBUaGFua3MgZm9yIHRoZSBwYXRjaC4KPiA+Pgo+ID4+IE9uIDE2LzA5LzIwMjUg
MDI6MzAsIEphbWVzIEhpbGxpYXJkIHdyb3RlOgo+ID4+ID4gU2lnbmVkLW9mZi1ieTogSmFtZXMg
SGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4gPj4gPiAtLS0KPiA+PiBbLi4u
XQo+ID4+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXB5ZGFudGljLWNvcmUvcHl0aG9u
LXB5ZGFudGljLWNvcmUubWsKPiA+PiA+IGIvcGFja2FnZS9weXRob24tcHlkYW50aWMtY29yZS9w
eXRob24tcHlkYW50aWMtY29yZS5tawo+ID4+ID4gaW5kZXggNTA4NWI5MDZkNS4uNzM0MjcxMWIy
YSAxMDA2NDQKPiA+PiA+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLXB5ZGFudGljLWNvcmUvcHl0aG9u
LXB5ZGFudGljLWNvcmUubWsKPiA+PiA+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLXB5ZGFudGljLWNv
cmUvcHl0aG9uLXB5ZGFudGljLWNvcmUubWsKPiA+PiA+IEBAIC02LDEwICs2LDEwIEBACj4gPj4g
Pgo+ID4+ID4gICMgcHl0aG9uLXB5ZGFudGljIHBpbnMgYW4gZXhhY3QgdmVyc2lvbiBvZiBweWRh
bnRpYy1jb3JlIGluCj4gPj4gPiBweXByb2plY3QudG9tbCwKPiA+PiA+ICAjIG1ha2Ugc3VyZSB0
byBzeW5jIHB5ZGFudGljLWNvcmUgdG8gdGhpcyB2ZXJzaW9uIHdoZW4gdXBkYXRpbmcKPiA+PiA+
IHB5ZGFudGljCj4gPj4gPiAtUFlUSE9OX1BZREFOVElDX0NPUkVfVkVSU0lPTiA9IDIuMzMuMgo+
ID4+ID4gK1BZVEhPTl9QWURBTlRJQ19DT1JFX1ZFUlNJT04gPSAyLjM5LjAKPiA+Pgo+ID4+IFRo
aXMgbmV3IHZlcnNpb24gYnJlYWtzIHRoZSBydW50aW1lIHRlc3RzLiBTZWU6Cj4gPj4gaHR0cHM6
Ly9naXRsYWIuY29tL2pvbGl2YWluL2J1aWxkcm9vdC8tL3BpcGVsaW5lcy8yMDQ1NDg3Nzg2Cj4g
Pj4KPiA+PiBDb3VsZCB5b3UgaGF2ZSBhIGxvb2sgcGxlYXNlPwo+ID4+Cj4gPj4gSXQgaXMgbGlr
ZWx5IGEgbWlzc2luZyBydW50aW1lIGRlcGVuZGVuY3kuIEkgZGlkIG5vdCBhcHBsaWVkCj4gPj4g
dGhlIHB5dGhvbi1weWRhbnRpYyBidW1wIGZyb206Cj4gPj4gaHR0cHM6Ly9wYXRjaHdvcmsub3ps
YWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDI1MDkxNjAwMzMxOS4yNTEwMDUwLTEt
amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbS8KPiA+Pgo+ID4+IEknbGwgcmV0ZXN0IGJvdGggYnVt
cHMgYXQgdGhlIHNhbWUgdGltZS4KPiA+Cj4gPiBZZWFoLCBiYXNlZCBvbiB0aGUgZXJyb3IgSSB0
aGluayBhcHBseWluZyBib3RoIGF0IHRoZSBzYW1lIHRpbWUgc2hvdWxkCj4gPiBmaXggaXQuCj4K
PiBJIGRvbid0IHRoaW5rIHNvLiBJIHRlc3RlZCB3aXRoIGJvdGggcGF0Y2hlcyBhcHBsaWVkIG9u
IHRvcCBvZiB0aGUgcmVzdAo+IG9mIHlvdXIgcHl0aG9uIHVwZGF0ZXMuIFNlZToKPiBodHRwczov
L2dpdGxhYi5jb20vam9saXZhaW4vYnVpbGRyb290Ly0vY29tbWl0cy9idW1wLXRlc3RzLnBhY2th
Z2UudGVzdF9weXRob25fcHlkYW50aWMKPgo+IFNvIEkgdGhpbmsgdGhlcmUgaXMgcmVhbGx5IHNv
bWUgbmV3IHJ1bnRpbWUgZGVwZW5kZW5jeSBtaXNzaW5nLgoKSSB0aGluayBJIHNlZSB0aGUgaXNz
dWUsIHRoZSBsYXRlc3QgdmVyc2lvbiBvZiBweWRhbnRpYyBzcGVjaWZpZXMgYW4gb2xkZXIKdmVy
c2lvbihvdXIgY3VycmVudCB2ZXJzaW9uKSBvZiBweWRhbnRpYy1jb3JlIGZvciBjb21wYXRpYmls
aXR5OgpodHRwczovL2dpdGh1Yi5jb20vcHlkYW50aWMvcHlkYW50aWMvYmxvYi92Mi4xMS45L3B5
cHJvamVjdC50b21sI0w0OQoKU28gSSdsbCBkcm9wIHRoZSBweWRhbnRpYy1jb3JlIGJ1bXAsIHlv
dSBzaG91bGQgYmUgYWJsZSB0byBtZXJnZSB0aGUKcHlkYW50aWMgYnVtcCBieSBpdHNlbGYuCgo+
Cj4gPj4KPiA+PiBCZXN0IHJlZ2FyZHMsCj4gPj4KPiA+PiBKdWxpZW4uCj4KPiBCZXN0IHJlZ2Fy
ZHMsCj4KPiBKdWxpZW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
