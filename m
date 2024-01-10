Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D43C4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 11:31:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55AAA8126C;
	Wed, 10 Jan 2024 11:31:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55AAA8126C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W9nPKfA4m_ZZ; Wed, 10 Jan 2024 11:31:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8062481351;
	Wed, 10 Jan 2024 11:31:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8062481351
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A34981BF280
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 11:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C2CB40182
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 11:31:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C2CB40182
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BSZgPSW7ONmg for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 11:31:06 +0000 (UTC)
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC89741BF4
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 11:31:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC89741BF4
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-5fa52e173f7so4841397b3.3
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 03:31:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704886265; x=1705491065;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4yqlH4F4X8PwkoW7JCmkke377M9EtGHJDthTQDJFqFY=;
 b=KZ3C4uOq87kz0r9y+lyKuFCbL4zIjlQWbHXXqKpuoTqt6x5PIu5oPUmUI9vbNDL6Dd
 5TtolbjUgxPZqLoe7iwVn2zWpLE1+EhqNnW4ow/Hn3FeeX2Q1WQGzUXlUPngrsd5VbWY
 qP/YsUMJyLV/DRFAX56WOONOUwT9YAR40B4VZV5rviMARK52i4j3cuT8IzqL4IxTnMxm
 pTkt3gHs0T4kpHvpDh9kg80j+J+0eKSHWhi5sXWp97Hd7WKzyYUrgKhC7nY4NER6Jzrl
 3/mlx6T2MkUFNl+U5C3CdjK7aPbGzfySIZhgfqrnoQnmlltfoN4KCSj7V/kkgLqT/75+
 JHvg==
X-Gm-Message-State: AOJu0Yy+tO6+8gNpQy4W+BvWFFnjTEN2PNu3E7YTBj9JjskSRhSqj2dB
 bonB+aD5d2WtdHjb9EJB3gLDcLWcWAkxw2ctFsA=
X-Google-Smtp-Source: AGHT+IGXne2zK/ZfWPXpO4kuHI7avSWzoyp67SMCuJ80GWDJkQ/YsE54/JDRdCdyvofSaHhfgy9y6XnSNd8oQzpMLIY=
X-Received: by 2002:a25:c748:0:b0:dbe:f144:e69b with SMTP id
 w69-20020a25c748000000b00dbef144e69bmr589399ybe.84.1704886265479; Wed, 10 Jan
 2024 03:31:05 -0800 (PST)
MIME-Version: 1.0
References: <20240110093850.2302133-1-james.hilliard1@gmail.com>
 <20240110093850.2302133-4-james.hilliard1@gmail.com>
 <ZZ548XGug565N5dq@landeda>
In-Reply-To: <ZZ548XGug565N5dq@landeda>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 10 Jan 2024 04:30:53 -0700
Message-ID: <CADvTj4oNQr+v54t4QyTpyN-jvC+DgvyXFmu9io79c3xPJ=Kybw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704886265; x=1705491065; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4yqlH4F4X8PwkoW7JCmkke377M9EtGHJDthTQDJFqFY=;
 b=OBHVjeeGKgqouMsvUx6FA2YXoqNghn8BWYyhS/SK5o8VzaiPIiyv7+NspZaaAzX4Et
 aPcFZp/X6f2nd4ahoffRM9DQgcPIHiCMNR2pPkDV/r8s0nA/0bFmm68FRm6y0YTWWrQG
 Ud/et7JT+LMFOE1l0uXHyX1ZTgQNUciJdbZo9qmxqt4szSEi17Gv+2M/pzT3ZKQi6y3M
 BRSc5yCiHuDxJCalsHPTw9Xa9OIWPwlx/qIFtziNtowx4jNXlwezBGh/ggbl4xlEcftJ
 CgowUEudpqO8N4BNjkPQGYzciQk1aKiZXYS4QoTdg1tdsQR00UxqJDf8s5Z2dyqjoVbb
 34WA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OBHVjeeG
Subject: Re: [Buildroot] [PATCH 4/6] package/python-swig: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>,
 =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCBKYW4gMTAsIDIwMjQgYXQgNDowMeKAr0FNIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9y
