Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2967CDE012
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 09:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 376F860EDA;
	Fri, 26 Jun 2026 09:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9YOu2k9D7Ifl; Fri, 26 Jun 2026 09:57:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 475F860EB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782467854;
	bh=GWThr308J4TNs3tkxxLc1P3Bv+nKWhCcaZSyh4SPARk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iJS0gBo1NqUxC5t2du4MkYZIQxVtEYCSSJ2K1MCkVRgnrdHySW08ocbqZzWwuxXd/
	 eKFFF6xkhOB+fJ4iJaVR1lxzoH9m9L20w+fdcZ8TLoEtoEovKLavblI0BqfN87Plzz
	 xDOfmlNJsM8Jfvq5amYH61E+kdJ+OhGFhaArmDwE1wlpzqakXsclRsBVIuBu3Jgj61
	 UANdwT5gQSuqeAU5bnNF35xvTVWQDsE/mi79I8c0cjH4+YV9R/MBdkjyyD6po1m/n2
	 7ywcUmx8+rc2BvPgZeBfpNK1hmawjWmyfrufLOnqW1qfbdyQikGFuYj4wZMphxrlQw
	 ID9Nk7hO27HVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 475F860EB6;
	Fri, 26 Jun 2026 09:57:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 70298369
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 09:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61D8260ECA
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 09:57:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mw5HmluTy9vf for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 09:57:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0403760EB6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0403760EB6
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0403760EB6
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 09:57:28 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-46def4bd5e8so660161f8f.1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 02:57:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782467846; x=1783072646;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CTcyE/+/YlSVU0RwvWmChY0jtL7woP8c3Cr0fDqOZQU=;
 b=TL1Uwmx9ZPnipMv5ohuJr48E6PH3uSmZk3nudGuoKfzGjTWhWvUrwijM455hKbwRtO
 g5Dy1R0BgnP2eDbUpeSYzo5uUNOnlrmvI/uKEyY5iRBiDvc7VJ6+SCKqbg9duqRiwpL+
 93DTS5iUHkLMdxfSJWrrpDQngRQL17ZK0V9vjT7DPRnLasVVeRgFWESBS2YQ/7tDuhhB
 IT8iHgssxPrmzmaMsLnkfRawgL4NGu4L7mc83Ys3SgDtnyhx/1WSm/PGJoIKJkkdZ1ed
 5uifzhp48jG0SqrNGLKQS6ZyxmWvJ4Ku9A7mgcDfO7pWiI/ZUHgbuKG/NCyQxbL4oOQ2
 +3mg==
X-Gm-Message-State: AOJu0YyKH02lZScaSGKn5Nt7+MMfYgNxUi9EinTYVv95aBc6x0l1+w6u
 cQ0fnVh+P/bvcjwq3SzXVPol8u33iq0Lfl0We8MGjlGHcpSaGPFXa+RvxI9KaZGCdgY6WgM+VAu
 hyqtS
X-Gm-Gg: AfdE7cljirSIZ12JkUheYqtn3q12f0glqrBpLFicZ+MeypBTfhsXoMxWiiaBFvn/3I2
 +UW24mRjljuV6uOkEHal/8SxsYKoOEC8CnZpu1xNWsd0yBfev9+OnygGlGP9x0UAbgBdH9uCOSL
 YVgEgnC7/QmQUCv6kR8mnCtgSgwm42xZncEV1Qssd9vrd4zw3neoocVmlLt/aMg+OReJxqvCXtu
 bFCJP1F1iReC2OGJDC6zi4EUotPOIEP+0yOOSa9wEeAdT8jSDUKayL5z/SeTa4VO6NKl8LtjDNE
 +d9BH9O1ENuNhCkh2M+Dzu6sRPZvVfkh5f9XPXCZc1wqQeXA7/TdEXaYqsRHXxoFrgFH/17nV4w
 cNdio7PC5BL8ak71I/njtDxi6TL/UokFXM9AZWkinu2Ta5tGpvA4N5+FI9M1fl+KPj+iPbFchGm
 MbJ0o3SwC3sESq2vE=
X-Received: by 2002:a05:600c:3f18:b0:490:c6c2:52 with SMTP id
 5b1f17b1804b1-4926686b4c0mr89972175e9.3.1782467846372; 
 Fri, 26 Jun 2026 02:57:26 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492691f60bcsm68222045e9.1.2026.06.26.02.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 02:57:26 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 26 Jun 2026 11:57:19 +0200
