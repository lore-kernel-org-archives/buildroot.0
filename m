Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6FBC433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 10:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34C4C40588;
	Sun, 13 Mar 2022 10:33:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NKNLHWbvMtiF; Sun, 13 Mar 2022 10:33:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D8B240480;
	Sun, 13 Mar 2022 10:33:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CE1671BF341
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 10:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEAFD60E9C
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 10:33:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7yH4FCWixUM4 for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 10:33:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA8A560E9B
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 10:33:11 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id v62so14145568vsv.1
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 03:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3ST4vtP1i9kt6PHS7MLUGwKM+HZiVvXu2IZjFMfXe24=;
 b=jsmSup3ldSWV5TOha1B4Nl9Im1I+ds+p/aXWpSeYnrZch45N6tNVvY1FZUAqj+6WYe
 CMFlWjHO8UqsWz4ZqPVpl+eeS5jo6Bf/j9/1AyWk1akXepI7GcjlWBdtVfWzRA+Wf/py
 AuwgHQnKCf/wAgzPb7PUfxO0J1IjAOK3Q2Schtn9tCWNUjkef/r3JkCXWFkwN0HlD8Xe
 eMs0SvINnvOslOsFGrsXlWlriLdjQID4fRlDqbGwV/BwuXlIisWDS+w6n7EEB3JASiRP
 LoXuNmpAVSGFCAJ3NSkQEtEh73EZQxwOHKccSoaFZWG+beI8egqqv1hSyT8ggv1RYSlO
 uXsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3ST4vtP1i9kt6PHS7MLUGwKM+HZiVvXu2IZjFMfXe24=;
 b=RxqGPsvJ0urBB1ghUHJDZFP8h0w5B0JdgkX9tJTvzziZkWH2h4lO6Erpsw3iF47afc
 7AKZ35l4AaZQ2Or5EFuB2prYsa9jkuL4q1d3PRckRh6okXqQMG6V1pKP/0Ef/C7m+OzR
 M/A7qfQfrOS4qtAoelR/3UqyeP2RgRmUJGdv7RAIrBH8O8CcMSH/hCXYHKyyoqxoMqQm
 AQo/PjLw6JsyDHwTjeZpQi6VM3aKnXdlY369/bTL2JlupWM6mE8Mbq33Mnn88CI6IKZE
 6Ibg7mA/SzIZNpQ67VkzM4TIiFVIGkEEKcEe3RA975yJ3i0g/vtRxh2Kme1gWq2pkFph
 pFNQ==
X-Gm-Message-State: AOAM533b4ydKoBGQblZirkJkqnuYkj0eUJ+cDXGG3No8DaU9YPkqnYAK
 j4KOss4v5b698bkAamALtxRB4zfvIHgCL1Z++Lj2g3zE97qiOQ==
X-Google-Smtp-Source: ABdhPJzvC3pBkim25a+oX3zQyqJhvRPGA+58AlzfbFBCijanIjZxmGP3tXrTOXlPx548gqomAx0+nCY6MPusv6jHsWQ=
X-Received: by 2002:a67:c787:0:b0:31e:874e:b9a3 with SMTP id
 t7-20020a67c787000000b0031e874eb9a3mr7784594vsk.54.1647167590379; Sun, 13 Mar
 2022 03:33:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220227101003.3702134-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20220227101003.3702134-1-fontaine.fabrice@gmail.com>
