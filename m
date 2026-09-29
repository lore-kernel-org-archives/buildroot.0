Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A9B1CA5FA5
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F08E080FAA;
	Tue, 29 Sep 2026 18:39:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id psOKA947IIxE; Tue, 29 Sep 2026 18:39:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org F17D880F8D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707170;
	b=YgTH8Vpt2rKQwlUSJGjrbxjufio/SX2t4kAKL9AfnW1CAQETdfjyYsCcqHFHc302E8Eo
	 kwKDdo6RXMsMQd46WE1G0neGG+Iks5zX334VIxmdYZV6KDe6xsCN4e7Fkvk755vMAo/R2
	 LUYWvGbkOvE4j0pbdmDICQXAiHhu20BinZx/i5HwJrPYBjIPpHDLyIc1B759BTuuQhs2M
	 qkCLZdNMGNB0IVnRKhV4YHuTIEPjLXGfqokFztWi4ipmABV56nwDxKjoelqJC+lxXo6ns
	 YL4dPlLmhx5N1WCZuGKTxyq9oxffykRAN8ULdGSWLjQ0o6ojecKXRTX2SyVECahnzLA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707170;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=vs4JcTy9i/s9F9QDXsQAo0apDu5Ztdnl7KL4wrJR3Xo=;
	b=qcabZdLNhq1ltndwRRnqs3GPvY45Dui0vWmCqvobxUTrIcRVBYJOUktYVNVK6wPb2aZ/
	 HpA0SeNkkhoDRzMPRuawfz0Spr3CSDAkLs+oAC+/0qivg1scB0KlZit1xt2ZsJ/iecbPS
	 BqHNzoIk36TK6IVKor3jWxFOvPT2wJXptO1tWUSzg1t7P8gUU6PfKrmd84ZQqirNDcnGQ
	 s+dso8CSPzv51NEORXo+hmKrhWbNJyTKrC6QqlwjSZe6PaO72bySBuNW7+rMIxuvhbVYM
	 RpmaHV73iKdk3rtVFpf0lR6iXT+DTLqfoLj/8CjO4C1HIWT8NpiTsHUlJ+fc2JUCOIg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b="M/nHNQOM";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707170;
	bh=vs4JcTy9i/s9F9QDXsQAo0apDu5Ztdnl7KL4wrJR3Xo=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VDoBHBrbhwhP12LTuBwJSBykTxqRJ4tX/veztzn/uvueMtpoiBcq7PPgqQVpdLRMe
	 Oh/JfKylshoKgbXcfpUUaHUBJhLuLG3Ge2bCEuANccF4FgUGYmF/qHzAA0l/tyqlgl
	 e45UJs6am6upjE0ovrTdMsYxh1QbhtzYSWpqhP2meClk95/5rr0OVgq/diJBETPGUE
	 CAzckm+qv0oEEhWujSb08jFDZYRvuE7sKBc8Is/oWMzI/WIN0MCK+SdAbf9VJ6ER3P
	 wUeN1E9tKYWq5qb8HppqKEt8N1TJHWa+FSPUpfBk/fgNf76PvuaHUIY2PySI5DXXhl
	 eBmhuWvuU2B4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F17D880F8D;
	Tue, 29 Sep 2026 18:39:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C5DF3D8
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DC9880F8C
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:39:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SqzEV7-uM_n9 for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:39:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 959AD80FA7
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707167;
 b=ac83ga/bhHc+MpJh3+FqfNVPaqtwTfFk5m4WURXy5o/0TI8ux3pVPVm8uli637JXy+F6
 hHlkrPvD+EZKdyeGA/MmWWQF80VDzBKDu4FDnW6lz5/GYFgWxKthUyDHxNgTeyHibL8AI
 JIggbWXQveeBv14Dnd7IiZX4W8y6o25Pp3chZwT17vCZpgNt8kM+8prQ4wEinHwtcszWB
 KNobRxn7VhEuvBfZVl2lcr2YIwjepc+bzMKQPIaTukwGHEkCV30A/+UXuLvjz5HIueAJa
 ZwPI2YdemAABy/+xaA6j9WyIt6wi6gcvJK4QmVnXJp7JWy0Pu/wVdDq/bu9czWYHlIw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707167;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=1MtoqvhvSbOuA0WPm0NpaNnsRky+ky8xv0u+fHdOwps=;
 b=oYyGmDGi4kXJ1oPzw39gHVl6upJay0S+GV0Ht5hNmX0xC6Akt252FBigiZfTDMvuRu7M
 uwiTjzUJZyV3my61Sn1Li/wzZnQtvH8a6OETjyDFg0NhZCNs+P/LtJeB/7CF9+Z+8Y0Bz
 s51d/VBS+EOwoiFPr5VG0xhKWXxMeGLG0aGm6LV7wGYDmRFY65sQRwskuDTw8IAj5B68q
 /BP/ClJJZHt7dNPxkTfezNEeB9oju6XxnFo7+EUTBJrjCabwqfz8aNgXUnhowxttV4Ujv
 G/olXtcvkZYZ/ELr7IzIjPYx56ez22/Q2URo9EWtb10hBzbE7ybfLV6xGEcuN8yJPfQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="M/nHNQOM"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=M/nHNQOM
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 959AD80FA7
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790707022;
 bh=1MtoqvhvSbOuA0WPm0NpaNnsRky+ky8xv0u+fHdOwps=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=M/nHNQOMWBA3cw5xi8w/dBfbc/45d6HPulhOTFEwD4+vIu/E+oFO69rsYJPLPXl7D
 2lZFs4O0NpSESKL79tBp9vtYPcBrsWNfIqEypW8Y9mwuhW7UyTvUh3oXBKAXBBh1+T
 ty0yne8H6od/o2wEekiPLaX2ThP9jpKAD5hRAiLfCTn2galQByDsdTNklEuN7V+1Xn
 RoJFapd3dai8WYTyh2tUVMjZVb6EZgSYBZMiUGsU+etGKQMElxK0CWmp+kcdGokwyj
 ivV5rl+oL8oEwLhUpXbchMnkbZBgvXnAt+LM/xZF8Nh47DGbVG87K/E0vpPbxw2WaP
 eaMUUza/q1PJg==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 wW1Dcyqv3NvXa9IrKuMGLG5iegCcOH/qw4kZNXBBv5b5kGmL+DmC8g7lCVCQkLpBTQ71E2JtMRx
 KHIkhS5P1ZIdS7mjb27LFkPINEd6d3bsp4VDDPJY4lrXvcHbfzboXinT1yagH62D8NHHfi+TztJ
 pRfomx8bmTLjPDh+p3F9Tz0w89buAnvcIIqScNGiBZSknGI8aXcWDTN3KPe29fq9Za/TK4XHA8i
 +LGHP9aG0bhItosHVynm2DTGKMzusmcNt4cVqOvipYSzcQwL96PknFn8r/VvZuvfX74JK62FgGN
 OouauMimnDCy2bpw75wPuhN5abDFDPtWEbOIV/kmDTytSPgogL6Ej2stRG/pGWUCYJpxm5afBdC
 SuECbxqQV84D1xWuAxvK86YxKCXrMDDEmUtndfzRUhCj1W3wbAF8sPoBSpfs+ZIYNK/EwEFMWB3
 AidDg0pY+ht5Nfwfld+8NXAqfLOzX0m51fRdG3KZOFTiK0nhiBtqGihIYjqCoxai99Ou1u7TWSo
 gX9mmyoHHWo5fz5xlIjFPvmT0/c0JFckj3601LoxAeAx5uMMZZKPnEGOohIAsIsMa/AYxSDLZun
 3p0paa+UDq/gZ5uyeVuHaLHCrL/oRZ8=
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9F821A4C5192;
 Tue, 29 Sep 2026 20:37:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcgn-000000006Jn-1uZu;
 Tue, 29 Sep 2026 18:36:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>
