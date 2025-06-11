Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B49C677C4
	for <buildroot@archiver.kernel.org>; Wed, 11 Jun 2025 09:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F37442212;
	Wed, 11 Jun 2025 09:01:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pnoCF8ltv3OR; Wed, 11 Jun 2025 09:01:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 763B742246
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 763B742246;
	Wed, 11 Jun 2025 09:01:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E615D1F2
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 09:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC4EA42280
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 09:01:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7nZwP7C8Ym8H for <buildroot@buildroot.org>;
 Wed, 11 Jun 2025 09:01:28 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=nunog@fr24.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D99F74217E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D99F74217E
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D99F74217E
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 09:01:27 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-451e2f0d9c2so5589485e9.1
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 02:01:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749632486; x=1750237286;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oqEHYDlqPgatlxMlLJFx0PMGodCpZXFQGKRhQhrMRr0=;
 b=rTfo1YHlzkNh/ssF5SuB/9K2dVYsj9tSDK2ofrEF7TI8deaHqg7w/7XmbNldVKCnJo
 k+ko1vSYI6DdsfiQjODuBadJrr7tg/3qfWkoZi2tdsEydB8pYavs5wHQ/IZwn9M+zF98
 IjtZ+QDnprKTLQb2nUF2xX34ZKNkFYsdSBzLAjXk6SiscOSBqn/jLzVyD3OoJcC6ofwC
 GvOAxCk/fTUNtV3Y428EkmS89EhlbgRxTZTFyC8w7tGGirqgtKj/19uyIPCA7kPKIl02
 76mjnmhKruj+4EzxvnsTvufIuMpvXoyMzgLwuLC+3ezpFntyiogmLOFx6XUTJFRpaq3/
 8XAQ==
X-Gm-Message-State: AOJu0Yz8H7YZwP7h4zV65+BagPxp2NzHqh7WxihRLuRWeS3Eixd0ljYz
 qBcWJbneQs/P5Y3r+KU3rrT4rmZv2sHS1DVqGL/7+v4cmmRPYS712Qfj9SpHFbwN4R+W8roWQJs
 nIg14HYk=
X-Gm-Gg: ASbGncs8Rxw7urBG5c5Zulyb5znYhxe4zrWhu4s2wTpVLjk1iQpXmLW9c0VRmQIn/uE
 7tAp5GbuOq0++gO/8A0wdZgSnV+juzmGVzSPL7PK16Wxp0+7sfN9/qKNrepymRjDWrycnz8fmR4
 QOPpCRl4paLfnFDNy/jsbcGd76e/ESDuLgqQJeeWHKtoZTUyVWt4pNsZOYI+pM+izsc4hOPeS9J
 W5OYFtzFJlb2sHNSQ4n+xn0etp6HwqwZ4gwjoWkfN4Z9HwjbQhXBO8vNZKP2fJFd+43gRRoJ/AM
 Axj3wPmHKOAubdeJAUQbvLSmxNiNyCX8mI/1Ncf2AYCQ/FQRt8nPMCDAuvI78uOwJ5wW4Ju5EJB
 AG/MawouZuqcLRs63bYXuXec=
X-Google-Smtp-Source: AGHT+IFZx8Wc9i4m/hy20TLTVzSeF9LHwYHU10EE1oWwQ4IAYVBDp1m4rv2egO85+EZfNB7XgNWmVA==
X-Received: by 2002:a05:600c:a30d:b0:43c:ec72:3daf with SMTP id
 5b1f17b1804b1-45324208370mr17541775e9.14.1749632485607; 
 Wed, 11 Jun 2025 02:01:25 -0700 (PDT)
Received: from sky21.internal.fr24.com (dsl-191-233.bl27.telepac.pt.
 [176.79.191.233]) by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-45325205053sm14777965e9.23.2025.06.11.02.01.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 02:01:25 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Nuno=20Gon=C3=A7alves?= <nunog@fr24.com>
