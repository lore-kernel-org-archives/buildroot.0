Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DA6CD4F3C
	for <buildroot@archiver.kernel.org>; Tue, 19 May 2026 14:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B6AD81459;
	Tue, 19 May 2026 14:52:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UDOJ4SdHEQSQ; Tue, 19 May 2026 14:51:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6C6181457
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779202318;
	bh=HesQ13vhiDgSw7KmbLh8Acl/iHMqHhm8UGWbl9uFuPc=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kxD0dcwR12fXtIt9zXV3i2bqYJIhpx+ZDKHsYJYHy2MgOJRC+FerazYWovau2Ta+5
	 uw4BcRhtFmRCIn2TjKirJchl18TxhERmhXiJK73GFKbHtAShibbb9QktSDevq9BEct
	 AoqGolVHaLmUY5TZflf6lqljBIQzzJKPAtyhxhDi9a9Izr1z0uYnIebd2x1beEpxSf
	 4U3HNKS9SJuzRWEd1hzYKb4Io7C0jy2jwTvbpm12BY/oD0aF5h41hv+UEkBJzr+LcX
	 Ae4D5QsovtVreIhYzLykoLtikAaCFYdlRd/zf7O3i3vBXngBdi0wU/kjKCmMl/CKyJ
	 Y2ARlfgu6OC5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6C6181457;
	Tue, 19 May 2026 14:51:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AD2A265
 for <buildroot@buildroot.org>; Tue, 19 May 2026 14:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C944403DF
 for <buildroot@buildroot.org>; Tue, 19 May 2026 14:51:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NgprYjl7O67a for <buildroot@buildroot.org>;
 Tue, 19 May 2026 14:51:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=ferdinand.bachmann@go-e.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3F5FB40383
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F5FB40383
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3F5FB40383
 for <buildroot@buildroot.org>; Tue, 19 May 2026 14:51:55 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-670ab084a39so7748023a12.3
 for <buildroot@buildroot.org>; Tue, 19 May 2026 07:51:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779202314; cv=none;
 d=google.com; s=arc-20240605;
 b=VYSvhBAFJ9m0nJQyn+s654NmNGsrgZmtv+5mayHiMT7gEqjXgWZ/VBlU/SnmH48QWg
 7CrZEElNoGPVCBBRYt7ve7E2Yg/948igkAmJWV44xdAU/fDtI2IKNCrZvgeF9qQL6Cpu
 Dd5mL1wrHZgQ738Yr8cr+ekyxy4Fsjolk4qdUYa1Edl9zEDWBRuU/y4B3m5HoXB8keA7
 D32ENx8m4nLiGgklv1jvx7njkDtvmegaUIRjYEKsy0a9+tCkdkfgUd3Yi2vaU9ZbdfWs
 TfGFWXb2Tk3RuStXvWaZ+5ZOqUQ70EcrqSAS4i01++AR34yRLJgpmPZhRafVkolZ9FIR
 r24A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=SU6aGK7YMYIgWLPVtFdyqpq+te8N3xayLmmXuxOvGxc=;
 fh=0nwLaggL3i6KHZ2RdydBx/Q4zGu1osT4G0sAVR5//50=;
 b=G+VX+/zoT7czWLxs4tp/wEwVL0Uum5pLFJoGlJwG+AMNVmM7NFRzoOw5H8eSwiAuwL
 D+CU7e9d6Lcttn3T92X3y15lMJBYYA+nysIuasSTSfmkpncn44D4ucGLeLjIxha1JDVT
 +NPBqrlWPdsqPQi9mb9oaoysNwoMVsk/KzEjDsb2+Op+8GZXCbGJFiM+BAFaiuF0+m56
 ZNGZBbUnEWcAbZ7zvAlPPMW1OJzpeq7v96Tm2QreN3s8QgypWfJQb7nSez4lStFreLHU
 hbtcP5LSKVnvq9ls67t54Slb2xkQduyFPtsf9LibV5kIxlJpcb0QD2SnSqJpqd+CmQLt
 hSFg==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779202314; x=1779807114;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SU6aGK7YMYIgWLPVtFdyqpq+te8N3xayLmmXuxOvGxc=;
 b=jJgzxXX3i0HgyJSC6lv/kthbkIu7jjCfT6JICSLA9fs2WukqyF3kx5GiSeiH6SqXZ0
 JyAtuwMJMqNF4oKj4QtEAJTrLkt24KkFY2zFSJBX8Ia4l/eEcQuyaywH/VxI6zg6yAtH
 Psx9Rd6OEfI99JcO3fME/114QOweV25U8LAzbTqWilpuPM1HAPxw2rklv2qgxWzK1ZjF
 Q2qPPN/XjcbS68vJaZKVdD0tI75DVAWJ3fmXb2vHhtJxzPicJoA9mq4+IDXiqYmUKrtA
 2jtmsvuRBfKhhqL98OIaDF4U36G/ThbqmHMLei/83U89cdu/TB87LY2YUctgiAE8wmYt
 fpYg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/BUWGtgOjqfGkDflAKsU5ir6c5lbbjyQgrkznyALcm85mStnfpU7bU1Mv3l4KlnmRRut3BLUn7UFA=@buildroot.org
