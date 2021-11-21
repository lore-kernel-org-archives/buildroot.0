Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2877C433EF
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 21:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38413401B2;
	Sun, 21 Nov 2021 21:38:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D1xKB-ERznLF; Sun, 21 Nov 2021 21:38:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A66840175;
	Sun, 21 Nov 2021 21:38:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A1C4F1BF3BB
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 21:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9098C607CE
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 21:38:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tWbtVa6oJMMG for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 21:38:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5DCF7607C8
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 21:38:04 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id t26so71116582lfk.9
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 13:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vz9D0yedqmyCncNxea48LjU0Ha9uoQgl4VLIenQf/GU=;
 b=EH6oWcqVs/OvF50AgKfYwWiKBfdowRBbgI1CaAvg467hpeP8y4py0QXwXKiSiTWY05
 sl+WQLteMniUgMN5hWjEVrvrj9tYjBEM8cguKChht0X7mcZ4MJ50EismPaJOvefpAVWe
 LfRmIVYp9IjNu60eKCNynYAqsRCiyofsKHexNUhMTVc4o94T9q47n4Vy9z9SSe4FPaxx
 ecx4m/oso641Ifpg88LQ2viMP90t7YdQ5M55JyAXWTY9qJImgBdp39UzaX7q6vLkk2Gt
 B9YonT/TuIrcH7ooIgNTlYHGhxDPDc0B4Xdtc91CgAb+W9ScapyAXKUvitUGDm/ObO1D
 BZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vz9D0yedqmyCncNxea48LjU0Ha9uoQgl4VLIenQf/GU=;
 b=mDdpbr9p2v3x7SeHJFfRV1tqJh9fRRrscWY7mVJTNqVTM1THFHtsPJrsvjbkY/uL90
 rNkm6cAreCgRbCbhpGH/DrjUYk8QGkBeyMkWEVatbP0B5dgISTVcyOvHP38HaJIY3vZN
 538e31KI0P+m6+SmuwOa+lxsZNf12aBiZBHkdMGyWoqnCiTYfNDg5/rZXW51up8SaCEr
 ItkVYFW6A1TXFQH0ihJdlCKmLzEn9x0eR+pX+tFfymZ1GWo4yW0X6ibgXrodRvY1q1/G
 oNbOFljz5jiJ1bqur5IvBNyF3Baa2t0QG+v8gGUNZvzsKw7UDyV2KJB/dqeEPu1vQYCO
 i1Ag==
X-Gm-Message-State: AOAM530919X8y59tA1jQ61ZQfNr9zaFbQSt7EW+3SSSfLb0uVD+psdHO
 Sk/Nr9gvZw2JIq/usOy2OSoONwhmqkI4aqfXjg8=
X-Google-Smtp-Source: ABdhPJxjKx14CqRofOPN6AZVScEDPuNXmHnH/gUZmdAj9fLcTrEXX75wnl6EaZNl0DwzDPn+1kar8u1hJZ/slkChBiY=
X-Received: by 2002:a05:6512:689:: with SMTP id
 t9mr52294715lfe.614.1637530682112; 
 Sun, 21 Nov 2021 13:38:02 -0800 (PST)
