Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0050C982D7
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBCEC40D24;
	Sat, 19 Sep 2026 16:12:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NoCN01eeOMom; Sat, 19 Sep 2026 16:12:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org CCBFF40CF4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789834373;
	b=GkIej71qWwZuHmZVpa+I4XHemHkgL3t9rHcKoPOeq8Pk53h0trNydJLtctfwY+uMCF5m
	 Gm2u3uNcSHIjifmr81r2ZQj+zs0WbBDsT4O3AwsWehc9AsK2l/V5ngWa01E71SoZDsl0F
	 6pOpE3Nroo3eeRZFdetb2pyE6qHqMJuFEci2obi0at3a2HV9g9ISTPRAuqceagxdpcWNd
	 +NO3fTxrjQYP6fBM8eJDVxR+e1bKwW5T1wJtHeJb11Jko+Jb31O6p3UJUDBCi5SVdWHxn
	 IPMSnj5q1TE4j5ZmDYw4OJfoG2fC1x2L9KwUQUqd8fBsLzWeHW/yNdvttgHUoK3GfAg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789834373;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9TLHPQ4ROuimtB7mO644o6aJnJzeswyG9IqO88KyurQ=;
	b=UH30dU3Mfp/wjt61UclFI7E+N8l5mpIKWTT5xFNERsknEphXuewajoYle8Kanq2v2Bp6
	 2g47w/fBXIPYhDk268ZvW/wK3jutUTqxDIkY+nurzEim0M+y7UKE4sgcxQS0ZwK1Bp9Yp
	 V6+XSHC1DygSEqDK5vYGF1QNRg+j6hX6ZxVkOQA9Qqf7Fvf8Yj/TLDG8/mMgQw2G4140z
	 Ac/JQlIwHkPOrM83dwShc94KD7KjO8Rt6xz8F7FuBw2RSiMwBgWI4+o/kZXdgCRkIRVBR
	 5tBjfHfp4VWCJRCN7HhlvcXHDWfPu195EW3pdeNu2h1vjGT2gAIh0A+v/WmhQfMbzhg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=YeLrDmgu;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789834373;
	bh=9TLHPQ4ROuimtB7mO644o6aJnJzeswyG9IqO88KyurQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=C6T0Xaeue3I2eyPxuWC+EY8X6tWgX1ghRgWhdXkqQt7ENJOd27RyNzVXSCY7JYuO7
	 VFUBl8bPTnCetO3SVclQwXnnGF0C0CGQGV/381CWjuKOJi8gQ0UtyI1QwetVy/Vs2h
	 Kc6uOJcePXx34UJMoT+QS7E3Y2qKdRyByj4ZRh8UiUyOPsd1aZ6/luJVp5VYmZ6z9e
	 vO6JZZQAphiA+MgCavT6oY4xOCJOQLEopm3URZcj6aXRZ4pJZ6k8SuLaxjL86O1HpE
	 bOKLQ0hK6uyz5PcnsIIeIIBeCTudx4xEnyURPPQFV54oGpE4ufsTCoGzpGvWwTCV++
	 nv6NVS5jgiB1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCBFF40CF4;
	Sat, 19 Sep 2026 16:12:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BA7F8333
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:12:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC9E340CDE
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:12:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xT9FU3Kv1wY6 for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:12:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C744D40CF4
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789834372;
 b=sKm+beYWR1YX24q+gTMfZMga6uGJ/C+yyBTnwkRHewMK9rfaoPd50NnPbeXV6cotNEE4
 uKqCtNaGlN1I7V74fpKhWw+zQD4zj0kJwh+ZCD/t4HQpiW9/xsJfdSoWaK/TIKJiYkXI1
 iULlR+Njo88SkmfVPvoDEHTK91Yia+nJ3Kk4bG/pDbGF6Kj6n1+pD0wCvi24MK8DgwUOB
 SN6E8BWYBwNVFV0hvcKAoy3tCtsl77Z9RdN9LE+XQqSjg1H93e3EP0TQv/EWS5wmsMWfY
 gFaOi86xqXvveU0QXopdwT+OSewdLss0UZgGJofj+NH9ljyQK+p7vzEaK0hI+nWFJgQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789834372;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=paJHYDhT3NPHWu3JbU5vAYV7xq6YLok15BvHVQ/Yl0o=;
 b=QLI4tXCPUIl65xHMINn+imbTbucr/WJ7f4Xu3y3LCNpDKb8yNH3LQQNzo+g8SnktX+fZ
 flF+Rr8bdflvg/LoWc/1bpq53pdWzXg0Rt4BB6RhKmJ/tHqS/7rkArL+8YrQXA8Y1VFJK
 8tuRxfU2DF3KpdL+d74vC2UvgrEOMLWDY/lYwCU2NWa4p34q7T/tYtQM/s5DSs4mbe04e
 BjJ4BeJiw4fIKpJnxDk5F505rU0u5Vg1bALIUHBDmHEi8sLx9fpbct5FbuVYqJpMo9nlp
 AsaRamMfihlsxMKsGCLtzSofjJe8rClM1bmdGOREd77P8WO+vp6L/75AISTr4jK/9Dg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=YeLrDmgu; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=YeLrDmgu
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C744D40CF4
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833556;
 bh=paJHYDhT3NPHWu3JbU5vAYV7xq6YLok15BvHVQ/Yl0o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=YeLrDmguQ7rpcHtxFdfyvxMCxVRvIOTd7vehZgksPCxzRKQ2Ka8QIf14kMET2bIiZ
 ip2YfVFoGUgnfff+Pp+GmYhsOd6z6NABapCiXezuOXPVUr2mGQvj30A8SjNTlByywj
 9w5kUjXwYObReLiXKIKdS8lkCb0G8RxCNpbsPz0FxlPa5oEdOptOqJVtq56wPSUJFS
 gdyeejng36mxFefzKhpQB/QwJYRfNCyG91C2Z3hnQX8Nu5F6P8yTinNaExB08HyAho
 uK+tt4z0GpwkjjKgZBasQf/X67LfmFYG1BljOAD5Sd2KJk2nA7pYWgeaj1mDqf6ceH
 y/R5nJ1xAqZuw==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:KBdQNDtKFgwkQKsllez5b/ARMN/orP67wyFdyWaOEQ2W43vWpvkVIdcv6MK7V0jcdx1sVzhspa66rLkFRYyw3okBJvfMlIYrl2U9d8P8u6ND77c0+M1pRqbhOrAwNq/QTZD1JvMqyTi03WIGfzogQbA6JIJ8dx1iTpPeXdSVwpYcr+URfFCSOG07ZfOAxBr8aaLWL1AEyt4M/fyYXCRh9cj4Qbk1zMoIVzu2rTyHzQ84ad/IBHPpODQShwOBzD+EKxeJpqLp8OWmwbjsdzLDkaoB6I5jBRbDlE/84ic15bf9nMMh6nASmkZcebLJRHkXwMvpPmPbmjCRma8x0dsXrsaVobYaQDFFX+vv4Ek2T7UjrCQ6LLlRta1vggsKN1ZX97CJGfmNtWjqefou15nksXaxm4ZV7lFGdbyahFqsdmYXDO5ml90a+81Ybpe840AYfZrNnm2OvaCCMnRjU/KTg+h6GNNpgnB0J3k63dIL5uMc3BnMkGXZSV1J/7e04Upko7E+4YzlPYhj57X+J2cWzpW/aOTe/YCyhuKej9f0HKu6WlOiA1cyTzi5u98LlNszc3xet8oLe9kij9/U5rbQLZxeZKN9Isk3uqtHnPe0TlJeNU
 sVHW46R4ameQtgBmxtBSr2ADBMm6qiKx9V3vL7ZA==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4B692A4C4855;
 Sat, 19 Sep 2026 17:59:16 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSv-000000005Jx-0xhk;
 Sat, 19 Sep 2026 15:59:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:58:26 +0200