X-Gm-Message-State: AOJu0YxG/7rkP/0MLCUrkVSCA2PU98i6raKe7asDsf0WOZ93+qljeTY2
 P9IJMO4vBK7BzBxbGhV0WzRqQlfcLQbQiYySIgHuFtG3Yw3FLbHIbQKKb2ZOjSlPtJFM+NC5D5I
 //xQAIL7wYdPnyvbtOnhJfRgR3Q79aDHXgvwFbY6B2w==
X-Gm-Gg: Acq92OH2PLZNCqhDcpFu/Spp78XvhUryit+GwaTKNhQ4bpdmIL9KDbnbH30L5TO0pIM
 V0FsY9YWqnkVc3K/Z6KoKh1TyduOgxx0fO3u96POa+Yf2afnmCKmYImQ62gbXZ0A0Fv2oxiQcO2
 2+gj2Hg3hknCktLS34ruT1KSD0EErlAk9u4tHCMjDFDQYRRsTWYO4ij2s//sL50AKnM+FxRfUdX
 3OtUh9IRo+ktYo1eSEYEcQpzaWMbB0yOQ8w9wzTb16pn/dhVNNOoEBlyBtvpl9N4rFoXErSLKHn
 96kAwhBDANSJUool
X-Received: by 2002:a05:6402:3605:b0:678:f8f4:a7f3 with SMTP id
 4fb4d7f45d1cf-683ba93aa82mr10096813a12.0.1779202313746; Tue, 19 May 2026
 07:51:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
 <20260506223341.1759760-35-james.hilliard1@gmail.com>
 <CAMwDAPiSOPm2OCNJXe1ko3YDUodcmnMBURPKB2b_nbJU+AQK=g@mail.gmail.com>
 <CADvTj4r-B5eHr0K3XchEy8g_umaYXos953A-FnARLg+gG=Z+Zw@mail.gmail.com>
 <657bfb7e-7963-43ba-aa6a-a185c3eb4dbf@rnout.be>
In-Reply-To: <657bfb7e-7963-43ba-aa6a-a185c3eb4dbf@rnout.be>
From: Ferdinand Bachmann <ferdinand.bachmann@go-e.com>
Date: Tue, 19 May 2026 16:51:42 +0200
X-Gm-Features: AVHnY4LVcN8i0uizJBfWFY535mNb5APf7M5kBl13mQzSB0TnGLjhmmMH-X9ks0Q
Message-ID: <CAMwDAPjhsGd3RDLi+6B5ENzXiT+wb-PB-5HG5NfSp83skFz4tw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, Gary Bisson <bisson.gary@gmail.com>,
 Alexander Clouter <alex+buildroot@digriz.org.uk>,
 Sergio Prado <sergio.prado@e-labworks.com>, 
 Sergey Matyukevich <geomatsi@gmail.com>, Bernd Kuhls <bernd@kuhls.net>, 
 Brandon Maier <brandon.maier@collins.com>,
 "Alvaro G . M" <alvaro.gamez@hazent.com>, 
 Paul Cercueil <paul@crapouillou.net>, Refik Tuzakli <tuzakli.refik@gmail.com>, 
 Doug Kehn <rdkehn@gmail.com>, Spenser Gilliland <spenser@gillilanding.com>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marcus Hoffmann <bubu@bubu1.eu>, Pascal de Bruijn <p.debruijn@unilogic.nl>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=go-e.com; s=google; t=1779202314; x=1779807114; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SU6aGK7YMYIgWLPVtFdyqpq+te8N3xayLmmXuxOvGxc=;
 b=Yb0NnfkaN4HdrWfICxPubfIbfmn222QWpzlUgmrYpJWHOGrB8jmHCqqEfFoZP5NYCW
 SMCjBwVDrFOr7eCwvnktmI7BNx69PLdDZgmrrOvZAPMZoF8G+2skbXliz+HTdZCOptIM
 7o8UJzi4mPaeKqqZqDtC9KwntQqBRBZbuuASao82Bo8PAiTs1ci+5fG7e0B6CX/3My7f
 FHQhlw0O0DzEnCV7gB107KINk9Cbjr4i7ai+h5l/aW66PJNTCcCLRB5bXeHDLehRciEm
 O7/G71SyCdKXYhtlFS9MNcCzRQ/TxxCvA2NnJQBgj/sFGxW7//SlzYTD4wWKRdCgsFzA
 5sCA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=go-e.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=go-e.com header.i=@go-e.com header.a=rsa-sha256
 header.s=google header.b=Yb0Nnfka
