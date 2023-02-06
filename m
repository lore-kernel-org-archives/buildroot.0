Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68809C636D3
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 16:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E849581415;
	Mon,  6 Feb 2023 16:33:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E849581415
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QBWlkvbF0GUS; Mon,  6 Feb 2023 16:33:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF1098188B;
	Mon,  6 Feb 2023 16:33:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF1098188B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A1D9A1BF33A
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 16:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85E4B60B3A
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 16:33:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85E4B60B3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id urveZg5Kio0X for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 16:33:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C95C60B38
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6C95C60B38
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 16:33:45 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-15ff0a1f735so15761411fac.5
 for <buildroot@buildroot.org>; Mon, 06 Feb 2023 08:33:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ehbK5vzz0tYT2Lo9vyFLoRbnud7Tpv++K9yu4U7CqLE=;
 b=cU171C+cO1Big9nto5VEOMigD5KcdaLgRnT9rSAY+nwbZFtBy6I939uFIXuSgmS8uB
 +ldp6SbJ6Muxn5f4eGvBe2yczLgtPgEdGx2L+9VKj3LCmItnePi8l25V0NlCIwWLbFlj
 BtWJ9epHdBeuvaQTYdeKDxXMQjUN/uwRmeeakvV1k97VarLv743W1yutMsgIO94m20oq
 8P31s6UKX13uTtXiC7go2gN/93Qkm39vfVd5kHzKr6H9wu38xhTaQBBnx5r2bss68uDe
 i02qx22lL7qRacpZHjNpTbbHmgnQ9J1+Jc2SB4usRIa70d/pwAgaLChXDPy0obSTKaSO
 9D/g==
X-Gm-Message-State: AO0yUKWHa+EYrkG6EUTr3/OfRQelpybcz69rHU/lVAxMPxkOpLpIuNJ1
 OqdOeA/2GArSB+KDoRinAY/rFqPy3v2Ok2GN4sI=
X-Google-Smtp-Source: AK7set+s2abj0rF1m72hqo6OLh8jiNmXeyiuwv4ZsBVmZH+6GB23GKkjoGwgMjfMb7hvXLEcTFavg64WTPJ0lr/bRaE=
X-Received: by 2002:a05:6870:a44f:b0:169:fd7c:d154 with SMTP id
 n15-20020a056870a44f00b00169fd7cd154mr839273oal.93.1675701224402; Mon, 06 Feb
 2023 08:33:44 -0800 (PST)
MIME-Version: 1.0
References: <20230130002854.2300661-1-james.hilliard1@gmail.com>
 <301bf244-5eb8-3903-3371-80de9a6810aa@smile.fr>
 <282c5a46-37ed-6c07-9b72-86133a71750a@smile.fr>
In-Reply-To: <282c5a46-37ed-6c07-9b72-86133a71750a@smile.fr>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 6 Feb 2023 09:33:33 -0700
Message-ID: <CADvTj4o+c+9BvVXH2=6RsEgwjRbDBSHq+2+6_Whg3=esfUYVbA@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ehbK5vzz0tYT2Lo9vyFLoRbnud7Tpv++K9yu4U7CqLE=;
 b=oTFnCkypRRmN9aAjJzsHx6TK7ZfmaR9jI3s+C9tXaxqulxg2gE1+tnodJI0PZXi0H5
 35xfr1i+/WyXzIQjVoECRrqGc6frED4HMnTI30q+Om6AZeFWymIKCn2gSc1cud+X6IOz
 MD48xamroS9o21/8o0JYkR8dcqcKgvmTbeUc2GuEaRDIVxCCmI80w9oxVbbLBRatihAy
 ArkGT19m0hrW3JruLoHwRZWapkEjQ6s0Fo7Zfh6WWGKNzna/umdlCOvpLeQpNxUMkwCl
 PVnUyQR18FqQolh91j2jJheO1P24pByzcoAdkh5Pw80TgqS1Ao//TnxF2+CXsOUzfByk
 gulg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=oTFnCkyp
