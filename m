Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7397CD5BC9
	for <buildroot@archiver.kernel.org>; Mon, 25 May 2026 16:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25ED160725;
	Mon, 25 May 2026 16:41:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lnCjRdaNPgFY; Mon, 25 May 2026 16:41:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAC906071A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779727263;
	bh=xuva4CvgeTZDwmC0+pdu9plbTzjES7bicq0AUx0ke58=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=I6iVxlzLIuOYDTzFrIDmT013hbJ6DbB/6aH+SCKhsxAWAXxCLGI8kOBzG5hEBRapu
	 xa7YV0Vb9AIL2f4NjTwtdjMuipLzTZQmu4jZTOfDuMLjC8BMWdkbKwpWE0Y7/lt2KH
	 PxjtMyGRgljALyE6scHYPGKkvGRNcbZGsxiCeFP4RrcZTXcbWSr34L4artCFzgYLhp
	 1xqlsgbwI8mFaK8qN8aMjZIRWPD0fTKrj7le7bFhKmxpc8CZkFOm49rKKdNydRKm2X
	 3VQeOX1Dbif2na3nbkIkMB0j5A8dorsklIhlydcqiBGW0ZvBxrIn9Bo4g88d6DWFtl
	 z23C5A8IpgDxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAC906071A;
	Mon, 25 May 2026 16:41:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2265A21F
 for <buildroot@buildroot.org>; Mon, 25 May 2026 16:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14388409B6
 for <buildroot@buildroot.org>; Mon, 25 May 2026 16:41:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s0iIxT_jcs8F for <buildroot@buildroot.org>;
 Mon, 25 May 2026 16:41:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=sairon@sairon.cz; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DF939409AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF939409AE
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DF939409AE
 for <buildroot@buildroot.org>; Mon, 25 May 2026 16:41:00 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4904c1ce4c1so31924915e9.3
 for <buildroot@buildroot.org>; Mon, 25 May 2026 09:41:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779727258; x=1780332058;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zDpgXcjXFX+i8AhoqeIfhgZfRiCClWjuMHYjsxG6vRU=;
 b=X8VsZPZ9t7IlnoMMStqxf8TmXnYeMVBeB16WaHL8JnyF7yvIRe740ESlQkfz1Ce/rc
 TYlMv9fCZsBjk7U6t4sGCsPrJKJg7RkJL1MTYlKC3JLJXLoppGDVFe+eR6mizdHzRD4T
 WW+SNkYglOVg8JPFL7nk1Bs3wIspPupnnUGefWLZXxSue3zYRMUyKLo7n/6VvoM3Xa1n
 945Tl9BhTIpmIQ79CpUykAG04zeb9F+NqRRawYvftBiBz6lIH/W6Oqk5HeZSOBqngKWC
 EG8eTRZtAgew0MT1vH7Fe3UmjzE0rE1MTHt1SWtHe836MRkRJzEmxocqlGROh98RItGH
 Shhg==
X-Gm-Message-State: AOJu0YygdDtwf7hGrqvXYrywirQTMv2mS53CTZmyX6hhTbqg8E75L8Gf
 ZuFNuWLnngiLvQ2QMK8voKMRWrY7t6z2snS8EZSssjifWfsK9ACTSfyXpJbnserQvQF+3LXPiSn
 ohvUXXRA=
X-Gm-Gg: Acq92OHIOQNm7z2linQxjb5Ftkv73Fy4wtRX37Zsjfp7zjwoteHzQ+9Rij3WQfM5vos
 EX6a2Fqxcd7ib1WbyikNrLWCBI7GDfxpf9mHvXR4SBE54IgPNqRkG7pdRC4hOwJxHFjovAvedE2
 wZ7tCwEIwXezqiWQz4YmoOiE8uPvEDNI3bds7iZ2gaOl3blqb9yzX+AAk7AiqGJG2DJ53yjt6qF
 31ySANrD85WXeAVUTIVPV3rpD8juUxXpkVn559lTZ/nk/IYhHlUPT6wSa+WPD14dcIn1jUOCoPn
 l7cj9Vy43z8ofaAvBh5feQT1yZb8KcVu+ivQgYwzMacQzhVFZU1e+/y1lxWiNDqfGiXCpwj7B5X
 rVjAerSeQF1mnOhnmRuOiecn9g8/4qo2UqaXhlGD4OTo8ZP9KDJl/qrG9yRpm6thttMZFmPzbrq
 llkekrVTD0UmYbW+8bBeSmTUyA3KKpp+pDr7hdQYXs3wJohDn9ued4IajovkrbRN0Od5yEw/xRb
 8tWikQxTPuY4pCcjLxgFPWoED5sgDzQGLHggE6Vsq/KnLdQPaY=
X-Received: by 2002:a05:600c:468a:b0:490:3d62:f5df with SMTP id
 5b1f17b1804b1-490428e5a6amr256192925e9.30.1779727258357; 
 Mon, 25 May 2026 09:40:58 -0700 (PDT)
