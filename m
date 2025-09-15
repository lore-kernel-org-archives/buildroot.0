Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92342CAC597
	for <buildroot@archiver.kernel.org>; Mon, 15 Sep 2025 13:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 416D841F16;
	Mon, 15 Sep 2025 13:39:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j99kwSHx6Wkv; Mon, 15 Sep 2025 13:39:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7465A41F48
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7465A41F48;
	Mon, 15 Sep 2025 13:39:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BC4641F7
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 13:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A29DF6125D
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 13:39:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BFuGA4oeHm-e for <buildroot@buildroot.org>;
 Mon, 15 Sep 2025 13:39:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 89EE06125E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89EE06125E
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 89EE06125E
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 13:39:00 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-55f7039a9fdso4379154e87.1
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 06:39:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757943538; x=1758548338;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=30aSR24k2n76KpcFAYCQwNqlPVX5JT1N/odbRQztQt8=;
 b=FC49DY+wrI29eo0nqXineNFfSNgjlMncv9aNc4IndIgkFJYaE2N2qi+V0o4x+0FycN
 e+YL2MJ4cMlK+XNfRNjE+Ml6MCRlMovd/PlaDeaCrJgC7EXm6ZZkvQTfKuFnIK1hmUlS
 vFMJnELELyLRE2VUcCpAlczrh4x6khEcTgBA84d3HOEowOTRLdi/3ZFQ7pgY0khAPoQz
 6YgP1YPjwIqSScMour6FSNfAcMOxvlrjESATHm/DR3UVUt40Lis6PRYBq4jNk1jlAGkI
 yeQ/Z+A/at6joF74qysh7NtjwNnWQVns1VH5Q/RwJOM6yZ8gpPs7r+VnbRxiIHR6ib+F
 mszA==
X-Gm-Message-State: AOJu0YwGfIWCYXp62ZvGZGPISOQc2lv/K9IU13rAdw9sO+ccMWJSDIBv
 4n/ndhMmc2yiLda2UF4MJlunxnWPZO0RfIg0nYMnoKm3wnIJokxfa2EM6B6aHmcgtNxfhujng8W
 QC14UoSKsQZH/bE+nZeo0+G5RilYba6Oa+sYJ
X-Gm-Gg: ASbGncsP4nH7iY3NeXNYdGd6LGTqa6i6Sz4ze9l9o0Hv+l94AKAaUChYxnV8xvjelw3
 /cG0xwbBw7ZQnfwnQqQNe9mF8X7A2QZEV/qMl7q47eXA1839Z200jbn/3BGnTxCIk20F+De4/JJ
 dbN3nBQmel5kaxtKPN1FIkKMptR7vOEl0XmGkOAbzDX6B/gzDMTmBj0fPyaL1rL716oou7AIBcL
 Ca4k4cq
X-Google-Smtp-Source: AGHT+IHv4HaLsy+ld1ng1ma5wgWOD0FeOwo7m24AcPKnu9LFL0DwDsC7gMBeUbJhZj4X7DR2TMmEIpAq6BwwlJrfdcY=
X-Received: by 2002:a05:6512:6601:b0:572:33b0:b721 with SMTP id
 2adb3069b0e04-57233b0ba77mr1660283e87.49.1757943537928; Mon, 15 Sep 2025
 06:38:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250915132556.47191-1-titouan.christophe@mind.be>
In-Reply-To: <20250915132556.47191-1-titouan.christophe@mind.be>
Date: Mon, 15 Sep 2025 15:38:45 +0200
X-Gm-Features: AS18NWBRsu-1mtlNyIB4IxnL3briFmdmIyqVKLTm8as2hKQMMjUpNmplleoxfjI
Message-ID: <CAGm1_ktGxqF+2bOj-MJKhPqUh=iShF5aN76E5W54mOPNr5yxYQ@mail.gmail.com>
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1757943538; x=1758548338; darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=30aSR24k2n76KpcFAYCQwNqlPVX5JT1N/odbRQztQt8=;
 b=T7/jPzQwnvn+Pb2ZC5ECCanWgUhsHjPYS+KdavREqE2zOxaQESeJ+ysziF76173VCZ
 iFbMF1fMO5ewkdxbM3nHnHvh91dXnZqpPemd/FAfizeypSINaomoSLJeeZalhlg+ylK3
 1zFvHwdnwiIorI1ymze4h4TECdjNbbUalsFbCbz9m2kb0RTLssvI7EHhZbUAb/CWTZFA
 H99QWlx8XJgvwQxNCS65/ug/ayVCLlNdjdG0KYd/svbROY0GbI1CLK2IjTYvA0QnxNBo
 SD/bUuWwFfMNH0OI4N53ZxDNCuGnFB1RN6BxxQgyQSJNZTNMiBm0K52qvxrkUBdd7bnN
 vOYg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=T7/jPzQw
