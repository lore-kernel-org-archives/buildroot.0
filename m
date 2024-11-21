Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88378D6ED3B
	for <buildroot@archiver.kernel.org>; Thu, 21 Nov 2024 13:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27755605AF;
	Thu, 21 Nov 2024 13:49:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OcB7mwaxy-yc; Thu, 21 Nov 2024 13:49:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22F94605C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22F94605C1;
	Thu, 21 Nov 2024 13:49:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 11C5AB69
 for <buildroot@buildroot.org>; Thu, 21 Nov 2024 13:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 008DD605C1
 for <buildroot@buildroot.org>; Thu, 21 Nov 2024 13:49:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q8K5g_WeXG0W for <buildroot@buildroot.org>;
 Thu, 21 Nov 2024 13:49:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EB439605AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB439605AF
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB439605AF
 for <buildroot@buildroot.org>; Thu, 21 Nov 2024 13:49:27 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-2ea527ae14aso758964a91.1
 for <buildroot@buildroot.org>; Thu, 21 Nov 2024 05:49:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732196967; x=1732801767;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=StWP5syHmcDOzXdAOtEXBlxeDfc51EhNkEMYE476VrM=;
 b=Flpw7U5RjWlqh/0lqn5494CLE+oXQyrtggnOmtA5DWFERbjdlOK6KECz+qgIwBX8+B
 oLT0KkxZ+Tj7+hXcUT9J7r3SD197Jxl7XUtKjSxlR+GypI4v8C1czNFTdKlHIOcCjdin
 lZy3wIVIfQfUtymE8QSs6TQGtS/rSUi7F+4SmsEk6azkKMTWhw/+FUhHCnif6ehwaUKW
 Q5KmsUf+aEKeLSuD1Sxa4e6aLwQD1mpr5Nh3j9tiyemQUNSusbiRab/IecyfCL9PAqEe
 EilKUwp+3N1ppPGY1cu0lPR75IkuvQ4O1D3Ohce7imjJ8zagYs6dn96PTQG5uMU0mcMl
 uXRQ==
X-Gm-Message-State: AOJu0Ywebh/gpDYxo8nPQiLxDcAtwIhDepDms/T8WXJKLUrV7nYTy3df
 XWmL70Q61vWImrLbWamW8W6+3pS0XHAozfrbPjEtU9zzso/cN4TMkdoNzzzJNfe4nb96iyb85V8
 ZEAEXQsJwmzILTzyNZOcAFPhY7IC4gvcU
X-Gm-Gg: ASbGnctDy5yQJgxAJ0wSqvMdomoFfEURnPk4KaQTfHVLQDhtFW2dIsCydBvlgxODaBO
 CgQw3O6uO8UebkL1Yd//RZ2w2SLdnxuI=
X-Google-Smtp-Source: AGHT+IFZ7CVPMiFbyWdSWoe1XBBOn6CSGaBu0Yc6tkb7ky+3YUtiKe30MB7TV05mTd9v5sajOd7aVKdFyfTBh3lA+Z8=
X-Received: by 2002:a17:90b:3b90:b0:2ea:3f34:f1a0 with SMTP id
 98e67ed59e1d1-2eaca7cf1damr8118704a91.30.1732196966912; Thu, 21 Nov 2024
 05:49:26 -0800 (PST)
