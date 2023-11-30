Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5C9C07CA9
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 20:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12F2641E6F;
	Thu, 30 Nov 2023 20:18:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12F2641E6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R9nWhy5OsPhc; Thu, 30 Nov 2023 20:18:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53A4541925;
	Thu, 30 Nov 2023 20:18:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53A4541925
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6A3B01BF2B3
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 20:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 413C960A64
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 20:18:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 413C960A64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C4uaVakLf7vC for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 20:18:48 +0000 (UTC)
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3D690607FF
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 20:18:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D690607FF
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-3b898c9b4cbso791353b6e.2
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 12:18:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701375527; x=1701980327;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QUh3v034zQMyXw+gO/cnovRy3c/YjjhsjeCpmfnThI4=;
 b=COF6HNSVty0PYPQqw6K3fKfrJvttTIGxQ8IZqvqvhhYNU4U1l/3RF2BrS/7C+3ptMd
 NANhDjHE7/Pj6AVesL71ZQ3l5MUVpVsK1l6EV5F60bzVR1EjiZu82Qk+QfIBNeEjKdrW
 CRojPAcSOvnJExHIzKyzIiiIKY77vpYm9MtV45uzrwrBth8JfTZT2wBS+IrH3YWiVeQv
 dtSsu/RObyR7U7c6inK1lEY5ZYyo4IjfUodh9VvAS6rWSSDcX0+F3OpjuyetZeQx/YOp
 i9VsmK0Z2NwVaOD2Q7vAIEaow7PxjqGnOI6uxX5t/tJk51cqjnZxTxjKnEqenP4vCgcF
 YBdA==
X-Gm-Message-State: AOJu0YzltI4G6FSH52BBu9/I8naVv5maT/fB3mAtgjvvOnDtVymjjMdE
 EkLnTVJGZ3HV789bZyzyu2euNMFBvdiJErnDNcugN/MG1Jc=
X-Google-Smtp-Source: AGHT+IHBJAi4QsIijdkUcynsfJn/NtSZf1+iR3Qp6cuHdLtmhafRnJG3vPDXm5comdBk84sntsUnDrUWdup8qtLhums=
X-Received: by 2002:a05:6808:17a2:b0:3b5:69c2:59cd with SMTP id
 bg34-20020a05680817a200b003b569c259cdmr939758oib.25.1701375527209; Thu, 30
 Nov 2023 12:18:47 -0800 (PST)
MIME-Version: 1.0
References: <20231121174722.4164-1-trippgallagher98@gmail.com>
 <20231123111528.3f88828e@windsurf>
 <CAAmzYqn7P5mqWuorwSy2McooKGSfn_VWoOx+dXXv1fpF1J=y0g@mail.gmail.com>
 <20231124095345.3652c590@windsurf>
In-Reply-To: <20231124095345.3652c590@windsurf>
From: Byron Gallagher <trippgallagher98@gmail.com>
Date: Thu, 30 Nov 2023 15:18:38 -0500
Message-ID: <CAAmzYqnQE1HAzaap0uwbCP-ng3qxQk3mRH4p32fQE-70a9xT3w@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701375527; x=1701980327; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QUh3v034zQMyXw+gO/cnovRy3c/YjjhsjeCpmfnThI4=;
 b=QdWZHRxdJsZMjcxMYzfHwBE+XO5y30zAzHh50cCVaTyhXmyS+Zh+BQvf3wFzynWoMT
 BKHvMPlhIyDylSK2QhvIIUvwukVMdZk24iW8ru9q/kZxOoxdsX6S5Vga4J2cEsDKDVqF
 XTItuGlxu/o4KLzDpwIBp4Ftvy3geDekdmrHI5ZObm2q8v71n1oCj4fllVEAsZE0PcpL
 QyQFH4k7YBWH9yAaSjWD+Xoi7/xZw66DuKaaLhyd6CItTQAaYiTP4cTu90O0nvkLOEjF
 VFLgOrZdq3HqTro7NDQoK0Rn6qAVwwVFrshrxLPbEzX3Tj03rtll8pPyxE4UmSJsbwb+
 pZkg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QdWZHRxd
