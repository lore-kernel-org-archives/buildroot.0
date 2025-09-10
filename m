Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59772CA0FED
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 20:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BC39841E3;
	Wed, 10 Sep 2025 20:33:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pw_6V6UK5pKt; Wed, 10 Sep 2025 20:33:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92570842AC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92570842AC;
	Wed, 10 Sep 2025 20:33:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F1FBF443
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 20:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D86CF611B3
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 20:33:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p0oakQDONFqj for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 20:33:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8B63260A7C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B63260A7C
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8B63260A7C
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 20:33:40 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-55f753ec672so8290233e87.2
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 13:33:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757536418; x=1758141218;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bZ/pfL0zOIYu020oJIhXwsIDl5S69Kk1pdE0wTsi5O8=;
 b=WmYw4kJ4YFk4CGHjzjqqcXr4u1lXZdhYP7Dghb7DKrRXpsDRKU3YlhUNpjpgfopsa0
 u/v4RlOWviI5IiJI2xnCvWIuuPVpqdz4o7A9BEsGe0lIml9DiotacZkMgIwJlIP7f8NM
 QRBt+DWSEc/lmifv1hm29S2pDL887jKUVfyS5TBPDbxnsremf1Ike0/lCkSFLhiSD41i
 aK69whJ4wTDVGWl6BGt1sB45vx58RcQLBkiYxUe+0qjGOY9jg5j6IAc+IRA36I3HJ1VO
 El7cr8TKEfYQ8F8S5yZFFVDRzCNTVY60AKl/Wy9zOrtNCJfCjhSlGXouI7D32C9SyDgp
 rzXQ==
X-Gm-Message-State: AOJu0YwPpWDMMjEepl90fO+z0DrAoJ4hfBBw5T6u4HVdAQP5FY9uKz7C
 4ZAwzzNProEsYj4F+SpFJ/jyGHMx/5ThwagIXxLpNT9wd2scpuoP8fHo9tdbOUHhbWJhEdGht9A
 aQ3ctNY89Vw==
X-Gm-Gg: ASbGncvrTLEtOJs0Ma3vklE+nUWKFe9pINNapFlmdCHYxM28lE3tdsPPGTPEh+SyE3P
 gRY3Bpi+sPsLTMV0mK+0in4vy/2zBvR0ReGlpntoib61YWALfoORg+QYF/a1XSgSIrwXRn7ORW7
 8P3A/YjLiPudRC/vcfIQOPf1ampYVu/QWsOGKlhP/tAwYFERSD2BAcf0MUvGnKXpxETkFiUdZLM
 ZDZIbJ6eOPNFTd92LZdgHmUphkQoXxFVrOKsuVZsE+70HwLXzntpUXLfxR+gLQfVMhT3z4MEC8+
 E3GV2vUFvyY/OVmWnFhCk7HlO4Hi7dZInART6ye0ON9i0m3EIJG4u1yqupYv4+YtIU9imynpGoa
 K//f1wVPx2cNuYaZ7I82MWFa4oziQx48ZkcP5JT+oZRkImMwiI+U313CtqISaFSg1QVa6vXHoar
 7z
X-Google-Smtp-Source: AGHT+IEthQVF1ORFsWiUGOTpdCLc6MrLVclNF3MYr3gXLI7ilqKwpbl5LfAh8Tnmg628DamXPCJk6w==
X-Received: by 2002:a05:6512:3a8b:b0:55f:6a68:c44a with SMTP id
 2adb3069b0e04-5625eb94e96mr5260009e87.2.1757536417772; 
 Wed, 10 Sep 2025 13:33:37 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com.
 [209.85.208.178]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56db89110c4sm78710e87.5.2025.09.10.13.33.36
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 13:33:37 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-336cdca64e6so285421fa.0
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 13:33:36 -0700 (PDT)
X-Received: by 2002:a05:6512:3b82:b0:55c:e752:e9c6 with SMTP id
 2adb3069b0e04-5625eb94f96mr5817889e87.10.1757536416522; Wed, 10 Sep 2025
 13:33:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250910183458.1288165-1-james.hilliard1@gmail.com>
