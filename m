Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D187CCD1296
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 08:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EC8360D79;
	Wed, 10 Apr 2024 08:00:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vNVkkWAUXM3o; Wed, 10 Apr 2024 08:00:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3B106076C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3B106076C;
	Wed, 10 Apr 2024 08:00:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 19E581BF25B
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 08:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0740E81E21
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 08:00:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fFHuo1JwEWFU for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 08:00:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=gero.schwaericke@grandcentrix.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8E3A9813CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E3A9813CF
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E3A9813CF
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 08:00:10 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a51ddc783e3so361804166b.0
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 01:00:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712736008; x=1713340808;
 h=content-transfer-encoding:content-disposition:in-reply-to
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r6dfBweCzN2Y/FT4FDWvrNNZTwkAJo6tS5f02LGL0no=;
 b=Xx3diEp+UCndoQfTf43Psvf2yLBHwKzV8zcZDgJocgahE1AseFgnCQcUplne8GTCTp
 9DS35gnqzCL0SljRGk6lGbbGihqea1kgOlzd7+bHjBYs8I6Dgb3AeNmve3p/QFq8yaj6
 n399FgaUfisqBZjeufcLx0XZizrCOlu8XG+h9pcuIaK6XGCCj8qUFGYefiqlywTGy38l
 qZ3ko2rAJ2+RNHRD0vMZHvmzlMWIHC/Ii9FTGA/t5oCanueYeZn/EZ7t3bHri+SENmZo
 v6430PkqNbJwdzJArA+7rDX/yqbLLHPOYXoG790iU3TiX1MQkH/yTVo6+YGenapM3rD5
 6grA==
X-Gm-Message-State: AOJu0YwDhAxndnDQ0BIo+dQXwrJe1Er0xQqMDtL/8dHLOesbkmfZOegG
 jx7IUOARlDyJjMXqDNEbnDrbGRnz3tjGPBBl8W6p4ilCt4tXxGjkJUwcfh7qnAVvGT58x1dsEY1
 QdHoGwU4W/l8RrSDwC58R0vJvMdadwzcTfj445+Lr9YSaDZ3WGp3Zc7jcBBAmIMEl
X-Google-Smtp-Source: AGHT+IFWMM9w/GPw4Pl+Gy7fWAJ2strxxhPRI+EZHZIOlPkQ/Ng6erkVBy157o6Cj6Vdnc87pHISgw==
X-Received: by 2002:a17:906:4f17:b0:a52:140c:571b with SMTP id
 t23-20020a1709064f1700b00a52140c571bmr226161eju.3.1712736008229; 
 Wed, 10 Apr 2024 01:00:08 -0700 (PDT)
Received: from theia ([2a02:8109:8abb:b200:a528:deac:9df7:50bb])
 by smtp.gmail.com with ESMTPSA id
 hd6-20020a170907968600b00a4e7d03e995sm6614147ejc.45.2024.04.10.01.00.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 01:00:08 -0700 (PDT)
Date: Wed, 10 Apr 2024 10:00:06 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240410080006.GA1545957@theia>
Mail-Followup-To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240407103512.1112712-1-romain.naour@smile.fr>
 <58478029-3c92-497e-bb31-4a1f1119afd4@mind.be>
 <1ec8e03b-f5b7-41cf-bfe4-17f99a871e93@mind.be>
 <0ea49f2c-fe1e-4a44-aaf8-90120ef6f9fd@smile.fr>
 <CABGWkvrVr-AY-huV-tijtt48eYtB4nSQ==gZ1VvnWy4SSyYXyQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABGWkvrVr-AY-huV-tijtt48eYtB4nSQ==gZ1VvnWy4SSyYXyQ@mail.gmail.com>
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grandcentrix.net; s=google; t=1712736008; x=1713340808; darn=buildroot.org; 
 h=content-transfer-encoding:content-disposition:in-reply-to
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=r6dfBweCzN2Y/FT4FDWvrNNZTwkAJo6tS5f02LGL0no=;
 b=NhwoJ5mYAJgeALwjoQRx5e9vpRcomzlUXlTBAmnPvJ8uncLsm2/dT5n4OH0Eo8jZ78
 B6t2kvXMOQw65XxntZqIVJzkim+LbQDYU27A7g5RUcCB1GKBvoUkVd7M6fEMGe6evZMF
 Tsa+wEwc/lGSOMQsGT8XY8sqls64bmTFD1+Cz4KkNx6Sl1zm0tvOfPCKt9lbdDBLFcT6
 nTSRDJ5HSzQ3yGljOQThQkwOMCuQLLLxq4cGZT8XJWbgNzIflSyRnJIKYlL5sDiQjgpQ
 yrsQIxKAhMSuayyfvxN0ooKE/pYSOKfmwTgOaU4yL/vLTg/DkgIUSaBbArdig7rSvBsq
 QhUQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grandcentrix.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grandcentrix.net header.i=@grandcentrix.net
 header.a=rsa-sha256 header.s=google header.b=NhwoJ5mY
