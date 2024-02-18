Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B1CFC4829E
	for <buildroot@archiver.kernel.org>; Sun, 18 Feb 2024 11:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BCDC406A7;
	Sun, 18 Feb 2024 11:13:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uXAXJ-uGznaN; Sun, 18 Feb 2024 11:13:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20146406E2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20146406E2;
	Sun, 18 Feb 2024 11:13:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C2F341BF2FA
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 11:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B361F400FD
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 11:13:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gY4G43RnuzX9 for <buildroot@lists.busybox.net>;
 Sun, 18 Feb 2024 11:13:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=gilles.talis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3A51D400DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A51D400DC
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A51D400DC
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 11:13:50 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a3e706f50beso32288766b.0
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 03:13:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708254828; x=1708859628;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pkgD+/IIyJ/ibjDcs1odv7UV9/4x1NhUKEpYnrNR7Yc=;
 b=bMotuxslRNtIgXPeKfyYriGdjeZTCItkpgLw4ryYBUg3bHPFepZcwvufWi+qYCkLbx
 wVlyLe1xV9GCFKcHeQR/bhrq0iJpWxKzoTcufJLhC9/U14TR95nujFo0u4RtHKgmG3kl
 cI6VBeunqskY7++zz51j2Uz1vmMz+V2DuqahAmaHZPvWVkvJ0rn+oQCINbdRaGdglwbd
 MSjKoF9Y2TnIpHuGoQXnX7mkIRjFCMFVHYnljWIRJCNeMgpaVuSP0GCnDjAwdkrg7IUu
 FbADNwpvPVkHLWd51uJ6+U1KVcRfv5AI2wqqxRhdWDWqtv3wKpPc3oECCAfJy+b1IIVy
 GYbw==
X-Gm-Message-State: AOJu0Yw+TZ7xWoj5dCao4GTYJMDO9AS1XCJhH3B008NuDW1i+vnRYsyh
 nu/xDnNVa267IW7AgUPvJzF3XW01QN7HyFgx5nyqlvmm6ZDK0QdFwfVCgJqdA5bAo20uxQmuU09
 /9Y6oS9CRkPjDsW1UnbcGr0KiCacNsBWR+eE=
X-Google-Smtp-Source: AGHT+IFt6m6a19sQ5InaMVReEOstvT7NqGoVia4++7To38lqYmx+CRHENtWp7mE/XBGrFBmILOZGPZqSQQ6XOLoxAWQ=
X-Received: by 2002:a17:906:1858:b0:a3e:127b:690e with SMTP id
 w24-20020a170906185800b00a3e127b690emr2218803eje.70.1708254827790; Sun, 18
 Feb 2024 03:13:47 -0800 (PST)
MIME-Version: 1.0
References: <20240215142413.451505-1-gilles.talis@gmail.com>
 <20240215142413.451505-2-gilles.talis@gmail.com>
 <e4dae4ed19e6a3baffd62ff5a9c4f3a3@free.fr>
In-Reply-To: <e4dae4ed19e6a3baffd62ff5a9c4f3a3@free.fr>
From: Gilles Talis <gilles.talis@gmail.com>
Date: Sun, 18 Feb 2024 07:13:36 -0400
Message-ID: <CAKcgs2xatqW4g7u62jqOEyE3HnPRYtHhHQp2S4f4jw6mRH3VXw@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708254828; x=1708859628; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pkgD+/IIyJ/ibjDcs1odv7UV9/4x1NhUKEpYnrNR7Yc=;
 b=T9jT9KRL6EJYOWZ7oFEeJwpxjm7JS/3e1DAH0yq2Qgo+fzhbKCT1sdyFjCyLgscBBm
 HSaqHGdHOXkuLK5ZvaTcEONRnl+pmL5Bs+TI3r6ywYV08JesGoSAwUGjmGPALSMNSyC3
 MIiZFB1gn9Y9+5nTgXrYaAfYHZnoCkPBY0u68wjmlWc+jm92AYYEXbjXQ96rDu4X08OT
 tqoGGUjKPF4h6By80dZ5E9x654Xc16SvWWFVgH0EzB/29FEQwb5Ccfi66fqYPRemWSHw
 D9wsbO7OcOuDgcijjFZlCmGMb1fZ4uwWw/WpBrD/g89CeDv7BO3bZAVuplNwuT128eqh
 14kQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=T9jT9KRL
