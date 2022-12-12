Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 387D2C4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 15:31:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B952D81342;
	Mon, 12 Dec 2022 15:30:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B952D81342
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ImkpljRBQroU; Mon, 12 Dec 2022 15:30:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAE2C817AA;
	Mon, 12 Dec 2022 15:30:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAE2C817AA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AD83A1BF2B4
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 15:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7DA8E4054B
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 15:30:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DA8E4054B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RLkzbwTB7uO2 for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 15:30:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70A0B40256
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 70A0B40256
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 15:30:52 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1445ca00781so8794579fac.1
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 07:30:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zUcHqRTexIOta1cy4I6UhDbQi98kQFaKFXDBl5QZMXU=;
 b=Z5QW198uL16EZcFIo7z+9WWORyZMzWkvSw3VIrDv0QID3OR8vD5idWLcXYjFQfn/Ds
 RoYD+7tZnDu7QT/zPk3kHTsORK4YXZoAQuozHRmLYjB+d4sfKETkIOqsISOJWAOaIqlR
 eAjLLF2zylAfPwhh3tX62WQG91qGe/f5ZrZb8/dYCuNm1e8/P67m2GlQOngwngc+hu2c
 FFuCQ7CekvlbaebWNXzxI5tucnPWTycoNRtRPGauj37Be2tNFpK0iKD0meMrKPQFtVmk
 WmGrfd/x5JfFMvTjN2Y/2zceo8jGyzIpBguUe+2XaCPx+Nm6CYPxy/4bTvNga+FeB/3P
 1oEw==
X-Gm-Message-State: ANoB5pmHlaPdyk9m7Ke6FjIMXQVL5JLxchwsrspWDvFbIc2nGk+MV9v3
 9QEZoHLBCHhmhjMvRUi71cci6wYM09z7rusXYskpeqwD8dw=
X-Google-Smtp-Source: AA0mqf6rD+3d3VcH4JSNkqHS+kXUhtuy6oofPk0Xi1QclWxqDSztuoPU6OS8gfZbN8TbkqpHOyVU99OGE6oNL++kBS0=
X-Received: by 2002:a05:6871:4190:b0:144:bbfc:ba96 with SMTP id
 lc16-20020a056871419000b00144bbfcba96mr7816443oab.18.1670859051384; Mon, 12
 Dec 2022 07:30:51 -0800 (PST)
MIME-Version: 1.0
References: <20221211225515.588291-1-james.hilliard1@gmail.com>
 <CAGm1_ks6hAJ6oWd0L7n7W=Eyob3i38PXWvVcHmyamnX-CBq88Q@mail.gmail.com>
 <CADvTj4rj2ssotkyuWLL+g1Voqa2=5ayVYdKPny6z_i075Sh6gA@mail.gmail.com>
 <CAGm1_kuL7OH2u-XePWEyR+CmSN6cNg7aeyfQaXHPJCkhBa9D+g@mail.gmail.com>
 <CADvTj4q0UCT1oWvHcwiP+rtkMZfYSrXFcwyvfWWT6uAqvcc8PA@mail.gmail.com>
 <CAGm1_kudOgxkXFTEVeEBiV+wygmy74rMwZLUz0oopUnwO3Kj5g@mail.gmail.com>
