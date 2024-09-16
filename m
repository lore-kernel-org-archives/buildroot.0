Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2CAC3ABB2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 14:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66D3740462;
	Mon, 16 Sep 2024 14:57:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1DUFWgJkMuI4; Mon, 16 Sep 2024 14:57:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E900340B37
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E900340B37;
	Mon, 16 Sep 2024 14:57:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE3541BF3B0
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 14:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9F4D60AA0
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 14:57:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T8PMZTjpTFUz for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 14:57:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::92c; helo=mail-ua1-x92c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5FB3960708
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FB3960708
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com
 [IPv6:2607:f8b0:4864:20::92c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5FB3960708
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 14:57:45 +0000 (UTC)
Received: by mail-ua1-x92c.google.com with SMTP id
 a1e0cc1a2514c-846b934981aso604628241.3
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 07:57:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726498664; x=1727103464;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ORzeNIHgt+AKDMJcN7Zb0HvzxCsl0KpPGwvqwfotpYk=;
 b=DqTWTeRavq82Ce9kxRpEHcnAm3FzJuBUK9Cfi5t8Kl6fcg+C2MmeHwwLFNb9fUFNx8
 Cr3nkPm/7BBRDb4mPdLsJF8w90wzRaF8fhkhqIFMUtR1aItP8almWrc9QWtm4+HdCjei
 01wlALeZddcD/uTZUYc+u1p2zp7hJXixdwrHQtlnQUpuwPZdLMuD1xfMgIjL76Mm1ri8
 iEio6U0Wj3hVj+vOEKRsY7cOTlXkPnsy+MjTP3yFEBpkDKn/fZqyHvOwCkAkuBNVPrpg
 kJ5DWb3yVQdkC+W0fvpB5kt0H3JIVGi9V6fjwXXaYNPOwJaDT84/SfhrfqPHJ5f9+PvM
 /lDA==
X-Gm-Message-State: AOJu0YygG/72ohhSuL2Lz2fLr4GQCrDpjDh0fILTQvini7iExxG3qilv
 iWslsnTAMcn3aoubaOJCktwsZ03gFyyKMuHsc8gCE/gmMGEqJP0xBRQNZlIYA/dcbqXACWrazqo
 mbtVuWgaYdWXT/MFleVFNXHNJxF2pRw==
X-Google-Smtp-Source: AGHT+IG/H3tYeAP4IIxl98EDttJiXoclMihY1sdMzDgBjiHqWoZUS0ceAre4hgy4qrk+wY0ZeGSwaPYFE4NY1u8fGhY=
X-Received: by 2002:a05:6102:1611:b0:497:70dc:c with SMTP id
 ada2fe7eead31-49d4f6b0302mr7195637137.19.1726498663805; Mon, 16 Sep 2024
 07:57:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240915212816.1645997-1-james.hilliard1@gmail.com>
 <Zuf_n3SFObkfWBOL@landeda>
In-Reply-To: <Zuf_n3SFObkfWBOL@landeda>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 16 Sep 2024 08:57:32 -0600
Message-ID: <CADvTj4pXw1xsnT8YF9-hL=XJW1YQpKtcMG5QBtLJJo7QibrxtA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726498664; x=1727103464; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ORzeNIHgt+AKDMJcN7Zb0HvzxCsl0KpPGwvqwfotpYk=;
 b=VXzoUoV0r9993RMXvVIDF7LQVBe2b4VtHrmS79UZsw72kB3+3u6rAW5XIf80IWODWd
 RZ/0qfiiyx3b7NADqo6dsEPRsPytvARhTMQaz8HikvCMkBqnyWpBiewzm38kcog6WhLh
 vfbpkeTn9E+uaGw/PKoCc/2SlttrDLKp4LEM6BK4adAEBMXNwfL2cR9pK315eLLuraMD
 TOkjLqYPbKuLeqXeV6zYOvkE9qxE/B6teCTJwvtiTj8XXmA7q/s4NY8Dlz0ayxRttT8Y
 on/TjQ/RMLbWVTojSLIuidaX5T9NzrcGbRoNI7EaMyBeNjLMIi55uV5tHQ3pEbBAA/4v
 fLlw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=VXzoUoV0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-m2crypto: bump to
 version 0.42.0
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
Cc: Gustavo Heinz <gustavo@gsthnz.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBTZXAgMTYsIDIwMjQgYXQgMzo1MeKAr0FNIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9y
aW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPgo+IEphbWVzLCBBbGwsCj4KPiBPbiAyMDI0LTA5LTE1
IDE1OjI4IC0wNjAwLCBKYW1lcyBIaWxsaWFyZCBzcGFrZSB0aHVzbHk6Cj4gPiBTZXQgb3BlbnNz
bCBwYXRoIHZpYSBlbnYgaW5zdGVhZCBvZiBidWlsZCBvcHRpb25zLgo+Cj4gWW91IGFyZSBfZGVz
Y3JpYmluZ18gdGhlIGNoYW5nZSwgeW91IGFyZSBub3QgX2V4cGxhaW5pbmdfIGl0LiBJdCBpcwo+
IHByZXR0eSBlYXN5IHRvIHNwb3QgdGhhdCB0aGUgb3B0aW9ucyBhcmUgZHJvcHBlZCBhbmQgdGhh
dCB0aGUgcGF0aAo+IGlzIG5vdyBwYXNzZWQgaW4gYW4gZW52aXJvbm1lbnQgdmFyaWFibGUuCj4K
PiBCdXQgd2h5IGlzIHRoYXQgbmVlZGVkPyBXaGF0J3MgdGhlIHJhdGlvbmFsZSBmb3IgZG9pbmcg
aXQ/IElzIGl0Cj4gcmVxdWlyZWQgYnkgdGhlIGJ1bXAsIG9yIGlzIGl0IHNvbWV0aGluZyB0aGF0
IGNhbiBiZSBkb25lIGJlZm9yZSBvcgo+IGFmdGVyPyBFeHBsYWluaW5nIHRoaXMgbWF5IHJpbmcg
YSBiZWxsIHRoYXQgbWF5YmUgdGhlIGNoYW5nZSBzaG91bGQgKG9yCj4gc2hvdWxkIG5vdCkgYmUg
YmFja3BvcnRlZC4KCkl0IGlzIHJlcXVpcmVkIGFzIHRoZSBidWlsZCBvcHRpb24gd2FzIHJlbW92
ZWQuIFByZXN1bWFibHkgZG9lc24ndApuZWVkIHRvIGJlIGJhY2twb3J0ZWQgdG8gdmVyc2lvbnMg
d2l0aCB0aGUgYnVpbGQgb3B0aW9uLgoKPgo+IFJlZ2FyZHMsCj4gWWFubiBFLiBNT1JJTi4KPgo+
ID4gU2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5j
b20+Cj4gPiAtLS0KPiA+ICBwYWNrYWdlL3B5dGhvbi1tMmNyeXB0by9weXRob24tbTJjcnlwdG8u
aGFzaCB8ICA0ICsrLS0KPiA+ICBwYWNrYWdlL3B5dGhvbi1tMmNyeXB0by9weXRob24tbTJjcnlw
dG8ubWsgICB8IDEwICsrKystLS0tLS0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKSwgOCBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24t
bTJjcnlwdG8vcHl0aG9uLW0yY3J5cHRvLmhhc2ggYi9wYWNrYWdlL3B5dGhvbi1tMmNyeXB0by9w
eXRob24tbTJjcnlwdG8uaGFzaAo+ID4gaW5kZXggNzgyODM3MDgxZS4uYWE4ZmUwOWMxNCAxMDA2
NDQKPiA+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLW0yY3J5cHRvL3B5dGhvbi1tMmNyeXB0by5oYXNo
Cj4gPiArKysgYi9wYWNrYWdlL3B5dGhvbi1tMmNyeXB0by9weXRob24tbTJjcnlwdG8uaGFzaAo+
ID4gQEAgLTEsNSArMSw1IEBACj4gPiAgIyBtZDUsIHNoYTI1NiBmcm9tIGh0dHBzOi8vcHlwaS5v
cmcvcHlwaS9tMmNyeXB0by9qc29uCj4gPiAtbWQ1ICAyODBjMjAwNzJhZmJlNzAxMGNmOWU5NjIw
ZWEyNWM3YiAgTTJDcnlwdG8tMC40MC4xLnRhci5nego+ID4gLXNoYTI1NiAgYmJmZDExM2VjNTU3
MDhjMDU4MTYyNTJhNGYwOWU0MjM3ZGY0ZjNiYmZjODE3MWNiYmMzMzA1N2QyNTdiYmIzMCAgTTJD
cnlwdG8tMC40MC4xLnRhci5nego+ID4gK21kNSAgYjg4YmNiMWQ0YWViODE3ZjkxZWI2MjdkMDhi
NjczYTIgIG0yY3J5cHRvLTAuNDIuMC50YXIuZ3oKPiA+ICtzaGEyNTYgIDQyYjYyZGYyY2FmNjIz
MTYxYjFkNjQzYTcyMzU0NjRjMmZlMmEzMTA1MDQ5ZWJjNDk4YTZkNDdkYzA4ZjY0YjQgIG0yY3J5
cHRvLTAuNDIuMC50YXIuZ3oKPiA+ICAjIExvY2FsbHkgY29tcHV0ZWQgc2hhMjU2IGNoZWNrc3Vt
cwo+ID4gIHNoYTI1NiAgNGVjYTQ3ODM5NmY0YjJiMDIwNzI5YTExMWZjZTNmMDk2NDU2ZDc0NTAw
YmZkOGYyYjAzODhjM2M2OWY5OTdjMCAgTElDRU5DRQo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
cHl0aG9uLW0yY3J5cHRvL3B5dGhvbi1tMmNyeXB0by5tayBiL3BhY2thZ2UvcHl0aG9uLW0yY3J5
cHRvL3B5dGhvbi1tMmNyeXB0by5tawo+ID4gaW5kZXggNmMwN2Y0MmQwNi4uNzlkZmMxYmViMiAx
MDA2NDQKPiA+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLW0yY3J5cHRvL3B5dGhvbi1tMmNyeXB0by5t
awo+ID4gKysrIGIvcGFja2FnZS9weXRob24tbTJjcnlwdG8vcHl0aG9uLW0yY3J5cHRvLm1rCj4g
PiBAQCAtNCwxNyArNCwxNSBAQAo+ID4gICMKPiA+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+
ID4KPiA+IC1QWVRIT05fTTJDUllQVE9fVkVSU0lPTiA9IDAuNDAuMQo+ID4gLVBZVEhPTl9NMkNS
WVBUT19TT1VSQ0UgPSBNMkNyeXB0by0kKFBZVEhPTl9NMkNSWVBUT19WRVJTSU9OKS50YXIuZ3oK
PiA+IC1QWVRIT05fTTJDUllQVE9fU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9y
Zy9wYWNrYWdlcy85ZS9hMy85NDMzODE3NDkzZWEyNTBkYjY3YTA1ZGUzMzYxY2IwYTFkNTg1MzE4
NDdkNTA0MDZmMmYyODQ1NWU2OGMKPiA+ICtQWVRIT05fTTJDUllQVE9fVkVSU0lPTiA9IDAuNDIu
MAo+ID4gK1BZVEhPTl9NMkNSWVBUT19TT1VSQ0UgPSBtMmNyeXB0by0kKFBZVEhPTl9NMkNSWVBU
T19WRVJTSU9OKS50YXIuZ3oKPiA+ICtQWVRIT05fTTJDUllQVE9fU0lURSA9IGh0dHBzOi8vZmls
ZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy84NS85Zi9iODk3N2NlMjk3MWNmNWY4MjNkYjNm
ZGIzMWU3ZTA2MWI5NjYyZGEzMThhMTdiNmJmMGM2NTNmODRhZWUKPiA+ICBQWVRIT05fTTJDUllQ
VE9fU0VUVVBfVFlQRSA9IHNldHVwdG9vbHMKPiA+ICBQWVRIT05fTTJDUllQVE9fTElDRU5TRSA9
IE1JVAo+ID4gIFBZVEhPTl9NMkNSWVBUT19MSUNFTlNFX0ZJTEVTID0gTElDRU5DRQo+ID4gIFBZ
VEhPTl9NMkNSWVBUT19DUEVfSURfVkVORE9SID0gbTJjcnlwdG9fcHJvamVjdAo+ID4gIFBZVEhP
Tl9NMkNSWVBUT19DUEVfSURfUFJPRFVDVCA9IG0yY3J5cHRvCj4gPiAgUFlUSE9OX00yQ1JZUFRP
X0RFUEVOREVOQ0lFUyA9IG9wZW5zc2wgaG9zdC1zd2lnCj4gPiAtUFlUSE9OX00yQ1JZUFRPX0JV
SUxEX09QVFMgPSBcCj4gPiAtICAgICAtQy0tYnVpbGQtb3B0aW9uPWJ1aWxkX2V4dCBcCj4gPiAt
ICAgICAtQy0tYnVpbGQtb3B0aW9uPS0tb3BlbnNzbD0kKFNUQUdJTkdfRElSKS91c3IKPiA+ICtQ
WVRIT05fTTJDUllQVE9fRU5WID0gT1BFTlNTTF9QQVRIPSIkKFNUQUdJTkdfRElSKS91c3IiCj4g
Pgo+ID4gICQoZXZhbCAkKHB5dGhvbi1wYWNrYWdlKSkKPiA+IC0tCj4gPiAyLjM0LjEKPiA+Cj4g
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gYnVp
bGRyb290IG1haWxpbmcgbGlzdAo+ID4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiA+IGh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+Cj4gLS0K
PiAuLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0t
LS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgo+IHwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1l
IEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8Cj4gfCAr
MzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwg
IF9fXyAgICAgICAgICAgICAgIHwKPiB8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0t
LS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAo+IHwgaHR0cDov
L3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAg
IGNvbnNwaXJhY3kuICB8Cj4gJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0t
Xi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
