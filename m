Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8633AC83F1B
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 16:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DEB341010;
	Fri, 11 Jul 2025 16:44:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fpnZFgqvaX0L; Fri, 11 Jul 2025 16:44:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6B1D41102
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6B1D41102;
	Fri, 11 Jul 2025 16:44:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B6B4199
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 16:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4225783BF8
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 16:44:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2QnWibWB3tNb for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 16:44:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6C53683BF5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C53683BF5
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C53683BF5
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 16:44:15 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a528243636so1397324f8f.3
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 09:44:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752252253; x=1752857053;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PGy7/+SXkPPccDG5mhgPpKTaP+DD/62GyvNeGi3oc3M=;
 b=Z4WUxOzg3hawmFaouEctbxPJ4lcd1XOp4mhb23X0IvWlgkrmHr/8SCSzfu2xcmsqMF
 vaeCu1MacjohAqz6P7Wy8+7E3Z5oZVMvGRmeNu7KTv1+ruuZ3Rj8DV8murykkg0jbylK
 kq+VYEgglMUZZnzTeahrE2Z13pbuA8KYlUBzMQClI2tkeSjgs94qyhYOd7syriX26+79
 R9OOszcW25MAcFeEJ7fw/NuV/M1HKTTINaxsffp1jJzV4JIsBeU2lAQp0Pvq3jZNLjWY
 BCln14hHeLSLegri+QK3Vx1bJ4uGRQu/+sG3y/FkrUv0FHggnSVDQqBY6Br/gozQ7zP5
 rFyQ==
X-Gm-Message-State: AOJu0YwXomNGFtaAxH/ls8hah9yqUfgAKWeWGiXJa6yaJCRtt4KlwNuz
 Aff3uHkp4i9+3MdxM4FoJ446P2NdkSBDz7Bv7pkDXMRvL/48CDJ1oBgKuo0H0PkXXJQwBUdsvPX
 znxFqWNs=
X-Gm-Gg: ASbGncvzLkWVy0LYjnWSVGMdkTwkxkviaDxuyjwovMs7C+VKryjmqskzWP7/7MF1K4J
 oixnBHn5fmit1eklDUGJNxQYonuYhX20wiDWImQ5oCK1+eakkkAAZXmm6RQU96/ITuElA86H5aO
 QLHvzBln1GP4x7S9SsAja9A9EYzILpeSadWrHLnpoEMinHEauOHdOQTGbR05fjiER9ZxouO05el
 7ADrDALAPieb/WQzXqnYCENG5MNaZxFxdBnnWpfXWtrrd3eGUcf4+KzZ9kLpu51WmoEuOwRdwLT
 /2bJu4x4nHuDTnZ1833SgeLqoZRjJvns8vACmBU+nln1pZbRDm3KqI98clBqLBRtvVFr9T9Tccl
 Dr1K89mRLpGvcYenukLt8tA4=
X-Google-Smtp-Source: AGHT+IFwNso/sY9IV2iGVnjkQltKVFA83GjYeOcp6pjqdG69nkievNkVGkHQE5wOYzT+mzUBiR1rNQ==
X-Received: by 2002:a05:6000:471d:b0:3a4:dc42:a0c3 with SMTP id
 ffacd0b85a97d-3b5f18e813amr4302120f8f.56.1752252252852; 
 Fri, 11 Jul 2025 09:44:12 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454d5032ff4sm91232535e9.8.2025.07.11.09.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 09:44:09 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 4DD625F8AD;
 Fri, 11 Jul 2025 17:44:08 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Fri, 11 Jul 2025 17:44:02 +0100
Message-ID: <20250711164407.799041-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250711164407.799041-1-alex.bennee@linaro.org>
References: <20250711164407.799041-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752252253; x=1752857053; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PGy7/+SXkPPccDG5mhgPpKTaP+DD/62GyvNeGi3oc3M=;
 b=Z2GCju/AecmmiDB4XHYFBluG+yTHhbUBJORtGwQ6w+eFnkZMOxcvAP9WN2CvxiDMD7
 LfwR1vurNoa9LyCKDj3wmcW8jc+qX8Zml0gM5PMHw4WGMlNaNldtbeSqKJsfaqFP/4ee
 iV/EIvmhf2PNtNyCEE5GpeGPr2QyNyoxsKEeV1T0oD66PMp2ftxSmAamtw1ozh6VFz92
 fykjaOzha2vGG79/3rJQDvpBLZmd+y0dGmMsX7FSXcDs1VTnUOvHQcATseWwJY6L6z10
 2QxolIH6bnGeM9bGBji8pt8b+YjCMoWMLHmAJB5LRKesoN0IA6Zeg6gcfRVqy9KXWwOh
 sT4A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=Z2GCju/A
