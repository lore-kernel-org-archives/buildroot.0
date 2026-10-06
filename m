Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBA3CA6001
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9BD560B20;
	Tue,  6 Oct 2026 16:40:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FbmO4T_vl7lW; Tue,  6 Oct 2026 16:40:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B300860B54
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304820;
	b=n+rCRPIVTayQY+A0jcmbTVwJRBU/8T9a8biXzm6rpnwitBf6y76tLkC0KcvFiYnnZ6ua
	 uT6qe4e/V7ZJ1JGvnSikhgd2zU9NnNVEQB4LUaKre796sKAVGKuLpjilPt6D1RmrB2USz
	 3YU6oci5NZYdVw7g28tqv5slsWkCChBKFT4wo1ittOomSpR1PIUbU8EyJdgwpBeT2YuC0
	 BtZxSzKqZTHa185EoWp28i8q4hfaC3YhVI2vM9MLbuxALRVQFjBInJM5f2XMPrBFrhF89
	 4RCMV28l6vxzZl8lSVAy5SZ5iHpMcKWmZ3D6pttTO5X4raq0milYovgXqxRCkhxr0Aw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304820;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=YQbtep1GjKztyXO+XVMuIFrCesnCvpPxiza9gjCKZX0=;
	b=WcBfxGknMNtQKUAdB9kD3s3dD42PH3d1tBrJlAOUQTJrSj2P9TqmazeP3FGp4kgEixf9
	 aaS82V0+8XNSF3nFyimorsE9uMsbxE9WohkPNnSvvNHgvCoBt/w8e31K8LQiHvk/gz9KA
	 TgSEO26D8LKwM8JF/FXZhv7184v5oLTMTcu+/64wxxrLZ8JrCTYzOQU803TkqJzyy6Qw3
	 lLPJfBI8gviWbeAqtkhvkiYsHIww30PHM64UjiTYBBvznEAR0ncaiX5yyWIeYxV6E7e8T
	 bnxpo91/KiW0CDomhQtNXE1z+dFhh6b4sMeb7k1iF9rzcNo6hphUMxmxj6/VCNlBJnQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=aK8Nyup0;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304820;
	bh=YQbtep1GjKztyXO+XVMuIFrCesnCvpPxiza9gjCKZX0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hekutyv4o2lC9SRu4QMPKMs8xKLPz7MslLOcz4OSQqbHCntj0XviSUHhGJdh9P+SU
	 4O9T9NIziJ9na6c/izHxyKusOTPFkq07rkXTn6DOLOw0kG8IgJjyD0ImaaYNj5pttZ
	 +CjaMO4s6Lc0hmRL7t3gcG9NzCD/e1nEX5cMC1L3vVDblicN4CLeLfgLKXlwqUZzux
	 msHZypiGA72WxSIv3+2wITnXvu0jQujpAxAGSeUvBtxzk4WZph7SnQ1iNlIc+XzsoA
	 Md3cWB3mMhDdB7j3GdRhl992WyPrGwD2kELvBtnmtXVTp6VtvtTggn+srv2TuQXXqi
	 70fzmN1kVhWZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B300860B54;
	Tue,  6 Oct 2026 16:40:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 00767317
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DAB48608A6
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:37:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CATLO3TWZ3pL for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:37:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 07ED9608A3
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304624;
 b=r4Zrdx4ZpVgOq9C5SGs/ZKdl6KqqT2m+6X+hJ7PwmkU47kduh+esi/DXdaUODxaZ8Rhg
 I/OTLfnz6giMwJM0OEENyxTuLEtq0avTiHsIswN5W09bEOYLsrOFkf+qzNFGp8PfEilH7
 dSWfHehUkXOzsYuF5jp4DmXAIrqDMyN5Uqh3w0Y1FGSFz3jKvUfjxRlrp2sTBMH0WCnQs
 Y3LTNGLKiYAQqyzFbvbLlyr/s9tdOvBPG4/ceejRrTDLDaVA6+b0e6wNdk02obWwSeTuO
 EnchLXVr3vw4RWiD/+ynD9Gw8K2gNahs55k4VPsJ0iMcyC7V2IE7khN3gEH0HCm5FTA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304624;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=i4E79ACSjbp87B0JexCcjSKBmD0ULIhZSkRGVtInlNk=;
 b=sOllc3IOLO8PUW7v6P9g305YiWH3NKTtY3S0QZJ1imrxe0BLRrHP1PUou4OWgnBEOk1/
 tU34ETfcyY29r2dqaGeUytkox9Nrb52v0ZyVMajTYahe/xqYR8FfG1MvgcFu9j8i0SGT7
 7+I/9/QZ/irq4i5uEz02qBQ3aFIH+lL7XX+HIiv+apFWQomw7jIloz6sIE9PMBnqyk5JF
 H8UQ2PPA92ThektRnT415hlSnqFnQ79iXhSRcqLYy5A9Ng/6oB91lOxbGnhailO4lybhQ
 Z1kAhH5XHtgSEDBeTDg9ERBG15eRSBEdiwkW44S7viPOVnkombOZlAAvEBevjFXJuMg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=aK8Nyup0; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=aK8Nyup0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 07ED9608A3
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303713;
 bh=i4E79ACSjbp87B0JexCcjSKBmD0ULIhZSkRGVtInlNk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=aK8Nyup0I/n8gM2MhMKLNeMkXTd69q+4bLl8+GppswHHEKcl81896r/io2O0ZiEb0
 iHxOJZ+LRIMxAZAafKL/k4hZJMa3wc8HkPcgiTjf088JPmDQ+L0/+soIrgwFIVGIGo
 Bgkpef1dqawEIT79e8oNh2i3xZUdtcNm9dtcfVZ5FfrH1rVGm3D/Ilv45kaJRdzuEV
 xouM3hNJcUWi3MWkZNuMtCll4dB9vcsazfS+YJZ5QO8/HPovdV2afkZprvA/qVGiTo
 VHNZexC+HLxvZZDViZiVyg+HzwYynVGR/WwUMLYWxyLKuY7gJhwV7aJHI4rwQrWzYJ
 g7x/L9Cp4j1BA==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 6Xv9srapSB8a0zKkQdxWkLBulPCLuSp5FHUROCaldQtGd2oe3oZTaINcSRIn3SmS6wEPtWtaHWM
 G2KreGqtGEEQG6Zmn+J1Qw66FlfM0x7l7KehVGLMVw9S7mjLIDcCOT/9iWeB1R2yc2ftLpD7np1
 vBgZV2zmDQedmAAAd4e/XXqZXMCi8GWbxMKtj98018RT2BXvNvFZPbIUkAQF1JtqYaDMGhvW1Bh
 C/thwFfchI/EO10FWsM2J0lVKCSYfQbQ1t9DQRFQotVdLJiegjQCo6uRw5ETvGLrBvCkrGsxkGE
 RNOoA7Ra5/kMwzWqywQKerREKuIpvcZQnnOManUJnGPoo9saPKX0BNrZaa6Z2T4JsORGcKUF/8r
 2jdgf5kLn+dHp6ll/LPOIHDJ1ahOs3lkLTodNkpm2rdpAbuiFewA6pw0h4hAOpLWQP+vVq1iMoX
 VtXXN7y6yhCifmuOWLPUwerYnsq/ZhHCQ55vSyaK8zVvPWGd0YzXu2ZziAfgS/gxv223LQmQ38T
 gK6y2KintGlzbzlQ323hbUUKgXiSfMQA5vRLw9mdMHhqR5HbuYXiMH8zHw0Sc4F6Bf8JU5YRo2o
 3ImE0v1A5ZuVO3Xkh9EmoPaRk13Y7loqC4F/tOe36c1BQUga0ZOe1XB7qxfRdHOzsxiFkYpw
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 45D39A4C5560;
 Tue,  6 Oct 2026 18:21:53 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7un-000000000ir-2g0g;
 Tue, 06 Oct 2026 16:21:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>