Subject: Re: [Buildroot] [PATCH v5 01/10] package/cpuinfo: new package
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBGZWIgNiwgMjAyMyBhdCA5OjI0IEFNIFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3Vy
QHNtaWxlLmZyPiB3cm90ZToKPgo+IEhlbGxvIEphbWVzLAo+Cj4gTGUgMDYvMDIvMjAyMyDDoCAx
Njo1MywgUm9tYWluIE5hb3VyIGEgw6ljcml0IDoKPiA+IEhlbGxvIEphbWVzLAo+ID4KPiA+IExl
IDMwLzAxLzIwMjMgw6AgMDE6MjgsIEphbWVzIEhpbGxpYXJkIGEgw6ljcml0IDoKPiA+PiBGcm9t
OiBTdGVmYW4gSGFnZXIgPHN0ZWZhbi5oYWdlckBnaW56aW5nZXIuY29tPgo+ID4+Cj4gPj4gVGhp
cyBwYWNrYWdlIGlzIHJlcXVpcmVkIGJ5IHRlbnNvcmZsb3ctbGl0ZS4KPiA+Pgo+ID4+IEFkZCBh
IHBhdGNoIHJlbW92aW5nIGNwcCByZXF1aXJlbWVudCB3aGVuIG5vdCBidWlsZGluZyB0ZXN0cy4K
PiA+Pgo+ID4+IFRlc3RlZC1ieTogU3RlZmFuIEhhZ2VyIDxzdGVmYW4uaGFnZXJAZ2luemluZ2Vy
LmNvbT4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFnZXIgPHN0ZWZhbi5oYWdlckBnaW56
aW5nZXIuY29tPgo+ID4+IFNpZ25lZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxs
aWFyZDFAZ21haWwuY29tPgo+ID4+IC0tLQo+ID4+IENoYW5nZXMgdjQgLT4gdjU6Cj4gPj4gICAt
IGRvbid0IHJlcXVpcmUgY3BwCj4gPj4gQ2hhbmdlcyB2MiAtPiB2MzoKPiA+PiAgIC0gbW92ZSB0
byBsaWJyYXJpZXMtPmhhcmR3YXJlIGhhbmRsaW5nCj4gPj4gLS0tCj4KPiBbLi4uXQo+Cj4gPj4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvY3B1aW5mby9Db25maWcuaW4gYi9wYWNrYWdlL2NwdWluZm8v
Q29uZmlnLmluCj4gPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+PiBpbmRleCAwMDAwMDAwMDAw
Li5kM2MzYjA4NDAwCj4gPj4gLS0tIC9kZXYvbnVsbAo+ID4+ICsrKyBiL3BhY2thZ2UvY3B1aW5m
by9Db25maWcuaW4KPiA+PiBAQCAtMCwwICsxLDggQEAKPiA+PiArY29uZmlnIEJSMl9QQUNLQUdF
X0NQVUlORk8KPiA+PiArICAgIGJvb2wgImNwdWluZm8iCj4gPgo+ID4gSGF2ZSB5b3UgY2hlY2tl
ZCBjcHVpbmZvIGRlcGVuZGVuY2llcyA/Cj4gPgo+ID4gSXQgc2VlbXMgWE5OUGFjayB1c2VkIGJ5
IGNwdWluZm8gaXMgNjRiaXRzIGFyY2hpdGVjdHVyZXMgb25seToKPiA+Cj4gPiBDTWFrZSBXYXJu
aW5nIGF0IENNYWtlTGlzdHMudHh0OjY5IChNRVNTQUdFKToKPiA+IFRhcmdldCBwcm9jZXNzb3Ig
YXJjaGl0ZWN0dXJlICJsIiBpcyBub3Qgc3VwcG9ydGVkIGluIGNwdWluZm8uICBjcHVpbmZvCj4g
PiB3aWxsIGNvbXBpbGUsIGJ1dCBjcHVpbmZvX2luaXRpYWxpemUoKSB3aWxsIGFsd2F5cyBmYWls
Lgo+ID4KPiA+IGhpbnQ6Cj4gPiBodHRwczovL2dpdGh1Yi5jb20vTm9idW9Uc3VrYW1vdG8vbWV0
YS10ZW5zb3JmbG93LWxpdGUvYmxvYi9tYWluL3JlY2lwZXMtdG9vbHMvdGVuc29yZmxvdy1saXRl
L3RlbnNvcmZsb3ctbGl0ZS1iZW5jaG1hcmtfMi4xMS4wLmJiI0wzMwo+ID4KPiA+IEFuZCB0cmln
Z2VyIGEgYnVpbGQgaXNzdWUgb24gdUNsaWJjLW5nIGR1ZSB0byBtaXNzaW5nIGhlYWRlcjoKPiA+
Cj4gPiBjcHVpbmZvLWRlMmZhNzhlYmI0MzFkYjk4NDg5ZTc4NjAzZTRmNzdjMWY2YzVjNTcvc3Jj
L2FybS9saW51eC9od2NhcC5jOjE5OjExOgo+ID4gZmF0YWwgZXJyb3I6IHN5cy9hdXh2Lmg6IE5v
IHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKPiA+ICAgIDE5IHwgICNpbmNsdWRlIDxzeXMvYXV4di5o
Pgo+ID4KPiA+IEFsc28gc3RhdGljIGJ1aWxkIGlzIG5vdCBsaWtlbHkgc3VwcG9ydGVkOgo+ID4K
PiA+IGNwdWluZm8tZGUyZmE3OGViYjQzMWRiOTg0ODllNzg2MDNlNGY3N2MxZjZjNWM1Ny9zcmMv
YXJtL2xpbnV4L2h3Y2FwLmM6ODoxMDoKPiA+IGZhdGFsIGVycm9yOiBkbGZjbi5oOiBObyBzdWNo
IGZpbGUgb3IgZGlyZWN0b3J5Cj4gPiAgICAgOCB8ICNpbmNsdWRlIDxkbGZjbi5oPgo+Cj4gQWN0
dWFsbHkgdGhlcmUgaXMgYW4gYXJjaGl0ZWN0dXJlIGRlcGVuZGVuY3k6IHg4NiwgeDg2XzY0LCBh
cm0sIGFhcmNoNjQuCj4gQWxzbyBpdCByZXF1aXJlcyB0aHJlYWRzIHN1cHBvcnQ6Cj4KPiBodHRw
czovL2dpdGh1Yi5jb20vcHl0b3JjaC9jcHVpbmZvL2Jsb2IvbWFpbi9zcmMvaW5pdC5jI0wyNAoK
V2VsbC4uLnRob3NlIGFyY2hpdGVjdHVyZSBkZXBlbmRlbmNpZXMga2luZGEgbG9vayBsaWtlIHJ1
bnRpbWUgZGVwcwp0byBtZS4uLmEgY29uc3VtaW5nIGFwcGxpY2F0aW9uIGNvdWxkIGNhbGwgY3B1
aW5mb19pbml0aWFsaXplKCkgd2l0aAplcnJvciBoYW5kbGluZyBhbmQgZmFsbGJhY2sgdG8gc29t
ZSBvdGhlciBjb2RlcGF0aCBhdXRvbWF0aWNhbGx5IG9uCmZhaWx1cmUuCgpTbyBwcm9iYWJseSB3
ZSBkb24ndCB3YW50IHRvIGFwcGx5IGFuIGFyY2hpdGVjdHVyZSByZXN0cmljdGlvbiB1bmxlc3MK
dGhlcmUncyBhbiBhY3R1YWwgYnVpbGQgZmFpbHVyZS4KCj4KPiBCZXN0IHJlZ2FyZHMsCj4gUm9t
YWluCj4KPiA+Cj4gPiBCZXN0IHJlZ2FyZHMsCj4gPiBSb21haW4KPiA+Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
