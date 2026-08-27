Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D51C5DF97
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 00:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE178606C2;
	Thu, 27 Aug 2026 00:45:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eM7ZW4y59Ocy; Thu, 27 Aug 2026 00:45:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787791525;
	bh=YdIx8OUBxyK0TZmnKqqBOLsKUGiO4Me8I3hwUs3IXyA=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KEZwjUyhmoHUCtcd4RTOqyumIy9YeJ0BxyrxlIpUCw1stbMQVY8yZjpNqYGs5eYUd
	 0JmhL2dKZG/01ZqsviRg4IxWstiFdWsfA/+frloGS1ub/1p7z9sJdYFUYjDCoX64CO
	 OaoKeejnty71NEAoJ4jUyBhqENMkXSf/x82i/zMAMnecnco6bZ7Hz86Y8lUnEb3okP
	 dXOSASN1bLj+H6Dui3wHcRzzvF7KU3WtIJWl/HGW4zFkQI+W1uH2beBv4eABxhjpOG
	 aCisnoxKfIsmIPdCylxpqpSKNdn4sqPdu+WvcSfbtiJXIWmmqgi/SQflYdSwE3kLWm
	 LNj9zyrPVDN4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A38960642;
	Thu, 27 Aug 2026 00:45:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E5086341
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 00:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6F11404F7
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 00:45:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wIS_Njv_IUez for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 00:45:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=matthew.l.weber@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=L7dfcMmy
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BB614404F4
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 00:45:22 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5b4b037a2c1so370065e87.2
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 17:45:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787791520; cv=none;
 d=google.com; s=arc-20260327;
 b=Z5UInH5I1XTrI+AlmTMHgaA4opgJEGD8tqNQlQAlbUXo21uS0jdOn6g7n36rtu6TLE
 Qjnlm6FPXuVsJ1MeWI3BF/WprwZ/Cj+8ifeZAyF+amddHz61jTSwn0RKcDUTO2h+zD5J
 dJtkfG2gyAsfXFXGdMnIpmF2Pf6l2i1LdB7CUV1swouMR2/u0KXN6Z+6KiU8hUTw9OcT
 3L4PTiyIhxJYGWx5KRSosJrkShEi86dm6FIz0/Ba9g+QZPUgsKM3ZpZeHv/Wf3ml1ZWZ
 dW67Hw1viOACrG0rqJHyfEy3GmjCO7z8AA2eGIlxqzUtNLGpjT6f3ejsgy5EkpMfNTVL
 YkEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=dlhu98SL/0VGMPgjzomCPUnbaD1JTiRy5kMSbPKGPak=;
 fh=2AgEs1vvEY1FZ2pFR9FIfo1m5yePocERthq97wSCbGU=;
 b=pOKO7y6CCVfe1OkgTCCMXqqTtZt05PgFV5omKrbC7Q0KmsD0WNg26JbYXayIbXjiwU
 G1tsAi2GS0UaicQMKX5v3hedJWNrEuu6+qWfWlnTgwrpvFjgvZFDmYqRRfe/eIM4jixu
 Cc4lyxMgzJPYmNG28IzFhvDcqqqXuG8xdhZkZlfncNg1Qw27dM9CyNaFseiz5TRBEhBF
 BOO+7Zt5ZXkLH37SvCahnlSUbUT4pZB3nYV+9SsRxXdLQFTPrBqJ8t/ObuwbNbty1uUq
 KUB30Mt51VbDPUwT2fVuTMwBtHrZ3PQV/cp9eb+oKLmqlUt7bRbeZgNbNooqEPPokugH
 rKBg==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787791520; x=1788396320; darn=buildroot.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=dlhu98SL/0VGMPgjzomCPUnbaD1JTiRy5kMSbPKGPak=;
 b=L7dfcMmybVhUzX91oocJ6aeCqZ/agfaffcgGVtr11qwEewmKDS0i7Rx301x0ho+8ax
 3/A/tbjtLNeKsi4KvYvoSH9z3eDoqwxDap4uPG4dsKQatHm1hNXwKazHzwW87MBT9Lin
 uSXBOfldtR17IGlgeVpwEeoblauV6An69HgJb1CwAs4h9yMm2MHjGEgJOCjeKK01ysdO
 tAywy0dbPMI04Xy4CFhGRn03unznjUGg9cBXpAufwu6ksK0PBwgOKzDTF5Zeh5bsVgFu
 4zjx9ds5/xBH+u9U8XbTwjkCepuBa2fxjCMooi/k6u7s4YoMjZxDo+z4HV8m4RpBGxtE
 WD5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787791520; x=1788396320;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=dlhu98SL/0VGMPgjzomCPUnbaD1JTiRy5kMSbPKGPak=;
 b=YYGMV6KPE8Nnq8l+5wqO51OcE8xMsBb8LtFkMwdmMlUV1N68KAiBoDwW2xh+wm+ivF
 otnenraX2bN6Tr0waIWL7LMEmRFaXSkHHSgbN1HFp1omzCNafos/HHrL5SpnMNpP3NXo
 HkQWkADfeei5Ye68+0IzPqFJrWMDkjdiMHZ0IAztDh958URSxc1wN9J9hTi2XzU5/n/Q
 bqR3ZqUkPfpuNIT7Y8ZAx41plrHmgYpMwVdBuXI8o4I4DLan8OKb4pcDkQM103+dV9SX
 EhzKlOl04WJozxq1d21IZ+O3F1LchNGm2V0yCLGzCkNWCj20CJCyKEoBv4wFa0pUzgbA
 jDvg==