MIME-Version: 1.0
References: <20211121212937.13983-1-ps.report@gmx.net>
In-Reply-To: <20211121212937.13983-1-ps.report@gmx.net>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 21 Nov 2021 22:35:34 +0100
Message-ID: <CAPi7W80poTXrQZMzZTmBw5vq4zUVqduuXsbKZ9vxUXoH1JC=QQ@mail.gmail.com>
To: Peter Seiderer <ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH/next v1] package/lighttpd: switch to meson
 build system
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Matt Weber <matthew.weber@collins.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUGV0ZXIsCgpMZSBkaW0uIDIxIG5vdi4gMjAyMSDDoCAyMjoyOSwgUGV0ZXIgU2VpZGVyZXIg
PHBzLnJlcG9ydEBnbXgubmV0PiBhIMOpY3JpdCA6Cj4KPiBTd2l0Y2ggdG8gbWVzb24gYnVpbGQg
c3lzdGVtIChhbHRlcm5hdGl2ZSBzb2x1dGlvbiB0byBhdXRvcmVjb25mCj4gdG8gZml4IEMgc3Rh
bmRhcmQgZGV0ZWN0aW9uL2NvbXBpbGUgZmxhZ3MsIHNlZSBbMV0pLgo+Cj4gWzFdIGh0dHA6Ly9s
aXN0cy5idXN5Ym94Lm5ldC9waXBlcm1haWwvYnVpbGRyb290LzIwMjEtTm92ZW1iZXIvNjI5MDc1
Lmh0bWwKPgo+IFNpZ25lZC1vZmYtYnk6IFBldGVyIFNlaWRlcmVyIDxwcy5yZXBvcnRAZ214Lm5l
dD4KPiAtLS0KPiAgcGFja2FnZS9saWdodHRwZC9saWdodHRwZC5tayB8IDYyICsrKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNDIgaW5zZXJ0aW9u
cygrKSwgMjAgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWdodHRwZC9s
aWdodHRwZC5tayBiL3BhY2thZ2UvbGlnaHR0cGQvbGlnaHR0cGQubWsKPiBpbmRleCA5YzE4YTYw
MzhlLi5hYmVmYjE3YTlkIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbGlnaHR0cGQvbGlnaHR0cGQu
bWsKPiArKysgYi9wYWNrYWdlL2xpZ2h0dHBkL2xpZ2h0dHBkLm1rCj4gQEAgLTEzLDY0ICsxMyw4
NiBAQCBMSUdIVFRQRF9MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwo+ICBMSUdIVFRQRF9DUEVfSURf
VkVORE9SID0gbGlnaHR0cGQKPiAgTElHSFRUUERfREVQRU5ERU5DSUVTID0gaG9zdC1wa2djb25m
Cj4gIExJR0hUVFBEX0NPTkZfT1BUUyA9IFwKPiAtICAgICAgIC0td2l0aG91dC13b2xmc3NsIFwK
PiAtICAgICAgIC0tbGliZGlyPS91c3IvbGliL2xpZ2h0dHBkIFwKPiAtICAgICAgIC0tbGliZXhl
Y2Rpcj0vdXNyL2xpYgo+ICsgICAgICAgLUR3aXRoX2Jyb3RsaT1mYWxzZSBcCj4gKyAgICAgICAt
RHdpdGhfZGJpPWZhbHNlIFwKPiArICAgICAgIC1Ed2l0aF9mYW09ZmFsc2UgXAo+ICsgICAgICAg
LUR3aXRoX2dkYm09ZmFsc2UgXAo+ICsgICAgICAgLUR3aXRoX2dlb2lwPWZhbHNlIFwKPiArICAg
ICAgIC1Ed2l0aF9nbnV0bHM9ZmFsc2UgXAo+ICsgICAgICAgLUR3aXRoX2tyYjU9ZmFsc2UgXAo+
ICsgICAgICAgLUR3aXRoX2xkYXA9ZmFsc2UgXAo+ICsgICAgICAgLUR3aXRoX2xpYmV2PWZhbHNl
IFwKPiArICAgICAgIC1Ed2l0aF9saWJ1bndpbmQ9ZmFsc2UgXAo+ICsgICAgICAgLUR3aXRoX21h
eG1pbmRkYj1mYWxzZSBcCj4gKyAgICAgICAtRHdpdGhfbWJlZHRscz1mYWxzZSBcCj4gKyAgICAg
ICAtRHdpdGhfbWVtY2FjaGVkPWZhbHNlIFwKPiArICAgICAgIC1Ed2l0aF9teXNxbD1mYWxzZSBc
Cj4gKyAgICAgICAtRHdpdGhfbmV0dGxlPWZhbHNlIFwKPiArICAgICAgIC1Ed2l0aF9uc3M9ZmFs
c2UgXAo+ICsgICAgICAgLUR3aXRoX3Bnc3FsPWZhbHNlIFwKPiArICAgICAgIC1Ed2l0aF9zYXNs
PWZhbHNlIFwKPiArICAgICAgIC1Ed2l0aF93b2xmc3NsPWZhbHNlIFwKPiArICAgICAgIC1Ed2l0
aF94YXR0cj1mYWxzZSBcCj4gKyAgICAgICAtRHdpdGhfeHhoYXNoPWZhbHNlIFwKPiArICAgICAg
IC1Ed2l0aF96c3RkPWZhbHNlIFwKPiArICAgICAgIC1EYnVpbGRfZXh0cmFfd2FybmluZ3M9ZmFs
c2UgXAo+ICsgICAgICAgLURidWlsZF9zdGF0aWM9ZmFsc2UgXAo+ICsgICAgICAgLURtb2R1bGVk
aXI9bGliL2xpZ2h0dHBkCj4KPiAgaWZlcSAoJChCUjJfUEFDS0FHRV9MSUdIVFRQRF9PUEVOU1NM
KSx5KQo+ICBMSUdIVFRQRF9ERVBFTkRFTkNJRVMgKz0gb3BlbnNzbAo+IC1MSUdIVFRQRF9DT05G
X09QVFMgKz0gLS13aXRoLW9wZW5zc2wKPiArTElHSFRUUERfQ09ORl9PUFRTICs9IC1Ed2l0aF9v
cGVuc3NsPXRydWUKPiAgZWxzZQo+IC1MSUdIVFRQRF9DT05GX09QVFMgKz0gLS13aXRob3V0LW9w
ZW5zc2wKPiArTElHSFRUUERfQ09ORl9PUFRTICs9IC1Ed2l0aF9vcGVuc3NsPWZhbHNlCj4gIGVu
ZGlmCj4KPiAgaWZlcSAoJChCUjJfUEFDS0FHRV9MSUdIVFRQRF9QQU0pLHkpCj4gIExJR0hUVFBE
X0RFUEVOREVOQ0lFUyArPSBsaW51eC1wYW0KPiAtTElHSFRUUERfQ09ORl9PUFRTICs9IC0td2l0
aC1wYW0KPiArTElHSFRUUERfQ09ORl9PUFRTICs9IC1Ed2l0aF9wYW09dHJ1ZQo+ICBlbHNlCj4g
LUxJR0hUVFBEX0NPTkZfT1BUUyArPSAtLXdpdGhvdXQtcGFtCj4gK0xJR0hUVFBEX0NPTkZfT1BU
UyArPSAtRHdpdGhfcGFtPWZhbHNlCj4gIGVuZGlmCj4KPiAgaWZlcSAoJChCUjJfUEFDS0FHRV9M
SUdIVFRQRF9aTElCKSx5KQo+ICBMSUdIVFRQRF9ERVBFTkRFTkNJRVMgKz0gemxpYgo+IC1MSUdI
VFRQRF9DT05GX09QVFMgKz0gLS13aXRoLXpsaWIKPiArTElHSFRUUERfQ09ORl9PUFRTICs9IC1E
d2l0aF96bGliPXRydWUKPiAgZWxzZQo+IC1MSUdIVFRQRF9DT05GX09QVFMgKz0gLS13aXRob3V0
LXpsaWIKPiArTElHSFRUUERfQ09ORl9PUFRTICs9IC1Ed2l0aF96bGliPWZhbHNlCj4gIGVuZGlm
Cj4KPiAgaWZlcSAoJChCUjJfUEFDS0FHRV9MSUdIVFRQRF9CWklQMikseSkKPiAgTElHSFRUUERf
REVQRU5ERU5DSUVTICs9IGJ6aXAyCj4gLUxJR0hUVFBEX0NPTkZfT1BUUyArPSAtLXdpdGgtYnpp
cDIKPiArTElHSFRUUERfQ09ORl9PUFRTICs9IC1Ed2l0aF9iemlwPXRydWUKPiAgZWxzZQo+IC1M
SUdIVFRQRF9DT05GX09QVFMgKz0gLS13aXRob3V0LWJ6aXAyCj4gK0xJR0hUVFBEX0NPTkZfT1BU
UyArPSAtRHdpdGhfYnppcD1mYWxzZQo+ICBlbmRpZgo+Cj4gIGlmZXEgKCQoQlIyX1BBQ0tBR0Vf
TElHSFRUUERfUENSRSkseSkKPiAgTElHSFRUUERfQ09ORl9FTlYgPSBQQ1JFQ09ORklHPSQoU1RB
R0lOR19ESVIpL3Vzci9iaW4vcGNyZS1jb25maWcKUENSRUNPTkZJRyBpcyBub3QgdXNlZCBvdXRz
aWRlIG9mIGNvbmZpZ3VyZS5hYyBzbyB0aGUgbGluZSBhYm92ZSBjYW4gYmUgZHJvcHBlZC4KPiAg
TElHSFRUUERfREVQRU5ERU5DSUVTICs9IHBjcmUKPiAtTElHSFRUUERfQ09ORl9PUFRTICs9IC0t
d2l0aC1wY3JlCj4gK0xJR0hUVFBEX0NPTkZfT1BUUyArPSAtRHdpdGhfcGNyZT10cnVlCj4gIGVs
c2UKPiAtTElHSFRUUERfQ09ORl9PUFRTICs9IC0td2l0aG91dC1wY3JlCj4gK0xJR0hUVFBEX0NP
TkZfT1BUUyArPSAtRHdpdGhfcGNyZT1mYWxzZQo+ICBlbmRpZgo+Cj4gIGlmZXEgKCQoQlIyX1BB
Q0tBR0VfTElHSFRUUERfV0VCREFWKSx5KQo+ICBMSUdIVFRQRF9ERVBFTkRFTkNJRVMgKz0gbGli
eG1sMiBzcWxpdGUKPiAtTElHSFRUUERfQ09ORl9PUFRTICs9IC0td2l0aC13ZWJkYXYtcHJvcHMK
PiArTElHSFRUUERfQ09ORl9PUFRTICs9IC1Ed2l0aF93ZWJkYXZfcHJvcHM9dHJ1ZQo+ICBpZmVx
ICgkKEJSMl9QQUNLQUdFX1VUSUxfTElOVVhfTElCVVVJRCkseSkKPiAtTElHSFRUUERfQ09ORl9P
UFRTICs9IC0td2l0aC13ZWJkYXYtbG9ja3MKPiArTElHSFRUUERfQ09ORl9PUFRTICs9IC1Ed2l0
aF93ZWJkYXZfbG9ja3M9dHJ1ZQo+ICBMSUdIVFRQRF9ERVBFTkRFTkNJRVMgKz0gdXRpbC1saW51
eAo+ICBlbHNlCj4gLUxJR0hUVFBEX0NPTkZfT1BUUyArPSAtLXdpdGhvdXQtd2ViZGF2LWxvY2tz
Cj4gK0xJR0hUVFBEX0NPTkZfT1BUUyArPSAtRHdpdGhfd2ViZGF2X2xvY2tzPWZhbHNlCj4gIGVu
ZGlmCj4gIGVsc2UKPiAtTElHSFRUUERfQ09ORl9PUFRTICs9IC0td2l0aG91dC13ZWJkYXYtcHJv
cHMgLS13aXRob3V0LXdlYmRhdi1sb2Nrcwo+ICtMSUdIVFRQRF9DT05GX09QVFMgKz0gLUR3aXRo
X3dlYmRhdl9wcm9wcz1mYWxzZSAtRHdpdGhfd2ViZGF2X2xvY2tzPWZhbHNlCj4gIGVuZGlmCj4K
PiAgaWZlcSAoJChCUjJfUEFDS0FHRV9MSUdIVFRQRF9MVUEpLHkpCj4gIExJR0hUVFBEX0RFUEVO
REVOQ0lFUyArPSBsdWEKPiAtTElHSFRUUERfQ09ORl9PUFRTICs9IC0td2l0aC1sdWEKPiArTElH
SFRUUERfQ09ORl9PUFRTICs9IC1Ed2l0aF9sdWE9dHJ1ZQo+ICBlbHNlCj4gLUxJR0hUVFBEX0NP
TkZfT1BUUyArPSAtLXdpdGhvdXQtbHVhCj4gK0xJR0hUVFBEX0NPTkZfT1BUUyArPSAtRHdpdGhf
bHVhPWZhbHNlCj4gIGVuZGlmCj4KPiAgZGVmaW5lIExJR0hUVFBEX0lOU1RBTExfQ09ORklHCj4g
QEAgLTEwNCw0ICsxMjYsNCBAQCBkZWZpbmUgTElHSFRUUERfSU5TVEFMTF9JTklUX1NZU1RFTUQK
PiAgICAgICAgICAgICAgICAgJChUQVJHRVRfRElSKS91c3IvbGliL3RtcGZpbGVzLmQvbGlnaHR0
cGQuY29uZgo+ICBlbmRlZgo+Cj4gLSQoZXZhbCAkKGF1dG90b29scy1wYWNrYWdlKSkKPiArJChl
dmFsICQobWVzb24tcGFja2FnZSkpCj4gLS0KPiAyLjMzLjEKPgpCZXN0IFJlZ2FyZHMsCgpGYWJy
aWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