Subject: [Buildroot] [RFC PATCH v2 4/7] package/qemu: introduce kvm and tcg
 system options
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2hlbiBidWlsZGluZyBzeXN0ZW0gYmluYXJpZXMgeW91IG1heSBub3QgZXZlbiB3YW50IFRDRyBz
dXBwb3J0IGlmIHlvdQphcmUgb25seSBpbnRlbmRpbmcgdG8gdXNlIEtWTS4gUHJvdmlkZSB0aGUg
b3B0aW9ucyBzbyB0aGUgdXNlciBjYW4Kc2VsZWN0IG9ubHkgd2hhdCB0aGV5IG5lZWQuCgpXaXRo
IG9ubHkgS1ZNIHNlbGVjdGVkIHRoZSBRRU1VIGJ1aWxkIHdpbGwgZ2VuZXJhbGx5IG9ubHkgYnVp
bGQgdGhlCmJpbmFyeSBmb3IgeW91ciB0YXJnZXQgc3lzdGVtLiBXZSBrZWVwIFRDRyBzdXBwb3J0
IG9uIGJ5IGRlZmF1bHQgc28gYXMKbm90IHRvIGJyZWFrIGV4aXN0aW5nIGRlZmNvbmZpZ3MuCgpT
aWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+CgotLS0K
djIKICAtIGNsZWFuLXVwIHdoaXRlc3BhY2UKICAtIGRlZmF1bHQgVENHPXkKICAtIGZpeCB0eXBv
cwogIC0gZHJvcCAtLWVuYWJsZS1rdm0gZnJvbSBkZWZhdWx0IGNvbmZpZ3VyZSBsaXN0Ci0tLQog
cGFja2FnZS9xZW11L0NvbmZpZy5pbiB8IDIzICsrKysrKysrKysrKysrKysrKy0tLS0tCiBwYWNr
YWdlL3FlbXUvcWVtdS5tayAgIHwgMTQgKysrKysrKysrKysrKy0KIDIgZmlsZXMgY2hhbmdlZCwg
MzEgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3Fl
bXUvQ29uZmlnLmluIGIvcGFja2FnZS9xZW11L0NvbmZpZy5pbgppbmRleCAyZDE1YWIxZWE5Li40
OWM3OGQyNmVjIDEwMDY0NAotLS0gYS9wYWNrYWdlL3FlbXUvQ29uZmlnLmluCisrKyBiL3BhY2th
Z2UvcWVtdS9Db25maWcuaW4KQEAgLTU5LDYgKzU5LDIwIEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9R
RU1VX1NZU1RFTQogCiBpZiBCUjJfUEFDS0FHRV9RRU1VX1NZU1RFTQogCitjb25maWcgQlIyX1BB
Q0tBR0VfUUVNVV9TWVNURU1fS1ZNCisJYm9vbCAiRW5hYmxlIEtWTSBzeXN0ZW0gdmlydHVhbGlz
YXRpb24iCisJZGVmYXVsdCB5CisJaGVscAorCSAgU2F5ICd5JyBoZXJlIHRvIGVuYWJsZSBhIFFF
TVUgd2l0aCBLVk0gc3VwcG9ydC4KKwkgIElmIHVuc3VyZSwgc2F5ICd5JworCitjb25maWcgQlIy
X1BBQ0tBR0VfUUVNVV9TWVNURU1fVENHCisJYm9vbCAiRW5hYmxlIFRDRyBzeXN0ZW0gZW11bGF0
aW9uIgorCWRlZmF1bHQgeQorCWhlbHAKKwkgIFNheSAneScgaGVyZSB0byBlbmFibGUgUUVNVSBi
aW5hcmllcyB3aGljaCBjYW4gZW11bGF0ZSBmb3JlaWduCisJICBhcmNoaXRlY3R1cmVzIHVzaW5n
IHRoZSBUQ0cgSklULgorCiBjb25maWcgQlIyX1BBQ0tBR0VfUUVNVV9CTE9CUwogCWJvb2wgIklu
c3RhbGwgYmluYXJ5IGJsb2JzIgogCWRlZmF1bHQgeQpAQCAtMTMwLDEyICsxNDQsMTEgQEAgY29u
ZmlnIEJSMl9QQUNLQUdFX1FFTVVfTElOVVhfVVNFUgogCiBjb25maWcgQlIyX1BBQ0tBR0VfUUVN
VV9DSE9PU0VfVEFSR0VUUwogCWJvb2wgIlNlbGVjdCBpbmRpdmlkdWFsIGVtdWxhdG9yIHRhcmdl
dHMiCi0JZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9RRU1VX1NZU1RFTSB8fCBCUjJfUEFDS0FHRV9R
RU1VX0xJTlVYX1VTRVIKKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX1FFTVVfU1lTVEVNX1RDRyB8
fCBCUjJfUEFDS0FHRV9RRU1VX0xJTlVYX1VTRVIKIAloZWxwCi0JICBCeSBkZWZhdWx0LCBhbGwg
dGFyZ2V0cyAoc3lzdGVtIGFuZC9vciB1c2VyLCBzdWJqZWN0IHRvIHRoZQotCSAgY29ycmVzcG9u
ZGluZyBvcHRpb25zLCBhYm92ZSkgYXJlIGJ1aWx0LiBJZiB5b3Ugb25seSBuZWVkIGEKLQkgIHN1
YnNldCBvZiB0aGUgZW11bGF0ZWQgdGFyZ2V0cywgc2F5ICd5JyBoZXJlIGFuZCBlbmFibGUgYXQK
LQkgIGxlYXN0IG9uZSB0YXJnZXQsIGJlbG93LgorCSAgQnkgZGVmYXVsdCwgYWxsIHRhcmdldHMg
c3lzdGVtIHRhcmdldHMgYXJlIGJ1aWx0IHdoZW4gVENHIGlzCisJICBlbmFibGVkLiBJZiB5b3Ug
b25seSBuZWVkIGEgc3Vic2V0IG9mIHRoZSBlbXVsYXRlZCB0YXJnZXRzLAorCSAgc2F5ICd5JyBo
ZXJlIGFuZCBlbmFibGUgYXQgbGVhc3Qgb25lIHRhcmdldCwgYmVsb3cuCiAKIGlmIEJSMl9QQUNL
QUdFX1FFTVVfQ0hPT1NFX1RBUkdFVFMKIApkaWZmIC0tZ2l0IGEvcGFja2FnZS9xZW11L3FlbXUu
bWsgYi9wYWNrYWdlL3FlbXUvcWVtdS5tawppbmRleCBmZGM4NTkxZTU0Li41ZTYzMTY2NTQ1IDEw
MDY0NAotLS0gYS9wYWNrYWdlL3FlbXUvcWVtdS5taworKysgYi9wYWNrYWdlL3FlbXUvcWVtdS5t
awpAQCAtNDgsNiArNDgsMTkgQEAgUUVNVV9WQVJTID0gTElCVE9PTD0kKEhPU1RfRElSKS9iaW4v
bGlidG9vbAogaWZlcSAoJChCUjJfUEFDS0FHRV9RRU1VX1NZU1RFTSkseSkKIFFFTVVfREVQRU5E
RU5DSUVTICs9IHBpeG1hbgogUUVNVV9PUFRTICs9IC0tZW5hYmxlLXN5c3RlbQorCitpZmVxICgk
KEJSMl9QQUNLQUdFX1FFTVVfU1lTVEVNX0tWTSksIHkpCitRRU1VX09QVFMgKz0gLS1lbmFibGUt
a3ZtCitlbHNlCitRRU1VX09QVFMgKz0gLS1kaXNhYmxlLWt2bQorZW5kaWYKKworaWZlcSAoJChC
UjJfUEFDS0FHRV9RRU1VX1NZU1RFTV9UQ0cpLCB5KQorUUVNVV9PUFRTICs9IC0tZW5hYmxlLXRj
ZworZWxzZQorUUVNVV9PUFRTICs9IC0tZGlzYWJsZS10Y2cKK2VuZGlmCisKIFFFTVVfVEFSR0VU
X0xJU1RfJChCUjJfUEFDS0FHRV9RRU1VX1RBUkdFVF9BQVJDSDY0KSArPSBhYXJjaDY0LXNvZnRt
bXUKIFFFTVVfVEFSR0VUX0xJU1RfJChCUjJfUEFDS0FHRV9RRU1VX1RBUkdFVF9BTFBIQSkgKz0g
YWxwaGEtc29mdG1tdQogUUVNVV9UQVJHRVRfTElTVF8kKEJSMl9QQUNLQUdFX1FFTVVfVEFSR0VU
X0FSTSkgKz0gYXJtLXNvZnRtbXUKQEAgLTMyNiw3ICszMzksNiBAQCBkZWZpbmUgUUVNVV9DT05G
SUdVUkVfQ01EUwogCQkJLS1kaXNhYmxlLXdocHggXAogCQkJLS1kaXNhYmxlLXhlbiBcCiAJCQkt
LWVuYWJsZS1hdHRyIFwKLQkJCS0tZW5hYmxlLWt2bSBcCiAJCQktLWVuYWJsZS12aG9zdC1uZXQg
XAogCQkJLS1kaXNhYmxlLWRvd25sb2FkIFwKIAkJCS0tZGlzYWJsZS1oZXhhZ29uLWlkZWYtcGFy
c2VyIFwKLS0gCjIuNDcuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