Date: Tue,  6 Oct 2026 18:20:34 +0200
Message-ID: <20261006162106.3439373-54-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v8 53/84] package/trousers: Fix build with
 OpenSSL 4.0.0
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

U2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KQ2M6IE5vw6kgUnVi
aW5zdGVpbiA8bm9lLnJ1Ymluc3RlaW5AZ21haWwuY29tPgotLS0KIHBhY2thZ2UvdHJvdXNlcnMv
MDAwNC1vcGVuc3NsNC5wYXRjaCB8IDI2ICsrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZp
bGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uv
dHJvdXNlcnMvMDAwNC1vcGVuc3NsNC5wYXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvdHJvdXNl
cnMvMDAwNC1vcGVuc3NsNC5wYXRjaCBiL3BhY2thZ2UvdHJvdXNlcnMvMDAwNC1vcGVuc3NsNC5w
YXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi41ZWY2Y2IxOWIwCi0t
LSAvZGV2L251bGwKKysrIGIvcGFja2FnZS90cm91c2Vycy8wMDA0LW9wZW5zc2w0LnBhdGNoCkBA
IC0wLDAgKzEsMjYgQEAKK0Rlc2NyaXB0aW9uOiBGaXggZm9yIE9wZW5TU0w0IGNvbXBhdGliaWxp
dHkKKyBSZXBsYWNlIGRpcmVjdCBhY2Nlc3MgdG8gb3BhcXVlIEFTTjFfT0NURVRfU1RSSU5HLT5k
YXRhIGZpZWxkIHdpdGgKKyBBU04xX1NUUklOR19nZXQwX2RhdGEoKSBhY2Nlc3Nvci4gQVNOMV9T
VFJJTkcgaXMgZnVsbHkgb3BhcXVlIGluIE9wZW5TU0wgNC4wLgorQXV0aG9yOiBSYXZpIEthbnQg
U2hhcm1hIDxyYXZpLmthbnQuc2hhcm1hQGNhbm9uaWNhbC5jb20+CitCdWctVWJ1bnR1OiBodHRw
czovL2J1Z3MubGF1bmNocGFkLm5ldC9idWdzLzIxNTUwMDMKK0J1Zy1EZWJpYW46IGh0dHBzOi8v
YnVncy5kZWJpYW4ub3JnLzExMzg0NTEKK0ZvcndhcmRlZDogbm8KKworUGF0Y2ggZG93bmxvYWRl
ZCBmcm9tIERlYmlhbjoKK2h0dHBzOi8vYnVncy5kZWJpYW4ub3JnL2NnaS1iaW4vYnVncmVwb3J0
LmNnaT9idWc9MTEzODQ1MSMxMgorCitVcHN0cmVhbTogaHR0cHM6Ly9zb3VyY2Vmb3JnZS5uZXQv
cC90cm91c2Vycy9idWdzLzI0MC8KKworU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5k
QGt1aGxzLm5ldD4KKworLS0tIGEvc3JjL3RzcGkvdHNwaV9hc24xLmMKKysrKyBiL3NyYy90c3Bp
L3RzcGlfYXNuMS5jCitAQCAtMjM3LDcgKzIzNyw3IEBACisgCisgCWlmICgqcmF3QmxvYlNpemUg
IT0gMCkgeworIAkJaWYgKGRlY0Jsb2JTaXplIDw9ICpyYXdCbG9iU2l6ZSkgeworLQkJCW1lbWNw
eShyYXdCbG9iLCB0c3NCbG9iLT5ibG9iLT5kYXRhLCBkZWNCbG9iU2l6ZSk7CisrCQkJbWVtY3B5
KHJhd0Jsb2IsIEFTTjFfU1RSSU5HX2dldDBfZGF0YSh0c3NCbG9iLT5ibG9iKSwgZGVjQmxvYlNp
emUpOworIAkJfQorIAkJZWxzZSB7CisgCQkJVFNTX0JMT0JfZnJlZSh0c3NCbG9iKTsKLS0gCjIu
NDcuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
