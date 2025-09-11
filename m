Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA743CAC587
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 21:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 696BE84D90;
	Thu, 11 Sep 2025 21:28:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5f7CTNUGb2q4; Thu, 11 Sep 2025 21:28:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51BA684D92
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51BA684D92;
	Thu, 11 Sep 2025 21:28:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B54AC25B
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 21:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A363761484
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 21:28:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7-ucPz-CWmxn for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 21:28:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EE96D60B3C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE96D60B3C
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE96D60B3C
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 21:28:00 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3c46686d1e6so877274f8f.3
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 14:28:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757626078; x=1758230878;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E1wjTe58CJ4GUwPDQ7VAmk1RiDxoyyCnoSaM9QhubDI=;
 b=r7j4wOgtI1B/QpE/hV8fWUrhfEF/k44Y/wQuk2zw2cXNlS0JdMw6sddSstFtI9HEfi
 eDeV3O65x3lbSocMuANWZvG8zhkScjDuRKu0ZAY6+pjP9rHY85r6PHF5LrExqH3kAUhj
 cSGG4wXfwvD7z+VOAFbK8q4U5fAh5CZLBRFhkE9rjRurJ92sJyNGP24Z/LjZwOi0BVnC
 RbOv42RrLLZyM4iFgBdJe/xJEzc8G+ufCbCm3BqNwD7MlkFdU7PIW0JxSxzA4LUKk/t0
 yGYj4ouoFshHcoAoPnn7FiqmLRwNJOrkQxJhENi7KmWAi+19+LQ44Ag3ro7bpZ5FX5n5
 uOWw==
X-Gm-Message-State: AOJu0YxBJugZ2YJsGarw1cGVgMdVkJYCO1DW+CWZX82vFF5EhXQYIzZK
 FlgVqTYbypWXiFGJZ/ASEkmjEd/xsXXohuDuSbtBJ7xPUliFl+jY9+pUoVTei1e6fATpENFq8Hr
 5Uncy1cQ=
X-Gm-Gg: ASbGncsF4ovcZW359kTCdN7jGdpX6IwJ72lqVVAS3Y+SD7aqoqdMi5/Ns6zSmPDeu9u
 evf64Zcnf27mXIpcXXSBVrzt9DSecd2gVfbhIApic3PJjlIl+bjtjGhH9+HRuZtYqK6sT6cjZ/6
 vt6APNi9nGNwB+Kf8RZkhdn/25pd0VWiVveTJyAxhPoYEmc2y6xCRvFYTZtDuidLvJJ7FWMTenl
 CBTj1xN0MKhXR1Yn/1XE0OPPqe/ii+WFX65BaUKt5Hp2irrc80lgapkQ8GK7WANjok0QyPt8ySP
 xHiM3D0xYoLhinS1v4r/9pDUl2p26wMvIsNmPxj8mB0viGP5CGtmHVTltspnPsVLORuWv79FASF
 EknSCfSKkbHDzSBNdEMyYgGe0XkxejxyHjg==
X-Google-Smtp-Source: AGHT+IFqBZ87cMDj+wT6Pf/X8oNcoaT+FgsRsSEdImNHiIkH3U5XPsiTY1KDLD2M0NhYWWYQQmE1Ow==
X-Received: by 2002:a05:6000:2403:b0:3e7:486b:45b0 with SMTP id
 ffacd0b85a97d-3e7658bc32dmr689941f8f.26.1757626078279; 
 Thu, 11 Sep 2025 14:27:58 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e015784c3sm43116205e9.10.2025.09.11.14.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 14:27:55 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 819D95F8AE;
 Thu, 11 Sep 2025 22:27:54 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 22:27:48 +0100
