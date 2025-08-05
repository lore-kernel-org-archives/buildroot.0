Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3E9C87FDA
	for <buildroot@archiver.kernel.org>; Tue,  5 Aug 2025 15:18:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B99FD83F98;
	Tue,  5 Aug 2025 15:18:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3FiBUIwOD_AV; Tue,  5 Aug 2025 15:18:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63E7983F00
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63E7983F00;
	Tue,  5 Aug 2025 15:18:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DFEC1A2
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 15:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8052383ED2
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 15:18:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KPjurrN__loh for <buildroot@buildroot.org>;
 Tue,  5 Aug 2025 15:18:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C381E83ECE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C381E83ECE
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C381E83ECE
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 15:18:20 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-459e1338565so10080535e9.2
 for <buildroot@buildroot.org>; Tue, 05 Aug 2025 08:18:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754407098; x=1755011898;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1Z8TC4WFkp3Dm4zbImph1C9k06fR2yqZt4t922svTz8=;
 b=i9OmPca+FosnfU9FN63aeV3Za7EKno7xrGEcAwBLMX7J/2UQUWjxJtiObSZ1Xbzism
 /MhIDFP+fvlK1NkL/BBIltDgkaZcAl2+6TZcC2P8JU5rbiURlvFkzDEW7Oh76J41+wNn
 1fuQDeB7kgeGH8KvjpGq1Suz7erOjXBGEBcyF9eQKfIuqXc7IYH9B1dsk1uzlC68BKHW
 0cq2YRQ/xGcyJ37eLX9g0jWHNcNrxytIID4ZYS6l6g2vYFdGPhRQYeGPYVuvv87AVVNc
 j3Ug2+a6v/QObHpsuI19n7aSE+PsN4Ym7B06Jcl+dPpIjgeesk0DDyIdz5ZCdlKe81pD
 fWgg==
X-Gm-Message-State: AOJu0YwdaO6xHZE7ahsBM3pbc9HSzm1wMUEKYmV8kLxsheOPhgNkZ5Qz
 IwEoAYB9yZRodh0MnZsUn2rLPHmKZ9FvOF0JGxL4qP4KfWsnHaRglSl/tKKeQdWjUoLzav1jPs9
 9YUUv
X-Gm-Gg: ASbGnctrI6NCn1vk7sYT6gprTyFzVRDiNetY+isjl0hobXZiz/P+Uwy6zCUFKcahr4u
 7X/p4xz/KhsrYEdeO2If4F/8eFFnXVWtBek0lLCbcNTWwo/yYCqRH915nmB0K8P/6iGILwjn75i
 JblNPd1BmzwN5BWZKfRFpY85EGUe1bRt2Ca4foi3J/xbWpYdwvQdn0b6WfQQxcQuq1XPAckkxpL
 3tDkh7DAtRTKfTiDunpSH7XSirJjEGHl4MA8Di76lyIFY4UvZXUdOaMbE9Hivn4SLaY0ATg95/U
 5ytGtPw52tu1Wj4BPb+/+noEnrUC2YlTmY5yerVyk1vG2itETMzbTvUClABj2jG09CDk7LZL+Ds
 YsU+rQL2orrDzRPGISdRpC0E=
X-Google-Smtp-Source: AGHT+IHZE73SVXhvM2KXMEVGxhuHDVrCU6y3cZji7H9szTVCHsORC44t/P4lC6iLodgI5CR5/yiXQA==
X-Received: by 2002:a05:600c:4447:b0:459:df25:b839 with SMTP id
 5b1f17b1804b1-459df25bd53mr50546065e9.33.1754407098243; 
 Tue, 05 Aug 2025 08:18:18 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459dd85f423sm68341845e9.18.2025.08.05.08.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 08:18:16 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id A1AD05F894;
 Tue, 05 Aug 2025 16:18:14 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Tue,  5 Aug 2025 16:18:04 +0100
Message-ID: <20250805151814.1114414-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250805151814.1114414-1-alex.bennee@linaro.org>
References: <20250805151814.1114414-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754407098; x=1755011898; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Z8TC4WFkp3Dm4zbImph1C9k06fR2yqZt4t922svTz8=;
 b=Le2a/iP5uxSqZL0TxaviljHym2owAzB5jLUyJZDLHQmSt8z2JqTFXfzF1DcwfcwFAI
 DThmTpBamBIMeb5EgcGO0XrqUln+EipVLVlczIeNj3EPj/ZNn7QNrT5Hqcge6lX3Bj95
 t066+uHj3dB/V11frBrs0xvvbwDmJrv4CCtl5LSYX6JNwQuL+NarGvPvYQugAeRsiGDt
 eYePvv4TZb+s8POsSkRtm4RFHXf3j67txn/tmxM+j8l2j6Lp/+Codw5HrhaXensCZIhT
 tV0Mwn7rimml+MRT0Ov6wMxBQ/No7bs0U9IRCq6m+EHC7AIxUiQ51zdaqEH3tfksd4yk
 jNtw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=Le2a/iP5
