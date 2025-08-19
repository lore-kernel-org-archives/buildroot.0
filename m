Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9504ACA0EEB
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 03:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 270A440657;
	Tue, 19 Aug 2025 03:53:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r_Gh-dKZlW-G; Tue, 19 Aug 2025 03:53:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52C8540635
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52C8540635;
	Tue, 19 Aug 2025 03:53:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 14B0FDE6
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 03:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EEB3140643
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 03:53:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LF47691PwsHf for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 03:53:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E4EE540635
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4EE540635
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E4EE540635
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 03:53:29 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-333f8f5ca72so34402251fa.1
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 20:53:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755575607; x=1756180407;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JT0AiZhLJNyOjhhjrjwghsCqkOwUay/bBK/tdBdSUY8=;
 b=p+m2K1k++wcDR5FG0u4h0Z42EWvlqWQPzLSwc23h1kJKIuteHR7ItemCAG7dLdR4St
 JE5K9YW7mA6CRvTfm2bU6QVRoRYizwaj0dELOuGIAPsZGDqVAJhrYknjGBiiRWVBJeYc
 ifjlZJVaJI8XD9mfiOUJKnr7XJtWtc77f28ulO1rUJu4bZk2AX0tDcB4lPN+VMOx39Br
 yr2cBr+7vaaJ8KYlhd1TEPb1xH/nPsTQRmfJzy0KjU/UzDmMhN3OWtAYArzSlA7zdO+L
 gq/ifsEkeUI0Ts2CVqVNEqSTMhBnJrjOZt10FZpdxs5HzQGNNtnH9SDB9/UkhzMR3yQr
 I/0g==
X-Gm-Message-State: AOJu0YzFHl2XQk873Sl183RXN2O9wtaukauo3nvNqYBsKIt7kJ7ERwoI
 fKIImz7orcfZXkLSl160I1EV/Nzz5GKoauyBoj8QlQln8hJVgyo9BSPtV2zVZzXSAyy6aFCVQ99
 J5TsLwjnMCw==
X-Gm-Gg: ASbGncvCCK7MxnyF5Djy5GDsAfKIy4Vm2+nKijfZRnGoF4M/W0tCrcZUJYAx2Qvynm5
 NMLrW+q4H72qZFjLIDuNL6cqQoiz9ayzpif/aC9Djz8GUhkN6aFicTqzEJV47EzE4WA4foaJ67k
 Jj5bF+nlutHuibwYXOX3gYKAgJ0bLvigDh6N3IYJWxI6+dGtmfGETCp7MtwrC+Jg/4S+RFLTYxa
 hp9P6xFMRqyrAlPx0kC419YebwT4lN7mANDegcqwOdINdIIyMg7NLZB17mI9g/2vNYHOKr9EGNT
 3WDKhj9EqGIZPBO4KDJ4krlNAsulzpypIJ/Ouk7+EqtKUiL0+39FPKuUqwY5bB9UtPhS3qUvgUj
 77F4B+QkGOAM1GcA6AUEXlTGJUqrGz/VYdo82yUrvTmNEik65MLni/EtpEYtJ+A==
X-Google-Smtp-Source: AGHT+IH+3xZTaqeBuK75ZMbMDJssFkCW3xMKzbglyhrr3JPZ8+Xj8/2IPEraHVHllQWrXE8uMA7O7w==
X-Received: by 2002:a05:651c:2102:b0:32b:3104:f89c with SMTP id
 38308e7fff4ca-33530704d18mr2895911fa.29.1755575607291; 
 Mon, 18 Aug 2025 20:53:27 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com.
 [209.85.167.52]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3340a473b8asm20165601fa.30.2025.08.18.20.53.25
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 20:53:26 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-55ce522d6deso4006799e87.1
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 20:53:25 -0700 (PDT)
X-Received: by 2002:a05:6512:3b20:b0:55b:8592:c555 with SMTP id
 2adb3069b0e04-55e0079578fmr310623e87.5.1755575604637; Mon, 18 Aug 2025
 20:53:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250818132436.338635-1-fiona.klute@gmx.de>
In-Reply-To: <20250818132436.338635-1-fiona.klute@gmx.de>
Date: Mon, 18 Aug 2025 20:53:12 -0700
X-Gmail-Original-Message-ID: <CA+h8R2pxc0gy4pjVnBJr596Z6RTsMV25svYwP-OLOwigzTb6Cw@mail.gmail.com>
X-Gm-Features: Ac12FXw1wFfxXWnMhiKLIHLKqBStSJSePq_KhyWmCyxsTVL-WDXoPOGYAHyPQns
Message-ID: <CA+h8R2pxc0gy4pjVnBJr596Z6RTsMV25svYwP-OLOwigzTb6Cw@mail.gmail.com>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1755575607; x=1756180407; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JT0AiZhLJNyOjhhjrjwghsCqkOwUay/bBK/tdBdSUY8=;
 b=Cx9r3ZdY/GIOUFIIz9+Oa8sngCMgBGHE5ztgjUmKvtEvFIoRMiUIpeDbt+k4APlxA9
 a24snIg0ZtpcmpGn4tvLuL7C27DEcWavow/+mHIggYW+2G/XGtIZO2p85aFFE/dLfhJc
 BmNWoa9BsC1a7wUfQSJ9Y35tlIDrCu4RtOn0ZtTsFX0LLWyJOua4o0jWrC2WsICkhsz0
 9oOURJU1AWNp1Toi3fsYqJSCn/xEBH8u2EOJO0k0LOeuANP/N5LyTNAgvMBPlBMl35hN
 YEURrJbnnYhNOfFgrn96CdYGS4CbiVPs1GOsogZk3aQvCShFraqZWj7uCUiPbqSq5NZc
 2eHA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=Cx9r3ZdY
