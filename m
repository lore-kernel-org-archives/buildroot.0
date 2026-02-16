Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ECFBEF5860
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 09:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B34A04020B;
	Mon, 16 Feb 2026 09:41:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PbomIzE1TmxF; Mon, 16 Feb 2026 09:41:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC1F240BF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771234864;
	bh=/lZFKr6t/iwYcgxxeevEsyNWRwQLbOl7G8xmCj5orEo=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=QGfD+pKmRHilwEzVDk5oM9o7L0nZv9xaKh1yn26LPga7XLohC1q+J4LbW54tSLysZ
	 y6RzZcgNevtkGryU4d9sOxKXsWVAr8lCl2IDIPYDnUGXSHoTZfjF3bQysJwhjeEjw5
	 C+EHO4y132SvHpGY31XUoSrFW68kgG3ZU5N9d7l94LlyL/rrg7dBQDtDZ+0UieWLf6
	 ODYEspWCNjgcUwGNRQ5SlbtRTG7OilRmfIt2+yt4cp4yC2paHis054j+Fn7fGBjUut
	 Lvz24J+GEeHV2hvatFXvLBA0NzkbQ76r/O1j6o/cmhhzvysLNIjzC6/WAFY4TRPbxQ
	 myo9MoI654c5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC1F240BF8;
	Mon, 16 Feb 2026 09:41:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DE89335B
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 09:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC526816F5
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 09:41:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3b40AQJ7CsVw for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 09:41:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6BDD1816E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BDD1816E0
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6BDD1816E0
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 09:41:01 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 15FB34E40E71
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 09:40:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D5608606CF
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 09:40:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 01035103690E4; Mon, 16 Feb 2026 10:40:57 +0100 (CET)
Date: Mon, 16 Feb 2026 10:40:42 +0100
MIME-Version: 1.0
Message-Id: <20260216-openscap_cpp-v1-1-3372149da5b0@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDI0Mz3fyC1Lzi5MSC+OSCAl3TVBMDY9MU85SkNAsloJaCotS0zAqwcdG
 xtbUAPaKYUl4AAAA=
X-Change-ID: 20260216-openscap_cpp-5e4035d7dbf8
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1771234858; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=el1kZtTJg6W7/cPxcRxz7kgCA+WrVPYp6ducbVArdvQ=;
 b=K6khBwMofoYDPl5QyLiblfcjAvqn6hodpE0CHyQn162QUsazk1iKQYkt8HuM22I8m5dWiK
 uOjPzFm6uGSYa4CLMWg408QrxO4QXO9XRs8pQKKV6yU2lNWn47MBAU2kOpl9POcUzAL2Y2
 4gVCXNa9kiV5XNuoJxUSouf619s1JVlOmp5EDZZtUnQ4h8+MeRewcFY+aJ6v4EzzTDiyYf
 mP/SgvpCibHH7dnR/HEqnVW3IZaVHROuqd68d+yjhjv8QzSWKN1wN4+HqAqRODifOzPfoY
 abhfHrWvkLOJCj2dueY9EqucUSDvOzxw2Gl1cpUlCZn+RKpFE7/GpdJD0UrpFQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=K6khBwMo
