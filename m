Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B142C4829B
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 00:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4939E84120;
	Mon, 12 Feb 2024 00:46:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YlEXIcqXjszc; Mon, 12 Feb 2024 00:46:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DB6F84121
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DB6F84121;
	Mon, 12 Feb 2024 00:46:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9F7CD1BF868
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 00:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C55D84121
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 00:46:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3gvIEXzFABRy for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 00:46:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::831; helo=mail-qt1-x831.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6D7EE84120
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D7EE84120
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6D7EE84120
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 00:46:33 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id
 d75a77b69052e-42c0960382eso20092601cf.2
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 16:46:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707698792; x=1708303592;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F4ncXjfd08SR9IbN7+nnLGUIil/tJLxx35hJWAZ+TVg=;
 b=oN/SvdCxp2g7yrTDXtDjzTuxS5dXtMfN62ZcSiO7jTVZyvyF8lxpahnpjpbiLOzprc
 Bxrb5Tug8j3HjHnz17JtgokrxF379C2FV1wzFuA4NNIyFGyj2R/IjK9rinTELXJ/pm6z
 GRd4AvrBrfydB+czL7rJuKxZaFEydUOYjNQxay911dpWTa4SWNGdSnsXBIL+n5fq8pqQ
 w2IXsgN5G3Fs/Pjr5pJ+4O4NlZzWk/t42HbCftBq/Upa5w8kZ7dByJxahtcKkwTTa0zx
 FTjFQVdmwiedDMVzRiYYkw7CKyikCjYg6JnmiJQPMP9/A91WcPj6NKoHstw0h/+Dp9JW
 omRQ==
X-Gm-Message-State: AOJu0YzoomCEmOCTRFAyxihP374eD7O8EcPy1MtqWHTt23svXhZiQu/O
 0ZajAn7WEIFMX8unLK5iPlht6KqsUyNwIyC3u3+Nfpy5FMZrrzdrErT+YNyx8UeTzDEdAOiVbvN
 0oUjhNv4KU7E5GwJizM7vDL/M3dtHbTJAwrUzjw==
X-Google-Smtp-Source: AGHT+IGzJUNXf+TNcEW5LfxL5bnYCxjEXxNgPqnGgijw2a8Im8TwHIUFXV3t3PoRiPps57Dg0w3t8YQvY6mnNA9fYRg=
X-Received: by 2002:a05:622a:1489:b0:42c:14b7:b603 with SMTP id
 t9-20020a05622a148900b0042c14b7b603mr7579693qtx.36.1707698791705; Sun, 11 Feb
 2024 16:46:31 -0800 (PST)
MIME-Version: 1.0
References: <20240209175631.1337370-1-james.hilliard1@gmail.com>
 <20240209175631.1337370-2-james.hilliard1@gmail.com>
 <Zck8dbS2rUrI23uZ@landeda>
In-Reply-To: <Zck8dbS2rUrI23uZ@landeda>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 11 Feb 2024 17:46:18 -0700
Message-ID: <CADvTj4pr+HFD0w7r62CtTrsGGh_-MXopKg6_HQKyONF8RwRUkA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707698792; x=1708303592; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F4ncXjfd08SR9IbN7+nnLGUIil/tJLxx35hJWAZ+TVg=;
 b=ngK60aYUXIYT6vsF2mIsvOhh+uxOQfBOgbRcojvqiyq9Q35bEfDWei0uAkVT2II3jP
 e8NhjFkzjyO5vhQDHZ+8/yaoirW/kro+jE1FvyaXP7q/yzPpJHdeYWm2mt9zTE8fCR+g
 eRx5AfClEJaKLHXejNQ224npPNunZdYt1bcVumy4L+XqMsJj7J5WNCKkxXxhfZz+XG7B
 /wjQPqmgtRNMFgv8/2Xk/e5nwoUzBt0Y5PW3nzDdqPrSKKdc6TZKkUmLsmZHVkymm2M/
 ZU9ECOVmYO2VFpvAGgb0wW1lK0t6EGVYLsocdun4f9TfZMR5P9HcNqWJ+UKck/BuyuT0
 SOeg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ngK60aYU
