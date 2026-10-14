Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC1ECC6B2E
	for <buildroot@archiver.kernel.org>; Wed, 14 Oct 2026 21:13:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FEB3608BD;
	Wed, 14 Oct 2026 21:13:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rp3SDDuBDBqn; Wed, 14 Oct 2026 21:13:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5FDED6089D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792012407;
	b=JBApC7FpZ5qn4SIpsCAvVWBQmJI2rqIVf/63yatNwBUcf7q7Yq3EemlhCzbsT5FEXIGp
	 M7Qa+3GMIBCMpQQyJX0rRKEr3Gd72keYPxOeIqbsY2tvIvoYvs2pu7t+2SYoP79PepBfD
	 qVKQR86xhdQgWUUwodUMkmAnH+wKEVI7SsE87VHXPSFVhSSybMYYjue/ryQ4uqJduezaj
	 SUEKyRpRSJYtUf0RsVYBRcetUI3Czvj9P/O5ztRGQ92FdH/rCQMXyNp+gwHak/5xZdW6Y
	 k2JM1PGnvis1xR4yrrhRHNKfOP75Hil4DWApUyhkZ8Lpqy6TgPfXqv7bSm7IhxbZJcQ==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792012407;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=UNonFWTDu9gxDfWYk0R0f13Agb9dtXdfSWHCNKx9s8Q=;
	b=BDR2xzBNbgEuv7+W6J8LpBBBXqz7xPWT0hKoiyXFE/0VWtVnMQpdg4msglnSA/w261aM
	 8DHitZ1zuICNj6D9KISVI6JL0U7XapK/4hHOxSAazJ6mM4xNi3SOLBybDrD5xDyuFJXnL
	 BjIJ5kr1Mv4x7uGhslOnjwRKOhPK/smQrP3YyXb0rWIX0Vrvl4mWwA+TTOntIS2TsdPW6
	 L4hKkl+FtHCpm+xUVYXY0NU6HMTasgODIgibW2db/wjkowI0eC5cCxsSHbX2LRAu75TAk
	 1sI6xV3r0cu8MEQ6BNTUqs92T7852mBRiNeaOzKFTLCrEL52kixULhAFnUjZg5VPsUQ==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792012407;
	bh=UNonFWTDu9gxDfWYk0R0f13Agb9dtXdfSWHCNKx9s8Q=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mQcF93BbEIietZtLAPOt73ov2NWMJokbre3kBnDFk8U90bk6jcHOGPCvNWa1IwFc6
	 WSMwqdyHAcRBsNQwdQUpfknmvvlhG2hDt6rcN7J9lyyKH95RQPrwvymrWbRa/N5az1
	 wmpajZdP3N5HHJv20/tKIp5Drz19tyqZSPoMDrZ2QU2Nq8h2vV3681ueYVNx3Cp6n9
	 A3LDmN+osSJo+t7qKipNgtCw8+BCe0EjNvxWUMXrlDJ/CdNkMAT2+vl0srmhCE2pR6
	 sAhYK7NFTrSBNA2ixLZdD/t9DnaT9JMfR0kt4TPTxrGUYvZobMoAtP9fRlq526B6c2
	 001ShSUpKMxxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FDED6089D;
	Wed, 14 Oct 2026 21:13:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D26F9A58
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 21:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B88EB40223
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 21:13:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kMnjAZInjFn6 for <buildroot@buildroot.org>;
 Wed, 14 Oct 2026 21:13:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B51D1401A4
