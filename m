Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE973C2BA18
	for <buildroot@archiver.kernel.org>; Sun, 23 Jun 2024 07:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A8CD81393;
	Sun, 23 Jun 2024 07:40:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XwFNlvPohoNM; Sun, 23 Jun 2024 07:40:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 787DD81773
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 787DD81773;
	Sun, 23 Jun 2024 07:40:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A8A701BF59E
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 07:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9509E406BA
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 07:40:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id coCiqZAg1khK for <buildroot@lists.busybox.net>;
 Sun, 23 Jun 2024 07:40:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A8936406B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8936406B9
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A8936406B9
 for <buildroot@buildroot.org>; Sun, 23 Jun 2024 07:40:41 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-52cdebf9f53so766077e87.2
 for <buildroot@buildroot.org>; Sun, 23 Jun 2024 00:40:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719128439; x=1719733239;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=1pSlDhlPiEWJ9d3+yvURJup5moqja/lleIv2pP/w1FA=;
 b=exzr/j88eZ+IraC3zcnOxIQlOSw/eQimmrCEg0lHV3EuLpSpdHq777A7Y4FByiNVhW
 ZEjutpDGNaPVwehFZf5Nz/uYBIdW3W2MXb+eI5EigBxPWW50EJQ/1fPlBtz3zaJg+gi1
 izIN7imFP3WOKbrrljugs4uCIqt7jpCXphWXHw6/0+n8Cl/ncgKc3uSwtQo1ZzhDo+h5
 BDyhjaLLoOPs1nqlD0cHjBi9pAgM65cAtc60B87eF6Y0tjP/AACS8XJTpDkHn/+IPK9w
 vjJ+anj2A8D2uG+iot8LJ9KTvWpwDtsyYwvcFP8JVpkkuQFO/S5a1gSzXbzHX/l4ZnoJ
 xV1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6gdA1r0FYVNACxaBOmH5/CEBFyXOrSTHvhQ27rUM6CN3YNl1G2ogXYEE7kUwERi7kUlCccAtEC9yamfbseBxsCIbG6Wbjlg==
X-Gm-Message-State: AOJu0YzWvjucgLdvFtNWZoWSqfG2lLzUzHQwJWuvibk7hgPeBhMl2aVq
 6UBT0CAWsVwvp7rULljfw2CGVqYON+yZXk3VoRF8SfWmudtz1t+0B36Wu/rFtaNUbw23f5baBbm
 s
X-Google-Smtp-Source: AGHT+IHqnDXGRmmc74KbnNCYogqil8YhmB/zFrlGWbXVq7Qi9/QSWSZZW94/+magx3Uafrg2OsScaQ==
X-Received: by 2002:a19:9156:0:b0:52c:d9a3:58b0 with SMTP id
 2adb3069b0e04-52ce064f3f8mr1151631e87.36.1719128438897; 
 Sun, 23 Jun 2024 00:40:38 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3663a8c789esm6683167f8f.91.2024.06.23.00.40.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jun 2024 00:40:38 -0700 (PDT)
Message-ID: <18fb6f1e-c3a8-44f3-aeee-cfff389c9139@mind.be>
Date: Fri, 21 Jun 2024 23:10:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>,
 buildroot@buildroot.org
References: <20240527085328.11981-1-sebastien.szymanski@armadeus.com>
In-Reply-To: <20240527085328.11981-1-sebastien.szymanski@armadeus.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719128439; x=1719733239; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1pSlDhlPiEWJ9d3+yvURJup5moqja/lleIv2pP/w1FA=;
 b=c6W8K+HaRc7cRrbxXxW+BKYT9Fe+bBixmn/l4hjJYvWEbQl3X60I6E1lqP6Dl3dx6l
 G00HmyOlYT3l+ARUrb3vKlXacqFAapd6ja2X4Hrkmh2wxBVBsUdq1r6GHKoj/nmDAlnk
 rLfw7C7EEUKIgr77yjFtKJDal2Yp6NDO/RohYhVr9zsiLuHFDYN+WZGX0Ix4UAvD4yl3
 htczEwQ+opgneExB+TwR4rDLDRWZRBbLxuXj6IUlZzCMYn2dyRv04qplgpJKBUXdIbVz
 4R7R/Z/fN/F5A/VXrOfd3WFYP5d+xxBW7DDJpsHhadc5dTAGBqSB4S6Q/WAA1NyB8ezi
 lrvw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=c6W8K+Ha