X-Gm-Message-State: AFuF++mUmwfL3gSTfwcWU7uBZl4Zq/s+7OAc+LjgRlgXSTrV3CC4b5/k
 cd7j3Ml95v27mTf2J+iG+e1H7HXqWgAkHM6XgLfJzW78+UlghCBjz9iMQ6NTFy3DxR7Zw0e90sh
 ADtppKqL4w0GFD9DaLCjWxRtljH5yjGY=
X-Gm-Gg: AR+sD11mMuFc8Oj93R77HWpoP9BeJszBWgyQh6UML8eLNUCjllAPSJI/WQFSgw8UKzt
 d80sIOwi+RFz04VjtePnr6CyrVZfP3Viw6IoZ3pNXuKiSMogN6EBGlPpp8Anvbu6ZuocVFyiTKM
 Ja+oKts0DapSUNOKVFCVsFmYLQ6uwN0PX5ZvWvhMqo6L3Vkj2YNcKvTb12naIZ4RwsvFHQFrlQF
 TgGvS8rTbxFoodkFngnFu9AwxHCzltFdq7fgi/MlmNQKLVglgqI78XdYWfdXN10abwiHkHKO+2E
 kKH6xeVEltehkZ1ioFxIB53fa9wLBCT33wk30hE3lPFn
X-Received: by 2002:a05:6512:6d:b0:5b3:e02:b3a0 with SMTP id
 2adb3069b0e04-5b4a90439a2mr2881300e87.7.1787791519723; Wed, 26 Aug 2026
 17:45:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260826064649.292291-1-neal.frager@amd.com>
 <20260826064649.292291-2-neal.frager@amd.com>
In-Reply-To: <20260826064649.292291-2-neal.frager@amd.com>
From: Matthew Weber <matthew.l.weber@gmail.com>
Date: Wed, 26 Aug 2026 19:45:07 -0500
X-Gm-Features: AcwNN1VjmL1_zj5XsCcnzPyCZPYl-EcFlftnZqQ0PYYVSN3MYa1ctnQLEQznjOY
Message-ID: <CAFt09wMB2R=Xb+SpdXhTd9er-UNY5as-pn-J58TaUtYXDDzW5w@mail.gmail.com>
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, alistair@alistair23.me, 
 stefano.stabellini@amd.com, ibai.erkiaga-elorza@amd.com, 
 luca.ceresoli@bootlin.com, micheal.saleab@amd.com, yann.morin@orange.com, 
 matthew.l.weber3@boeing.com, Matthew Weber <mathew.l.weber3@boeing.com>, 
 brandon.maier@collins.com, john.ernberg@actia.se, brian.j.wood2@boeing.com, 
 ju.o@free.fr, stewart.hildebrand@amd.com, thomas.petazzoni@bootlin.com, 
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Subject: Re: [Buildroot] [PATCH v5 2/4] package/xen: add custom version
 support
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

