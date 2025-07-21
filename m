Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 830D7C87FC5
	for <buildroot@archiver.kernel.org>; Mon, 21 Jul 2025 15:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0337B4137F;
	Mon, 21 Jul 2025 15:48:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wm0NpnhzxznL; Mon, 21 Jul 2025 15:48:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC6E6413A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC6E6413A8;
	Mon, 21 Jul 2025 15:48:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D8C0127
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 15:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 343DC40347
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 15:48:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B4E9B3nc9dcZ for <buildroot@buildroot.org>;
 Mon, 21 Jul 2025 15:48:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1578840245
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1578840245
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1578840245
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 15:48:19 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6077dea37easo6987485a12.3
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 08:48:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753112897; x=1753717697;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FTK5dcgxgc4Y8u8cutoYS/FDRvZ2vJ4ylJrxy19qrz4=;
 b=je6c0PlYixCWbEoNfN2bRgv1t3k6GQgJvS8Sz6DiYLJWkkv7uD2qRz+24VC5PUyAj7
 Ju27h3vKSTkBJu6R8lxyCTPuRHU4EXbE5ySZDk4JoQ38DRohXx1pKwp9Flh5h3r6cxqI
 wQzK9uQBvXdcBG7fCGHeVKXH5+jlZ+59PUaDmfGVqR4C7wi7RNMELpTFxMBtEUUrz/8h
 Rkw7hg0tVGZG4AtmkkXkEQ5rDKOhnBm4hj0vIHjFEgYgkjL7DZrEb0VsI+0QzuUE4Mx/
 FluD98RJtyEf7p1VQbTCOg+42PGYQLv5QH5J+yCiwlQ5FepFORbAtGHpe7Pg6uGYa5qc
 okwg==
X-Gm-Message-State: AOJu0YzNM4HwHL0RNXjgMwE305il55xxlcYelbjfa9CerXyMWOLIrcap
 ScwWw2AJGNrGFqi4chTad485h+t7Ab4dXq0vN20J2n58PXz2UiaNQsIhb1sYibo8ZpGTkXa8O9h
 oJ6E0
X-Gm-Gg: ASbGnct8Mt55SfxoBhbwK6jlSDMonr7LxuFYPghXo+HP+mhyvNiDzLz1Xz/cVgn7f0E
 rl9w9CCW3aPAkJbYctt9zrcfTRu0aYNUcb6oO9KN9QdYgzJMqU+lhmIuAKtir2DkM88ieGpfVTI
 KkmbTPmStUuHJlshPF+ECVDmPxcZvM7KRzS+snquQG09i2zy+9uBj/HI5vWz8eA19CnFF5q/ZFG
 qGiQIsCVu1972j5pxDn+tZd0ia74vZVK71kwlsTn1v32Erm6CRNDsBPY26g83jFG/QTn9DYrp/g
 QTH6asbjM6H5+0VJawbv6AP2WZz+f6/jS/HBbrHemNqc9quf5/bkYGpwOJ5CPj28yBaMSxFqEQF
 Cy4q6/tY8Kns0V15wzCqvxLg=
X-Google-Smtp-Source: AGHT+IEHvzYQVde54RxsXwEoxNNgwfeakl8oTQr/I236xwy4Yc0Y2hRgcOKW/TOLNggJf9rYRMfKuw==
X-Received: by 2002:a05:6402:50d1:b0:612:d8b3:a9f7 with SMTP id
 4fb4d7f45d1cf-612d8b3aebcmr10880999a12.7.1753112897408; 
 Mon, 21 Jul 2025 08:48:17 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-612c903fd0esm5406746a12.48.2025.07.21.08.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 08:48:14 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 879315F89A;
 Mon, 21 Jul 2025 16:48:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Mon, 21 Jul 2025 16:48:04 +0100
Message-ID: <20250721154812.787883-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250721154812.787883-1-alex.bennee@linaro.org>
References: <20250721154812.787883-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753112897; x=1753717697; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FTK5dcgxgc4Y8u8cutoYS/FDRvZ2vJ4ylJrxy19qrz4=;
 b=nvAX+tqm2/AnEsfQWy8reZFPX9dOFd+UHPX4qL7OZfiDHR1ATq+kX+vHaSME0CJUWc
 MuTrifaMPaGOOlefpTclEyk4/DvC8VaLNR7U5OGrUCKvhFgmQ/MlD14JYYW8etM/h4bT
 hPIYw8sIvi5A0pi9GahSFZCVTi8uqUFlDhDRy07pFtys3TpumiKntydVpkC3Bq904wUR
 zxErZET7wIDaj+5gbC4f6f/ho/YL4M/v2nYfOTI0QMAYB2QE/7URDA9cLOLsEFJQ90v8
 E66gpW5t8SO8HsuqyYqeKkI9YhpUPn+QnuYhSjHtC2jl+fJYtl1BcMnfxS6aWeBeLxDN
 rOjw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=nvAX+tqm
Subject: [Buildroot] [PATCH v3 3/9] package/kvm-unit-tests: update
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
