Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F78BC4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 07:26:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0CA5F40588;
	Mon, 12 Dec 2022 07:26:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CA5F40588
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P8nJkCgpcNqu; Mon, 12 Dec 2022 07:26:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F261401AD;
	Mon, 12 Dec 2022 07:26:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F261401AD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5F0341BF288
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 07:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 469BE60A8D
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 07:26:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 469BE60A8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VLWGpeCLmxAg for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 07:26:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 098526080A
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 098526080A
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 07:26:13 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id d128so12559761ybf.10
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 23:26:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ma9H5vx/RFsWL4sab18HAshFcFVv9FdGiKb3kVLVQsE=;
 b=iE90qCyO568/uZqZNWeeqb9UVw2AOXnG2Lj7FYUITjABVTPkrWrBcnjQP6FQgxcPoK
 6r5SrM7pVgfdG/4tjvOxVVt6/qT9w3vTX1sQAY8nAr2/z+DolMSLPEGs+IWwqLR65OsE
 FgRex1Uj9zGQqyLiZh66GXIhF/99RAo7/Oxo8o95ojsVJssBSYuW1bZYvkkBB5UNG0pz
 RLqTnIRW6iuZ4mF3Djk0eh89u8x83UY6OJ1+8Xr0mEbMu7NBefGVBg0Ix2N0tRHnHBse
 ghc1j4+x9SI0hR3c7H8INXuigoGWHv4HiyaJWTtzTTUUWpuhSJbkf//GuTLnPYMY66QH
 s0nw==
X-Gm-Message-State: ANoB5pmVSbLc3PCLlQ01E8YKqsql4El1e/k0yeyrV4lo7ewbIludJB+H
 JJPGFKQVZGTkPSWh9uQFpXL7WTUNQNgQZ3sd+Z3244Jm
X-Google-Smtp-Source: AA0mqf7lLLIsKzOfQj1uC0/u+x1K3Dbtcxpt+qKn9xvDi69y/JJ6iu0QaDVVSWiw6BTv4ns4agBvHcwyPFPaSeZCREQ=
X-Received: by 2002:a25:2491:0:b0:6f9:7bf9:7511 with SMTP id
 k139-20020a252491000000b006f97bf97511mr37534584ybk.10.1670829972760; Sun, 11
 Dec 2022 23:26:12 -0800 (PST)
MIME-Version: 1.0
References: <20221211225515.588291-1-james.hilliard1@gmail.com>
 <CAGm1_ks6hAJ6oWd0L7n7W=Eyob3i38PXWvVcHmyamnX-CBq88Q@mail.gmail.com>
 <CADvTj4rj2ssotkyuWLL+g1Voqa2=5ayVYdKPny6z_i075Sh6gA@mail.gmail.com>
In-Reply-To: <CADvTj4rj2ssotkyuWLL+g1Voqa2=5ayVYdKPny6z_i075Sh6gA@mail.gmail.com>
Date: Mon, 12 Dec 2022 08:26:01 +0100
Message-ID: <CAGm1_kuL7OH2u-XePWEyR+CmSN6cNg7aeyfQaXHPJCkhBa9D+g@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ma9H5vx/RFsWL4sab18HAshFcFVv9FdGiKb3kVLVQsE=;
 b=FvYrsPBdx/16UC1h4Gew1pN+7YhiNaObkxuDN9EwbNLcMzPNZmd7JJWoy3eI4pCUCa
 oy9uYmmUf4u8AwurlJ8zNpTI02xDMm6f03Fpdiz3wD83oUT1fvMB7uefEkTPhm5nltlu
 0fxZFkq2SA2GbG9EPrA5fg8kZRL9ydXhPIuLfGbssv8WLxWqU4/3YzfaOxHeG0Lk/naH
 vOPFPBwf1Di8aStgE6k9VpRUrm7WV4MLl5v7rxA2SFwxTGJ8OEG2nPeL5lEL+ZoKQp5k
 1cm6j9PuxdCsextBZqCOINn+m2RpS4tiMCjcbhQVjCuvaYlGUwfXzgWTJSBz9bKwQ+EV
 0DWw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FvYrsPBd
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

