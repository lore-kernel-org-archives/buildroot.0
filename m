Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4DF9C47074
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 14:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26E03408EA;
	Tue,  2 Jan 2024 14:52:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26E03408EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NOdFubPl-BGS; Tue,  2 Jan 2024 14:52:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 518254091F;
	Tue,  2 Jan 2024 14:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 518254091F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E47171BF38E
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 14:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD7B04093A
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 14:52:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD7B04093A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yy50OQ1CD3Mt for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 14:52:15 +0000 (UTC)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5795340936
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 14:52:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5795340936
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-556aac11e01so316961a12.2
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 06:52:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704207133; x=1704811933;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=taupWv/23vrDEp1QEt3KS4jS0/NHfcNPPOSK0kvHP9w=;
 b=QghKWnF6To5D+4ndr4TGxM0Hde4QL3QTrKcE42nXrTLBICtaR89MsaEIe8iQUstoKW
 i+IOfeq1wvLSFl7VQQVm5nyqMC5SZyYXoVCBSD5RpQ4qp385gA6B64Xwxj1jYhKYBtcz
 lV9KPUxK5u/uT78WAp9B+iCHYj9KVYPIY5R+/1D6zbg24TE9ys/OFQ/gGyK4l6zRZ39E
 Q45nnxiQX4yP68oLxEcyC9pi8MEgPzMt4fhEl6DI+UPOrpjpuD/uDS0mfcjnIFZ7SVb/
 MvX0wBm0rNUnBxQcHdRD6rlaDS65jEHQSlqCUiPrwq3e8UGYqxKqHQ43M4Y2gdICS8rI
 o5LA==
X-Gm-Message-State: AOJu0Yy+bm81BcSNpbyKJXsCP589w8UDomwKI5nEDHuww9DY/af/nKdf
 ORZe4jeKcLmoOBS6y7bkBZnaqOmjTTCls/WxeQB+bl2hwMV55A==
X-Google-Smtp-Source: AGHT+IGLHlsUc9HlfuwZrwDKzyfgqALpdoxGzcGllnySRY2hR3NJHqBLp55yRupmC/YDR5U0/5l2wQ==
X-Received: by 2002:a17:906:3885:b0:a23:58b1:11b8 with SMTP id
 q5-20020a170906388500b00a2358b111b8mr5287798ejd.185.1704207133588; 
 Tue, 02 Jan 2024 06:52:13 -0800 (PST)
Received: from krabice.lan (ip-89-103-66-201.bb.vodafone.cz. [89.103.66.201])
 by smtp.gmail.com with ESMTPSA id
 fp21-20020a1709069e1500b00a26ade46619sm11048676ejc.121.2024.01.02.06.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 06:52:13 -0800 (PST)
From: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 15:50:28 +0100
Message-Id: <20240102145029.242682-2-sairon@sairon.cz>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240102145029.242682-1-sairon@sairon.cz>
References: <20240102145029.242682-1-sairon@sairon.cz>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sairon.cz; s=google; t=1704207133; x=1704811933; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=taupWv/23vrDEp1QEt3KS4jS0/NHfcNPPOSK0kvHP9w=;
 b=f/IHHjMWR1ewEBg2vM5piHp3dMFuhljkZKZyUyhXz++iaH0ubdRekzpjKuupt9SOel
 QIRCN5sflAPZwugof2KV0529b6DHF0XhRPu8dA5nrxdVYz16wh60cZBY9nXE5AO7PIZv
 6OHJEDd3ItGERfcgfdffFZtL89NEVA1KumOIhs6xDsQHzdBTd2H/tSGeM4tvz6rWxDvA
 ms7CcRLWs89nlczrozPPZZsycWBBx55xfrSj+qSdZz048kvUd9yXmb+VrsuAOPJbdL3j
 dk0y5jYuDt/lemDS2dZ1hN0FI8RshlQCOvxG5R7tZII3JDaATZY5ky+hddPwYfCSLOth
 GYiQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=sairon.cz header.i=@sairon.cz
 header.a=rsa-sha256 header.s=google header.b=f/IHHjMW
Subject: [Buildroot] [PATCH 2/2] package/linux-firmware: add WiFi and BT
 firmware for MT7921 and MT7922
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
Cc: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>,
 Bernd Kuhls <bernd@kuhls.net>, "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWx0aG91Z2ggc2ltaWxhciBpbiBuYW1lLCB0aGV5IHVzZSBkaWZmZXJlbnQga2VybmVsIGRyaXZl