MIME-Version: 1.0
References: <20241119205901.58762-1-vjardin@free.fr>
In-Reply-To: <20241119205901.58762-1-vjardin@free.fr>
From: Brandon Maier <brandon.maier@gmail.com>
Date: Thu, 21 Nov 2024 07:49:15 -0600
Message-ID: <CADwxmTktxHDhbw56oraJFHrNknUD+sqNvbAD8EpOEJHKs-5vDQ@mail.gmail.com>
To: Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Robin Jarry <robin@jarry.cc>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732196967; x=1732801767; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=StWP5syHmcDOzXdAOtEXBlxeDfc51EhNkEMYE476VrM=;
 b=a2z64TIlVrJb2Fk4sVV9XF25fYM+nxPhAWfGMJQJr9jKcaqjkyvGivjKmb4HQ8QQMK
 z9ERyGt/tQpEpPlzaTH3lhdN8qb16GI6lCTch0CEm8NmZBlycUHKRLYGiN4H//pS/X6c
 T7nCQOrns70BMeQOZiYsBHtD6t9UXaTjnBvuqATJ7p8kP3L9t92ZnqDLY/qgyG4athZy
 ZI8ZmVYH1MpOn/XCF+HsZwxaK/VsrpzoXecGjZFnyVL27g7Yoo2yN1AGummawtrW7l3+
 jN1ROSR823fuKiNkFSMnx4XYm/hrTpRGqmUFlMELaNrurBl5l5gnjH60pKoeTkH0R8hY
 Yz5Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=a2z64TIl
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-meson: h files only into
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