Subject: Re: [Buildroot] [PATCH 1/1] package/rt-tests: bump version to 2.7
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyNy8wNS8yMDI0IDEwOjUzLCBTw6liYXN0aWVuIFN6eW1hbnNraSB3cm90ZToKPiBTaWdu
ZWQtb2ZmLWJ5OiBTw6liYXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1h
ZGV1cy5jb20+CgogIEFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgogIFJlZ2FyZHMsCiAgQXJu
b3V0Cgo+IC0tLQo+ICAgcGFja2FnZS9ydC10ZXN0cy9ydC10ZXN0cy5oYXNoIHwgMiArLQo+ICAg
cGFja2FnZS9ydC10ZXN0cy9ydC10ZXN0cy5tayAgIHwgMiArLQo+ICAgMiBmaWxlcyBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvcnQtdGVzdHMvcnQtdGVzdHMuaGFzaCBiL3BhY2thZ2UvcnQtdGVzdHMvcnQtdGVzdHMuaGFz
aAo+IGluZGV4IDAxNzQ0N2JjZTY2NS4uOTY4MmZkZTQwNjE3IDEwMDY0NAo+IC0tLSBhL3BhY2th
Z2UvcnQtdGVzdHMvcnQtdGVzdHMuaGFzaAo+ICsrKyBiL3BhY2thZ2UvcnQtdGVzdHMvcnQtdGVz
dHMuaGFzaAo+IEBAIC0xLDQgKzEsNCBAQAo+ICAgIyBGcm9tIGh0dHBzOi8vbWlycm9ycy5lZGdl
Lmtlcm5lbC5vcmcvcHViL2xpbnV4L3V0aWxzL3J0LXRlc3RzL3NoYTI1NnN1bXMuYXNjCj4gLXNo
YTI1NiAgNzYxZDEwYzRiN2Y1YjI4NDAwZjBjMzAxZmUwMTcxZWFhNzRmMzQ3ZGY2NGNiMzU5MjEw
MjU0YjhlNmFmZjE5ZiAgcnQtdGVzdHMtMi42LnRhci54ego+ICtzaGEyNTYgIDBlNWIyZmJjOThj
ZWI3ODZiZDExM2M5YTMwZjAzODhkODg0YjJkOGM0YmQ2YzU2OWQ5NGFlOGIwMGE3MDJiYmIgIHJ0
LXRlc3RzLTIuNy50YXIueHoKPiAgICMgbG9jYWxseSBjb21wdXRlZCBoYXNoCj4gICBzaGEyNTYg
IGFiMTVmZDUyNmJkOGRkMThhOWU3N2ViYzEzOTY1NmJmNGQzM2U5N2ZjNzIzOGNkMTFiZjYwZTJi
OWI4NjY2YzYgIENPUFlJTkcKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9ydC10ZXN0cy9ydC10ZXN0
cy5tayBiL3BhY2thZ2UvcnQtdGVzdHMvcnQtdGVzdHMubWsKPiBpbmRleCA0YjFhYTMxNzk2NDcu
LjQxOTI2MGRiM2M4ZCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3J0LXRlc3RzL3J0LXRlc3RzLm1r
Cj4gKysrIGIvcGFja2FnZS9ydC10ZXN0cy9ydC10ZXN0cy5tawo+IEBAIC02LDcgKzYsNyBAQAo+
ICAgCj4gICBSVF9URVNUU19TSVRFID0gJChCUjJfS0VSTkVMX01JUlJPUikvbGludXgvdXRpbHMv
cnQtdGVzdHMKPiAgIFJUX1RFU1RTX1NPVVJDRSA9IHJ0LXRlc3RzLSQoUlRfVEVTVFNfVkVSU0lP
TikudGFyLnh6Cj4gLVJUX1RFU1RTX1ZFUlNJT04gPSAyLjYKPiArUlRfVEVTVFNfVkVSU0lPTiA9
IDIuNwo+ICAgUlRfVEVTVFNfTElDRU5TRSA9IEdQTC0yLjArCj4gICBSVF9URVNUU19MSUNFTlNF
X0ZJTEVTID0gQ09QWUlORwo+ICAgCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
