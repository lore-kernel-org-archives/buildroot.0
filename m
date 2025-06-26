Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D0BC7EE30
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 11:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9E0841837;
	Thu, 26 Jun 2025 11:16:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lscSZFZQp8xa; Thu, 26 Jun 2025 11:16:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 149D5417E0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 149D5417E0;
	Thu, 26 Jun 2025 11:16:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D1E7C10A
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 11:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3D7B611CF
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 11:16:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H2zu0Imdtxpz for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 11:16:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1773A611CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1773A611CD
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1773A611CD
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 11:16:49 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-450cfb790f7so6810625e9.0
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 04:16:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750936607; x=1751541407;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7IJCN6JpRGzW3A862znAuIakII56oSy83fvEt5ByL1E=;
 b=UVvdP22DeX/ltBN7uJ/GxrZEOr8Tr+NxC8aPsEaNMSei4F5cP/8v3t+T3OSKo0kKAS
 CAwwSbxsfcK7/qjtZlJtgLPcQ+xTOC7bilehvBLIoGhI2SaEYfUloQ/VCTvg6ES7/OJu
 GM6qrimgBjdDSQbf9HO1Zk/lpzmPg9xRuTandQIMHVBBBFaBr4R8y2rzRozlZBUcVXrM
 KfpjKlVe03npFij4T5jM/zhqpyQEK61JiAnLSDbjG0EG3rcOiPnMOQPG5ftrZ4RVLyns
 bdmSblC6b9F3OCzi6rPOBzJ8dCUvNQ4lc88EcylmWr0Zs3gP8+2fle2Zs1glyuxbasz8
 /K9A==
X-Gm-Message-State: AOJu0Yx+3wx5vUsv67B90KwyDf0VUOEMyWm6j2CtTau3qtcgpjs3+fi8
 ASTZb4j/m0FLiC83INARBA0fZGWzu3Em4BJ34jFwPyB3sDcnnllEfEBMZ/VdoKSVumY3SCuOMiQ
 oLdcW/gs=
X-Gm-Gg: ASbGncsTLhaiF8Z2OwFWhHT3PL82pAGha1kroshsM07d7b5RuX73t/0ntrEeQAAuBD/
 gQUPVb4dsz84erq7lg/hv32Q/xp5MR8lYEkHJ8SvZyaPaVktL7sGahZjSqosAS4xXR5r7hPoB0w
 SjO1b9wSgxMWvmY1SotEaoxwOmLk4Q8QLxNPlVa7nmeYbq2axzMhd5dg3M4tWU0eXPy2KSSWs9c
 M8tWOaVH9VIAoPdWoAChZjp615xwvWIE5xqkghRk2azaaMljuQBcvpO+BZn45Z173tKF0F1TcOU
 vrP6EHUe5QkbLsWo1XMjlyrzbeuafrRDmaSvOKpU/geHJx7UrvxQe1HDmJsUh7k=
X-Google-Smtp-Source: AGHT+IGmS/dbAswlOoagzyUNNXToQ8KCPrYLO2jkpcWUS2bNLc3W2xXJSKKGjrlLH3p9lWDm72qAag==
X-Received: by 2002:a05:600c:3495:b0:44b:eb56:1d45 with SMTP id
 5b1f17b1804b1-4538c404805mr14804785e9.15.1750936607448; 
 Thu, 26 Jun 2025 04:16:47 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45380fd167bsm37035105e9.0.2025.06.26.04.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 04:16:43 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id E58405F8A6;
 Thu, 26 Jun 2025 12:16:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Thu, 26 Jun 2025 12:16:39 +0100
Message-ID: <20250626111642.228223-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250626111642.228223-1-alex.bennee@linaro.org>
References: <20250626111642.228223-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750936607; x=1751541407; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7IJCN6JpRGzW3A862znAuIakII56oSy83fvEt5ByL1E=;
 b=AxT5aNdLzDxL2V4aPeUzC1YeL1uzTnipgIMJQwwfO5aqGx5z8lOE1/oh5QCbZeWjhc
 TOiB4mMPlCCmeWPPPcAG8EaQgtQpt7nlJTvXQGHIv8KCJ0hRvkNy6i0ug++ukvfA9d/O
 /TAOC2jiClrQWhYiWm8QtKs230Jm+tXK8lIl95Zds8upd5VH2IAFIlPwpW3/kOoUQirf
 0p9kemyERFJ6lwh5ffBFIE+hC0AvBXYrO+mJxHUe7kS7SgLMS11SMvqL3jbO0vXJ1jCt
 kD1RzlYiWF0CC1JhflgR0E7qfsYcp28SqPvZpOtSN4GFLfmxFC5gwPyk4hrq2itj6sZW
 KY2Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=AxT5aNdL
