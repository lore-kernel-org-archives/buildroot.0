Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86102CD4F24
	for <buildroot@archiver.kernel.org>; Wed, 13 May 2026 11:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB41D4105D;
	Wed, 13 May 2026 11:49:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6WDX_qzhzDKB; Wed, 13 May 2026 11:49:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8B864103F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778672973;
	bh=U2d+3MCqirCPVAAiO2CgmmUuRqg3bwjzTqlcmAL+m8Y=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=pJj/d0aGxwUaytAJrua7Y+RJl1VXHRmPDmO4q+SIZpX6MZgDEY1QqUPAEs4GsW7ug
	 8teTqZYDjYEm2gbr1BiuZWAfQBCGNCV/xeZ2nVt5AVIbSU/Fpi/n/cwv1PGs+nyKQr
	 dnAJDGvy/ABHDGlO+o03EcHUwM8amtGzPXxpMH7p5U61vl0Ck/L7+JJx/Ud8HUpIWG
	 eQCRLQJqyMRTVe1HhOnF0bM99WzjqGLIXtOCQ41aNc+pZqBHqWlUUHvAaFEA6n6ZNY
	 nsxHjn6arzTZVAQ6/uNNpIz0qlfh0N3maLcS0b/JLtFBKzp9EEU+zWDPGQVqXH+9si
	 Jwe2bCd/V67Xg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8B864103F;
	Wed, 13 May 2026 11:49:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 54FC6270
 for <buildroot@buildroot.org>; Wed, 13 May 2026 11:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 469E36115D
 for <buildroot@buildroot.org>; Wed, 13 May 2026 11:49:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TD2Gxem4YqiO for <buildroot@buildroot.org>;
 Wed, 13 May 2026 11:49:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=lazzer@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5C24661152
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C24661152
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5C24661152
 for <buildroot@buildroot.org>; Wed, 13 May 2026 11:49:31 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5a40cfab24dso7237130e87.2
 for <buildroot@buildroot.org>; Wed, 13 May 2026 04:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778672968; x=1779277768;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=n2vB/Zlu5E1JM5YWV0gxcPxpGhMPoPwXEuZVKtidw8I=;
 b=Ls4qfuSzBoo6cOOSySQLz6G8GECEJSRw3eC8JoZ/4o52naradr/36EJZ/pwEg+BTVW
 oIuiIOllrpJg2otVZYKaucsZXnT6IasvHJQsTJ4HN4gLqeGFklwzPkMgZxbHg4u/2v6N
 Y0O1W7Dw6Y4iMciuZrdLNr0KusC5q5gE+Rf+Xlr4ebx2Tp+HpVjP28MP81MrMnw/W1gB
 Y8bTVw5LHk1Kf/jhVJ4eYMCodbqM8jpJMbQisG9CpbktwDS1GIkS1VI3e5ORFcKGqwoN
 IHCZW3imJ4WqlhCYQ3WUtV2DVuwd4o1ydpLgFt6gxG0nf+4a3riVy8hDLETD2MuNbwnr
 wlBQ==
X-Gm-Message-State: AOJu0YwlKhamtmcxIK3dYZdx1j3LWZLEXJHLv5QzIF01pCreXrwD2NlE
 YinQpH1jpbXjDzprqWxS3PDF8PbwJUGsF4ElBH+rpqH7/dsluQVb1JGC7BX4zYJ1
X-Gm-Gg: Acq92OHiu0/NjDP0qSVpzpc+Y76RiJklP5BdO2TKx8avx82YsBhrQApdiIormr3LcxB
 3fFdtcoaJIJwIxRLbXbEyZo1a14IN7/+kSyoP2Iw5kFRUDTmarOywFD6gyOZvzrSKKQJ+Uq7bUM
 +YOlJLimtVqYigbtxrOy+xuCeUpNemPRTlIcYrFgOt3iqVCPeuSFaAHFVEW6cBD91HSqn2PQp4M
 OfavUqfGUeS7y5IBF+QggOY/j6cxr4a1vjJLs0Qjh9vdnP4c+MBvjjJ7qGuavofc/32pRF8s3mY
 4tzlzytHvkjYnKbA24jbRDp0InbHF5QnBa+Dmr7T8FTSQP805J9WUjOgqGS4/HNfGGR8J2mhnMd
 5YjOXXRqOkpSMMj2VrfrpQmW599EK8hadkj+rmfPKIzwG3W0NuCQG5QUzd/vGS1jxKKVqqOIrqx
 uG++LkHeW9Alc3TtgO7tSqi4jaYzqPTR9Vtut2eHyYnuKOXwHexX3Fu9OUOAM=
X-Received: by 2002:a05:6512:2310:b0:5a8:7317:5417 with SMTP id
 2adb3069b0e04-5a8ef96d405mr973472e87.9.1778672968317; 
 Wed, 13 May 2026 04:49:28 -0700 (PDT)
