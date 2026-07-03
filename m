Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44132C43602
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CECF412AD;
	Fri,  3 Jul 2026 14:33:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dWMNewhtmOI8; Fri,  3 Jul 2026 14:33:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E97841340
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783089197;
	bh=3T4ucp5n951sAuGd40m2gllkRpC76fImBDrRKP2Txo4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gSRaVploPoWg1meKaHaY/vf0yuIPPkzw+FXbSXKJDBx7Cz09vjnHmOIwuD5UNs22X
	 Nec+K4tD0ECSM90wQ5yy0LnTmQ2eHZTD4/TENRFILS+hUnXf1Rk9fEdcUhXepAO8Gk
	 TNWjFCzrRmV7OAXJff8Z9WitTEKx2OmW0oh7sIIgs1bhjHYTbx9qRSlaek2c7MhNkG
	 28hK5ob91jbEY2nRUOM8u/m6CAoS6YW/IrojJJppG7tCbHail/SxXNCpbKNP+5Lfwg
	 5nLT8hxqhH3JrgMVFxP5KsFrc6CHNVflwdVh4P7WImEJz2ThqDTcRglOvlUG3IuItx
	 E0uF8zGVSadGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E97841340;
	Fri,  3 Jul 2026 14:33:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DD9B363
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64D5C61538
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:33:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cfGwjps238d2 for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:33:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2E11361513
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E11361513
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2E11361513
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:33:13 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-493c54e205aso4481415e9.0
 for <buildroot@buildroot.org>; Fri, 03 Jul 2026 07:33:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783089192; x=1783693992;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qbywuO6+NGQ4KnWpoVU9OKpy4caOV3yQRZ/AnVbaPaI=;
 b=FytjF11jrZZ0nEiAHDseBh3T9s5puhqHC4T4B0heYF7QuE+wYbMSgw39wJMjV8i1Sr
 2FeoPLrKFmhhKyWyjs+zCaBIBnRMorw31sdi6zb1JTp2wVDgeSW9Km2Ho1VKQrnm/90p
 8H7CuJzVeFol55OgRAL8w9KiDRYQdzTeNqlFZXMH1BnyiqaxFqWIBtJ0wQLI8SyAMbzz
 cqbxuuoqhQPlruEOL5CndWP+dO8dWCSYYM4WWYRzF5unHvA4+Bo9vEEYaYVSD0/Ma4Zp
 jWxDdCnDLLT1cyj3gTtVr8qAAA8Cx14RXmbe8e9f+/fAJrYwUBbnydzAardES07c35UT
 cl8A==
X-Forwarded-Encrypted: i=1;
 AFNElJ+29dPF7rEkFrX4bah6LxE04UwE18yusuD8xkH7ylHGK26UN3WA8UdERjDVQyLQAiqo0Wl/bPcDitM=@buildroot.org
X-Gm-Message-State: AOJu0YyjrcVmmP1d24M2cvJCpEaEFazgUYebgqmTl/WJORyiFSNNiXr9
 6xKt/EeD6zq5p4TsqO56lsUBP8aBaJtrS71v7MkrLHF+TXqf7XV1xvTaKx6JJsBfGjY=
X-Gm-Gg: AfdE7clBEOg2QsKwqA0ZRPNgHJYIpNsMOvvuAr7laLMLx+507mI43Jz4NHMuxhH1xrl
 pnBmTtuTkuL1EveGom/5/SokCEo2Hp6MLQsSPUN+ngCxSe1IMCMB/uQkLf8bxGOl66NlJ8FRxol
 xmU+TLkTDlYjRzeTv+vd0Vo1NseajJQQVQMeu9InLMhG3U3xeA3jjGwVOATE9RZ3hAbCGDz6Hpk
 oifSueqkxCWIUrFqOJ46+sMMtYzkxv7JyuK4SR2TW4zg805oo/cUJalV16+QbMM0F4bnqzGoqwG
 O0Jrlw9Xl6vGmm9ZpWqMQmULaWvK20GVCw9+r/TlPTDtGj+SV77lTK0wnbdduOJHHl7uyVcX3j0
 pFa6MVGhq4fBZIR5tmL9/VK+1+Wa7Myyrsf1vAtud5ZfK6oK4efUdKyWRflAFg5ARDq0gR9RdIS
 u24qhR