In-Reply-To: <20250910183458.1288165-1-james.hilliard1@gmail.com>
Date: Wed, 10 Sep 2025 13:33:24 -0700
X-Gmail-Original-Message-ID: <CA+h8R2ozbY7zf0=x+gP=bgruLYOK7qW1Ex5Sa0x_h_gaqqHrwg@mail.gmail.com>
X-Gm-Features: Ac12FXyW5AzQr2EP0gfFxA9GGKPxqDvlBdY9we5FFVwQcZu9OPZhq4tnYv3GIY8
Message-ID: <CA+h8R2ozbY7zf0=x+gP=bgruLYOK7qW1Ex5Sa0x_h_gaqqHrwg@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Thomas Perale <thomas.perale@mind.be>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1757536418; x=1758141218; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bZ/pfL0zOIYu020oJIhXwsIDl5S69Kk1pdE0wTsi5O8=;
 b=RcV/TDD3DYFrn6SSW5rf9ncAm7C1LmRzMVbawJpNalTjh+qi6Ogz3CryFUMVDA2UER
 TOBhqvWjoRSjI6QwicsVIyhyWceDTQpwCh39GFhSGoPZuhOb9/TS/Hg6NGUlACO/oJiC
 hgbhDTOUs6q8/5bWytYQfMtTtw6UStbV7v9J2G2ByXZYM1JVulImXcZN5KfVYt6NwpQw
 GYEeAQ67g+DpD56ML+SfMjSXI2UX6mroFDXv0m99ZiGbOETsnwGRoYlJQZkfeGgqgFk0
 j/uBsRy9RXcbrCwjuaWsom9F2+flQRD/7cRLiSW76kyqMPIW614cvPZlIit7DP2iGc8S
 1GHA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=RcV/TDD3
Subject: Re: [Buildroot] [PATCH 1/2] package/go: bump to version 1.25.1
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

