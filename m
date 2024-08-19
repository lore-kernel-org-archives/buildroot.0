Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250ABC3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 19:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB78380D90;
	Mon, 19 Aug 2024 19:58:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qhHVFPhRojlC; Mon, 19 Aug 2024 19:58:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E201980FD7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E201980FD7;
	Mon, 19 Aug 2024 19:58:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DBD4A1BF404
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 19:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9BC880FD7
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 19:58:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BEH163HxLGJ9 for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 19:58:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A60D180D90
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A60D180D90
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A60D180D90
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 19:58:07 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a7ab5fc975dso470435966b.1
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 12:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724097485; x=1724702285;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wNJ1Y2JqG1H3cnakRjD2dSf+2GANq6MxOlkWpopKisk=;
 b=S7AXszDelZG8lega76/Xn46pnzvJz3WKI1/LEnIxWjF+Ax9xgNZWebFye+vosgeCty
 K/lCxHsRLb/4pbwsKluhChsKp2o0Zr6vR14hrKwCKJwf6yvVsB9oZwWRquDs7af0JF0k
 Yvds95iOre/qRqwb/KLFeMI0skG74NyFQmu+p3V0KGpiZgmQNDToXWSQMEl0MFHzqQbS
 Qf8kjw4nfHT+CTeRsgdeIpg3x+2UISIh3T6icQkoaSVQKNVD/vrCWn5DBOc75KHTZsoh
 qJAHeFSqoi4MleR4FNLBD8FvHq7ea48O9/CwhmS+wxUQ/ChXCiUKLIpYc8I01k/9mgtk
 oiVA==
X-Gm-Message-State: AOJu0Yy6kp8JEpRbKn83CC+qnwDppnQEybTyX6XXn+M9nfLERTNoE+aS
 gw67vQlC4T7FmZGFQSu1UsHYhWsdkBVZmUqDWDj/45acoYbAsk+bH2jHjmr8ZT+E/yjdZFk9w9x
 9JKwTyA==
X-Google-Smtp-Source: AGHT+IGMil/FuWrmRgQdo6oD+J0/IebJh1hnzDfo56FY/KPKcKhsDNBHI+X6elQg1rHVD77KzzbmTQ==
X-Received: by 2002:a17:906:6a25:b0:a7a:8c8d:40ac with SMTP id
 a640c23a62f3a-a83928a6250mr899163866b.4.1724097484708; 
 Mon, 19 Aug 2024 12:58:04 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com.
 [209.85.208.45]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a838393457asm664516666b.117.2024.08.19.12.58.03
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 12:58:04 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5becc379f3fso3342556a12.3
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 12:58:03 -0700 (PDT)
X-Received: by 2002:a17:907:2d88:b0:a7a:81b6:ea55 with SMTP id
 a640c23a62f3a-a8392a479dcmr840940166b.56.1724097483474; Mon, 19 Aug 2024
 12:58:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240805163133.4126564-1-james.hilliard1@gmail.com>
 <20240805163133.4126564-2-james.hilliard1@gmail.com>
 <CA+h8R2pN8q8iF5JZy7BTkcVU0Qnn8-LV+OJbNa-WJ0-uGCxVKQ@mail.gmail.com>
 <CA+h8R2rW4UEADdjQVduCRx8c3LpxkmLKL8JMPwOd_dBH2+0mfw@mail.gmail.com>
In-Reply-To: <CA+h8R2rW4UEADdjQVduCRx8c3LpxkmLKL8JMPwOd_dBH2+0mfw@mail.gmail.com>
Date: Mon, 19 Aug 2024 12:57:52 -0700
X-Gmail-Original-Message-ID: <CA+h8R2pLdwYugM=8wKufUSBNxri1WT4dkE2KD374M141jxm+Vw@mail.gmail.com>
Message-ID: <CA+h8R2pLdwYugM=8wKufUSBNxri1WT4dkE2KD374M141jxm+Vw@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1724097485; x=1724702285; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wNJ1Y2JqG1H3cnakRjD2dSf+2GANq6MxOlkWpopKisk=;
 b=B1i/Sk8jOVnas+mSsk/UTOJsgTLCYtEcgv2xxOGl6qG5tdj07tpK9Ju5x07CjDw4Va
 uELRb1HdUgehdISJpCvn68x3ka/5ZdO7mQn+EtO5rzKsZSaEiy/F5lb+zY3YEUwYfLMO
 f/g0Z+mAzhrxrwE7cPaOgssCOyzP3Mdz7sslqfCc4qpvx4OlzCnAVmYVFpgQJ5bgJREZ
 +rVxBG7awrKYzgw/SpLXqCHTi7e2XXLYSuK1hmnsEKRQgSzcLaBrFmTw0ZVrR1gSa50q
 8N3w3l6qm0itsBNngCRLIo4Zm8x/iyxLM3ProdvEwBYyxFinr23CL7TtTaJOiR9mJNC9
 yqWQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=B1i/Sk8j
