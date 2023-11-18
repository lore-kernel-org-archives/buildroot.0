Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E11C2BB3F
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 22:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 202DA60E9D;
	Sat, 18 Nov 2023 22:12:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 202DA60E9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 73pHUrsRZDPc; Sat, 18 Nov 2023 22:12:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3166160E6B;
	Sat, 18 Nov 2023 22:12:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3166160E6B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0D0D81BF354
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 22:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9FDC417B4
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 22:12:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9FDC417B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yN1RBBb2Cne7 for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 22:12:16 +0000 (UTC)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 09EE0417B3
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 22:12:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09EE0417B3
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-6c4d06b6ddaso2776211b3a.3
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 14:12:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700345535; x=1700950335;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TJZ2HBBG/GCUpttT2Kd5VaHx9I4Hfo6pBmQ4YRfzjLo=;
 b=Dkbp8ZzmjC0840V9mC8IJdLxk9YbOHyY5KLrz7zCKptpIUUQxKq83am66oOXHHengG
 eQPHI95QWvJAUJclcx3CKQC37NVGNTl0wR/7D7PtLeQ3SBgfdfVSwA10OwSBTFO87OxQ
 wSIT3tGwZptkdpbW7ZG9N35IA4FqniKBgcDDFBGSlxlPuYr97IKraJJ3YU/ikH4vEMBV
 rWrxKFpkQp5nhQ5KF+KGnLTAn6Y5YmnYVPfH+fw1bgtYo1vmV+P4cKm8jBMrsdM5M5zT
 6EcrADq+3wcp0NAu+VeUSSUAAJ3yab9JbLHILNE9Y6aZBVjD49mmo9x+HI7bqZ8sFwDq
 lwuw==
X-Gm-Message-State: AOJu0YxJxpkr9BDA0ey33F6i0UC4VnwnKnzKdXP9YPNX5XFp5jdMNzRo
 vOqcqIuSUADWu3FVpi9hVJfbUChe/pcIjrLbyY6bMQ==
X-Google-Smtp-Source: AGHT+IFrdqYbM0tK1iNOgizzh3kU6bKpo3rjm+GprwGK4gXT2Y8oSXdXE4uJh929x0FJDpkppI+VWg==
X-Received: by 2002:a05:6a21:9997:b0:181:1cfa:4106 with SMTP id
 ve23-20020a056a21999700b001811cfa4106mr2857275pzb.62.1700345535008; 
 Sat, 18 Nov 2023 14:12:15 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.106])
 by smtp.gmail.com with ESMTPSA id
 jw19-20020a170903279300b001b9da42cd7dsm3423699plb.279.2023.11.18.14.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Nov 2023 14:12:14 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 18 Nov 2023 15:12:00 -0700
Message-ID: <20231118221206.1369389-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231118221206.1369389-1-adam.duskett@amarulasolutions.com>
References: <20231118221206.1369389-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700345535; x=1700950335;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TJZ2HBBG/GCUpttT2Kd5VaHx9I4Hfo6pBmQ4YRfzjLo=;
 b=hMDxcE/0eOld6ZIMyRJSC7tyVfpCQ2Zw5KHUGoU4OgBHd7NnuDexT57hH+L5lEdz3V
 nudGM64kPzpyXbICdAPCwcfTmoBrwVfy4Ra75JJBxKBFRQIxG/yVjlaU/tGVTDh6694h
 Y0d1HdeKBIcgf3sNl2L/TZI5tk5AiVn7M3GEM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=hMDxcE/0
