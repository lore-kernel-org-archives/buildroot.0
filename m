Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED8C4CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2B4760E8E;
	Sat, 10 Oct 2026 09:24:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bLV4JwjUxrPr; Sat, 10 Oct 2026 09:24:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2F76C60AD8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624294;
	b=nszNk+OSLF//Eiay6hxtMXJYmTWOqQ3YubNNB22BVc79aoRO30/c/iYRUhc/ScDoGm8Q
	 gqBLc2FWFGX7q/Z+h4UwvrZQOjvKNvJW1sqCz+YQALCOewJzk4XQd3fH5qQHmAdamwIio
	 G3lcyVhWsWCkQxZSfLksVLta4YH/8LnWbKk4kC4slpBEyzIQDHwziPfeqrfF3TysH1Lqo
	 FhBVZ+mTJed6L1l+EJPdUa0liUr6K+koAAiNqPDMeFe87qsF+T2H3jEXZA+t9pFwB3eq7
	 p+M/ZUPedS+nlMk4XJFKS6m54aVIiNt5ic5E1LFzOg43pp8gdnjVZoF9aJXmzkXMr8g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624294;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=z6+tU/1CpAnxPKGQcQloowyeYYtH1ZDGBT5+FRWXZyM=;
	b=bqOEfsSL2sdkvqzV99UQbzwm7X/vMiNw9eKfipPCaLlGS4rfDdcB5qcsrYM6mpcuZER/
	 voETBrNw3tD7aik8ZvpbmJQEnNvYoj64kNdakpMpvanrSlk+OfN3N+F8a1Zn3Pmqn+qCZ
	 GyPetkSl68GKSjypGJKihK7THOgexWmaiZhNUcU+NSSBQoF9u9xCAJOWs3c70KHrRaf+P
	 Qr51Zoc9tv8L0KLdAdbwrH5M4LSLyLrFW3PYyRUqV5Qmzg9PUDZASxWuQD6t8jPx5WU9F
	 jnWj8W3fnLKClcvBWbE97mljyTwHDXOH1s7Kjj58sRf59/5npTe9dAGFDNr6UzaK6hA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624294;
	bh=z6+tU/1CpAnxPKGQcQloowyeYYtH1ZDGBT5+FRWXZyM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=djdd4EZXrqdsVbKbRAxPAAfgSuoIG/Q/SaV1Iz7A3CTQnYvb3GYROnoroZaa8oP7e
	 O0dynjSNw3fhLKHWxJUfIfSr+cCR1tZLBdtUqBQahEJ50nuMpFN7/2NpVbmvN8fOID
	 EqPgbtSAs+s/SjGK78r7UD0sqNGuw7fGm32KxVI9VHSWnenzn2HJGwjz+kvDev0GA3
	 nSCV4kYq3wmEKzssKsF58CXDQDyu24ZUA47QuwEfgVNu4tIp/9dYybJrh4CQd67JAn
	 xqFKIUToYAmVr3H/0VF2O9PBTr8P6hwUUJ/xCVoYJQs/7bc4/fR4z3/Sg3ttmHeyxa
	 rj4csP648D2Fg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F76C60AD8;
	Sat, 10 Oct 2026 09:24:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CD27A75
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEB8360ACE
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:24:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Si6ey8IWVVmO for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:24:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org ACDA7608F9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624292;
 b=onHJSfiN4Zden2NkwFkcTTyTGLozDo6edLKkkAruCdu4fhLVJTxgGnIU+WYH4bGLDvkK
 4MFIb6qmdBp6Qzr9BVBpcbLk26G7SX6CBwN/uTVYFIkQD0hk1qi60hk2EvWdezDcVDTrm
 q6o6KdKCCQlWL3mRRE7eCU1kk4wZvWzkLVxEaocFheGmX9zQpAlSNLNtLlqMTBYG7W7oJ
 YFfbPb87YUGA3S18WnKEAQysyFMLDHpxlSv/FtNCyhFfwbJmlRP5lNm17zpPiOqOoMaPu
 HQm1Pxlg7av3imhuHlSP0QzWhM4nArAMvE4MqqXgolsUl4NjcJrL/HpAKn9Mz9M1uWQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624292;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=iPE+6L30MtyN1JdpgmLMFY8GkL9CLCUn/D94aCNFQIY=;
 b=AXlvLSioM1Xrhvqf98xvnHRenohp8taQVSUcLtLUa/SjCkjExzUpFDQtDst3QLoleern
 UBhymJWGCBMw/LrSsIYLSWtL3Q62pBLb61Fisi2VBbmgW76/eXoZr5EG8Z0ENP+rP8E3P
 H18fPDzZXth6qSM/5Uungu+WGqQymevjygtXM4kuJrT43JCjJRvcbrZz98iSdc2LwU/iP
 ZobyoiVbyQ+zLVZ4ZNcW9XTVqIonx6X86opknqAEOCKQjIyRdkWx2bnIu/7GA3jVgHvSL
 fz5vpXKdAAZUUWho7gXfaBDcLxLPUUn5WfWD5aKi3lGzZMxVwB55AgeXP88x3gwbn5A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=bMIFBHla; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::434"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ACDA7608F9
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:24:51 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-487049569b6so291826f8f.1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 02:24:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791624290; x=1792229090;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=iPE+6L30MtyN1JdpgmLMFY8GkL9CLCUn/D94aCNFQIY=;
 b=o3vBteCob6EZVoOqXMRM4qe9KhF24CJxyCQ/GTVzymijdjZVPfuepdADrkQaK/G6H0
 Vtp9wUI+eZg7W9r7F5f12TTei6wWCY846Jsu0JTQ6eYWWp3V7tReG0To8lhXgk+py412
 wU/dHXvhusi05tCDr2rf0DFoN60TEuYpO6m1JbBbWHlmwgGvHZ4m2U1rfWUZJt/zumq9
 658EqE7LBBdIL+0FZ2ab2GVLRrLXlUtlUygUwSqv+bkL07zp8Iq7ehw/gO7TK151m6CN
 rIKXGWdfeFnrew0Fh5hdDsHN97HhRLIB2s5ZdWBtueXesXuUHR9iEzn8s7utX9A18FJp
 yv1A==
