Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09615C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 19:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0DA881AF6;
	Tue,  6 Feb 2024 19:32:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8yQoh0MCiQu8; Tue,  6 Feb 2024 19:32:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C723A81F83
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C723A81F83;
	Tue,  6 Feb 2024 19:32:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E0CE21BF2FB
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 19:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA0FC60F2D
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 19:32:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sXHlvt_okQJb for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 19:32:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::82b; helo=mail-qt1-x82b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6087A60EFB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6087A60EFB
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6087A60EFB
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 19:32:47 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id
 d75a77b69052e-42a4516ec46so9634161cf.0
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 11:32:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707247966; x=1707852766;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r9BZ9DsBtfl9jc+ON4gD95TELD1jnVNonuXAhbeR/3o=;
 b=r1+2vAVzTbDDnkboDR3sL6/noqO5qmUS0J4Zbv3Dwb7wCENlobvAjdHh5GVqdSLNSC
 7LQasQZFfgtVUyeI056pLT9DR69/2kGKqZPUpKgCESmmAi64mz/+8b/Y//33LaGLi9x3
 A8ypvoK9LRBkiSl+S4jKoVMR8bCWhgiXjt2P9QYNRN2a31Lc8JH3ZPGIX6/s3feJLWjY
 xM6eiV4CXRdEWASYLQEo7BUbviTJFNQbn4TP9zX1EI0dn1Gvd0QDgI6Uh0lhVjVcWlIv
 OpOnGL71O3+pafP43aZtX8MDg7vPkuvfQf3euja/S/JjFzidSJ4JIRKCPoUqGwyinAfF
 hpVg==
X-Gm-Message-State: AOJu0YwnOlpqI3z053WcbhJkR/kTYk5SDDUroof0aZtazzbViflBJtT/
 tdxielAGkR92+ooh6FSaT4+/14vKI8muIiaJ9pNehnel9Ze9Zv+oiOil0FDDvPpgV9L3vRW204E
 i53jrZwF5SuJ4lVV/uBZLV2c/Dxx9oRcb8GIVlQ==
X-Google-Smtp-Source: AGHT+IHImPGqB/PTyBYjObBfOkxiRWI4YKorhP+Xpm626gYlRKk9tWdEB3BI2RkKLfVlcxhXItlSu412QHrEdzVOwBY=
X-Received: by 2002:ac8:4642:0:b0:42c:b98:c6f5 with SMTP id
 f2-20020ac84642000000b0042c0b98c6f5mr5338840qto.9.1707247966081; Tue, 06 Feb
 2024 11:32:46 -0800 (PST)
MIME-Version: 1.0
References: <20240106214410.3294887-1-james.hilliard1@gmail.com>
 <d2c62f63-c48e-4969-a287-b10ecb7b3b21@mind.be>
In-Reply-To: <d2c62f63-c48e-4969-a287-b10ecb7b3b21@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 6 Feb 2024 12:32:33 -0700
Message-ID: <CADvTj4oueQe50PUw-9enTdUZ1pk3picVygzU3vkZPJsGDe+UwQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707247966; x=1707852766; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r9BZ9DsBtfl9jc+ON4gD95TELD1jnVNonuXAhbeR/3o=;
 b=guH1LiIVxdGYKjELoJsiQSfy5SqPHxqdJ6FrMuPJcXQyLjvUYfHJBSlmpTcshg7mjJ
 yK6sXY/gYTlPYot4SxHfDxOXqayPMLDImX36CmLd1V7uuCUZe3Y8D0shxrrQqgH7AQYj
 fgvZ0SBuTt2NQE/Xe9RRWp9vzUEl4i2OhKGIcahbMsQXYKRRoSS1dhhQlU3nX0CapUt5
 0Li1UmPLTBSRAIH6lFkZyCTzPY12xZoJ0FCorxyGHf1FPArb+2QWWk/AZ8R/hE4e8Jot
 ZRIP53iaPuhuxpWntXDwpOUrweu16MaUeqGo5vEF5xPjm6dsQubOELCXx5uDbBBzXmUc
 BCAQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=guH1LiIV