Subject: Re: [Buildroot] [PATCH v4 2/2] package/tailscale: new package
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Anisse Astier <anisse@astier.eu>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSmFtZXMsIGFsbCwKCk9uIE1vbiwgQXVnIDEyLCAyMDI0IGF0IDE6MTfigK9QTSBDaHJpc3Rp
YW4gU3Rld2FydCA8Y2hyaXN0aWFuQGFwZXJ0dXJlLnVzPiB3cm90ZToKPgo+IEhpIGFsbCwKPgo+
IE9uIE1vbiwgQXVnIDUsIDIwMjQgYXQgNjoxNOKAr1BNIENocmlzdGlhbiBTdGV3YXJ0IDxjaHJp
c3RpYW5AYXBlcnR1cmUudXM+IHdyb3RlOgo+ID4gVGhlIGlzc3VlIHdpdGggR09QUk9YWT1kaXJl
Y3QgaXMgZml4ZWQgYXMgb2YgdGFpbHNjYWxlIG1haW4gYnJhbmNoIGF0Cj4gPiBjb21taXQgMjI3
NTA5NTQ3ZjBlNzE5ZWY2Y2UyZWMzMGQ5NTZmZGU1MThjMDM2Nwo+ID4KPiA+IEkgcmVxdWVzdGVk
IHRoYXQgdGhleSBzcGluIGEgbmV3IHJlbGVhc2UgaGVyZToKPiA+Cj4gPiBodHRwczovL2dpdGh1
Yi5jb20vdGFpbHNjYWxlL3RhaWxzY2FsZS9pc3N1ZXMvMTI4NTkjaXNzdWVjb21tZW50LTIyNzAx
Nzc4MTEKCj4gVGFpbHNjYWxlIHNheXMgdGhleSB3aWxsIHJlbGVhc2UgYSBuZXcgcG9pbnQgcmVs
ZWFzZSB0aGlzIHdlZWsuCj4KPiBXZSBjYW4gbWVyZ2UgdGhlIHRhaWxzY2FsZSBwYWNrYWdlIG9u
Y2UgdGhhdCBoYXBwZW5zIHcvbyBjaGFuZ2luZyBhbnl0aGluZy4KClRhaWxzY2FsZSBoYXMgcmVs
ZWFzZWQgdGhlIG5ldyB2ZXJzaW9uIHdoaWNoIHNob3VsZCB3b3JrIGZpbmUgd2l0aApHT1BST1hZ
IGRpcmVjdC4KCmh0dHBzOi8vZ2l0aHViLmNvbS90YWlsc2NhbGUvdGFpbHNjYWxlL3JlbGVhc2Vz
L3RhZy92MS43Mi4wCgpKYW1lcywgcGxlYXNlIHJlLXN1Ym1pdCB0aGUgcGFja2FnZSB3aXRoIHRo
ZSBuZXdlciB2ZXJzaW9uLgoKQmVzdCByZWdhcmRzLApDaHJpc3RpYW4gU3Rld2FydAoKPiBUaGF0
IHNhaWQgSSB3aWxsIHRyeSB0byBzdWJtaXQgYSBwYXRjaCBzb29uIHRoYXQgc3dpdGNoZXMgdGhl
IGRlZmF1bHQKPiB0byB1c2UgdGhlIHVzdWFsIEdvb2dsZSBHT1BST1hZLCBhbmQgYWRkcyBhIENv
bmZpZy5pbiBvcHRpb24gdG8KPiBvdmVycmlkZSB0aGlzLgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
