Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC008C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 16:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF78C40188;
	Mon, 22 Jul 2024 16:11:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RMH8xJ9OtNSM; Mon, 22 Jul 2024 16:11:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F8AB40192
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F8AB40192;
	Mon, 22 Jul 2024 16:11:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8CD9A1BF284
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 878F36059E
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:11:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4qEQfadwGcYe for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 16:11:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a34; helo=mail-vk1-xa34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8CDDD6059A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CDDD6059A
Received: from mail-vk1-xa34.google.com (mail-vk1-xa34.google.com
 [IPv6:2607:f8b0:4864:20::a34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8CDDD6059A
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 16:11:46 +0000 (UTC)
Received: by mail-vk1-xa34.google.com with SMTP id
 71dfb90a1353d-4f51c1f9372so585596e0c.2
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 09:11:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721664705; x=1722269505;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ea2k7ohvIjwvf/uSq0DEOoHU1N6N+VsHJ0fFYyrEqY8=;
 b=Vys8b762zi+diYsg0WmTjiKb4/u5nMEEqcSGRNAsgJRFa1eVShz0yVodeyhjiAV2Sz
 vFlI0/8ypJb/dp6nn52kqNFZ3UWNNpl6ViwoNQ6azsVk0YH7C514+mbSfNVe9QGZJK1v
 HvneMSbvDRbs5sZ30BX35QLI7fbtOqsb2gS8s9uuCXigiw90oVkhdnBEkJHcQXqKiqQh
 UD4WGsscZ4SPAgwIu/GwyAAP7b0ccfI8fPyKu2h834EQ1lTDN7gXzqR0OsWH/JZ9eiNY
 sQggo/GT1a3IQfmGAjla/HEUfbujb/Q5fTIIbzP74WGOFAnycwdoyqniKUtLYJMF8WH/
 7luQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAVbHBJOFi/GDoqfnRrZSh7qXtYBc26fkrypBCTC4L7ItGBC4hnqsoIn5AcZWUoiT38R5rwRBHb63pS7gO8MyTDutHqk5/Fg==
X-Gm-Message-State: AOJu0YyKdbkwlTrTdvnLoJCPsSV3RYc+BfiZnOn3+DFiiRQMww1AcTkD
 naj1lLTikT2wo9gyydeL8tx1w/+/3vmBgO1uYTADgQZIX5ZyUihAAxlWruD1tpqi/+IfFLcwros
 exNKclkAI9FkHa0hR6S7+Yc7wdtURqX9o
X-Google-Smtp-Source: AGHT+IFQSMWOynPSgeFeC8aQw/2oTa47bS2rLSCYvxIv9Ahse7nLFGuWTuhRWEDq2EPomHjEx2ebYl25N3kQRQArOBY=
X-Received: by 2002:a05:6122:3c8d:b0:4ec:fc23:7928 with SMTP id
 71dfb90a1353d-4f506854f4cmr9212329e0c.12.1721664703697; Mon, 22 Jul 2024
 09:11:43 -0700 (PDT)
MIME-Version: 1.0
References: <170715461915.13905.5968173515742280918-0@git.sr.ht>
 <170715461915.13905.5968173515742280918-1@git.sr.ht>
 <20240722145236.4e7ec0bf@windsurf>
 <99a9d884-8052-4128-8f4e-f68517d80a65@bubu1.eu>
 <20240722180634.0bb07726@windsurf>
In-Reply-To: <20240722180634.0bb07726@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 22 Jul 2024 10:11:31 -0600
Message-ID: <CADvTj4o7gnjhSheMmrd5Dp-6Wug4ohBoRFpJb+Q4R8ow=KeH3g@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721664705; x=1722269505; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ea2k7ohvIjwvf/uSq0DEOoHU1N6N+VsHJ0fFYyrEqY8=;
 b=ebr09DSJvWu2cmWdzleLKjCH8GJkKNLmjNOaxg78FsfqD3UhOlyijXF0VP2jDq/sDj
 2ofx23PYbRwv9M5ZcDXE+YfY15SC6aRFx+lKCho1zCNh9Gs3PMF9seL8BN6ZB6nDv4bc
 3VCOhUPInLlhXILtYSKHkCmeKUMKDif1qk1RARgAIlqIlfPj44FHk53fKRL5Vx+lIa2w
 IEk36spDukhFf4ow1QwbX+53c59GhkTiC3+R7udRtLrMUTj/QdQxmnUI4UvAIOk6QEhz
 Nnkk9JfLCpXFAiWYP/Cfn+r3tTllXt24mZWZl491fLowWAj6M1fZ93ScnDfbGD5EmFIv
 yh/g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ebr09DSJ
Subject: Re: [Buildroot] [PATCH buildroot v2 2/2] support/testing: add
 fastapi runtime test
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
Cc: ~bubu <bubu@bubu1.eu>, ~bubu <bubu@git.sr.ht>,
 Marcus Hoffmann <buildroot@bubu1.eu>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBKdWwgMjIsIDIwMjQgYXQgMTA6MDbigK9BTSBUaG9tYXMgUGV0YXp6b25pCjx0aG9t
YXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgMjIgSnVsIDIwMjQg
MTY6NDg6MDggKzAyMDAKPiBNYXJjdXMgSG9mZm1hbm4gPGJ1aWxkcm9vdEBidWJ1MS5ldT4gd3Jv
dGU6Cj4KPiA+IFBlb3BsZSBoYXZlIGhpdCB0aGF0IGhlcmUgdGhyb3VnaCBjb25kYSBmb3JnZSBh
cyB3ZWxsOgo+ID4gaHR0cHM6Ly9naXRodWIuY29tL3B5ZGFudGljL3B5ZGFudGljL2lzc3Vlcy84
NDI5Cj4gPgo+ID4gSmFtZXMsIGNhbiB5b3UgdGFrZSBhIGxvb2sgbWF5YmU/IChXZSBzdGlsbCB1
c2UgcHlkYW50aWMtdjEsIHNvIEkgZG9uJ3QKPiA+IHJlYWxseSBoYXZlIGFueSBpZGVhIGFib3V0
IHB5ZGFudGljIHJ1c3QgY29yZSBidWlsZCB0b3BpY3MuCj4KPiBXZSBoYXZlIHNvbWUgdXBkYXRl
cyB0byBweWRhbnRpYy1jb3JlL3B5ZGFudGljIHBlbmRpbmc6Cj4KPiBodHRwczovL3BhdGNod29y
ay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjQwNzE5MDQzNzM5LjMyNDEz
NzItMS1qYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tLwo+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFi
cy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyNDA3MTkwNDI2MzIuMzIyNzI0Mi0xLWph
bWVzLmhpbGxpYXJkMUBnbWFpbC5jb20vCj4KPiAoSSB3YXMgYWJvdXQgdG8gbWVyZ2UgdGhlbSkK
Pgo+IE5vdCBzdXJlIGlmIHRoZXkgYXJlIHJlbGF0ZWQgLyBzb2x2ZSB0aGUgaXNzdWU/CgpUaGVz
ZSBzZXR1cHRvb2xzL3NldHVwdG9vbHMtcnVzdC9tYXR1cmluIHBhdGNoZXMgbWlnaHQgYWxzbyBo
ZWxwOgpodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNo
LzIwMjQwNzE5MDQ1NjM5LjMzMzY1NDEtMS1qYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tLwpodHRw
czovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjQwNzE5
MDUwMTM0LjMzMzgxMTctMS1qYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tLwpodHRwczovL3BhdGNo
d29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjQwNzE5MDUyNzAwLjM0
Mjc4MzAtMS1qYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tLwoKPgo+IFRob21hcwo+IC0tCj4gVGhv
bWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4
IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCj4gaHR0cHM6Ly9ib290bGluLmNv
bQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
