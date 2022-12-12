Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AAF9C4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 04:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB78040112;
	Mon, 12 Dec 2022 04:11:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB78040112
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4BogqlIJMj9F; Mon, 12 Dec 2022 04:11:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D21814019D;
	Mon, 12 Dec 2022 04:11:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D21814019D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A2C2E1BF3A0
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 04:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D4EF80FBA
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 04:11:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D4EF80FBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ppk0X8up-y-A for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 04:11:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E79180FB2
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E79180FB2
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 04:11:05 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-417b63464c6so30199487b3.8
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 20:11:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=umve0BZ8rlVWUebi6+KUTxUEwJkHAnBJvntzScirObg=;
 b=qiH9rd9LDIXGaJo/STsF9xUS/V81h2lqdSett9CNf63n/M8SkRoS4FetlsCBW32AZj
 d3vV3voyH2Arq0PHuwHkxZ/HFpUsWhzPjiQ42kQQDO/XKaSrNJUG5ApVclBdvQcljkxB
 4BqhfHvaUfBXdsC2mVxtqkLnc2pUqNrentty7zlH5b6AhtFQIjbUwpaMG9gQGEP9VjlJ
 QHaeBYwbVimgCuTNrFM9EW75EGpd8V7/TN1epJKZWUjEDwQwEPIKAmn4MCx6x4tShlNf
 qkRPXB1Pf7u0/0lz/wcFOBwNOxWLEJjmU4y0NDJqUhx8ZCUixNPM3jJBjMC33Zi3wyZn
 jECQ==
X-Gm-Message-State: ANoB5placR3ZHzIK/gShdTuH/31fojYSClYpYpsXbh5m0A7AfLWtyELp
 ncLyTXDIaawI+Hx105EQnMFvGSKN00hu4IR8yi4=
X-Google-Smtp-Source: AA0mqf5itpB8JMkcWBtxqyxCuDqp8KhZqGr04AH3IarZbPdzPYsV9amMK/vvkCJCDCcSA86JjTmipV21vlL8TOXz2qg=
X-Received: by 2002:a81:194b:0:b0:408:5c67:a09c with SMTP id
 72-20020a81194b000000b004085c67a09cmr1808787ywz.247.1670818263717; Sun, 11
 Dec 2022 20:11:03 -0800 (PST)
MIME-Version: 1.0
References: <20221211225515.588291-1-james.hilliard1@gmail.com>
In-Reply-To: <20221211225515.588291-1-james.hilliard1@gmail.com>
Date: Mon, 12 Dec 2022 05:10:52 +0100
Message-ID: <CAGm1_ks6hAJ6oWd0L7n7W=Eyob3i38PXWvVcHmyamnX-CBq88Q@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=umve0BZ8rlVWUebi6+KUTxUEwJkHAnBJvntzScirObg=;
 b=HbX5SE1Sl9ry4K5Wb+RCJqugNLxvVJgP/sufCsxBTGw9Lw5igcqnrjzbqLjVQ0E4W3
 r4/rsirKSrTqrXi/hjEENAaLBKf2oFeiMzYyTclAOx8pBScWFbrZ9/sTtNs4n5WYvyHi
 +8cfkpsQGURZRx/VlTjceppa2KNOrjFv7hYfnyTMTvjv9VlXmUUGpiVyvrFtdqHLt3Wt
 aXhsD8ZSFOgcuKtalShgv26YJlhbl75xOfiAM0GIccY0xcCcw2r1nkHd3kwqi8ABceyH
 kKzP76sc1Q8HbtFDIRDUE7WASEVPRDxLcDfy+GANrVjOFLjdQpCKls25FJOJeQVH/Aaz
 v//w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HbX5SE1S
