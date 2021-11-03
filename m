Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22F08C433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:02:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E401B6115B
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:02:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E401B6115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9CC760B07;
	Wed,  3 Nov 2021 21:02:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CQ3G5YjjhlJM; Wed,  3 Nov 2021 21:02:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 046D860AD8;
	Wed,  3 Nov 2021 21:02:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6B87D1BF3D6
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 583E44039C
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:02:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FSGyTlxE6P0m for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 21:02:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD14E40389
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 21:02:02 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 c71-20020a1c9a4a000000b0032cdcc8cbafso2803552wme.3
 for <buildroot@buildroot.org>; Wed, 03 Nov 2021 14:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jswCdWMmTkcSPWdkZsra9bKo9fV8Z0VztTSt7IiIa0U=;
 b=YxlaKU6xpMQT8GNT56MbetdfUefcn1f9jK0MoXpJhkOm0LvPXbA4xXHNy73PcMa81R
 RmJV4Ai8pELZhNDptV/GJGBxx4WavFDFxoCjXrm3GsiJxx+ugfjSrlAOZUDdxgljD/Ry
 QY6mrmOTB15OsPgTNP844jUm/ZzU8ulv3sHtUUI9P47gZSAtyBYVi+DtqY0nmfk98aD7
 ZUSJezB5pJIDw4Nokj8maq3gdJA/2hxEq/q5NL2OUyH+TTVMvhqZ2gXfXNuz83xMZlwD
 +T1vZPCIk20ilReghObg2pUMeieofl6ykTyrWS4WCneOtlGLvghw4Se5DCgtx1qJsWOv
 wL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jswCdWMmTkcSPWdkZsra9bKo9fV8Z0VztTSt7IiIa0U=;
 b=uxtoKsIx4idgK8TSt9bS4AVbIxPCVg2uyiJKbwZQuDgjM+wuxvacDbMy6d7ZzibLyZ
 cIGfnZufZrON5jtFu2nmk771GpU3jNweqH8LZgJaftBvOdqGvCF341ZIDzOATNxwQyGB
 142irP46o61Iv0LeGRTvAVXUW42N77Kmy7S2X63vqY1vbFxh9ZB3IjNEYTGMwn4aovSL
 g0zxxIJrVCG9P2UaIfWvUEqATn+JiBUJwQO71NAEWqO+yge9/DMbaSh6/ZNXPYRfmptT
 w1QkHrixeNYK/UgY+DmrHZIpeFydg4hwIPVJAmfGPORxA6uRe8eN5l/ZSZgZCKK8LJLe
 s8eA==
X-Gm-Message-State: AOAM532ewN+u/+j9DxgzJp67kqhcFqv8dO+RsP5JxnHdoFw6cXtBsm0r
 d7SKhpPj1CXi0GUciVk2y7xIqc8tHrE=
X-Google-Smtp-Source: ABdhPJw9aNrZ8qucy0FoETwx4uE6Lz8S9tT6Uq/lAPzPjB75+pk0P3w+4bEga439//zlEb4vQKZRSQ==
X-Received: by 2002:a7b:c31a:: with SMTP id k26mr18230157wmj.187.1635973321085; 
 Wed, 03 Nov 2021 14:02:01 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id k37sm2963722wms.21.2021.11.03.14.02.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 14:02:00 -0700 (PDT)
Message-ID: <9cb28f87-ad3e-245d-8ad2-6ad296821664@gmail.com>
Date: Wed, 3 Nov 2021 22:01:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Peter Seiderer <ps.report@gmx.net>,
 James Hilliard <james.hilliard1@gmail.com>
References: <20211101133359.2228115-1-romain.naour@gmail.com>
 <CADvTj4oZ4LFS7Z-teBPr99gBGnQ5nn0H==YpXpgvsxx8OS1YVg@mail.gmail.com>
 <20211103203655.098da13a@gmx.net>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20211103203655.098da13a@gmx.net>