Subject: Re: [Buildroot] [PATCH 2/2] package/python-cython: bump to version
 3.0.8
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCBGZWIgMTEsIDIwMjQgYXQgMjozMOKAr1BNIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9y
aW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPgo+IEphbWVzLCBBbGwsCj4KPiBPbiAyMDI0LTAyLTA5
IDEwOjU2IC0wNzAwLCBKYW1lcyBIaWxsaWFyZCBzcGFrZSB0aHVzbHk6Cj4gPiBMaWNlbnNlIGhh
c2ggY2hhbmdlZCBkdWUgdG8gY2hhbmdpbmcgbGlua3MgZnJvbSBodHRwIHRvIGh0dHBzOgo+ID4g
aHR0cHM6Ly9naXRodWIuY29tL2N5dGhvbi9jeXRob24vY29tbWl0LzMzMWQ5ZDgyNGVlNWYwYzUz
OTMxMDMzMjIxNWViZDZlZDMyNTczMjUKPgo+IFRoYW5rcyBmb3IgdGhlIHNpbXBsZSBhbmQgc3Vm
ZmljaWVudCBleHBsYW5hdGlvbi4g8J+RjQo+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxs
aWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPiA+IC0tLQo+IFstLVNOSVAtLV0KPiA+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1jeXRob24vcHl0aG9uLWN5dGhvbi5tayBiL3Bh
Y2thZ2UvcHl0aG9uLWN5dGhvbi9weXRob24tY3l0aG9uLm1rCj4gPiBpbmRleCA0N2UxMDVjMDY1
Li5kNzZiZmI3NjZkIDEwMDY0NAo+ID4gLS0tIGEvcGFja2FnZS9weXRob24tY3l0aG9uL3B5dGhv
bi1jeXRob24ubWsKPiA+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLWN5dGhvbi9weXRob24tY3l0aG9u
Lm1rCj4gPiBAQCAtNCw5ICs0LDkgQEAKPiA+ICAjCj4gPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKPiA+Cj4gPiAtUFlUSE9OX0NZVEhPTl9WRVJTSU9OID0gMC4yOS4zNgo+ID4gK1BZVEhPTl9D
WVRIT05fVkVSU0lPTiA9IDMuMC44Cj4KPiBHaXZlbiB0aGVyZSB3YXMgYW4gZWFybGllciBkaXNj
dXNzaW9uIGFib3V0IGhvdyB0aGUgY3l0aG9uIGJ1bXAgd2FzCj4gY2F1c2luZyBzb21lIGlzc3Vl
cyB3aXRoIHZhcmlvdXMgcGFja2FnZXMsIEkgd291bGQgaGF2ZSBleHBlY3RlZCBhdAo+IGxlYXN0
IGEgcG9zdC1jb21taXQgc3VtbWFyaXNpbmcgd2hhdCB0ZXN0cyB3ZXJlIGRvbmUgdG8gZW5zdXJl
IHRoZSBidW1wCj4gd2FzIE9LLgoKWWVhaCwgdGhlcmUgd2FzIHNvbWUgbW9yZSBicmVha2FnZSB0
aGF0IG5lZWRlZCBmaXhpbmcsIEkgaGFkIHRvIGJ1bXAKc29tZSBwYWNrYWdlcyhudW1weS9zY2lw
eSkgYW5kIHR3ZWFrIGEgZmV3IHRoaW5ncyB0byBnZXQgZXZlcnl0aGluZwpidWlsZGluZyB3aXRo
IGN5dGhvbiAzLgoKPgo+IEFsc28sIGFzIHRob3NlIHNhbWUgZGlzY3Vzc2lvbnMgaGludGVkIGF0
LCBjeXRob24gMC4yOSBzZWVtcyB0byBzdGlsbCBiZQo+IGluIGFjdGl2ZSBkZXZlbG9wbWVudCAo
b3IgYXQgbGVhc3QgYWN0aXZlIG1haW50ZW5hbmNlKSwgc28gdGhlIGNvbW1pdAo+IGxvZyBzaG91
bGQgaGF2ZSBhbHNvIGV4cGxhaW5lZCB3aHkgaXQgd2FzIGRlY2lkZWQgdG8gZ28gd2l0aCBhIGZ1
bGwgYnVtcAo+IHRvIDMuMC54IHJhdGhlciB0aGFuIGludHJpZHVjaW5nIGEgY3l0aG9uMyBwYWNr
YWdlIGFuZCBpbnN0YWxsaW5nIGJvdGgKPiBpbiBwYXJhbGxlbC4gT3IgdGhhdCBpdCB3YXMgbm90
IHBvc3NpYmxyIHRvIGRvIHNvIGJlY2F1cyB0aGV5IGNhbid0IGJlCj4gaW5zdGFsbGVkIGluIHBh
cmFsbGVsLgoKSSdtIG5vdCBhd2FyZSBvZiBhbnkgd2F5IHRvIGluc3RhbGwgYm90aCBhdCB0aGUg
c2FtZSB0aW1lIHNpbmNlIHRoZXkKc2hhcmUgdGhlIHNhbWUgbmFtZXNwYWNlIGVzc2VudGlhbGx5
LgoKPgo+IENvdWxkIHlvdSByZXNwaW4gdGhpcyBzZXJpZXMsIGZpeGluZyB0aGUgY2hlY2stcGFj
a2FnZSBpc3N1ZXMgaW4gcGF0Y2gKPiAxLCBhbmQgZXh0ZW5kaW5nIHRoZSBjb21taXQgbG9nIHBx
dGNoIDIgdG8gYmV0dGVyIGFzc2VzcyB0aGUgc2l0dWF0aW9uLAo+IHBsZWFzZT8KCkFkZGVkIG1v
cmUgZGV0YWlscyBpbiB2MzoKaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1
aWxkcm9vdC9wYXRjaC8yMDI0MDIxMjAwNDEwMS42MTQ2NzAtNS1qYW1lcy5oaWxsaWFyZDFAZ21h
aWwuY29tLwoKPgo+IFJlZ2FyZHMsCj4gWWFubiBFLiBNT1JJTi4KPgo+ID4gIFBZVEhPTl9DWVRI
T05fU09VUkNFID0gQ3l0aG9uLSQoUFlUSE9OX0NZVEhPTl9WRVJTSU9OKS50YXIuZ3oKPiA+IC1Q
WVRIT05fQ1lUSE9OX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2Fn
ZXMvMzgvZGIvZGYwZTk5ZDZjNWZlMTllZTVjOTgxZDIyYWFkNTU3YmU0YmRlZWQzZWNmYWUyNWQ0
N2I4NGIwN2YwZjk4Cj4gPiArUFlUSE9OX0NZVEhPTl9TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRo
b25ob3N0ZWQub3JnL3BhY2thZ2VzLzY4LzA5L2ZmYjYxZjI5YjhlM2QyMDdjNDQ0MDMyYjIxMzI4
MzI3ZDc1M2UyNzRlYTA4MWJjNzRlMDA5ODI3Y2M4MQo+ID4gIFBZVEhPTl9DWVRIT05fU0VUVVBf
VFlQRSA9IHNldHVwdG9vbHMKPiA+ICBQWVRIT05fQ1lUSE9OX0xJQ0VOU0UgPSBBcGFjaGUtMi4w
Cj4gPiAgUFlUSE9OX0NZVEhPTl9MSUNFTlNFX0ZJTEVTID0gQ09QWUlORy50eHQgTElDRU5TRS50
eHQKPiA+IC0tCj4gPiAyLjM0LjEKPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+ID4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+ID4gYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo+Cj4gLS0KPiAuLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0t
LS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgo+IHwg
IFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8
IEVyaWNzJyBjb25zcGlyYWN5OiB8Cj4gfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVz
aWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKPiB8ICszMyA1
NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUv
ICBUaGVyZSBpcyBubyAgfAo+IHwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxf
IHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8Cj4gJy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0t
LS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