Subject: Re: [Buildroot] [PATCH 1/1] package/docker-engine: prefer cgroup v2
 with kernel >=5.4 and no systemd
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRmlvbmEsCgpPbiBNb24sIEF1ZyAxOCwgMjAyNSBhdCA2OjI04oCvQU0gRmlvbmEgS2x1dGUg
PGZpb25hLmtsdXRlQGdteC5kZT4gd3JvdGU6Cj4KPiBGcm9tOiAiRmlvbmEgS2x1dGUgKFdJV0Ep
IiA8ZmlvbmEua2x1dGVAZ214LmRlPgo+Cj4gV2l0aG91dCBzeXN0ZW1kIHBhY2thZ2UvZG9ja2Vy
LWVuZ2luZSByZXF1aXJlcyBhbm90aGVyIHdheSB0byBtb3VudAo+IC9zeXMvZnMvY2dyb3VwLCBz
byBmYXIgdW5jb25kaXRpb25hbGx5IHByb3ZpZGVkIGJ5Cj4gQlIyX1BBQ0tBR0VfQ0dST1VQRlNf
TU9VTlQgZm9yIGNncm91cCB2MS4gSG93ZXZlciwgaXQgaXMgcHJlZmVyYWJsZSB0bwo+IHVzZSBj
Z3JvdXAgdjIgaWYgcG9zc2libGUuIFdoZXRoZXIgRG9ja2VyIGNhbiB1c2UgY2dyb3VwIHYyIGRl
cGVuZHMgb24KPiB0aGUga2VybmVsIHZlcnNpb24sIHRoZSBEb2NrZXIgZG9jdW1lbnRhdGlvbiBs
aXN0cyB0aGUgcmVxdWlyZW1lbnQgYXMKPiAidjQuMTUgb3IgbGF0ZXIgKHY1LjIgb3IgbGF0ZXIg
aXMgcmVjb21tZW5kZWQpIiBbMV0uCj4KPiBTZWxlY3QgQlIyX1BBQ0tBR0VfQ0dST1VQRlNfVjJf
TU9VTlQgaW5zdGVhZCBvZgo+IEJSMl9QQUNLQUdFX0NHUk9VUEZTX01PVU5UIGlmIHRoZSBrZXJu
ZWwgaGVhZGVycyBtYXRjaCB0aGUgcmVjb21tZW5kZWQKPiB2ZXJzaW9uLgo+Cj4gWzFdIGh0dHBz
Oi8vZG9jcy5kb2NrZXIuY29tL2VuZ2luZS9jb250YWluZXJzL3J1bm1ldHJpY3MvI3J1bm5pbmct
ZG9ja2VyLW9uLWNncm91cC12Mgo+Cj4gU2lnbmVkLW9mZi1ieTogRmlvbmEgS2x1dGUgKFdJV0Ep
IDxmaW9uYS5rbHV0ZUBnbXguZGU+Cj4gLS0tCj4gSSBub3RpY2VkIERvY2tlciB3YXMgdW5jb25k
aXRpb25hbGx5IHB1bGxpbmcgaW4KPiBCUjJfUEFDS0FHRV9DR1JPVVBGU19NT1VOVCB3aGlsZSBp
bnZlc3RpZ2F0aW5nIGEgRG9ja2VyIHdhcm5pbmcgYWJvdXQKPiBtZW1vcnkgY2dyb3VwIG5vdCBi
ZWluZyBhdmFpbGFibGUsIGFuZCBpbmRlZWQgbXkga2VybmVsIGNvbmZpZyBoYXMKPiBDT05GSUdf
TUVNQ0cgZW5hYmxlZCwgYnV0IG5vdCB0aGUgImhpZ2hseSBkaXNjb3VyYWdlZCIgKHRvIHF1b3Rl
IGl0cwo+IGtlcm5lbCBjb25maWcgZGVzY3JpcHRpb24pIENPTkZJR19NRU1DR19WMS4gU3dpdGNo
aW5nIHRvIHYyIG9uCj4gc3VmZmljaWVudGx5IHJlY2VudCBrZXJuZWxzIHNlZW1zIGVxdWFsbHkg
aGlnaGx5IHByZWZlcmFibGUuCj4KPiBJJ20gbm90IHN1cmUgaWYgcGFja2FnZS9tb2J5LWJ1aWxk
a2l0IHNob3VsZCBiZSBhZGp1c3RlZCB0byBtYXRjaCBzbwo+IHRoZSBkZXBlbmRlbmNpZXMgd29u
J3QgY29uZmxpY3QuIEN1cnJlbnQgQnVpbGRraXQgZGVmaW5pdGVseSB3b3Jrcwo+IHdpdGggY2dy
b3VwIHYyLCBidXQgdGhlIHBhY2thZ2VkIHZlcnNpb24gaXMgZmFpcmx5IG9sZC4KPgo+ICBwYWNr
YWdlL2RvY2tlci1lbmdpbmUvQ29uZmlnLmluIHwgMyArKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZG9j
a2VyLWVuZ2luZS9Db25maWcuaW4gYi9wYWNrYWdlL2RvY2tlci1lbmdpbmUvQ29uZmlnLmluCj4g
aW5kZXggNjMzOGVlZWVmMS4uZDU5MWVlNGUzYiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2RvY2tl
ci1lbmdpbmUvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9kb2NrZXItZW5naW5lL0NvbmZpZy5p
bgo+IEBAIC03LDcgKzcsOCBAQCBjb25maWcgQlIyX1BBQ0tBR0VfRE9DS0VSX0VOR0lORQo+ICAg
ICAgICAgZGVwZW5kcyBvbiBCUjJfVVNFX01NVSAjIGNvbnRhaW5lcmQKPiAgICAgICAgIGRlcGVu
ZHMgb24gQlIyX1BBQ0tBR0VfTElCU0VDQ09NUF9BUkNIX1NVUFBPUlRTICMgbGlic2VjY29tcAo+
ICAgICAgICAgZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hFQURFUlNfQVRfTEVBU1RfM18xNyAj
IGxpYnNlY2NvbXAKPiAtICAgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9DR1JPVVBGU19NT1VOVCBp
ZiAhQlIyX1BBQ0tBR0VfU1lTVEVNRCAjIHJ1bnRpbWUgZGVwZW5kZW5jeQo+ICsgICAgICAgc2Vs
ZWN0IEJSMl9QQUNLQUdFX0NHUk9VUEZTX1YyX01PVU5UIGlmICFCUjJfUEFDS0FHRV9TWVNURU1E
ICYmIEJSMl9UT09MQ0hBSU5fSEVBREVSU19BVF9MRUFTVF81XzQgIyBydW50aW1lIGRlcGVuZGVu
Y3kKPiArICAgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9DR1JPVVBGU19NT1VOVCBpZiAhQlIyX1BB
Q0tBR0VfU1lTVEVNRCAmJiAhQlIyX1RPT0xDSEFJTl9IRUFERVJTX0FUX0xFQVNUXzVfNCAjIHJ1
bnRpbWUgZGVwZW5kZW5jeQo+ICAgICAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX0NPTlRBSU5FUkQg
IyBydW50aW1lIGRlcGVuZGVuY3kKPiAgICAgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9IT1NUX0dP
Cj4gICAgICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfSVBUQUJMRVMgIyBydW50aW1lIGRlcGVuZGVu
Y3kKPiAtLQo+IDIuNTAuMQo+CgpMR1RNCgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIFN0ZXdhcnQg
PGNocmlzdGlhbkBhcGVydHVyZS51cz4KCk1pbm9yIHBvaW50LCBldmVuIGlmIHRoZSBrZXJuZWwg
aXMgYXQgbGVhc3QgNS40LCB0aGUgb2xkIGNncm91cCB2MQpmb3JtYXQgbWlnaHQgc3RpbGwgYmUg
ZW5hYmxlZCBieSBhIGtlcm5lbCBhcmd1bWVudCwgb3IgdGhlICJoeWJyaWQiCndoaWNoIGhhcyBi
b3RoLiBCdXQgdGhlcmUgaXMgbm8gd2F5IHRvIGtub3cgd2hhdCBydW50aW1lIGtlcm5lbAphcmd1
bWVudHMgd2lsbCBiZSBzZXQgb24gdGhlIEJ1aWxkcm9vdCBzaWRlLCBzbyB3ZSB3aWxsIGhhdmUg
dG8gYXNzdW1lCnBlb3BsZSB3aWxsIG1pZ3JhdGUgdG8gZWl0aGVyICJoeWJyaWQiIG9yICJ2MiIg
d2hlbiB1c2luZyBEb2NrZXIsCndoaWNoIGlzIGFjY2VwdGFibGUgYXMgaXQncyBiZWVuIHRoZSBk
ZWZhdWx0IGluIGFsbCBtYWpvciBkaXN0cm9zIGZvcgpxdWl0ZSBhIHdoaWxlIG5vdy4KClRoYW5r
cywKQ2hyaXN0aWFuIFN0ZXdhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
