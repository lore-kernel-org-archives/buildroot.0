Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A529ECA5FA5
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EF51608AA;
	Tue, 29 Sep 2026 18:48:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id moe6mwowLypL; Tue, 29 Sep 2026 18:48:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 99CB260885
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707716;
	b=kuwTwO691aYXsqubQBpdA2BM+ouXywPtLuc8hTwGtILeXX16/PVts9fL8ReWPk30cxjE
	 quCtJBWmEzlFRyHvzqzEaqAonZ6JzPjgGy2+2l3ba6YQxxf3NHuL4RwIPwXIedRsLp3pU
	 LbKHxCCLLRgiWJPRaBzVe3L+Ed437L/l/bHSpVdkPOQGDdpe8BpLEAiezcCcz9kWaKGwU
	 qp7vrMu0LRe5XmkxxFmaAbAdUZd2HE6QyoazF87p+ApN7GCZiD2cKQSa/MjDGcVVEwwyj
	 M9dvs0rtzhlBD6jxb2nqGEO/wUZ0EkJZRWjSsEKNSTYtSgk9GmjHdgU5NwjOiu30u6w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707716;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nCY3xplOoZIV11KF3hc/PcEaecilnqta473ShnVR3xA=;
	b=M/typEgHwoYXJDdIWK7IFMD0BNdjYF1AEWxIy3wgqn6FhtEVEGm6cLaAKA2I+G3CCnBU
	 oRfjIw03ZU3qsK55n1tBL7hE/dBQoF68aq8jznA8ULKvxQqpSame50FT0CCKSwdMvx3tn
	 vRPxdkHf9Ra9KXW2WVtxpm41t8YCCBGJoXbQT2bBDTokVHLYn7TzsD4855ktLJsQAbH2l
	 P+n90jsgIf+gTINxF5WBNUL8B+2Gydw8uqFA1Qet4lMIK92eBTSNH7URZ88oaEH6S4f/J
	 CxoOwcCe04P6B7aS7V9e883zOh9GoIAPRDAJzVpOQ0P0G2+0ejVANNmpLdfH2s6M6LQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707716;
	bh=nCY3xplOoZIV11KF3hc/PcEaecilnqta473ShnVR3xA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VF7m5/sfs2fyOVQGRQq4M9MfSKA8XYCrFnTaA+6L1HZUTQQ+1ahL7NO4yPU49t7PO
	 Shp3VPwhV2jyMB/ljcw5e4k7dkC8zMhCib87ADtPWa8COyBq2HMTvJzWXIAQGwY0LJ
	 CpBiOzKjq3PFWOvdtLDqs+T7DUsoH9yezXNWDX6RdrV5+llLfNfAs2vYv0ZXQMiB9c
	 L5S/Hpijw650S4q57nltLZVhMo2bcb2J76hOhIuX4oPqF/MMeAybSlfIffQ+mV7NVg
	 DaTok85LDkPwRCQvME/YkOxzjzMJvzzaBF+G1KqbZ9We1Qi4IYvwjMZzBsp6Zom8+P
	 StwM08RQMRXHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99CB260885;
	Tue, 29 Sep 2026 18:48:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 19BB63D8
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B58C811FB
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:48:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xx3snfzQPyRQ for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:48:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1AA0B811DD
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707714;
 b=rx1xrkLZZaKWmT8LD5iTBGoA5WAqysz2NOD2HIFCx17ZVNmeexXqbin2bCK1XFE99pvv
 G0O18jdSjwoULrzshNcYrstZTkWdBxzyZnklzPYuB0haG6hWYWc366a81LiHDh09t4y6w
 UDzPMd3OnIfM0evILnJABw29St6We/cY2BfllnywbFOMaxL+QCwJbLXl+i/SzKy9KG3Lb
 XBA190LNLfdjW/OWJ9GeBExkH+T7AS31UTJcPK2cdSVjh5lM81dd6hcCUymbmTLPe43V/
 3iRSjmp4oSYqLRGvuthO5sXIw5joFo+KQLKyVJCR0hr5TJuPgWa4XzaWHPtzH3Z7j5A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707714;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=yVQ+onS4gj9l2uv3FKdYCIH3khQZGY2Ct8LBO1mQUbg=;
 b=Rh0db1MJvnp7lPUMO6vvJBMvtwc7XaDVJxoV3oPCYaYwEVfFkq+OMHU78agP4l7b223V
 2i5MgxPBZjaK1sgQ/rlV7BZsQTAxuED6jq9GwgyCPaD9j0V1d87pBpkxNrCDmdPNdM8i4
 oZ0Lz1xTsDb+T6XGGThI/4R2fdJKdoV+jrXJiWnKVsaEgOlqcTyn63dDulV0Hfcae2qg9
 AtI5/uissPVqwvkRnKYFAofKWXvBtycLltXrFVKZ3e6Xqv3W0ebCMPGzikbzkugvL+5Bx
 +4dA0IeFYg2O9pyDtl2cOkY9FfT6etdbnEcHp3bOoxWNtd/7WYGMwZfxpvU3uqK1vAg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=c76j+eFt; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=c76j+eFt
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1AA0B811DD
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790707032;
 bh=yVQ+onS4gj9l2uv3FKdYCIH3khQZGY2Ct8LBO1mQUbg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=c76j+eFtTLM5zaiHkIMZxy/09bgTY5fmoSn0bc7Wdg06Kq/vxWNbMIO7jAHyoad9n
 958NI0vIv1aCSL5ebWFCM8GZnZtLrD9rNa8CT6qJtcjCiuKeKQswv/h99n2iTWMc6P
 a8fe4dEFCfLKmF0YP83ptqcZo/JOg2uTBJurKqpUrJn05YspZOK2GVNXC42b71d87s
 jDcIE3S/c+z77Xhga6/l1gKVhZr4T4cr5JUwQWE/lfVUU5yT7pyZBANo/rWub9YrWe
 KXev9CNdFKZE3NyXGqCTvUr+q1qmgKF50Tqv2E0xItwkF/VcGB0xF7wgXBNwaspG3h
 44HAXstieFDiQ==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 wJr3spBMfYpwNpZ1G3lsMMR7FJW1hOukBFDn4JZgFPLCQLeUe0BHlxiXyWEvdxqcnYp+UAlj3pj
 kFOTFcXVu5I0E5Fr8hrC5rLq5Xa4e3ttvHRFmm7aA6oWK2dx1ZcclPwDvX2n5GGB7BS9mpmhSTT
 GXtK3wY1G0TvPsex4m/27oZ/XnEqlRP5R0Gd/kqEpVPgDb/7bXts8rQhdGwDAghD1thSEoW/uzY
 /t/hknOGI37+8qV7Q1RZQQz8IRWZr9BNHC+OI7MMBrsLTbIAjmsVerMSpTV+dMlGqqNeZkv7S9C
 3q7i5L5mscN9b1sEzRow1rU2Cr39LAUBpiJ/ryiUNuPDFM5Eh2F0wFFum5RfikGE4pZesNfB6ue
 NX4FblIErFZ69eT7GsFBp1eJ9zvaBGI1FOo5E66E5ZBrzybG7dBmPbLaUtR/hEop5+Bc05tPQ0P
 Y8MXkmXDj3SPi7YQXD9LBR2SueYckAPy0qok6Pp26EEX0oEvFSAY6wmXQ9q+rXeJanmaDNa2Jba
 04vzTW24at+VO1vbt/AushIS/rm5xaJmIQ6ltxW1z9a+S5JkGznViA19WS5geUMSSK7okdOerfu
 sDQDucElwC/3I9coJ7mQExq+MHzhR0A6Sw==
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D78B8A4C51F3;
 Tue, 29 Sep 2026 20:37:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcgl-000000006Jn-3PSd;
 Tue, 29 Sep 2026 18:36:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andrey Yurovsky <yurovsky@gmail.com>, Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue, 29 Sep 2026 20:35:50 +0200