SGkgSmFtZXMsCgpPbiBXZWQsIFNlcCAxMCwgMjAyNSBhdCAxMTozNOKAr0FNIEphbWVzIEhpbGxp
YXJkCjxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiB3cm90ZToKPgo+IEJ1aWxkaW5nIEdvIDEu
MjQgYW5kIGxhdGVyIHJlcXVpcmVzIEdvIDEuMjIuNiBvciBsYXRlciBmb3IgYm9vdHN0cmFwLgo+
Cj4gVG8gc3VwcG9ydCB0aGlzIHdlIHVzZSBvdXIgcHJldmlvdXMgR28gdmVyc2lvbiAxLjIzLjEy
IGFzIHRoZSB2ZXJzaW9uCj4gZm9yIGdvLWJvb3RzdHJhcC1zdGFnZTQgYW5kIGhhdmUgdGhlIGJ1
aWxkIGZvciBHbyAxLjI1LjEgZGVwZW5kIG9uCj4gZ28tYm9vdHN0cmFwLXN0YWdlNC4KPgo+IEdv
IHZlcnNpb24gMS4yMy4xMiBpcyB0aGUgbGF0ZXN0IGdvIHZlcnNpb24gd2UgY2FuIGJ1aWxkIHVz
aW5nCj4gZ28tYm9vdHN0cmFwLXN0YWdlMy4KPgo+IFRoZSBwYWNrYWdlIGJ1aWxkIGZvciBnby1i
b290c3RyYXAtc3RhZ2U0IGlmIGVmZmVjdGl2ZWx5IGlkZW50aWNhbCB0bwo+IGdvLWJvb3RzdHJh
cC1zdGFnZTMgd2l0aCBvbmx5IHRoZSBHbyB2ZXJzaW9uIGFuZCBzdGFnZSBudW1iZXIgY2hhbmdl
ZC4KPgo+IFNpZ25lZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21h
aWwuY29tPgo+IC0tLQo+ICBwYWNrYWdlL2dvL0NvbmZpZy5pbi5ob3N0ICAgICAgICAgICAgICAg
ICAgICAgfCAgOSArLS0KPiAgLi4ubGR2Y3MtZmFsc2Utd2hlbi1idWlsZGluZy1nby1ib290c3Ry
LnBhdGNoIHwgNzEgKysrKysrKysrKysrKysrKysrKwo+ICBwYWNrYWdlL2dvL2dvLWJvb3RzdHJh
cC1zdGFnZTQvQ29uZmlnLmluLmhvc3QgfCAgNCArKwo+ICAuLi4vZ28tYm9vdHN0cmFwLXN0YWdl
NC5oYXNoICAgICAgICAgICAgICAgICAgfCAgMyArCj4gIC4uLi9nby1ib290c3RyYXAtc3RhZ2U0
Lm1rICAgICAgICAgICAgICAgICAgICB8IDU0ICsrKysrKysrKysrKysrCj4gIHBhY2thZ2UvZ28v
Z28tc3JjL2dvLXNyYy5tayAgICAgICAgICAgICAgICAgICB8ICA0ICstCj4gIHBhY2thZ2UvZ28v
Z28uaGFzaCAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDE0ICsrLS0KPiAgcGFja2FnZS9n
by9nby5tayAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgOCBmaWxlcyBj
aGFuZ2VkLCAxNDcgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBwYWNrYWdlL2dvL2dvLWJvb3RzdHJhcC1zdGFnZTQvMDAwMS1jbWQtZGlzdC1zZXQt
YnVpbGR2Y3MtZmFsc2Utd2hlbi1idWlsZGluZy1nby1ib290c3RyLnBhdGNoCj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBwYWNrYWdlL2dvL2dvLWJvb3RzdHJhcC1zdGFnZTQvQ29uZmlnLmluLmhvc3QK
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvZ28vZ28tYm9vdHN0cmFwLXN0YWdlNC9nby1i
b290c3RyYXAtc3RhZ2U0Lmhhc2gKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvZ28vZ28t
Ym9vdHN0cmFwLXN0YWdlNC9nby1ib290c3RyYXAtc3RhZ2U0Lm1rCgpJIGp1c3Qgc3VibWl0dGVk
IGEgZGlmZmVyZW50IHNlcmllcyB0byBkbyB0aGUgc2FtZSB0aGluZywgc29ycnksIEkKZGlkbid0
IHNlZSB5b3VycyB1bnRpbCBJIGhhZCBhbHJlYWR5IHN1Ym1pdHRlZC4KCkl0J3MgYSBiaXQgZGlm
ZmVyZW50IHRob3VnaCwgc2VwYXJhdGUgY29tbWl0cyBmb3IgYWRkaW5nIHN0YWdlNCBhbmQKZ28x
LjI0IGFuZCBnbyAxLjI1IGZvciBiZXR0ZXIgYmlzZWN0LgoKV2hhdCBkbyB5b3UgdGhpbms/Cgox
LiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIw
MjUwOTEwMjAyMTM4LjEzNjQ4LTEtY2hyaXN0aWFuQGFwZXJ0dXJlLnVzLwoyLiBodHRwczovL3Bh
dGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjUwOTEwMjAyMTM4
LjEzNjQ4LTItY2hyaXN0aWFuQGFwZXJ0dXJlLnVzLwozLiBodHRwczovL3BhdGNod29yay5vemxh
YnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjUwOTEwMjAyMTM4LjEzNjQ4LTMtY2hy
aXN0aWFuQGFwZXJ0dXJlLnVzLwoKSXQncyBhY3R1YWxseSBhbm90aGVyIHJldmlzaW9uIG9mIGEg
dmVyeSBvbGQgc2VyaWVzIEkgc3VibWl0dGVkIGZvciBnbzEuMjQuCgpUaGFua3MsCkNocmlzdGlh
biBTdGV3YXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