SGkgVmluY2VudCwKCk9uIFR1ZSwgTm92IDE5LCAyMDI0IGF0IDM6MDDigK9QTSBWaW5jZW50IEph
cmRpbiA8dmphcmRpbkBmcmVlLmZyPiB3cm90ZToKPgo+IE1hbnkgcGFja2FnZXMgYnVpbHQgd2l0
aCBCdWlsZHJvb3QgYW5kIG1lc29uIGN1cnJlbnRseSBpbnN0YWxsIGhlYWRlcgo+IGZpbGVzIGlu
dG8gYm90aDoKPiAgIC0gdGhlIHRhcmdldOKAmXMgL3Vzci9pbmNsdWRlLCBhbmQKPiAgIC0gdGhl
IHN5c3Jvb3TigJlzIC91c3IvaW5jbHVkZS4KPgo+IEVuc3VyZSB0aGF0IGhlYWRlciBmaWxlcyBh
cmUgaW5zdGFsbGVkIGV4Y2x1c2l2ZWx5IGluIHRoZSBzdGFnaW5nCj4gKHN5c3Jvb3QpIHRhcmdl
dCBkdXJpbmcgdGhlIGJ1aWxkIHByb2Nlc3MuCj4KPiBTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IEph
cmRpbiA8dmphcmRpbkBmcmVlLmZyPgo+IFN1Z2dlc3RlZC1ieTogUm9iaW4gSmFycnkgPHJvYmlu
QGphcnJ5LmNjPgo+IC0tLQo+ICBwYWNrYWdlL3BrZy1tZXNvbi5tayB8IDYgKysrLS0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9wa2ctbWVzb24ubWsgYi9wYWNrYWdlL3BrZy1tZXNvbi5tawo+IGluZGV4
IGJjODA1Yjc5OWMuLmQ3YjhkNDU2YjggMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9wa2ctbWVzb24u
bWsKPiArKysgYi9wYWNrYWdlL3BrZy1tZXNvbi5tawo+IEBAIC0yMjAsNyArMjIwLDcgQEAgZW5k
aWYKPiAgaWZuZGVmICQoMilfSU5TVEFMTF9DTURTCj4gIGRlZmluZSAkKDIpX0lOU1RBTExfQ01E
Uwo+ICAgICAgICAgJCQoSE9TVF9NQUtFX0VOVikgJCQoJCQoUEtHKV9OSU5KQV9FTlYpIFwKPiAt
ICAgICAgICAgICAgICAgJCQoTklOSkEpICQkKE5JTkpBX09QVFMpIC1DICQkKCQkKFBLRylfU1JD
RElSKS9idWlsZCBpbnN0YWxsCj4gKyAgICAgICAgICAgICAgICQkKE1FU09OKSBpbnN0YWxsIC1D
ICQkKCQkKFBLRylfU1JDRElSKS9idWlsZAo+ICBlbmRlZgo+ICBlbmRpZgo+Cj4gQEAgLTIzMSw3
ICsyMzEsNyBAQCBlbmRpZgo+ICBpZm5kZWYgJCgyKV9JTlNUQUxMX1NUQUdJTkdfQ01EUwo+ICBk
ZWZpbmUgJCgyKV9JTlNUQUxMX1NUQUdJTkdfQ01EUwo+ICAgICAgICAgJCQoVEFSR0VUX01BS0Vf
RU5WKSAkJCgkJChQS0cpX05JTkpBX0VOVikgREVTVERJUj0kJChTVEFHSU5HX0RJUikgXAo+IC0g
ICAgICAgICAgICAgICAkJChOSU5KQSkgJCQoTklOSkFfT1BUUykgLUMgJCQoJCQoUEtHKV9TUkNE
SVIpL2J1aWxkIGluc3RhbGwKPiArICAgICAgICAgICAgICAgJCQoTUVTT04pIGluc3RhbGwgLUMg
JCQoJCQoUEtHKV9TUkNESVIpL2J1aWxkIC0tdGFncz1ydW50aW1lLGRldmVsCgpXaGVuIHRoZSBg
LS10YWdzYCBhcmd1bWVudCBpcyB1c2VkLCBNZXNvbiB3aWxsIG5vdCBpbnN0YWxsIGZpbGVzIHRo
YXQKYXJlIHVudGFnZ2VkLgpUaGlzIGNvdWxkIGNhdXNlIHRoaW5ncyBsaWtlIE1lc29uIGBjdXN0
b21fdGFyZ2V0KClgIGZpbGVzIHRvIHN0b3AKYmVpbmcgaW5zdGFsbGVkLgoKU2VlIGxhc3QgcGFy
YWdyYXBoIG9mOiBodHRwczovL21lc29uYnVpbGQuY29tL0luc3RhbGxpbmcuaHRtbCNpbnN0YWxs
YXRpb24tdGFncwoKV2Ugc2hvdWxkIGJlIGNhcmVmdWwgdGhhdCB0aGlzIGRvZXNuJ3QgY2F1c2Ug
YW55IGV4aXN0aW5nIE1lc29uCnBhY2thZ2VzIHRvIGJyZWFrLgpXZSBtYXkgd2FudCBhIHdheSBm
b3IgYSBwYWNrYWdlIHRvIGluc3RhbGwgd2l0aG91dCB0YWdzLCBvciB0byBpbnN0YWxsCndpdGgg
b3RoZXIgdGFncy4KUGVyaGFwcyBhIG5ldyB2YXJpYWJsZSBsaWtlICQoUEtHKV9NRVNPTl9JTlNU
QUxMX1NUQUdJTkdfVEFHUy4KClRoYW5rcyEKQnJhbmRvbgoKPiAgZW5kZWYKPiAgZW5kaWYKPgo+
IEBAIC0yNDIsNyArMjQyLDcgQEAgZW5kaWYKPiAgaWZuZGVmICQoMilfSU5TVEFMTF9UQVJHRVRf
Q01EUwo+ICBkZWZpbmUgJCgyKV9JTlNUQUxMX1RBUkdFVF9DTURTCj4gICAgICAgICAkJChUQVJH
RVRfTUFLRV9FTlYpICQkKCQkKFBLRylfTklOSkFfRU5WKSBERVNURElSPSQkKFRBUkdFVF9ESVIp
IFwKPiAtICAgICAgICAgICAgICAgJCQoTklOSkEpICQkKE5JTkpBX09QVFMpIC1DICQkKCQkKFBL
RylfU1JDRElSKS9idWlsZCBpbnN0YWxsCj4gKyAgICAgICAgICAgICAgICQkKE1FU09OKSBpbnN0
YWxsIC1DICQkKCQkKFBLRylfU1JDRElSKS9idWlsZCAtLXRhZ3M9cnVudGltZQo+ICBlbmRlZgo+
ICBlbmRpZgo+Cj4gLS0KPiAyLjM0LjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
