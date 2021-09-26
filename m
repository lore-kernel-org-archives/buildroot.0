Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C9B2C433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 12:55:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 503B160FED
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 12:55:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 503B160FED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0FC4E400A8;
	Sun, 26 Sep 2021 12:55:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u4V-7DN3oIL8; Sun, 26 Sep 2021 12:55:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FA04401AE;
	Sun, 26 Sep 2021 12:55:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 463C01BF2F1
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 12:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3609D80E51
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 12:55:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RcbZE681qeH4 for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 12:55:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F331780E05
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 12:55:26 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id w29so43081053wra.8
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 05:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=T2DnqMu6PA5rSjoYB3iu1BZXFfsAxJPHbNj9sH49jsI=;
 b=lH0L4CTTqS6rrPSNn7naR9IZICNfNZ2cxqnqiSyHKpwMvyblmQbGaBVCyWP6QUOlEl
 gDRlWC81sdBMbemtMj6sg8rUbLriMqXg9M3F7kY8EIQyq8sf9cttOXTSQG4g2ss50E6z
 cfLCtOnZbeIby3xRHkN/w3hdi7O8yTW2UUV1OAqJlTzbt+012WO8OWRNAsxF+zH4xRsR
 EfbpxsBqjfu+vtA/0NlC6DvBCoOD8MOtq4LryB3SC7NoLS7CiOrh7QbKAzbiunLwDR0g
 6/EnXNhH/9qXcRfn21yRlt2AIkhDu7oAyKJ2gFibQ9fu9GRel1Iye6Q87I+QoawLU9C1
 Ww7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=T2DnqMu6PA5rSjoYB3iu1BZXFfsAxJPHbNj9sH49jsI=;
 b=rZPK5lRzjZpRJvsWiFh4E2xp3N+xLzOy6knU6eW/H8/rLBBb4Wk775AqxOYbvwYIw3
 GGLh5fNgEyTUs44yU6DeQLAo0yfuAutmcg/dlglxEkXQBkJgeYt56su2944ud13QO6O/
 Ut4qskUTTcGvBznKXfD24jsjGVQEXm0QrtI2BOKutXHuWkjDMDzDqX04p5qTEuDnhHFC
 NR+Hy28INpqHWeOlNW0zwh9cI0QWe+3juRJXSOoqqBJ7WtxB6PW9w9mfwgQFoMSSERQG
 tRng2qkVeiPnkASGm1ApMzoPWIF146x5NETBYYwTWA4KZMbTiaaTsTi+hCSrVQ83pgKd
 1ecQ==
X-Gm-Message-State: AOAM530u4E7LrGzbSxmjAjcb2TN2XXWEz7qLAbFtNp6Gyp1hVOm0vc2u
 Zk1RWhcJtfz2/cXTPXS1xxrOYZ96q54=
X-Google-Smtp-Source: ABdhPJzSjugnuEd4Jz3qny2f3ZljDZrNLoCtZbfmn/3kb5C0M0zy09M8HFfNBvp9dxik8glH0JKF/g==
X-Received: by 2002:adf:ec02:: with SMTP id x2mr22196007wrn.407.1632660925243; 
 Sun, 26 Sep 2021 05:55:25 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:2216:4e4e:b697:b4ce?
 (2a01cb058f8a180022164e4eb697b4ce.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:2216:4e4e:b697:b4ce])
 by smtp.gmail.com with ESMTPSA id q126sm17478043wma.10.2021.09.26.05.55.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 05:55:24 -0700 (PDT)
