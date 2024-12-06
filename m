Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D1EE77179
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 13:46:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBEDD405DB;
	Fri,  6 Dec 2024 13:46:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HXiD4A_q4O0l; Fri,  6 Dec 2024 13:46:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B13AB405E7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B13AB405E7;
	Fri,  6 Dec 2024 13:46:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 73BF7ECA
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 13:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60D81608D1
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 13:46:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yuCwdwHaA9BO for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 13:45:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B9D5360B49
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9D5360B49
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B9D5360B49
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 13:45:59 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-2ef10b314e4so1749504a91.0
 for <buildroot@buildroot.org>; Fri, 06 Dec 2024 05:45:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733492759; x=1734097559;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qrhZrqt2e4hMTRXgtC19Me3fWpL+U1usRflN9uUuUt4=;
 b=hmSMWfB8XdmY/Jf5NX0gpCOp6MKV9OhEW0g5IIVDQEOWg4rnbQXy1bRPf/gsTD3HBC
 z8FqSrKv5UBFC6II0eOI+RtHY/VaL+R+KVO4T8pNvHyFg2TewrXzcO15njxt2v2EXFiF
 mfZ+4NvTa6Y+Ijqmn/x5yz21eiTrLBuDxdvcnXjbSzYpp3dZVoL2QSzOGEhcDBv0PMoR
 /XhTX0HAMgCIYI2w2PaIQBlOV+glBi3N+1zcz25RkJcwdRU2TLg2I5XEAg8Jqq7Zulfa
 o0M3adIEUcpKtw42wrIb7EiVqWGoLvXrWZn741YLWqy67PlMwLL/pj0FIacpIq8jTQnF
 l7dQ==
X-Gm-Message-State: AOJu0YxygqthEtE0TnYId1B2lccRS3Gg5nTyJWuBU51gz2H9929szH1c
 dlbZhgGs6zLXN7duzt497gL4TRwubXyTOx2/9N/OXKT9w1qT3Vr5wWuSsSWRVMhAjSxK5p9Dh30
 vEL4kbsRYlbWR1ZjCOl+yyfsKvTLAcubO
X-Gm-Gg: ASbGncuNlFcWgqgtw7Uq51vRWYPjrvwd0xxrrYiOYZYn3HFpCwBomC72GLYYIimhhl+
 iDGOYe4TU2DsB6wCrX9y6oolS4j6xVpc=
X-Google-Smtp-Source: AGHT+IFbDQGo5ZxwgQlkznGaK4hLQ+UFCZNv6GSxg7vZp2WhMm+aIgEXdDt159UiroknampmEBidj2l10LZYy2qQIW8=
X-Received: by 2002:a17:90b:5205:b0:2ee:d7d3:3019 with SMTP id
 98e67ed59e1d1-2ef69fffa68mr4865414a91.12.1733492758814; Fri, 06 Dec 2024
 05:45:58 -0800 (PST)
MIME-Version: 1.0
References: <iig5bn2go5jmwxxgusoagg4oapd7kmazljykzgemmnuvtz7a74@m5btvmgminf7>
 <20241203140017.89157-1-vjardin@free.fr>
 <20241203140017.89157-2-vjardin@free.fr>
In-Reply-To: <20241203140017.89157-2-vjardin@free.fr>
From: Brandon Maier <brandon.maier@gmail.com>
Date: Fri, 6 Dec 2024 07:45:46 -0600
Message-ID: <CADwxmT=HZU4=zEneby_NjqVhz6hbBzRHJ8xAqR2O4g0vZsw3Hg@mail.gmail.com>
To: Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Robin Jarry <robin@jarry.cc>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733492759; x=1734097559; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qrhZrqt2e4hMTRXgtC19Me3fWpL+U1usRflN9uUuUt4=;
 b=lgfqhNjOe13xlHT2UypC/dArncmLkTGW+wyfGDV+3/6qfDH/ntruCW2ho6ICHY7fvW
 W0hrDS1C2NwYD5vZu6SEp6lc4nYtQsqNYg5NPWkqmRdeaSqIHsrxqIIeI8tenFlivaSe
 38Gyir6T+KvObHNuSbgQ/Wjm/TrQoqN7NLsuT06uaXqZxQBCJvq5RPbKnAJrV5r93VET
 XbwmUR9WqQnhXuoy1w98fmSeNE0asnViHNAw1uka8EUMj8upwUddnj0zY5aUERtdnac7
 ieXUFA8G7bOnEu2P0AlBP3EInzaY53kYNMgBy2MdBgoxKHy/udg74GbokUBZHAJPykXw
 ItXA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lgfqhNjO