Authentication-Results: smtp2.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a00:1450:4864:20::52b"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1792012405;
 b=RAw2Mu22AjQ6h2dxeKF77k2UhpgLQZGWWX1dRcvIZY4dcXNmtqXlhih6ALTdo6M74MLt
 I2fNfgjrJ0ce+1RP73nFWdz30+YhvC6DWkFzLsKk0Rtqx0XSsOy8iaHdhHpsoSymbqzbT
 TGsFdLm+vS4y2wthP2Maismaynky+VXkiR5HYB131PDz+jOtSID8LxFVSTj4NRhSh+oxX
 ktXEqiWh2bH/Xb4VTq4Pg1KQJheE5sTxJNMxoA5NMlLaUMJSEuKEhVCqL0gzW3HAgkjPc
 KytPkBea0B7NIQsb8/iIQYSrfIwwlgXtlzw++gG2mGNk/gUnoMppOdi//mO5LqnmRFQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792012405;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type:Content-Transfer-Encoding;
 bh=RIx2NK8sS86bLGJ5W+9OqrB7lr0GAqp6teBzJw85P4s=;
 b=KyzjOh87UQoDOQLSSQCTPVD//8ldsAzt/7983yPIrtZ4TfWJvlKIEPpKFJtUq4nQi0fr
 12uvDXlhDroXgV5DZYoDFdI5VPAUdZ929ct3Czp8SquM2kiNSC+/htZk85Pl7vS6LVM3b
 PMPvcF+75Ri6+LU/4JxmRTREPT25/9Bq81vho2MZtStl7MNm5MHgdjsrpeSGND8vcxIbi
 fe4hMRNGrm1TXglnrSAh9JnE9612Xgjwgnzri45GXYbpPRYCEvf5yNcn/7t6kw5p5Nm6M
 dlE03DwrebeXoU2JQJFnt1pgsvknd30uHUMg837oME6VGKNwSbjUccipmLnCX7y0hUw==
ARC-Authentication-Results: i=2; smtp2.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=j8CW5uMk; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a00:1450:4864:20::52b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20251104 header.b=j8CW5uMk
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B51D1401A4
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 21:13:22 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-6b1aa29e06bso2320416a12.2
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 14:13:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792012400; cv=none;
 d=google.com; s=arc-20260327;
 b=Ek2lCbzPwOkCYVNvMfXpMexJgfKHH3ccmXO7CVQYPwFiraJhgbANadp2GQhhg5YT2S
 Kki+nYaD28oYcRlqW/tFYAirzbzG0jSQutqxcMp+s0FQRhj6acz/nEzsBJ5tXWYG2ql6
 ennJS+iAOHGTZtu2Zo7TT0ZsnFeKopFpZO/uwyyh2+3pVvBa0Tt53GI5/mMWRcq7FhCN
 kL2vrBJEG739QqP3nSLvEdKJcJxRQV5zbvkNczfb69nVP9JPmEUwnx1ZiE0O5pofR376
 OMu/TT0GGIvzkrQylYX0sdVV8zfdtKsXybwTHDROMppX0VZMT4iJZFpC0Y2Ue4GjnGrt
 vNdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=RIx2NK8sS86bLGJ5W+9OqrB7lr0GAqp6teBzJw85P4s=;
 fh=ctPO35gVqHgqZmOKaD4//WIAR/NDn8Ss0YyyR38Lhwk=;
 b=Kzkt+2lrdkDO8nMKl6TOpwnsQJfWVeJ2zjJeyd1dIbw++EUPsA90hKMhJ3UOyd66kf
 X3kME8vKLzIzF6ds9QW6/U/vck482e0YDeFvnQR8zs+hS4zOSPUb0KTc+NnySm1IGIqb
 7o/7CgxGtdMVZ9Z9PBCjR7REkEQYxi+A0/Pj+Ya23/7DWWQ3rDpi0AdenABhv/Or6jpv
 JLEPvQs+audv79LFWPcXNKVfN3ot067kydtsuspV/59ANS2WLwxxktyZ37VKfveRM3ne
 YTacPrkn/91oNHHbx7YbFlbzQQ2J70xkYVVnVGE3gwMOShJ3AiYSg133JiBEYl7mMc8q
 62Yg==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20251104; t=1792012400; x=1792617200; darn=buildroot.org; 
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=RIx2NK8sS86bLGJ5W+9OqrB7lr0GAqp6teBzJw85P4s=;
 b=j8CW5uMkJ/XxWBx6YuEhAGmJGwVgNnwts6/+i0w8rKxlZi0bOR9McOogJftxTrLyeC
 WrAc+0Olt4hktsIx1peMXhPfppTmAxDkkqF/IXkO805Oh+wsFkSxSUELZiGgE9G9zuKj
 yiClFQ5IhWOfFaSGErHkIJp7dS4tvvXxJuRroHn6yBSnaHrgWGc8DmM2L3CqcYtsTqBf
 nee4CN064B28Pc1biyZafnzFyznPVz60/kyDnsjWla6YPNeWCN/GUjt1QN4eijoA2H1B
 +ni3o5cPvRy/TjOMZqkYrfWbbqW2jevD7wBTjEn2cvTHoX4B529bZUeeO8beHpv1xNgm
 +k1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792012400; x=1792617200;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=RIx2NK8sS86bLGJ5W+9OqrB7lr0GAqp6teBzJw85P4s=;
 b=1yGawsRjFFWIC4d6s9s2uFDyKnrAWMnupNwY4wFAuJg626N2V4bBfFD1FAqLw/ny5K
 neR0N4sPzxYhPYGzwdNVXeWzHuia0v9JpbXGlUrbgHvnFDxogcM1QmYCOFNhN3A5pViG
 8AIXG0q8VxuaLCkIsJ3x5mH2vXlUiRQD0DYw0S5aN3hOsCJxUNVUkJ6knZd/+7vty31t
 qVPIyL543DmIed6Ak+LehL6Kz3aHSb2ttyjJj/n6Gu4lTTcgFlkXB+FSwQV0V0jZFyfZ
 LKIda2tjBipkFz7hUTYRP3W667fYuSW6wSQbUwNb8MsoVn5dsQdTLkH6Ly/aaW5/9hoK
 Pwkg==