TmVhbCwKCk9uIFdlZCwgQXVnIDI2LCAyMDI2IGF0IDE6NDfigK9BTSBOZWFsIEZyYWdlciB2aWEg
YnVpbGRyb290CjxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cj4KPiBBZGQgdGhlIGFi
aWxpdHkgdG8gY29uZmlndXJlIHNwZWNpZmljIFhlbiB2ZXJzaW9ucyB3aGlsZSBsZWF2aW5nIHRo
ZSBkZWZhdWx0Cj4gdmVyc2lvbiB1bmNoYW5nZWQgdG8gYXZvaWQgYnJlYWtpbmcgYW55IGJ1aWxk
cyBhbHJlYWR5IHVzaW5nIFhlbiA0LjIxLjEuCj4KPiBUbyB0ZXN0Ogo+IEJSMl9hYXJjaDY0PXkK
PiBCUjJfVE9PTENIQUlOX0VYVEVSTkFMPXkKPiBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0JPT1RM
SU49eQo+IEJSMl9UT09MQ0hBSU5fRVhURVJOQUxfQk9PVExJTl9BQVJDSDY0X0dMSUJDX1NUQUJM
RT15Cj4gQlIyX1BBQ0tBR0VfWEVOPXkKPiBCUjJfUEFDS0FHRV9YRU5fQ1VTVE9NX1ZFUlNJT049
eQo+IEJSMl9QQUNLQUdFX1hFTl9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNC4yMi4wIgo+Cj4gQWRk
IHRvIHBhY2thZ2UveGVuL3hlbi5oYXNoOgo+IHNoYTI1NiAgYjJhMTRjYTM2OWUzY2YyNmYxMjNh
NDU1YjE2MDNmMzk2MmFlOWZjZWUwYjg2NDBhOWNjMzM4NzlkZTE5ODIyMyAgeGVuLTQuMjIuMC50
YXIuZ3oKPgo+IFNpZ25lZC1vZmYtYnk6IE5lYWwgRnJhZ2VyIDxuZWFsLmZyYWdlckBhbWQuY29t
Pgo+IFRlc3RlZC1ieTogTWF0dGhldyBXZWJlciA8bWF0aGV3Lmwud2ViZXIzQGJvZWluZy5jb20+
Cj4gUHJpb3IgdGVzdCBkZXRhaWxzOiBodHRwczovL2dpc3QuZ2l0aHViLmNvbS9tYXR0aGV3LWwt
d2ViZXIvYzE3ZjE0YTM3OTNjY2VlNDQwYTM4M2U0MTc3ZmYzZGIKPiBSZXZpZXdlZC1ieTogSm9o
biBFcm5iZXJnIDxqb2huLmVybmJlcmdAYWN0aWEuc2U+Cj4gUmV2aWV3ZWQtYnk6IFN0ZXdhcnQg
SGlsZGVicmFuZCA8c3Rld2FydC5oaWxkZWJyYW5kQGFtZC5jb20+Cj4gLS0tCj4gVjEtPlYyOgo+
IC0gcmViYXNlZCB0byB1cGRhdGVkIG1hc3RlciBicmFuY2gKPiAtIHJlbW92ZWQgdGhlIGxpbmUg
bW92ZSBvZiB0aGUgWEVOX1NJVEUgZGVmaW5pdGlvbgo+IFYyLT5WNDoKPiAtIG1lcmdlZCBpbnRv
IG5ldyBwYXRjaCBzZXJpZXMgYXMgdGhlIHNlY29uZCBwYXRjaAo+IFY0LT5WNToKPiAtIGFkZGVk
IGN1c3RvbSB2ZXJzaW9uIHRlc3QgdG8gY29tbWl0IG1lc3NhZ2UKClJhbiB0aHJvdWdoIHRoZXNl
IHNlcXVlbmNlcyAodGVzdCAxJjIgY292ZXJlZCB0aGlzIHBhdGNoLCBtYWtlCnhlbi1zb3VyY2Ug
d2l0aCBCUjJfUEFDS0FHRV9YRU5fQ1VTVE9NX1ZFUlNJT04pCmh0dHBzOi8vZ2lzdC5naXRodWIu
Y29tL21hdHRoZXctbC13ZWJlci8yMzEwMTQ5MGE2ZTk1YThiMGY0NDVlMTRlYzIyZDlkNQoKVGVz
dGVkLWJ5OiBNYXR0IFdlYmVyIDxtYXR0QHRoZXdlYmVycy53cz4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