Subject: Re: [Buildroot] [PATCH] package/iozone: bump to version 3.506
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

SGkgSnVsaWVuLAoKVGhhbmtzIGEgbG90IGZvciB0aGUgcmV2aWV3IQoKTGUgc2FtLiAxNyBmw6l2
ci4gMjAyNCDDoCAxMjowNSwgSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4gYSDDqWNyaXQg
Ogo+Cj4gSGkgR2lsbGVzLCBBbGwsCj4KPiBUaGFua3MgZm9yIHRoZSBwYXRjaCEKPgo+IEkgaGF2
ZSBmZXcgY29tbWVudHM6Cj4KPiBDb3VsZCB5b3UgYWRkIGEgcmVmZXJlbmNlIGluIGNvbW1pdCBs
b2cgdG8gdGhlIHVwc3RyZWFtIGNoYW5nZSBsb2c/Cj4gRm9yIGV4YW1wbGU6Cj4gIiIiCj4gRm9y
IGNoYW5nZSBsb2csIHNlZSBlbmQgb2YgZmlsZToKPiBodHRwczovL3d3dy5pb3pvbmUub3JnL3Ny
Yy9jdXJyZW50L0NoYW5nZXMudHh0Cj4gIiIiCj4gVGhpcyBoZWxwcyBhIGxvdCBmb3IgbGF0ZXIg
YW5hbHlzZXMvZGVidWdnaW5nLgpZZXMsIGRpZCBub3QgcmVhbGl6ZSBpdCB3YXMgYWRkZWQuIFdp
bGwgY2hhbmdlIHRoYXQuCgo+Cj4gQWxzbywgdGhlIHVwc3RyZWFtIGFyY2hpdmUgb2YgdGhpcyBu
ZXcgdmVyc2lvbiBzZWVtcyB0byBpbmNsdWRlCj4gdGhlIGxpY2Vuc2UgZmlsZS4gU28gdGhlIGNv
bW1lbnQgY2FuIGJlIHJlbW92ZWQsIGFuZCB0aGUgbGljZW5zZQo+IGZpbGUgYWRkZWQgKHNlZSBs
YXRlcikuCk9LLiBXaWxsIGNoYW5nZSB0aGF0IHRvby4KCj4KPiBGaW5hbGx5LCBjb3VsZCB5b3Ug
YWRkIGEgY29tbWVudCBpbiB0aGUgY29tbWl0IGxvZyB0aGF0Ogo+IFRoZSB1cHN0cmVhbSBhcmNo
aXZlIGZvcm1hdCBjaGFuZ2VkIGZyb20gdGd6IHRvIHRhci4KPiAoanVzdCB0byByZWNvcmQgdGhp
cyBpcyBub3QgYW4gYXJiaXRyYXJ5IGNoYW5nZSkuCldlbGwgbm90ZWQuIFdpbGwgYWxzbyBjaGFu
Z2UgdGhhdC4KCj4KPiBPbiAxNS8wMi8yMDI0IDE1OjI0LCBHaWxsZXMgVGFsaXMgd3JvdGU6Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBHaWxsZXMgVGFsaXMgPGdpbGxlcy50YWxpc0BnbWFpbC5jb20+Cj4g
PiAtLS0KPiA+ICBwYWNrYWdlL2lvem9uZS9pb3pvbmUuaGFzaCB8IDIgKy0KPiA+ICBwYWNrYWdl
L2lvem9uZS9pb3pvbmUubWsgICB8IDQgKystLQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2lv
em9uZS9pb3pvbmUuaGFzaCBiL3BhY2thZ2UvaW96b25lL2lvem9uZS5oYXNoCj4gPiBpbmRleCA5
ZWNmMWQxYWY4Li5jNTA2YjQxZGIyIDEwMDY0NAo+ID4gLS0tIGEvcGFja2FnZS9pb3pvbmUvaW96
b25lLmhhc2gKPiA+ICsrKyBiL3BhY2thZ2UvaW96b25lL2lvem9uZS5oYXNoCj4gPiBAQCAtMSwy
ICsxLDIgQEAKPiA+ICAjIExvY2FsbHkgY2FsY3VsYXRlZAo+ID4gLXNoYTI1Ngo+ID4gNWE1MmY1
MDE3ZTAyMmU3MzdmNWI1NWYzMjBjYzZhZGEwZjJhOGM4MzFhNWY5OTZjY2UyYTQ0ZTAzZTkxYzAz
OAo+ID4gaW96b25lM180OTMudGd6Cj4gPiArc2hhMjU2Cj4gPiAxMTRjZTVjMDcxODczYjlhMmM3
YmE2ZTczZDA1ZDVlZjdlNjY1NjQzOTJhY2JmY2RjMGIzMjYxZGIxMGZjYmU3Cj4gPiBpb3pvbmUz
XzUwNi50YXIKPgo+IFRoZSBsaWNlbnNlIGZpbGUgaGFzaCBjYW4gYmUgYWRkZWQgaGVyZToKPiBz
aGEyNTYgIGJmZjc5MDlmZDY5ODcwOGQxNTYxM2E0ZmI5NzdhMTkzY2ZmOThmNDRlZjE3MGMyZGMx
ZGQ1MDI5NzRkZjc1YjIKPiAgIGRvY3MvTGljZW5zZS50eHQKPgo+ID4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvaW96b25lL2lvem9uZS5tayBiL3BhY2thZ2UvaW96b25lL2lvem9uZS5tawo+ID4gaW5k
ZXggMmRmNGEyYWE4NC4uN2NjZTE1YzUzZCAxMDA2NDQKPiA+IC0tLSBhL3BhY2thZ2UvaW96b25l
L2lvem9uZS5tawo+ID4gKysrIGIvcGFja2FnZS9pb3pvbmUvaW96b25lLm1rCj4gPiBAQCAtNCw4
ICs0LDggQEAKPiA+ICAjCj4gPgo+ID4gIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiA+Cj4gPiAt
SU9aT05FX1ZFUlNJT04gPSAzLjQ5Mwo+ID4gLUlPWk9ORV9TT1VSQ0UgPSBpb3pvbmUkKHN1YnN0
IC4sXywkKElPWk9ORV9WRVJTSU9OKSkudGd6Cj4gPiArSU9aT05FX1ZFUlNJT04gPSAzLjUwNgo+
ID4gK0lPWk9ORV9TT1VSQ0UgPSBpb3pvbmUkKHN1YnN0IC4sXywkKElPWk9ORV9WRVJTSU9OKSku
dGFyCj4gPiAgSU9aT05FX1NJVEUgPSBodHRwOi8vd3d3Lmlvem9uZS5vcmcvc3JjL2N1cnJlbnQK
PiA+ICBJT1pPTkVfTElDRU5TRSA9IElPem9uZSBsaWNlbnNlIChOTyBERVJJVkVEIFdPUktTIEFM
TE9XRUQpCj4gPiAgIyBJT3pvbmUgbGljZW5zZSBkZXRhaWxzIGNhbiBiZSBmb3VuZCBhdDoKPgo+
IFRoZSBsaWNlbnNlIGNvbW1lbnQgY2FuIGJlIHJlbW92ZWQgaGVyZSwgYW5kIHRoZSBsaWNlbnNl
IGZpbGUgYWRkZWQ6Cj4gSU9aT05FX0xJQ0VOU0VfRklMRVMgPSBkb2NzL0xpY2Vuc2UudHh0Cj4K
PiA+IC0tCj4gPiAyLjM5LjIKPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+ID4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+ID4gYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo+Cj4gQmVzdCByZWdhcmRzLAo+Cj4gSnVsaWVuLgp0aGFua3MKR2ls
bGVzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