Subject: Re: [Buildroot] [PATCH 35/40] package/uboot-tools: preserve
 /usr/sbin symlink
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

SGkhCgpPbiBNb24sIDE4IE1heSAyMDI2IGF0IDIyOjI5LCBBcm5vdXQgVmFuZGVjYXBwZWxsZSA8
YXJub3V0QHJub3V0LmJlPiB3cm90ZToKPiBPbiAwOC8wNS8yMDI2IDIwOjA5LCBKYW1lcyBIaWxs
aWFyZCB3cm90ZToKPiA+IE9uIEZyaSwgTWF5IDgsIDIwMjYgYXQgMzo1N+KAr0FNIEZlcmRpbmFu
ZCBCYWNobWFubgo+ID4gPGZlcmRpbmFuZC5iYWNobWFubkBnby1lLmNvbT4gd3JvdGU6Cj4gPj4K
PiA+PiBIaSBKYW1lcyEKPiA+Pgo+ID4+IC1EIG5vcm1hbGx5IGRvZXNuJ3QgcmVwbGFjZSBzeW1s
aW5rcyB3aXRoIGRpcmVjdG9yaWVzLCBidXQgVWJ1bnR1IDI2LjA0IHNoaXBzIHdpdGggUnVzdCB1
dXRpbHMgaW5zdGVhZCBvZiBHTlUgY29yZXV0aWxzLCB3aGljaCBoYXMgYSBidWcgaW4gYGluc3Rh
bGxgIHRoYXQgY2F1c2VzIHRoaXM6Cj4KPiAgIEFoLCBJIHNob3VsZCBoYXZlIHJlYWQgdGhlIHJl
c3Qgb2YgdGhlIHRocmVhZCBiZWZvcmUgcmVwbHlpbmcgdG8gcGF0Y2ggMS80MCA6LSkKCkkgbW9z
dGx5IHNhdyB0aGlzIGJlY2F1c2UgSSBoYWQgYSBmaWx0ZXIgZm9yICJ1Ym9vdC10b29scyI7IEkg
ZGlkbid0CmV2ZW4gbm90aWNlIHRoYXQgaXQgd2FzIHBhcnQgb2YgYSBsYXJnZXIgcGF0Y2ggc2V0
LCBzb3JyeSBmb3Igbm90CnJlYWRpbmcgdGhlIHN1YmplY3QgbGluZSBjb3JyZWN0bHkgXl4iLgoK
PiA+IE9oLCB0aGF0IG1ha2VzIG1vcmUgc2Vuc2UsIEkgaGFkIGFzc3VtZWQgaXQgd2FzIGR1ZSB0
byBtZXJnZWQgYmluCj4gPiBzaW5jZSB0aGUgcnN5bmMgZXJyb3Igd2FzIGJhc2ljYWxseSB0aGUg
c2FtZSBhcyB0aGlzOgo+ID4gaHR0cHM6Ly9naXRodWIuY29tL2J1aWxkcm9vdC9idWlsZHJvb3Qv
Y29tbWl0LzI4Njk0ZGNlYzcyYjExZmFjYTZlOWQ5MzcxZmIwZjY1YzU5MGRlOGIKPiA+Cj4gPiBJ
IHRlc3RlZCB3aXRoIHRoZSBkb2N1bWVudGVkIHdvcmthcm91bmQgb24gZ2l0aHViIGFuZCBpdCBz
ZWVtcyB0byBoYXZlCj4gPiBmaXhlZCB0aGUgaXNzdWU6Cj4gPiB1cGRhdGUtYWx0ZXJuYXRpdmVz
IC0taW5zdGFsbCAvdXNyL2Jpbi9pbnN0YWxsIGluc3RhbGwgL3Vzci9iaW4vZ251aW5zdGFsbCAx
MDAKPiA+Cj4gPj4KPiA+PiBodHRwczovL2dpdGh1Yi5jb20vdXV0aWxzL2NvcmV1dGlscy9pc3N1
ZXMvMTIxNjYKPiA+Pgo+ID4+IFRoaXMgYWxzbyBhZmZlY3RzIGxvdHMgb2Ygb3RoZXIgcGFja2Fn
ZXMgKGUuZy4gbHZtMikgYW5kIHBhdGNoaW5nIGV2ZXJ5IHNpbmdsZSBvbmUgb2YgdGhlbSB0byBu
b3QgdXNlIGBpbnN0YWxsIC1EYCBpcyBwcm9iYWJseSBvdXQgb2YgdGhlIHF1ZXN0aW9uLgo+Cj4g
ICBBY3R1YWxseSwgaWYgaXQncyByZWFsbHkgYSB1dXRpbHMgaXNzdWUsIHBsZWFzZSByZXBvcnQg
aXQgdG8gVWJ1bnR1LiBUaGV5IGFyZQo+IHZlcnkgZ29vZCBhdCBmaXhpbmcgdGhpcyBzdHVmZiBx
dWlja2x5LiBJIGV4cGVjdCB0aGUgaXNzdWUgdG8gZGlzYXBwZWFyIHNob3J0bHkuCgpUaGlzIHdh
cyByZXBvcnRlZCB0byBVYnVudHUgYXMKaHR0cHM6Ly9idWdzLmxhdW5jaHBhZC5uZXQvdWJ1bnR1
Lytzb3VyY2UvcnVzdC1jb3JldXRpbHMvK2J1Zy8yMTUxNDU0Cm9uIE1heSA2dGguIFRoZSBidWcg
aGFzIG5vdCBiZWVuIHRyaWFnZWQgYnkgdGhlIFVidW50dSB0ZWFtIHlldCBhbmQgaXMKc3RpbGwg
bWFya2VkICJuZXciLgoKQXMgb2YgdG9kYXkgdGhlcmUgaXMgbm8gZml4IHBhY2thZ2UgYXZhaWxh
YmxlLiBUaGUgdXBzdHJlYW0gdXV0aWxzIGZpeApQUiBodHRwczovL2dpdGh1Yi5jb20vdXV0aWxz
L2NvcmV1dGlscy9wdWxsLzExNTA1IGlzIHN0aWxsIGluIHJldmlldy4KCj4gPgo+ID4gSG1tLCB5
ZWFoLCB0aGF0J3Mgbm90IGlkZWFsLCBub3Qgc3VyZSBpZiB3ZSBzaG91bGQgc3RpbGwgY2hhbmdl
IHRoZSA0MAo+ID4gSSBwYXRjaGVkIG9yIG5vdC4KPgo+ICAgTm8sIHdlIHNob3VsZG4ndC4gSSBt
YXJrZWQgdGhlIGVudGlyZSBzZXJpZXMgYXMgUmVqZWN0ZWQuCj4KPiAgIFBsZWFzZSBkb24ndCB0
aHJvdyBhd2F5IHlvdXIgYnJhbmNoIHlldCB0aG91Z2guIElmIFVidW50dSBjbGFpbXMgdGhhdCBp
dCdzIG5vdAo+IGFjdHVhbGxseSBhIGJ1Zywgd2UncmUgZ29pbmcgdG8gbmVlZCBpdCBhZnRlciBh
bGwuCj4KPiAgIFJlZ2FyZHMsCj4gICBBcm5vdXQKCklmIHRoaXMgdGFrZXMgdG9vIGxvbmcgZm9y
IGEgZml4IHRvIGFwcGVhciB1cHN0cmVhbSBpdCBjb3VsZCBiZSBhIGdvb2QKaWRlYSB0byBtZW50
aW9uIHRoZSB3b3JrYXJvdW5kIGluIGEgbmV3cyBwb3N0aW5nIGZvciB0aGUgbmV4dCByZWxlYXNl
CnNvIHVzZXJzIGFyZW4ndCBjb25mdXNlZCBieSB0aGUgYnVpbGQgZmFpbHVyZXMuCgpCZXN0IFJl
Z2FyZHMsCkZlcmRpbmFuZCBCYWNobWFubgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