T24gTW9uLCBEZWMgMTIsIDIwMjIgYXQgNTo0NiBBTSBKYW1lcyBIaWxsaWFyZAo8amFtZXMuaGls
bGlhcmQxQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIERlYyAxMiwgMjAyMiBhdCAxMjox
MSBBTSBZZWdvciBZZWZyZW1vdgo+IDx5ZWdvcnNsaXN0c0Bnb29nbGVtYWlsLmNvbT4gd3JvdGU6
Cj4gPgo+ID4gSGkgSmFtZXMsIGFsbCwKPiA+Cj4gPiBPbiBTdW4sIERlYyAxMSwgMjAyMiBhdCAx
MTo1NiBQTSBKYW1lcyBIaWxsaWFyZAo+ID4gPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+IHdy
b3RlOgo+ID4gPgo+ID4gPiBTaW5jZSB0aGUgcHl0aG9uMyBidW1wIHRvIHZlcnNpb24gMy4xMSBp
biBjb21taXQKPiA+ID4gNzM4NTAwYzI5NmM4YjEyMDZmMjBlOTRjYTNlN2M1OTMyYTZhMDQ4NiBw
eXRob24tYnVuY2ggaGFzIGZhaWxlZAo+ID4gPiB0byBidWlsZC4KPiA+ID4KPiA+ID4gVGhpcyBp
cyBkdWUgdG8gb3BlbigpIHdoaWNoIG5vIGxvbmdlciBhY2NlcHRzICdVJyAo4oCcdW5pdmVyc2Fs
Cj4gPiA+IG5ld2xpbmXigJ0pIGluIHRoZSBmaWxlIG1vZGUuCj4gPiA+Cj4gPiA+IFJlbW92ZSB0
aGlzIHBhY2thZ2UgYXMgaXQgaGFzIG5vdCBoYWQgYSByZWxlYXNlIHNpbmNlIDIwMTEgYW5kCj4g
PiA+IGlzIHVubWFpbnRhaW5lZCB1cHN0cmVhbS4KPiA+ID4KPiA+ID4gRGV0YWlsczoKPiA+ID4g
aHR0cHM6Ly9kb2NzLnB5dGhvbi5vcmcvMy4xMS93aGF0c25ldy8zLjExLmh0bWwjcG9ydGluZy10
by1weXRob24tMy0xMQo+ID4gPgo+ID4gPiBGaXhlczoKPiA+ID4gIC0gaHR0cDovL2F1dG9idWls
ZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvMmJhLzJiYTcyZmM5ODM3NjA1YTM2ZWE2M2JiZDNlNmUx
ODFhNDBjZGYzNjAKPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlhcmQgPGph
bWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgQ29uZmlnLmluLmxlZ2Fj
eSAgICAgICAgICAgICAgICAgICAgICAgfCAgNiArKysrKysKPiA+ID4gIERFVkVMT1BFUlMgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgLQo+ID4gPiAgcGFja2FnZS9Db25maWcuaW4g
ICAgICAgICAgICAgICAgICAgICAgfCAgMSAtCj4gPiA+ICBwYWNrYWdlL3B5dGhvbi1idW5jaC9D
b25maWcuaW4gICAgICAgICB8ICA2IC0tLS0tLQo+ID4gPiAgcGFja2FnZS9weXRob24tYnVuY2gv
cHl0aG9uLWJ1bmNoLmhhc2ggfCAgNSAtLS0tLQo+ID4gPiAgcGFja2FnZS9weXRob24tYnVuY2gv
cHl0aG9uLWJ1bmNoLm1rICAgfCAxNCAtLS0tLS0tLS0tLS0tLQo+ID4gPiAgNiBmaWxlcyBjaGFu
Z2VkLCA2IGluc2VydGlvbnMoKyksIDI3IGRlbGV0aW9ucygtKQo+ID4gPiAgZGVsZXRlIG1vZGUg
MTAwNjQ0IHBhY2thZ2UvcHl0aG9uLWJ1bmNoL0NvbmZpZy5pbgo+ID4gPiAgZGVsZXRlIG1vZGUg
MTAwNjQ0IHBhY2thZ2UvcHl0aG9uLWJ1bmNoL3B5dGhvbi1idW5jaC5oYXNoCj4gPiA+ICBkZWxl
dGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24tYnVuY2gvcHl0aG9uLWJ1bmNoLm1rCj4gPiA+
Cj4gPiA+IGRpZmYgLS1naXQgYS9Db25maWcuaW4ubGVnYWN5IGIvQ29uZmlnLmluLmxlZ2FjeQo+
ID4gPiBpbmRleCAyOGM2ODIyNjg5Li41YzFlMTYyZjU2IDEwMDY0NAo+ID4gPiAtLS0gYS9Db25m
aWcuaW4ubGVnYWN5Cj4gPiA+ICsrKyBiL0NvbmZpZy5pbi5sZWdhY3kKPiA+ID4gQEAgLTE0Niw2
ICsxNDYsMTIgQEAgZW5kaWYKPiA+ID4KPiA+ID4gIGNvbW1lbnQgIkxlZ2FjeSBvcHRpb25zIHJl
bW92ZWQgaW4gMjAyMy4wMiIKPiA+ID4KPiA+ID4gK2NvbmZpZyBCUjJfUEFDS0FHRV9QWVRIT05f
QlVOQ0gKPiA+ID4gKyAgICAgICBib29sICJweXRob24tYnVuY2ggcmVtb3ZlZCIKPiA+ID4gKyAg
ICAgICBzZWxlY3QgQlIyX0xFR0FDWQo+ID4KPiA+IFNob3VsZCB3ZSBhZGQgInNlbGVjdCBCUjJf
UFlUSE9OX01VTkNIIj8KPiA+Cj4gPiBUaGlzIHBhY2thZ2UgaXMgYSBtYWludGFpbmVkIGZvcms6
IGh0dHBzOi8vZ2l0aHViLmNvbS9JbmZpbmlkYXQvbXVuY2gKPgo+IFdlbGwgdGhlIGltcG9ydCBu
YW1lc3BhY2UgaXMgZGlmZmVyZW50IHNvIGl0IHByb2JhYmx5IGRvZXNuJ3QgbWFrZSBzZW5zZQo+
IHRvIGhhdmUgaXQgYXMgYSBkcm9wIGluIHJlcGxhY2VtZW50LgoKT0suIEJ1dCBzaG91bGQgaXQg
YmUgYXQgbGVhc3QgbWVudGlvbmVkIGluIHRoZSBoZWxwIHRleHQ/Cgo+Cj4gPgo+ID4gUmVnYXJk
cywKPiA+IFllZ29yCj4gPgo+ID4gPiArICAgICAgIGhlbHAKPiA+ID4gKyAgICAgICAgIFRoZSBw
eXRob24tYnVuY2ggcGFja2FnZSBpcyB1bm1haW50YWluZWQuCj4gPiA+ICsKPiA+ID4gIGNvbmZp
ZyBCUjJfUEFDS0FHRV9QWVRIT05fTTJSCj4gPiA+ICAgICAgICAgYm9vbCAicHl0aG9uLW0yciBy
ZW1vdmVkIgo+ID4gPiAgICAgICAgIHNlbGVjdCBCUjJfTEVHQUNZCj4gPiA+IGRpZmYgLS1naXQg
YS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwo+ID4gPiBpbmRleCBmMGRjYzQyZGU3Li4wYzM3NzM2
OTVhIDEwMDY0NAo+ID4gPiAtLS0gYS9ERVZFTE9QRVJTCj4gPiA+ICsrKyBiL0RFVkVMT1BFUlMK
PiA+ID4gQEAgLTIwMTcsNyArMjAxNyw2IEBAIEY6ICAgICAgICBwYWNrYWdlL3BvbGljeWNvcmV1
dGlscy8KPiA+ID4gIEY6ICAgICBwYWNrYWdlL3Byb2Z0cGQvCj4gPiA+ICBGOiAgICAgcGFja2Fn
ZS9wcm90b2J1Zi1jLwo+ID4gPiAgRjogICAgIHBhY2thZ2UvcHJvdG9idWYvCj4gPiA+IC1GOiAg
ICAgcGFja2FnZS9weXRob24tYnVuY2gvCj4gPiA+ICBGOiAgICAgcGFja2FnZS9weXRob24tY29s
b3JhbWEvCj4gPiA+ICBGOiAgICAgcGFja2FnZS9weXRob24tZmlsZWxvY2svCj4gPiA+ICBGOiAg
ICAgcGFja2FnZS9weXRob24tZmxhc2stY29ycy8KPiA+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
Q29uZmlnLmluIGIvcGFja2FnZS9Db25maWcuaW4KPiA+ID4gaW5kZXggOTE0YzM1ODRlOS4uN2Yw
YzM0NTE5YSAxMDA2NDQKPiA+ID4gLS0tIGEvcGFja2FnZS9Db25maWcuaW4KPiA+ID4gKysrIGIv
cGFja2FnZS9Db25maWcuaW4KPiA+ID4gQEAgLTk3OSw3ICs5NzksNiBAQCBtZW51ICJFeHRlcm5h
bCBweXRob24gbW9kdWxlcyIKPiA+ID4gICAgICAgICBzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWJv
dHRsZS9Db25maWcuaW4iCj4gPiA+ICAgICAgICAgc291cmNlICJwYWNrYWdlL3B5dGhvbi1icm90
bGkvQ29uZmlnLmluIgo+ID4gPiAgICAgICAgIHNvdXJjZSAicGFja2FnZS9weXRob24tYnNkaWZm
NC9Db25maWcuaW4iCj4gPiA+IC0gICAgICAgc291cmNlICJwYWNrYWdlL3B5dGhvbi1idW5jaC9D
b25maWcuaW4iCj4gPiA+ICAgICAgICAgc291cmNlICJwYWNrYWdlL3B5dGhvbi1jYWNoZWQtcHJv
cGVydHkvQ29uZmlnLmluIgo+ID4gPiAgICAgICAgIHNvdXJjZSAicGFja2FnZS9weXRob24tY2Fu
L0NvbmZpZy5pbiIKPiA+ID4gICAgICAgICBzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWNhbm9wZW4v
Q29uZmlnLmluIgo+ID4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tYnVuY2gvQ29uZmln
LmluIGIvcGFja2FnZS9weXRob24tYnVuY2gvQ29uZmlnLmluCj4gPiA+IGRlbGV0ZWQgZmlsZSBt
b2RlIDEwMDY0NAo+ID4gPiBpbmRleCA4OWVhZTc0MmI4Li4wMDAwMDAwMDAwCj4gPiA+IC0tLSBh
L3BhY2thZ2UvcHl0aG9uLWJ1bmNoL0NvbmZpZy5pbgo+ID4gPiArKysgL2Rldi9udWxsCj4gPiA+
IEBAIC0xLDYgKzAsMCBAQAo+ID4gPiAtY29uZmlnIEJSMl9QQUNLQUdFX1BZVEhPTl9CVU5DSAo+
ID4gPiAtICAgICAgIGJvb2wgInB5dGhvbi1idW5jaCIKPiA+ID4gLSAgICAgICBoZWxwCj4gPiA+
IC0gICAgICAgICBBIGRvdC1hY2Nlc3NpYmxlIGRpY3Rpb25hcnkgKGEgbGEgSmF2YVNjcmlwdCBv
YmplY3RzKS4KPiA+ID4gLQo+ID4gPiAtICAgICAgICAgaHR0cDovL2dpdGh1Yi5jb20vZHNjL2J1
bmNoCj4gPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1idW5jaC9weXRob24tYnVuY2gu
aGFzaCBiL3BhY2thZ2UvcHl0aG9uLWJ1bmNoL3B5dGhvbi1idW5jaC5oYXNoCj4gPiA+IGRlbGV0
ZWQgZmlsZSBtb2RlIDEwMDY0NAo+ID4gPiBpbmRleCBjZmRlMmRiNjAzLi4wMDAwMDAwMDAwCj4g
PiA+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLWJ1bmNoL3B5dGhvbi1idW5jaC5oYXNoCj4gPiA+ICsr
KyAvZGV2L251bGwKPiA+ID4gQEAgLTEsNSArMCwwIEBACj4gPiA+IC0jIG1kNSwgc2hhMjU2IGZy
b20gaHR0cHM6Ly9weXBpLm9yZy9weXBpL2J1bmNoL2pzb24KPiA+ID4gLW1kNSAgMGE4MjlkNjRl
OTVlZDk2ZGVmYmNhZTJiZjkwNjFiYjAgIGJ1bmNoLTEuMC4xLnRhci5nego+ID4gPiAtc2hhMjU2
ICA1MGM3N2EwZmMwY2IzNzJkZmU0OGI1ZTExOTM3ZDVmNzBlNzQzYWRiZjQyNjgzZjNhNmQyODU3
NjQ1YTc2YWFhICBidW5jaC0xLjAuMS50YXIuZ3oKPiA+ID4gLSMgTG9jYWxseSBjb21wdXRlZCBz
aGEyNTYgY2hlY2tzdW1zCj4gPiA+IC1zaGEyNTYgIDU3Y2E5NWM5MjA1OWM4MzgwNjI1MTkyNDYy
OTc5YmQzMjk5NGFhZTNmY2RmOTAyZmY2ZWIxZTQ2N2VlYjA0NjkgIExJQ0VOU0UudHh0Cj4gPiA+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1idW5jaC9weXRob24tYnVuY2gubWsgYi9wYWNr
YWdlL3B5dGhvbi1idW5jaC9weXRob24tYnVuY2gubWsKPiA+ID4gZGVsZXRlZCBmaWxlIG1vZGUg
MTAwNjQ0Cj4gPiA+IGluZGV4IDE4ZmRjMjIzYmIuLjAwMDAwMDAwMDAKPiA+ID4gLS0tIGEvcGFj
a2FnZS9weXRob24tYnVuY2gvcHl0aG9uLWJ1bmNoLm1rCj4gPiA+ICsrKyAvZGV2L251bGwKPiA+
ID4gQEAgLTEsMTQgKzAsMCBAQAo+ID4gPiAtIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiA+ID4g
LSMKPiA+ID4gLSMgcHl0aG9uLWJ1bmNoCj4gPiA+IC0jCj4gPiA+IC0jIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIwo+ID4gPiAtCj4gPiA+IC1QWVRIT05fQlVOQ0hfVkVSU0lPTiA9IDEuMC4xCj4gPiA+
IC1QWVRIT05fQlVOQ0hfU09VUkNFID0gYnVuY2gtJChQWVRIT05fQlVOQ0hfVkVSU0lPTikudGFy
Lmd6Cj4gPiA+IC1QWVRIT05fQlVOQ0hfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVk
Lm9yZy9wYWNrYWdlcy9lZi9iZi9hNGNmMTc3OWE0ZmZiNGY2MTA5MDNmYTA4ZTE1ZDFmNGE4YTJm
NGUzMzUzYTAyYWZiZTA5N2M1YmY0YTgKPiA+ID4gLVBZVEhPTl9CVU5DSF9TRVRVUF9UWVBFID0g
c2V0dXB0b29scwo+ID4gPiAtUFlUSE9OX0JVTkNIX0xJQ0VOU0UgPSBNSVQKPiA+ID4gLVBZVEhP
Tl9CVU5DSF9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRS50eHQKPiA+ID4gLQo+ID4gPiAtJChldmFs
ICQocHl0aG9uLXBhY2thZ2UpKQo+ID4gPiAtLQo+ID4gPiAyLjM0LjEKPiA+ID4KPiA+ID4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+ID4gYnVpbGRy
b290IG1haWxpbmcgbGlzdAo+ID4gPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+ID4gPiBodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