Date: Wed, 11 Jun 2025 10:00:59 +0100
Message-ID: <20250611090105.1501544-1-nunog@fr24.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fr24.com; s=google; t=1749632486; x=1750237286; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oqEHYDlqPgatlxMlLJFx0PMGodCpZXFQGKRhQhrMRr0=;
 b=dSlOXMWR/4DYBIRckG3v1yS0W0+g3T0S9s2OMI1tKz2ExFFptY6b1Vn5DBH5x7ivSe
 GDlF19k2lo0BN5wIrPtu2S5hP6NiZOqT6kcJYxxyLDDLss40GoaziSeWn+h+v0VuVEEZ
 PwN+twgI833b6sO/q3UAVVPFiYF0k15sr6+j5WbjYGkndRYWdexTHFxf4gneuHW3M9ap
 qQSS3o1CIb35hDKaEnNfUUO+bzoXqqZBbe5qMX7R4CtX3IlbJWYykKphr3/EJkxhEakL
 A/ijM7PiKSq+FLWmSgnG0yz+mGxHCQDqoWUWT4cGsOUSrjWGZO1tLc0RJNDp5cP4hjT7
 wsGg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=fr24.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=fr24.com header.i=@fr24.com header.a=rsa-sha256
 header.s=google header.b=dSlOXMWR