Message-ID: <20260626095724.248205-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260626095724.248205-1-thomas.perale@mind.be>
References: <20260626095724.248205-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782467846; x=1783072646; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CTcyE/+/YlSVU0RwvWmChY0jtL7woP8c3Cr0fDqOZQU=;
 b=LNFnzQWctyoHGi14jP2C8gDhoOrAaR4oNZ5hIHwW9xMbvcCPfqhl0y5boBSKtB9VNs
 i8uinV35Y2kjJ9K0Jk+Zc3wSqmAF+VRiUw+4OEBFBBtKZTiafXvhbamaFmn7KOv4WMu7
 Yyn2UwkV05T3ruO2liKNumTw71d6vONDAaVVACwB3K7GHlZWB2wgpt6ZKswW9b81FCuG
 o6zsEk4yHq0o3hJ7R8dQihGUrZ2vV8SUJq+L4sTxb2AB57GyBgL7PlxRoisYq0SVK91t
 d8p28LIQI/KVrLEXv8rrngDKu0P/aC1GmuZQoCsouKpnSftCBGmJCjOT9pKxa0WwqNAd
 QZZw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=LNFnzQWc
Subject: [Buildroot] [PATCH 2025.02.x 2/5] package/util-linux: backport
 patch CVE-2025-14104
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

