Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000D0D5B144
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 20:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBF3380DB3;
	Mon, 28 Oct 2024 20:21:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Qq2DdeFWBv5; Mon, 28 Oct 2024 20:21:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3DF580DEA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3DF580DEA;
	Mon, 28 Oct 2024 20:21:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E2394EC0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FA11608B9
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:21:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZhCZ4_v3yO70 for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 20:21:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a2f; helo=mail-vk1-xa2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E585860781
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E585860781
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com
 [IPv6:2607:f8b0:4864:20::a2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E585860781
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:21:33 +0000 (UTC)
Received: by mail-vk1-xa2f.google.com with SMTP id
 71dfb90a1353d-50d4a333a87so1199991e0c.1
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 13:21:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730146892; x=1730751692;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k6P9v1blKKAgDhWfckkEcsE5oPHwuZ95ZkgJvR6oNZI=;
 b=hSQouc0k5itiVrOKKsK1shwDwSIkvfJkoIT0ePD+8IBXTdhTx06KMHuuh659+/aR1p
 yibQ4nr6/RBAFAnqDnihAwT7IviGbaORI6/13RqxKwyLcgMmNNHszFd0yI2MlaM2Kc5C
 FxIdtEkR5su4+hcpoVOtop59aEM4YdV7Ws4NBe/isVckDXrvGwKoz5WpHDMZpSq5pBoU
 yClAPg025HGbzqGa4ixLiYBTwEmhp6RpfyKU39XV2T9HgcKmfFniXOXJH43ujABoNtpm
 QAyt64GuMzzfXZZdGt8wd17R1JBzIDX5Qo365nKSJZMjxQ5o4GY+Itzel10pzgopYnhh
 PYWw==
X-Gm-Message-State: AOJu0YyjjHhgLtZSJ5KW5oR+gsNtZUQtfwhMC/1klIqcLSrXFrKc386K
 Sh/u1JmAZIxicV7kmJT3en4jjOKljL6rYAbYVPoICCiNO2o9RX1MawSH91VR64hLxbKfeJOIOgQ
 LabyuZOeeUxNQ0LvoJoX1NwfJE7E=
X-Google-Smtp-Source: AGHT+IEHk2jqDzlqm4L40jdnngkscikvdevY+BVkGcrcGwGwpQErITgZLiJfuw8N/3W8CeaaBwuF/Hx9TloaKoET8HI=
X-Received: by 2002:a05:6122:891:b0:50a:caec:70a2 with SMTP id
 71dfb90a1353d-5101501c00bmr6104080e0c.4.1730146892414; Mon, 28 Oct 2024
 13:21:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240924023919.1502635-1-james.hilliard1@gmail.com>
 <20241026162759.0100482f@windsurf>
 <CADvTj4poUTwYNeVK63EkZHKyYZ9BWAnVMNv9jOxcd-0guH+wAQ@mail.gmail.com>
 <20241028211103.67456028@windsurf>
In-Reply-To: <20241028211103.67456028@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 28 Oct 2024 14:21:21 -0600
Message-ID: <CADvTj4pKGh1-PxmuCvOFcV4Vw2hREChCj4Q3FAgS=kicuHJpHQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Kamel Bouhara <kamel.bouhara@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, 
 Asaf Kahlon <asafka7@gmail.com>, Julien Olivain <ju.o@free.fr>, 
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Christian Stewart <christian@aperture.us>, 
 Robert Rose <robertroyrose@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730146892; x=1730751692; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k6P9v1blKKAgDhWfckkEcsE5oPHwuZ95ZkgJvR6oNZI=;
 b=OzYTYmTJzLDPD4X6eYvHFz/b1lvQ9imB0hV56o1w/Mjur/o5sJXF8AR1X8AYygAP+m
 IMzn0BPCVRjLsvGm8vZJJVNNVEu/uRj3vT1vKc1+mO/jZc+/RhC8wiZfWJMy1KoNrkDe
 nmGXwiH7cdX0mmS8BHm+OAmCeK1y0XKi/Hr6Mk/tulXf2FfgHqQznzS3/Je6e3sRGefn
 AA+ltV5nNih//5B0QFpedXW6tNlpBFdcPEmO8FxRQOyKLKTzjCVgs0ggItZMqoO3VMwm
 ECx+nqXMrdHvtpZbUdBtZ3sOYJArz/b289R8sjIry9FKNympgdvV/SIQzkW2YOrTqGwQ
 GjyA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=OzYTYmTJ
Subject: Re: [Buildroot] [PATCH v2 1/3] package/{python-}protobuf: bump to
 version 28.1
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBPY3QgMjgsIDIwMjQgYXQgMjoxMeKAr1BNIFRob21hcyBQZXRhenpvbmkKPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGVsbG8gSmFtZXMsCj4KPiBPbiBT
dW4sIDI3IE9jdCAyMDI0IDIwOjU3OjMyIC0wNjAwCj4gSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhp
bGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiA+IG1ha2VbMV06ICoqKiBbTWFrZWZpbGU6
MTU2NzogcHJvdG9jLWMvcHJvdG9jX2dlbl9jLWNfYnl0ZXNfZmllbGQub10gRXJyb3IgMQo+ID4g
PiBtYWtlWzFdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL2hvbWUvdGhvbWFzL3Byb2pldHMvYnVpbGRy
b290L291dHB1dC9idWlsZC9ob3N0LXByb3RvYnVmLWMtMS41LjAnCj4gPiA+IG1ha2U6ICoqKiBb
cGFja2FnZS9wa2ctZ2VuZXJpYy5tazoyODk6IC9ob21lL3Rob21hcy9wcm9qZXRzL2J1aWxkcm9v
dC9vdXRwdXQvYnVpbGQvaG9zdC1wcm90b2J1Zi1jLTEuNS4wLy5zdGFtcF9idWlsdF0gRXJyb3Ig
Mgo+ID4gPgo+ID4gPiBUaGlzIGlzIG9uIGEgRmVkb3JhIDM5IHN5c3RlbSwgZ2NjIDEzLnguCj4g
PiA+Cj4gPiA+IENvdWxkIHlvdSBoYXZlIGEgbG9vaz8gQWxzbyBNaWNoYWVsIE5vc3Rob2ZmIHJl
cG9ydGVkIGEgc2VwYXJhdGUKPiA+ID4gKHdlaXJkKSBwa2ctY29uZmlnIGlzc3VlLgo+ID4KPiA+
IFllYWgsIHRoZXJlJ3MgYSBwZW5kaW5nIFBSIHRoYXQgYXBwZWFyIHRvIGZpeCB0aGlzOgo+ID4g
aHR0cHM6Ly9naXRodWIuY29tL3Byb3RvYnVmLWMvcHJvdG9idWYtYy9wdWxsLzcxMQo+Cj4gV2hp
Y2ggb2YgdGhlIHR3byBpc3N1ZXMgaXMgdGhpcyBmaXhpbmc/IEkgd2FzIHJlcG9ydGluZyBhIGJ1
aWxkCj4gZmFpbHVyZSwgYW5kIE1pY2hhZWwgTm9zdGhvZmYgd2FzIHJlcG9ydGluZyBhIGJ1aWxk
IGhhbmcgaW4gcGtnLWNvbmZpZy4KClRoaXMgZml4ZXMgdGhlIGJ1aWxkIGZhaWx1cmUgeW91IHJl
cG9ydGVkLCB1cGRhdGluZyBwa2djb25mIGZpeGVzIHRoZSBidWlsZApoYW5nLgoKPgo+IFRoYW5r
cyEKPgo+IFRob21hcwo+IC0tCj4gVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywg
Qm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWlu
aW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