X-Forwarded-Encrypted: i=1;
 AKwUvBxDW/eyMD8ojzwZ6Oxu7y912dk0SAmdKq6BDzBOSTXHNbNII2FRdrXslzZlZ6RPHGCRToyXGgEhiTw=@buildroot.org
X-Gm-Message-State: AFq9FYK9npedTA+mYJLRAhlvxnaVVfXM4z6azSHB4CZsLNMyYTSCbQ4X
 HLqvwkSHo91Ae+quvbrAlnMm7wR2SUsAZR0454K289WQkyq29ZidlBhN0/3yRQbtON5fiyKbSoi
 P24NpqzM=
X-Gm-Gg: AYBFou1bO/ee9aCfpSXMNnQ3bh/XyHq5m3ftTkCP8jbP/knmK5+aDMR3fE3l8zGQ1mj
 FD0XfYhwjP0JddMrNezBnXU4WDMeOQ6MhiHFh+j/0FcFFDGN9tYyHueOxTbng4RUf2gdT3xN/Mv
 SLWitVY/exYQJFRpMTuLULf3kn2Z9EphuxEY5cDkNrgISnze6/v07E6lkJaXbqi6hUEDlDEcXge
 rd5Dc1kSDvkm6aYgO0fWUQhPTVBBaSBTWIXSs+pQBeQk21ucHIQxfZE6ni53bTbv+GH/sDZp1Bq
 NEp5F57R40iDcbdjgsvQrAy0RuSH0O8fSkp1yunqnJz0DV4+8U0e+CGPOhBUOramFxm2vuLWZk4
 lPyn0fLvRW98XR83HCXej4/q2rYFZzXKYYMzMVDbZYWrqYwCJSrQg1Q1J2TAV6j0oKZcqMuSi2k
 o2gDAgTbPXvfJoLYJr0NYsLHRHth+5j+GLwWqfHZQb1uFRWMJMcfN60wfUQsPsjpDFaiwaJAMqT
 OZJYS5P61X/jplRpRnlHsjWldTxGu72d17sDsHS0+OrjUwa0DStmlWwNQfo6QfviIM=
