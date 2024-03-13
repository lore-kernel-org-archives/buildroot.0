Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9FDC54E58
	for <buildroot@archiver.kernel.org>; Wed, 13 Mar 2024 11:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3910A4046B;
	Wed, 13 Mar 2024 11:29:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z7JAFodT2TwL; Wed, 13 Mar 2024 11:29:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35EF140B2B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35EF140B2B;
	Wed, 13 Mar 2024 11:29:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6EEF11BF232
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 11:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6309260709
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 11:29:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dV3reQzeLRjw for <buildroot@lists.busybox.net>;
 Wed, 13 Mar 2024 11:29:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=michael@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1980060644
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1980060644
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1980060644
 for <buildroot@buildroot.org>; Wed, 13 Mar 2024 11:29:34 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a461d0c90c1so113164466b.2
 for <buildroot@buildroot.org>; Wed, 13 Mar 2024 04:29:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710329372; x=1710934172;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Amq7EG2gThltAhu6VRZB6t4ZtCNObWj+4dtni1jwIw4=;
 b=Z2jTvMVW3xaTlDkT/wBAPrvewlFGIY8yD6d6MKL7oB73++DihLVOJtZEZAom9P/0io
 lxq5VKoykXYnRJRB9EwYme5vi7vlJyrsX4wPkBrlBaOPPweC3udzntdjXdldGKZJvqvQ
 E1yoBVi/V/UkDSPOBZe5XWzMkmJAMUORoMbAR7GM7vsex5CYn21OP5m3uTKKxzEzmpaR
 rRAA90MtGbDk6iy3msBpBDiUOnsKUFxoEnF40NN2jA+mFX93kv475u7p9I3GAGPUR11+
 o8qDcwW1RP+QntfnviK2cnZ5Ewu6EI82k4BinetIsL0LS8rVvENASCr+lqo/eXRO+zp9
 pUKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUivutBAd+pvYV25/P5dG4Hy2cSHtMKCI22dQ7KE9z+0FSc+t22ttfm+yUsfhAYeOAPpg11+REAQn+3AmZ7ZyJAOhNesBDgig==
X-Gm-Message-State: AOJu0YzyDoOF00Ff77eCVwIU2sM2b/7X9djrIplmGhGh69BrWWB8dLZo
 Ll3+hZqoLFobe9iP+gLKOQ9HezKV77ZSIHFQ9q74h6mQnt0FYZ20biaNccqTDSEPSSpwQqtxnuW
 3amqa7+ZwkEv3n6BXdg9zHyAHeXSqoSTSy/+j8Q==
X-Google-Smtp-Source: AGHT+IFzcYxQNI/xjbzgbYRMd52/GCubpcMPAP/SUPXUa87EpOMVeCLpiP60gQjIUe2aYJ2RjtmMJ9tw7Tz8oM6ztnk=
X-Received: by 2002:a17:906:f0d5:b0:a45:f263:361b with SMTP id
 dk21-20020a170906f0d500b00a45f263361bmr1988838ejb.61.1710329372425; Wed, 13
 Mar 2024 04:29:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
 <20240304153253.732708-20-dario.binacchi@amarulasolutions.com>
 <96a71705-dceb-4417-9edd-1f962edd66f4@smile.fr>
In-Reply-To: <96a71705-dceb-4417-9edd-1f962edd66f4@smile.fr>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Wed, 13 Mar 2024 12:29:21 +0100
Message-ID: <CAOf5uwkFxNK=7TFsTzvM6yC9bvTZANY2je=qOnR+Sa84JaQxwA@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1710329372; x=1710934172;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Amq7EG2gThltAhu6VRZB6t4ZtCNObWj+4dtni1jwIw4=;
 b=RNhxtObVWN4vHjwV++/4VjX76zuJMDOkcNULZa9YE/7SIQHa+kdOgplbcx04RQqC1V
 RMCp2nZ68DfVbHKNW366thGjuQ/vjl5edgn28e1pfwFxaJiNVrHiajJ+4GtdHM22cPGi
 VQylxdnEohuOkc5qi8Gl3/XxKylsl8OMcGQFI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=RNhxtObV