Message-ID: <20260919155845.5776-62-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v2 61/77] package/rauc: Fix build with OpenSSL
 4.0.0
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
Cc: Koen Martens <gmc@sonologic.nl>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>, Marcin Bis <marcin@bis.org.pl>,
 Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KLS0tCiAuLi5OMV9T
VFJJTkdfZ2V0MF9kYXRhLWFuZC1BU04xX1NUUklOR18ucGF0Y2ggfCA0OCArKysrKysrKysrKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAw
NjQ0IHBhY2thZ2UvcmF1Yy8wMDAxLXNpZ25hdHVyZS11c2UtQVNOMV9TVFJJTkdfZ2V0MF9kYXRh
LWFuZC1BU04xX1NUUklOR18ucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3JhdWMvMDAwMS1z
aWduYXR1cmUtdXNlLUFTTjFfU1RSSU5HX2dldDBfZGF0YS1hbmQtQVNOMV9TVFJJTkdfLnBhdGNo
IGIvcGFja2FnZS9yYXVjLzAwMDEtc2lnbmF0dXJlLXVzZS1BU04xX1NUUklOR19nZXQwX2RhdGEt
YW5kLUFTTjFfU1RSSU5HXy5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAw
MDAwLi5iYTgwMzJjNmU3Ci0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9yYXVjLzAwMDEtc2ln
bmF0dXJlLXVzZS1BU04xX1NUUklOR19nZXQwX2RhdGEtYW5kLUFTTjFfU1RSSU5HXy5wYXRjaApA
QCAtMCwwICsxLDQ4IEBACitGcm9tIDEwMWFhY2FmODJkMjUwYmZiOGU1ODFlMDAyYjJjMzgwODY5
MDgwZWYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBCcnVubyBUaG9tc2VuIDxicnVu
by50aG9tc2VuQGdtYWlsLmNvbT4KK0RhdGU6IFNhdCwgMTEgQXByIDIwMjYgMTc6MDY6MTAgKzAy
MDAKK1N1YmplY3Q6IFtQQVRDSF0gc2lnbmF0dXJlOiB1c2UgQVNOMV9TVFJJTkdfZ2V0MF9kYXRh
IGFuZCBBU04xX1NUUklOR19sZW5ndGgKK01JTUUtVmVyc2lvbjogMS4wCitDb250ZW50LVR5cGU6
IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKK0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhi
aXQKKworVXNlIEFTTjFfU1RSSU5HX2dldDBfZGF0YSgpIGFuZCBBU04xX1NUUklOR19sZW5ndGgo
KSBmdW5jdGlvbnMKK2FsbG93IGFuIEFTTjFfU1RSSU5HIHN0cnVjdHVyZSB0byBiZSBtYW5pcHVs
YXRlZC4gQXZvaWQgZXJyb3JzCitsaWtlIHRoaXMgd2hlbiBjb21waWxpbmcgYWdhaW5zdCBPcGVu
U1NMIDQuMDoKKworZXJyb3I6IGludmFsaWQgdXNlIG9mIGluY29tcGxldGUgdHlwZWRlZiDigJhB
U04xX09DVEVUX1NUUklOR+KAmSB7YWthIOKAmHN0cnVjdCBhc24xX3N0cmluZ19zdOKAmX0KKwor
U2lnbmVkLW9mZi1ieTogQnJ1bm8gVGhvbXNlbiA8YnJ1bm8udGhvbXNlbkBnbWFpbC5jb20+CisK
K1Vwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20vcmF1Yy9yYXVjL2NvbW1pdC8xMDFhYWNhZjgy
ZDI1MGJmYjhlNTgxZTAwMmIyYzM4MDg2OTA4MGVmCisKK1NpZ25lZC1vZmYtYnk6IEJlcm5kIEt1
aGxzIDxiZXJuZEBrdWhscy5uZXQ+CistLS0KKyBzcmMvc2lnbmF0dXJlLmMgfCA0ICsrLS0KKyAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQorCitkaWZmIC0t
Z2l0IGEvc3JjL3NpZ25hdHVyZS5jIGIvc3JjL3NpZ25hdHVyZS5jCitpbmRleCBkMmFjYWM2Yi4u
OTFiZTdiYjcgMTAwNjQ0CistLS0gYS9zcmMvc2lnbmF0dXJlLmMKKysrKyBiL3NyYy9zaWduYXR1
cmUuYworQEAgLTEzNDQsNyArMTM0NCw3IEBAIGdib29sZWFuIGNtc19nZXRfdW52ZXJpZmllZF9t
YW5pZmVzdChHQnl0ZXMgKnNpZywgR0J5dGVzICoqbWFuaWZlc3QsIEdFcnJvciAqKmVyCisgCQkJ
CSJtaXNzaW5nIG1hbmlmZXN0IGluIGlubGluZSBzaWduYXR1cmUiKTsKKyAJCWdvdG8gb3V0Owor
IAl9CistCWlmICghKCpjb250ZW50KS0+ZGF0YSB8fCAoKCpjb250ZW50KS0+bGVuZ3RoIDw9IDAp
KSB7CisrCWlmICgoQVNOMV9TVFJJTkdfZ2V0MF9kYXRhKCpjb250ZW50KSA9PSBOVUxMKSB8fCAo
QVNOMV9TVFJJTkdfbGVuZ3RoKCpjb250ZW50KSA8PSAwKSkgeworIAkJZ19zZXRfZXJyb3IoCisg
CQkJCWVycm9yLAorIAkJCQlSX1NJR05BVFVSRV9FUlJPUiwKK0BAIC0xMzUzLDcgKzEzNTMsNyBA
QCBnYm9vbGVhbiBjbXNfZ2V0X3VudmVyaWZpZWRfbWFuaWZlc3QoR0J5dGVzICpzaWcsIEdCeXRl
cyAqKm1hbmlmZXN0LCBHRXJyb3IgKiplcgorIAkJZ290byBvdXQ7CisgCX0KKyAKKy0JdG1wID0g
Z19ieXRlc19uZXcoKCpjb250ZW50KS0+ZGF0YSwgKCpjb250ZW50KS0+bGVuZ3RoKTsKKysJdG1w
ID0gZ19ieXRlc19uZXcoQVNOMV9TVFJJTkdfZ2V0MF9kYXRhKCpjb250ZW50KSwgQVNOMV9TVFJJ
TkdfbGVuZ3RoKCpjb250ZW50KSk7CisgCWlmICghdG1wKSB7CisgCQlnX3NldF9lcnJvcl9saXRl
cmFsKAorIAkJCQllcnJvciwKKy0tIAorMi40Ny4zCisKLS0gCjIuNDcuMwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