Subject: Re: [Buildroot] [PATCH v2 1/4] package/python-poetry-core: new host
 package
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBGZWIgNiwgMjAyNCBhdCAxMDo0M+KAr0FNIEFybm91dCBWYW5kZWNhcHBlbGxlIDxh
cm5vdXRAbWluZC5iZT4gd3JvdGU6Cj4KPiAgIEhpIEphbWVzLAo+Cj4gT24gMDYvMDEvMjAyNCAy
Mjo0NCwgSmFtZXMgSGlsbGlhcmQgd3JvdGU6Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxs
aWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gICBwYWNrYWdlL3B5
dGhvbi1wb2V0cnktY29yZS9weXRob24tcG9ldHJ5LWNvcmUuaGFzaCB8ICA1ICsrKysrCj4gPiAg
IHBhY2thZ2UvcHl0aG9uLXBvZXRyeS1jb3JlL3B5dGhvbi1wb2V0cnktY29yZS5tayAgIHwgMTQg
KysrKysrKysrKysrKysKPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspCj4g
PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3B5dGhvbi1wb2V0cnktY29yZS9weXRob24t
cG9ldHJ5LWNvcmUuaGFzaAo+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24t
cG9ldHJ5LWNvcmUvcHl0aG9uLXBvZXRyeS1jb3JlLm1rCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvcHl0aG9uLXBvZXRyeS1jb3JlL3B5dGhvbi1wb2V0cnktY29yZS5oYXNoIGIvcGFja2Fn
ZS9weXRob24tcG9ldHJ5LWNvcmUvcHl0aG9uLXBvZXRyeS1jb3JlLmhhc2gKPiA+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwLi4zYzA3ZmVmMDRmCj4gPiAtLS0gL2Rl
di9udWxsCj4gPiArKysgYi9wYWNrYWdlL3B5dGhvbi1wb2V0cnktY29yZS9weXRob24tcG9ldHJ5
LWNvcmUuaGFzaAo+ID4gQEAgLTAsMCArMSw1IEBACj4gPiArIyBtZDUsIHNoYTI1NiBmcm9tIGh0
dHBzOi8vcHlwaS5vcmcvcHlwaS9wb2V0cnktY29yZS9qc29uCj4gPiArbWQ1ICA5ZWQyZjJlOTI0
NDE2NWIzNGQ3MjMzYzMwNmEzNGEyYSAgcG9ldHJ5X2NvcmUtMS44LjEudGFyLmd6Cj4gPiArc2hh
MjU2ICA2N2E3NmM2NzFkYTJhNzBlNTUwNDdjZGRkYTgzNTY2MDM1YjcwMWY3ZTQ2M2IzMmEyYWJm
ZWFjNmUyYTE2Mzc2ICBwb2V0cnlfY29yZS0xLjguMS50YXIuZ3oKPiA+ICsjIExvY2FsbHkgY29t
cHV0ZWQgc2hhMjU2IGNoZWNrc3Vtcwo+ID4gK3NoYTI1NiAgZjE5NzgxMzM3ODJiOTBmNDczM2Jj
MzA4ZGRiMTkyNjdjM2ZlMDQ3OTdjODhkOWVkM2JjMjE5MDMyNDk1YTk4MiAgTElDRU5TRQo+ID4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXBvZXRyeS1jb3JlL3B5dGhvbi1wb2V0cnktY29y
ZS5tayBiL3BhY2thZ2UvcHl0aG9uLXBvZXRyeS1jb3JlL3B5dGhvbi1wb2V0cnktY29yZS5tawo+
ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAuLmUxYWNmMzE3OWMK
PiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLXBvZXRyeS1jb3JlL3B5
dGhvbi1wb2V0cnktY29yZS5tawo+ID4gQEAgLTAsMCArMSwxNCBAQAo+ID4gKyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjCj4gPiArIwo+ID4gKyMgcHl0aG9uLXBvZXRyeS1jb3JlCj4gPiArIwo+ID4g
KyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gPiArCj4gPiArUFlUSE9OX1BPRVRSWV9DT1JFX1ZF
UlNJT04gPSAxLjguMQo+ID4gK1BZVEhPTl9QT0VUUllfQ09SRV9TT1VSQ0UgPSBwb2V0cnlfY29y
ZS0kKFBZVEhPTl9QT0VUUllfQ09SRV9WRVJTSU9OKS50YXIuZ3oKPiA+ICtQWVRIT05fUE9FVFJZ
X0NPUkVfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy8zNi82
Ni82YWYyODkxNDk1ZDEyMDIwNDE5Yzg0NDdkMGIyOWMxZTk2ZjNiZTE2NjMxZmFhZWQ2YmRhNWI4
ODZkNWQKPiA+ICtQWVRIT05fUE9FVFJZX0NPUkVfU0VUVVBfVFlQRSA9IHBlcDUxNwo+ID4gK1BZ
VEhPTl9QT0VUUllfQ09SRV9MSUNFTlNFID0gTUlUCj4gPiArUFlUSE9OX1BPRVRSWV9DT1JFX0xJ
Q0VOU0VfRklMRVMgPSBMSUNFTlNFCj4KPiAgIFRoaXMgcGFja2FnZSBoYXMgNCB2ZW5kb3JlZCBk
ZXBlbmRlbmNpZXMsIGVhY2ggd2l0aCB0aGVpciBvd24gbGljZW5zZS4gVGhvc2UKPiBzaG91bGQg
YWxzbyBiZSBzcGVjaWZpZWQgaW4gdGhlIExJQ0VOU0UgYW5kIExJQ0VOU0VfRklMRVMuCgpEb2Vz
IHRoaXMgbG9vayByaWdodD8KaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1
aWxkcm9vdC9wYXRjaC8yMDI0MDIwNjE5MzA0OC42NTgwMDMtMS1qYW1lcy5oaWxsaWFyZDFAZ21h
aWwuY29tLwoKPgo+ICAgSW4gYWRkaXRpb24sIGZvciBsYXJrLCB0aGVyZSdzIGEgZmlsZSB1bmRl
ciBNUEwgYW5kIGEgZmlsZSB1bmRlciBHUEwsIGV2ZW4KPiB0aG91Z2ggbmVpdGhlciBpZiB0aG9z
ZSBsaWNlbnNlcyBpcyBtZW50aW9uZWQgaW4gdGhlIGxhcmsgbGljZW5zZS4gSWRlYWxseSB0aG9z
ZQo+IHR3byBzaG91bGQgYmUgbWVudGlvbmVkIGluIHRoZSBMSUNFTlNFUyBhcyB3ZWxsLiBBbmQg
b2YgY291cnNlLCB0aGlzIHNob3VsZAo+IGlkZWFsbHkgYWxzbyBiZSBkb25lIGZvciB0aGUgcHl0
aG9uLWxhcmsgcGFja2FnZSB3aGljaCBzdWZmZXJzIGZyb20gdGhlIHNhbWUKPiBpc3N1ZS4uLgo+
Cj4gICBSZWdhcmRzLAo+ICAgQXJub3V0Cj4KPiA+ICsKPiA+ICskKGV2YWwgJChob3N0LXB5dGhv
bi1wYWNrYWdlKSkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
