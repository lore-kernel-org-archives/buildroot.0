Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A4ACF45CD
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 21:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F06184035;
	Mon, 12 Jan 2026 21:20:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YvYi-UXIBPzT; Mon, 12 Jan 2026 21:20:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41CD184065
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768252853;
	bh=6oX8TXpnMdSIkktCla3beTLf+OhfFyfbA93JLqId6f8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JfE0bIW1DD5OngeVVMsm3H/uzyDb0QDo4vHtaTi7WF05Zj2+EGFmqfQVg51EVXCBh
	 34vBT1Om2pRJmLFVRLRbd4RlNlOmA8uDVTi8lPqeup18kK1Zybevhugu5D6gV0YVat
	 GHOrA+eHCR2MJ6COr1l3JMtJ9W9l9KDne306DOaOaExsOE3ux7TfQvj1CsPR/r6+ir
	 2UDOOdVfRk1EXU0yCk/tBe89woyJokKj3XPaNT8D3Kwr4FXOYGw76P1lzy1Pv92yqU
	 0Q04Yv+QhrPDQEQL/5WJkEAW6XPhI6lS1hX927mqGwGovT0azs3fqPKbPm3s/WII/c
	 cd0MlkXwqNGoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41CD184065;
	Mon, 12 Jan 2026 21:20:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DA3061CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 21:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3E8640C62
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 21:20:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Anpbl2rQpN2w for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 21:20:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=mr.bossman075@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5E9C340330
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E9C340330
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E9C340330
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 21:20:50 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-47d3ba3a4deso39759705e9.2
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 13:20:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768252848; x=1768857648;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=E9XigsG24GaVDRkM3n0g0zDA6O7An1/BBDulg8KhBXA=;
 b=HzwTybgdG2AU1uxg/U0vHEHOfhq7aTAZZOiMs0Pgl4cEi43ZoWL5j0bfpK11G5lHv2
 5Xzdl0B5nGvqmMwDgzV4ebAo5hVRaXEcIvq8ziFYojtJwbbw6RzqZq5RNFOcL2L0qb2B
 imT65RYm/GCTX1FMt4iX0zKyL43i/U+ojCV3k9QJ8zXz/3ulGBkPEym2ijfgmAFVncXX
 7NHjObneR4C0w8aQaIUdqENXIg1uX6HL++2Ho8ASNfh5/i7UP9CfPDfuUABDy02e/6v7
 m1sizQLJ9UyQMgOWyJP8cdGmMhOQgXUX3tg1m5N5t6SpfODiO4iCM8XjPvO7sIni8TdD
 NyMw==
X-Gm-Message-State: AOJu0YyywQBesnczA/uSyELiq7xifIPRQhTwjucsYr5VxC07/92TUYDN
 jORYQVmSIVUmcybGDc+DS+IlKnf7evF3LQqmbMu/NS9CfR8fKa74RkmOdK5LPdat4FuMbMfmUj9
 KuJggMnZhHLOBSAWBIN9vn58wcazGSqI=
X-Gm-Gg: AY/fxX6jRAXQ/sDTWsz90dUxlW3v23HVRKGqkqsxdH7pyciMN8SsJzUD++1gmQekNWy
 Sck8wKcznU1oNwqqc1YhBs6s4C9zFfUfNvDQ0Ev47Bg5GLPuN1txic3tXWOkm6CqnCvGo5r7sUo
 VqDMNPgdpcSW4uySAbwIeM3QBH2Qeg0gFPZspBMsxJtRWmvoSPw2m6RpE5YtNSz2mxQF96hH1ke
 TlyIQTu02XTZtj5tLjuqVjrM1Bbh0GbKoHiNT2L6TYbrNB0yiwfoKsTH26iYoz4AqT8wU0=
X-Google-Smtp-Source: AGHT+IFfwdeivP6sWdxp7FHpDryS5hDSYxPLqEqYRUzDL+SDu1gsAxZ99AbPPqr+0TKu+PCCnae0vaOH5JRSG1mJwW4=
X-Received: by 2002:a05:600c:8b43:b0:477:1bb6:17e5 with SMTP id
 5b1f17b1804b1-47d84b3983dmr239170285e9.30.1768252847883; Mon, 12 Jan 2026
 13:20:47 -0800 (PST)
