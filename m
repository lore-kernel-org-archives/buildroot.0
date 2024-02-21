Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8789C48BEB
	for <buildroot@archiver.kernel.org>; Wed, 21 Feb 2024 20:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B43D80AB1;
	Wed, 21 Feb 2024 20:09:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CHYubAWpfF7K; Wed, 21 Feb 2024 20:09:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5245C81E40
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5245C81E40;
	Wed, 21 Feb 2024 20:09:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 810F91BF41B
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 20:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D91B417BA
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 20:09:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bofsz-sI_5TZ for <buildroot@lists.busybox.net>;
 Wed, 21 Feb 2024 20:09:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DD693405B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD693405B3
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD693405B3
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 20:09:50 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-dbed0710c74so5053122276.1
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 12:09:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708546189; x=1709150989;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cXQ6LHrlUc2ELs6gZ93PU+ASJ/JzefcP7uh7kf1ZVP0=;
 b=ObYEOAmgCCgd8w48i3L2UdexJQunHZ4YMDI7J0Exht2HzFinzmEdqVDj3JGTvHUHwq
 AWgoVVveN3zEEPbRbkBSQ0Bk3t+mweYvjgepQ+fr2yRH1kzP7HMelcZ4ikU0kkzzP6zK
 6ar3/sEgiOBECNKZzJFDkUWp4uwvqoZCIf8lB5rfsNH6EGSLD8Fy5IUS1w1Vn7/PsNMU
 5Wu0xnLqBogTZ8fJZH8udZsJyHjCCG20k3QFSTg1cgjbbBHnLvppKVaqLgU9anWancQK
 3YdeklckI6KNZA+VxZ9ZhsDKy3x4N9bfMmxy15nDTAX/tET9EvlpmJ7Fpozfe6udrqW2
 NoYg==
X-Gm-Message-State: AOJu0Yz46pbLXYtvoqosbzoQQkBKzmvBA/uSSZDS9+6CjDt+hhNQ0Z6b
 BGxvLSqstJLqwXRob01ExJuB8HXJjRhLDioOH7r4AGJZlyvt0ynmnx8Am9SmmlUoLxzgwS6X5Yp
 do4zGbAJdCycKN0H4gWSwEzS6o0iCaCo2jLmEr/eaN5cT6nHtAvOUew==
X-Google-Smtp-Source: AGHT+IF3nz3rlCALimHq8NyY0KwPXc7hJ57VWDbOnAnSvYiZ/MdOaLz4pwgXBdaAHFkr8V9B391LGcCudxj5L06n0gM=
X-Received: by 2002:a25:9b83:0:b0:dc7:4639:55d1 with SMTP id
 v3-20020a259b83000000b00dc7463955d1mr388505ybo.18.1708546189667; Wed, 21 Feb
 2024 12:09:49 -0800 (PST)
MIME-Version: 1.0
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
 <20240217160244.1320482-14-dario.binacchi@amarulasolutions.com>
 <af65f8aa-c746-4933-859b-1724d8653e91@smile.fr>
 <CABGWkvrGiZhCq3WVOSFf=P1MxP8Vz7bAkHY8yYrx-89CGm5C5g@mail.gmail.com>
 <7c4ef18e-774f-4a65-8e51-7a016ed89649@smile.fr>
In-Reply-To: <7c4ef18e-774f-4a65-8e51-7a016ed89649@smile.fr>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 21 Feb 2024 21:09:38 +0100
Message-ID: <CABGWkvpsr3fpk-=3vE1Sps4OC9iGSZ=Td8PUFoQTPhu=hH7rug@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708546189; x=1709150989;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cXQ6LHrlUc2ELs6gZ93PU+ASJ/JzefcP7uh7kf1ZVP0=;
 b=Nd2eczZNROcefqFeFWquBgnxy6QG5uTAUq/bCQ7ds5y168lCooSyCoLoM+lEdKDGMy
 Zkoz+SVBIn6VPT8dO5H9rZRons73kGYYxQq+SQ3SZ0UQuz9ZQ1kkIxZIfsRv3AMLh3do
 Sxy7R8SsP0x2Q0ScwX2r9bcFYKlfAwokuvRAk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Nd2eczZN