Message-ID: <20260929183607.1849293-52-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ---
Subject: [Buildroot] [PATCH v7 51/66] package/rauc: Fix build with OpenSSL
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

U2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KQ2M6IEFuZHJleSBZ
dXJvdnNreSA8eXVyb3Zza3lAZ21haWwuY29tPgpDYzogSGVpa28gVGhpZXJ5IDxoZWlrby50aGll
cnlAZ21haWwuY29tPgotLS0KIC4uLk4xX1NUUklOR19nZXQwX2RhdGEtYW5kLUFTTjFfU1RSSU5H
Xy5wYXRjaCB8IDQ4ICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA0OCBpbnNl
cnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9yYXVjLzAwMDEtc2lnbmF0dXJl
LXVzZS1BU04xX1NUUklOR19nZXQwX2RhdGEtYW5kLUFTTjFfU1RSSU5HXy5wYXRjaAoKZGlmZiAt
LWdpdCBhL3BhY2thZ2UvcmF1Yy8wMDAxLXNpZ25hdHVyZS11c2UtQVNOMV9TVFJJTkdfZ2V0MF9k
YXRhLWFuZC1BU04xX1NUUklOR18ucGF0Y2ggYi9wYWNrYWdlL3JhdWMvMDAwMS1zaWduYXR1cmUt
dXNlLUFTTjFfU1RSSU5HX2dldDBfZGF0YS1hbmQtQVNOMV9TVFJJTkdfLnBhdGNoCm5ldyBmaWxl
IG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmJhODAzMmM2ZTcKLS0tIC9kZXYvbnVsbAor
KysgYi9wYWNrYWdlL3JhdWMvMDAwMS1zaWduYXR1cmUtdXNlLUFTTjFfU1RSSU5HX2dldDBfZGF0
YS1hbmQtQVNOMV9TVFJJTkdfLnBhdGNoCkBAIC0wLDAgKzEsNDggQEAKK0Zyb20gMTAxYWFjYWY4
MmQyNTBiZmI4ZTU4MWUwMDJiMmMzODA4NjkwODBlZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb206IEJydW5vIFRob21zZW4gPGJydW5vLnRob21zZW5AZ21haWwuY29tPgorRGF0ZTogU2F0
LCAxMSBBcHIgMjAyNiAxNzowNjoxMCArMDIwMAorU3ViamVjdDogW1BBVENIXSBzaWduYXR1cmU6
IHVzZSBBU04xX1NUUklOR19nZXQwX2RhdGEgYW5kIEFTTjFfU1RSSU5HX2xlbmd0aAorTUlNRS1W
ZXJzaW9uOiAxLjAKK0NvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAorQ29u
dGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAorCitVc2UgQVNOMV9TVFJJTkdfZ2V0MF9kYXRh
KCkgYW5kIEFTTjFfU1RSSU5HX2xlbmd0aCgpIGZ1bmN0aW9ucworYWxsb3cgYW4gQVNOMV9TVFJJ
Tkcgc3RydWN0dXJlIHRvIGJlIG1hbmlwdWxhdGVkLiBBdm9pZCBlcnJvcnMKK2xpa2UgdGhpcyB3
aGVuIGNvbXBpbGluZyBhZ2FpbnN0IE9wZW5TU0wgNC4wOgorCitlcnJvcjogaW52YWxpZCB1c2Ug
b2YgaW5jb21wbGV0ZSB0eXBlZGVmIOKAmEFTTjFfT0NURVRfU1RSSU5H4oCZIHtha2Eg4oCYc3Ry
dWN0IGFzbjFfc3RyaW5nX3N04oCZfQorCitTaWduZWQtb2ZmLWJ5OiBCcnVubyBUaG9tc2VuIDxi
cnVuby50aG9tc2VuQGdtYWlsLmNvbT4KKworVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS9y
YXVjL3JhdWMvY29tbWl0LzEwMWFhY2FmODJkMjUwYmZiOGU1ODFlMDAyYjJjMzgwODY5MDgwZWYK
KworU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KKy0tLQorIHNy
Yy9zaWduYXR1cmUuYyB8IDQgKystLQorIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCisKK2RpZmYgLS1naXQgYS9zcmMvc2lnbmF0dXJlLmMgYi9zcmMvc2ln
bmF0dXJlLmMKK2luZGV4IGQyYWNhYzZiLi45MWJlN2JiNyAxMDA2NDQKKy0tLSBhL3NyYy9zaWdu
YXR1cmUuYworKysrIGIvc3JjL3NpZ25hdHVyZS5jCitAQCAtMTM0NCw3ICsxMzQ0LDcgQEAgZ2Jv
b2xlYW4gY21zX2dldF91bnZlcmlmaWVkX21hbmlmZXN0KEdCeXRlcyAqc2lnLCBHQnl0ZXMgKipt
YW5pZmVzdCwgR0Vycm9yICoqZXIKKyAJCQkJIm1pc3NpbmcgbWFuaWZlc3QgaW4gaW5saW5lIHNp
Z25hdHVyZSIpOworIAkJZ290byBvdXQ7CisgCX0KKy0JaWYgKCEoKmNvbnRlbnQpLT5kYXRhIHx8
ICgoKmNvbnRlbnQpLT5sZW5ndGggPD0gMCkpIHsKKysJaWYgKChBU04xX1NUUklOR19nZXQwX2Rh
dGEoKmNvbnRlbnQpID09IE5VTEwpIHx8IChBU04xX1NUUklOR19sZW5ndGgoKmNvbnRlbnQpIDw9
IDApKSB7CisgCQlnX3NldF9lcnJvcigKKyAJCQkJZXJyb3IsCisgCQkJCVJfU0lHTkFUVVJFX0VS
Uk9SLAorQEAgLTEzNTMsNyArMTM1Myw3IEBAIGdib29sZWFuIGNtc19nZXRfdW52ZXJpZmllZF9t
YW5pZmVzdChHQnl0ZXMgKnNpZywgR0J5dGVzICoqbWFuaWZlc3QsIEdFcnJvciAqKmVyCisgCQln
b3RvIG91dDsKKyAJfQorIAorLQl0bXAgPSBnX2J5dGVzX25ldygoKmNvbnRlbnQpLT5kYXRhLCAo
KmNvbnRlbnQpLT5sZW5ndGgpOworKwl0bXAgPSBnX2J5dGVzX25ldyhBU04xX1NUUklOR19nZXQw
X2RhdGEoKmNvbnRlbnQpLCBBU04xX1NUUklOR19sZW5ndGgoKmNvbnRlbnQpKTsKKyAJaWYgKCF0
bXApIHsKKyAJCWdfc2V0X2Vycm9yX2xpdGVyYWwoCisgCQkJCWVycm9yLAorLS0gCisyLjQ3LjMK
KwotLSAKMi40Ny4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
