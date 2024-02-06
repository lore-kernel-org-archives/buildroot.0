Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE510C48286
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 10:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88A5380E3B;
	Tue,  6 Feb 2024 10:01:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QQZRPIkg4XbN; Tue,  6 Feb 2024 10:01:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6BB3820C7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6BB3820C7;
	Tue,  6 Feb 2024 10:01:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 938B01BF405
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CA0341603
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:01:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CA0341603
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pUJZGzKVUo1w for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 10:01:19 +0000 (UTC)
X-Greylist: delayed 523 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 06 Feb 2024 10:01:18 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9F3E40209
Received: from aposti.net (aposti.net [89.234.176.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B9F3E40209
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 10:01:18 +0000 (UTC)
Message-ID: <15a450739bf459a11093a6182dbdb1d2b2cb1b53.camel@crapouillou.net>
From: Paul Cercueil <paul@crapouillou.net>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Adam Duskett
 <adam.duskett@amarulasolutions.com>
Date: Tue, 06 Feb 2024 10:52:30 +0100
In-Reply-To: <20240205222949.2805f50f@windsurf>
References: <20240121204252.152952-1-adam.duskett@amarulasolutions.com>
 <20240121204252.152952-2-adam.duskett@amarulasolutions.com>
 <20240205222949.2805f50f@windsurf>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZMLQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5UzFZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtNz8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe+rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIPdlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7Urf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KFlBwgAhlGy6nqP7O3u7q23hRW5AQ0EXQqFwQEIAMo+MgvYHsyjX3Ja4Oolg1Txzm8woj30ch2nACFCqaO0R/1kLj2VVeLrDyQUOlXx9PD6IQI4M8wy8m0sR4wV2p/g/paw7k65cjzYYLh+FdLNyO7IW
 YXndJO+wDPi3aK/YKUYepqlP+QsmaHNYNdXEQDRKqNfJg8t0f5rfzp9ryxd1tCnbV+tG8VHQWiZXNqN7062DygSNXFUfQ0vZ3J2D4oAcIAEXTymRQ2+hr3Hf7I61KMHWeSkCvCG2decTYsHlw5Erix/jYWqVOtX0roOOLqWkqpQQJWtU+biWrAksmFmCp5fXIg1Nlg39v21xCXBGxJkxyTYuhdWyu1yDQ+LSIUAEQEAAYkBNgQYAQoAIBYhBNdHYd8OeCBwpMuVxnPua9InSr1BBQJdCoXBAhsMAAoJEHPua9InSr1B4wsH/Az767YCT0FSsMNt1jkkdLCBi7nY0GTW+PLP1a4zvVqFMo/vD6uz1ZflVTUAEvcTi3VHYZrlgjcxmcGu239oruqUS8Qy/xgZBp9KF0NTWQSl1iBfVbIU5VV1vHS6r77W5x0qXgfvAUWOH4gmN3MnF01SH2zMcLiaUGF+mcwl15rHbjnT3Nu2399aSE6cep86igfCAyFUOXjYEGlJy+c6UyT+DUylpjQg0nl8MlZ/7Whg2fAU9+FALIbQYQzGlT4c71SibR9T741jnegHhlmV4WXXUD6roFt54t0MSAFSVxzG8mLcSjR2cLUJ3NIPXixYUSEn3tQhfZj07xIIjWxAYZo=
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; s=mail; t=1707213152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=KBOY+cSdeCs7p2L+D9UgTKYUOeTn4Xivltfd/OpxNYo=;
 b=EQscKPZZoMPHa6ZKtqEW7Bgo3iBtevtEgT0C/GBMQxVKWQEvxB6hvXUiSyK2VOcMLWD8zM
 bVeLVZYqjVs6ixKbnj/Uu5qMgb3vMYtkPTyL2yGo4ckNJy0aYgeKYNPj/9PheJWV+vkwsM
 2QNC+aT2zGmYcQnnMqJWQ5lKg7gW2JI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.a=rsa-sha256 header.s=mail header.b=EQscKPZZ
Subject: Re: [Buildroot] [PATCH 2/2] package/wlroots: Update patch with
 upstream status
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
Cc: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SSBob25lc3RseSBmb3Jnb3QgYWJvdXQgdGhpcy4KCkknbGwgc2VuZCBhIG5ldyBwYXRjaCB1cHN0
cmVhbS4KCi1QYXVsCgpMZSBsdW5kaSAwNSBmw6l2cmllciAyMDI0IMOgIDIyOjI5ICswMTAwLCBU
aG9tYXMgUGV0YXp6b25pIGEgw6ljcml0wqA6Cj4gSGVsbG8gQWRhbSwKPiAKPiArUGF1bCBDZXJj
dWVpbCBpbiBDYywgc2VlIGJlbG93Lgo+IAo+IE9uIFN1biwgMjEgSmFuIDIwMjQgMTM6NDI6NTIg
LTA3MDAKPiBBZGFtIER1c2tldHQgPGFkYW0uZHVza2V0dEBhbWFydWxhc29sdXRpb25zLmNvbT4g
d3JvdGU6Cj4gCj4gPiBwYWNrYWdlL3dscm9vdHMvMDAwMS1BZGQtZmVhdHVyZS1tYWNyb3MtdG8t
bW9yZS1DLWZpbGVzLS5wYXRjaCBoYXMKPiA+IGJlZW4KPiA+IHJlamVjdGVkIHVwc3RyZWFtLCBh
bmQgdGhlIGluaXRpYWwgcHVsbCByZXF1ZXN0IHdhcyBtb3ZlZCB0byB0aGUKPiA+IGZyZWVkZXNr
dG9wIGdpdGxhYi4gVXBkYXRlIHRoZSBwYXRjaCB0byByZWZsZWN0IHRoZXNlIGNoYW5nZXMuCj4g
PiAKPiA+IFNpZ25lZC1vZmYtYnk6IEFkYW0gRHVza2V0dCA8YWRhbS5kdXNrZXR0QGFtYXJ1bGFz
b2x1dGlvbnMuY29tPgo+IAo+IFRoYW5rcywgYXBwbGllZCEKPiAKPiBQYXVsOiBjb3VsZCB5b3Ug
Zm9sbG93LXVwIHdpdGggdXBzdHJlYW0gKGVpdGhlciB3bHJvb3RzLCBvciB1Y2xpYmMsCj4gb3IK
PiBib3RoKSB0byB0cnkgdG8gZmluZCBhbiBhY2NlcHRhYmxlIHNvbHV0aW9uIHNvIHRoYXQgc29t
ZSBkYXkgd2UgY2FuCj4gZHJvcCB0aGlzIHBhdGNoPwo+IAo+IFRoYW5rcyBhIGxvdCEKPiAKPiBU
aG9tYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