Subject: [Buildroot] [RFC PATCH 1/3] package/llvm-project: use ninja to
 build llvm libs
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Daniel Lang <dalang@gmx.at>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VXNpbmcgbmluamEgaXMgcmVjb21tZW5kZWQgYXMgaXQgaXMgZmFzdGVyIHRoYW4gdGhlIGRlZmF1
bHQgR05VIG1ha2UKYnVpbGQgbWV0aG9kLiBNYWtlIHRoZSBzd2l0Y2guCgpTaWduZWQtb2ZmLWJ5
OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+Ci0tLQogcGFja2FnZS9sbHZt
LXByb2plY3QvbGx2bS9sbHZtLm1rIHwgMTAgKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xsdm0t
cHJvamVjdC9sbHZtL2xsdm0ubWsgYi9wYWNrYWdlL2xsdm0tcHJvamVjdC9sbHZtL2xsdm0ubWsK
aW5kZXggNzU1MmUzNTkwYy4uOGZlN2QxMGZlMCAxMDA2NDQKLS0tIGEvcGFja2FnZS9sbHZtLXBy
b2plY3QvbGx2bS9sbHZtLm1rCisrKyBiL3BhY2thZ2UvbGx2bS1wcm9qZWN0L2xsdm0vbGx2bS5t
awpAQCAtMTMsOCArMTMsMTAgQEAgTExWTV9DUEVfSURfVkVORE9SID0gbGx2bQogTExWTV9TVVBQ
T1JUU19JTl9TT1VSQ0VfQlVJTEQgPSBOTwogTExWTV9JTlNUQUxMX1NUQUdJTkcgPSBZRVMKIAot
SE9TVF9MTFZNX0RFUEVOREVOQ0lFUyA9IGhvc3QtcHl0aG9uMyBob3N0LWxsdm0tY21ha2UKLUxM
Vk1fREVQRU5ERU5DSUVTID0gaG9zdC1sbHZtCitIT1NUX0xMVk1fREVQRU5ERU5DSUVTID0gaG9z
dC1weXRob24zIGhvc3QtbGx2bS1jbWFrZSBob3N0LW5pbmphCitMTFZNX0RFUEVOREVOQ0lFUyA9
IGhvc3QtbGx2bSBob3N0LW5pbmphCisKK0xMVk1fQ01BS0VfQkFDS0VORCA9IG5pbmphCiAKICMg
UGF0aCB0byBjbWFrZSBtb2R1bGVzIGZyb20gaG9zdC1sbHZtLWNtYWtlCiBIT1NUX0xMVk1fQ09O
Rl9PUFRTICs9IC1EQ01BS0VfTU9EVUxFX1BBVEg9JChIT1NUX0RJUikvbGliL2NtYWtlL2xsdm0K
QEAgLTE2Niw4ICsxNjgsOCBAQCBMTFZNX0NPTkZfT1BUUyArPSAtRExMVk1fSEFWRV9URkxJVEU9
IiIKICMgRGVmYXVsdCBpcyBEZWJ1ZyBidWlsZCwgd2hpY2ggcmVxdWlyZXMgY29uc2lkZXJhYmx5
IG1vcmUgZGlzayBzcGFjZSBhbmQKICMgYnVpbGQgdGltZS4gUmVsZWFzZSBidWlsZCBpcyBzZWxl
Y3RlZCBmb3IgaG9zdCBhbmQgdGFyZ2V0IGJlY2F1c2UgdGhlIGxpbmtlcgogIyBjYW4gcnVuIG91
dCBvZiBtZW1vcnkgaW4gRGVidWcgbW9kZS4KLUhPU1RfTExWTV9DT05GX09QVFMgKz0gLURDTUFL
RV9CVUlMRF9UWVBFPVJlbGVhc2UKLUxMVk1fQ09ORl9PUFRTICs9IC1EQ01BS0VfQlVJTERfVFlQ
RT1SZWxlYXNlCitIT1NUX0xMVk1fQ09ORl9PUFRTICs9IC1EQ01BS0VfQlVJTERfVFlQRT1SZWxl
YXNlIC1HIE5pbmphCitMTFZNX0NPTkZfT1BUUyArPSAtRENNQUtFX0JVSUxEX1RZUEU9UmVsZWFz
ZSAtRyBOaW5qYQogCiAjIENvbXBpbGUgbGx2bSB3aXRoIHRoZSBDKysxNCAoSVNPIEMrKyAyMDE0
IHN0YW5kYXJkKS4KIEhPU1RfTExWTV9DT05GX09QVFMgKz0gLURDTUFLRV9DWFhfU1RBTkRBUkQ9
MTQKLS0gCjIuNDcuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