MIME-Version: 1.0
References: <20250805000352.4062434-1-Mr.Bossman075@gmail.com>
 <20250805000352.4062434-2-Mr.Bossman075@gmail.com>
 <20260106221210.206df8d0@windsurf>
In-Reply-To: <20260106221210.206df8d0@windsurf>
From: Jesse T <mr.bossman075@gmail.com>
Date: Mon, 12 Jan 2026 16:20:12 -0500
X-Gm-Features: AZwV_QivTbMIEqycIMZYxf4afa_6rPCtWTOLbTpORD0JSHTfAApUnJ9mLXoGEb4
Message-ID: <CAJFTR8Qe=KANrycBm1Rc_TrhdXwBJYX4HycdvmsktdTqYA1wCw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Marcus Hoffmann <buildroot@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768252848; x=1768857648; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E9XigsG24GaVDRkM3n0g0zDA6O7An1/BBDulg8KhBXA=;
 b=e8T42UTmVAJkcxAoIe4+dDZnxv3iMKGwjXAfiZ6EzOOw7EzCu+vU76hxJfiZGp2QUt
 DxBzJh1G+QkjSqfSPYclHWG7B4MUdVLcDALhD4xzjggT/gxaEeDOhfYvOOpBCvl3Cxtk
 qTw3CnH8dgI0WXTbKzu5EISYS8jVoKu2Sq6AhH7d5fEJuOtExxuHTh3iC/vaJqBLD4Xd
 jvpBDAQwFAOMWaYrqlUxgjRP3e+fh/vwnnVpues7u/raF8Khl9vUv0P0/ihZJyNtqFUJ
 tME9z3i1hkXY+kgiu7lt0ZZawEvxWhY3IhkZpgJ7/YlyM18O87LMgRZD6FHoCBF9AwzI
 eFVw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=e8T42UTm
Subject: Re: [Buildroot] [PATCH 2/2] package/pico-sdk: Clone submodules for
 picotool
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

