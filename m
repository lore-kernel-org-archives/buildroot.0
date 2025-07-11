Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 485DBC83F1B
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 16:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10DA6410D2;
	Fri, 11 Jul 2025 16:44:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ptROzxv5wVd4; Fri, 11 Jul 2025 16:44:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D1CD40ECD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D1CD40ECD;
	Fri, 11 Jul 2025 16:44:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E5182114
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 16:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB25F402BC
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 16:44:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SvrOJlDIQhOm for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 16:44:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D0F8540545
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0F8540545
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D0F8540545
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 16:44:13 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-455b00283a5so4708715e9.0
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 09:44:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752252251; x=1752857051;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FTK5dcgxgc4Y8u8cutoYS/FDRvZ2vJ4ylJrxy19qrz4=;
 b=sel7ylLd5sJhcZ78YKVnwLE60nn4S14uwBMteSGoAd819KsqNy3WN7hkNa2fWSLmCJ
 t+lDyXoVyDh5lXyQERE9MaeYypcsAPaceMzaCPaeKfQg5BMgWnYymjUpcE3L+sD0y1tZ
 oGamnzZqnEhBHY74kRzsFWpNMtBm1pPeDi6ndbaVa4rgSwOryuZP8oCXhlHjVhkaHGM4
 9bttH3DjpV07ggf60HEY1kHnV4Hq47JPcBvQJaIcRYGpu59CafBXF+rVcZgaluwm23VN
 rYtOmQVZOYRPqxQmjVIkHbaTM+ZT+Xd6RAOyLEtBPXWaHuGjE9FQoy9L7nuFdO3UmFFj
 7LhQ==
X-Gm-Message-State: AOJu0YwCB/FN3t9DB2k69PnN/Pwhu301xoy/6Nd/PsF0ZRqF8cs3hC87
 Pu2G5jkZE5VQhzGbOi8ECocZ2DzsqMzg5/HR5F7Mp/czCNFMGgbSr3OmxLCO9+eqPK9P/eXz5Iw
 akrsOhE8=
X-Gm-Gg: ASbGncvcr6+iUfso7N5rY0APPnq5+JJ2K+PI1D9ZQtf+/uUr8zSZjNxFcDlc5qMCD8x
 qVJfwF1TvGOIkysL3mAMbu0DJ9h9UEnhxokAf2V3szI3ubria+QUEZ86M5OsP9vUHMSr6MZ525u
 JDwsoA0Cn8cS/jJWd3Nl/fxQAO0VvhAj6AYuMx83okULk8l2VQJE9jCXAiYYotb2tk6qQDxV8AZ
 0jpzW84pBBlK3wN2qFhGtaTwVbvWSalrbwFxb5dQ+1ZY4Sk1VzGib6idoDVQTLA41y4mrU2HSYz
 mbBAwgg94CFhiYo20kmw/cC1RGRlcRDL0nV/uLuNsI89S+o6cZMrV65hGS+e8Rt8yMnNpPKmpC0
 Yky8/ZHXUjN/WIEw9phuDcwLOjUwAzTNkSw==
X-Google-Smtp-Source: AGHT+IE3Zlp1gQ4GzrOSWAj9B3stwZwS1fOVzthNtV41xsIFvhgNWa3CSA1HdgqJWR8RO1VxjlFc4g==
X-Received: by 2002:a05:600c:828a:b0:43d:9d5:474d with SMTP id
 5b1f17b1804b1-455c6197d55mr33672085e9.0.1752252250930; 
 Fri, 11 Jul 2025 09:44:10 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454d50dcc84sm94200685e9.24.2025.07.11.09.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 09:44:09 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 0999C5F893;
 Fri, 11 Jul 2025 17:44:08 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Fri, 11 Jul 2025 17:44:01 +0100
Message-ID: <20250711164407.799041-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250711164407.799041-1-alex.bennee@linaro.org>
References: <20250711164407.799041-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752252251; x=1752857051; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FTK5dcgxgc4Y8u8cutoYS/FDRvZ2vJ4ylJrxy19qrz4=;
 b=jbf7ra96T+RxjRFMFyBRNtF7VBV4NNoWzt60hlLj66PW7sj6pBnJnutXGyvMMSKfiW
 H33I7P6MsFmMXQdd+XZBKUlJxi5U5Yf2Gpm7p3kbemZ0YE0fVdoWKj647uARyFKBssRY
 RvtlQbfUaRfEek9gno78LpmAmDzk/J1MqG3IOUhVbWzUoCcnUizbs4xteR02Wos0699/
 vetGW+2J2H8pedbrutUMCjXiurKvkxXo/8LBQ3agz6LMYkdtbpBGSCoYMUwUzFTZjkmz
 NQBoxhe+HWcXvXi9lW71f4VmYeQEvAg4tfCOUGNmN+fZmoKwbDk0zHpJsQRio9IuJwGS
 jZUQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=jbf7ra96
