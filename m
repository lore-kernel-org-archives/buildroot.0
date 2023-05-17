Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C5BDC7EE24
	for <buildroot@archiver.kernel.org>; Wed, 17 May 2023 03:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 950CE841C0;
	Wed, 17 May 2023 03:08:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 950CE841C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fWb0vxwYef8U; Wed, 17 May 2023 03:08:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 326E7841A0;
	Wed, 17 May 2023 03:08:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 326E7841A0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 38D821BF4D8
 for <buildroot@lists.busybox.net>; Wed, 17 May 2023 03:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A3FC61385
 for <buildroot@lists.busybox.net>; Wed, 17 May 2023 03:08:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A3FC61385
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hfGfnTkGicRZ for <buildroot@lists.busybox.net>;
 Wed, 17 May 2023 03:08:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD2E561338
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD2E561338
 for <buildroot@buildroot.org>; Wed, 17 May 2023 03:08:20 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-9659f452148so34665866b.1
 for <buildroot@buildroot.org>; Tue, 16 May 2023 20:08:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684292898; x=1686884898;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8ctAWEuI8KI2mzin4j7oClWNmp8PJWtiAK7KjpHtf24=;
 b=MXQKDjGgQ0tN+Jj7i86IEuwW2IDUvB0c4bynge7Js4hLmtsmsl4r0IGXuNhEazLmiG
 HKHP3Xf+N3ydtGUBa7mRR+J0hLO7xYP9pr7lPQ0lfnk+JXnzPst5URA8lzxptvyK50Dg
 g2sQy9C/Sc+vlutZZMuuZG5sVwKSUYX2IjYnHKOSEn0vPJIKLbW7UUVl1AbhNtxb0WXt
 RCZou6hdFBoIpgRi3OAyABUR8ggK8W9zBkQxD8WDTArGEiaJwRQBV6QRKopX5zkXsQBk
 B/qA6tBC3u3oG2YOWQ7X5mEv37niedljT5FnP7vB9kUiof+Jml2bi9Fx/oGF5NpaQVIe
 mD2w==
X-Gm-Message-State: AC+VfDzgzvp6CsYonOpX4gGKGl0yClahIPFe/P7rvBXMB7FqKW7jz3Vm
 Jg6HIcpU3vYgdgAuJbOOJPk+/LlHYOOn1fsXjpRrfd7e
X-Google-Smtp-Source: ACHHUZ6kRsWVfNvaHgIPDpGkrzbK4gV0eBj77BOrc7US3ckQ0yXrorhf92qgKKxalZDpe76uBML4iQ==
X-Received: by 2002:a17:907:97c9:b0:96a:1348:7a27 with SMTP id
 js9-20020a17090797c900b0096a13487a27mr27578903ejc.12.1684292897973; 
 Tue, 16 May 2023 20:08:17 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com.
 [209.85.208.50]) by smtp.gmail.com with ESMTPSA id
 r16-20020a170906c29000b0094f3e169ca5sm11609602ejz.158.2023.05.16.20.08.17
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 May 2023 20:08:17 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-510b6a249a8so438440a12.0
 for <buildroot@buildroot.org>; Tue, 16 May 2023 20:08:17 -0700 (PDT)
X-Received: by 2002:a17:907:6d85:b0:966:5eb6:40e1 with SMTP id
 sb5-20020a1709076d8500b009665eb640e1mr32207262ejc.74.1684292896747; Tue, 16
 May 2023 20:08:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230503022302.3188863-1-christian@aperture.us>
In-Reply-To: <20230503022302.3188863-1-christian@aperture.us>
Date: Tue, 16 May 2023 20:08:05 -0700
X-Gmail-Original-Message-ID: <CA+h8R2o+VPDwhjNjrD0RHJhyzY+z93YjXGqUp0_Z8PvsirkZKA@mail.gmail.com>
Message-ID: <CA+h8R2o+VPDwhjNjrD0RHJhyzY+z93YjXGqUp0_Z8PvsirkZKA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1684292898; x=1686884898;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8ctAWEuI8KI2mzin4j7oClWNmp8PJWtiAK7KjpHtf24=;
 b=Q+yIARPNzv2kKi8Lt1A+63P3UsMDeeqS73drrALCfrpKDC4LSQnpUCbp//Kdj1w1eg
 vcd3pBKieSQ/VJm+sgRmAtsQnZz0izDtSguL95U0bIL1StrN+NiU+WezYqZ+iTX/f8sr
 nKXs836ptD3eezIoWiw/QR13xMVJZSCH5kqGQhw0tZW5foGIBP6QPZA5O9W9GDzAsgPn
 NJogyqNZh7Cr7uMk1yAJtVJdPn0w5Aklh+I6F8IOhyvfTQZHJP+RUIX+e71tC2/X45Lw
 ZuOKrsS/E/HQn9EtWSuMqeXWk+jn9EBuG5AVStBNvig3JfO92fJBrPf93h9i54/iWZhl
 alqg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=Q+yIARPN