Subject: [Buildroot] [PATCH] package/openscap: set dependency on C++ support
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2hlbiB0aGUgdG9vbGNoYWluIGludm9sdmVkIGluIG9wZW5zY2FwIGJ1aWxkIGRvZXMgbm90IHN1
cHBvcnQgQysrLCB0aGUKY29uZmlndXJlIHN0ZXAgZmFpbHMgd2l0aCB0aGUgZm9sbG93aW5nIGVy
cm9yOgoKICAtLSBEZXRlY3RpbmcgQ1hYIGNvbXBpbGVyIEFCSSBpbmZvCiAgLS0gRGV0ZWN0aW5n
IENYWCBjb21waWxlciBBQkkgaW5mbyAtIGZhaWxlZAogIC0tIENoZWNrIGZvciB3b3JraW5nIENY
WCBjb21waWxlcjogL2Jpbi9mYWxzZQogIC0tIENoZWNrIGZvciB3b3JraW5nIENYWCBjb21waWxl
cjogL2Jpbi9mYWxzZSAtIGJyb2tlbgogIENNYWtlIEVycm9yIGF0IC91c3Ivc2hhcmUvY21ha2Uv
TW9kdWxlcy9DTWFrZVRlc3RDWFhDb21waWxlci5jbWFrZTo3MyAobWVzc2FnZSk6CiAgICBUaGUg
QysrIGNvbXBpbGVyCgogICAgICAiL2Jpbi9mYWxzZSIKCiAgICBpcyBub3QgYWJsZSB0byBjb21w
aWxlIGEgc2ltcGxlIHRlc3QgcHJvZ3JhbS4KCiAgICBJdCBmYWlscyB3aXRoIHRoZSBmb2xsb3dp
bmcgb3V0cHV0OgoKICAgICAgQ2hhbmdlIERpcjogJy9ob21lL2F1dG9idWlsZC9hdXRvYnVpbGQv
aW5zdGFuY2UtNi9vdXRwdXQtMS9idWlsZC9vcGVuc2NhcC0xLjMuMTIvYnVpbGRyb290LWJ1aWxk
L0NNYWtlRmlsZXMvQ01ha2VTY3JhdGNoL1RyeUNvbXBpbGUtdFV5ZHFJJwoKICAgICAgUnVuIEJ1
aWxkIENvbW1hbmQocyk6IC91c3IvYmluL2NtYWtlIC1FIGVudiBWRVJCT1NFPTEgL3Vzci9iaW4v
bWFrZSAtZiBNYWtlZmlsZSBjbVRDXzE4MzRiL2Zhc3QKICAgICAgbWFrZVsxXTogRW50ZXJpbmcg
ZGlyZWN0b3J5ICcvaG9tZS9hdXRvYnVpbGQvYXV0b2J1aWxkL2luc3RhbmNlLTYvb3V0cHV0LTEv
YnVpbGQvb3BlbnNjYXAtMS4zLjEyL2J1aWxkcm9vdC1idWlsZC9DTWFrZUZpbGVzL0NNYWtlU2Ny
YXRjaC9UcnlDb21waWxlLXRVeWRxSScKICAgICAgL3Vzci9iaW4vbWFrZSAgLWYgQ01ha2VGaWxl
cy9jbVRDXzE4MzRiLmRpci9idWlsZC5tYWtlIENNYWtlRmlsZXMvY21UQ18xODM0Yi5kaXIvYnVp
bGQKICAgICAgbWFrZVsyXTogRW50ZXJpbmcgZGlyZWN0b3J5ICcvaG9tZS9hdXRvYnVpbGQvYXV0
b2J1aWxkL2luc3RhbmNlLTYvb3V0cHV0LTEvYnVpbGQvb3BlbnNjYXAtMS4zLjEyL2J1aWxkcm9v
dC1idWlsZC9DTWFrZUZpbGVzL0NNYWtlU2NyYXRjaC9UcnlDb21waWxlLXRVeWRxSScKICAgICAg
QnVpbGRpbmcgQ1hYIG9iamVjdCBDTWFrZUZpbGVzL2NtVENfMTgzNGIuZGlyL3Rlc3RDWFhDb21w
aWxlci5jeHgubwogICAgICAvYmluL2ZhbHNlICAgIC1vIENNYWtlRmlsZXMvY21UQ18xODM0Yi5k
aXIvdGVzdENYWENvbXBpbGVyLmN4eC5vIC1jIC9ob21lL2F1dG9idWlsZC9hdXRvYnVpbGQvaW5z
dGFuY2UtNi9vdXRwdXQtMS9idWlsZC9vcGVuc2NhcC0xLjMuMTIvYnVpbGRyb290LWJ1aWxkL0NN
YWtlRmlsZXMvQ01ha2VTY3JhdGNoL1RyeUNvbXBpbGUtdFV5ZHFJL3Rlc3RDWFhDb21waWxlci5j
eHgKICAgICAgbWFrZVsyXTogKioqIFtDTWFrZUZpbGVzL2NtVENfMTgzNGIuZGlyL2J1aWxkLm1h
a2U6ODE6IENNYWtlRmlsZXMvY21UQ18xODM0Yi5kaXIvdGVzdENYWENvbXBpbGVyLmN4eC5vXSBF
cnJvciAxCiAgICAgIG1ha2VbMl06IExlYXZpbmcgZGlyZWN0b3J5ICcvaG9tZS9hdXRvYnVpbGQv
YXV0b2J1aWxkL2luc3RhbmNlLTYvb3V0cHV0LTEvYnVpbGQvb3BlbnNjYXAtMS4zLjEyL2J1aWxk
cm9vdC1idWlsZC9DTWFrZUZpbGVzL0NNYWtlU2NyYXRjaC9UcnlDb21waWxlLXRVeWRxSScKICAg
ICAgbWFrZVsxXTogKioqIFtNYWtlZmlsZToxMzQ6IGNtVENfMTgzNGIvZmFzdF0gRXJyb3IgMgog
ICAgICBtYWtlWzFdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL2hvbWUvYXV0b2J1aWxkL2F1dG9idWls
ZC9pbnN0YW5jZS02L291dHB1dC0xL2J1aWxkL29wZW5zY2FwLTEuMy4xMi9idWlsZHJvb3QtYnVp
bGQvQ01ha2VGaWxlcy9DTWFrZVNjcmF0Y2gvVHJ5Q29tcGlsZS10VXlkcUknCgogICAgQ01ha2Ug
d2lsbCBub3QgYmUgYWJsZSB0byBjb3JyZWN0bHkgZ2VuZXJhdGUgdGhpcyBwcm9qZWN0LgogIENh
bGwgU3RhY2sgKG1vc3QgcmVjZW50IGNhbGwgZmlyc3QpOgogICAgQ01ha2VMaXN0cy50eHQ6MTEg
KHByb2plY3QpCgogIC0tIENvbmZpZ3VyaW5nIGluY29tcGxldGUsIGVycm9ycyBvY2N1cnJlZCEK
ICBtYWtlOiAqKiogW3BhY2thZ2UvcGtnLWdlbmVyaWMubWs6MjYzOiAvaG9tZS9hdXRvYnVpbGQv
YXV0b2J1aWxkL2luc3RhbmNlLTYvb3V0cHV0LTEvYnVpbGQvb3BlbnNjYXAtMS4zLjEyLy5zdGFt
cF9jb25maWd1cmVkXSBFcnJvciAxCiAgbWFrZTogTGVhdmluZyBkaXJlY3RvcnkgJy9ob21lL2F1
dG9idWlsZC9hdXRvYnVpbGQvaW5zdGFuY2UtNi9idWlsZHJvb3QnCgpNYWtlIG9wZW5zY2FwIGRl
cGVuZCBvbiBwcm9wZXIgQysrIHN1cHBvcnQuCgpGaXhlczogaHR0cHM6Ly9hdXRvYnVpbGQuYnVp
bGRyb290Lm9yZy9yZXN1bHRzLzFmZTU1MGZmYTc5ZjBhMDgzYTQ1MGFlMDNmZTA2N2E4YWI3MzM2
YmUKRml4ZXM6IGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy9lOWQ1MmI1
MjY1ODU0NDkxNjAyMjA1MGM3OGRjYjEzN2NhNmM5N2UwCkZpeGVzOiBodHRwczovL2F1dG9idWls
ZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvNGE5YzIxNzYzYWFkZGIyMTdlZTVmOGJiODk0N2ZhYWQ5
NzY3YmFhMwpTaWduZWQtb2ZmLWJ5OiBBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJv
b3RsaW4uY29tPgotLS0KIHBhY2thZ2Uvb3BlbnNjYXAvQ29uZmlnLmluIHwgNSArKystLQogMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9wYWNrYWdlL29wZW5zY2FwL0NvbmZpZy5pbiBiL3BhY2thZ2Uvb3BlbnNjYXAvQ29uZmlnLmlu
CmluZGV4IDMxNzA1NWM3NTMyNy4uMzc1ZmNhY2MyZDA1IDEwMDY0NAotLS0gYS9wYWNrYWdlL29w
ZW5zY2FwL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL29wZW5zY2FwL0NvbmZpZy5pbgpAQCAtMiw2
ICsyLDcgQEAgY29uZmlnIEJSMl9QQUNLQUdFX09QRU5TQ0FQCiAJYm9vbCAib3BlbnNjYXAiCiAJ
ZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9MSUJHUEdfRVJST1JfQVJDSF9TVVBQT1JUUyAgIyBsaWJn
Y3J5cHQKIAlkZXBlbmRzIG9uICFCUjJfU1RBVElDX0xJQlMgIyBkbGZjbi5oCisJZGVwZW5kcyBv
biBCUjJfSU5TVEFMTF9MSUJTVERDUFAKIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCQ1VSTAogCSMg
SW4gdGhlb3J5IHNob3VsZCBidWlsZCB3aXRob3V0IGNyeXB0bywgYnV0IGluIHByYWN0aWNlIGl0
CiAJIyBkb2Vzbid0OiBodHRwczovL2dpdGh1Yi5jb20vT3BlblNDQVAvb3BlbnNjYXAvaXNzdWVz
LzIzMTAKQEAgLTE5LDYgKzIwLDYgQEAgY29uZmlnIEJSMl9QQUNLQUdFX09QRU5TQ0FQCiAJICBo
dHRwczovL3d3dy5vcGVuLXNjYXAub3JnLwogCSAgaHR0cHM6Ly9naXRodWIuY29tL09wZW5TQ0FQ
L29wZW5zY2FwCiAKLWNvbW1lbnQgIm9wZW5zY2FwIG5lZWRzIGEgdG9vbGNoYWluIHcvIGR5bmFt
aWMgbGlicmFyeSIKK2NvbW1lbnQgIm9wZW5zY2FwIG5lZWRzIGEgdG9vbGNoYWluIHcvIEMrKywg
ZHluYW1pYyBsaWJyYXJ5IgogCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfTElCR1BHX0VSUk9SX0FS
Q0hfU1VQUE9SVFMKLQlkZXBlbmRzIG9uIEJSMl9TVEFUSUNfTElCUworCWRlcGVuZHMgb24gQlIy
X1NUQVRJQ19MSUJTIHx8ICFCUjJfSU5TVEFMTF9MSUJTVERDUFAKCi0tLQpiYXNlLWNvbW1pdDog
NzhkMzhkOWRkZGE4MWQ3YzZiZmY5YjUyMDY1NmZlNGY0NmYwZjY5MgpjaGFuZ2UtaWQ6IDIwMjYw
MjE2LW9wZW5zY2FwX2NwcC01ZTQwMzVkN2RiZjgKCkJlc3QgcmVnYXJkcywKLS0gCkFsZXhpcyBM
b3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
