Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C553C83F20
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 16:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F337F4112E;
	Fri, 11 Jul 2025 16:44:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sx5PqYaBG_O0; Fri, 11 Jul 2025 16:44:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 324BE4111F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 324BE4111F;
	Fri, 11 Jul 2025 16:44:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 402F8114
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 16:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3258260BA9
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 16:44:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5thf_tJmPIWQ for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 16:44:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8A3CE60898
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A3CE60898
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A3CE60898
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 16:44:17 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a6d77b43c9so2211025f8f.3
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 09:44:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752252255; x=1752857055;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xv1OEMRxtxpfM7DlLdM2o+DspbbidhbA3U259WOZxKg=;
 b=hX5R5Zh82VNPu76mvcGkF/vQslO48Jg9wA7HS7uGzjfkZV3YrYoOflZ74KtYOq6Bf4
 i5KVbm/VkbXoqEYqxk+2qqjz8iJf+muVft71jrhfkWwd136Blyf/CJeIa2tM6HwKWzj/
 3gvVVeHqKappWyhBtnZaA54a1LvfhfNuHPY2Y5INkX3CK1g9wFuzQGFdrMjtwLcZmxdF
 4Ozn9geUIuECmfCnaCJ8WP0encVBvrIxC4p9jiVqPTi7sC8ziG852f07uZIbQ2w4fRJA
 kSmppUIUoHM3Fl5wR/JqKoxtf1pNruFPv5Fi9IG9MA/o1VgyzxYxh1yZc1AGt+KDHQwt
 bacA==
X-Gm-Message-State: AOJu0Yx8F0WoX6x3ZOSkKNdLfMfSda2yTxx4AnQy18bczbvxJ5KizK+Q
 jcnCfkBxffD2cxO5LCpx2VOq62dpfa7oIh8vt6mJqrtLxj1W7TWU8kOCS3UWkn6o6Hw/Fd/S0Ag
 8EUxd8zo=
X-Gm-Gg: ASbGncvjBFxOI4iOMZ2auq1QIvRX+3LgaisYjdJlUSvOXKkyXiHQsrhlWLRq0YgrvF3
 yS0VTg0T7nHyvk1bimHOyXVMkQoNF5JRzXaXd6O0Aekn6EleFOwyljOxnW+gdQEzP6VEkG91ITQ
 IVo5epzjO4Qdd4sDDs6OXdMwEz77gT0XQvyEDOezqY5Kb1DfROlyFAFk/Kx/0uZpQ56IyURoZ/P
 CAzStumB1JGIGz1OxTuLl6dtWJ6ybMN+p/i2tbA5GkXNWiV0qudxqIwget5MUNUV+gnV14bfE9+
 UCdMZ4HyCG1BSL8p4EZHrqrTSosyHJiCdkK0jVU7sWwQSmjhNHwBG6LykEyjiyatn8btobeTloZ
 /NR8A0x7dxFkilpaTCrKjf3A=
X-Google-Smtp-Source: AGHT+IGlPO3JmpG5Ee7ZEyeCwVQDK+IlNCDEYXEY64NhygfmCGNP8ymqU/hVrGA8iKTqf3H2RDvYJw==
X-Received: by 2002:a05:6000:2310:b0:3a4:cf40:ff37 with SMTP id
 ffacd0b85a97d-3b5f187d0d8mr3539390f8f.6.1752252254899; 
 Fri, 11 Jul 2025 09:44:14 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45507207df5sm24423945e9.31.2025.07.11.09.44.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 09:44:13 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id DB01A5F8CC;
 Fri, 11 Jul 2025 17:44:08 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Fri, 11 Jul 2025 17:44:04 +0100