Received: from krabice.lan (ip-89-103-66-201.bb.vodafone.cz. [89.103.66.201])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4904561a160sm300088965e9.9.2026.05.25.09.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2026 09:40:57 -0700 (PDT)
From: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
To: buildroot@buildroot.org
Date: Mon, 25 May 2026 18:40:42 +0200
Message-ID: <20260525164043.2992387-1-sairon@sairon.cz>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sairon.cz; s=google; t=1779727258; x=1780332058; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zDpgXcjXFX+i8AhoqeIfhgZfRiCClWjuMHYjsxG6vRU=;
 b=TP97m2Fn9lbYDS+s/qaSzlU/djHH7BhivRgIQZqr/RHbySh3JVAKYy92Ksrff/zHXU
 HwT8ce6SKoIkJzBDuXdPc3sp/MHfbotEgfkVMfx/08teanEZEzrKV8jEalBuQ6M5r6xV
 EeV9XaLSs8ZeUIfPqz+UbTSYmOLv8s67FD2yolau0c8pgv8GUa8wn7pMojjz2a357iNb
 Km0SJaZAPYRH5TIK9p78NaXey4oSyNYR0liRYEfHnmwstukl+uTaxSpBpBG2aI2BD7jn
 +utGyrr3to4CWuhFh3y+/5EDnC/PehMeWbGiZQtV3C0uE9s28vU77nVt0t3OVhYHirwI
 2Ffg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=sairon.cz
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sairon.cz header.i=@sairon.cz header.a=rsa-sha256
 header.s=google header.b=TP97m2Fn
Subject: [Buildroot] [PATCH] package/linux-firmware: add WiFi and BT
 firmware for MT7920
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
Cc: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>,
 Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIGZpcm13YXJlIGZvciB0aGUgTWVkaWFUZWsgTVQ3OTIwIGNoaXAsIHdoaWNoIGlzIGhhbmRs