Received: from tollan.addiva.ad (h-79-136-22-50.NA.cust.bahnhof.se.
 [79.136.22.50]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a8a956b3d0sm3937264e87.80.2026.05.13.04.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2026 04:49:27 -0700 (PDT)
From: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 13 May 2026 13:49:18 +0200
Message-ID: <20260513114918.3927249-1-lazzer@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778672968; x=1779277768; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=n2vB/Zlu5E1JM5YWV0gxcPxpGhMPoPwXEuZVKtidw8I=;
 b=kg2Ax7fJF4tksJV9b44UuJ3RHwQ+AECoqrXKkfkW1WodA3qHA+c93zijFiVfsGbU6w
 ds3LJPnUEt9Br37xa/nds1GRjDjaSIOtsFE5eJrfk6U8/rW3uyyEjjVdqfjAQGojwqPp
 EqshbHljGMPlNQnzp5o1SoXCt4b7N/VG3jW16Paoy5qOHEqdX7JUpSBjTdgLLSFNYvFr
 O5eObYzwDjv3YPbWq5YggJUOJazfvTd9GT1ny9dTbXtNw2YViufcFWNDIoakPd1kAzo8
 JNrq2L/i6OGZSZb3SawIldXYmQKEYaB0Wy3KdLEpwTTMHqi2G/a8RJWAlyJtWz2ZIbXY
 OuFw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=kg2Ax7fJ
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: Add MediaTek MT7916
 WiFi 6E firmware files
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogTWF0dGlhcyBXYWxzdHLDtm0gPGxhenplckBnbWFpbC5jb20+Ci0tLQog
cGFja2FnZS9saW51eC1maXJtd2FyZS9Db25maWcuaW4gICAgICAgICB8IDUgKysrKysKIHBhY2th
Z2UvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmUubWsgfCA5ICsrKysrKysrKwogMiBmaWxl
cyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saW51eC1m
aXJtd2FyZS9Db25maWcuaW4gYi9wYWNrYWdlL2xpbnV4LWZpcm13YXJlL0NvbmZpZy5pbgppbmRl
eCA1OGJhNjBlOWMzLi5kOTFkOTBlNTYyIDEwMDY0NAotLS0gYS9wYWNrYWdlL2xpbnV4LWZpcm13
YXJlL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL2xpbnV4LWZpcm13YXJlL0NvbmZpZy5pbgpAQCAt
NDc2LDYgKzQ3NiwxMSBAQCBjb25maWcgQlIyX1BBQ0tBR0VfTElOVVhfRklSTVdBUkVfTUVESUFU
RUtfTVQ3NlgyRQogCWhlbHAKIAkgIE1lZGlhVGVrIE1UNzZ4MmUKIAorY29uZmlnIEJSMl9QQUNL
QUdFX0xJTlVYX0ZJUk1XQVJFX01FRElBVEVLX01UNzkxNgorCWJvb2wgIk1lZGlhVGVrIE1UNzkx
NiIKKwloZWxwCisJICBNZWRpYVRlayBNVDc5MTYKKwogY29uZmlnIEJSMl9QQUNLQUdFX0xJTlVY
X0ZJUk1XQVJFX01FRElBVEVLX01UNzkyMQogCWJvb2wgIk1lZGlhVGVrIE1UNzkyMSIKIAloZWxw
CmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlLm1rIGIv
cGFja2FnZS9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZS5tawppbmRleCA4MTg3ZDFmZWFm
Li4wZWQ5NDI2MGZmIDEwMDY0NAotLS0gYS9wYWNrYWdlL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZp
cm13YXJlLm1rCisrKyBiL3BhY2thZ2UvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmUubWsK
QEAgLTM5OCw2ICszOTgsMTUgQEAgTElOVVhfRklSTVdBUkVfRklMRVMgKz0gbWVkaWF0ZWsvbXQ3
NjYyLmJpbiBtZWRpYXRlay9tdDc2NjJfcm9tX3BhdGNoLmJpbgogTElOVVhfRklSTVdBUkVfQUxM
X0xJQ0VOU0VfRklMRVMgKz0gTElDRU5DRS5yYWxpbmtfYV9tZWRpYXRla19jb21wYW55X2Zpcm13
YXJlCiBlbmRpZgogCisjIE1UNzkxNgoraWZlcSAoJChCUjJfUEFDS0FHRV9MSU5VWF9GSVJNV0FS
RV9NRURJQVRFS19NVDc5MTYpLHkpCitMSU5VWF9GSVJNV0FSRV9GSUxFUyArPSBtZWRpYXRlay9t
dDc5MTZfZWVwcm9tLmJpbiBcCisJCQltZWRpYXRlay9tdDc5MTZfcm9tX3BhdGNoLmJpbiBcCisJ
CQltZWRpYXRlay9tdDc5MTZfd2EuYmluIFwKKwkJCW1lZGlhdGVrL210NzkxNl93bS5iaW4KK0xJ
TlVYX0ZJUk1XQVJFX0FMTF9MSUNFTlNFX0ZJTEVTICs9IExJQ0VOQ0UucmFsaW5rX2FfbWVkaWF0
ZWtfY29tcGFueV9maXJtd2FyZQorZW5kaWYKKwogIyBNVDc5MjEKIGlmZXEgKCQoQlIyX1BBQ0tB
R0VfTElOVVhfRklSTVdBUkVfTUVESUFURUtfTVQ3OTIxKSx5KQogTElOVVhfRklSTVdBUkVfRklM
RVMgKz0gbWVkaWF0ZWsvV0lGSV9NVDc5NjFfcGF0Y2hfbWN1XzFfMl9oZHIuYmluIFwKLS0gCjIu
NDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