Message-ID: <4cb6b204-b005-02dc-f2c3-e0c09dc37ed1@gmail.com>
Date: Sun, 26 Sep 2021 14:55:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, Asaf Kahlon <asafka7@gmail.com>
References: <20210924170014.111889-1-asafka7@gmail.com>
 <20210925163308.GQ3176@scaer>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20210925163308.GQ3176@scaer>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-attrs: depends on python3
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QXNhZiwgQWxsLAoKTGUgMjUvMDkvMjAyMSDDoCAxODozMywgWWFubiBFLiBNT1JJTiBhIMOpY3Jp
dMKgOgo+IEFzYWYsIEFsbCwKPiAKPiBPbiAyMDIxLTA5LTI0IDIwOjAwICswMzAwLCBBc2FmIEth
aGxvbiBzcGFrZSB0aHVzbHk6Cj4+IHB5dGhvbi1hdHRycyBjb250YWlucyBhIGZpbGUgd2l0aCBB
UEkgZm9yIHB5dGhvbiAzLjYrLgo+PiBBbHRob3VnaCB3ZSBjYW4gbWFrZSBhICJ0d2VhayIgYW5k
IHJlbW92ZSB0aGlzIHNwZWNpZmljIGZpbGUKPj4gZm9yIHB5dGhvbjIsIHdlIHByZWZlciB0byBt
YWtlIHRoaXMgcGFja2FnZSBhdmFpbGFibGUgb25seSBmb3IKPj4gcHl0aG9uMywgYmVjYXVzZSB0
aGUgZGF5IHRoaXMgcGFja2FnZSAoYW5kIG1hbnkgb3RoZXJzKSB3aWxsIGRyb3AKPj4gc3VwcG9y
dCBmb3IgcHl0aG9uMiBpcyBwcm9iYWJseSB2ZXJ5IGNsb3NlLgo+Pgo+PiBJbiBhZGRpdGlvbiwg
dXBkYXRlIHB5dGhvbi1hdHRycyByZWN1cnNpdmUgZGVwZW5kZW5jaWVzIHRvCj4+IGRlcGVuZCBv
biBweXRob24zIHRvbyAocHl0aG9uLWF1dG9tYXQgaXMgdGhlIG9ubHkgb25lIGxlZnQpLgoKUGxl
YXNlIEFzYWYsIHRha2UgY2FyZSBvZiBweXRob24gdGVzdHMgaW4gdGhlIEJ1aWxkcm9vdCB0ZXN0
c3VpdGUuCgpTaW5jZSBweXRob24tYXR0cnMgaXMgbm93IHB5dGhvbjMgb25seSB3ZSBjYW4gcmVt
b3ZlIChhdCBsZWFzdCkgdHdvIHRlc3RzOgoKVGVzdFB5dGhvblB5MkF0dHJzClRlc3RQeXRob25Q
eTJBdXRvbWF0CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4+Cj4+IEZpeGVzOgo+PiAgLSBodHRw
Oi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy9hYTYvYWE2ODg5YmMyNTRlYWE5M2Fk
YjRmYzFhNzFiY2VlOWYyZjIzY2IzMy8KPj4KPj4gU2lnbmVkLW9mZi1ieTogQXNhZiBLYWhsb24g
PGFzYWZrYTdAZ21haWwuY29tPgo+PiAtLS0KPj4gIHBhY2thZ2UvcHl0aG9uLWF0dHJzL0NvbmZp
Zy5pbiAgIHwgMSArCj4+ICBwYWNrYWdlL3B5dGhvbi1hdXRvbWF0L0NvbmZpZy5pbiB8IDEgKwo+
PiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvcHl0aG9uLWF0dHJzL0NvbmZpZy5pbiBiL3BhY2thZ2UvcHl0aG9uLWF0dHJzL0NvbmZp
Zy5pbgo+PiBpbmRleCBmYjBhYjI0OGZhLi5iNjU4ZDIwZWM5IDEwMDY0NAo+PiAtLS0gYS9wYWNr
YWdlL3B5dGhvbi1hdHRycy9Db25maWcuaW4KPj4gKysrIGIvcGFja2FnZS9weXRob24tYXR0cnMv
Q29uZmlnLmluCj4+IEBAIC0xLDQgKzEsNSBAQAo+PiAgY29uZmlnIEJSMl9QQUNLQUdFX1BZVEhP
Tl9BVFRSUwo+PiArCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfUFlUSE9OMwo+IAo+ICAgICAkIG1h
a2UgY2hlY2stcGFja2FnZQo+ICAgICBwYWNrYWdlL3B5dGhvbi1hdHRycy9Db25maWcuaW46Mzog
YXR0cmlidXRlcyBvcmRlcjogdHlwZSwgZGVmYXVsdCwKPiAgICAgZGVwZW5kcyBvbiwgc2VsZWN0
LCBoZWxwIChodHRwOi8vbmlnaHRseS5idWlsZHJvb3Qub3JnLyNfY29uZmlnX2ZpbGVzKQo+IAo+
IEFwcGxpZWQgdG8gbWFzdGVyIHdpdGggdGhlIGFib3ZlIGZpeGVkLCB0aGFua3MuCj4gCj4gUmVn
YXJkcywKPiBZYW5uIEUuIE1PUklOLgo+IAo+PiAgCWJvb2wgInB5dGhvbi1hdHRycyIKPj4gIAlo
ZWxwCj4+ICAJICBhdHRycyBpcyB0aGUgUHl0aG9uIHBhY2thZ2UgdGhhdCB3aWxsIGJyaW5nIGJh
Y2sgdGhlIGpveSBvZgo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tYXV0b21hdC9Db25m
aWcuaW4gYi9wYWNrYWdlL3B5dGhvbi1hdXRvbWF0L0NvbmZpZy5pbgo+PiBpbmRleCBlZTAyZDIy
YjViLi45ZDIyMjc2YzJjIDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1hdXRvbWF0L0Nv
bmZpZy5pbgo+PiArKysgYi9wYWNrYWdlL3B5dGhvbi1hdXRvbWF0L0NvbmZpZy5pbgo+PiBAQCAt
MSw1ICsxLDYgQEAKPj4gIGNvbmZpZyBCUjJfUEFDS0FHRV9QWVRIT05fQVVUT01BVAo+PiAgCWJv
b2wgInB5dGhvbi1hdXRvbWF0Igo+PiArCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfUFlUSE9OMyAj
IHB5dGhvbi1hdHRycwo+PiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9QWVRIT05fQVRUUlMgIyBydW50
aW1lCj4+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX1BZVEhPTl9TSVggIyBydW50aW1lCj4+ICAJaGVs
cAo+PiAtLSAKPj4gMi4zMC4yCj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPj4gYnVpbGRyb290QGxp
c3RzLmJ1aWxkcm9vdC5vcmcKPj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