Subject: [Buildroot] [PATCH] package/systemd: disable fchmodat2 as changes
 are not visible in fakeroot
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
From: =?utf-8?q?Nuno_Gon=C3=A7alves_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Nuno=20Gon=C3=A7alves?= <nunog@fr24.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2hlbiBmY2htb2RhdDIgaXMgY2FsbGVkIGluIHN5c3RlbWQgdG1wZmlsZXMsIGl0c2VsZiBjYWxs
ZWQgYnkKZmFrZXJvb3RfdG1wZmlsZXMuc2gsIHRoZSBjaGFuZ2VzIHdpbGwgbm90IGJlIHZpc2li
bGUgaW5zaWRlIHRoZQpmYWtlcm9vdCwgbWFraW5nIHRoZSBjaGFuZ2VzIGxvc3QgZm9yIHRoZSBw
dXJwb3NlIG9mIHJvb3RmcyBmaWxlCnBlcm1pc3Npb25zLgoKVGhpcyB3b3VsZCBhZmZlY3QgYnVp
bGRzIHdoZW4gaG9zdCBrZXJuZWwgPj0gNi42LgoKU2lnbmVkLW9mZi1ieTogTnVubyBHb27Dp2Fs
dmVzIDxudW5vZ0BmcjI0LmNvbT4KLS0tCiAuLi4yLWFzLWNoYW5nZXMtYXJlLW5vdC12aXNpYmxl
LWluLWZha2UucGF0Y2ggfCAzNiArKysrKysrKysrKysrKysrKysrCiAuLi4vaG9zdC1vbmx5LXBh
dGNoZXMvMDAwMS1uby1mY2htb2RhdDIucGF0Y2ggfCAxMyArKysrKysrCiBwYWNrYWdlL3N5c3Rl
bWQvc3lzdGVtZC5tayAgICAgICAgICAgICAgICAgICAgfCAgNSArKy0KIDMgZmlsZXMgY2hhbmdl
ZCwgNTMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBh
Y2thZ2Uvc3lzdGVtZC9ob3N0LW9ubHktcGF0Y2hlcy8wMDAxLURpc2FibGUtZmNobW9kYXQyLWFz
LWNoYW5nZXMtYXJlLW5vdC12aXNpYmxlLWluLWZha2UucGF0Y2gKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBwYWNrYWdlL3N5c3RlbWQvaG9zdC1vbmx5LXBhdGNoZXMvMDAwMS1uby1mY2htb2RhdDIucGF0
Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3N5c3RlbWQvaG9zdC1vbmx5LXBhdGNoZXMvMDAwMS1E
aXNhYmxlLWZjaG1vZGF0Mi1hcy1jaGFuZ2VzLWFyZS1ub3QtdmlzaWJsZS1pbi1mYWtlLnBhdGNo
IGIvcGFja2FnZS9zeXN0ZW1kL2hvc3Qtb25seS1wYXRjaGVzLzAwMDEtRGlzYWJsZS1mY2htb2Rh
dDItYXMtY2hhbmdlcy1hcmUtbm90LXZpc2libGUtaW4tZmFrZS5wYXRjaApuZXcgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5mMTY3MzVkZjQ3Ci0tLSAvZGV2L251bGwKKysrIGIv
cGFja2FnZS9zeXN0ZW1kL2hvc3Qtb25seS1wYXRjaGVzLzAwMDEtRGlzYWJsZS1mY2htb2RhdDIt
YXMtY2hhbmdlcy1hcmUtbm90LXZpc2libGUtaW4tZmFrZS5wYXRjaApAQCAtMCwwICsxLDM2IEBA
CitGcm9tIDc4ZTMxY2MwOTMxZTU2Njc3NDI2MDA5NTc0MTEzMjZjZmNkOWM4M2QgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tOiA9P1VURi04P3E/TnVubz0yMEdvbj1DMz1BN2FsdmVzPz0g
PG51bm9nQGZyMjQuY29tPgorRGF0ZTogV2VkLCAxMSBKdW4gMjAyNSAwOTo1MTo1MCArMDEwMAor
U3ViamVjdDogW1BBVENIXSBEaXNhYmxlIGZjaG1vZGF0MiBhcyBjaGFuZ2VzIGFyZSBub3Qgdmlz
aWJsZSBpbiBmYWtlcm9vdAorTUlNRS1WZXJzaW9uOiAxLjAKK0NvbnRlbnQtVHlwZTogdGV4dC9w
bGFpbjsgY2hhcnNldD1VVEYtOAorQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAorCitX
aGVuIGZjaG1vZGF0MiBpcyBjYWxsZWQgaW4gc3lzdGVtZCB0bXBmaWxlcywgaXRzZWxmIGNhbGxl
ZCBieQorZmFrZXJvb3RfdG1wZmlsZXMuc2gsIHRoZSBjaGFuZ2VzIHdpbGwgbm90IGJlIHZpc2li
bGUgaW5zaWRlIHRoZQorZmFrZXJvb3QsIG1ha2luZyB0aGUgY2hhbmdlcyBsb3N0IGZvciB0aGUg
cHVycG9zZSBvZiByb290ZnMgZmlsZQorcGVybWlzc2lvbnMuCisKK1RoaXMgd291bGQgYWZmZWN0
IGJ1aWxkcyB3aGVuIGhvc3Qga2VybmVsID49IDYuNi4KKworU2lnbmVkLW9mZi1ieTogTnVubyBH
b27Dp2FsdmVzIDxudW5vZ0BmcjI0LmNvbT4KKy0tLQorIHNyYy9iYXNpYy9mcy11dGlsLmMgfCAy
IC0tCisgMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCisKK2RpZmYgLS1naXQgYS9zcmMv
YmFzaWMvZnMtdXRpbC5jIGIvc3JjL2Jhc2ljL2ZzLXV0aWwuYworaW5kZXggMDRmNzI5MGNjMi4u
MmNhODA4MDc4ZSAxMDA2NDQKKy0tLSBhL3NyYy9iYXNpYy9mcy11dGlsLmMKKysrKyBiL3NyYy9i
YXNpYy9mcy11dGlsLmMKK0BAIC0yOTgsOCArMjk4LDYgQEAgaW50IGZjaG1vZF9vcGF0aChpbnQg
ZmQsIG1vZGVfdCBtKSB7CisgCisgICAgICAgICBhc3NlcnQoZmQgPj0gMCk7CisgCistICAgICAg
ICBpZiAoZmNobW9kYXQyKGZkLCAiIiwgbSwgQVRfRU1QVFlfUEFUSCkgPj0gMCkKKy0gICAgICAg
ICAgICAgICAgcmV0dXJuIDA7CisgICAgICAgICBpZiAoIUlOX1NFVChlcnJubywgRU5PU1lTLCBF
UEVSTSkpIC8qIFNvbWUgY29udGFpbmVyIG1hbmFnZXJzIGJsb2NrIHVua25vd24gc3lzY2FsbHMg
d2l0aCBFUEVSTSAqLworICAgICAgICAgICAgICAgICByZXR1cm4gLWVycm5vOworIAorLS0gCisy
LjQzLjAKKwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9zeXN0ZW1kL2hvc3Qtb25seS1wYXRjaGVzLzAw
MDEtbm8tZmNobW9kYXQyLnBhdGNoIGIvcGFja2FnZS9zeXN0ZW1kL2hvc3Qtb25seS1wYXRjaGVz
LzAwMDEtbm8tZmNobW9kYXQyLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAw
MDAwMDAuLmY3MmNhZjRjZGEKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3N5c3RlbWQvaG9z
dC1vbmx5LXBhdGNoZXMvMDAwMS1uby1mY2htb2RhdDIucGF0Y2gKQEAgLTAsMCArMSwxMyBAQAor
ZGlmZiAtLWdpdCBhL3NyYy9iYXNpYy9mcy11dGlsLmMgYi9zcmMvYmFzaWMvZnMtdXRpbC5jCitp
bmRleCAwNGY3MjkwY2MyLi4yY2E4MDgwNzhlIDEwMDY0NAorLS0tIGEvc3JjL2Jhc2ljL2ZzLXV0
aWwuYworKysrIGIvc3JjL2Jhc2ljL2ZzLXV0aWwuYworQEAgLTI5OCw4ICsyOTgsNiBAQCBpbnQg
ZmNobW9kX29wYXRoKGludCBmZCwgbW9kZV90IG0pIHsKKyAKKyAgICAgICAgIGFzc2VydChmZCA+
PSAwKTsKKyAKKy0gICAgICAgIGlmIChmY2htb2RhdDIoZmQsICIiLCBtLCBBVF9FTVBUWV9QQVRI
KSA+PSAwKQorLSAgICAgICAgICAgICAgICByZXR1cm4gMDsKKyAgICAgICAgIGlmICghSU5fU0VU
KGVycm5vLCBFTk9TWVMsIEVQRVJNKSkgLyogU29tZSBjb250YWluZXIgbWFuYWdlcnMgYmxvY2sg
dW5rbm93biBzeXNjYWxscyB3aXRoIEVQRVJNICovCisgICAgICAgICAgICAgICAgIHJldHVybiAt
ZXJybm87CisgCmRpZmYgLS1naXQgYS9wYWNrYWdlL3N5c3RlbWQvc3lzdGVtZC5tayBiL3BhY2th
Z2Uvc3lzdGVtZC9zeXN0ZW1kLm1rCmluZGV4IDcxZmUwZGU1NTAuLjljZjQ1ZWE4NzEgMTAwNjQ0
Ci0tLSBhL3BhY2thZ2Uvc3lzdGVtZC9zeXN0ZW1kLm1rCisrKyBiL3BhY2thZ2Uvc3lzdGVtZC9z
eXN0ZW1kLm1rCkBAIC0xMDQxLDcgKzEwNDEsMTAgQEAgZGVmaW5lIEhPU1RfU1lTVEVNRF9GSVhf
UlBBVEgKIAkJfHwgZXhpdCAxOyBcCiAJZG9uZQogZW5kZWYKLUhPU1RfU1lTVEVNRF9QT1NUX0lO
U1RBTExfSE9PS1MgKz0gSE9TVF9TWVNURU1EX0ZJWF9SUEFUSAorZGVmaW5lIEhPU1RfU1lTVEVN
RF9OT19GQ0hNT0RBVDIKKwkkKEFQUExZX1BBVENIRVMpIGhvc3Qtb25seS1wYXRjaGVzLzAwMDEt
RGlzYWJsZS1mY2htb2RhdDItYXMtY2hhbmdlcy1hcmUtbm90LXZpc2libGUtaW4tZmFrZS5wYXRj
aAorZW5kZWYKK0hPU1RfU1lTVEVNRF9QT1NUX0lOU1RBTExfSE9PS1MgKz0gSE9TVF9TWVNURU1E
X0ZJWF9SUEFUSCBIT1NUX1NZU1RFTURfTk9fRkNITU9EQVQyCiAKICQoZXZhbCAkKG1lc29uLXBh
Y2thZ2UpKQogJChldmFsICQoaG9zdC1tZXNvbi1wYWNrYWdlKSkKLS0gCjIuNDMuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