Subject: Re: [Buildroot] [PATCH] package/socat: fix static openssl
 compatibility
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKSSBiZWxpZXZlIEkndmUgaW1wbGVtZW50ZWQgdGhlIGNoYW5nZXMgaW4gbXkg
bG9jYWwgdmVyc2lvbiBidXQgd291bGQKbGlrZSB5b3VyIHRob3VnaHRzLgoxLiBTb2NhdCBwYWNr
YWdlIG5vdyBoYXMgdG8gYmUgYXV0b3JlY29uZiByYXRoZXIgdGhhbiBzaW1wbGUgYXV0b3Rvb2xz
CndpdGggYSBwcmUtY29uZmlnIGhvb2sgdGhhdCBydW5zIGF1dG9jb25mIGluZGVwZW5kZW50bHku
CjIuIFRoZSB1cHN0cmVhbSBzb2NhdCBjb25maWd1cmUuYWMgdXNlcyB0aGUgb2xkIEFDX0RFRklO
RShGT08pIGZvcm1hdAp3aGljaCBjYXVzZXMgYXV0b2hlYWRlciB0byBmYWlsLiBJJ3ZlIGNoYW5n
ZWQgZXZlcnkgaW52b2NhdGlvbiB0byB0aGUKY29ycmVjdCBBQ19ERUZJTkUoRk9PLCBbVkFMXSwg
W0Rlc2NyaXB0aW9uXSkKMy4gVGhlIGNoYW5nZXMgdG8gdGhlIHJlbGV2YW50IGJsb2NrIGZvciBm
aW5kaW5nIGxpYnNzbCBhcmUgYXMgZm9sbG93czoKCjU4MCw1OTNjNTgwLDYwMwo8ICAgICAgIGlm
IHRlc3QgLW4gIiRPUEVOU1NMX0JBU0UiOyB0aGVuCjwgICAgICAgTD0iJE9QRU5TU0xfQkFTRS9s
aWIiOyBMSUJTPSIkTElCUyAtTCRMIC1sc3NsIC1sY3J5cHRvIgo8ICAgICAgIGVsc2UKPCAgICAg
ICBMSUJTPSIkTElCUyAtbHNzbCAtbGNyeXB0byIKPCAgICAgICBmaQo8ICAgICAgIEFDX1RSWV9M
SU5LKFsjaW5jbHVkZSA8b3BlbnNzbC9zc2wuaD5dLAo8ICAgICAgICBbU1NMX2xpYnJhcnlfaW5p
dCgpO0VSUl9lcnJvcl9zdHJpbmcoKV0sCjwgICAgICAgIFtzY19jdl9oYXZlX2xpYnNzbD0neWVz
J10sCjwgICAgICAgIFsgTElCUz0iJExJQlMgLWxjcnlwdG8iCjwgICAgICAgIEFDX1RSWV9MSU5L
KFsjaW5jbHVkZSA8b3BlbnNzbC9zc2wuaD5dLAo8ICAgICAgICBbU1NMX2xpYnJhcnlfaW5pdCgp
XSwKPCAgICAgICAgIFtzY19jdl9oYXZlX2xpYnNzbD0neWVzJ10sCjwgICAgICAgICBbc2NfY3Zf
aGF2ZV9saWJzc2w9J25vJ10pCjwgICAgICAgICBdKQotLS0KPiAgICAgUEtHX0NIRUNLX01PRFVM
RVMoTElCU1NMLCBsaWJzc2wsCj4gICAgIFsKPiAgICAgICBMSUJTPSIkTElCUyAkTElCU1NMX0xJ
QlMiCj4gICAgICAgQ0ZMQUdTPSIkQ0ZMQUdTICRMSUJTU0xfQ0ZMQUdTIgo+ICAgICAgIHNjX2N2
X2hhdmVfbGlic3NsPSd5ZXMnCj4gICAgIF0sCj4gICAgIFsKPiAgICAgICAgIGlmIHRlc3QgLW4g
IiRPUEVOU1NMX0JBU0UiOyB0aGVuCj4gICAgIEw9IiRPUEVOU1NMX0JBU0UvbGliIjsgTElCUz0i
JExJQlMgLUwkTCAtbHNzbCAtbGNyeXB0byIKPiAgICAgICAgIGVsc2UKPiAgICAgTElCUz0iJExJ
QlMgLWxzc2wgLWxjcnlwdG8iCj4gICAgICAgICBmaQo+ICAgICAgICAgQUNfVFJZX0xJTksoWyNp
bmNsdWRlIDxvcGVuc3NsL3NzbC5oPl0sCj4gICAgICAgICBbU1NMX2xpYnJhcnlfaW5pdCgpO0VS
Ul9lcnJvcl9zdHJpbmcoKV0sCj4gICAgICAgICBbc2NfY3ZfaGF2ZV9saWJzc2w9J3llcyddLAo+
ICAgICAgICAgWyBMSUJTPSIkTElCUyAtbGNyeXB0byIKPiAgICAgICAgIEFDX1RSWV9MSU5LKFsj
aW5jbHVkZSA8b3BlbnNzbC9zc2wuaD5dLAo+ICAgICAgICAgW1NTTF9saWJyYXJ5X2luaXQoKV0s
Cj4gICAgICAgW3NjX2N2X2hhdmVfbGlic3NsPSd5ZXMnXSwKPiAgICAgICBbc2NfY3ZfaGF2ZV9s
aWJzc2w9J25vJ10pCj4gICAgICAgICAgIF0pCj4gICAgICAgICBBQ19NU0dfUkVTVUxUKCRzY19j
dl9oYXZlX2xpYnNzbCkKPiAgICAgXSkKCgpPbiBGcmksIE5vdiAyNCwgMjAyMyBhdCAzOjUz4oCv
QU0gVGhvbWFzIFBldGF6em9uaQo8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6
Cj4KPiBIZWxsbyBCeXJvbiwKPgo+IE9uIFRodSwgMjMgTm92IDIwMjMgMTI6NTU6MzMgLTA1MDAK
PiBCeXJvbiBHYWxsYWdoZXIgPHRyaXBwZ2FsbGFnaGVyOThAZ21haWwuY29tPiB3cm90ZToKPgo+
ID4gVGhhdCBtYWtlcyBzZW5zZS4gSW4gdGhpcyBjYXNlIHdvdWxkIGl0IGJlIHN1ZmZpY2llbnQg
dG8gYWRkIGFub3RoZXIgbGF5ZXIKPiA+IG9mIEFDX1RSWV9MSU5LIHRvIGNoZWNrIHRoZSBzdGF0
aWMgY2FzZT8gaS5lLiB3ZSB0cnkgd2l0aCAtbHNzbCAtbGNyeXB0bwo+ID4gZmlyc3QgYW5kIGlm
IGZhaWwsIHRyeSBhZ2FpbiB3aXRoIC1sc3NsIC1sY3J5cHRvIC1sej8KPgo+IFRoYXQncyBhbiBv
cHRpb24gaW5kZWVkLiBCdXQgdGhlIGJlc3Qgc29sdXRpb24gaXMgcmVhbGx5IHRvIHVzZQo+IHBr
Zy1jb25maWcsIHRocm91Z2ggUEtHX0NIRUNLX01PRFVMRVMoKSwgYW5kIG9ubHkgaWYgbm90IGZv
dW5kIHZpYQo+IHBrZy1jb25maWcgZmFsbCBiYWNrIG9uIHRoZSBleGlzdGluZyBjcmFwIHRoYXQg
dXNlcyBBQ19UUllfTElOSygpLgo+Cj4gQmVzdCByZWdhcmRzLAo+Cj4gVGhvbWFzCj4gLS0KPiBU
aG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCj4gRW1iZWRkZWQgTGlu
dXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKPiBodHRwczovL2Jvb3RsaW4u
Y29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