Message-ID: <20250911212752.266940-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250911212752.266940-1-alex.bennee@linaro.org>
References: <20250911212752.266940-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757626078; x=1758230878; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E1wjTe58CJ4GUwPDQ7VAmk1RiDxoyyCnoSaM9QhubDI=;
 b=MzPo+TW5xy1eLq0mZNR6XCMZKJbVqOpjJ7sfnzgWFRGgtXg6oFJWCDOpipR8dly+0s
 jUQe6R/DdiBaD0yBoC6bO45qQzQ0g3zLZmL3hshU5HACk+Ul07TlCm9eDmaI4tpNcAwv
 12vED5XD7CoML5Lt9O4oigkvo5XPR/yYwWjT59QyFoFhqeT+EpLBqHC2QKxRhnPtGrA7
 mIlPczaNYfNJVyd8MKXsqXbwHSBzW91sYrY0JUUoCL9ehyzY/Rw6dWnqOr2Gpny2VAAN
 uIliQJEaZgtvHn8LH9FkPWs5XUbDqcuUiM2QzEChGX4lsdJDZdzK3pg07RCA31coT6dc
 k1kg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=MzPo+TW5
Subject: [Buildroot] [PATCH v5 8/9] package/kvmtool: bump to current HEAD
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
Cc: Jesse Taube <jesse@rivosinc.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QnkgZG9pbmcgc28gd2UgY2FuIGFsc28gZHJvcCB0aGUgcGF0Y2hlcyBmb3IgbXVzbCB3aGljaCBo
YXZlIG5vdyBiZWVuCm1lcmdlZCB1cHN0cmVhbS4KClJldmlld2VkLWJ5OiBKZXNzZSBUYXViZSA8
amVzc2VAcml2b3NpbmMuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVu
bmVlQGxpbmFyby5vcmc+Ci0tLQogLi4uZS1oLWluY2x1c2lvbi1mb3ItbXVzbC1jb21wYXRpYmls
aXR5LnBhdGNoIHwgNTIgLS0tLS0tLS0tLS0tLS0tLS0tLQogcGFja2FnZS9rdm10b29sL2t2bXRv
b2wuaGFzaCAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIHBhY2thZ2Uva3ZtdG9vbC9rdm10b29s
Lm1rICAgICAgICAgICAgICAgICAgICB8ICAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgNTQgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgcGFja2FnZS9rdm10
b29sLzAwMDEtcmVtb3ZlLXdvcmRzaXplLWgtaW5jbHVzaW9uLWZvci1tdXNsLWNvbXBhdGliaWxp
dHkucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2t2bXRvb2wvMDAwMS1yZW1vdmUtd29yZHNp
emUtaC1pbmNsdXNpb24tZm9yLW11c2wtY29tcGF0aWJpbGl0eS5wYXRjaCBiL3BhY2thZ2Uva3Zt
dG9vbC8wMDAxLXJlbW92ZS13b3Jkc2l6ZS1oLWluY2x1c2lvbi1mb3ItbXVzbC1jb21wYXRpYmls
aXR5LnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAzMTI4YTIzNjg5Li4wMDAw
MDAwMDAwCi0tLSBhL3BhY2thZ2Uva3ZtdG9vbC8wMDAxLXJlbW92ZS13b3Jkc2l6ZS1oLWluY2x1
c2lvbi1mb3ItbXVzbC1jb21wYXRpYmlsaXR5LnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsNTIg
KzAsMCBAQAotRnJvbSAwNTkyZjhmODI5Yzg0M2ZmNWNiMmQxMDhjMzA5ZTMyZjRmNmY1Mzc5IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogQW5kcmUgUHJ6eXdhcmEgPGFuZHJlLnByenl3
YXJhQGFybS5jb20+Ci1EYXRlOiBUaHUsIDEgQXVnIDIwMjQgMTI6MTA6NTQgKzAxMDAKLVN1Ympl
Y3Q6IHJlbW92ZSB3b3Jkc2l6ZS5oIGluY2x1c2lvbiAoZm9yIG11c2wgY29tcGF0aWJpbGl0eSkK
LU1JTUUtVmVyc2lvbjogMS4wCi1Db250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRG
LTgKLUNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKLQotVGhlIHdvcmRzaXplLmggaGVh
ZGVyIGZpbGUgYW5kIHRoZSBfX1dPUkRTSVpFIGRlZmluaXRpb24gZG8gbm90IHNlZW0KLXRvIGJl
IHVuaXZlcnNhbCwgdGhlIG11c2wgbGliYyBmb3IgaW5zdGFuY2UgaGFzIHRoZSBkZWZpbml0aW9u
IGluIGEKLWRpZmZlcmVudCBoZWFkZXIgZmlsZS4gVGhpcyBicmVha3MgY29tcGlsYXRpb24gb2Yg
a3ZtdG9vbCBhZ2FpbnN0IG11c2wuCi0KLVRoZSB0d28gbGVhZGluZyB1bmRlcnNjb3JlcyBzdWdn
ZXN0IGEgY29tcGlsZXItaW50ZXJuYWwgc3ltYm9sIGFueXdheSwgc28KLWxldCdzIGp1c3QgcmVt
b3ZlIHRoYXQgcGFydGljdWxhciBtYWNybyB1c2FnZSBlbnRpcmVseSwgYW5kIHJlcGxhY2UgaXQK
LXdpdGggdGhlIG51bWJlciB3ZSByZWFsbHkgd2FudDogdGhlIHNpemUgb2YgYSAibG9uZyIgdHlw
ZS4KLQotUmVwb3J0ZWQtYnk6IEouIE5ldXNjaMOkZmVyIDxqLm5ldXNjaGFlZmVyQGdteC5uZXQ+
Ci1TaWduZWQtb2ZmLWJ5OiBBbmRyZSBQcnp5d2FyYSA8YW5kcmUucHJ6eXdhcmFAYXJtLmNvbT4K
LVJldmlld2VkLWJ5OiBBbGV4YW5kcnUgRWxpc2VpIDxhbGV4YW5kcnUuZWxpc2VpQGFybS5jb20+
Ci1MaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwODAxMTExMDU0LjgxODc2NS0x
LWFuZHJlLnByenl3YXJhQGFybS5jb20KLVNpZ25lZC1vZmYtYnk6IFdpbGwgRGVhY29uIDx3aWxs
QGtlcm5lbC5vcmc+Ci1VcHN0cmVhbTogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvd2lsbC9rdm10b29sLmdpdC9jb21taXQvP2lkPTA1OTJmOGY4MjljODQz
ZmY1Y2IyZDEwOGMzMDllMzJmNGY2ZjUzNzkKLVNpZ25lZC1vZmYtYnk6IFRob21hcyBQZXJhbGUg
PHRob21hcy5wZXJhbGVAbWluZC5iZT4KLS0tLQotIGluY2x1ZGUvbGludXgvYml0b3BzLmggfCA2
ICsrLS0tLQotIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
Ci0KLWRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2JpdG9wcy5oIGIvaW5jbHVkZS9saW51eC9i
aXRvcHMuaAotaW5kZXggYWUzMzkyMmYuLmVlOGZkNTYwIDEwMDY0NAotLS0tIGEvaW5jbHVkZS9s
aW51eC9iaXRvcHMuaAotKysrIGIvaW5jbHVkZS9saW51eC9iaXRvcHMuaAotQEAgLTEsMTUgKzEs
MTMgQEAKLSAjaWZuZGVmIF9LVk1fTElOVVhfQklUT1BTX0hfCi0gI2RlZmluZSBfS1ZNX0xJTlVY
X0JJVE9QU19IXwotIAotLSNpbmNsdWRlIDxiaXRzL3dvcmRzaXplLmg+Ci0tCi0gI2luY2x1ZGUg
PGxpbnV4L2tlcm5lbC5oPgotICNpbmNsdWRlIDxsaW51eC9jb21waWxlci5oPgotICNpbmNsdWRl
IDxhc20vaHdlaWdodC5oPgotIAotLSNkZWZpbmUgQklUU19QRVJfTE9ORyBfX1dPUkRTSVpFCi0g
I2RlZmluZSBCSVRTX1BFUl9CWVRFICAgICAgICAgICA4Ci0tI2RlZmluZSBCSVRTX1RPX0xPTkdT
KG5yKSAgICAgICBESVZfUk9VTkRfVVAobnIsIEJJVFNfUEVSX0JZVEUgKiBzaXplb2YobG9uZykp
Ci0rI2RlZmluZSBCSVRTX1BFUl9MT05HICAgICAgICAgICAoQklUU19QRVJfQllURSAqIHNpemVv
Zihsb25nKSkKLSsjZGVmaW5lIEJJVFNfVE9fTE9OR1MobnIpICAgICAgIERJVl9ST1VORF9VUChu
ciwgQklUU19QRVJfTE9ORykKLSAKLSAjZGVmaW5lIEJJVF9XT1JEKG5yKQkJKChucikgLyBCSVRT
X1BFUl9MT05HKQotIAotLS0gCi1jZ2l0IDEuMi4zLWtvcmcKLQpkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9rdm10b29sL2t2bXRvb2wuaGFzaCBiL3BhY2thZ2Uva3ZtdG9vbC9rdm10b29sLmhhc2gKaW5k
ZXggNjNiYmI3MTY3Yy4uOGRmNmY5MjlkZiAxMDA2NDQKLS0tIGEvcGFja2FnZS9rdm10b29sL2t2
bXRvb2wuaGFzaAorKysgYi9wYWNrYWdlL2t2bXRvb2wva3ZtdG9vbC5oYXNoCkBAIC0xLDMgKzEs
MyBAQAogIyBMb2NhbGx5IGNvbXB1dGVkCi1zaGEyNTYgIGE4NTA0ZDhiMTg0Y2FlNGU2NWZmNTU1
NWNjODRhNDM2ZjNmYmJjODMyYTgwMTdlM2NhNTlkOTk3ZGQ1NTgxZGIgIGt2bXRvb2wtNGQyYzAx
N2Y0MTUzM2IwZTUxZTAwZjY4OTA1MGMyNjE5MGExNTMxOC1naXQ0LnRhci5negorc2hhMjU2ICAx
ODg0MWM0MTRlODJiNDA1YTBiZDZmNWM1NDZiYzA4OGJlY2QyOThjMTE0NWEyYmFjOTc1NjNlNjk5
MjMxOTI1ICBrdm10b29sLTExMTdkYmM4Y2ViMjFhYmM2ZThjZDk4NjE0NTA2OTU5OTU4NTIyOTAt
Z2l0NC50YXIuZ3oKIHNoYTI1NiAgMGQ1YmYzNDZkZjllNjM1YTI5ZGNkZGRmODMyZGM1YjAwMmNh
NmNkYzFjNWM5YzZjNTY3ZDJhNjFiYjBjNWMxNSAgQ09QWUlORwpkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9rdm10b29sL2t2bXRvb2wubWsgYi9wYWNrYWdlL2t2bXRvb2wva3ZtdG9vbC5tawppbmRleCA3
ZmVjNjY0M2Y4Li5mNTYzN2U1Mzg0IDEwMDY0NAotLS0gYS9wYWNrYWdlL2t2bXRvb2wva3ZtdG9v
bC5taworKysgYi9wYWNrYWdlL2t2bXRvb2wva3ZtdG9vbC5tawpAQCAtNCw3ICs0LDcgQEAKICMK
ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLUtWTVRPT0xfVkVSU0lPTiA9IDRkMmMwMTdmNDE1
MzNiMGU1MWUwMGY2ODkwNTBjMjYxOTBhMTUzMTgKK0tWTVRPT0xfVkVSU0lPTiA9IDExMTdkYmM4
Y2ViMjFhYmM2ZThjZDk4NjE0NTA2OTU5OTU4NTIyOTAKIEtWTVRPT0xfU0lURSA9IGh0dHBzOi8v
Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3dpbGwva3ZtdG9vbC5naXQK
IEtWTVRPT0xfU0lURV9NRVRIT0QgPSBnaXQKIEtWTVRPT0xfREVQRU5ERU5DSUVTID0gXAotLSAK
Mi40Ny4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