X-Gm-Message-State: AFq9FYKp3qR5K1aEJr4FE6am1FNWy4Ce01aOXwwZI4XKo8RniSRdQKz9
 blZgVhwhlPT8x4T4GOaLGdNDSonZzsX+xWcncx7enRBK/cx+lLymIVrz6CAl0jvnf0sjejCwuB6
 dBqt8qSsWf9ztGt9o/X8b9ikxR3rhH1w=
X-Gm-Gg: AYBFou2cjeVmoYRMPjxyNxe76zCZySydHeTkQE921US+FufCD4gLCnihpHoj4oP62IF
 ysCdPMS5oWk5B6AakuLOCgPrbXrCu7ARaqjigiSRzBx5pmyWgy0erkJmt7AeM8pKhwlFec+MO9G
 j+HubKMl4/5xPWG/klGjIjOaYwloufBb7tFBuAkNSTjEMwimoZaPl9oT5iCbR6H9veMYl0QMy3Z
 0MJa7vSAvNpeo3ei7r0Wb5YqXkhy/6asSZ+VnzGlulzfpDfmJMIFCXq6dQ8Cj1eZqMzym3b65ou
 16Zg4VbbeObf/oX8r8V8q0k7Y4n5AqiS/7SZ3atb+ByKWu54qsvhJb5M
X-Received: by 2002:a05:6402:1f44:b0:6ac:87bc:8b16 with SMTP id
 4fb4d7f45d1cf-6b17c29af02mr14182081a12.44.1792012400442; Wed, 14 Oct 2026
 14:13:20 -0700 (PDT)
MIME-Version: 1.0
References: <20261013140423.1941069-1-yegorslists@googlemail.com>
 <as6dzPRAfNnf8RNQ@windsurf>