From: Gilles Talis <gilles.talis@gmail.com>
Date: Sun, 13 Mar 2022 11:32:58 +0100
Message-ID: <CAKcgs2wnhYEd00JsnPWCjM9+N1f03jkj5SXQT9gFOKjTcSESzg@mail.gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH/next 1/1] package/ocrad: bump to version 0.28
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRmFicmljZSwKdGhhbmtzIGZvciB0aGUgYnVtcC4KCkxlIGRpbS4gMjcgZsOpdnIuIDIwMjIg
w6AgMTE6MTAsIEZhYnJpY2UgRm9udGFpbmUKPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPiBh
IMOpY3JpdCA6Cj4KPiAtIEFkZCBsaWJwbmcgbWFuZGF0b3J5IGRlcGVuZGVuY3kKPiAtIFVwZGF0
ZSBpbmRlbnRhdGlvbiBpbiBoYXNoIGZpbGUgKHR3byBzcGFjZXMpCj4KPiBTaWduZWQtb2ZmLWJ5
OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KPiAtLS0KPiAg
cGFja2FnZS9vY3JhZC9Db25maWcuaW4gIHwgMSArCj4gIHBhY2thZ2Uvb2NyYWQvb2NyYWQuaGFz
aCB8IDQgKystLQo+ICBwYWNrYWdlL29jcmFkL29jcmFkLm1rICAgfCAzICsrLQo+ICAzIGZpbGVz
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL29jcmFkL0NvbmZpZy5pbiBiL3BhY2thZ2Uvb2NyYWQvQ29uZmlnLmluCj4gaW5k
ZXggMzhkMzdjNjEyYS4uYjZjNDMwMGY4NiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL29jcmFkL0Nv
bmZpZy5pbgo+ICsrKyBiL3BhY2thZ2Uvb2NyYWQvQ29uZmlnLmluCj4gQEAgLTEsNiArMSw3IEBA
Cj4gIGNvbmZpZyBCUjJfUEFDS0FHRV9PQ1JBRAo+ICAgICAgICAgYm9vbCAib2NyYWQiCj4gICAg
ICAgICBkZXBlbmRzIG9uIEJSMl9JTlNUQUxMX0xJQlNURENQUAo+ICsgICAgICAgc2VsZWN0IEJS
Ml9QQUNLQUdFX0xJQlBORwo+ICAgICAgICAgaGVscAo+ICAgICAgICAgICBHTlUgT2NyYWQgaXMg
YW4gT0NSIChPcHRpY2FsIENoYXJhY3RlciBSZWNvZ25pdGlvbikgcHJvZ3JhbQo+ICAgICAgICAg
ICBiYXNlZCBvbiBhIGZlYXR1cmUgZXh0cmFjdGlvbiBtZXRob2QuCj4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2Uvb2NyYWQvb2NyYWQuaGFzaCBiL3BhY2thZ2Uvb2NyYWQvb2NyYWQuaGFzaAo+IGluZGV4
IDdhZTM4YzMwZTguLmNkNWIwMDM5ZWEgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9vY3JhZC9vY3Jh
ZC5oYXNoCj4gKysrIGIvcGFja2FnZS9vY3JhZC9vY3JhZC5oYXNoCj4gQEAgLTEsMyArMSwzIEBA
Cj4gICMgTG9jYWxseSBjYWxjdWxhdGVkIGFmdGVyIGNoZWNraW5nIHBncCBzaWduYXR1cmUKPiAt
c2hhMjU2IGE5YmZlNjdlOWEwNDA5MDdhZmY1NjQwZGNhNTYzOTI0NzZiNmE4OWU0OGUzN2RjOTRi
YTg0NmM1YjY3MzNiMzYgIG9jcmFkLTAuMjcudGFyLmx6Cj4gLXNoYTI1NiAzZDc3YzFhNThmYmRl
NWRkYmE2MTJkMWZlMDk5NjVlMjBhMzgwNDk1M2VjYTEyZThjMTg5MjI5OGJiOGE1ZWVmICBDT1BZ
SU5HCj4gK3NoYTI1NiAgMzRjY2VhNTc2ZGJkYWRhYTU5NzllNjIwMjM0NGMzZmY2ODczN2Q4Mjlj
YTdiNjZmNzFjODQ5N2QzNmJiYmYyZSAgb2NyYWQtMC4yOC50YXIubHoKPiArc2hhMjU2ICAzZDc3
YzFhNThmYmRlNWRkYmE2MTJkMWZlMDk5NjVlMjBhMzgwNDk1M2VjYTEyZThjMTg5MjI5OGJiOGE1
ZWVmICBDT1BZSU5HCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvb2NyYWQvb2NyYWQubWsgYi9wYWNr
YWdlL29jcmFkL29jcmFkLm1rCj4gaW5kZXggZTAzN2EwODE5NS4uOTgyYmIwMDJjOSAxMDA2NDQK
PiAtLS0gYS9wYWNrYWdlL29jcmFkL29jcmFkLm1rCj4gKysrIGIvcGFja2FnZS9vY3JhZC9vY3Jh
ZC5tawo+IEBAIC00LDEyICs0LDEzIEBACj4gICMKPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMK
Pgo+IC1PQ1JBRF9WRVJTSU9OID0gMC4yNwo+ICtPQ1JBRF9WRVJTSU9OID0gMC4yOAo+ICBPQ1JB
RF9TT1VSQ0UgPSBvY3JhZC0kKE9DUkFEX1ZFUlNJT04pLnRhci5sego+ICBPQ1JBRF9TSVRFID0g
JChCUjJfR05VX01JUlJPUikvb2NyYWQKPiAgT0NSQURfTElDRU5TRSA9IEdQTC0zLjArCkkgaGF2
ZSBqdXN0IG5vdGljZWQgdGhhdCB0aGUgbGljZW5zZSBoYXMgY2hhbmdlZCBzaW5jZSB2ZXJzaW9u
IDAuMjQKYW5kIGlzIG5vdyBHUEx2MisuClBsZWFzZSBjaGVjayB0aGUgbGljZW5zaW5nIHNlY3Rp
b24gaW4gWzFdCgo+ICBPQ1JBRF9MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwo+ICBPQ1JBRF9JTlNU
QUxMX1NUQUdJTkcgPSBZRVMKPiArT0NSQURfREVQRU5ERU5DSUVTID0gbGlicG5nCj4KPiAgIyBU
aGlzIGlzIG5vdCBhIHRydWUgYXV0b3Rvb2xzIHBhY2thZ2UuCj4gIGRlZmluZSBPQ1JBRF9DT05G
SUdVUkVfQ01EUwo+IC0tCj4gMi4zNC4xCj4KQ2FuIHlvdSBwbGVhc2Ugc2VuZCBhbiB1cGRhdGUg
d2l0aCBhIGZpeCBmb3IgdGhlIGxpY2Vuc2U/CnRoYW5rcwpHaWxsZXMKClsxXSBodHRwczovL3d3
dy5nbnUub3JnL3NvZnR3YXJlL29jcmFkLwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