Subject: Re: [Buildroot] [PATCH] package/python-flask-cors: fix PKG_SITE
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGl0b3VhbiwKCk9uIE1vbiwgU2VwIDE1LCAyMDI1IGF0IDM6MjbigK9QTSBUaXRvdWFuIENo
cmlzdG9waGUKPHRpdG91YW4uY2hyaXN0b3BoZUBtaW5kLmJlPiB3cm90ZToKPgo+IHB5dGhvbi1m
bGFzay1jb3JzIHdhcyBzZWN1cml0eSBidW1wZWQgaW4gY29tbWl0IDA0Y2QxMzViMjYgWzFdLCBo
b3dldmVyIHRoaXMKPiBjb21taXQgZGlkIG5vdCB1cGRhdGUgdGhlIF9TSVRFIHVybDsgd2hpY2gg
Y2hhbmdlcyB3aXRoIGVhY2ggbmV3IHJlbGVhc2Ugb24KPiBweXBpLiBUaGVyZWZvcmUsIGRvd25s
b2FkaW5nIHB5dGhvbi1mbGFzay1jb3JzIHdvdWxkIGFsd2F5cyBmYWlsLgo+Cj4gWzFdIGh0dHBz
Oi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1pdC8wNGNkMTM1YjI2
NDA2ZGNjMzFjYjY2YWYxNDgwZDUzZmZmZTgxZTU5Cj4KCkNvdWxkIGFkZCB0aGUgZm9sbG93aW5n
IHRleHQgaGVyZToKCkZpeGVzOgpodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3Vs
dHMvZWVhZGNiMmU0MTZjZGRhYTVkMDU5YjMxZWE1ZGNjOWY3NjZhM2NmZi8KClRoYW5rcy4KCkJl
c3QgcmVnYXJkcywKWWVnb3IKCj4gU2lnbmVkLW9mZi1ieTogVGl0b3VhbiBDaHJpc3RvcGhlIDx0
aXRvdWFuLmNocmlzdG9waGVAbWluZC5iZT4KPiAtLS0KPiAgcGFja2FnZS9weXRob24tZmxhc2st
Y29ycy9weXRob24tZmxhc2stY29ycy5tayB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24t
Zmxhc2stY29ycy9weXRob24tZmxhc2stY29ycy5tayBiL3BhY2thZ2UvcHl0aG9uLWZsYXNrLWNv
cnMvcHl0aG9uLWZsYXNrLWNvcnMubWsKPiBpbmRleCBkMDkyM2Q2NjViLi4yNjE5OGU2ZmI0IDEw
MDY0NAo+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLWZsYXNrLWNvcnMvcHl0aG9uLWZsYXNrLWNvcnMu
bWsKPiArKysgYi9wYWNrYWdlL3B5dGhvbi1mbGFzay1jb3JzL3B5dGhvbi1mbGFzay1jb3JzLm1r
Cj4gQEAgLTYsNyArNiw3IEBACj4KPiAgUFlUSE9OX0ZMQVNLX0NPUlNfVkVSU0lPTiA9IDYuMC4x
Cj4gIFBZVEhPTl9GTEFTS19DT1JTX1NPVVJDRSA9IGZsYXNrX2NvcnMtJChQWVRIT05fRkxBU0tf
Q09SU19WRVJTSU9OKS50YXIuZ3oKPiAtUFlUSE9OX0ZMQVNLX0NPUlNfU0lURSA9IGh0dHBzOi8v
ZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy80Zi9kMC9kOWU1MmIxNTRlNjAzYjBmYWNj
YzBiN2MyYWQzNmE3NjRkODc1NWVmNDAzNmFjYmYxNTgyYTY3ZmI4NmIKPiArUFlUSE9OX0ZMQVNL
X0NPUlNfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy83Ni8z
Ny9iY2ZhNmM3ZDVlZWM3NzdjNGM3Y2Y0NWNlNmIyNzYzMWNlYmU1MjMwY2FmODhkODVlYWRkNjNl
ZGQzN2EKPiAgUFlUSE9OX0ZMQVNLX0NPUlNfU0VUVVBfVFlQRSA9IHNldHVwdG9vbHMKPiAgUFlU
SE9OX0ZMQVNLX0NPUlNfTElDRU5TRSA9IE1JVAo+ICBQWVRIT05fRkxBU0tfQ09SU19MSUNFTlNF
X0ZJTEVTID0gTElDRU5TRQo+IC0tCj4gMi41MS4wCj4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