In-Reply-To: <as6dzPRAfNnf8RNQ@windsurf>
From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 14 Oct 2026 23:13:48 +0200
X-Gm-Features: AclHuK-EYVwkg4PTOTc6wWFaJMv6mtWVjriLoG-UQcOBpx8pRfs9BZQ8HX7TYZI
Message-ID: <CAGm1_kv4zpq4Q=iFhY=73x+3_qy2PJ=YBjLghOtOXR3EGcpDeA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/python-zlmdb: select python3
 zlib support
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

SGkgVGhvbWFzLAoKT24gVHVlLCBPY3QgMTMsIDIwMjYgYXQgMTE6MDnigK9QTSBUaG9tYXMgUGV0
YXp6b25pCjx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwg
T2N0IDEzLCAyMDI2IGF0IDA0OjA0OjIyUE0gKzAyMDAsIFllZ29yIFllZnJlbW92IHZpYSBidWls
ZHJvb3Qgd3JvdGU6Cj4gPiB6bG1kYi9fcG1hcC5weSB1bmNvbmRpdGlvbmFsbHkgaW1wb3J0cyB0
aGUgemxpYiBtb2R1bGUsIHNvIGltcG9ydGluZwo+ID4gemxtZGIgZmFpbHMgd2l0aG91dCBpdDoK
PiA+Cj4gPiAgIE1vZHVsZU5vdEZvdW5kRXJyb3I6IE5vIG1vZHVsZSBuYW1lZCAnemxpYicKPiA+
Cj4gPiBTZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9OM19aTElCLgo+ID4KPiA+IFNpZ25lZC1vZmYt
Ynk6IFllZ29yIFllZnJlbW92IDx5ZWdvcnNsaXN0c0Bnb29nbGVtYWlsLmNvbT4KPiA+IEFzc2lz
dGVkLWJ5OiBDbGF1ZGU6Y2xhdWRlLW9wdXMtNS01Cj4KPiBVc3VhbCByZXF1ZXN0OiB3aGVuIHBy
b3ZpZGluZyBhIGZpeCwgYWx3YXlzIGluY2x1ZGUgdGhlIGluZm9ybWF0aW9uIG9mCj4gd2hpY2gg
Y29tbWl0IGludHJvZHVjZWQgdGhlIHByb2JsZW0uIElmIGl0IGhhcyBiZWVuIGEgcHJvYmxlbSBz
aW5jZQo+IHRoZSBwYWNrYWdlIHdhcyBhZGRlZCwgdGhlIEZpeGVzOiB0YWcgY2FuIHBvaW50IHRv
IHRoZSBjb21taXQgYWRkaW5nCj4gdGhlIHBhY2thZ2UuCj4KPiBXaXRob3V0IHRoaXMgaW5mb3Jt
YXRpb24sIExUUyBtYWludGFpbmVycyB3aWxsIGhhdmUgdG8gZGlnIHRoZW1zZWx2ZXMKPiBpbnRv
IHRoaXMgdG8gZmlndXJlIG91dCB3aGV0aGVyIHRoaXMgZml4IG5lZWRzIHRvIGJlIGJhY2twb3J0
ZWQgb3IKPiBub3QsIGFuZCBvdXIgTFRTIG1haW50YWluZXJzIGFscmVhZHkgaGF2ZSB0byBjcmF3
bCB0aHJvdWdoIGh1bmRyZWRzIG9mCj4gY29tbWl0cywgc28gbGV0J3MgbWFrZSB0aGVpciBsaWZl
IGVhc2llciA6KQoKU29ycnkgYWJvdXQgdGhhdC4gVGhlIHpsaWIgaW1wb3J0IGhhcyBiZWVuIHRo
ZXJlIHNpbmNlIHRoZSBwYWNrYWdlIHdhcwphZGRlZCAoMjIuMy4xKSwgc28gdjIgYWRkczoKCkZp
eGVzOiBhY2Y2ODE4MGRlNjYgKCJwYWNrYWdlL3B5dGhvbi16bG1kYjogbmV3IHBhY2thZ2UiKQoK
WWVnb3IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