LSBDVkUtMjAyNS0xNDEwNDoKICAgIEEgZmxhdyB3YXMgZm91bmQgaW4gdXRpbC1saW51eC4gVGhp
cyB2dWxuZXJhYmlsaXR5IGFsbG93cyBhIGhlYXAKICAgIGJ1ZmZlciBvdmVycmVhZCB3aGVuIHBy
b2Nlc3NpbmcgMjU2LWJ5dGUgdXNlcm5hbWVzLCBzcGVjaWZpY2FsbHkKICAgIHdpdGhpbiB0aGUg
YHNldHB3bmFtKClgIGZ1bmN0aW9uLCBhZmZlY3RpbmcgU1VJRCAoU2V0IFVzZXIgSUQpIGxvZ2lu
LQogICAgdXRpbHMgdXRpbGl0aWVzIHdyaXRpbmcgdG8gdGhlIHBhc3N3b3JkIGRhdGFiYXNlLgoK
Rm9yIG1vcmUgaW5mb3JtYXRpb24sIHNlZToKICAtIGh0dHBzOi8vd3d3LmN2ZS5vcmcvQ1ZFUmVj
b3JkP2lkPUNWRS0yMDI1LTE0MTA0CiAgLSBodHRwczovL2dpdGh1Yi5jb20vdXRpbC1saW51eC91
dGlsLWxpbnV4L2NvbW1pdC9hYWE5ZTcxOGM4OGQ2OTE2YjAwM2RhN2ViY2ZlMzhhM2M4OGRmOGU2
CiAgLSBodHRwczovL2dpdGh1Yi5jb20vdXRpbC1saW51eC91dGlsLWxpbnV4L2NvbW1pdC85YTM2
ZDc3MDEyYzRjNzcxZjhkNTFlYmE0NmI2ZTYyYzI5YmY1NzJhCgpTaWduZWQtb2ZmLWJ5OiBUaG9t
YXMgUGVyYWxlIDx0aG9tYXMucGVyYWxlQG1pbmQuYmU+Ci0tLQogLi4uL3V0aWwtbGludXgvMDAw
OC1DVkUtMjAyNS0xNDEwNC0xLnBhdGNoICAgIHwgMzMgKysrKysrKysrKysrKysrKysrKwogLi4u
L3V0aWwtbGludXgvMDAwOS1DVkUtMjAyNS0xNDEwNC0yLnBhdGNoICAgIHwgMjggKysrKysrKysr
KysrKysrKwogcGFja2FnZS91dGlsLWxpbnV4L3V0aWwtbGludXgubWsgICAgICAgICAgICAgIHwg
IDQgKysrCiAzIGZpbGVzIGNoYW5nZWQsIDY1IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBwYWNrYWdlL3V0aWwtbGludXgvMDAwOC1DVkUtMjAyNS0xNDEwNC0xLnBhdGNoCiBjcmVh
dGUgbW9kZSAxMDA2NDQgcGFja2FnZS91dGlsLWxpbnV4LzAwMDktQ1ZFLTIwMjUtMTQxMDQtMi5w
YXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvdXRpbC1saW51eC8wMDA4LUNWRS0yMDI1LTE0MTA0
LTEucGF0Y2ggYi9wYWNrYWdlL3V0aWwtbGludXgvMDAwOC1DVkUtMjAyNS0xNDEwNC0xLnBhdGNo
Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmUxNGEwNDU4YWQKLS0tIC9k
ZXYvbnVsbAorKysgYi9wYWNrYWdlL3V0aWwtbGludXgvMDAwOC1DVkUtMjAyNS0xNDEwNC0xLnBh
dGNoCkBAIC0wLDAgKzEsMzMgQEAKK0Zyb20gYWFhOWU3MThjODhkNjkxNmIwMDNkYTdlYmNmZTM4
YTNjODhkZjhlNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IE1vaGFtZWQgTWFhdGFs
bGFoIDxob3RlbHNtYWF0YWxsYWhyZWNlbWFpbEBnbWFpbC5jb20+CitEYXRlOiBTYXQsIDI0IE1h
eSAyMDI1IDAzOjE2OjA5ICswMTAwCitTdWJqZWN0OiBbUEFUQ0hdIFVwZGF0ZSBzZXRwd25hbS5j
CisKK1Vwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20vdXRpbC1saW51eC91dGlsLWxpbnV4L2Nv
bW1pdC9hYWE5ZTcxOGM4OGQ2OTE2YjAwM2RhN2ViY2ZlMzhhM2M4OGRmOGU2CitDVkU6IENWRS0y
MDI1LTE0MTA0CitTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGVyYWxlIDx0aG9tYXMucGVyYWxlQG1p
bmQuYmU+CistLS0KKyBsb2dpbi11dGlscy9zZXRwd25hbS5jIHwgMTAgKysrKysrLS0tLQorIDEg
ZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCisKK2RpZmYgLS1n
aXQgYS9sb2dpbi11dGlscy9zZXRwd25hbS5jIGIvbG9naW4tdXRpbHMvc2V0cHduYW0uYworaW5k
ZXggM2UzYzFhYmRlNTAuLjk1ZTQ3MGI1YTM0IDEwMDY0NAorLS0tIGEvbG9naW4tdXRpbHMvc2V0
cHduYW0uYworKysrIGIvbG9naW4tdXRpbHMvc2V0cHduYW0uYworQEAgLTEyNiwxMCArMTI2LDEy
IEBAIGludCBzZXRwd25hbShzdHJ1Y3QgcGFzc3dkICpwd2QsIGNvbnN0IGNoYXIgKnByZWZpeCkK
KyAJCX0KKyAKKyAJCS8qIElzIHRoaXMgdGhlIHVzZXJuYW1lIHdlIHdlcmUgc2VudCB0byBjaGFu
Z2U/ICovCistCQlpZiAoIWZvdW5kICYmIGxpbmVidWZbbmFtZWxlbl0gPT0gJzonICYmCistCQkg
ICAgIXN0cm5jbXAobGluZWJ1ZiwgcHdkLT5wd19uYW1lLCBuYW1lbGVuKSkgeworLQkJCS8qIFll
cyEgU28gZ28gZm9ydGggaW4gdGhlIG5hbWUgb2YgdGhlIExvcmQgYW5kCistCQkJICogY2hhbmdl
IGl0ISAgKi8KKysJCWlmICghZm91bmQgJiYKKysJCSAgICBzdHJuY21wKGxpbmVidWYsIHB3ZC0+
cHdfbmFtZSwgbmFtZWxlbikgPT0gMCAmJgorKwkJICAgIHN0cmxlbihsaW5lYnVmKSA+IG5hbWVs
ZW4gJiYKKysJCSAgICBsaW5lYnVmW25hbWVsZW5dID09ICc6JykgeworKwkJCS8qIFllcyEgQnV0
IHRoaXMgdGltZSBsZXTigJlzIG5vdCB3YWxrIHBhc3QgdGhlIGVuZCBvZiB0aGUgYnVmZmVyCisr
CQkJICogaW4gdGhlIG5hbWUgb2YgdGhlIExvcmQsIFNVSUQsIG9yIGFueXRoaW5nIGVsc2UuICov
CisgCQkJaWYgKHB1dHB3ZW50KHB3ZCwgZnApIDwgMCkKKyAJCQkJZ290byBmYWlsOworIAkJCWZv
dW5kID0gMTsKZGlmZiAtLWdpdCBhL3BhY2thZ2UvdXRpbC1saW51eC8wMDA5LUNWRS0yMDI1LTE0
MTA0LTIucGF0Y2ggYi9wYWNrYWdlL3V0aWwtbGludXgvMDAwOS1DVkUtMjAyNS0xNDEwNC0yLnBh
dGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjE2YjY2YTIzY2MKLS0t
IC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3V0aWwtbGludXgvMDAwOS1DVkUtMjAyNS0xNDEwNC0y
LnBhdGNoCkBAIC0wLDAgKzEsMjggQEAKK0Zyb20gOWEzNmQ3NzAxMmM0Yzc3MWY4ZDUxZWJhNDZi
NmU2MmMyOWJmNTcyYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IE1vaGFtZWQgTWFh
dGFsbGFoIDxob3RlbHNtYWF0YWxsYWhyZWNlbWFpbEBnbWFpbC5jb20+CitEYXRlOiBNb24sIDI2
IE1heSAyMDI1IDEwOjA2OjAyICswMTAwCitTdWJqZWN0OiBbUEFUQ0hdIFVwZGF0ZSBidWZmbGVu
CisKK1VwZGF0ZSBidWZsZW4KKworVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS91dGlsLWxp
bnV4L3V0aWwtbGludXgvY29tbWl0LzlhMzZkNzcwMTJjNGM3NzFmOGQ1MWViYTQ2YjZlNjJjMjli
ZjU3MmEKK0NWRTogQ1ZFLTIwMjUtMTQxMDQKK1NpZ25lZC1vZmYtYnk6IFRob21hcyBQZXJhbGUg
PHRob21hcy5wZXJhbGVAbWluZC5iZT4KKy0tLQorIGxvZ2luLXV0aWxzL3NldHB3bmFtLmMgfCAz
ICsrLQorIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKKwor
ZGlmZiAtLWdpdCBhL2xvZ2luLXV0aWxzL3NldHB3bmFtLmMgYi9sb2dpbi11dGlscy9zZXRwd25h
bS5jCitpbmRleCA5NWU0NzBiNWEzNC4uNzc3OGU5OGY3Y2MgMTAwNjQ0CistLS0gYS9sb2dpbi11
dGlscy9zZXRwd25hbS5jCisrKysgYi9sb2dpbi11dGlscy9zZXRwd25hbS5jCitAQCAtOTksNyAr
OTksOCBAQCBpbnQgc2V0cHduYW0oc3RydWN0IHBhc3N3ZCAqcHdkLCBjb25zdCBjaGFyICpwcmVm
aXgpCisgCQlnb3RvIGZhaWw7CisgCisgCW5hbWVsZW4gPSBzdHJsZW4ocHdkLT5wd19uYW1lKTsK
Ky0KKysJaWYgKG5hbWVsZW4gPiBidWZsZW4pCisrCQlidWZsZW4gKz0gbmFtZWxlbjsKKyAJbGlu
ZWJ1ZiA9IG1hbGxvYyhidWZsZW4pOworIAlpZiAoIWxpbmVidWYpCisgCQlnb3RvIGZhaWw7CmRp
ZmYgLS1naXQgYS9wYWNrYWdlL3V0aWwtbGludXgvdXRpbC1saW51eC5tayBiL3BhY2thZ2UvdXRp
bC1saW51eC91dGlsLWxpbnV4Lm1rCmluZGV4IDY0ZGE5YWI1ZDUuLjIyYzMxNGNlODIgMTAwNjQ0
Ci0tLSBhL3BhY2thZ2UvdXRpbC1saW51eC91dGlsLWxpbnV4Lm1rCisrKyBiL3BhY2thZ2UvdXRp
bC1saW51eC91dGlsLWxpbnV4Lm1rCkBAIC0zOSw2ICszOSwxMCBAQCBVVElMX0xJTlVYX0FVVE9S
RUNPTkYgPSBZRVMKICMgMDAwNi1hZGQtbG9vcGRldi1mbC1ub2ZvbGxvdy5wYXRjaAogVVRJTF9M
SU5VWF9JR05PUkVfQ1ZFUyArPSBDVkUtMjAyNi0yNzQ1NgogCisjIDAwMDgtQ1ZFLTIwMjUtMTQx
MDQtMS5wYXRjaAorIyAwMDA5LUNWRS0yMDI1LTE0MTA0LTIucGF0Y2gKK1VUSUxfTElOVVhfSUdO
T1JFX0NWRVMgKz0gQ1ZFLTIwMjUtMTQxMDQKKwogVVRJTF9MSU5VWF9JTlNUQUxMX1NUQUdJTkcg
PSBZRVMKIFVUSUxfTElOVVhfREVQRU5ERU5DSUVTID0gXAogCWhvc3QtcGtnY29uZiBcCi0tIAoy
LjU0LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
