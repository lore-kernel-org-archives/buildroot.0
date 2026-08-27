Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69928C61DBE
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 00:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB7F580996;
	Thu, 27 Aug 2026 00:47:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2pFuq4Q6Zjrl; Thu, 27 Aug 2026 00:47:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787791653;
	bh=PyJ+8STYJnE9vEC31EIVOLwZf9Y2t7Q5LqsZSseUo48=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p2gLrSiW9oeik/ttXbWnKjYTn9vS/0bU60S/EAViYYsA62+5TOzt6JNETJ0+UTllO
	 4P5cutCqNn9FJ/skRC0MwBvsCk9BKSN/LSKrix7eC3mqE74Kq84gauLHUVJ3gGq6sl
	 CSFXWDODy+byyRaHrCIpOcgj4PmXyogTS7pOxVsm0+ijpJRo/0A/814lczba0lrPOm
	 VBO1opJjgQZnSNOkMk1Re1C9kRYArNOwO6X3vxIB32Kkkq25RXEvyY6tTIL6hInKlU
	 MV7ZkA8LitgOsCbPqeFMw7N8evZNcruDnJbx3GqKqcIs1YtoCiI1FzUL/AoKdvycZB
	 K2ICHn1ISQmFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B35E580993;
	Thu, 27 Aug 2026 00:47:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 01434334
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 00:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E704C404F7
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 00:47:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ORHRTiLd2056 for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 00:47:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com;
 envelope-from=matthew.l.weber@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=thewebers.ws
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=thewebers-ws.20251104.gappssmtp.com
 header.i=@thewebers-ws.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=FbjWZpu3
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B812403BD
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 00:47:29 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5b159850b16so1312252e87.3
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 17:47:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787791647; cv=none;
 d=google.com; s=arc-20260327;
 b=WQ59exkjvZzppTD1cgj3+9ZVvYB6fODknwwhy1/XKuDe0f188BocDmWmKsQHLlHkW1
 yNNZNSf/cO9ddFtSQHY2Y/4ePcQpIKWrKK0MiH/1l9l3bupwLoYM5OnB3kDSCGIeXLi9
 uvpYx1IcFuAN/B2bwBEE2x4GTW9G9qcgS71935LwKawYma+hxOkuXDPH3UqIZb/appn7
 6EXJo6RZaEcEgpq5Nt5K4pm2KJNygtQYGKdSMxRrsyJ96mNKtJBpRuDeB8Bpr87+TwXM
 0frxYBGki4zTOKtG4mVx8sYwgNHXNlUCOkcTh9pHsY3mrK2/+SakXKVD8nfpXkCSmtnh
 672Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=yZPRL/2fetPMQ4YWEKFgHo58ezS6u5Q5+gUCCAMiWGc=;
 fh=2AgEs1vvEY1FZ2pFR9FIfo1m5yePocERthq97wSCbGU=;
 b=HAzeRuqzhFFgwmY8drRLKCMSEa3v9r9Sf5legXO3PZVsSpxHpb53+UvIbQiOY+P+MO
 KENbyL28F7w0Hw4um0tY/3Va/ld7yPXvl3o2KtsGPd6dVH1phQikQlnsltBkwa4noDIS
 L6IUdhT53u+AJ4MmL6v27AIGApfzTvNt6+ljR9jrvdc3+Vz8dJa4iDjg1Idn5umHvq5R
 5+l3Aum5mQazv/kgtm4G77cWUE03Gr97Ifk5PoHH4AQMP/RbvfpSMrPwNR5fhVYmJtUM
 zbGFHrAVuz+Hk/JoaYciwqU4AntpwR7XvqNom10led6kXwIw3S2nsbPMJqHcstKMOrSx
 bBHQ==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thewebers-ws.20251104.gappssmtp.com; s=20251104; t=1787791647; x=1788396447;
 darn=buildroot.org; 
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=yZPRL/2fetPMQ4YWEKFgHo58ezS6u5Q5+gUCCAMiWGc=;
 b=FbjWZpu3g6uh+dFY7mYzLD1IOK6pz6GU6kEcX8mlro+RPPbUP12QSSXcvEpwFxyLze
 eZ87ttyZ4Z082dn/EyhHq8FBPmabKVyiJxxb201oeQhMdDKON2uimqKUPkC0OY5wOM6J
 Yvp31yxiMVuAb0NP84cRPVc35SRe9o5PJ7sEzRwvb0DYxgefoynPRBl1MGE1k3RtItRC
 JpWEEmcYVLf9ZUVYIFyFluXWoTn8tiq97YeIaU8QmXG2TXg2E7/Dvqh79Ryl2JTzctwX
 LtbFhjEqFfT/hMXhfol/l8SBej7wXed24YvQ6FhaWTzvwK7yLTw2SL7fSmSVmKamG+cZ
 EUag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787791647; x=1788396447;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=yZPRL/2fetPMQ4YWEKFgHo58ezS6u5Q5+gUCCAMiWGc=;
 b=Aw38ZQyiU8ElZI4Vr71cvlE1vRS2nXprtCweOH2Tf6A3+gPugUJt6IUswukdYm4/NN
 URZTq4KIe3skQeXacO0hEWfrQLpGEunvNm1umJ5aGMfEt+r2+iuFHOl/aLUtmD7XhfMe
 5ZTpM7loUNQg/l0gj2wW5uwJhA2/6CKtZjcQa4q8N/yOwR2llm1Uo3YrPjBGavZ6cSAs
 1bWnnFC+/N+H0E5d9wx+4eCQaSS/Mg6WvtG0JdQV2Kd9Bb/MCd4r87t7YlpotOsAyqJz
 3qTZ+19cVwFE4UGV7oKJINF6sEe9c3Hu1Q+gDk81kokth7jAzhOu4pavGslV3GJoLA2U
 hz9w==