Subject: Re: [Buildroot] [PATCH v9 19/22] board/ti/am62x-sk: move
 post-{build, image}.sh to board/ti/common/am6xx
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
Cc: linux-amarula@amarulasolutions.com, Anand Gadiyar <gadiyar@ti.com>,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluCgpPbiBXZWQsIE1hciAxMywgMjAyNCBhdCAxMTo1NuKAr0FNIFJvbWFpbiBOYW91
ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPiB3cm90ZToKPgo+IEhlbGxvIERhcmlvLAo+Cj4gTGUg
MDQvMDMvMjAyNCDDoCAxNjozMiwgRGFyaW8gQmluYWNjaGkgYSDDqWNyaXQgOgo+ID4gVGhlIHBh
dGNoIG1ha2VzIGl0IGNsZWFyIHRoYXQgdGhlIG1vdmVkIHNjcmlwdHMgY2FuIGJlIHVzZWQgYnkg
dGhlCj4gPiBhbTZ7Miw0fXggcGxhdGZvcm1zLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IERhcmlv
IEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KPiA+Cj4gPiAt
LS0KPiA+Cj4gPiBBZGRlZCBpbiB2OAo+ID4KPiA+ICBib2FyZC90aS9hbTYyeC1zay9wb3N0LWlt
YWdlLnNoICAgICAgICAgICAgICAgICAgIHwgIDUgLS0tLS0KPiA+ICBib2FyZC90aS97YW02Mngt
c2sgPT4gY29tbW9uL2FtNnh4fS9wb3N0LWJ1aWxkLnNoIHwgIDAKPiA+ICBib2FyZC90aS9jb21t
b24vYW02eHgvcG9zdC1pbWFnZS5zaCAgICAgICAgICAgICAgIHwgMTEgKysrKysrKysrKysKPiA+
ICBjb25maWdzL3RpX2FtNjJ4X3NrX2RlZmNvbmZpZyAgICAgICAgICAgICAgICAgICAgIHwgIDQg
KystLQo+ID4gIDQgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMo
LSkKPiA+ICBkZWxldGUgbW9kZSAxMDA3NTUgYm9hcmQvdGkvYW02Mngtc2svcG9zdC1pbWFnZS5z
aAo+ID4gIHJlbmFtZSBib2FyZC90aS97YW02Mngtc2sgPT4gY29tbW9uL2FtNnh4fS9wb3N0LWJ1
aWxkLnNoICgxMDAlKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDc1NSBib2FyZC90aS9jb21tb24vYW02
eHgvcG9zdC1pbWFnZS5zaAo+ID4KPiA+IGRpZmYgLS1naXQgYS9ib2FyZC90aS9hbTYyeC1zay9w
b3N0LWltYWdlLnNoIGIvYm9hcmQvdGkvYW02Mngtc2svcG9zdC1pbWFnZS5zaAo+ID4gZGVsZXRl
ZCBmaWxlIG1vZGUgMTAwNzU1Cj4gPiBpbmRleCAzNGY3MzJjMDkxYWQuLjAwMDAwMDAwMDAwMAo+
ID4gLS0tIGEvYm9hcmQvdGkvYW02Mngtc2svcG9zdC1pbWFnZS5zaAo+ID4gKysrIC9kZXYvbnVs
bAo+ID4gQEAgLTEsNSArMCwwIEBACj4gPiAtIyEvYmluL3NoIC14Cj4gPiAtCj4gPiAtQk9BUkRf
RElSPSIkKGRpcm5hbWUgIiQwIikiCj4gPiAtCj4gPiAtc3VwcG9ydC9zY3JpcHRzL2dlbmltYWdl
LnNoIC1jICIke0JPQVJEX0RJUn0vZ2VuaW1hZ2UuY2ZnIgo+ID4gZGlmZiAtLWdpdCBhL2JvYXJk
L3RpL2FtNjJ4LXNrL3Bvc3QtYnVpbGQuc2ggYi9ib2FyZC90aS9jb21tb24vYW02eHgvcG9zdC1i
dWlsZC5zaAo+ID4gc2ltaWxhcml0eSBpbmRleCAxMDAlCj4gPiByZW5hbWUgZnJvbSBib2FyZC90
aS9hbTYyeC1zay9wb3N0LWJ1aWxkLnNoCj4gPiByZW5hbWUgdG8gYm9hcmQvdGkvY29tbW9uL2Ft
Nnh4L3Bvc3QtYnVpbGQuc2gKPiA+IGRpZmYgLS1naXQgYS9ib2FyZC90aS9jb21tb24vYW02eHgv
cG9zdC1pbWFnZS5zaCBiL2JvYXJkL3RpL2NvbW1vbi9hbTZ4eC9wb3N0LWltYWdlLnNoCj4gPiBu
ZXcgZmlsZSBtb2RlIDEwMDc1NQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi45MTdjYTIzOGFhNzgK
PiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL2JvYXJkL3RpL2NvbW1vbi9hbTZ4eC9wb3N0LWlt
YWdlLnNoCj4gPiBAQCAtMCwwICsxLDExIEBACj4gPiArIyEvYmluL3NoIC14Cj4gPiArCj4gPiAr
Ym9hcmRfZGlyKCkgewo+ID4gKyAgICBpZiBncmVwIC1FcSAiXkJSMl9ERUZDT05GSUc9LiovdGlf
YW02NHhfc2tfZGVmY29uZmlnXCIkIiAiJHtCUjJfQ09ORklHfSI7IHRoZW4KPiA+ICsgICAgICAg
IGVjaG8gImFtNjR4LXNrIgo+ID4gKyAgICBlbHNlCj4gPiArICAgICAgICBlY2hvICJhbTYyeC1z
ayIKPgo+IFdoYXQgaWYgd2UgYWRkIGEgbmV3IGJvYXJkIGJhc2VkIG9uIGFtNjIgU29DIGxpa2Ug
dGhlIGJlYWdsZXBsYXkgWzFdID8KPgo+IEkgYmVsaWV2ZSBpdCdzIGZpbmUgdG8gaGF2ZSB0aW55
IHBvc3QtaW1hZ2Uuc2ggc2NyaXB0IGluIGVhY2ggYm9hcmQgZGlyZWN0b3J5Cj4gaW5zdGVhZCBv
ZiBnZW5lcmljIHNjcmlwdCB0aGF0IGlzIGF3YXJlIG9mIGJvYXJkcyBuYW1lcyAoYWN0dWFsbHkg
Ym9hcmQKPiBkaXJlY3RvcnkgbmFtZSBpbiBCdWlsZHJvb3QpLgo+CgpUaGlzIGlzIFRJIGNvbW1v
biwgb3RoZXIgdmVuZG9yIGNhbiBoYXZlIHRoZWlyIG93biBzY3JpcHQuIFdoeSBhbGwgdGhlCmJv
YXJkcyB0aG91bGQga2VlcCBmcm9tIHRoZXJlPwoKTWljaGFlbAoKPiBbMV0gaHR0cHM6Ly93d3cu
YmVhZ2xlYm9hcmQub3JnL2JvYXJkcy9iZWFnbGVwbGF5Cj4KPiBCZXN0IHJlZ2FyZHMsCj4gUm9t
YWluCj4KPgo+ID4gKyAgICBmaQo+ID4gK30KPiA+ICsKPiA+ICtzdXBwb3J0L3NjcmlwdHMvZ2Vu
aW1hZ2Uuc2ggLWMgImJvYXJkL3RpLyQoYm9hcmRfZGlyKS9nZW5pbWFnZS5jZmciCj4gPiBkaWZm
IC0tZ2l0IGEvY29uZmlncy90aV9hbTYyeF9za19kZWZjb25maWcgYi9jb25maWdzL3RpX2FtNjJ4
X3NrX2RlZmNvbmZpZwo+ID4gaW5kZXggYmQyOTRiYjcxMmVlLi4zMTBiYTZmYjY0NTMgMTAwNjQ0
Cj4gPiAtLS0gYS9jb25maWdzL3RpX2FtNjJ4X3NrX2RlZmNvbmZpZwo+ID4gKysrIGIvY29uZmln
cy90aV9hbTYyeF9za19kZWZjb25maWcKPiA+IEBAIC0xLDcgKzEsNyBAQAo+ID4gIEJSMl9hYXJj
aDY0PXkKPiA+ICBCUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzZfNj15Cj4g
PiAtQlIyX1JPT1RGU19QT1NUX0JVSUxEX1NDUklQVD0iYm9hcmQvdGkvYW02Mngtc2svcG9zdC1i
dWlsZC5zaCIKPiA+IC1CUjJfUk9PVEZTX1BPU1RfSU1BR0VfU0NSSVBUPSJib2FyZC90aS9hbTYy
eC1zay9wb3N0LWltYWdlLnNoIgo+ID4gK0JSMl9ST09URlNfUE9TVF9CVUlMRF9TQ1JJUFQ9ImJv
YXJkL3RpL2NvbW1vbi9hbTZ4eC9wb3N0LWJ1aWxkLnNoIgo+ID4gK0JSMl9ST09URlNfUE9TVF9J
TUFHRV9TQ1JJUFQ9ImJvYXJkL3RpL2NvbW1vbi9hbTZ4eC9wb3N0LWltYWdlLnNoIgo+ID4gIEJS
Ml9ST09URlNfUE9TVF9TQ1JJUFRfQVJHUz0iLWMgdHR5UzIsMTE1MjAwbjggLWQgazMtYW02MjUt
c2suZHRiIC1sIGFtNjJ4LXNrLWJ1aWxkcm9vdCAtciAvZGV2L21tY2JsazFwMiAteCBlYXJseWNv
bj1uczE2NTUwYSxtbWlvMzIsMHgwMjgwMDAwMCIKPiA+ICBCUjJfTElOVVhfS0VSTkVMPXkKPiA+
ICBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OPXkKPgoKCi0tIApNaWNoYWVsIE5henph
cmVubyBUcmltYXJjaGkKQ28tRm91bmRlciAmIENoaWVmIEV4ZWN1dGl2ZSBPZmZpY2VyCk0uICsz
OSAzNDcgOTEzIDIxNzAKbWljaGFlbEBhbWFydWxhc29sdXRpb25zLmNvbQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCgpBbWFydWxhIFNvbHV0aW9ucyBCVgpKb29wIEdlZXNpbmt3
ZWcgMTI1LCAxMTE0IEFCLCBBbXN0ZXJkYW0sIE5MClQuICszMSAoMCk4NSAxMTEgOTE3MgppbmZv
QGFtYXJ1bGFzb2x1dGlvbnMuY29tCnd3dy5hbWFydWxhc29sdXRpb25zLmNvbQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