In-Reply-To: <CAGm1_kudOgxkXFTEVeEBiV+wygmy74rMwZLUz0oopUnwO3Kj5g@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 12 Dec 2022 11:30:40 -0400
Message-ID: <CADvTj4pCxwiEoQe4XOrsO8Gz+pWLDkoWzDDp3ghYU_iSg_UUWw@mail.gmail.com>
To: Yegor Yefremov <yegorslists@googlemail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zUcHqRTexIOta1cy4I6UhDbQi98kQFaKFXDBl5QZMXU=;
 b=Rs25Z4XKV6O/uwraMZ0tFCADmc6lavWBzHUnqh0VfB5iufnKKExrlTiJP7mNXWoRyX
 6OEAKANiTIGAw+IsMt+RQORm6PmdMz9eNc/oWAYjnfwUfuwx8Qfwp3+tc/Ywfm4hD897
 9WPb+6JkpfgTGoLVpR5fEFSsNxpDl+o8u6xDL2SK5sIWzBcxjP4UolPwfcpTqySe2B/1
 puoWPx53Xn5B4qXer6Plb5EuYFjBQpafz9blD1+BEXmhLv8czNPhQWEkMwImQWYk9Hmf
 UbmzYtbtBxkppleTrOnuVQ30AoAX+94UCqVXe0vdtYhtxH3seoKVhGvlsYmBwrMgFuaJ
 KpCQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Rs25Z4XK
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBEZWMgMTIsIDIwMjIgYXQgMTE6MjYgQU0gWWVnb3IgWWVmcmVtb3YKPHllZ29yc2xp
c3RzQGdvb2dsZW1haWwuY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgRGVjIDEyLCAyMDIyIGF0IDM6
MzQgUE0gSmFtZXMgSGlsbGlhcmQKPiA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4gd3JvdGU6
Cj4gPgo+ID4gT24gTW9uLCBEZWMgMTIsIDIwMjIgYXQgMzoyNiBBTSBZZWdvciBZZWZyZW1vdgo+
ID4gPHllZ29yc2xpc3RzQGdvb2dsZW1haWwuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gTW9u
LCBEZWMgMTIsIDIwMjIgYXQgNTo0NiBBTSBKYW1lcyBIaWxsaWFyZAo+ID4gPiA8amFtZXMuaGls
bGlhcmQxQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBPbiBNb24sIERlYyAxMiwg
MjAyMiBhdCAxMjoxMSBBTSBZZWdvciBZZWZyZW1vdgo+ID4gPiA+IDx5ZWdvcnNsaXN0c0Bnb29n
bGVtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gSGkgSmFtZXMsIGFsbCwKPiA+
ID4gPiA+Cj4gPiA+ID4gPiBPbiBTdW4sIERlYyAxMSwgMjAyMiBhdCAxMTo1NiBQTSBKYW1lcyBI
aWxsaWFyZAo+ID4gPiA+ID4gPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgo+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPiBTaW5jZSB0aGUgcHl0aG9uMyBidW1wIHRvIHZlcnNpb24gMy4x
MSBpbiBjb21taXQKPiA+ID4gPiA+ID4gNzM4NTAwYzI5NmM4YjEyMDZmMjBlOTRjYTNlN2M1OTMy
YTZhMDQ4NiBweXRob24tYnVuY2ggaGFzIGZhaWxlZAo+ID4gPiA+ID4gPiB0byBidWlsZC4KPiA+
ID4gPiA+ID4KPiA+ID4gPiA+ID4gVGhpcyBpcyBkdWUgdG8gb3BlbigpIHdoaWNoIG5vIGxvbmdl
ciBhY2NlcHRzICdVJyAo4oCcdW5pdmVyc2FsCj4gPiA+ID4gPiA+IG5ld2xpbmXigJ0pIGluIHRo
ZSBmaWxlIG1vZGUuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFJlbW92ZSB0aGlzIHBhY2thZ2Ug
YXMgaXQgaGFzIG5vdCBoYWQgYSByZWxlYXNlIHNpbmNlIDIwMTEgYW5kCj4gPiA+ID4gPiA+IGlz
IHVubWFpbnRhaW5lZCB1cHN0cmVhbS4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gRGV0YWlsczoK
PiA+ID4gPiA+ID4gaHR0cHM6Ly9kb2NzLnB5dGhvbi5vcmcvMy4xMS93aGF0c25ldy8zLjExLmh0
bWwjcG9ydGluZy10by1weXRob24tMy0xMQo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBGaXhlczoK
PiA+ID4gPiA+ID4gIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvMmJh
LzJiYTcyZmM5ODM3NjA1YTM2ZWE2M2JiZDNlNmUxODFhNDBjZGYzNjAKPiA+ID4gPiA+ID4KPiA+
ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBn
bWFpbC5jb20+Cj4gPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gPiAgQ29uZmlnLmluLmxlZ2FjeSAg
ICAgICAgICAgICAgICAgICAgICAgfCAgNiArKysrKysKPiA+ID4gPiA+ID4gIERFVkVMT1BFUlMg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgLQo+ID4gPiA+ID4gPiAgcGFja2FnZS9D
b25maWcuaW4gICAgICAgICAgICAgICAgICAgICAgfCAgMSAtCj4gPiA+ID4gPiA+ICBwYWNrYWdl
L3B5dGhvbi1idW5jaC9Db25maWcuaW4gICAgICAgICB8ICA2IC0tLS0tLQo+ID4gPiA+ID4gPiAg
cGFja2FnZS9weXRob24tYnVuY2gvcHl0aG9uLWJ1bmNoLmhhc2ggfCAgNSAtLS0tLQo+ID4gPiA+
ID4gPiAgcGFja2FnZS9weXRob24tYnVuY2gvcHl0aG9uLWJ1bmNoLm1rICAgfCAxNCAtLS0tLS0t
LS0tLS0tLQo+ID4gPiA+ID4gPiAgNiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDI3
IGRlbGV0aW9ucygtKQo+ID4gPiA+ID4gPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcHl0
aG9uLWJ1bmNoL0NvbmZpZy5pbgo+ID4gPiA+ID4gPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IHBhY2th
Z2UvcHl0aG9uLWJ1bmNoL3B5dGhvbi1idW5jaC5oYXNoCj4gPiA+ID4gPiA+ICBkZWxldGUgbW9k
ZSAxMDA2NDQgcGFja2FnZS9weXRob24tYnVuY2gvcHl0aG9uLWJ1bmNoLm1rCj4gPiA+ID4gPiA+
Cj4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9Db25maWcuaW4ubGVnYWN5IGIvQ29uZmlnLmluLmxl
Z2FjeQo+ID4gPiA+ID4gPiBpbmRleCAyOGM2ODIyNjg5Li41YzFlMTYyZjU2IDEwMDY0NAo+ID4g
PiA+ID4gPiAtLS0gYS9Db25maWcuaW4ubGVnYWN5Cj4gPiA+ID4gPiA+ICsrKyBiL0NvbmZpZy5p
bi5sZWdhY3kKPiA+ID4gPiA+ID4gQEAgLTE0Niw2ICsxNDYsMTIgQEAgZW5kaWYKPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gIGNvbW1lbnQgIkxlZ2FjeSBvcHRpb25zIHJlbW92ZWQgaW4gMjAyMy4w
MiIKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gK2NvbmZpZyBCUjJfUEFDS0FHRV9QWVRIT05fQlVO
Q0gKPiA+ID4gPiA+ID4gKyAgICAgICBib29sICJweXRob24tYnVuY2ggcmVtb3ZlZCIKPiA+ID4g
PiA+ID4gKyAgICAgICBzZWxlY3QgQlIyX0xFR0FDWQo+ID4gPiA+ID4KPiA+ID4gPiA+IFNob3Vs
ZCB3ZSBhZGQgInNlbGVjdCBCUjJfUFlUSE9OX01VTkNIIj8KPiA+ID4gPiA+Cj4gPiA+ID4gPiBU
aGlzIHBhY2thZ2UgaXMgYSBtYWludGFpbmVkIGZvcms6IGh0dHBzOi8vZ2l0aHViLmNvbS9JbmZp
bmlkYXQvbXVuY2gKPiA+ID4gPgo+ID4gPiA+IFdlbGwgdGhlIGltcG9ydCBuYW1lc3BhY2UgaXMg
ZGlmZmVyZW50IHNvIGl0IHByb2JhYmx5IGRvZXNuJ3QgbWFrZSBzZW5zZQo+ID4gPiA+IHRvIGhh
dmUgaXQgYXMgYSBkcm9wIGluIHJlcGxhY2VtZW50Lgo+ID4gPgo+ID4gPiBPSy4gQnV0IHNob3Vs
ZCBpdCBiZSBhdCBsZWFzdCBtZW50aW9uZWQgaW4gdGhlIGhlbHAgdGV4dD8KPiA+Cj4gPiBXZWxs
IHdlIGRvbid0IGhhdmUgbXVuY2ggcGFja2FnZWQgcmlnaHQgbm93IHNvIG5vdCBzdXJlLgo+Cj4g
RG8geW91IG1lYW4gdGhpcyBvbmUKPiBodHRwczovL2dpdC5idXN5Ym94Lm5ldC9idWlsZHJvb3Qv
dHJlZS9wYWNrYWdlL3B5dGhvbi1tdW5jaD8KCk9oLCBuZXZlcm1pbmQsIEkgbXVzdCBoYXZlIHNl
YXJjaGVkIGZvciBpdCB3cm9uZy4KCj4KPiA+ID4KPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+
IFJlZ2FyZHMsCj4gPiA+ID4gPiBZZWdvcgo+ID4gPiA+ID4KPiA+ID4gPiA+ID4gKyAgICAgICBo
ZWxwCj4gPiA+ID4gPiA+ICsgICAgICAgICBUaGUgcHl0aG9uLWJ1bmNoIHBhY2thZ2UgaXMgdW5t
YWludGFpbmVkLgo+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ICBjb25maWcgQlIyX1BBQ0tBR0Vf
UFlUSE9OX00yUgo+ID4gPiA+ID4gPiAgICAgICAgIGJvb2wgInB5dGhvbi1tMnIgcmVtb3ZlZCIK
PiA+ID4gPiA+ID4gICAgICAgICBzZWxlY3QgQlIyX0xFR0FDWQo+ID4gPiA+ID4gPiBkaWZmIC0t
Z2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKPiA+ID4gPiA+ID4gaW5kZXggZjBkY2M0MmRl
Ny4uMGMzNzczNjk1YSAxMDA2NDQKPiA+ID4gPiA+ID4gLS0tIGEvREVWRUxPUEVSUwo+ID4gPiA+
ID4gPiArKysgYi9ERVZFTE9QRVJTCj4gPiA+ID4gPiA+IEBAIC0yMDE3LDcgKzIwMTcsNiBAQCBG
OiAgICAgICAgcGFja2FnZS9wb2xpY3ljb3JldXRpbHMvCj4gPiA+ID4gPiA+ICBGOiAgICAgcGFj
a2FnZS9wcm9mdHBkLwo+ID4gPiA+ID4gPiAgRjogICAgIHBhY2thZ2UvcHJvdG9idWYtYy8KPiA+
ID4gPiA+ID4gIEY6ICAgICBwYWNrYWdlL3Byb3RvYnVmLwo+ID4gPiA+ID4gPiAtRjogICAgIHBh
Y2thZ2UvcHl0aG9uLWJ1bmNoLwo+ID4gPiA+ID4gPiAgRjogICAgIHBhY2thZ2UvcHl0aG9uLWNv
bG9yYW1hLwo+ID4gPiA+ID4gPiAgRjogICAgIHBhY2thZ2UvcHl0aG9uLWZpbGVsb2NrLwo+ID4g
PiA+ID4gPiAgRjogICAgIHBhY2thZ2UvcHl0aG9uLWZsYXNrLWNvcnMvCj4gPiA+ID4gPiA+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL0NvbmZpZy5pbiBiL3BhY2thZ2UvQ29uZmlnLmluCj4gPiA+ID4g
PiA+IGluZGV4IDkxNGMzNTg0ZTkuLjdmMGMzNDUxOWEgMTAwNjQ0Cj4gPiA+ID4gPiA+IC0tLSBh
L3BhY2thZ2UvQ29uZmlnLmluCj4gPiA+ID4gPiA+ICsrKyBiL3BhY2thZ2UvQ29uZmlnLmluCj4g
PiA+ID4gPiA+IEBAIC05NzksNyArOTc5LDYgQEAgbWVudSAiRXh0ZXJuYWwgcHl0aG9uIG1vZHVs
ZXMiCj4gPiA+ID4gPiA+ICAgICAgICAgc291cmNlICJwYWNrYWdlL3B5dGhvbi1ib3R0bGUvQ29u
ZmlnLmluIgo+ID4gPiA+ID4gPiAgICAgICAgIHNvdXJjZSAicGFja2FnZS9weXRob24tYnJvdGxp
L0NvbmZpZy5pbiIKPiA+ID4gPiA+ID4gICAgICAgICBzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWJz
ZGlmZjQvQ29uZmlnLmluIgo+ID4gPiA+ID4gPiAtICAgICAgIHNvdXJjZSAicGFja2FnZS9weXRo
b24tYnVuY2gvQ29uZmlnLmluIgo+ID4gPiA+ID4gPiAgICAgICAgIHNvdXJjZSAicGFja2FnZS9w
eXRob24tY2FjaGVkLXByb3BlcnR5L0NvbmZpZy5pbiIKPiA+ID4gPiA+ID4gICAgICAgICBzb3Vy
Y2UgInBhY2thZ2UvcHl0aG9uLWNhbi9Db25maWcuaW4iCj4gPiA+ID4gPiA+ICAgICAgICAgc291
cmNlICJwYWNrYWdlL3B5dGhvbi1jYW5vcGVuL0NvbmZpZy5pbiIKPiA+ID4gPiA+ID4gZGlmZiAt
LWdpdCBhL3BhY2thZ2UvcHl0aG9uLWJ1bmNoL0NvbmZpZy5pbiBiL3BhY2thZ2UvcHl0aG9uLWJ1
bmNoL0NvbmZpZy5pbgo+ID4gPiA+ID4gPiBkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKPiA+ID4g
PiA+ID4gaW5kZXggODllYWU3NDJiOC4uMDAwMDAwMDAwMAo+ID4gPiA+ID4gPiAtLS0gYS9wYWNr
YWdlL3B5dGhvbi1idW5jaC9Db25maWcuaW4KPiA+ID4gPiA+ID4gKysrIC9kZXYvbnVsbAo+ID4g
PiA+ID4gPiBAQCAtMSw2ICswLDAgQEAKPiA+ID4gPiA+ID4gLWNvbmZpZyBCUjJfUEFDS0FHRV9Q
WVRIT05fQlVOQ0gKPiA+ID4gPiA+ID4gLSAgICAgICBib29sICJweXRob24tYnVuY2giCj4gPiA+
ID4gPiA+IC0gICAgICAgaGVscAo+ID4gPiA+ID4gPiAtICAgICAgICAgQSBkb3QtYWNjZXNzaWJs
ZSBkaWN0aW9uYXJ5IChhIGxhIEphdmFTY3JpcHQgb2JqZWN0cykuCj4gPiA+ID4gPiA+IC0KPiA+
ID4gPiA+ID4gLSAgICAgICAgIGh0dHA6Ly9naXRodWIuY29tL2RzYy9idW5jaAo+ID4gPiA+ID4g
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tYnVuY2gvcHl0aG9uLWJ1bmNoLmhhc2ggYi9w
YWNrYWdlL3B5dGhvbi1idW5jaC9weXRob24tYnVuY2guaGFzaAo+ID4gPiA+ID4gPiBkZWxldGVk
IGZpbGUgbW9kZSAxMDA2NDQKPiA+ID4gPiA+ID4gaW5kZXggY2ZkZTJkYjYwMy4uMDAwMDAwMDAw
MAo+ID4gPiA+ID4gPiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1idW5jaC9weXRob24tYnVuY2guaGFz
aAo+ID4gPiA+ID4gPiArKysgL2Rldi9udWxsCj4gPiA+ID4gPiA+IEBAIC0xLDUgKzAsMCBAQAo+
ID4gPiA+ID4gPiAtIyBtZDUsIHNoYTI1NiBmcm9tIGh0dHBzOi8vcHlwaS5vcmcvcHlwaS9idW5j
aC9qc29uCj4gPiA+ID4gPiA+IC1tZDUgIDBhODI5ZDY0ZTk1ZWQ5NmRlZmJjYWUyYmY5MDYxYmIw
ICBidW5jaC0xLjAuMS50YXIuZ3oKPiA+ID4gPiA+ID4gLXNoYTI1NiAgNTBjNzdhMGZjMGNiMzcy
ZGZlNDhiNWUxMTkzN2Q1ZjcwZTc0M2FkYmY0MjY4M2YzYTZkMjg1NzY0NWE3NmFhYSAgYnVuY2gt
MS4wLjEudGFyLmd6Cj4gPiA+ID4gPiA+IC0jIExvY2FsbHkgY29tcHV0ZWQgc2hhMjU2IGNoZWNr
c3Vtcwo+ID4gPiA+ID4gPiAtc2hhMjU2ICA1N2NhOTVjOTIwNTljODM4MDYyNTE5MjQ2Mjk3OWJk
MzI5OTRhYWUzZmNkZjkwMmZmNmViMWU0NjdlZWIwNDY5ICBMSUNFTlNFLnR4dAo+ID4gPiA+ID4g
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tYnVuY2gvcHl0aG9uLWJ1bmNoLm1rIGIvcGFj
a2FnZS9weXRob24tYnVuY2gvcHl0aG9uLWJ1bmNoLm1rCj4gPiA+ID4gPiA+IGRlbGV0ZWQgZmls
ZSBtb2RlIDEwMDY0NAo+ID4gPiA+ID4gPiBpbmRleCAxOGZkYzIyM2JiLi4wMDAwMDAwMDAwCj4g
PiA+ID4gPiA+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLWJ1bmNoL3B5dGhvbi1idW5jaC5tawo+ID4g
PiA+ID4gPiArKysgL2Rldi9udWxsCj4gPiA+ID4gPiA+IEBAIC0xLDE0ICswLDAgQEAKPiA+ID4g
PiA+ID4gLSMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gPiA+ID4gPiA+IC0jCj4gPiA+ID4gPiA+
IC0jIHB5dGhvbi1idW5jaAo+ID4gPiA+ID4gPiAtIwo+ID4gPiA+ID4gPiAtIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMKPiA+ID4gPiA+ID4gLQo+ID4gPiA+ID4gPiAtUFlUSE9OX0JVTkNIX1ZFUlNJ
T04gPSAxLjAuMQo+ID4gPiA+ID4gPiAtUFlUSE9OX0JVTkNIX1NPVVJDRSA9IGJ1bmNoLSQoUFlU
SE9OX0JVTkNIX1ZFUlNJT04pLnRhci5nego+ID4gPiA+ID4gPiAtUFlUSE9OX0JVTkNIX1NJVEUg
PSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvZWYvYmYvYTRjZjE3Nzlh
NGZmYjRmNjEwOTAzZmEwOGUxNWQxZjRhOGEyZjRlMzM1M2EwMmFmYmUwOTdjNWJmNGE4Cj4gPiA+
ID4gPiA+IC1QWVRIT05fQlVOQ0hfU0VUVVBfVFlQRSA9IHNldHVwdG9vbHMKPiA+ID4gPiA+ID4g
LVBZVEhPTl9CVU5DSF9MSUNFTlNFID0gTUlUCj4gPiA+ID4gPiA+IC1QWVRIT05fQlVOQ0hfTElD
RU5TRV9GSUxFUyA9IExJQ0VOU0UudHh0Cj4gPiA+ID4gPiA+IC0KPiA+ID4gPiA+ID4gLSQoZXZh
bCAkKHB5dGhvbi1wYWNrYWdlKSkKPiA+ID4gPiA+ID4gLS0KPiA+ID4gPiA+ID4gMi4zNC4xCj4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gPiA+ID4gPiA+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiA+ID4gPiA+
ID4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiA+ID4gPiA+ID4gaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