aW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPgo+IEphbWVzLCBBbGwsCj4KPiBPbiAyMDI0LTAxLTEw
IDAyOjM4IC0wNzAwLCBKYW1lcyBIaWxsaWFyZCBzcGFrZSB0aHVzbHk6Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPgo+IFdoYXQn
cyB0aGUgZGlmZmVyZW5jZSB3aXRoIHRoZSBzd2lnIHBhY2thZ2Ugd2UgYWxyZWFkeSBoYXZlPwo+
Cj4gT24gUHlQaSwgdGhlIHBhY2thZ2UgeW91IGFyZSBhZGRpbmcgaXMgY2FsbGVkIGp1c3Qgc3dp
ZywgYW5kIHRoZSBwYWdlCj4gb24gUHlQaSBbMF0gcmVkaXJlY3RzIHRvIHRoZSBwcm9qZWN0J3Mg
aG9tZXBhZ2UgWzFdIHRoYXQgaXMgdGhlIHNhbWUKPiBhcyB0aGUgaG9tZXBhZ2UgZm9yIG91ciBw
YWNrYWdlL3N3aWcvLCBidXQgdGhlIHJlcG9zaXRvcnkgaXQgcGludHMgdG8gaXMKPiBkaWZmZXJl
bnQgWzJdIHJhdGhlciB0aGFuIHRoZSBvbmUgZnJvbSB0aGUgc3dpZyBob21lcGFnZSBbM10uCj4K
PiBUaGUgZGVzY3JpcHRpb24gZm9yIHRoZSBzd2lnLW9uLXB5cGkgcmVwb3NpdG9yeSBzdGF0ZXM6
Cj4KPiAgICAgQSBwcm9qZWN0IHRoYXQgcGFja2FnZXMgU1dJRyBhcyBhIFB5dGhvbiBwYWNrYWdl
LCBlbmFibGluZyBzd2lnIHRvCj4gICAgIGJlIGluc3RhbGxlZCBmcm9tIFB5UEk6Cj4gICAgICAg
ICBwaXAgaW5zdGFsbCBzd2lnCj4KPiAgICAgb3IgdXNlZCBhcyBwYXJ0IG9mIGJ1aWxkLXN5c3Rl
bS5yZXF1aXJlcyBpbiBhIHB5cHJvamVjdC50b21sIGZpbGU6Cj4gICAgICAgICBbYnVpbGQtc3lz
dGVtXQo+ICAgICAgICAgcmVxdWlyZXMgPSBbInN3aWciXQo+Cj4gU28sIGhlcmUgYXJlIGEgZmV3
IHF1ZXN0aW9uczoKPgo+ICAgLSBjYW4gd2UgaW5zdGVhZCB1cyB0aGUgZXhpc3RpbmcgcGFja2Fn
ZS9zd2lnIHRvIHByb3ZpZGUgdGhlIHNhbWUKPiAgICAgZnVuY3Rpb25hbGl0eSBhcyBweXRob24t
c3dpZz8gSSBzZWUgdGhlcmUgaXMgYSAtLWVuYWJsZS1weXRob24zCj4gICAgIGZsYWcsIGF0IGxl
YXN0LgoKSSBkb24ndCB0aGluayBzbyBzaW5jZSB3ZSBuZWVkIHRvIHByb3ZpZGUgdGhlIHJpZ2h0
IHB5dGhvbiBwYWNrYWdlIGZvcgp0aGUgcGVwNTE3IGJ1aWxkLXN5c3RlbS4KCj4KPiAgIC0gaWYg
bm90LCB0aGVuIHdpbGwgdGhlIHR3byBjb25mbGljdCwgaS5lOiB3aWxsIHB5dGhvbi1zd2lnIGlu
c3RhbGwKPiAgICAgdGhlIHNhbWUgc2V0IG9mIGZpbGVzIGFzIHN3aWcgZG9lcywgZXZlbiBwYXJ0
aWFsbHk/CgpEaWRuJ3Qgc2VlbSB0byBjYXVzZSBpc3N1ZXMgZnJvbSB3aGF0IEkgY291bGQgdGVs
bC4KCj4KPiAgIC0gaWYgbm90LCBkbyB3ZSBuZWVkIHRvIGtlZXAgYm90aCB2ZXJzaW9ucyBpbiBz
eW5jPyBDdXJyZW50bHksCj4gICAgIHBhY2thZ2Uvc3dpZyBpcyBzdGlsbCBvbmx5IGF0IDQuMS4x
LgoKU2VlbWVkIHRvIHdvcmsgc28gSSBwcmVzdW1lIHRoZXkgZG9uJ3QgbmVlZCB0byBiZS4KCj4K
PiBbMF0gaHR0cHM6Ly9weXBpLm9yZy9wcm9qZWN0L3N3aWcvCj4gWzFdIGh0dHBzOi8vc3dpZy5v
cmcvCj4gWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9uaWdodGxhcmsvc3dpZy1weXBpCj4gWzNdIGh0
dHBzOi8vZ2l0aHViLmNvbS9zd2lnL3N3aWcKPgo+IFJlZ2FyZHMsCj4gWWFubiBFLiBNT1JJTi4K
Pgo+ID4gLS0tCj4gPiAgcGFja2FnZS9weXRob24tc3dpZy9weXRob24tc3dpZy5oYXNoIHwgIDUg
KysrKysKPiA+ICBwYWNrYWdlL3B5dGhvbi1zd2lnL3B5dGhvbi1zd2lnLm1rICAgfCAxNyArKysr
KysrKysrKysrKysrKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQo+ID4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3B5dGhvbi1zd2lnL3B5dGhvbi1zd2lnLmhhc2gK
PiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24tc3dpZy9weXRob24tc3dpZy5t
awo+ID4KPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1zd2lnL3B5dGhvbi1zd2lnLmhh
c2ggYi9wYWNrYWdlL3B5dGhvbi1zd2lnL3B5dGhvbi1zd2lnLmhhc2gKPiA+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwLi5kNjA0NzdmNjAyCj4gPiAtLS0gL2Rldi9u
dWxsCj4gPiArKysgYi9wYWNrYWdlL3B5dGhvbi1zd2lnL3B5dGhvbi1zd2lnLmhhc2gKPiA+IEBA
IC0wLDAgKzEsNSBAQAo+ID4gKyMgbWQ1LCBzaGEyNTYgZnJvbSBodHRwczovL3B5cGkub3JnL3B5
cGkvc3dpZy9qc29uCj4gPiArbWQ1ICBjMmJmODIwYTU0NWYzMzNkNDdiN2JlNTEzYmFhZWUzYyAg
c3dpZy00LjEuMS5wb3N0MS50YXIuZ3oKPiA+ICtzaGEyNTYgIDVjYmYyZDRkZmM0MTNmNzRjYWMx
OTc3MDQyOTZhOWVmMDY1YTNmODFjN2IzNzkyZmYxMWE1NmQzMTJjNGY2NTIgIHN3aWctNC4xLjEu
cG9zdDEudGFyLmd6Cj4gPiArIyBMb2NhbGx5IGNvbXB1dGVkIHNoYTI1NiBjaGVja3N1bXMKPiA+
ICtzaGEyNTYgIDczYmE3NGRmYWE1MjBiNDlhNDAxYjVkMjE0NTlhODUyM2ExNDZmM2I3NTE4YTgz
M2VlYTVlZmE4NTEzMGJmNjggIExJQ0VOU0UKPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhv
bi1zd2lnL3B5dGhvbi1zd2lnLm1rIGIvcGFja2FnZS9weXRob24tc3dpZy9weXRob24tc3dpZy5t
awo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAuLjg5ZWRlMTcw
YzgKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLXN3aWcvcHl0aG9u
LXN3aWcubWsKPiA+IEBAIC0wLDAgKzEsMTcgQEAKPiA+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
Iwo+ID4gKyMKPiA+ICsjIHB5dGhvbi1zd2lnCj4gPiArIwo+ID4gKyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjCj4gPiArCj4gPiArUFlUSE9OX1NXSUdfVkVSU0lPTiA9IDQuMS4xLnBvc3QxCj4gPiAr
UFlUSE9OX1NXSUdfU09VUkNFID0gc3dpZy0kKFBZVEhPTl9TV0lHX1ZFUlNJT04pLnRhci5nego+
ID4gK1BZVEhPTl9TV0lHX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFj
a2FnZXMvZGEvYjgvZDFiZmJhM2Q3Zjc1ZWVjYTYwZWNkY2IyYzIxNGU1Y2RlYmI3NDc3NDM3ZDQ1
ZGI3N2I2ZGFmZWU4MGY5Cj4gPiArUFlUSE9OX1NXSUdfU0VUVVBfVFlQRSA9IHNldHVwdG9vbHMK
PiA+ICtQWVRIT05fU1dJR19MSUNFTlNFID0gQXBhY2hlLTIuMAo+ID4gK1BZVEhPTl9TV0lHX0xJ
Q0VOU0VfRklMRVMgPSBMSUNFTlNFCj4gPiArSE9TVF9QWVRIT05fU1dJR19ERVBFTkRFTkNJRVMg
PSBcCj4gPiArICAgICBob3N0LXB5dGhvbi1zY2lraXQtYnVpbGQgXAo+ID4gKyAgICAgaG9zdC1w
eXRob24tc2V0dXB0b29scy1zY20KPiA+ICsKPiA+ICskKGV2YWwgJChob3N0LXB5dGhvbi1wYWNr
YWdlKSkKPiA+IC0tCj4gPiAyLjM0LjEKPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+ID4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+ID4gYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+Cj4gLS0KPiAuLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgo+
IHwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJP
TiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8Cj4gfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAg
RGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKPiB8ICsz
MyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAg
XGUvICBUaGVyZSBpcyBubyAgfAo+IHwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8v
KlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8Cj4gJy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0t
LS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