Subject: Re: [Buildroot] [PATCH v5 1/4] package/go-bootstrap: split into two
 stages: go1.4 and go1.19.9
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Anisse Astier <anisse@astier.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsLAoKT24gVHVlLCBNYXkgMiwgMjAyMyBhdCA3OjIz4oCvUE0gQ2hyaXN0aWFuIFN0ZXdh
cnQgPGNocmlzdGlhbkBhcGVydHVyZS51cz4gd3JvdGU6Cj4gR28gMS4yMCByZXF1aXJlcyBhIG1p
bmltdW0gdmVyc2lvbiBvZiBnbyAxLjE3LjEzIHRvIGJvb3RzdHJhcC4KPgo+IGh0dHBzOi8vZ28u
ZGV2L2RvYy9nbzEuMjAjYm9vdHN0cmFwCj4KPiBBcyBHbyAxLjQgd2FzIHRoZSBwcmV2aW91cyB2
ZXJzaW9uIHRoYXQgY291bGQgYmUgY29tcGlsZWQgd2l0aCBDLCB0aGVyZSBpcyBub3cKPiBubyB3
YXkgdG8gYm9vdHN0cmFwIGdvIHdpdGggYSBDIGNvbXBpbGVyLCB1bmxlc3Mgd2UgdXNlIGEgdHdv
LXN0YWdlIGJvb3RzdHJhcDoKPgo+ICAtIGJ1aWxkIGhvc3QtZ28tYm9vdHN0cmFwLTEuNC0yMDE3
MDUzMQo+ICAtIGJ1aWxkIGhvc3QtZ28tYm9vdHN0cmFwLTEuMTkuOSB3aXRoIGhvc3QtZ28tYm9v
dHN0cmFwLTEuNC0yMDE3MDUzMQo+ICAtIGJ1aWxkIGhvc3QtZ28tMS4yMCB3aXRoIGhvc3QtZ28t
Ym9vdHN0cmFwLTEuMTkuOQo+Cj4gVGhpcyBpcyBpbXBsZW1lbnRlZCBpbiB0aGlzIGNvbW1pdCBm
aXJzdCwgYmVmb3JlIHVwZ3JhZGluZyBob3N0LWdvIHRvIDEuMjAuCj4KPiBOb3RlOiB0aGUgLnBh
dGNoIGZpbGVzIGZyb20gcGFja2FnZS9nbyB2ZXJzaW9uIDEuMTkueCBhcmUgbm90IG5lY2Vzc2Fy
eSBmb3IKPiBwYWNrYWdlL2dvLWJvb3RzdHJhcC1zdGFnZTIgYW5kIGhhdmUgbm90IGJlZW4gaW5j
bHVkZWQgdGhlcmUuCj4KPiBQcmV2aW91cyBkaXNjdXNzaW9uIG9mIHBvc3NpYmxlIGFsdGVybmF0
aXZlczoKPgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9DQStoOFIycnRjeW5rQ0Jzej1f
OXlBTk9FZ3V5UENPY1FEajhfbnMrY3Y4UlM4Kzh0OUFAbWFpbC5nbWFpbC5jb20vCj4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjIwNTI1MjM0MzEyLjY0M2RmYzAzQHdpbmRzdXJmL1Qv
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gU3Rld2FydCA8Y2hyaXN0aWFuQGFwZXJ0dXJl
LnVzPgo+Cj4gLS0tCj4KPiB2MSAtPiB2MjoKPgo+ICAtIGZpeCBpbmRlbnRhdGlvbiBvZiBHT1JP
T1RfQk9PVFNUUkFQIGluIHN0YWdlMiBNQUtFX0VOVgo+ICAtIGFkanVzdCBjb21taXQgZGVzY3Jp
cHRpb24KPiAgLSByZW1vdmUgZHVwbGljYXRlIE1BS0VfRU5WIGRlY2xhcmF0aW9uIGxpbmUKPiAg
LSByZW9yZGVyIGRlcGVuZHMgb24gbGluZXMgaW4gY29uZmlnLmluLmhvc3QKPgo+IHYzIC0+IHY0
Ogo+Cj4gIC0gRml4ZWQgdHlwbyBjb21wYXRhYmxlIC0+IGNvbXBhdGlibGUKPiAgLSBEcm9wcGVk
IGRlcGVuZGVuY3kgb24gdG9vbGNoYWluIGluIGdvLWJvb3RzdHJhcC1zdGFnZTEKPiAgLSBEcm9w
cGVkIHVwZGF0aW5nIHNvdXJjZXMgdGltZXN0YW1wcyBpbiBnby1ib290c3RyYXAtc3RhZ2V7MSwy
fQo+ICAtIFVwZGF0ZSBnby1ib290c3RyYXAtc3RhZ2UyIHRvIDEuMTkuNwo+ICAtIERyb3AgdGhl
c2UgY29tbWVudHMgYW5kIG1vdmUgdG8gc2VwYXJhdGUgcGF0Y2g6Cj4gICAgLSBGaXggdHlwbyBp
biBjb21tZW50cy4KPiAgICAtIEFkanVzdGVkIGNvbW1lbnQgYnVpbHQgaW4gLT4gYnVpbHQtaW4u
Cj4gICAgLSBBZGp1c3QgY29tbWVudHMgcmVsYXRpbmcgdG8gY29weWluZyBzcmMvIHRvIGhvc3Qv
Cj4gICAgLSBEcm9wcGVkIG91dGRhdGVkIGNvbW1lbnQgcmVmZXJyaW5nIHRvIGlzc3VlIDI3NzUu
Cj4gIC0gVGhhbmtzIFRob21hcyBmb3IgdGhlIHJldmlldy4KPgo+IHY0IC0+IHY1Ogo+Cj4gIC0g
dXBkYXRlIHN0YWdlMiB0byBnbzEuMTkuOQoKSXMgYW55dGhpbmcgZWxzZSBuZWVkZWQgdG8gbWVy
Z2UgdGhpcyBzZXJpZXM/CgpBbGwgb2YgdGhlIHBhdGNoIGNvbW1lbnRzIGhhdmUgYmVlbiBhZGRy
ZXNzZWQsIGFuZCBJJ3ZlIGJlZW4gdXNpbmcKdGhpcyBpbiBwcm9kdWN0aW9uIGZvciBhIGZldyBt
b250aHMuCgpCZXN0IHJlZ2FyZHMsCkNocmlzdGlhbiBTdGV3YXJ0Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