Subject: [Buildroot] [PATCH v4 2/9] package/kvm-unit-tests: assume AArch64
 supports KVM
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

QWx0aG91Z2ggaXQgaXMgcG9zc2libGUgdG8gY29uZmlndXJlIGFuIEFBcmNoNjQgQ1BVIHdpdGhv
dXQgc3VwcG9ydApmb3IgRUwyIGluIHByYWN0aWNlIGFsbCB0aGUgY29tbW9uIEFBcmNoNjQgaGF2
ZSBzdXBwb3J0ZWQKdmlydHVhbGlzYXRpb24gZnJvbSB0aGUgc3RhcnQuCgpJZiB3ZSByZWFsbHkg
d2FudGVkIHRvIGJlIHN0cmljdCB3ZSBjb3VsZCBibGFja2xpc3Qga25vd24gbm9uLUVMMiBDUFVz
CmJ1dCBBRkFJQ1QgYWxsIHRoZSBjdXJyZW50IG9uZXMgaW4gdGhlIGNvbmZpZyBoYXZlIEVMMi4K
Ckkgc2hvdWxkIGFsc28gbm90ZSBLVk0gb24gQXJtIGlzIGRlcHJlY2F0ZWQgYW5kIHdhcyByZW1v
dmVkIGZyb20gdGhlCmtlcm5lbCBpbiB2Ni4xMC4KClJldmlld2VkLWJ5OiBUaG9tYXMgSHV0aCA8
aHV0aEB0dXhmYW1pbHkub3JnPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVu
bmVlQGxpbmFyby5vcmc+CgotLS0KdjIKICAtIGxlYXZlIEJSMl9jb3J0ZXhfYTc2IGFuZCBCUjJf
Y29ydGV4X2E3Nl9hNTUgaW4gcGxhY2UgYXMgY2FuIGJlCiAgdXNlZCB3aXRoIGFybTMyCnYzCiAg
LSByLWIKdjQKICAtIHJlYmFzZSBmaXhlcwotLS0KIHBhY2thZ2Uva3ZtLXVuaXQtdGVzdHMvQ29u
ZmlnLmluIHwgOCArKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5p
biBiL3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMvQ29uZmlnLmluCmluZGV4IDBkNjZhMDhkZDcuLjc1
MzgzNjFkZjQgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMvQ29uZmlnLmluCisr
KyBiL3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMvQ29uZmlnLmluCkBAIC0xLDEzICsxLDEzIEBACiBj
b25maWcgQlIyX1BBQ0tBR0VfS1ZNX1VOSVRfVEVTVFNfQVJDSF9TVVBQT1JUUwogCWJvb2wKIAkj
IE9uIEFSTSwgaXQgbmVlZHMgdmlydHVhbGl6YXRpb24gZXh0ZW5zaW9ucyBhbmQgbGl0dGxlIGVu
ZGlhbiBDUFVzCi0JZGVmYXVsdCB5IGlmIChCUjJfYXJtIHx8IEJSMl9hYXJjaDY0KSAmJiBcCisJ
ZGVmYXVsdCB5IGlmIEJSMl9hcm0gJiYgXAogCQkoQlIyX2NvcnRleF9hNyB8fCBCUjJfY29ydGV4
X2ExMiB8fCBcCiAJCUJSMl9jb3J0ZXhfYTE1IHx8IEJSMl9jb3J0ZXhfYTE1X2E3IHx8IFwKIAkJ
QlIyX2NvcnRleF9hMTcgfHwgQlIyX2NvcnRleF9hMTdfYTcgfHwgXAotCQlCUjJfY29ydGV4X2E1
NSB8fCBCUjJfY29ydGV4X2E3NSB8fCBcCi0JCUJSMl9jb3J0ZXhfYTc1X2E1NSB8fCBCUjJfY29y
dGV4X2E3NiB8fCBcCi0JCUJSMl9jb3J0ZXhfYTc2X2E1NSkKKwkJQlIyX2NvcnRleF9hNzYgfHwg
QlIyX2NvcnRleF9hNzZfYTU1ICkKKwkjIEZvciBBQXJjaDY0IHdlIGNhbiBhc3N1bWUgYWxsIHY4
LjArIHN1cHBvcnQgdmlydHVhbGl6YXRpb24KKwlkZWZhdWx0IHkgaWYgQlIyX2FhcmNoNjQKIAlk
ZWZhdWx0IHkgaWYgQlIyX3Jpc2N2CiAJZGVmYXVsdCB5IGlmIEJSMl9pMzg2IHx8IEJSMl94ODZf
NjQKIAlkZWZhdWx0IHkgaWYgQlIyX3Bvd2VycGM2NCB8fCBCUjJfcG93ZXJwYzY0bGUKLS0gCjIu
NDcuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