Subject: Re: [Buildroot] [PATCH v4 1/2] package/pkg-meson: h files only into
 sysroot
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

SGkgVmluY2VudCwKClNvcnJ5IGZvciByZXNlbmQsIGZvcmdvdCB0byBSZXBseS1BbGwKCk9uIFR1
ZSwgRGVjIDMsIDIwMjQgYXQgODowMOKAr0FNIFZpbmNlbnQgSmFyZGluIDx2amFyZGluQGZyZWUu
ZnI+IHdyb3RlOgo+Cj4gTWFueSBwYWNrYWdlcyBidWlsdCB3aXRoIEJ1aWxkcm9vdCBhbmQgbWVz
b24gY3VycmVudGx5IGluc3RhbGwgaGVhZGVyCj4gZmlsZXMgaW50byBib3RoOgo+ICAgLSB0aGUg
dGFyZ2V04oCZcyAvdXNyL2luY2x1ZGUsIGFuZAo+ICAgLSB0aGUgc3lzcm9vdOKAmXMgL3Vzci9p
bmNsdWRlLgo+Cj4gV2hlbiBGT09fTUVTT05fSU5TVEFMTF9UQUdTID0gWUVTLCBlbnN1cmUgdGhh
dCBoZWFkZXIgZmlsZXMgYXJlCj4gaW5zdGFsbGVkIGV4Y2x1c2l2ZWx5IGluIHRoZSBzdGFnaW5n
IChzeXNyb290KSB0YXJnZXQgZHVyaW5nIHRoZQo+IGJ1aWxkIHByb2Nlc3MuCj4KPiBUaGUgZGVm
YXVsdCBpcyBGT09fTUVTT05fSU5TVEFMTF9UQUdTID89IE5PIGluIG9yZGVyIHRvIGF2b2lkCj4g
Y2hhbmdpbmcgdG8gdGhpcyBuZXcgYmVoYXZpb3VyIGZvciB0aGUgdGltZSBiZWluZy4KPgo+IFNp
Z25lZC1vZmYtYnk6IFZpbmNlbnQgSmFyZGluIDx2amFyZGluQGZyZWUuZnI+Cj4gU3VnZ2VzdGVk
LWJ5OiBSb2JpbiBKYXJyeSA8cm9iaW5AamFycnkuY2M+Cj4gU3VnZ2VzdGVkLWJ5OiBCcmFuZG9u
IE1haWVyIDxicmFuZG9uLm1haWVyQGdtYWlsLmNvbT4KPiAtLS0KPiAgcGFja2FnZS9wa2ctbWVz
b24ubWsgfCAxMSArKysrKysrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcGtnLW1lc29uLm1rIGIv
cGFja2FnZS9wa2ctbWVzb24ubWsKPiBpbmRleCBiYzgwNWI3OTljLi40NTY4Zjg2OTBlIDEwMDY0
NAo+IC0tLSBhL3BhY2thZ2UvcGtnLW1lc29uLm1rCj4gKysrIGIvcGFja2FnZS9wa2ctbWVzb24u
bWsKPiBAQCAtMjIwLDEwICsyMjAsMTMgQEAgZW5kaWYKPiAgaWZuZGVmICQoMilfSU5TVEFMTF9D
TURTCj4gIGRlZmluZSAkKDIpX0lOU1RBTExfQ01EUwo+ICAgICAgICAgJCQoSE9TVF9NQUtFX0VO
VikgJCQoJCQoUEtHKV9OSU5KQV9FTlYpIFwKPiAtICAgICAgICAgICAgICAgJCQoTklOSkEpICQk
KE5JTkpBX09QVFMpIC1DICQkKCQkKFBLRylfU1JDRElSKS9idWlsZCBpbnN0YWxsCj4gKyAgICAg
ICAgICAgICAgICQkKE1FU09OKSBpbnN0YWxsIC1DICQkKCQkKFBLRylfU1JDRElSKS9idWlsZAo+
ICBlbmRlZgo+ICBlbmRpZgo+Cj4gKyMgRGVmYXVsdCB2YWx1ZXMgZm9yIFN0YWdpbmcgaW5zdGFs
bGF0aW9uIGFuZCBUYXJnZXQgaW5zdGFsbGF0aW9uCj4gKyQoMilfTUVTT05fSU5TVEFMTF9UQUdT
ID89IE5PCj4gKwo+ICAjCj4gICMgU3RhZ2luZyBpbnN0YWxsYXRpb24gc3RlcC4gT25seSBkZWZp
bmUgaXQgaWYgbm90IGFscmVhZHkgZGVmaW5lZCBieQo+ICAjIHRoZSBwYWNrYWdlIC5tayBmaWxl
Lgo+IEBAIC0yMzEsNyArMjM0LDggQEAgZW5kaWYKPiAgaWZuZGVmICQoMilfSU5TVEFMTF9TVEFH
SU5HX0NNRFMKPiAgZGVmaW5lICQoMilfSU5TVEFMTF9TVEFHSU5HX0NNRFMKPiAgICAgICAgICQk
KFRBUkdFVF9NQUtFX0VOVikgJCQoJCQoUEtHKV9OSU5KQV9FTlYpIERFU1RESVI9JCQoU1RBR0lO
R19ESVIpIFwKPiAtICAgICAgICAgICAgICAgJCQoTklOSkEpICQkKE5JTkpBX09QVFMpIC1DICQk
KCQkKFBLRylfU1JDRElSKS9idWlsZCBpbnN0YWxsCj4gKyAgICAgICAgICAgICAgICQkKE1FU09O
KSBpbnN0YWxsIC1DIFwKPiArICAgICAgICAgICAgICAgICAkJCgkJChQS0cpX1NSQ0RJUikvYnVp
bGQgJChpZiAkKGZpbHRlciBZRVMsJCgkKDIpX01FU09OX0lOU1RBTExfVEFHUykpLC0tdGFncz1y
dW50aW1lJChjb21tYSlkZXZlbCkKCkl0IGxvb2tzIGxpa2UgIiQiIGRpZG4ndCBnZXQgY2hhbmdl
ZCB0byAiJCQiLiBBbHNvIHRoaXMgaXMgdXNpbmcKIiQoMikiIG5vdyBpbnN0ZWFkIG9mICIkJChQ
S0cpIiBsaWtlIGJlZm9yZS4KCkZvciBleGFtcGxlOgoKPiAkJCgkJChQS0cpX1NSQ0RJUikvYnVp
bGQgJCQoaWYgJCQoZmlsdGVyIFlFUywkJCgkJChQS0cpX01FU09OX0lOU1RBTExfVEFHUykpLC0t
dGFncz1ydW50aW1lJChjb21tYSlkZXZlbCkKClRoYW5rcywKQnJhbmRvbgoKPiAgZW5kZWYKPiAg
ZW5kaWYKPgo+IEBAIC0yNDIsNyArMjQ2LDggQEAgZW5kaWYKPiAgaWZuZGVmICQoMilfSU5TVEFM
TF9UQVJHRVRfQ01EUwo+ICBkZWZpbmUgJCgyKV9JTlNUQUxMX1RBUkdFVF9DTURTCj4gICAgICAg
ICAkJChUQVJHRVRfTUFLRV9FTlYpICQkKCQkKFBLRylfTklOSkFfRU5WKSBERVNURElSPSQkKFRB
UkdFVF9ESVIpIFwKPiAtICAgICAgICAgICAgICAgJCQoTklOSkEpICQkKE5JTkpBX09QVFMpIC1D
ICQkKCQkKFBLRylfU1JDRElSKS9idWlsZCBpbnN0YWxsCj4gKyAgICAgICAgICAgICAgICQkKE1F
U09OKSBpbnN0YWxsIC1DIFwKPiArICAgICAgICAgICAgICAgICAkJCgkJChQS0cpX1NSQ0RJUikv
YnVpbGQgJChpZiAkKGZpbHRlciBZRVMsJCgkKDIpX01FU09OX0lOU1RBTExfVEFHUykpLC0tdGFn
cz1ydW50aW1lKQo+ICBlbmRlZgo+ICBlbmRpZgo+Cj4gLS0KPiAyLjM0LjEKPgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