X-Gm-Message-State: AFuF++m947dHUO8ZwnSsgdzokqDhGFhVfaxs+xRq4MXlG9ic5TGBD9p/
 L8mLHUPLKfcKZ7MpOH6dffkN1T1VCHlafO2+GKTxoNCvbqfP+GFfF0uYk/zuFNd1gBqlWCcJbnM
 xHInZUY+BmDgMwCUX5AhnCuuWw8ZR6Ss=
X-Gm-Gg: AR+sD10am4dhV77MZbPKA+6Ia9giejwmj8wLao/0Gji0ipjAxpga5EzdgRjJcRtyjX7
 JiBXM5bTcsnl6omSA0+qtWnK5rth8pb3YK5po/Q+u3So8N8S5Ib3eLyw0EqG7ApfcwnwTJUMrxe
 Z+XLPCdRkDehU9l+WiAii/dPcD0MJuCFHyMgTccqX0KUpD/kYDUtA0ejxUx7aiNEc9Xhyak7293
 fNaIkdzasz60hGP+Kv5vOXRosX4KMMkpKTZOAotsBsA8B5aDKbMl2tbTRma0+YSI89tztTxJHTi
 88Vwrf/JdMNJfow6KNQTDHTzUunTf6Yl6+G7UEdnCR3e
X-Received: by 2002:ac2:548f:0:b0:5b1:121e:56ae with SMTP id
 2adb3069b0e04-5b4a902233dmr2487835e87.11.1787791646700; Wed, 26 Aug 2026
 17:47:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260826064649.292291-1-neal.frager@amd.com>
 <20260826064649.292291-4-neal.frager@amd.com>