Subject: Re: [Buildroot] [PATCH v12 00/16] Add support for AM62x-SK HS-FS
 devices
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
From: =?utf-8?q?Gero_Schw=C3=A4ricke_via_buildroot?= <buildroot@buildroot.org>
Reply-To: Gero =?utf-8?Q?Schw=C3=A4ricke?= <gero.schwaericke@grandcentrix.net>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCBBcHIgMTAsIDIwMjQgYXQgMDk6MzQ6MTZBTSArMDIwMCwgRGFyaW8gQmluYWNjaGkg
d3JvdGU6Cj4gSGkgUm9tYWluLCBBbGwKPiAKPiBPbiBUdWUsIEFwciA5LCAyMDI0IGF0IDExOjE3
4oCvUE0gUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+IHdyb3RlOgo+ID4KPiA+
IEhlbGxvIEFybm91dCwgQWxsLApbLi4uXQo+ID4KPiA+IFRoYW5rcywgdGhlIHNlcmllcyBpcyBt
ZXJnZWQuCj4gPgo+ID4gVGhhbmtzIHRvIERhcmlvIGFuZCBNaWNoYWVsIGZvciB0aGUgaW5pdGlh
bCB3b3JrIG9uIHRoZSBIUy1GUyB0b3BpYyEKPiA+Cj4gPiBUaGUgaW5pdGlhbCBzZXJpZXMgc2hv
d2VkIHRoYXQgaXQgd2FzIG5lY2Vzc2FyeSB0byByZXdvcmsgaGVhdmlseSB0aGUgVEkgSzMgU29D
Cj4gPiByZWxhdGVkIHBhY2thZ2VzIGluIEJ1aWxkcm9vdC4gVGhpcyB3YXMgdGhlIG9wcG9ydGlu
aXR5IHRvIGFudGljaXBhdGUgb24gdGhlCj4gPiBhZGRpdGlvbiBvZiBuZXcgVEkgSzMgU29DIHN1
cHBvcnQuCj4gPgo+ID4gVGhhbmtzIHRvIEFuZHJlYXMgYW5kIEJyeWFuIGZyb20gVEkgZm9yIHRo
ZSByZXZpZXcgYW5kIGZpbmUgZGV0YWlscyBhYm91dCBUSSBLMwo+ID4gU29DIGZhbWlsbHkgYW5k
IHRoZSBydW50aW1lIHRlc3RpbmcuCj4gPgo+ID4gVGhhbmtzIHRvIGFsbCB0ZXN0ZXJzIGFuZCBy
ZXZpZXdlcnMuCj4gCj4gSSB0aGluayBteSB0d28gcGF0Y2hlcyBmb3IgdmVyc2lvbiAxMCB3ZXJl
IHVsdGltYXRlbHkgbG9zdDoKPiAKPiBbdjEwLDA1LzEyXSBwYWNrYWdlL3RpLWszOiBkaXNhYmxl
IEhTLUZTIGZvciBBTTY1IFNPQwo+IFt2MTAsMDQvMTJdIHBhY2thZ2UvdGktazM6IG1vdmUgVElf
SzNfe1NFQ1RZUEUsIFNPQ30gb3V0IG9mIHRoZSBpbWFnZS1nZW4gc2NvcGUKPiAKPiBTcGVjaWZp
Y2FsbHksIHBhdGNoIDQgaXMgbmVjZXNzYXJ5IGZvciB0aGUgcHJvcGVyIGNyZWF0aW9uIG9mIHRo
ZQo+IGltYWdlLiBIYXMgdmVyc2lvbiAxMiBhY3R1YWxseSBiZWVuIHRlc3RlZCBieSBhbnlvbmU/
Cj4gSSBjYW4gYXNzdXJlIHlvdSB2ZXJzaW9uIDEwIGhhcyBiZWVuLgo+IAo+IEFkZGl0aW9uYWxs
eSwgaXQgc2VlbXMgdGhhdCBwYXRjaAo+IFt2MTAsMDIvMTJdIGJvb3QvdGktazMtcjUtbG9hZGVy
OiBzZXQgYmlubWFuIGVudmlyb25tZW50Cj4gaGFzIGJlZW4gaW5jb3Jwb3JhdGVkIGludG8geW91
ciBwYXRjaCAiYm9vdC90aS1rMy1yNS1sb2FkZXI6IHJlbW92ZQo+IEJSMl9UQVJHRVRfVElfSzNf
UjVfTE9BREVSX1VTRV9CSU5NQU4iCj4gYW5kIEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkuCj4gCj4g
VGhhbmtzIGFuZCByZWdhcmRzLAo+IERhcmlvCgpIaSBEYXJpbywKCkkgY2FuIGNvbmZpcm0gdGhh
dCBzb21ldGhpbmcgaXMgYW1pc3MsIG1heWJlIGl0IHdvdWxkIGhhdmUgYmVlbiBiZXR0ZXIKdG8g
YXdhaXQgbW9yZSB0ZXN0cyB3aXRoIHBhdGNoIFYxMi4gQXQgbGVhc3QgbXkgY3VycmVudCB0ZXN0
IG9mCnRpX2FtNjJ4X3NrX2RlZmNvbmZpZyBvbiBtYXN0ZXIgZmFpbGVkIHRvIGJvb3Q6CgogIFUt
Qm9vdCBTUEwgMjAyNC4wMSAoQXByIDEwIDIwMjQgLSAwOTozMjoxNyArMDIwMCkKICBrM19zeXN0
ZW1fY29udHJvbGxlciBzeXNjdHJsZXI6IGszX3N5c2N0cmxlcl9zdGFydDogQm9vdCBOb3RpZmlj
YXRpb24gcmVzcG9uc2UgZmFpbGVkLiByZXQgPSAtMTEwCiAgRmlybXdhcmUgaW5pdCBmYWlsZWQg
b24gcnByb2MgKC0xMTApCgogIHJlc2V0dGluZyAuLi4KCkkgdGVzdGVkIHdpdGggQU02MnggU0sg
RVZNIEUzLiBJJ2xsIHRyeSB0byBhcHBseSB5b3VyIHR3byBtaXNzaW5nCnBhdGNoZXMgYW5kIHRl
c3QgYWdhaW4uCgpCZXN0LApHZXJvCgo+ID4gQmVzdCByZWdhcmRzLAo+ID4gUm9tYWluCj4gPgpb
Li4uXQoKLS0gCgoKCuKAk+KAk+KAkwoKCmdyYW5kY2VudHJpeCBHbWJIIHwgQSBWb2RhZm9uZSBD
b21wYW55wqDCt8KgSG9sem1hcmt0IDHCoMK3wqA1MDY3NiAKKkNvbG9nbmUqwqB8wqBQaG9lbml4
c2Vlc3RyYXNzZSAxOMKgwrfCoDQ0MjYzICpEb3J0bXVuZCrCoMK3wqBHZXJtYW55CnzCoGluIAo8
aHR0cHM6Ly93d3cubGlua2VkaW4uY29tL2NvbXBhbnkvZ3JhbmRjZW50cml4PiB8IHBob25lOiAr
NDktMjIxLTY3Ny04NjAtMCAKfMKgZW1haWw6IGhlbGxvQGdyYW5kY2VudHJpeC5uZXQgPG1haWx0
bzpoZWxsb0BncmFuZGNlbnRyaXgubmV0PgoKCmdyYW5kY2VudHJpeCBjYXJlcyBhYm91dMKgcHJp
dmFjeSAKPGh0dHBzOi8vZ3JhbmRjZW50cml4Lm5ldC9kZS9wYWdlcy9wcml2YWN5bWFpbC8+CgpB
bXRzZ2VyaWNodCBLw7ZsbiB8IEhSQiDCoAo3MDExOSB8IEdlc2Now6RmdHNmw7xocmVyOiBNLiBL
csO2bWVyLMKgIFIuIEjDpG5lbCB8IFVTdC4tSWROci46IERFMjY2MzMzOTY5CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