X-Received: by 2002:a05:600c:17ca:b0:493:a7bc:5bcf with SMTP id
 5b1f17b1804b1-493d0f2e9d7mr936725e9.24.1783089192004; 
 Fri, 03 Jul 2026 07:33:12 -0700 (PDT)
Received: from arch ([77.109.126.77]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493c637bc21sm218886855e9.7.2026.07.03.07.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 07:33:11 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  3 Jul 2026 16:33:10 +0200
Message-ID: <20260703143310.275618-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260625212406.3148001-1-bernd@kuhls.net>
References: <20260625212406.3148001-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783089192; x=1783693992; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qbywuO6+NGQ4KnWpoVU9OKpy4caOV3yQRZ/AnVbaPaI=;
 b=HI1JXi9X6cE0hlhhA2mVCfMzTYeQAohx+7t6PiLh1kPGPs0HUEdA2+QKnRjrGsIcVe
 t+D7qq7uTZDvBYPy1Nrll2I09CFyG2nnF2FPtUN6bDxCmnvCcLeLsPPG7IqJlaaaqtg2
 zfiE0o8414qRHNZSXyg9lF4WDvk2DqPvQ25cDDGQ3iyAcMRjuM5QXrTlcuJHrWsn0WgX
 dG9TOPQmtyrpRTTObxhQYEJp2q4R7VpGra6dz57dcC+JeX70gPVl+FkU2aigpfv5hrJM
 G58vFRZI3DKf2wZ5KjYfKZ2CRXj8ryFIRZ78jAfZadhrLw10ca1SvCfTPqFi+TCutrlr
 dr6g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HI1JXi9X
Subject: Re: [Buildroot] [PATCH 1/1] package/expat: security bump version to
 2.8.2
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

SW4gcmVwbHkgb2Y6Cj4gaHR0cHM6Ly9naXRodWIuY29tL2xpYmV4cGF0L2xpYmV4cGF0L2Jsb2Iv
Ul8yXzhfMi9leHBhdC9DaGFuZ2VzCj4gaHR0cHM6Ly9ibG9nLmhhcnR3b3JrLm9yZy9wb3N0cy9l
eHBhdC0yLTgtMi1yZWxlYXNlZC8KPiAKPiBGaXhlcyB0aGUgZm9sbG93aW5nIENWRXM6Cj4gCj4g
ICAgIENWRS0yMDI2LTUwMjE5IOKAlCBtaXNzaW5nIGNvbnRyb2wgZmxvdyBpbnRlZ3JpdHkgY2hl
Y2tzCj4gICAgIENWRS0yMDI2LTU2MTMxIOKAlCBtaXNzaW5nIGNvbnRyb2wgZmxvdyBpbnRlZ3Jp
dHkgY2hlY2tzCj4gICAgIENWRS0yMDI2LTU2MTMyIOKAlCBvdXQtb2YtYm91bmRzIHdyaXRlCj4g
ICAgIENWRS0yMDI2LTU2NDAzIOKAlCBpbnRlZ2VyIG92ZXJmbG93Cj4gICAgIENWRS0yMDI2LTU2
NDA0IOKAlCBpbnRlZ2VyIG92ZXJmbG93Cj4gICAgIENWRS0yMDI2LTU2NDA1IOKAlCBpbnRlZ2Vy
IG92ZXJmbG93Cj4gICAgIENWRS0yMDI2LTU2NDA2IOKAlCBpbnRlZ2VyIG92ZXJmbG93Cj4gICAg
IENWRS0yMDI2LTU2NDA3IOKAlCBpbnRlZ2VyIG92ZXJmbG93Cj4gICAgIENWRS0yMDI2LTU2NDA4
IOKAlCBpbnRlZ2VyIG92ZXJmbG93Cj4gICAgIENWRS0yMDI2LTU2NDA5IOKAlCBpbnRlZ2VyIG92
ZXJmbG93Cj4gICAgIENWRS0yMDI2LTU2NDEwIOKAlCBpbnRlZ2VyIG92ZXJmbG93Cj4gICAgIENW
RS0yMDI2LTU2NDExIOKAlCBpbnRlZ2VyIG92ZXJmbG93Cj4gICAgIENWRS0yMDI2LTU2NDEyIOKA
lCBtaXNzaW5nIGNvbnRyb2wgZmxvdyBpbnRlZ3JpdHkgY2hlY2tzCj4gCj4gU2lnbmVkLW9mZi1i
eTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KCkFwcGxpZWQgdG8gMjAyNS4wMi54ICYg
MjAyNi4wNS54LiBUaGFua3MKCj4gLS0tCj4gIHBhY2thZ2UvZXhwYXQvZXhwYXQuaGFzaCB8IDQg
KystLQo+ICBwYWNrYWdlL2V4cGF0L2V4cGF0Lm1rICAgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL2V4cGF0L2V4cGF0Lmhhc2ggYi9wYWNrYWdlL2V4cGF0L2V4cGF0Lmhhc2gKPiBpbmRleCA1
ZDM0YWRmYzhkLi4yMDg3MTMzMzgyIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvZXhwYXQvZXhwYXQu
aGFzaAo+ICsrKyBiL3BhY2thZ2UvZXhwYXQvZXhwYXQuaGFzaAo+IEBAIC0xLDQgKzEsNCBAQAo+
IC0jIEZyb20gaHR0cHM6Ly9naXRodWIuY29tL2xpYmV4cGF0L2xpYmV4cGF0L3JlbGVhc2VzL3Rh
Zy9SXzJfOF8xCj4gLXNoYTI1NiAgMTBiMTk1ZWU3ODE2MGE5MDgzODgxODBhOGZlMzYwM2Q0ZTlh
MTJmNDc1NWZiZjVmMzgxNmIyM2E5ZDc1MGRhMCAgZXhwYXQtMi44LjEudGFyLnh6Cj4gKyMgRnJv
bSBodHRwczovL2dpdGh1Yi5jb20vbGliZXhwYXQvbGliZXhwYXQvcmVsZWFzZXMvdGFnL1JfMl84
XzIKPiArc2hhMjU2ICAzYWQ4OWI4NTg4ZTY2NDRiZDRlNDk5ODE0ODBkNDhiMjEyODllZWJiY2Q0
ZjBhMWE0YWZiMWMyOWY5OWI2YWI0ICBleHBhdC0yLjguMi50YXIueHoKPiAgIyBMb2NhbGx5IGNh
bGN1bGF0ZWQKPiAgc2hhMjU2ICAzMWIxNWRlODJhYTE5YTg0NTE1NjE2OWExN2E1NDg4YmY1OTdl
NTYxYjJjMzE4ZDE1OWVkNTgzMTM5YjI1ZTg3ICBDT1BZSU5HCj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvZXhwYXQvZXhwYXQubWsgYi9wYWNrYWdlL2V4cGF0L2V4cGF0Lm1rCj4gaW5kZXggM2I1Mjlj
MzM5MC4uZmIyNWE0YTQ3YiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2V4cGF0L2V4cGF0Lm1rCj4g
KysrIGIvcGFja2FnZS9leHBhdC9leHBhdC5tawo+IEBAIC00LDcgKzQsNyBAQAo+ICAjCj4gICMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gIAo+IC1FWFBBVF9WRVJTSU9OID0gMi44LjEKPiArRVhQ
QVRfVkVSU0lPTiA9IDIuOC4yCj4gIEVYUEFUX1NJVEUgPSBodHRwczovL2dpdGh1Yi5jb20vbGli
ZXhwYXQvbGliZXhwYXQvcmVsZWFzZXMvZG93bmxvYWQvUl8kKHN1YnN0IC4sXywkKEVYUEFUX1ZF
UlNJT04pKQo+ICBFWFBBVF9TT1VSQ0UgPSBleHBhdC0kKEVYUEFUX1ZFUlNJT04pLnRhci54ego+
ICBFWFBBVF9JTlNUQUxMX1NUQUdJTkcgPSBZRVMKPiAtLSAKPiAyLjQ3LjMKPiAKPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
