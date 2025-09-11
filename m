Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0385CAC58E
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 21:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7052F40518;
	Thu, 11 Sep 2025 21:28:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pqbopdIss2p8; Thu, 11 Sep 2025 21:28:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D76D40186
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D76D40186;
	Thu, 11 Sep 2025 21:28:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E553D12D
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 21:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D785F42397
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 21:27:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uLj1YqXgBXQX for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 21:27:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BB5F542395
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB5F542395
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB5F542395
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 21:27:57 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3c46686d1e6so877248f8f.3
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 14:27:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757626075; x=1758230875;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9RA29YQvjUwxvCubdLUFL3NrOjBGvtVqqNnAV+hTRdc=;
 b=NUSQP1UKIUjjhnkqS+movDpDFRic17l3P+Z+OGKZbhsfyvXtFQ3o9L/2rAHthQRPLT
 Spl5ZmMRqyXP/23vXISGgwWwb0eWoFLs4aHEcg0jQsCpy2bC2OgFoG5mjuu2CCTJEU6s
 JTtk0HJi3LU5SN/7AxvgEYmKxASQReaEIAX6izfeVJf/oU+Wro0NUbfJcE5Z1mhzyYOh
 A1qHMODoBwUvAi8LNZBwAyPFvThuBvyBuLfzilsO6dzktwHDjpKT2O+qABy1WblPpcSd
 XfUTYqeneu6xDPOWmDFnmTAWDFs7Q3QC1H2aW61tG39Tl67xyjP4NqS+O/t+1MzF/s4Z
 kg8A==
X-Gm-Message-State: AOJu0Yxb4DINJqReot+aUO7QkKrVlo79atMw6iD1cU5K7X6pBUluZFaZ
 2xnjevCQ4p2UL6erf+zi/BlHr48WVgfhoFsdpc3zSnljkhwbCATD9PJyNBPAs8yuFrsjZPV/98s
 r8PSRthI=
X-Gm-Gg: ASbGncuoZMPKq22F2HMjmr+Dm22dqK3crZgKfa7+iNLwTEUtokDFqZIP/okzFrV/qmH
 5TM9mq8fN4WdirADNKvu/1wb6XFiImFZTPGcF0zC3l0I9B4z6eB9tlvwdHIDHzwPL9FF8EODKD+
 WlQBOvScgOneVSir29bAJjGk9lVS3cgvDFYJcm9QHNT3KzFFMR3HpzQ69WRkLWbli2foihIhjVO
 zP9AHqKBP7dTo4MR3UnA3VlWk6g2D11XI+DIXGYBhMMNeH0MqKSTA7JEQXY1FXMSOwcZeBbKNPD
 CS2tdiiGnV5W96l99+h8AI4V30KNS7M4Di7tkAhaV7LaiJY3DxONKDhnlcc7tT6VV/J7Nm02gTl
 meMKPZGgjiaGWFfIWYIsL+edbn1Jia5A5kQ==
X-Google-Smtp-Source: AGHT+IFN4jU5diJXnbqBiDBW4ROkb9aeHkUQ3POPZ6FIPRj6Smqgc83jO3V/2xICYro9ovW+YCtyYg==
X-Received: by 2002:a05:6000:22c3:b0:3d4:a64:6754 with SMTP id
 ffacd0b85a97d-3e765a4cefemr538652f8f.62.1757626074844; 
 Thu, 11 Sep 2025 14:27:54 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e037c3ee8sm39563945e9.18.2025.09.11.14.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 14:27:53 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 03A315F847;
 Thu, 11 Sep 2025 22:27:53 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 22:27:43 +0100