Date: Tue, 29 Sep 2026 20:36:04 +0200
Message-ID: <20260929183607.1849293-66-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ---
Subject: [Buildroot] [PATCH v7 65/66] package/znc: Fix build with OpenSSL
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KQ2M6IEPDqWRyaWMg
Q2jDqXBpZWQgPGNlZHJpYy5jaGVwaWVkQGdtYWlsLmNvbT4KLS0tCiAuLi4tRml4LWJ1aWxkLWVy
cm9yLXdpdGgtT3BlblNTTC00LTIwMjQucGF0Y2ggfCA1NyArKysrKysrKysrKysrKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgNTcgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2th
Z2Uvem5jLzAwMDEtRml4LWJ1aWxkLWVycm9yLXdpdGgtT3BlblNTTC00LTIwMjQucGF0Y2gKCmRp
ZmYgLS1naXQgYS9wYWNrYWdlL3puYy8wMDAxLUZpeC1idWlsZC1lcnJvci13aXRoLU9wZW5TU0wt
NC0yMDI0LnBhdGNoIGIvcGFja2FnZS96bmMvMDAwMS1GaXgtYnVpbGQtZXJyb3Itd2l0aC1PcGVu
U1NMLTQtMjAyNC5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi4x
ZGM3ZWIyOGZiCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS96bmMvMDAwMS1GaXgtYnVpbGQt
ZXJyb3Itd2l0aC1PcGVuU1NMLTQtMjAyNC5wYXRjaApAQCAtMCwwICsxLDU3IEBACitGcm9tIDk0
YmNmOTE5ZTExNjM1NjRlNjM3ZGY4ZDQzNzU4NWJjN2I1NWU3YWEgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tOiBSYXZpIEthbnQgU2hhcm1hIDxya3MxOTg2QGdtYWlsLmNvbT4KK0RhdGU6
IE1vbiwgMjkgSnVuIDIwMjYgMjA6MDM6MjcgKzAyMDAKK1N1YmplY3Q6IFtQQVRDSF0gRml4IGJ1
aWxkIGVycm9yIHdpdGggT3BlblNTTCA0ICgjMjAyNCkKKworTW9yZSBkZXRhaWxzIGhlcmUgaHR0
cHM6Ly9idWdzLmRlYmlhbi5vcmcvY2dpLWJpbi9idWdyZXBvcnQuY2dpP2J1Zz0xMTM4MzU2CisK
K1Vwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20vem5jL3puYy9jb21taXQvOTRiY2Y5MTllMTE2
MzU2NGU2MzdkZjhkNDM3NTg1YmM3YjU1ZTdhYQorCitTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhs
cyA8YmVybmRAa3VobHMubmV0PgorLS0tCisgc3JjL1NTTFZlcmlmeUhvc3QuY3BwIHwgNCArKy0t
Cisgc3JjL1V0aWxzLmNwcCAgICAgICAgIHwgNSArKysrLQorIDIgZmlsZXMgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQorCitkaWZmIC0tZ2l0IGEvc3JjL1NTTFZlcmlm
eUhvc3QuY3BwIGIvc3JjL1NTTFZlcmlmeUhvc3QuY3BwCitpbmRleCBjY2MyMDg5OC4uOTliMjE1
YmMgMTAwNjQ0CistLS0gYS9zcmMvU1NMVmVyaWZ5SG9zdC5jcHAKKysrKyBiL3NyYy9TU0xWZXJp
ZnlIb3N0LmNwcAorQEAgLTMwNiw4ICszMDYsOCBAQCB0eXBlZGVmIGVudW0geworIHN0YXRpYyBI
b3N0bmFtZVZhbGlkYXRpb25SZXN1bHQgbWF0Y2hlc19jb21tb25fbmFtZShjb25zdCBjaGFyKiBo
b3N0bmFtZSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgY29uc3QgWDUwOSogc2VydmVyX2NlcnQpIHsKKyAgICAgaW50IGNvbW1vbl9uYW1lX2xv
YyA9IC0xOworLSAgICBYNTA5X05BTUVfRU5UUlkqIGNvbW1vbl9uYW1lX2VudHJ5ID0gbnVsbHB0
cjsKKy0gICAgQVNOMV9TVFJJTkcqIGNvbW1vbl9uYW1lX2FzbjEgPSBudWxscHRyOworKyAgICBj
b25zdCBYNTA5X05BTUVfRU5UUlkqIGNvbW1vbl9uYW1lX2VudHJ5ID0gbnVsbHB0cjsKKysgICAg
Y29uc3QgQVNOMV9TVFJJTkcqIGNvbW1vbl9uYW1lX2FzbjEgPSBudWxscHRyOworICAgICBDT05T
VF9BU04xX1NUUklOR19EQVRBIGNoYXIqIGNvbW1vbl9uYW1lX3N0ciA9IG51bGxwdHI7CisgCisg
ICAgIC8vIEZpbmQgdGhlIHBvc2l0aW9uIG9mIHRoZSBDTiBmaWVsZCBpbiB0aGUgU3ViamVjdCBm
aWVsZCBvZiB0aGUgY2VydGlmaWNhdGUKK2RpZmYgLS1naXQgYS9zcmMvVXRpbHMuY3BwIGIvc3Jj
L1V0aWxzLmNwcAoraW5kZXggZWQyYzljODMuLjc0NGY2MWQxIDEwMDY0NAorLS0tIGEvc3JjL1V0
aWxzLmNwcAorKysrIGIvc3JjL1V0aWxzLmNwcAorQEAgLTEyOSw3ICsxMjksOCBAQCB2b2lkIENV
dGlsczo6R2VuZXJhdGVDZXJ0KEZJTEUqIHBPdXQpIHsKKyAgICAgc0VtYWlsQWRkciArPSAiQCI7
CisgICAgIHNFbWFpbEFkZHIgKz0gc0hvc3ROYW1lOworIAorLSAgICBYNTA5X05BTUUqIHBOYW1l
ID0gWDUwOV9nZXRfc3ViamVjdF9uYW1lKHBDZXJ0LmdldCgpKTsKKysgICAgWDUwOV9OQU1FKiBw
TmFtZSA9IFg1MDlfTkFNRV9uZXcoKTsKKysgICAgaWYgKCFwTmFtZSkgcmV0dXJuOworICAgICBY
NTA5X05BTUVfYWRkX2VudHJ5X2J5X3R4dChwTmFtZSwgIk9VIiwgTUJTVFJJTkdfQVNDLAorICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAodW5zaWduZWQgY2hhciopcExvZ05hbWUsIC0x
LCAtMSwgMCk7CisgICAgIFg1MDlfTkFNRV9hZGRfZW50cnlfYnlfdHh0KHBOYW1lLCAiQ04iLCBN
QlNUUklOR19BU0MsCitAQCAtMTM3LDcgKzEzOCw5IEBAIHZvaWQgQ1V0aWxzOjpHZW5lcmF0ZUNl
cnQoRklMRSogcE91dCkgeworICAgICBYNTA5X05BTUVfYWRkX2VudHJ5X2J5X3R4dChwTmFtZSwg
ImVtYWlsQWRkcmVzcyIsIE1CU1RSSU5HX0FTQywKKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgKHVuc2lnbmVkIGNoYXIqKXNFbWFpbEFkZHIuY19zdHIoKSwgLTEsIC0xLCAwKTsKKyAK
KysgICAgWDUwOV9zZXRfc3ViamVjdF9uYW1lKHBDZXJ0LmdldCgpLCBwTmFtZSk7CisgICAgIFg1
MDlfc2V0X2lzc3Vlcl9uYW1lKHBDZXJ0LmdldCgpLCBwTmFtZSk7CisrICAgIFg1MDlfTkFNRV9m
cmVlKHBOYW1lKTsKKyAKKyAgICAgaWYgKCFYNTA5X3NpZ24ocENlcnQuZ2V0KCksIHBLZXkuZ2V0
KCksIEVWUF9zaGEyNTYoKSkpIHJldHVybjsKKyAKKy0tIAorMi40Ny4zCisKLS0gCjIuNDcuMwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
