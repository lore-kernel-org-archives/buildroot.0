Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8CA5C27C53
	for <buildroot@archiver.kernel.org>; Sun, 16 Jun 2024 11:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5191F81ECB;
	Sun, 16 Jun 2024 11:43:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fc7WuYTI5Mrr; Sun, 16 Jun 2024 11:43:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52F26820EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52F26820EF;
	Sun, 16 Jun 2024 11:43:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 68F7B1BF2CF
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 11:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56051400DA
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 11:43:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PjTyp_IGLtm3 for <buildroot@lists.busybox.net>;
 Sun, 16 Jun 2024 11:43:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D7FAD4041C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7FAD4041C
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D7FAD4041C
 for <buildroot@buildroot.org>; Sun, 16 Jun 2024 11:43:07 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52961b77655so3536341e87.2
 for <buildroot@buildroot.org>; Sun, 16 Jun 2024 04:43:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718538185; x=1719142985;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AOKx3xsV0uPiBbx5qK7/WH4O+5A4PobrIMThe3sqrFY=;
 b=EJHXUo33UOXMsLBkydNICn/74xT3z8cFUUTrr9LjKcjvjP2hutkxTrz7Py4UOsz2jE
 ojP6hmKGnRA79eJboW3Plx/Vsb1DdL7MDSzdv9OfN2fiYe1i/b16/YNUO+cRp76aCcPe
 iw+ZVXVBK8K1/huIMj7AY7svHWAnzp6YNaYqBlNdF1uuolbidNi/3LsTR92oJ57EzUiH
 fydh7EuW2WYTfzUEwcp4BhB1wtqvKoQNWLqfFQ/T+HCwJD3X8K/cOO13FZCHAoF1UQsJ
 X4A4Sjgsrx/q9Rrl1u++PTg09jW6jl0pWBBf69TTEAhIsYcTrZFjh2P50zc3xHUfmyjs
 /iRQ==
X-Gm-Message-State: AOJu0YxZpK6XnhRLOOgsuZWKH9kurUdT1OspdqMXPqPQp1EjkFLdLJvV
 tfR9n7Q99xosBOTtUeOJChfWAVWjc62N8kMPmtRMKkonHHnqw7G/a8kZO4lMeE3Fv7EbQtHfZI8
 Ez23H81j16jiGU1EOzSJaZBBNm5od29nS
X-Google-Smtp-Source: AGHT+IHwKeBkD5DAjfUDvIEJDA2h4hS5vrQ/YOFs0BjO9/Pmez1qMScSBihkzYAPPqLAUAxrWyIbgk+rfG9ZiFzEfQI=
X-Received: by 2002:a05:6512:118c:b0:52c:b008:3db8 with SMTP id
 2adb3069b0e04-52cb0083e87mr3495123e87.38.1718538185065; Sun, 16 Jun 2024
 04:43:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240613113924.3778837-1-yegorslists@googlemail.com>
 <Zm7K9fkXOlLrekgS@landeda>
In-Reply-To: <Zm7K9fkXOlLrekgS@landeda>
From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sun, 16 Jun 2024 13:42:51 +0200
Message-ID: <CAGm1_ktfU00dOE7n7SdnK25-1AB0ca5KSYYtQPKUaOy+1vob5A@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1718538185; x=1719142985; darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AOKx3xsV0uPiBbx5qK7/WH4O+5A4PobrIMThe3sqrFY=;
 b=GAka0IrRVraEqbkguG8QqO7vIxDfg7nplqEuBmbxE1eHA4KmtMToXURCsdoekoduEm
 57i3hE35dhqY4BZmvZLkzZUqGaovFw7dF5YtbJ3Mw5FAdE3+1m5qMPhWmcwFRZ47S0Td
 k57hJbP0Wd/JW9Cqff0xQ3xgQTgeduWfO0e90wNYYZoNKwYheKoAPnvHKW8+DL6ejtei
 N1yhUqAFyX8oHaKjUn6Xw3QU/OfyUnvhNe4JSSZ3SGG71g/CF1Y8ag1mLdyJ5jfnk8GO
 bsa5zRRMJ03wo4d9118SBSSRBK+oCUaVLz34hWdZ7xx4eFKXC3HnyUI3B3wW+hHFS9Do
 ut/w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GAka0IrR
Subject: Re: [Buildroot] [PATCH] package/ncftp: fix GCC 14.x related build
 errors
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