Message-ID: <20250711164407.799041-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250711164407.799041-1-alex.bennee@linaro.org>
References: <20250711164407.799041-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752252255; x=1752857055; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xv1OEMRxtxpfM7DlLdM2o+DspbbidhbA3U259WOZxKg=;
 b=tJroigcPnSor3J6dm5ToGtkOWVIwNnOXPRinjnXnBiCOb2GvCuJVHOQH3ye/nrccBs
 D5osL7UjMlGqv+ZXETEloopyYlM1MGlubL16ubZ4YJiu5WcpiHnAITpWlb488pRRoEmR
 ZQYY9cMxgculeNaFJKgslAdZgT5vuYzgnx4JKzLH/0NMrHR2h3T6epqPOMJlenCbM/Q3
 st2eSCNt+Qsbt6/GPlidIBoQfIhZM2IML45yMe/9b6Y1Z43rMeKAd6fAZnCSUEHlociU
 ojXrQ3gFpFcFz0oUkJkZ7lP3je0i2zOcZcbx6YhoOzcRvUBKcfl4YwdDayyZHYPJV9J9
 P1BA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=tJroigcP
Subject: [Buildroot] [RFC PATCH v2 6/7] package/kvm-unit-tests: honour
 BR2_ARM64_PAGE_SIZE
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
Cc: Thomas Huth <huth@tuxfamily.org>, Cyril Bur <cyrilbur@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGxhdGVzdCBrdm0tdW5pdC10ZXN0cyBkZWZhdWx0cyB0byA0ayBidXQgdGhlcmUgaXMgbm8g
cmVhc29uIHdoeSB3ZQpzaG91bGRuJ3QgaG9ub3VyIHRoZSBzeXN0ZW0gcGFnZSBzaXplIGlmIGl0
IGlzIHNldC4KClNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJv
Lm9yZz4KLS0tCiBwYWNrYWdlL2t2bS11bml0LXRlc3RzL2t2bS11bml0LXRlc3RzLm1rIHwgOCAr
KysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Bh
Y2thZ2Uva3ZtLXVuaXQtdGVzdHMva3ZtLXVuaXQtdGVzdHMubWsgYi9wYWNrYWdlL2t2bS11bml0
LXRlc3RzL2t2bS11bml0LXRlc3RzLm1rCmluZGV4IDgwOGVhMGQ0MGIuLmFmMmM4Y2EyYjIgMTAw
NjQ0Ci0tLSBhL3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMva3ZtLXVuaXQtdGVzdHMubWsKKysrIGIv
cGFja2FnZS9rdm0tdW5pdC10ZXN0cy9rdm0tdW5pdC10ZXN0cy5tawpAQCAtMzYsNiArMzYsMTQg
QEAgS1ZNX1VOSVRfVEVTVFNfQ09ORl9PUFRTID1cCiAJLS1wcm9jZXNzb3I9IiQoR0NDX1RBUkdF
VF9DUFUpIiBcCiAJLS1lbmRpYW49IiQoS1ZNX1VOSVRfVEVTVFNfRU5ESUFOKSIKIAoraWZlcSAo
JChCUjJfQVJNNjRfUEFHRV9TSVpFXzRLKSx5KQorS1ZNX1VOSVRfVEVTVFNfQ09ORl9PUFRTICs9
IC0tcGFnZS1zaXplPTRrCitlbHNlIGlmZXEgKCQoQlIyX0FSTTY0X1BBR0VfU0laRV8xNkspLHkp
CitLVk1fVU5JVF9URVNUU19DT05GX09QVFMgKz0gLS1wYWdlLXNpemU9MTZrCitlbHNlIGlmZXEg
KCQoQlIyX0FSTTY0X1BBR0VfU0laRV82NEspLHkpCitLVk1fVU5JVF9URVNUU19DT05GX09QVFMg
Kz0gLS1wYWdlLXNpemU9NjRrCitlbmRpZgorCiAjIEZvciBhbGwgYXJjaGl0ZWN0dXJlcyBidXQg
eDg2LTY0LCB3ZSB1c2UgdGhlIHRhcmdldAogIyBjb21waWxlci4gSG93ZXZlciwgZm9yIHg4Ni02
NCwgd2UgdXNlIHRoZSBob3N0IGNvbXBpbGVyLCBhcwogIyBrdm0tdW5pdC10ZXN0cyBidWlsZHMg
MzIgYml0IGNvZGUsIHdoaWNoIEJ1aWxkcm9vdCB0b29sY2hhaW5zIGZvcgotLSAKMi40Ny4yCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