Message-ID: <20250911212752.266940-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250911212752.266940-1-alex.bennee@linaro.org>
References: <20250911212752.266940-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757626075; x=1758230875; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9RA29YQvjUwxvCubdLUFL3NrOjBGvtVqqNnAV+hTRdc=;
 b=xc8BIYdwiZre5O65ZoC8BUrfRwBr88bIxvD7S5YvA7KKD3J+3+36ncw5wHbY4OYxV8
 XQean3GonRatuomRZLBlDmRveIisHQhDgfXQMAhVO4/Gwrv8qXmOUqg3iCxgnPZkEsAH
 0coTcA0dx+aHyF2HewgvjDyWmwOpoAn+xTDbPSyCruk0eL5iJbQiH5N1aMdEVFVmDmVO
 e3YQD4QDF3sjXJ3AmhxCXuTluqEFk82yeibnexfQAJeq6mvjbcxn6JC77al6AZZhbcmk
 Srrs7702y7ErBt/ZXu9Fe0G1wCWPUf1NddQMeuVlViZWxa/S7XYZmrA85H3dtLAUi+fP
 krFw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=xc8BIYdw
Subject: [Buildroot] [PATCH v5 3/9] package/kvm-unit-tests: update
 dependencies
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
Cc: Thomas Huth <th.huth+br@posteo.eu>, Cyril Bur <cyrilbur@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VG8gcnVuIHRoZSB0ZXN0cyB3ZSBuZWVkIGEgc3lzdGVtIFFFTVUsIHRpbWVvdXQsIGdldGNvbmYg
YW5kIG5tYXAtbmNhdApzbyB1cGRhdGUgdGhlIHNlbGVjdC9kZXBlbmRzIGZvciB0aGVtLiBBcyB3
ZSBuZWVkIGF0IGxlYXN0IEdDQyA4IHdlCmNhbiBkcm9wIHRoZSBzcGVjaWZpYyByZXF1aXJlbWVu
dCBmb3Igb2xkIHg4Ni02NCB0ZXN0cy4KClNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxl
eC5iZW5uZWVAbGluYXJvLm9yZz4KCi0tLQp2MgogIC0gcmVtb3ZlIG9sZCBnY2Mgbm90ZXMgYXMg
d2UgbmVlZCBhdCBsZWFzdCA4IGFueXdheQogIC0gc2VsZWN0IFFFTVUgYW5kIG90aGVyIHJ1bnRp
bWUgZGVwcwogIC0gbWVudGlvbiB0aGUgcnVudGltZSBkZXBzCiAgLSBhZGQgc3VwcG9ydCBmb3Ig
Z2V0Y29uZiBmcm9tIGV4dGVybmFsIHRvb2xjaGFpbgogIC0gdXBkYXRlIGNvbW1lbnQgZmFsbGJh
Y2sKdjUKICAtIGtlZXAgaTM4Ni94ODYtNjQgdGFyZ2V0L2hvc3QgY29tbWVudHMKICAtIGFkZCAh
QlIyX1BBQ0tBR0VfUUVNVV9BUkNIX1NVUFBPUlRTX1RBUkdFVCB0byBjb21tZW50IGRlcHMKLS0t
CiBwYWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbiB8IDIzICsrKysrKysrKysrKysrKysr
Ky0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9wYWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbiBiL3BhY2thZ2Uv
a3ZtLXVuaXQtdGVzdHMvQ29uZmlnLmluCmluZGV4IDc1MzgzNjFkZjQuLjBmZWY5NDc3NmMgMTAw
NjQ0Ci0tLSBhL3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMvQ29uZmlnLmluCisrKyBiL3BhY2thZ2Uv
a3ZtLXVuaXQtdGVzdHMvQ29uZmlnLmluCkBAIC0xNiwxMSArMTYsMjAgQEAgY29uZmlnIEJSMl9Q
QUNLQUdFX0tWTV9VTklUX1RFU1RTX0FSQ0hfU1VQUE9SVFMKIGNvbmZpZyBCUjJfUEFDS0FHRV9L
Vk1fVU5JVF9URVNUUwogCWJvb2wgImt2bS11bml0LXRlc3RzIgogCWRlcGVuZHMgb24gQlIyX1BB
Q0tBR0VfS1ZNX1VOSVRfVEVTVFNfQVJDSF9TVVBQT1JUUwotCSMgb24gaTM4NiBhbmQgeDg2LTY0
LCBfX2J1aWx0aW5fcmVhY2hhYmxlIGlzIHVzZWQsIHNvIHdlIG5lZWQKLQkjIGdjYyA0LjUgYXQg
bGVhc3QuIG9uIGkzODYsIHdlIHVzZSB0aGUgdGFyZ2V0IGdjYywgd2hpbGUgb24KKwkjIE9uIGkz
ODYsIHdlIHVzZSB0aGUgdGFyZ2V0IGdjYywgd2hpbGUgb24KIAkjIHg4Ni02NCB3ZSB1c2UgdGhl
IGhvc3QgZ2NjIChzZWUgLm1rIGZpbGUgZm9yIGRldGFpbHMpCi0JZGVwZW5kcyBvbiBCUjJfVE9P
TENIQUlOX0dDQ19BVF9MRUFTVF80XzUgfHwgIUJSMl9pMzg2CiAJZGVwZW5kcyBvbiBCUjJfSE9T
VEFSQ0ggPSAieDg2XzY0IiB8fCAhQlIyX3g4Nl82NAorCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJ
Tl9HQ0NfQVRfTEVBU1RfOCAjIHFlbXUKKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX1FFTVVfQVJD
SF9TVVBQT1JUU19UQVJHRVQKKwlkZXBlbmRzIG9uIChCUjJfUEFDS0FHRV9HTElCQ19VVElMUyB8
fCBcCisJCSAgICBCUjJfVUNMSUJDX0lOU1RBTExfVVRJTFMgfHwgXAorCQkgICAgQlIyX1RPT0xD
SEFJTl9FWFRFUk5BTF9MSUJDX1VUSUxTX0NPUFkpICMgcnVudGltZSBnZXRjb25mCisJc2VsZWN0
IEJSMl9QQUNLQUdFX1FFTVUKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfUUVNVV9TWVNURU0gIyBydW50
aW1lIGZvciBxZW11LXN5c3RlbS0kQVJDSAorCXNlbGVjdCBCUjJfUEFDS0FHRV9DT1JFVVRJTFMg
IyBydW50aW1lIGZvciB0aW1lb3V0CisJc2VsZWN0IEJSMl9QQUNLQUdFX0JBU0ggIyBydW50aW1l
CisJc2VsZWN0IEJSMl9QQUNLQUdFX05NQVAKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTk1BUF9OQ0FU
ICMgcnVudGltZSBmb3IgbmNhdAogCXNlbGVjdCBCUjJfSE9TVEFSQ0hfTkVFRFNfSUEzMl9DT01Q
SUxFUiBpZiBCUjJfeDg2XzY0CiAJaGVscAogCSAga3ZtLXVuaXQtdGVzdHMgaXMgYSBwcm9qZWN0
IGFzIG9sZCBhcyBLVk0uIEFzIGl0cyBuYW1lCkBAIC00MCw2ICs0OSwxMCBAQCBjb25maWcgQlIy
X1BBQ0tBR0VfS1ZNX1VOSVRfVEVTVFMKIAogCSAgaHR0cDovL3d3dy5saW51eC1rdm0ub3JnL3Bh
Z2UvS1ZNLXVuaXQtdGVzdHMKIAotY29tbWVudCAia3ZtLXVuaXQtdGVzdHMgbmVlZHMgYSB0b29s
Y2hhaW4gdy8gZ2NjID49IDQuNSIKK2NvbW1lbnQgImt2bS11bml0LXRlc3RzIG5lZWRzIGEgdG9v
bGNoYWluIHcvIHV0aWxzLCBnY2MgPj0gOCBhbmQgcWVtdSIKIAlkZXBlbmRzIG9uIEJSMl9pMzg2
Ci0JZGVwZW5kcyBvbiAhQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfNF81CisJZGVwZW5kcyBv
biAhQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfOAorCWRlcGVuZHMgb24gIShCUjJfUEFDS0FH
RV9HTElCQ19VVElMUyB8fCBcCisJCUJSMl9VQ0xJQkNfSU5TVEFMTF9VVElMUyB8fCBcCisJCUJS
Ml9UT09MQ0hBSU5fRVhURVJOQUxfTElCQ19VVElMU19DT1BZKQorCWRlcGVuZHMgb24gIUJSMl9Q
QUNLQUdFX1FFTVVfQVJDSF9TVVBQT1JUU19UQVJHRVQKLS0gCjIuNDcuMwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