SGkgWWFubiwgQWxsLAoKT24gU3VuLCBKdW4gMTYsIDIwMjQgYXQgMToyMuKAr1BNIFlhbm4gRS4g
TU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPgo+IFllZ29yLCBBbGwsCj4K
PiBPbiAyMDI0LTA2LTEzIDEzOjM5ICswMjAwLCB5ZWdvcnNsaXN0c0Bnb29nbGVtYWlsLmNvbSBz
cGFrZSB0aHVzbHk6Cj4gPiBGcm9tOiBZZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xl
bWFpbC5jb20+Cj4gPgo+ID4gUGF0Y2hlcyB3ZXJlIHRha2VuIGZyb20gR2VudG9vOgo+ID4KPiA+
IGh0dHBzOi8vYnVncy5nZW50b28ub3JnLzkyMTQ4Nwo+ID4gaHR0cHM6Ly9naXR3ZWIuZ2VudG9v
Lm9yZy9yZXBvL2dlbnRvby5naXQvdHJlZS9uZXQtZnRwL25jZnRwL2ZpbGVzL25jZnRwLTMuMi43
LWZpeC1jbGFuZy5wYXRjaAo+ID4KPiA+IEZpeGVzOgo+ID4gaHR0cDovL2F1dG9idWlsZC5idWls
ZHJvb3QubmV0L3Jlc3VsdHMvMDU4NTc4ZWFlODg1Y2U2ZTIwNmMyNWI1YTI0YWExMWI2MjVhZGY4
OC8KPgo+IFRoYW5rIHlvdSBmb3IgeW91ciBlZmZvcnRzIGluIGhlbHBpbmcgZml4IGJ1aWxkIGZh
aWx1cmVzISDwn5GNCj4KPiA+IFNpZ25lZC1vZmYtYnk6IFllZ29yIFllZnJlbW92IDx5ZWdvcnNs
aXN0c0Bnb29nbGVtYWlsLmNvbT4KPiA+IC0tLQo+IFstLVNOSVAtLV0KPiA+IGRpZmYgLS1naXQg
YS8uY2hlY2twYWNrYWdlaWdub3JlIGIvLmNoZWNrcGFja2FnZWlnbm9yZQo+ID4gaW5kZXggZGQx
ZmQzMWU4Ni4uNTJiNTA5MDAzNCAxMDA2NDQKPiA+IC0tLSBhLy5jaGVja3BhY2thZ2VpZ25vcmUK
PiA+ICsrKyBiLy5jaGVja3BhY2thZ2VpZ25vcmUKPiA+IEBAIC0xMDY3LDYgKzEwNjcsOCBAQCBw
YWNrYWdlL211c2wvMDAwMS1hdm9pZC1rZXJuZWwtaWZfZXRoZXIuaC5wYXRjaCBsaWJfcGF0Y2gu
VXBzdHJlYW0KPiA+ICBwYWNrYWdlL211c2wvMDAwMi1wYWNrYWdlLW11c2wtTWFrZS1zY2hlZHVs
ZXItZnVuY3Rpb25zLUxpbnV4LWNvbXBhdGliLnBhdGNoIGxpYl9wYXRjaC5VcHN0cmVhbQo+ID4g
IHBhY2thZ2UvbmFuby8wMDAxLWxpYi1nZXRyYW5kb20uYy1maXgtYnVpbGQtd2l0aC11Y2xpYmMt
MS4wLjM1LnBhdGNoIGxpYl9wYXRjaC5VcHN0cmVhbQo+ID4gIHBhY2thZ2UvbmFub2NvbS8wMDAx
LWZpeC1idWlsZC13aXRoLWdjYy0xMC5wYXRjaCBsaWJfcGF0Y2guVXBzdHJlYW0KPiA+ICtwYWNr
YWdlL25jZnRwLzAwMDEtbmNmdHAtMy4yLjctZml4LWdjYzE0LnBhdGNoIGxpYl9wYXRjaC5VcHN0
cmVhbQo+ID4gK3BhY2thZ2UvbmNmdHAvMDAwMi1uY2Z0cC0zLjIuNy1maXgtY2xhbmcucGF0Y2gg
bGliX3BhdGNoLlVwc3RyZWFtCj4KPiBEbyBub3QgYWRkIGFuIGV4Y2x1c2lvbiBmb3IgbmV3IHBh
dGNoZXM7IGluc3RlYWQsIGFkZCBhbiBVcHN0cmVhbSB0YWcuCj4KPiBJZiB0aGUgcGF0Y2hlcyB3
ZXJlIG5vdCBmcm9tIHVwc3RyZWFtLCB0aGVuIHN1Ym1pdCB0aGVtIGFuZCBhZGQgdGhlIFVSTAo+
IHRvIHRoYXQgc3VibWlzc2lvbiBhcyBhbiBVcHN0cmVhbSB0YWc7IGlmIHRoZSBwYXRjaGVzIGFy
ZSBub3Qgc3VpdGFibGUKPiBmb3IgdXBzdHJlYW0sIHRoZW4gc3RhdGUgc28gaW4gdGhlIFVwc3Ry
ZWFtIHRhZywgYW5kIGV4cGxhaW4gd2h5Lgo+Cj4gU2VlIHRoZSBtYW51YWw6Cj4gICAgIGh0dHBz
Oi8vYnVpbGRyb290Lm9yZy9kb3dubG9hZHMvbWFudWFsL21hbnVhbC5odG1sI19hZGRpdGlvbmFs
X3BhdGNoX2RvY3VtZW50YXRpb24KClRoZSByZWFzb24gZm9yIHRoZSBtaXNzaW5nIFVwc3RyZWFt
IHRhZyBpcyB0aGF0IHRoZXJlIGlzIG5laXRoZXIgYnVnCnRyYWNrZXIgbm9yIG1haWxpbmcgbGlz
dC4gVGhlIG9ubHkgY29tbXVuaWNhdGlvbiBjaGFubmVsIGlzIGFuIGUtbWFpbAphZGRyZXNzLiBJ
IGhhdmUgYWxyZWFkeSBzZW50IGJvdGggcGF0Y2hlcyBhbmQgYXNrZWQgZ2F6aWxsaW9ucyBvZgpx
dWVzdGlvbnMgYnV0IGFsbCB3YXMgaW4gdmFpbiA6LSgKCj4gQ291bGQgeW91IHJld29yayB0aGlz
IGFuZCByZXN1Ym1pdCwgcGxlYXNlPwoKSSdsbCBzZW5kIHYyLiBUaGFua3MgZm9yIHlvdXIgcmV2
aWV3LgoKWWVnb3IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
