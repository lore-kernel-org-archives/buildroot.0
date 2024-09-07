Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7115BEB64CB
	for <buildroot@archiver.kernel.org>; Sat,  7 Sep 2024 21:26:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 393F860619;
	Sat,  7 Sep 2024 21:26:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D9RUovIGCD-L; Sat,  7 Sep 2024 21:26:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4506D60644
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4506D60644;
	Sat,  7 Sep 2024 21:26:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 678571BF41F
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 21:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54AAD401D8
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 21:26:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UBjHcpqg4r3r for <buildroot@lists.busybox.net>;
 Sat,  7 Sep 2024 21:26:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a2a; helo=mail-vk1-xa2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E0F20400A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0F20400A4
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com
 [IPv6:2607:f8b0:4864:20::a2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E0F20400A4
 for <buildroot@buildroot.org>; Sat,  7 Sep 2024 21:26:26 +0000 (UTC)
Received: by mail-vk1-xa2a.google.com with SMTP id
 71dfb90a1353d-502b144f31bso638093e0c.1
 for <buildroot@buildroot.org>; Sat, 07 Sep 2024 14:26:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725744385; x=1726349185;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3XPUeriCsF3IOuGLUWb8bpr8UkIW1Pn1GH8+QmLO6GQ=;
 b=tqpzCFKfLJ+hck8AgJ656q6qeap2xG0thOJu9VigO4VFooVae0+tBe4CRTiZfTuW6T
 UV4gW8A0hhUdYam0VXXUfF48vi5PLzj4jGz+tkpFVKE2jWtpLgxsqSpOsYLR7YoBr9CI
 amsox9iAHkFME1TJyV6JNouZPOhYg8MMvST211YY0ArCzFyWXw8BumkMeZVgMXSbjknr
 0sleAr28VspfvUuUrT/2N9tfVdKs6EqmLUfxR8Y6qdjvDCB15DoWQo9QHQmt3cK908Hw
 R/rugYnJ/EPQsoLiys9HulEsJGv/XN2Mz6i614J7F4NAMt1wGLgGdUV9I67KgI3+DcyL
 afNg==
X-Gm-Message-State: AOJu0YyE/SAF2a8IDlxtxPwu513491WaLeuBcYXFsGY768B/uBAcBeOo
 WcssNqkVCRS/uQLhZBnV1AzcaRcqxb/K28qZKR4EIf/cjoExgA+ti+77otFOyXc0w7PkIqwvUDA
 nM6rV7b1jTc5ngmXstG0+MiwlU6acATx0
X-Google-Smtp-Source: AGHT+IHgRecZsbQ7LQ46rp/PDHQOX8ZxX2XkHi6Nle+BqxakeeTa6L8XvXFGU5oowM0ETuBcrepJ7cap6UGyyadPqY0=
X-Received: by 2002:a05:6122:1d9e:b0:4f5:1787:18aa with SMTP id
 71dfb90a1353d-501e77b403emr7604225e0c.0.1725744385464; Sat, 07 Sep 2024
 14:26:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240701193622.1786979-1-james.hilliard1@gmail.com>
 <Zty5AlsdrND0H-_b@landeda>
In-Reply-To: <Zty5AlsdrND0H-_b@landeda>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 7 Sep 2024 15:26:14 -0600
Message-ID: <CADvTj4o6KSzG-vBSpLNKcGvPno8wwd3C0-=BpY+f9UP0vg_oQQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725744385; x=1726349185; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3XPUeriCsF3IOuGLUWb8bpr8UkIW1Pn1GH8+QmLO6GQ=;
 b=mx5CtWfsysaIvxKEnIaS1h3wihq4sWnsSNAPS0MbRrvxQoWrG+x2QBTMMheI3iCkBi
 GxPUHygWeZtBLHsIX0wAYUL+H3TFGgW/zXHilCFwsG2X413S8Af6ggphGZD2G/31eAHY
 ENQg+AHAq9li2NU0aIqF6HVn9+eN0/IXocIKAB/WrKer3k3HksZKdf6CSPtQfrJYOMOg
 psI1qFM5zRKqi/lGNDzJxlJpUtu2ruBPz4SfbMlxXwquZQyo5DJiRqV8oAgiilv6WdbO
 2dHOGXDjcLQDh+QkRGc4RY6IMNYyqhvGnMoFQhIopQ0nExkiZqbbj1fqYEJtK/waIgIf
 LFmA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mx5CtWfs
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pydantic-core: bump to
 version 2.20.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCBTZXAgNywgMjAyNCBhdCAyOjM14oCvUE0gWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jp
bi4xOTk4QGZyZWUuZnI+IHdyb3RlOgo+Cj4gSmFtZXMsIEFsbCwKPgo+IE9uIDIwMjQtMDctMDEg
MTM6MzYgLTA2MDAsIEphbWVzIEhpbGxpYXJkIHNwYWtlIHRodXNseToKPiBbLS1TTklQLS1dCj4g
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tcHlkYW50aWMtY29yZS9weXRob24tcHlkYW50
aWMtY29yZS5tayBiL3BhY2thZ2UvcHl0aG9uLXB5ZGFudGljLWNvcmUvcHl0aG9uLXB5ZGFudGlj
LWNvcmUubWsKPiA+IGluZGV4IDc5ZDA2ZGVhYjIuLjJlMzdjMzcwMDQgMTAwNjQ0Cj4gPiAtLS0g
YS9wYWNrYWdlL3B5dGhvbi1weWRhbnRpYy1jb3JlL3B5dGhvbi1weWRhbnRpYy1jb3JlLm1rCj4g
PiArKysgYi9wYWNrYWdlL3B5dGhvbi1weWRhbnRpYy1jb3JlL3B5dGhvbi1weWRhbnRpYy1jb3Jl
Lm1rCj4gPiBAQCAtNCw5ICs0LDkgQEAKPiA+ICAjCj4gPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKPiA+Cj4gPiAtUFlUSE9OX1BZREFOVElDX0NPUkVfVkVSU0lPTiA9IHYyLjE5LjAKPiA+IC1Q
WVRIT05fUFlEQU5USUNfQ09SRV9TSVRFID0gaHR0cHM6Ly9naXRodWIuY29tL3B5ZGFudGljL3B5
ZGFudGljLWNvcmUKPiA+IC1QWVRIT05fUFlEQU5USUNfQ09SRV9TSVRFX01FVEhPRCA9IGdpdAo+
ID4gK1BZVEhPTl9QWURBTlRJQ19DT1JFX1ZFUlNJT04gPSAyLjIwLjAKPiA+ICtQWVRIT05fUFlE
QU5USUNfQ09SRV9TT1VSQ0UgPSBweWRhbnRpY19jb3JlLSQoUFlUSE9OX1BZREFOVElDX0NPUkVf
VkVSU0lPTikudGFyLmd6Cj4gPiArUFlUSE9OX1BZREFOVElDX0NPUkVfU0lURSA9IGh0dHBzOi8v
ZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy83ZC9mYS85ODAyZDA1M2YzM2RiY2YxMTBk
NDZlM2YyODY2N2IwNmNkNzY0YjE2NGYxZTNmNDE4OTg0OGNkZDZlNzgKPgo+IEFnYWluIGEgY2Fy
ZWxlc3MgY2hhbmdlIHRoYXQgZHJvcHMgb3VyIHZlbmRvcmluZyBwc3QtdmVyc2lvbiBzdWZmaXgg
aW4KPiBsb2NhbCBhcmNoaXZlcy4KPgo+IEZvciB0aGF0IG9uZSwgdGhlIG1pZ3JhdGlvbiBhd2F5
IGZyb20gdGhlIGdpdCBkb3dubG9hZCBtZXRob2Qgd2FzIG5vdAo+IGV2ZW4gZXhwbGFpbmVkIGlu
IHRoZSBjb21taXQgbG9nLgo+Cj4gQ291bGQgeW91IHBsZWFzZSBlaXRoZXIgcmVpbnN0YXRlIHRo
ZSBnaXQgZG93bm1sb2FkIG1ldGhvZCAod2hpY2gKPiBpbmNpZGVudGFsbHkgd2lsbCBoYXZlIHRo
ZSBsb2NhbCBmaWxlbmFtZSBiZSBwcm9lcGVybHkgbmFtZWQpLCBvciBhcHBseQo+IHRoZSBzYW1l
IGhhY2sgdGhhdCBpcyBhcHBsaWVkIHRvIG90aGVyIGNhcmdvLXZlbmRvcmVkIHB5dGhvbiBwYWNr
YWdlcz8KCkFwcGxpZWQgdGhlIHNhbWUgaGFjayB1c2VkIGZvciB0aGUgb3RoZXIgY2FyZ28gcHlw
aSBwYWNrYWdlczoKaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9v
dC9wYXRjaC8yMDI0MDkwNzIxMDU0MC40ODY3MDItMS1qYW1lcy5oaWxsaWFyZDFAZ21haWwuY29t
LwoKPgo+IFJlZ2FyZHMsCj4gWWFubiBFLiBNT1JJTi4KPgo+ID4gIFBZVEhPTl9QWURBTlRJQ19D
T1JFX1NFVFVQX1RZUEUgPSBtYXR1cmluCj4gPiAgUFlUSE9OX1BZREFOVElDX0NPUkVfTElDRU5T
RSA9IE1JVAo+ID4gIFBZVEhPTl9QWURBTlRJQ19DT1JFX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNF
Cj4gPiAtLQo+ID4gMi4zNC4xCj4gPgo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiA+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiA+IGJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCj4gPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QKPgo+IC0tCj4gLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0t
LS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KPiB8ICBZ
YW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBF
cmljcycgY29uc3BpcmFjeTogfAo+IHwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2ln
bmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8Cj4gfCArMzMgNTYx
IDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAg
VGhlcmUgaXMgbm8gIHwKPiB8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8
IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAo+ICctLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0t
LS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