T24gVHVlLCBKYW4gNiwgMjAyNiwgNDoxMuKAr1BNIFRob21hcyBQZXRhenpvbmkKPHRob21hcy5w
ZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCAgNCBBdWcgMjAyNSAyMDow
Mzo1MiAtMDQwMAo+IEplc3NlIFRhdWJlIDxtci5ib3NzbWFuMDc1QGdtYWlsLmNvbT4gd3JvdGU6
Cj4KPiA+IHBpY290b29sIG5lZWRzIG1iZWR0bHMgZm9yIC0taGFzaCAtLXNpZ24gYW5kIC0tb2Zm
c2V0Lgo+ID4gQ2xvbmUgc3VibW9kdWxlcyBpbiBwaWNvLXNkayB0byBwcm92aWRlIHRoZSBuZXNz
YXNhYXJ5IGZpbGVzIGZvcgo+Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIF5eXl5eXl5eXl4gdHlwbwo+Cj4gPiBwaWNvdG9vbCB0byBidWlsZCBhbmQgbGlu
ayBtYmVkdGxzIGFuZCBvdGhlciBvcHRpb25hbCBsaWJyYXJpZXMuCj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogSmVzc2UgVGF1YmUgPE1yLkJvc3NtYW4wNzVAZ21haWwuY29tPgo+Cj4gQnV0IHRoZW4g
ZG9lcyB0aGF0IG1lYW4gdGhhdCB5b3VyIFBBVENIIDEvMiwgd2l0aG91dCBQQVRDSCAyLzIsIGJy
ZWFrcwo+IHRoZSBidWlsZCBvZiBwaWNvdG9vbD8KCgpOby4gUGljb3Rvb2wgd2lsbCBjb21waWxl
IGFuZCB3b3JrIHdpdGhvdXQgdGhlIHN1Ym1vZHVsZXMuIFRoaXMganVzdAphbGxvd3Mgb3B0aW9u
YWwgZmVhdHVyZXMgZm9yIHBpY290b29sLiBUaGUgcmVhc29uIEkgd2FudCB0aGVtIGlzCmJlY2F1
c2Ugd2hlbiBidWlsZGluZyBhIHByb2plY3QgZm9yIHRoZSBwaSBwaWNvIDIgaXQgcmVxdWlyZXMg
dGhlbSwKd2hlcmVhcyBmb3IgdGhlIG9yaWdpbmFsIHBpY28gaXQgZG9lc24ndC4KCkFzIGZvciB3
aHkgSSBzZW50IHR3byBwYXRjaGVzIGlzIGJlY2F1c2UgdGhlIGZpcnN0IGJ1bXBzIGJvdGggcGlj
b3NkawphbmQgcGljb3Rvb2wgd2hpbGUgdGhpcyBvbmx5IGFkZHMgc3VibW9kdWxlcyB0byBwaWNv
LXNkay4gSSBjYW4gc3F1YXNoCnRoZW0gdGhvdWdoLgoKPgo+IElmIHRoYXQncyB0aGUgY2FzZSwg
dGhlbiB5b3Ugc2hvdWxkIGRvIHRoaXMgY2hhbmdlIHRvIHVzZSBzdWJtb2R1bGVzCj4gZGlyZWN0
bHkgaW4gUEFUQ0ggMS8yLCBhcyBwYXJ0IG9mIHRoZSBidW1wLCBzbyB0aGF0IHRoZSBidWlsZCB3
b3Jrcwo+IGJldHdlZW4gZXZlcnkgcGF0Y2ggd2UgYXBwbHkuCj4KPgo+ID4gLVBJQ09fU0RLX1ZF
UlNJT04gPSAyLjEuMQo+ID4gLVBJQ09fU0RLX1NJVEUgPSAkKGNhbGwgZ2l0aHViLHJhc3BiZXJy
eXBpLHBpY28tc2RrLCQoUElDT19TREtfVkVSU0lPTikpCj4gPiArUElDT19TREtfVkVSU0lPTiA9
IHJlZnMvdGFncy8yLjEuMQo+Cj4gSnVzdCAiMi4xLjEiIHNob3VsZCBiZSBmaW5lIGhlcmUKCgpJ
IHB1dCB0aGF0IGJlY2F1c2UgZ2l0IHdhcm5zCiJ3YXJuaW5nOiByZWZuYW1lICcyLjEuMScgaXMg
YW1iaWd1b3VzLiIKCj4KPiA+ICtQSUNPX1NES19TSVRFID0gaHR0cHM6Ly9naXRAZ2l0aHViLmNv
bS9yYXNwYmVycnlwaS9waWNvLXNkay5naXQKPgo+IFNob3VsZCBiZSBqdXN0IGh0dHBzOi8vZ2l0
aHViLmNvbS9yYXNwYmVycnlwaS9waWNvLXNkay5naXQKPgo+IEhhcyBhbnlvbmUgcmVwb3J0ZWQg
dG8gdXBzdHJlYW0gdGhhdCB0aGVpciByZWxlYXNlIHRhcmJhbGwgc2hvdWxkCj4gY29udGFpbiB0
aGUgc3VibW9kdWxlcz8KCgpJIGhvbmVzdGx5IGRpZG4ndCB0aGluayB0aGF0IEknbGwgbWFrZSBh
biBpc3N1ZSBmb3IgaXQuCkFsc28gZG9uJ3Qgd29ycnkgYWJvdXQgdGhlIGxhdGUgcmVwbHksIGl0
IGNvaW5jaWRlZCB3aXRoIG1lIHdvcmtpbmcgb24KdGhpcyBwcm9qZWN0IGFnYWluLgoKVGhhbmtz
LApKZXNzZSBUYXViZQoKPgo+IFRoYW5rcyEKPgo+IFRob21hcwo+IC0tCj4gVGhvbWFzIFBldGF6
em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJu
ZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
