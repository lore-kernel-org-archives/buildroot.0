Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C795C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 19:57:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8D8D40174;
	Wed,  7 Feb 2024 19:57:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pl-YL1ogqdpZ; Wed,  7 Feb 2024 19:57:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D152A410D4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D152A410D4;
	Wed,  7 Feb 2024 19:57:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 58C211BF350
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 19:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53BE36147D
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 19:57:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GHcQfJCX3Wkj for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 19:57:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::831; helo=mail-qt1-x831.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 424186147E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 424186147E
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 424186147E
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 19:57:08 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id
 d75a77b69052e-42a4516ec46so2094301cf.0
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 11:57:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707335827; x=1707940627;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oiiVRQcNELhhboviiGW3MUSh2TVAdluDqvQb29D90AY=;
 b=k9RO5i3mHXKn1O1LK6L4o8eMOetVn6ohUlfMgMQfGxs482fii0ENOqWT913o0+tsNi
 N7Cg2C5/LAsDqP1QweHxrU4e4T/1oxT4x/GArBVpUTmzJIqboZDHjHwm6qBp1aa5ov1h
 epB2CMJGda5N9liRRq1C9NS0iHzvi6L4Bs5+l8FY1kvINUYyvDnDomiNre2Gj8ghUjij
 KjACWG3MwQNFMCQHBqNIq9Lt+SFfeGgjxiTU2okQtP0YqiHemfRAtVeMgOMOGM9a9hQ7
 3ubleoR6xPjSrzf/AINJWO3JMgR5vu3jkMa3EK9Q3KPYA5CfaiNcPxYDGVgUd0Qkvsvo
 NxzQ==
X-Gm-Message-State: AOJu0YytYPe/iM4MGmfbLlcT/8yg//U/bCdxNCjjHVn4Glapqtsp+GJz
 hsAuleX31WYJpwtSNugAOA7RUqJEz33qvkZRmFbJLuY7lV0avCGRSnuXowD9KsB8KzujwbpRHW3
 39lFLcgz4TsxWlJfbjMIqy8lzD88=
X-Google-Smtp-Source: AGHT+IH34rHjMWYIAwaqGXTaFUzeJKcebPfKyvjMjccXHPu23pX11DiD4s0nwiRcko7DCtCUsb4I/hYvAyI/o+GXQTA=
X-Received: by 2002:a05:622a:1345:b0:42c:768:7b12 with SMTP id
 w5-20020a05622a134500b0042c07687b12mr734411qtk.22.1707335826934; Wed, 07 Feb
 2024 11:57:06 -0800 (PST)
MIME-Version: 1.0
References: <20231126180840.2081945-1-james.hilliard1@gmail.com>
 <20231126180840.2081945-3-james.hilliard1@gmail.com>
 <9dcac81b-522c-4ea3-80ed-7d9544cea12f@bubu1.eu>
 <20240207112058.37534f3d@windsurf>
In-Reply-To: <20240207112058.37534f3d@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 7 Feb 2024 12:56:55 -0700
Message-ID: <CADvTj4oDK8UDwAF5oYkULrLKFfZnDMHhk_yH+u3jANXEPdjdOA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707335827; x=1707940627; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oiiVRQcNELhhboviiGW3MUSh2TVAdluDqvQb29D90AY=;
 b=nKeC5/U1at3tEX04YPlK6HrDRy7vqaN6B5F+pHpFBAqvP5/vwDDjkSlP0nYsXkC980
 ef6sWrSBuM1eZvjNIwcV+r1ELL/PCnZAvLVsGQDHOeMYfga4zGnqMVQmnGC3Y97FjcwB
 uNd0VDWonv7XslADVJNL92HE7Fg49DAYB93nURBpZGLME77xvBgQzYAVv+Y0ceh4PNHU
 hT5VXUJMaUI1jhTpB3DGJ/aYhUHdR2mUD82MC/T1hQZWQySh96+E6je8CuCeDkWOVu3r
 ZoFBF6Yw+E3EqYl+43ZB1/VlUD0vQsVc8N/Jm8/MvvclC6kRr8DXA26MT+heVzTTf/Jl
 iv5A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nKeC5/U1
Subject: Re: [Buildroot] [PATCH v6 3/5] package/python-msgpack: add host
 cython dependency
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
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCBGZWIgNywgMjAyNCBhdCAzOjIx4oCvQU0gVGhvbWFzIFBldGF6em9uaQo8dGhvbWFz
LnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIDcgRmViIDIwMjQgMTE6
MTY6MjcgKzAxMDAKPiBNYXJjdXMgSG9mZm1hbm4gPGJ1aWxkcm9vdEBidWJ1MS5ldT4gd3JvdGU6
Cj4KPiA+IFVuZm9ydHVuYXRlbHkgbXNncGFjayAxLjAuNyB3aGljaCBidWlsZHJvb3QgaGFzIG5v
dyByZXF1aXJlcyBjeXRob24gfjMuMAo+ID4gWzFdLCB3aGljaCB3ZSBkb24ndCBoYXZlIHlldC4g
Y3l0aG9uIDMuMCBhbmQgY3l0aG9uIDAuMjkueCAod2hpY2ggdXZsb29wCj4gPiBzdGlsbCB1c2Vz
KSBhbHNvIHNlZW0gdG8gYmUgc3RpbGwgZGV2ZWxvcGVkIGluIHBhcmFsbGVsLiBTbyBtYXliZSB3
ZQo+ID4gbmVlZCBib3RoIGFzIGJ1aWxkIGhvc3QgcGFja2FnZXM/IE9yIGRvIHlvdSBzZWUgYW5v
dGhlciBzb2x1dGlvbj8KClRoYXQncyBhbm5veWluZywgbWF5YmUgdGhlIGVhc2llc3Qgb3B0aW9u
IGlzIHRvIGRvd25ncmFkZSBtc2dwYWNrIGZvciBub3cKdW50aWwgZXZlcnl0aGluZyBzdXBwb3J0
cyBjeXRob24gMy4wPwoKPgo+IElmIHdlIHdlcmUgdG8gaGF2ZSBib3RoIGluIHBhcmFsbGVsLCB0
aGVuIHRoZSBiaWcgcXVlc3Rpb24gaXMgd2hldGhlcgo+IGl0IGlzIHBvc3NpYmxlIHRvIGluc3Rh
bGwgdGhlbSBib3RoIGluIHBhcmFsbGVsIHdpdGhvdXQgdGhlbQo+IGNvbmZsaWN0aW5nIHdpdGgg
ZWFjaCBvdGhlci4KClNlZW1zIHRyaWNreS4KCj4KPiBUaG9tYXMKPiAtLQo+IFRob21hcyBQZXRh
enpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2Vy
bmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwo+IGh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