ZWQgYnkgdGhlCm10NzkyMWUgZHJpdmVyLiBXaUZpIHN1cHBvcnQgd2FzIGFkZGVkIGluIExpbnV4
IDYuMTAgWzFdIGFuZCBCbHVldG9vdGgKc3VwcG9ydCBpbiBMaW51eCA2LjkgWzJdLiBUaGUgZmly
bXdhcmUgZmlsZXMgd2VyZSBhZGRlZCBpbiBbM10gKFdpRmkpCmFuZCBbNF0gKEJUKSwgaW5jbHVk
ZWQgaW4gbGludXgtZmlybXdhcmUgc2luY2UgdmVyc2lvbiAyMDI0MTAxNy4KClsxXSBodHRwczov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9zdGFibGUvbGludXguZ2l0
L2NvbW1pdC8/aWQ9NGE0MGZjYmZlM2FiNDg0NjY3MGI1OWI4MWM5MTRlZDdlN2RhYzJiMwpbMl0g
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xp
bnV4LmdpdC9jb21taXQvP2lkPTFjYjYzZDgwZmZmNmM0ZjUwMTQ2OWUyOGEwZWI2Mzc5NjM5ZTA3
MTEKWzNdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2Zp
cm13YXJlL2xpbnV4LWZpcm13YXJlLmdpdC9jb21taXQvP2lkPTNjZTg0YThkYmY0YTQxOGNjOTgy
NTAzNTk2ZTQ4MWExYmU4NGVhYjEKWzRdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L2Zpcm13YXJlL2xpbnV4LWZpcm13YXJlLmdpdC9jb21taXQvP2lkPTdm
OWMxZjFiMWMwZWRkMjM3YzJkMGI3MmZiYzE1ZTc0YmU2MjRiNzcKClNpZ25lZC1vZmYtYnk6IEph
biDEjGVybcOhayA8c2Fpcm9uQHNhaXJvbi5jej4KLS0tCiBwYWNrYWdlL2xpbnV4LWZpcm13YXJl
L0NvbmZpZy5pbiAgICAgICAgIHwgMTAgKysrKysrKysrKwogcGFja2FnZS9saW51eC1maXJtd2Fy
ZS9saW51eC1maXJtd2FyZS5tayB8IDEzICsrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwg
MjMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGludXgtZmlybXdhcmUvQ29u
ZmlnLmluIGIvcGFja2FnZS9saW51eC1maXJtd2FyZS9Db25maWcuaW4KaW5kZXggNThiYTYwZTlj
My4uZWMxMzkwMGRmYiAxMDA2NDQKLS0tIGEvcGFja2FnZS9saW51eC1maXJtd2FyZS9Db25maWcu
aW4KKysrIGIvcGFja2FnZS9saW51eC1maXJtd2FyZS9Db25maWcuaW4KQEAgLTk0LDYgKzk0LDEx
IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9MSU5VWF9GSVJNV0FSRV9NRURJQVRFS19NVDc2NTAKIAlo
ZWxwCiAJICBGaXJtd2FyZSBmaWxlcyBmb3IgTWVkaWFUZWsgTVQ3NjUwIGJsdWV0b290aCBzdXBw
b3J0CiAKK2NvbmZpZyBCUjJfUEFDS0FHRV9MSU5VWF9GSVJNV0FSRV9NRURJQVRFS19NVDc5MjBf
QlQKKwlib29sICJNZWRpYVRlayBNVDc5MjAiCisJaGVscAorCSAgRmlybXdhcmUgZmlsZXMgZm9y
IE1lZGlhVGVrIE1UNzkyMCBibHVldG9vdGggc3VwcG9ydAorCiBjb25maWcgQlIyX1BBQ0tBR0Vf
TElOVVhfRklSTVdBUkVfTUVESUFURUtfTVQ3OTIxX0JUCiAJYm9vbCAiTWVkaWFUZWsgTVQ3OTIx
IgogCWhlbHAKQEAgLTQ3Niw2ICs0ODEsMTEgQEAgY29uZmlnIEJSMl9QQUNLQUdFX0xJTlVYX0ZJ
Uk1XQVJFX01FRElBVEVLX01UNzZYMkUKIAloZWxwCiAJICBNZWRpYVRlayBNVDc2eDJlCiAKK2Nv
bmZpZyBCUjJfUEFDS0FHRV9MSU5VWF9GSVJNV0FSRV9NRURJQVRFS19NVDc5MjAKKwlib29sICJN
ZWRpYVRlayBNVDc5MjAiCisJaGVscAorCSAgTWVkaWFUZWsgTVQ3OTIwCisKIGNvbmZpZyBCUjJf
UEFDS0FHRV9MSU5VWF9GSVJNV0FSRV9NRURJQVRFS19NVDc5MjEKIAlib29sICJNZWRpYVRlayBN
VDc5MjEiCiAJaGVscApkaWZmIC0tZ2l0IGEvcGFja2FnZS9saW51eC1maXJtd2FyZS9saW51eC1m
aXJtd2FyZS5tayBiL3BhY2thZ2UvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmUubWsKaW5k
ZXggODE4N2QxZmVhZi4uNDA3ODcyZTBkNCAxMDA2NDQKLS0tIGEvcGFja2FnZS9saW51eC1maXJt
d2FyZS9saW51eC1maXJtd2FyZS5taworKysgYi9wYWNrYWdlL2xpbnV4LWZpcm13YXJlL2xpbnV4
LWZpcm13YXJlLm1rCkBAIC0zOTgsNiArMzk4LDE5IEBAIExJTlVYX0ZJUk1XQVJFX0ZJTEVTICs9
IG1lZGlhdGVrL210NzY2Mi5iaW4gbWVkaWF0ZWsvbXQ3NjYyX3JvbV9wYXRjaC5iaW4KIExJTlVY
X0ZJUk1XQVJFX0FMTF9MSUNFTlNFX0ZJTEVTICs9IExJQ0VOQ0UucmFsaW5rX2FfbWVkaWF0ZWtf
Y29tcGFueV9maXJtd2FyZQogZW5kaWYKIAorIyBNVDc5MjAKK2lmZXEgKCQoQlIyX1BBQ0tBR0Vf
TElOVVhfRklSTVdBUkVfTUVESUFURUtfTVQ3OTIwKSx5KQorTElOVVhfRklSTVdBUkVfRklMRVMg
Kz0gbWVkaWF0ZWsvV0lGSV9NVDc5NjFfcGF0Y2hfbWN1XzFhXzJfaGRyLmJpbiBcCisJCQltZWRp
YXRlay9XSUZJX1JBTV9DT0RFX01UNzk2MV8xYS5iaW4KK0xJTlVYX0ZJUk1XQVJFX0FMTF9MSUNF
TlNFX0ZJTEVTICs9IExJQ0VOQ0UubWVkaWF0ZWsKK2VuZGlmCisKKyMgTWVkaWF0ZWsgTVQ3OTIw
IEJsdWV0b290aAoraWZlcSAoJChCUjJfUEFDS0FHRV9MSU5VWF9GSVJNV0FSRV9NRURJQVRFS19N
VDc5MjBfQlQpLHkpCitMSU5VWF9GSVJNV0FSRV9GSUxFUyArPSBtZWRpYXRlay9CVF9SQU1fQ09E
RV9NVDc5NjFfMWFfMl9oZHIuYmluCitMSU5VWF9GSVJNV0FSRV9BTExfTElDRU5TRV9GSUxFUyAr
PSBMSUNFTkNFLm1lZGlhdGVrCitlbmRpZgorCiAjIE1UNzkyMQogaWZlcSAoJChCUjJfUEFDS0FH
RV9MSU5VWF9GSVJNV0FSRV9NRURJQVRFS19NVDc5MjEpLHkpCiBMSU5VWF9GSVJNV0FSRV9GSUxF
UyArPSBtZWRpYXRlay9XSUZJX01UNzk2MV9wYXRjaF9tY3VfMV8yX2hkci5iaW4gXApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