Subject: [Buildroot] [PATCH/next v2 4/9] package/flutter-engine: Add profile
 runtime mode selection
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlcmUgYXJlIG9ubHkgdHdvIHBvc3NpYmxlIG1vZGVzIGZvciBGbHV0dGVyOiBEZWJ1ZyBhbmQg
cmVsZWFzZS4gSG93ZXZlciwKdGhlcmUgaXMgYSB0aGlyZCBtb2RlIGF2YWlsYWJsZSB0byB1c2Vy
czogcHJvZmlsZS4KCkFzIEZsdXR0ZXIgcHJvamVjdHMgY2FuIGJlIHByZXR0eSBoZWF2eSBhbmQg
Y29uc3VtZSBhIGxvdCBvZiByZXNvdXJjZXMsIGl0IGlzCm5lY2Vzc2FyeSB0byBhbGxvdyB1c2Vy
cyB0byBwcm9maWxlIHRoZWlyIEZsdXR0ZXIgYXBwbGljYXRpb24gZHVyaW5nCmRldmVsb3BtZW50
LgoKQWRkIGEgbmV3IGNob2ljZTogRkxVVFRFUl9FTkdJTkVfUlVOVElNRV9NT0RFX1BST0ZJTEUu
IElmIHVuc2VsZWN0ZWQsIHRoZQpnbG9iYWwgb3B0aW9uIEJSMl9FTkFCTEVfUlVOVElNRV9ERUJV
RyBkZXRlcm1pbmVzIHdoZXRoZXIgdG8gYnVpbGQgRmx1dHRlcgppbiByZWxlYXNlIG9yIGRlYnVn
IG1vZGUuCgpTaWduZWQtb2ZmLWJ5OiBBZGFtIER1c2tldHQgPGFkYW0uZHVza2V0dEBhbWFydWxh
c29sdXRpb25zLmNvbT4KLS0tCnYxIC0+IHYyOiBPbmx5IGFkZCB0aGUgcHJvZmlsZSBvcHRpb24g
YW5kIHJlbHkgb24gdGhlIGdsb2JhbAogICAgICAgICAgQlIyX0VOQUJMRV9SVU5USU1FX0RFQlVH
IG9wdGlvbiBmb3IgcmVsZWFzZSBhbmQgZGVidWcgW1lhbm5dCgogcGFja2FnZS9mbHV0dGVyLWVu
Z2luZS9Db25maWcuaW4gICAgICAgICB8IDI1ICsrKysrKysrKysrKysrKysrKysrKysrKwogcGFj
a2FnZS9mbHV0dGVyLWVuZ2luZS9mbHV0dGVyLWVuZ2luZS5tayB8ICA0ICsrKy0KIDIgZmlsZXMg
Y2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvZmx1dHRlci1lbmdpbmUvQ29uZmlnLmluIGIvcGFja2FnZS9mbHV0dGVyLWVuZ2luZS9D
b25maWcuaW4KaW5kZXggMmVjNWI5MGZmZC4uM2M5MmU0MGY3NCAxMDA2NDQKLS0tIGEvcGFja2Fn
ZS9mbHV0dGVyLWVuZ2luZS9Db25maWcuaW4KKysrIGIvcGFja2FnZS9mbHV0dGVyLWVuZ2luZS9D
b25maWcuaW4KQEAgLTM5LDYgKzM5LDMxIEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9GTFVUVEVSX0VO
R0lORQogCiAJICBodHRwczovL2dpdGh1Yi5jb20vZmx1dHRlci9lbmdpbmUKIAoraWYgQlIyX1BB
Q0tBR0VfRkxVVFRFUl9FTkdJTkUKKworY29uZmlnIEZMVVRURVJfRU5HSU5FX1JVTlRJTUVfTU9E
RV9QUk9GSUxFCisJYm9vbCAiZW5hYmxlIHByb2ZpbGluZyIKKwloZWxwCisJICBTb21lIGRlYnVn
Z2luZyBhYmlsaXR5IGlzIG1haW50YWluZWTigJRlbm91Z2ggdG8gcHJvZmlsZSB5b3VyCisJICBh
cHBzIHBlcmZvcm1hbmNlLiBQcm9maWxlIG1vZGUgaXMgZGlzYWJsZWQgb24gdGhlIGVtdWxhdG9y
CisJICBhbmQgc2ltdWxhdG9yLCBiZWNhdXNlIHRoZWlyIGJlaGF2aW9yIGlzIG5vdCByZXByZXNl
bnRhdGl2ZQorCSAgb2YgcmVhbCBwZXJmb3JtYW5jZS4gUHJvZmlsZSBtb2RlIGlzIHNpbWlsYXIg
dG8gcmVsZWFzZSBtb2RlLAorCSAgd2l0aCB0aGUgZm9sbG93aW5nIGRpZmZlcmVuY2VzOgorCisJ
ICAtIFNvbWUgc2VydmljZSBleHRlbnNpb25zLCBzdWNoIGFzIHRoZSBvbmUgdGhhdCBlbmFibGVz
IHRoZQorCSAgICBwZXJmb3JtYW5jZSBvdmVybGF5LCBhcmUgZW5hYmxlZC4KKworCSAgLSBUcmFj
aW5nIGlzIGVuYWJsZWQsIGFuZCB0b29scyBzdXBwb3J0aW5nIHNvdXJjZS1sZXZlbAorCSAgICBk
ZWJ1Z2dpbmcgKHN1Y2ggYXMgRGV2VG9vbHMpIGNhbiBjb25uZWN0IHRvIHRoZSBwcm9jZXNzLgor
CisJICBJZiB0aGlzIG9wdGlvbiBpcyBsZWZ0IHVuc2VsZWN0ZWQsIHRoZSBnbG9iYWwgb3B0aW9u
CisJICBCUjJfRU5BQkxFX1JVTlRJTUVfREVCVUcgZGV0ZXJtaW5lcyB3aGV0aGVyIHRvIGJ1aWxk
IEZsdXR0ZXIKKwkgIGluIHJlbGVhc2Ugb3IgZGVidWcgbW9kZS4KKworCSAgaHR0cHM6Ly9kb2Nz
LmZsdXR0ZXIuZGV2L3Rlc3RpbmcvYnVpbGQtbW9kZXMjcHJvZmlsZQorCitlbmRpZgorCiBjb21t
ZW50ICJmbHV0dGVyLWVuZ2luZSBuZWVkcyBhbiBPcGVuR0wgb3IgT3BlbkdMRVMgYmFja2VuZCIK
IAlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0ZMVVRURVJfRU5HSU5FX0FSQ0hfU1VQUE9SVFMKIAlk
ZXBlbmRzIG9uICFCUjJfUEFDS0FHRV9IQVNfTElCR0wgJiYgIUJSMl9QQUNLQUdFX0hBU19MSUJH
TEVTCmRpZmYgLS1naXQgYS9wYWNrYWdlL2ZsdXR0ZXItZW5naW5lL2ZsdXR0ZXItZW5naW5lLm1r
IGIvcGFja2FnZS9mbHV0dGVyLWVuZ2luZS9mbHV0dGVyLWVuZ2luZS5tawppbmRleCA1OGViZGE1
Y2E5Li5kMGNlNzkyYzQ0IDEwMDY0NAotLS0gYS9wYWNrYWdlL2ZsdXR0ZXItZW5naW5lL2ZsdXR0
ZXItZW5naW5lLm1rCisrKyBiL3BhY2thZ2UvZmx1dHRlci1lbmdpbmUvZmx1dHRlci1lbmdpbmUu
bWsKQEAgLTUyLDcgKzUyLDkgQEAgRkxVVFRFUl9FTkdJTkVfVEFSR0VUX0FSQ0ggPSB4NjQKIEZM
VVRURVJfRU5HSU5FX1RBUkdFVF9UUklQUExFID0geDg2XzY0LXVua25vd24tbGludXgtZ251CiBl
bmRpZgogCi1pZmVxICgkKEJSMl9FTkFCTEVfUlVOVElNRV9ERUJVRykseSkKK2lmZXEgKCQoRkxV
VFRFUl9FTkdJTkVfUlVOVElNRV9NT0RFX1BST0ZJTEUpLHkpCitGTFVUVEVSX0VOR0lORV9SVU5U
SU1FX01PREU9cHJvZmlsZQorZWxzZSBpZmVxICgkKEJSMl9FTkFCTEVfUlVOVElNRV9ERUJVRyks
eSkKIEZMVVRURVJfRU5HSU5FX1JVTlRJTUVfTU9ERT1kZWJ1ZwogZWxzZQogRkxVVFRFUl9FTkdJ
TkVfUlVOVElNRV9NT0RFPXJlbGVhc2UKLS0gCjIuNDIuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