ciAod2l0aCB0aGUKZXhjZXB0aW9uIG9mIGNvbW1vbiBCbHVldG9vdGggZHJpdmVyLCBidXQgdGhl
IGZpcm13YXJlIGZpbGUgaXMgcXVpdGUKbGFyZ2UgYW55d2F5LCBzbyBpdCdzIHdvcnRoIGhhdmlu
ZyB0aGUgcG9zc2liaWxpdHkgdG8gYmUgc3BlY2lmaWMpLgoKU2lnbmVkLW9mZi1ieTogSmFuIMSM
ZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6PgotLS0KIHBhY2thZ2UvbGludXgtZmlybXdhcmUvQ29u
ZmlnLmluICAgICAgICAgfCAyMCArKysrKysrKysrKysrKysrKysKIHBhY2thZ2UvbGludXgtZmly
bXdhcmUvbGludXgtZmlybXdhcmUubWsgfCAyNiArKysrKysrKysrKysrKysrKysrKysrKysKIDIg
ZmlsZXMgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlu
dXgtZmlybXdhcmUvQ29uZmlnLmluIGIvcGFja2FnZS9saW51eC1maXJtd2FyZS9Db25maWcuaW4K
aW5kZXggMTIyMWE4MDk4NC4uODEwN2YwN2I4OSAxMDA2NDQKLS0tIGEvcGFja2FnZS9saW51eC1m
aXJtd2FyZS9Db25maWcuaW4KKysrIGIvcGFja2FnZS9saW51eC1maXJtd2FyZS9Db25maWcuaW4K
QEAgLTU5LDYgKzU5LDE2IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9MSU5VWF9GSVJNV0FSRV9JQlQK
IAkgIEZpcm13YXJlIGZpbGVzIGZvciBJbnRlbCAzMTYwLzcyNjAvNzI2NS84MjYwLzgyNjUgV2ly
ZWxlc3MKIAkgIGJsdWV0b290aCBzdXBwb3J0LgogCitjb25maWcgQlIyX1BBQ0tBR0VfTElOVVhf
RklSTVdBUkVfTVQ3OTIxX0JUCisJYm9vbCAiTWVkaWFUZWsgTVQ3OTIxIgorCWhlbHAKKwkgIEZp
cm13YXJlIGZpbGVzIGZvciBNZWRpYVRlayBNVDc5MjEgYmx1ZXRvb3RoIHN1cHBvcnQKKworY29u
ZmlnIEJSMl9QQUNLQUdFX0xJTlVYX0ZJUk1XQVJFX01UNzkyMl9CVAorCWJvb2wgIk1lZGlhVGVr
IE1UNzkyMiIKKwloZWxwCisJICBGaXJtd2FyZSBmaWxlcyBmb3IgTWVkaWFUZWsgTVQ3OTIyIGJs
dWV0b290aCBzdXBwb3J0CisKIGNvbmZpZyBCUjJfUEFDS0FHRV9MSU5VWF9GSVJNV0FSRV9NRURJ
QVRFS19NVDc2NTAKIAlib29sICJNZWRpYVRlayBNVDc2NTAiCiAJaGVscApAQCAtMzgzLDYgKzM5
MywxNiBAQCBjb25maWcgQlIyX1BBQ0tBR0VfTElOVVhfRklSTVdBUkVfTUVESUFURUtfTVQ3Nlgy
RQogCWhlbHAKIAkgIE1lZGlhVGVrIE1UNzZ4MmUKIAorY29uZmlnIEJSMl9QQUNLQUdFX0xJTlVY
X0ZJUk1XQVJFX01FRElBVEVLX01UNzkyMQorCWJvb2wgIk1lZGlhVGVrIE1UNzkyMSIKKwloZWxw
CisJICBNZWRpYVRlayBNVDc5MjEKKworY29uZmlnIEJSMl9QQUNLQUdFX0xJTlVYX0ZJUk1XQVJF
X01FRElBVEVLX01UNzkyMgorCWJvb2wgIk1lZGlhVGVrIE1UNzkyMiIKKwloZWxwCisJICBNZWRp
YVRlayBNVDc5MjIKKwogY29uZmlnIEJSMl9QQUNLQUdFX0xJTlVYX0ZJUk1XQVJFX1FVQUxDT01N
XzYxNzQKIAlib29sICJRdWFsY29tbSBBdGhlcm9zIDYxNzQiCiAJaGVscApkaWZmIC0tZ2l0IGEv
cGFja2FnZS9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZS5tayBiL3BhY2thZ2UvbGludXgt
ZmlybXdhcmUvbGludXgtZmlybXdhcmUubWsKaW5kZXggZDA2MWM5ZjQwMi4uYTZhMTM4YjNhMyAx
MDA2NDQKLS0tIGEvcGFja2FnZS9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZS5taworKysg
Yi9wYWNrYWdlL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlLm1rCkBAIC01OSw2ICs1OSwx
OCBAQCBMSU5VWF9GSVJNV0FSRV9GSUxFUyArPSBpbnRlbC9pYnQtKgogTElOVVhfRklSTVdBUkVf
QUxMX0xJQ0VOU0VfRklMRVMgKz0gTElDRU5DRS5pYnRfZmlybXdhcmUKIGVuZGlmCiAKKyMgTWVk
aWF0ZWsgTVQ3OTIxIEJsdWV0b290aAoraWZlcSAoJChCUjJfUEFDS0FHRV9MSU5VWF9GSVJNV0FS
RV9NVDc5MjFfQlQpLHkpCitMSU5VWF9GSVJNV0FSRV9GSUxFUyArPSBtZWRpYXRlay9CVF9SQU1f
Q09ERV9NVDc5NjFfMV8yX2hkci5iaW4KK0xJTlVYX0ZJUk1XQVJFX0FMTF9MSUNFTlNFX0ZJTEVT
ICs9IExJQ0VOQ0UubWVkaWF0ZWsKK2VuZGlmCisKKyMgTWVkaWF0ZWsgTVQ3OTIyIEJsdWV0b290
aAoraWZlcSAoJChCUjJfUEFDS0FHRV9MSU5VWF9GSVJNV0FSRV9NVDc5MjJfQlQpLHkpCitMSU5V
WF9GSVJNV0FSRV9GSUxFUyArPSBtZWRpYXRlay9CVF9SQU1fQ09ERV9NVDc5MjJfMV8xX2hkci5i
aW4KK0xJTlVYX0ZJUk1XQVJFX0FMTF9MSUNFTlNFX0ZJTEVTICs9IExJQ0VOQ0UubWVkaWF0ZWsK
K2VuZGlmCisKICMgUXVhbGNvbW0gQXRoZXJvcyBSb21lIDYxNzRBIEJsdWV0b290aAogaWZlcSAo
JChCUjJfUEFDS0FHRV9MSU5VWF9GSVJNV0FSRV9RVUFMQ09NTV82MTc0QV9CVCkseSkKIExJTlVY
X0ZJUk1XQVJFX0ZJTEVTICs9IHFjYS9yYW1wYXRjaF91c2JfMDAwMDAzMDIuYmluIHFjYS9udm1f
dXNiXzAwMDAwMzAyLmJpbgpAQCAtMzgyLDYgKzM5NCwyMCBAQCBMSU5VWF9GSVJNV0FSRV9GSUxF
UyArPSBtZWRpYXRlay9tdDc2NjIuYmluIG1lZGlhdGVrL210NzY2Ml9yb21fcGF0Y2guYmluCiBM
SU5VWF9GSVJNV0FSRV9BTExfTElDRU5TRV9GSUxFUyArPSBMSUNFTkNFLnJhbGlua19hX21lZGlh
dGVrX2NvbXBhbnlfZmlybXdhcmUKIGVuZGlmCiAKKyMgTVQ3OTIxCitpZmVxICgkKEJSMl9QQUNL
QUdFX0xJTlVYX0ZJUk1XQVJFX01FRElBVEVLX01UNzkyMSkseSkKK0xJTlVYX0ZJUk1XQVJFX0ZJ
TEVTICs9IG1lZGlhdGVrL1dJRklfTVQ3OTYxX3BhdGNoX21jdV8xXzJfaGRyLmJpbiBcCisJCQlt
ZWRpYXRlay9XSUZJX1JBTV9DT0RFX01UNzk2MV8xLmJpbgorTElOVVhfRklSTVdBUkVfQUxMX0xJ
Q0VOU0VfRklMRVMgKz0gTElDRU5DRS5tZWRpYXRlaworZW5kaWYKKworIyBNVDc5MjIKK2lmZXEg
KCQoQlIyX1BBQ0tBR0VfTElOVVhfRklSTVdBUkVfTUVESUFURUtfTVQ3OTIyKSx5KQorTElOVVhf
RklSTVdBUkVfRklMRVMgKz0gbWVkaWF0ZWsvV0lGSV9NVDc5MjJfcGF0Y2hfbWN1XzFfMV9oZHIu
YmluIFwKKwkJCW1lZGlhdGVrL1dJRklfUkFNX0NPREVfTVQ3OTIyXzEuYmluCitMSU5VWF9GSVJN
V0FSRV9BTExfTElDRU5TRV9GSUxFUyArPSBMSUNFTkNFLm1lZGlhdGVrCitlbmRpZgorCiAjIHFj
YTYxNzQKIGlmZXEgKCQoQlIyX1BBQ0tBR0VfTElOVVhfRklSTVdBUkVfUVVBTENPTU1fNjE3NCks
eSkKIExJTlVYX0ZJUk1XQVJFX0ZJTEVTICs9IGF0aDEway9RQ0E2MTc0Ci0tIAoyLjM0LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