X-Received: by 2002:a05:6000:4313:b0:48c:77e3:6c8e with SMTP id
 ffacd0b85a97d-48dbacf4700mr7842051f8f.49.1791624289684; 
 Sat, 10 Oct 2026 02:24:49 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dbae37509sm7399730f8f.7.2026.10.10.02.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 02:24:49 -0700 (PDT)
To: =?UTF-8?q?Bj=C3=B8rn=20Damstedt=20Rasmussen?= <contact@bearware.dk>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 10 Oct 2026 11:24:42 +0200
Message-ID: <20261010092447.140383-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003173657.1235590-1-contact@bearware.dk>
References: <20261003173657.1235590-1-contact@bearware.dk>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/setserial: CPE ID for setserial
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gVGhpcyBpcyBhIHZhbGlkIENQRSBJRDoKPiBodHRwczovL252ZC5uaXN0
Lmdvdi9wcm9kdWN0cy9jcGUvc2VhcmNoL3Jlc3VsdHM/a2V5d29yZD1jcGU6Mi4zOmE6c2V0c2Vy
aWFsX3Byb2plY3Q6c2V0c2VyaWFsOjIuMTc6Kgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJqw7hybiBE
YW1zdGVkdCBSYXNtdXNzZW4gPGNvbnRhY3RAYmVhcndhcmUuZGs+CgpBcHBsaWVkIHRvIDIwMjUu
MDIueCAmIDIwMjYuMDgueC4gVGhhbmtzCgo+IC0tLQo+ICBwYWNrYWdlL3NldHNlcmlhbC9zZXRz
ZXJpYWwubWsgfCAyICsrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiAKPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9zZXRzZXJpYWwvc2V0c2VyaWFsLm1rIGIvcGFja2FnZS9zZXRz
ZXJpYWwvc2V0c2VyaWFsLm1rCj4gaW5kZXggOWJlZWUzNDljOC4uOThiMmRkZTJmOCAxMDA2NDQK
PiAtLS0gYS9wYWNrYWdlL3NldHNlcmlhbC9zZXRzZXJpYWwubWsKPiArKysgYi9wYWNrYWdlL3Nl
dHNlcmlhbC9zZXRzZXJpYWwubWsKPiBAQCAtMTAsNiArMTAsOCBAQCBTRVRTRVJJQUxfU0lURSA9
IGh0dHBzOi8vc25hcHNob3QuZGViaWFuLm9yZy9hcmNoaXZlL2RlYmlhbi8yMDI1MDMwN1QwODQ3
MDFaL3Bvbwo+ICBTRVRTRVJJQUxfRVhUUkFfRE9XTkxPQURTID0gc2V0c2VyaWFsXyQoU0VUU0VS
SUFMX1ZFUlNJT04pLTU3LmRlYmlhbi50YXIueHoKPiAgU0VUU0VSSUFMX0xJQ0VOU0UgPSBHUEwt
Mi4wCj4gIFNFVFNFUklBTF9MSUNFTlNFX0ZJTEVTID0gZGViaWFuL2NvcHlyaWdodAo+ICtTRVRT
RVJJQUxfQ1BFX0lEX1ZBTElEID0gWUVTCj4gKwo+ICAjIG1ha2UgYWxsIGFsc28gYnVpbGRzIHNl
dHNlcmlhbC5jYXQgd2hpY2ggbmVlZHMgbnJvZmYKPiAgU0VUU0VSSUFMX01BS0VfT1BUUyA9IHNl
dHNlcmlhbAo+ICAKPiAtLSAKPiAyLjUzLjAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
