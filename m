Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCA0C7EE32
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 11:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DEFD4098F;
	Thu, 26 Jun 2025 11:16:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MfBhHVt024DC; Thu, 26 Jun 2025 11:16:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACD1641852
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACD1641852;
	Thu, 26 Jun 2025 11:16:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CD125154
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 11:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE710842E7
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 11:16:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WAVyn6H4IKuZ for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 11:16:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6B9DE813FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B9DE813FB
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B9DE813FB
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 11:16:54 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a50fc7ac4dso436306f8f.0
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 04:16:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750936612; x=1751541412;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VWIOGl7jARKeEdNmaM1B44dOBZiedePmaF82tPsSCBg=;
 b=mP9Ef44IWooqp91u69FBdeJgrZXtBlpoba0lDkaw5XCJIOycwg7yhWRS2B4gHOs6xq
 c/2pXiFRR9BRSBS2+mUv8unNTmD/xWfVyHokc5hQCoEHvcVKcVgFk+oDSWI2E4HrIDA5
 BytH4iilAAGBMENJOLjwvRye9VPEoO9aaAIqU5paVT/+q9R+GbdTU4TXTq/luQsftbTz
 wZ29+fK7qq8a0HDsxdTaukk8DWzki97bmIukG2jlI/b2mbuCFS7UuwFh5nPkUsQG7AE0
 8C3Qo0ah4Ca7Ig6BETn2uwfDEWkfBvijNjUV2tk99dZ5hh90MdVuSRJMKbu8pPbPxEFx
 419g==
X-Gm-Message-State: AOJu0YzXxVynr4BFf2auB9pao2OhZiYVz4AYnciRHlPDTi0a6lROBLVH
 T8mdRwGo6rrHR0wO/uWihVSI0DKXmI8MnfCRtVPwp/uz9su3sHRXGHCuzEmQ0398WKrTCvbvUzk
 pyWCRhR8=
X-Gm-Gg: ASbGnctjQjgNDMRjRse6wv7MsrsrH81/P25rBo4c/dXeMl7r6SvARRnC55j3fdBdRSO
 GPdPkGGwZaOXsdnCQlJYRyLQ+vEjAAj0BYDrzNXHu3PW7HCRhE0u8u83nM0nkRWvH7hcXMAUyl4
 AXrxn3DBwFHrtFAQdjEfQyjR95yYMFvJAQ1wOhVZSIymQuYVvgo+ikHcdxXby0fh3nD8qi1IRtQ
 cTNLHgclusXORZPnmSUPBKCho8beSG6OchgPQCxyEM0wQYlJpW58KST+I6AJI6yRQ8rsp2BZ6vH
 rPPE3Muw3pTP+V259lMkdzIPr1JlcvZ1NA+bQxksSixXB/3vINSvyHK2PmOBgDvpQ3uAAOaMvQ=
 =
X-Google-Smtp-Source: AGHT+IGY+Ll/2kHmKstToHcTDF726pWC8n1eEJslfMUHIz2yywitTaOSYV+aLAHRNTp6rV3tfOl2fQ==
X-Received: by 2002:a05:6000:25ed:b0:3a4:fc37:70e4 with SMTP id
 ffacd0b85a97d-3a6ed67565dmr4965911f8f.58.1750936611930; 
 Thu, 26 Jun 2025 04:16:51 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538233c5fasm48055125e9.8.2025.06.26.04.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 04:16:47 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 398AE5F8BF;
 Thu, 26 Jun 2025 12:16:43 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Thu, 26 Jun 2025 12:16:40 +0100
Message-ID: <20250626111642.228223-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250626111642.228223-1-alex.bennee@linaro.org>
References: <20250626111642.228223-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750936612; x=1751541412; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VWIOGl7jARKeEdNmaM1B44dOBZiedePmaF82tPsSCBg=;
 b=B+n9Zb/JlDvmP/M/tKXybS3YynQid3u4FFhQ/1S9eP/b4fbzVolCT0G9/HLAE9bY1X
 evyPH1+LZXox6r+OADsQ9Ap+Q7UqAJP6gvgqMZaVAc35A6qeawfksc5mIXdGDAXCTMCn
 3XcToVhybF+hzfqZRq3hu9IuZPWNti1+ajEMeGTN0e8VGMeSj42As9naZ4vL+hRqLUfW
 ApK9+P8Di0BFrUG2dWkISvKm9EGHuTWSQp5CsOL6B4w/P1rG15q0k57Xyg8pU0tXkqWr
 YJtQFllhgJuHTzMeCh8Rq8NbHEGp0foRJFLDHh/tyDy2cFGJsz/vLN/uSRNCZzudyXjg
 KyCg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=B+n9Zb/J
Subject: [Buildroot] [RFC PATCH 2/3] package/llvm-project: drop unused
 TERMINFO config flags
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

VGhlIGJ1aWxkIGNvbXBsYWlucyBhYm91dCB0aGVzZSBiZWluZyB1bnVzZWQgc28gZHJvcCB0aGVt
LgoKU2lnbmVkLW9mZi1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgot
LS0KIHBhY2thZ2UvbGx2bS1wcm9qZWN0L2xsdm0vbGx2bS5tayB8IDQgLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9sbHZtLXByb2plY3Qv
bGx2bS9sbHZtLm1rIGIvcGFja2FnZS9sbHZtLXByb2plY3QvbGx2bS9sbHZtLm1rCmluZGV4IDhm
ZTdkMTBmZTAuLjc4YWE2ZmU0NjcgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbGx2bS1wcm9qZWN0L2xs
dm0vbGx2bS5taworKysgYi9wYWNrYWdlL2xsdm0tcHJvamVjdC9sbHZtL2xsdm0ubWsKQEAgLTEz
MywxMCArMTMzLDYgQEAgTExWTV9DT05GX09QVFMgKz0gLURFTkFCTEVfQ1JBU0hfT1ZFUlJJREVT
PU9OCiBIT1NUX0xMVk1fQ09ORl9PUFRTICs9IC1ETExWTV9FTkFCTEVfRkZJPU9GRgogTExWTV9D
T05GX09QVFMgKz0gLURMTFZNX0VOQUJMRV9GRkk9T0ZGCiAKLSMgRGlzYWJsZSB0ZXJtaW5mbyBk
YXRhYmFzZSAobmVlZHMgbmN1cnNlcyBsaWJ0aW5mby5zbykKLUhPU1RfTExWTV9DT05GX09QVFMg
Kz0gLURMTFZNX0VOQUJMRV9URVJNSU5GTz1PRkYKLUxMVk1fQ09ORl9PUFRTICs9IC1ETExWTV9F
TkFCTEVfVEVSTUlORk89T0ZGCi0KICMgRW5hYmxlIHRocmVhZCBzdXBwb3J0CiBIT1NUX0xMVk1f
Q09ORl9PUFRTICs9IC1ETExWTV9FTkFCTEVfVEhSRUFEUz1PTgogTExWTV9DT05GX09QVFMgKz0g
LURMTFZNX0VOQUJMRV9USFJFQURTPU9OCi0tIAoyLjQ3LjIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