Subject: Re: [Buildroot] [PATCH] package/ca-certificates: add missing
 host-python3-six dependency
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
Cc: Martin Bark <martin@barkynet.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSmFtZXMsIFBldGVyLAoKTGUgMDMvMTEvMjAyMSDDoCAyMDozNiwgUGV0ZXIgU2VpZGVy
ZXIgYSDDqWNyaXTCoDoKPiBIZWxsbyBKYW1lcywgSGlsbGlhcmQsCj4gCj4gT24gTW9uLCAxIE5v
diAyMDIxIDIxOjIwOjEwIC0wNjAwLCBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdt
YWlsLmNvbT4gd3JvdGU6Cj4gCj4+IE9uIE1vbiwgTm92IDEsIDIwMjEgYXQgNzozNCBBTSBSb21h
aW4gTmFvdXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+IHdyb3RlOgo+Pj4KPj4+IGNhLWNlcnRp
ZmljYXRlcyB1c2Ugc29tZSBweXRob24gc2NyaXB0cyBkdXJpbmcgdGhlIGJ1aWxkIHN0ZXAgdGhh
dAo+Pj4gcmVxdWlyZXMgcHl0aG9uLXNpeCBmb3IgaG9zdC1weXRob24zLgo+Pj4KPj4+IHB5dGhv
bjMgY2VydGRhdGEycGVtLnB5Cj4+PiBUcmFjZWJhY2sgKG1vc3QgcmVjZW50IGNhbGwgbGFzdCk6
Cj4+PiAgIEZpbGUgIi9idWlsZHMvYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvdGVzdC1vdXRwdXQv
VGVzdERvY2tlckNvbXBvc2UvYnVpbGQvY2EtY2VydGlmaWNhdGVzLTIwMjExMDE2L21vemlsbGEv
Y2VydGRhdGEycGVtLnB5IiwgbGluZSAzMSwgaW4gPG1vZHVsZT4KPj4+ICAgICBmcm9tIGNyeXB0
b2dyYXBoeSBpbXBvcnQgeDUwOQo+Pj4gICBGaWxlICIvYnVpbGRzL2J1aWxkcm9vdC5vcmcvYnVp
bGRyb290L3Rlc3Qtb3V0cHV0L1Rlc3REb2NrZXJDb21wb3NlL2hvc3QvbGliL3B5dGhvbjMuOS9z
aXRlLXBhY2thZ2VzL2NyeXB0b2dyYXBoeS94NTA5L19faW5pdF9fLnB5IiwgbGluZSA3LCBpbiA8
bW9kdWxlPgo+Pj4gICAgIGZyb20gY3J5cHRvZ3JhcGh5Lng1MDkgaW1wb3J0IGNlcnRpZmljYXRl
X3RyYW5zcGFyZW5jeQo+Pj4gICBGaWxlICIvYnVpbGRzL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290
L3Rlc3Qtb3V0cHV0L1Rlc3REb2NrZXJDb21wb3NlL2hvc3QvbGliL3B5dGhvbjMuOS9zaXRlLXBh
Y2thZ2VzL2NyeXB0b2dyYXBoeS94NTA5L2NlcnRpZmljYXRlX3RyYW5zcGFyZW5jeS5weSIsIGxp
bmUgMTAsIGluIDxtb2R1bGU+Cj4+PiAgICAgaW1wb3J0IHNpeAo+Pj4gTW9kdWxlTm90Rm91bmRF
cnJvcjogTm8gbW9kdWxlIG5hbWVkICdzaXgnCj4+Cj4+IFRoZSBmYWlsdXJlIGFwcGVhcnMgdG8g
Y29tZSBmcm9tIGEgbWlzc2luZyBjcnlwdG9ncmFwaHkgZGVwZW5kZW5jeQo+PiBzbyBJIHRoaW5r
IG15IGZpeCBpbiBweXRob24tY3J5cHRvZ3JhcGh5IG1heSBiZSBiZXR0ZXI6Cj4+IGh0dHBzOi8v
cGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMTEwMjkwNjU5
NTcuMzA4NDUyOC0xLWphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20vCj4gCj4gQWNjb3JkIHdpdGgg
SmFtZXMgYXMgdGhlIGJhY2t0cmFjZSBzaG93cyB0aGUgJ2ltcG9ydCBzaXgnIGZyb20gdGhlIGNy
eXB0b2dyYXBoeQo+IHBhY2thZ2UuLi4KClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLCBJJ20gbWFy
a2luZyB0aGlzIHBhdGNoIHJlamVjdGVkLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IFJl
Z2FyZHMsCj4gUGV0ZXIKPiAKPj4KPj4+Cj4+PiBGaXhlczoKPj4+IGh0dHBzOi8vZ2l0bGFiLmNv
bS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvMTczNDQxNzcxMQo+Pj4gaHR0cDovL2F1
dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvZDE0L2QxNDVmOTk3Y2M2ZGIxN2E4ZWFiMTRk
OWNlZDhmYTM1MzMyYzQ5NjkvYnVpbGQtZW5kLmxvZwo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFJv
bWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4KPj4+IENjOiBNYXJ0aW4gQmFyayA8
bWFydGluQGJhcmt5bmV0LmNvbT4KPj4+IC0tLQo+Pj4gIHBhY2thZ2UvY2EtY2VydGlmaWNhdGVz
L2NhLWNlcnRpZmljYXRlcy5tayB8IDIgKy0KPj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9jYS1jZXJ0
aWZpY2F0ZXMvY2EtY2VydGlmaWNhdGVzLm1rIGIvcGFja2FnZS9jYS1jZXJ0aWZpY2F0ZXMvY2Et
Y2VydGlmaWNhdGVzLm1rCj4+PiBpbmRleCBlYjc1ZDIzZjQ0Li5lMjFhYzVkOTA3IDEwMDY0NAo+
Pj4gLS0tIGEvcGFja2FnZS9jYS1jZXJ0aWZpY2F0ZXMvY2EtY2VydGlmaWNhdGVzLm1rCj4+PiAr
KysgYi9wYWNrYWdlL2NhLWNlcnRpZmljYXRlcy9jYS1jZXJ0aWZpY2F0ZXMubWsKPj4+IEBAIC03
LDcgKzcsNyBAQAo+Pj4gIENBX0NFUlRJRklDQVRFU19WRVJTSU9OID0gMjAyMTEwMTYKPj4+ICBD
QV9DRVJUSUZJQ0FURVNfU09VUkNFID0gY2EtY2VydGlmaWNhdGVzXyQoQ0FfQ0VSVElGSUNBVEVT
X1ZFUlNJT04pLnRhci54ego+Pj4gIENBX0NFUlRJRklDQVRFU19TSVRFID0gaHR0cHM6Ly9zbmFw
c2hvdC5kZWJpYW4ub3JnL2FyY2hpdmUvZGViaWFuLzIwMjExMDIyVDE0NDkwM1ovcG9vbC9tYWlu
L2MvY2EtY2VydGlmaWNhdGVzCj4+PiAtQ0FfQ0VSVElGSUNBVEVTX0RFUEVOREVOQ0lFUyA9IGhv
c3Qtb3BlbnNzbCBob3N0LXB5dGhvbjMgaG9zdC1weXRob24tY3J5cHRvZ3JhcGh5Cj4+PiArQ0Ff
Q0VSVElGSUNBVEVTX0RFUEVOREVOQ0lFUyA9IGhvc3Qtb3BlbnNzbCBob3N0LXB5dGhvbjMgaG9z
dC1weXRob24zLXNpeCBob3N0LXB5dGhvbi1jcnlwdG9ncmFwaHkKPj4+ICBDQV9DRVJUSUZJQ0FU
RVNfTElDRU5TRSA9IEdQTC0yLjArIChzY3JpcHQpLCBNUEwtMi4wIChkYXRhKQo+Pj4gIENBX0NF
UlRJRklDQVRFU19MSUNFTlNFX0ZJTEVTID0gZGViaWFuL2NvcHlyaWdodAo+Pj4KPj4+IC0tCj4+
PiAyLjMxLjEKPj4+Cj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+Pj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+Pj4gYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKPj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4+
IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+
IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