In-Reply-To: <20260826064649.292291-4-neal.frager@amd.com>
From: Matthew Weber <matt@thewebers.ws>
Date: Wed, 26 Aug 2026 19:47:14 -0500
X-Gm-Features: AcwNN1VRh5JJMBlSKculDktTEF0UJTUaKjptO1uJWxI0MeU3SaYREK3rGaO8dyQ
Message-ID: <CAFt09wNJBp=V7UU1SS9vPLHLj06-Rkh47rLeq6MWgHT9Nk9rhw@mail.gmail.com>
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, alistair@alistair23.me, 
 stefano.stabellini@amd.com, ibai.erkiaga-elorza@amd.com, 
 luca.ceresoli@bootlin.com, micheal.saleab@amd.com, yann.morin@orange.com, 
 matthew.l.weber3@boeing.com, Matthew Weber <mathew.l.weber3@boeing.com>, 
 brandon.maier@collins.com, john.ernberg@actia.se, brian.j.wood2@boeing.com, 
 ju.o@free.fr, stewart.hildebrand@amd.com, thomas.petazzoni@bootlin.com, 
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Subject: Re: [Buildroot] [PATCH v5 4/4] package/xen: add custom git support
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
YnVpbGRyb290CjxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cj4KPiBGb3IgY29tcGxl
dGVuZXNzLCBhZGQgY3VzdG9tIGdpdCBzdXBwb3J0IHRvIG1hdGNoIHRoZSBjYXBhYmlsaXRpZXMg
b2Ygb3RoZXIKPiBwYWNrYWdlcyBzdWNoIGFzIExpbnV4LCB1Ym9vdCBvciBBVEYuCj4KPiBUbyB0
ZXN0IHRoaXMgZmVhdHVyZSwgdXNlIHRoZSBmb2xsb3dpbmcgY29uZmlncyB0byB0ZXN0IGxhdGVz
dCByZWxlYXNlIG9mIHRoZQo+IFhpbGlueCBYZW4gdmVuZG9yIHRyZWUuCj4KPiBUbyB0ZXN0Ogo+
IEJSMl9hYXJjaDY0PXkKPiBCUjJfVE9PTENIQUlOX0VYVEVSTkFMPXkKPiBCUjJfVE9PTENIQUlO
X0VYVEVSTkFMX0JPT1RMSU49eQo+IEJSMl9UT09MQ0hBSU5fRVhURVJOQUxfQk9PVExJTl9BQVJD
SDY0X0dMSUJDX1NUQUJMRT15Cj4gQlIyX1BBQ0tBR0VfWEVOPXkKPiBCUjJfUEFDS0FHRV9YRU5f
Q1VTVE9NX0dJVD15Cj4gQlIyX1BBQ0tBR0VfWEVOX0NVU1RPTV9SRVBPX1VSTD0iaHR0cHM6Ly9n
aXRodWIuY29tL1hpbGlueC94ZW4uZ2l0Igo+IEJSMl9QQUNLQUdFX1hFTl9DVVNUT01fUkVQT19W
RVJTSU9OPSJ4bG54LXJlYmFzZS12NC4yMV8yMDI2LjEiCj4KPiBBZGQgdG8gcGFja2FnZS94ZW4v
eGVuLmhhc2g6Cj4gc2hhMjU2ICBlODAxNmU4MTYyN2ZlM2I0ZmNhNTQ2MzcyMzQyODYwNmNkMzc1
MGM3ZmQ3NmEzY2ZhYTBiMGQwZTdjZDliMzJiICB4ZW4teGxueC1yZWJhc2UtdjQuMjFfMjAyNi4x
LWdpdDQudGFyLmd6Cj4KPiBTaWduZWQtb2ZmLWJ5OiBOZWFsIEZyYWdlciA8bmVhbC5mcmFnZXJA
YW1kLmNvbT4KPiBUZXN0ZWQtYnk6IE1hdHRoZXcgV2ViZXIgPG1hdGhldy5sLndlYmVyM0Bib2Vp
bmcuY29tPgo+IFByaW9yIHRlc3QgZGV0YWlsczogaHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vbWF0
dGhldy1sLXdlYmVyL2MxN2YxNGEzNzkzY2NlZTQ0MGEzODNlNDE3N2ZmM2RiCj4gUmV2aWV3ZWQt
Ynk6IEpvaG4gRXJuYmVyZyA8am9obi5lcm5iZXJnQGFjdGlhLnNlPgo+IFJldmlld2VkLWJ5OiBT
dGV3YXJ0IEhpbGRlYnJhbmQgPHN0ZXdhcnQuaGlsZGVicmFuZEBhbWQuY29tPgo+IFRlc3RlZC1i
eTogU3Rld2FydCBIaWxkZWJyYW5kIDxzdGV3YXJ0LmhpbGRlYnJhbmRAYW1kLmNvbT4KPiBUZXN0
ZWQgb24gVkVLMzg1IEV2YWx1YXRpb24gQm9hcmQKPiAtLS0KPiBWMS0+VjI6Cj4gLSByZWJhc2Vk
IHRvIHVwZGF0ZWQgbWFzdGVyIGJyYW5jaAo+IFYyLT5WNDoKPiAtIG1lcmdlZCBpbnRvIG5ldyBw
YXRjaCBzZXJpZXMgYXMgdGhlIGZvdXJ0aCBwYXRjaAo+IFY0LT5WNToKPiAtIHVwZGF0ZWQgY29t
bWl0IG1lc3NhZ2UgdG8gdXNlIHJlbGVhc2UgdGFnIG5hbWUgZm9yIHRlc3QKPiAtIGFkZGVkIGVy
cm9yIG1lc3NhZ2UgaW4gY2FzZSBubyB2ZXJzaW9uIHNwZWNpZmllZAoKClJhbiB0aHJvdWdoIHRo
ZXNlIHNlcXVlbmNlcyAodGVzdCA0IGNvdmVyZWQgdGhpcyBwYXRjaCwgbWFrZQp4ZW4tc291cmNl
IHdpdGggQlIyX1BBQ0tBR0VfWEVOX0NVU1RPTV9HSVQpCmh0dHBzOi8vZ2lzdC5naXRodWIuY29t
L21hdHRoZXctbC13ZWJlci8yMzEwMTQ5MGE2ZTk1YThiMGY0NDVlMTRlYzIyZDlkNQoKVGVzdGVk
LWJ5OiBNYXR0IFdlYmVyIDxtYXR0QHRoZXdlYmVycy53cz4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