Subject: Re: [Buildroot] [PATCH v4 13/20] boot/ti-k3-r5-loader: set binman
 environment
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
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUm9tYWluLAoKT24gV2VkLCBGZWIgMjEsIDIwMjQgYXQgNDoyOeKAr1BNIFJvbWFpbiBO
YW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPiB3cm90ZToKPgo+IEhlbGxvIERhcmlvLAo+Cj4g
TGUgMjEvMDIvMjAyNCDDoCAxMToxOSwgRGFyaW8gQmluYWNjaGkgYSDDqWNyaXQgOgo+ID4gSGkg
Um9tYWluLAo+ID4KPiA+IE9uIE1vbiwgRmViIDE5LCAyMDI0IGF0IDExOjE14oCvQU0gUm9tYWlu
IE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+IHdyb3RlOgo+ID4+Cj4gPj4gSGVsbG8gRGFy
aW8sCj4gPj4KPiA+PiBMZSAxNy8wMi8yMDI0IMOgIDE3OjAyLCBEYXJpbyBCaW5hY2NoaSBhIMOp
Y3JpdCA6Cj4gPj4+IFJlY2VudCB2ZXJzaW9uIG9mIFUtQm9vdCB1c2UgYmlubWFuIHRvIHByb3Zp
ZGUgYSBtZWNoYW5pc20gZm9yIGJ1aWxkaW5nCj4gPj4+IGltYWdlcywgZnJvbSBzaW1wbGUgU1BM
ICsgVS1Cb290IGNvbWJpbmF0aW9ucywgdG8gbW9yZSBjb21wbGV4Cj4gPj4+IGFycmFuZ2VtZW50
cyB3aXRoIG1hbnkgcGFydHMuCj4gPj4+Cj4gPj4+IFRoZSBwYXRjaCBzZXQgdGhlIEJJTk1BTl9J
TkRJUlMgZW52aXJvbm1lbnQgdmFyaWFibGUgdG8gcHJvdmlkZSB0aGUKPiA+Pj4gZGlyZWN0b3J5
IHRvIHNlYXJjaCBmb3IgYmluYXJ5IGJsb2JzIGFuZCBzZWxlY3QgdGhlIHBhY2thZ2VzIHJlcXVp
cmVkIGJ5Cj4gPj4+IGJpbm1hbi4KPiA+Pj4KPiA+Pj4gQ28tZGV2ZWxvcGVkLWJ5OiBNaWNoYWVs
IFRyaW1hcmNoaSA8bWljaGFlbEBhbWFydWxhc29sdXRpb25zLmNvbT4KPiA+Pj4gU2lnbmVkLW9m
Zi1ieTogTWljaGFlbCBUcmltYXJjaGkgPG1pY2hhZWxAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4g
Pj4+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxh
c29sdXRpb25zLmNvbT4KPiA+Pj4KPiA+Pj4gLS0tCj4gPj4+Cj4gPj4+IENoYW5nZXMgaW4gdjQ6
Cj4gPj4+IC0gRHJvcCB0aGUgQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfVVNFX0JJTk1BTiBv
cHRpb24KPiA+Pj4KPiA+Pj4gQ2hhbmdlcyBpbiB2MjoKPiA+Pj4gLSBDaGFuZ2UgY29tbWl0IG1l
c3NhZ2UKPiA+Pj4gLSBBZGQgQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfVVNFX0JJTk1BTiBv
cHRpb24KPiA+Pj4gLSBTZWxlY3QgcGFja2FnZXMgcmVxdWlyZWQgYnkgYmlubWFuIGlmCj4gPj4+
ICAgQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfVVNFX0JJTk1BTiBpcyBlbmFibGVkCj4gPj4+
Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFy
dWxhc29sdXRpb25zLmNvbT4KPiA+Pj4gLS0tCj4gPj4+ICBib290L3RpLWszLXI1LWxvYWRlci90
aS1rMy1yNS1sb2FkZXIubWsgfCAxMyArKysrKysrKysrKystCj4gPj4+ICAxIGZpbGUgY2hhbmdl
ZCwgMTIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4+Pgo+ID4+PiBkaWZmIC0tZ2l0
IGEvYm9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLm1rIGIvYm9vdC90aS1rMy1y
NS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLm1rCj4gPj4+IGluZGV4IDBmZmNiODIzNWYyZS4uMmEx
MDAyNGFlZGFhIDEwMDY0NAo+ID4+PiAtLS0gYS9ib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1y
NS1sb2FkZXIubWsKPiA+Pj4gKysrIGIvYm9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9h
ZGVyLm1rCj4gPj4+IEBAIC0zOSw3ICszOSwxMyBAQCBUSV9LM19SNV9MT0FERVJfREVQRU5ERU5D
SUVTID0gXAo+ID4+PiAgICAgICBob3N0LXBrZ2NvbmYgXAo+ID4+PiAgICAgICAkKEJSMl9NQUtF
X0hPU1RfREVQRU5ERU5DWSkgXAo+ID4+PiAgICAgICBob3N0LWFybS1nbnUtdG9vbGNoYWluIFwK
PiA+Pj4gLSAgICAgaG9zdC1vcGVuc3NsCj4gPj4+ICsgICAgIGhvc3Qtb3BlbnNzbCBcCj4gPj4+
ICsgICAgIGhvc3QtcHl0aG9uLWF0dHJzIFwKPiA+Pj4gKyAgICAgaG9zdC1weXRob24tanNvbnNj
aGVtYSBcCj4gPj4+ICsgICAgIGhvc3QtcHl0aG9uLWpzb25zY2hlbWEtc3BlY2lmaWNhdGlvbnMg
XAo+ID4+PiArICAgICBob3N0LXB5dGhvbi1weXlhbWwgXAo+ID4+PiArICAgICBob3N0LXB5dGhv
bi1yZWZlcmVuY2luZyBcCj4gPj4+ICsgICAgIGhvc3QtcHl0aG9uLXJwZHMtcHkKPiA+Pgo+ID4+
IE1vc3Qgb2YgdGhlc2VzIG5ldyBkZXBlbmRlbmNpZXMgYXJlIG5vdCB0aS1rMy1yNS1sb2FkZXIg
ZGVwZW5kZW5jaWVzIGJ1dAo+ID4+IGhvc3QtcHl0aG9uLWpzb25zY2hlbWEgcnVudGltZSBkZXBl
bmRlbmNpZXMuCj4gPgo+ID4gSSByZW1vdmVkIHRoZSBydW50aW1lIGRlcGVuZGVuY2llcyBhbmQg
dHJpZWQgdG8gbW9kaWZ5IHRoZSBwYXRjaCBiYXNlZAo+ID4gb24geW91ciBpbmRpY2F0aW9ucyBh
bmQgeW91ciBwYXRjaAo+ID4gKGh0dHA6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1
aWxkcm9vdC9wYXRjaC8yMDI0MDIxMzE3MjgxNy4yODcyODQ5LTExLXJvbWFpbi5uYW91ckBzbWls
ZS5mci8pLAo+ID4gYnV0IEknbSBlbmNvdW50ZXJpbmcgY29tcGlsYXRpb24gZXJyb3JzIHNwZWNp
ZmljYWxseSBvbiB0aGUgUHl0aG9uCj4gPiBtb2R1bGVzIHRoYXQgeW91IGluZGljYXRlZCBhcyBy
dW50aW1lCj4gPiBkZXBlbmRlbmNpZXMuCj4KPiBXaGF0J3MgdGhlIGlzc3VlPwo+Cj4gTWFrZSBz
dXJlIHRvIHRha2UgaG9zdC1weXRob24gY2hhbmdlcyBmcm9tIG15IHNlcmllcywgc29tZSBvZiB0
aGVtIHdhcyB1cGRhdGVkCj4gd2l0aCB0aGVpciBvd24gcnVudGltZSBkZXBlbmRlbmNpZXM6CgpU
aGUgcHJvYmxlbSB3YXMgdGhpcy4gSSBoYWRuJ3Qgbm90aWNlZCB0aGUgY2hhbmdlcyB5b3UgaGFk
IGFwcGxpZWQgdG8KbXkgcGF0Y2hlcy4KSSdtIGRvaW5nIHRoZSBmaW5hbCB0ZXN0cywgSSdsbCBz
dWJtaXQgdjUgYXMgc29vbiBhcyBwb3NzaWJsZS4KCk1hbnkgdGhhbmtzIQpSZWdhcmRzLApEYXJp
bwoKPgo+IEZvciBleGFtcGxlOgo+IGh0dHA6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0
L2J1aWxkcm9vdC9wYXRjaC8yMDI0MDIxMzE3MjgxNy4yODcyODQ5LTctcm9tYWluLm5hb3VyQHNt
aWxlLmZyLwo+Cj4gIEkgdHJpZWQgdG8gY29tcGlsZSB0aV9hbTYyeF9za19kZWZjb25maWcgb24g
eW91ciBzZXJpZXMKPiA+IChpLiBlLiAiQWRkIHRpX2o3MjFlX3NrX2RlZmNvbmZpZyIpLAo+ID4g
YnV0IGl0IHNlZW1zIGxpa2UgdGhlIEhTRlMgb3B0aW9uIGhhcyBkaXNhcHBlYXJlZC4KPgo+IElu
ZGVlZCwgdGhpcyBpcyBzb21ldGhpbmcgd2UgbmVlZCB0byBpbXByb3ZlLgo+Cj4gPiBTbyBJIG5l
ZWQgdG8gYWRkIHRoZSBydW50aW1lIGRlcGVuZGVuY2llcyBhcyB3ZWxsIHRvIGNvbXBpbGUgY29y
cmVjdGx5Lgo+Cj4gQ2FuIHlvdSB0cnkgd2l0aCBvbmx5IHBhdGNoIDQvMjEgKHBhY2thZ2UvcHl0
aG9uLWF0dHJzOiBhZGQgaG9zdCB2YXJpYW50KSB0bwo+IHBhdGNoIDEwLzIxIChib290L3RpLWsz
LXI1LWxvYWRlcjogYWRkIEJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSX1VTRV9CSU5NQU4KPiBv
cHRpb24pLgo+Cj4gTWF5YmUgdXBkYXRlIHRoZSBsYXN0IHBhdGNoIDEwLzIxIHNpbmNlIGl0IHdh
cyBzdWdnZXN0ZWQgdG8gcmVtb3ZlCj4gQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfVVNFX0JJ
Tk1BTiBvcHRpb24gdG8gbWFrZSBiaW5tYW4gdXNlIG1hbmRhdG9yeSBmb3IKPiB0aS1rMy1yNS1s
b2FkZXIgcGFja2FnZS4KPgo+IEJlc3QgcmVnYXJkcywKPiBSb21haW4KPgo+ID4KPiA+IFRoYW5r
cyBhbmQgcmVnYXJkcywKPiA+IERhcmlvCj4gPgo+ID4+Cj4gPj4gTm90ZTogaG9zdC1weXRob24t
anNvbnNjaGVtYSBkZXBlbmRzIG9uCj4gPj4gQlIyX1BBQ0tBR0VfSE9TVF9SVVNUQ19UQVJHRVRf
QVJDSF9TVVBQT1JUUyBkdWUgdG8gaXRzIHJ1bnRpbWUgZGVwZW5kZW5jeSBvbgo+ID4+IGhvc3Qt
cHl0aG9uLXJwZHMtcHkuCj4gPj4KPiA+Pj4KPiA+Pj4gIFRJX0szX1I1X0xPQURFUl9NQUtFID0g
JChCUjJfTUFLRSkKPiA+Pj4gIFRJX0szX1I1X0xPQURFUl9NQUtFX0VOViA9ICQoVEFSR0VUX01B
S0VfRU5WKQo+ID4+PiBAQCAtNDksNiArNTUsMTAgQEAgVElfSzNfUjVfTE9BREVSX0tDT05GSUdf
REVQRU5ERU5DSUVTID0gXAo+ID4+PiAgICAgICAkKEJSMl9CSVNPTl9IT1NUX0RFUEVOREVOQ1kp
IFwKPiA+Pj4gICAgICAgJChCUjJfRkxFWF9IT1NUX0RFUEVOREVOQ1kpCj4gPj4+Cj4gPj4+ICtp
ZmVxICgkKEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfUFlMSUJGRFQpLHkpCj4gPj4KPiA+PiBJdCdz
IGEgdS1ib290IHBhY2thZ2UgY29uZmlnIG9wdGlvbi4ganVzdCBhZGQgaG9zdC1weXRob24tcHls
aWJmZHQgdGhlIGRlcGVuZGVuY3kuCj4gPj4KPiA+Pj4gK1RJX0szX1I1X0xPQURFUl9ERVBFTkRF
TkNJRVMgKz0gaG9zdC1weXRob24tcHlsaWJmZHQKPiA+Pj4gK2VuZGlmCj4gPj4+ICsKPiA+Pj4g
IGlmZXEgKCQoQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfVVNFX0RFRkNPTkZJRykseSkKPiA+
Pj4gIFRJX0szX1I1X0xPQURFUl9LQ09ORklHX0RFRkNPTkZJRyA9ICQoY2FsbCBxc3RyaXAsJChC
UjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUl9CT0FSRF9ERUZDT05GSUcpKV9kZWZjb25maWcKPiA+
Pj4gIGVsc2UgaWZlcSAoJChCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUl9VU0VfQ1VTVE9NX0NP
TkZJRykseSkKPiA+Pj4gQEAgLTU4LDYgKzY4LDcgQEAgVElfSzNfUjVfTE9BREVSX01BS0VfT1BU
UyA9IFwKPiA+Pj4gICAgICAgQ1JPU1NfQ09NUElMRT0kKEhPU1RfRElSKS9iaW4vYXJtLW5vbmUt
ZWFiaS0gXAo+ID4+PiAgICAgICBBUkNIPWFybSBcCj4gPj4+ICAgICAgIEhPU1RDQz0iJChIT1NU
Q0MpICQoc3Vic3QgLUkvLC1pc3lzdGVtIC8sJChzdWJzdCAtSSAvLC1pc3lzdGVtIC8sJChIT1NU
X0NGTEFHUykpKSIgXAo+ID4+PiArICAgICBCSU5NQU5fSU5ESVJTPSQoQklOQVJJRVNfRElSKSBc
Cj4gPj4KPiA+PiBJIHN1Z2dlc3RlZCB0byBhZGQgQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJf
VVNFX0JJTk1BTiBidXQgaW5kZWVkIHdlIHNob3VsZAo+ID4+IHVzZSBiaW5tYW4gdW5jb25kaXRp
b25hbGx5IGZvciB0aS1rMy1yNS1sb2FkZXIgcGFja2FnZS4KPiA+Pgo+ID4+IGh0dHA6Ly9wYXRj
aHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDI0MDIxMzE3MjgxNy4y
ODcyODQ5LTExLXJvbWFpbi5uYW91ckBzbWlsZS5mci8KPiA+Pgo+ID4+IEJlc3QgcmVnYXJkcywK
PiA+PiBSb21haW4KPiA+Pgo+ID4+Cj4gPj4+ICAgICAgIEhPU1RMREZMQUdTPSIkKEhPU1RfTERG
TEFHUykiCj4gPj4+Cj4gPj4+ICBkZWZpbmUgVElfSzNfUjVfTE9BREVSX0JVSUxEX0NNRFMKPiA+
Pgo+ID4KPiA+Cj4KCgotLSAKCkRhcmlvIEJpbmFjY2hpCgpTZW5pb3IgRW1iZWRkZWQgTGludXgg
RGV2ZWxvcGVyCgpkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwoKCkFtYXJ1bGEgU29sdXRpb25zIFNSTAoKVmlhIExl
IENhbmV2YXJlIDMwLCAzMTEwMCBUcmV2aXNvLCBWZW5ldG8sIElUCgpULiArMzkgMDQyIDI0MyA1
MzEwCmluZm9AYW1hcnVsYXNvbHV0aW9ucy5jb20KCnd3dy5hbWFydWxhc29sdXRpb25zLmNvbQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