Subject: Re: [Buildroot] [PATCH 1/1] package/python-bunch: remove package
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSmFtZXMsIGFsbCwKCk9uIFN1biwgRGVjIDExLCAyMDIyIGF0IDExOjU2IFBNIEphbWVzIEhp
bGxpYXJkCjxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiB3cm90ZToKPgo+IFNpbmNlIHRoZSBw
eXRob24zIGJ1bXAgdG8gdmVyc2lvbiAzLjExIGluIGNvbW1pdAo+IDczODUwMGMyOTZjOGIxMjA2
ZjIwZTk0Y2EzZTdjNTkzMmE2YTA0ODYgcHl0aG9uLWJ1bmNoIGhhcyBmYWlsZWQKPiB0byBidWls
ZC4KPgo+IFRoaXMgaXMgZHVlIHRvIG9wZW4oKSB3aGljaCBubyBsb25nZXIgYWNjZXB0cyAnVScg
KOKAnHVuaXZlcnNhbAo+IG5ld2xpbmXigJ0pIGluIHRoZSBmaWxlIG1vZGUuCj4KPiBSZW1vdmUg
dGhpcyBwYWNrYWdlIGFzIGl0IGhhcyBub3QgaGFkIGEgcmVsZWFzZSBzaW5jZSAyMDExIGFuZAo+
IGlzIHVubWFpbnRhaW5lZCB1cHN0cmVhbS4KPgo+IERldGFpbHM6Cj4gaHR0cHM6Ly9kb2NzLnB5
dGhvbi5vcmcvMy4xMS93aGF0c25ldy8zLjExLmh0bWwjcG9ydGluZy10by1weXRob24tMy0xMQo+
Cj4gRml4ZXM6Cj4gIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvMmJh
LzJiYTcyZmM5ODM3NjA1YTM2ZWE2M2JiZDNlNmUxODFhNDBjZGYzNjAKPgo+IFNpZ25lZC1vZmYt
Ynk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+IC0tLQo+ICBD
b25maWcuaW4ubGVnYWN5ICAgICAgICAgICAgICAgICAgICAgICB8ICA2ICsrKysrKwo+ICBERVZF
TE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxIC0KPiAgcGFja2FnZS9Db25m
aWcuaW4gICAgICAgICAgICAgICAgICAgICAgfCAgMSAtCj4gIHBhY2thZ2UvcHl0aG9uLWJ1bmNo
L0NvbmZpZy5pbiAgICAgICAgIHwgIDYgLS0tLS0tCj4gIHBhY2thZ2UvcHl0aG9uLWJ1bmNoL3B5
dGhvbi1idW5jaC5oYXNoIHwgIDUgLS0tLS0KPiAgcGFja2FnZS9weXRob24tYnVuY2gvcHl0aG9u
LWJ1bmNoLm1rICAgfCAxNCAtLS0tLS0tLS0tLS0tLQo+ICA2IGZpbGVzIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgMjcgZGVsZXRpb25zKC0pCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdl
L3B5dGhvbi1idW5jaC9Db25maWcuaW4KPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcHl0
aG9uLWJ1bmNoL3B5dGhvbi1idW5jaC5oYXNoCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdl
L3B5dGhvbi1idW5jaC9weXRob24tYnVuY2gubWsKPgo+IGRpZmYgLS1naXQgYS9Db25maWcuaW4u
bGVnYWN5IGIvQ29uZmlnLmluLmxlZ2FjeQo+IGluZGV4IDI4YzY4MjI2ODkuLjVjMWUxNjJmNTYg
MTAwNjQ0Cj4gLS0tIGEvQ29uZmlnLmluLmxlZ2FjeQo+ICsrKyBiL0NvbmZpZy5pbi5sZWdhY3kK
PiBAQCAtMTQ2LDYgKzE0NiwxMiBAQCBlbmRpZgo+Cj4gIGNvbW1lbnQgIkxlZ2FjeSBvcHRpb25z
IHJlbW92ZWQgaW4gMjAyMy4wMiIKPgo+ICtjb25maWcgQlIyX1BBQ0tBR0VfUFlUSE9OX0JVTkNI
Cj4gKyAgICAgICBib29sICJweXRob24tYnVuY2ggcmVtb3ZlZCIKPiArICAgICAgIHNlbGVjdCBC
UjJfTEVHQUNZCgpTaG91bGQgd2UgYWRkICJzZWxlY3QgQlIyX1BZVEhPTl9NVU5DSCI/CgpUaGlz
IHBhY2thZ2UgaXMgYSBtYWludGFpbmVkIGZvcms6IGh0dHBzOi8vZ2l0aHViLmNvbS9JbmZpbmlk
YXQvbXVuY2gKClJlZ2FyZHMsClllZ29yCgo+ICsgICAgICAgaGVscAo+ICsgICAgICAgICBUaGUg
cHl0aG9uLWJ1bmNoIHBhY2thZ2UgaXMgdW5tYWludGFpbmVkLgo+ICsKPiAgY29uZmlnIEJSMl9Q
QUNLQUdFX1BZVEhPTl9NMlIKPiAgICAgICAgIGJvb2wgInB5dGhvbi1tMnIgcmVtb3ZlZCIKPiAg
ICAgICAgIHNlbGVjdCBCUjJfTEVHQUNZCj4gZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZF
TE9QRVJTCj4gaW5kZXggZjBkY2M0MmRlNy4uMGMzNzczNjk1YSAxMDA2NDQKPiAtLS0gYS9ERVZF
TE9QRVJTCj4gKysrIGIvREVWRUxPUEVSUwo+IEBAIC0yMDE3LDcgKzIwMTcsNiBAQCBGOiAgICAg
ICAgcGFja2FnZS9wb2xpY3ljb3JldXRpbHMvCj4gIEY6ICAgICBwYWNrYWdlL3Byb2Z0cGQvCj4g
IEY6ICAgICBwYWNrYWdlL3Byb3RvYnVmLWMvCj4gIEY6ICAgICBwYWNrYWdlL3Byb3RvYnVmLwo+
IC1GOiAgICAgcGFja2FnZS9weXRob24tYnVuY2gvCj4gIEY6ICAgICBwYWNrYWdlL3B5dGhvbi1j
b2xvcmFtYS8KPiAgRjogICAgIHBhY2thZ2UvcHl0aG9uLWZpbGVsb2NrLwo+ICBGOiAgICAgcGFj
a2FnZS9weXRob24tZmxhc2stY29ycy8KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4g
Yi9wYWNrYWdlL0NvbmZpZy5pbgo+IGluZGV4IDkxNGMzNTg0ZTkuLjdmMGMzNDUxOWEgMTAwNjQ0
Cj4gLS0tIGEvcGFja2FnZS9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL0NvbmZpZy5pbgo+IEBA
IC05NzksNyArOTc5LDYgQEAgbWVudSAiRXh0ZXJuYWwgcHl0aG9uIG1vZHVsZXMiCj4gICAgICAg
ICBzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWJvdHRsZS9Db25maWcuaW4iCj4gICAgICAgICBzb3Vy
Y2UgInBhY2thZ2UvcHl0aG9uLWJyb3RsaS9Db25maWcuaW4iCj4gICAgICAgICBzb3VyY2UgInBh
Y2thZ2UvcHl0aG9uLWJzZGlmZjQvQ29uZmlnLmluIgo+IC0gICAgICAgc291cmNlICJwYWNrYWdl
L3B5dGhvbi1idW5jaC9Db25maWcuaW4iCj4gICAgICAgICBzb3VyY2UgInBhY2thZ2UvcHl0aG9u
LWNhY2hlZC1wcm9wZXJ0eS9Db25maWcuaW4iCj4gICAgICAgICBzb3VyY2UgInBhY2thZ2UvcHl0
aG9uLWNhbi9Db25maWcuaW4iCj4gICAgICAgICBzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWNhbm9w
ZW4vQ29uZmlnLmluIgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1idW5jaC9Db25maWcu
aW4gYi9wYWNrYWdlL3B5dGhvbi1idW5jaC9Db25maWcuaW4KPiBkZWxldGVkIGZpbGUgbW9kZSAx
MDA2NDQKPiBpbmRleCA4OWVhZTc0MmI4Li4wMDAwMDAwMDAwCj4gLS0tIGEvcGFja2FnZS9weXRo
b24tYnVuY2gvQ29uZmlnLmluCj4gKysrIC9kZXYvbnVsbAo+IEBAIC0xLDYgKzAsMCBAQAo+IC1j
b25maWcgQlIyX1BBQ0tBR0VfUFlUSE9OX0JVTkNICj4gLSAgICAgICBib29sICJweXRob24tYnVu
Y2giCj4gLSAgICAgICBoZWxwCj4gLSAgICAgICAgIEEgZG90LWFjY2Vzc2libGUgZGljdGlvbmFy
eSAoYSBsYSBKYXZhU2NyaXB0IG9iamVjdHMpLgo+IC0KPiAtICAgICAgICAgaHR0cDovL2dpdGh1
Yi5jb20vZHNjL2J1bmNoCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLWJ1bmNoL3B5dGhv
bi1idW5jaC5oYXNoIGIvcGFja2FnZS9weXRob24tYnVuY2gvcHl0aG9uLWJ1bmNoLmhhc2gKPiBk
ZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCBjZmRlMmRiNjAzLi4wMDAwMDAwMDAwCj4g
LS0tIGEvcGFja2FnZS9weXRob24tYnVuY2gvcHl0aG9uLWJ1bmNoLmhhc2gKPiArKysgL2Rldi9u
dWxsCj4gQEAgLTEsNSArMCwwIEBACj4gLSMgbWQ1LCBzaGEyNTYgZnJvbSBodHRwczovL3B5cGku
b3JnL3B5cGkvYnVuY2gvanNvbgo+IC1tZDUgIDBhODI5ZDY0ZTk1ZWQ5NmRlZmJjYWUyYmY5MDYx
YmIwICBidW5jaC0xLjAuMS50YXIuZ3oKPiAtc2hhMjU2ICA1MGM3N2EwZmMwY2IzNzJkZmU0OGI1
ZTExOTM3ZDVmNzBlNzQzYWRiZjQyNjgzZjNhNmQyODU3NjQ1YTc2YWFhICBidW5jaC0xLjAuMS50
YXIuZ3oKPiAtIyBMb2NhbGx5IGNvbXB1dGVkIHNoYTI1NiBjaGVja3N1bXMKPiAtc2hhMjU2ICA1
N2NhOTVjOTIwNTljODM4MDYyNTE5MjQ2Mjk3OWJkMzI5OTRhYWUzZmNkZjkwMmZmNmViMWU0Njdl
ZWIwNDY5ICBMSUNFTlNFLnR4dAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1idW5jaC9w
eXRob24tYnVuY2gubWsgYi9wYWNrYWdlL3B5dGhvbi1idW5jaC9weXRob24tYnVuY2gubWsKPiBk
ZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAxOGZkYzIyM2JiLi4wMDAwMDAwMDAwCj4g
LS0tIGEvcGFja2FnZS9weXRob24tYnVuY2gvcHl0aG9uLWJ1bmNoLm1rCj4gKysrIC9kZXYvbnVs
bAo+IEBAIC0xLDE0ICswLDAgQEAKPiAtIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAtIwo+IC0j
IHB5dGhvbi1idW5jaAo+IC0jCj4gLSMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gLQo+IC1QWVRI
T05fQlVOQ0hfVkVSU0lPTiA9IDEuMC4xCj4gLVBZVEhPTl9CVU5DSF9TT1VSQ0UgPSBidW5jaC0k
KFBZVEhPTl9CVU5DSF9WRVJTSU9OKS50YXIuZ3oKPiAtUFlUSE9OX0JVTkNIX1NJVEUgPSBodHRw
czovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvZWYvYmYvYTRjZjE3NzlhNGZmYjRm
NjEwOTAzZmEwOGUxNWQxZjRhOGEyZjRlMzM1M2EwMmFmYmUwOTdjNWJmNGE4Cj4gLVBZVEhPTl9C
VU5DSF9TRVRVUF9UWVBFID0gc2V0dXB0b29scwo+IC1QWVRIT05fQlVOQ0hfTElDRU5TRSA9IE1J
VAo+IC1QWVRIT05fQlVOQ0hfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UudHh0Cj4gLQo+IC0kKGV2
YWwgJChweXRob24tcGFja2FnZSkpCj4gLS0KPiAyLjM0LjEKPgo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+
IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