Subject: [Buildroot] [RFC PATCH v2 3/7] package/kvm-unit-tests: update
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
Cc: Thomas Huth <huth@tuxfamily.org>, Cyril Bur <cyrilbur@gmail.com>
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
Y2sKLS0tCiBwYWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbiB8IDI0ICsrKysrKysrKysr
KysrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDcgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9Db25maWcuaW4gYi9w
YWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbgppbmRleCA4N2IwNzVjNGI5Li43NzViMjUw
ZDVmIDEwMDY0NAotLS0gYS9wYWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbgorKysgYi9w
YWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbgpAQCAtMTQsMTIgKzE0LDE5IEBAIGNvbmZp
ZyBCUjJfUEFDS0FHRV9LVk1fVU5JVF9URVNUU19BUkNIX1NVUFBPUlRTCiAKIGNvbmZpZyBCUjJf
UEFDS0FHRV9LVk1fVU5JVF9URVNUUwogCWJvb2wgImt2bS11bml0LXRlc3RzIgotCWRlcGVuZHMg
b24gQlIyX1BBQ0tBR0VfS1ZNX1VOSVRfVEVTVFNfQVJDSF9TVVBQT1JUUwotCSMgb24gaTM4NiBh
bmQgeDg2LTY0LCBfX2J1aWx0aW5fcmVhY2hhYmxlIGlzIHVzZWQsIHNvIHdlIG5lZWQKLQkjIGdj
YyA0LjUgYXQgbGVhc3QuIG9uIGkzODYsIHdlIHVzZSB0aGUgdGFyZ2V0IGdjYywgd2hpbGUgb24K
LQkjIHg4Ni02NCB3ZSB1c2UgdGhlIGhvc3QgZ2NjIChzZWUgLm1rIGZpbGUgZm9yIGRldGFpbHMp
Ci0JZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF80XzUgfHwgIUJSMl9pMzg2
CiAJZGVwZW5kcyBvbiBCUjJfSE9TVEFSQ0ggPSAieDg2XzY0IiB8fCAhQlIyX3g4Nl82NAorCWRl
cGVuZHMgb24gQlIyX1BBQ0tBR0VfS1ZNX1VOSVRfVEVTVFNfQVJDSF9TVVBQT1JUUworCWRlcGVu
ZHMgb24gQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfOCAjIHFlbXUKKwlkZXBlbmRzIG9uIEJS
Ml9QQUNLQUdFX1FFTVVfQVJDSF9TVVBQT1JUU19UQVJHRVQKKwlkZXBlbmRzIG9uIChCUjJfUEFD
S0FHRV9HTElCQ19VVElMUyB8fCBcCisJCSAgICBCUjJfVUNMSUJDX0lOU1RBTExfVVRJTFMgfHwg
XAorCQkgICAgQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9MSUJDX1VUSUxTX0NPUFkpICMgcnVudGlt
ZSBnZXRjb25mCisJc2VsZWN0IEJSMl9QQUNLQUdFX1FFTVUKKwlzZWxlY3QgQlIyX1BBQ0tBR0Vf
UUVNVV9TWVNURU0gIyBydW50aW1lIGZvciBxZW11LXN5c3RlbS0kQVJDSAorCXNlbGVjdCBCUjJf
UEFDS0FHRV9DT1JFVVRJTFMgIyBydW50aW1lIGZvciB0aW1lb3V0CisJc2VsZWN0IEJSMl9QQUNL
QUdFX0JBU0ggIyBydW50aW1lCisJc2VsZWN0IEJSMl9QQUNLQUdFX05NQVAKKwlzZWxlY3QgQlIy
X1BBQ0tBR0VfTk1BUF9OQ0FUICMgcnVudGltZSBmb3IgbmNhdAogCXNlbGVjdCBCUjJfSE9TVEFS
Q0hfTkVFRFNfSUEzMl9DT01QSUxFUiBpZiBCUjJfeDg2XzY0CiAJaGVscAogCSAga3ZtLXVuaXQt
dGVzdHMgaXMgYSBwcm9qZWN0IGFzIG9sZCBhcyBLVk0uIEFzIGl0cyBuYW1lCkBAIC0zOSw2ICs0
Niw5IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9LVk1fVU5JVF9URVNUUwogCiAJICBodHRwOi8vd3d3
LmxpbnV4LWt2bS5vcmcvcGFnZS9LVk0tdW5pdC10ZXN0cwogCi1jb21tZW50ICJrdm0tdW5pdC10
ZXN0cyBuZWVkcyBhIHRvb2xjaGFpbiB3LyBnY2MgPj0gNC41IgorY29tbWVudCAia3ZtLXVuaXQt
dGVzdHMgbmVlZHMgYSB0b29sY2hhaW4gdy8gdXRpbHMgYW5kIGdjYyA+PSA4IgogCWRlcGVuZHMg
b24gQlIyX2kzODYKLQlkZXBlbmRzIG9uICFCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF80XzUK
KwlkZXBlbmRzIG9uICFCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF84CisJZGVwZW5kcyBvbiAh
KEJSMl9QQUNLQUdFX0dMSUJDX1VUSUxTIHx8IFwKKwkJQlIyX1VDTElCQ19JTlNUQUxMX1VUSUxT
IHx8IFwKKwkJQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9MSUJDX1VUSUxTX0NPUFkpCi0tIAoyLjQ3
LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
