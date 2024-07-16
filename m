Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B706C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 05:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 043A3812F1;
	Tue, 16 Jul 2024 05:49:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gj-Q9uQO31Se; Tue, 16 Jul 2024 05:49:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDCCC80DBD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDCCC80DBD;
	Tue, 16 Jul 2024 05:49:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DF3271BF312
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 05:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC1FA40457
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 05:49:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EeDw3rK6i5i7 for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 05:49:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=gael.portay@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4DB7640010
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DB7640010
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4DB7640010
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 05:49:53 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-368255de9ebso190590f8f.1
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 22:49:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721108991; x=1721713791;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tZNCRQRDgjj4/4NjWFPhlmaYr/HZ+uCCtZ33rpmm+HA=;
 b=iU1kUSvNLt0gE5EgOeKU/glYnqQKbvaZ5iJQt5jFC3NWnu0pnw5OFp741bgrZ/OMaQ
 G509sWvVl9nTrk6b8eyg8G97Co9s3gUIY9cS6NkUU+5Fcy0YGl4R8li/7BUsdpPaEqvq
 jx1GXg/eP8Oy/GShDiqscx44yfbHXsGAtNbyOoMcX1cdT6/9ikXeToA7JpRsfWORd9f2
 +ypL6vin2EV+m2oARCci1heisf2jSEhcx4FBRiqI2iUMJvYQnSCN2e+38ei0eHCnFmeX
 PNw9tXq9bYeB4WWInW8Hx7O+d4kCLCEl9rLkp/YsqKkzsNEZEH71lpUH1FwBC7/YSUp4
 qNDA==
X-Gm-Message-State: AOJu0Yy2rzYltucPXUFuzI81zB/S37Mudw5aOYCfhr5XonwQJq9HELdM
 DilnushI3xhJ6YT7Jri4cJnn19iVfzaArbT5bPgD8Dwu3lIkwS8ZxzGP7a46
X-Google-Smtp-Source: AGHT+IHN8tgdHmlJU+vU17gSUapBqj4fOG9oV6OZsqBMTyrzPAX21fBRoMN7ao/p/DvesUIe3cKSZw==
X-Received: by 2002:a5d:6910:0:b0:360:728d:8439 with SMTP id
 ffacd0b85a97d-3682737acacmr514365f8f.2.1721108990861; 
 Mon, 15 Jul 2024 22:49:50 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680dafb979sm8063615f8f.75.2024.07.15.22.49.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 22:49:50 -0700 (PDT)
From: "=?UTF-8?q?Ga=C3=ABl=20PORTAY?=" <gael.portay@gmail.com>
X-Google-Original-From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Tue, 16 Jul 2024 07:49:40 +0200
Message-ID: <20240716054940.93558-1-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721108991; x=1721713791; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tZNCRQRDgjj4/4NjWFPhlmaYr/HZ+uCCtZ33rpmm+HA=;
 b=TgxUmcLoTepJ58qhr4LDuhTZzcW2kOwZgBLrsXnd5SGnNtR4LBfpvsTbDny0Fd9+zD
 hgPuuunx4K6GY3IR/fA9eoNSIDbNBQSVzu0YPRcKsQfHSRtf/79L9X/uGrTOHZe4K/qx
 /hXxM9xdtkXoV4MmqzksmVmyywPgUQmFsJTPoRiwyMMcT7kZHpxeHYy0eedg3AXLDHP2
 tV7vBMM1nnBxG231seu/Vkv9E104pULudcCZieYfjZ4oEnRDM8CpnoL5Z6rqoIW+tyVl
 ZJgYWxALVrJ2y/QNMTSjjlare1gkmbGk9SVCVewmNxBraUAraMYYjLKLy8vRfHXyAGLe
 B2nw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TgxUmcLo
Subject: [Buildroot] [RESEND PATCH 1/1] board/raspberrypi*: remove dtparam
 krnbt=on
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>,
 Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGNvbmZpZy50eHQgb2YgdGhlIFJhc3BlcnJ5IFBpJ3Mgc3VwcG9ydGluZyBXaS1GaSBhbmQg
Qmx1ZXRvb3RoIChpLmUuCnplcm8gVywgemVybyAyIFcsIDMsIGFuZCA0KSBzd2l0Y2ggdGhlIEJs
dWV0b290aCBmdW5jdGlvbiB0byB1c2UgdGhlCm1pbmktVUFSVCAodHR5UzApIGFuZCByZXN0b3Jl
IFVBUlQwICh0dHlBTUEwKSBvdmVyIHRoZSBHUElPcyAxNCBhbmQgMTUKKGFzIHBlciBtaW5pdWFy
dC1idC1vdmVybGF5LmR0c1sxXSkuIEFsbCBvZiB0aGVtIHR1cm4gIm9uIiB0aGUgcGFyYW1ldGVy
CmtybmJ0IHRvIGF1dG9wcm9iZSB0aGUgYmx1ZXRvb3RoIGRyaXZlci4KCkFjY29yZGluZyB0byB0
aGUgUkVBRE1FLm1kLCB0aGUgZHRwYXJhbSBrcm5idCBpcyBub3cgZGVmYXVsdGluZyB0byAib24i
CnNpbmNlIGxpbnV4LXJhc3BiZXJyeXBpIDYuMS55WzJdOyBpdCB3YXMgZGVmYXVsdGluZyB0byAi
b2ZmIiBiZWZvcmVbM10uCgpUaGlzIHJlbW92ZXMgdGhlIGR0cGFyYW09a3JuYnQ9b24gZnJvbSB0
aGVzZSBjb25maWcudHh0IGZpbGVzIHNpbmNlIHRoZQp2YWx1ZSBzZXQgaXMgYWN0dWFsbHkgdGhl
IGRlZmF1bHQgdmFsdWUuCgpbMV06IGh0dHBzOi8vZ2l0aHViLmNvbS9yYXNwYmVycnlwaS9saW51
eC9ibG9iL3JwaS02LjEueS9hcmNoL2FybS9ib290L2R0cy9vdmVybGF5cy9taW5pdWFydC1idC1v
dmVybGF5LmR0cwpbMl06IGh0dHBzOi8vZ2l0aHViLmNvbS9yYXNwYmVycnlwaS9saW51eC9ibG9i
L3JwaS02LjEueS9hcmNoL2FybS9ib290L2R0cy9vdmVybGF5cy9SRUFETUUjTDI5NC1MMjk2Clsz
XTogaHR0cHM6Ly9naXRodWIuY29tL3Jhc3BiZXJyeXBpL2xpbnV4L2Jsb2IvcnBpLTUuMTAueS9h
cmNoL2FybS9ib290L2R0cy9vdmVybGF5cy9SRUFETUUjTDIxMy1MMjE1CgpTaWduZWQtb2ZmLWJ5
OiBHYcOrbCBQT1JUQVkgPGdhZWwucG9ydGF5QHJ0b25lLmZyPgotLS0KSGVsbG8sCgpNeSBhcG9s
b2dpZXMgZm9yIHRoZSByZXNlbnQsIEkgd2FzIG5vdCBtZW1iZXIgb2YgdGhlIE1MIGF0IHRoZSB0
aW1lIEkKc2VudCB0aGUgcGF0Y2guCgpSZWdhcmRzLApHYcOrbAoKIGJvYXJkL3Jhc3BiZXJyeXBp
L2NvbmZpZ18wdy50eHQgICAgICB8IDMgLS0tCiBib2FyZC9yYXNwYmVycnlwaS9jb25maWdfMy50
eHQgICAgICAgfCAzIC0tLQogYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnXzNfNjRiaXQudHh0IHwg
MyAtLS0KIGJvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ180LnR4dCAgICAgICB8IDMgLS0tCiBib2Fy
ZC9yYXNwYmVycnlwaS9jb25maWdfNF82NGJpdC50eHQgfCAzIC0tLQogYm9hcmQvcmFzcGJlcnJ5
cGkvY29uZmlnX3plcm8ydy50eHQgIHwgMyAtLS0KIDYgZmlsZXMgY2hhbmdlZCwgMTggZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnXzB3LnR4dCBiL2Jv
YXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ18wdy50eHQKaW5kZXggYmM1OWQ1ZmFkMi4uNzcxYjk3NTA0
NiAxMDA2NDQKLS0tIGEvYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnXzB3LnR4dAorKysgYi9ib2Fy
ZC9yYXNwYmVycnlwaS9jb25maWdfMHcudHh0CkBAIC0yNCw2ICsyNCwzIEBAIGdwdV9tZW1fMTAy
ND0xMDAKIAogIyBmaXhlcyBycGkgKDNCLCAzQissIDNBKywgNEIgYW5kIFplcm8gVykgdHR5QU1B
MCBzZXJpYWwgY29uc29sZQogZHRvdmVybGF5PW1pbml1YXJ0LWJ0Ci0KLSMgZW5hYmxlIGF1dG9w
cm9iaW5nIG9mIEJsdWV0b290aCBkcml2ZXIgd2l0aG91dCBuZWVkIG9mIGhjaWF0dGFjaC9idGF0
dGFjaAotZHRwYXJhbT1rcm5idD1vbgpkaWZmIC0tZ2l0IGEvYm9hcmQvcmFzcGJlcnJ5cGkvY29u
ZmlnXzMudHh0IGIvYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnXzMudHh0CmluZGV4IGJjNTlkNWZh
ZDIuLjc3MWI5NzUwNDYgMTAwNjQ0Ci0tLSBhL2JvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ18zLnR4
dAorKysgYi9ib2FyZC9yYXNwYmVycnlwaS9jb25maWdfMy50eHQKQEAgLTI0LDYgKzI0LDMgQEAg
Z3B1X21lbV8xMDI0PTEwMAogCiAjIGZpeGVzIHJwaSAoM0IsIDNCKywgM0ErLCA0QiBhbmQgWmVy
byBXKSB0dHlBTUEwIHNlcmlhbCBjb25zb2xlCiBkdG92ZXJsYXk9bWluaXVhcnQtYnQKLQotIyBl
bmFibGUgYXV0b3Byb2Jpbmcgb2YgQmx1ZXRvb3RoIGRyaXZlciB3aXRob3V0IG5lZWQgb2YgaGNp
YXR0YWNoL2J0YXR0YWNoCi1kdHBhcmFtPWtybmJ0PW9uCmRpZmYgLS1naXQgYS9ib2FyZC9yYXNw
YmVycnlwaS9jb25maWdfM182NGJpdC50eHQgYi9ib2FyZC9yYXNwYmVycnlwaS9jb25maWdfM182
NGJpdC50eHQKaW5kZXggNjY3Mjg3MTEyNS4uYWM1YTA5YzQ4NiAxMDA2NDQKLS0tIGEvYm9hcmQv
cmFzcGJlcnJ5cGkvY29uZmlnXzNfNjRiaXQudHh0CisrKyBiL2JvYXJkL3Jhc3BiZXJyeXBpL2Nv
bmZpZ18zXzY0Yml0LnR4dApAQCAtMjUsOCArMjUsNSBAQCBncHVfbWVtXzEwMjQ9MTAwCiAjIGZp
eGVzIHJwaSAoM0IsIDNCKywgM0ErLCA0QiBhbmQgWmVybyBXKSB0dHlBTUEwIHNlcmlhbCBjb25z
b2xlCiBkdG92ZXJsYXk9bWluaXVhcnQtYnQKIAotIyBlbmFibGUgYXV0b3Byb2Jpbmcgb2YgQmx1
ZXRvb3RoIGRyaXZlciB3aXRob3V0IG5lZWQgb2YgaGNpYXR0YWNoL2J0YXR0YWNoCi1kdHBhcmFt
PWtybmJ0PW9uCi0KICMgZW5hYmxlIDY0Yml0cyBzdXBwb3J0CiBhcm1fNjRiaXQ9MQpkaWZmIC0t
Z2l0IGEvYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnXzQudHh0IGIvYm9hcmQvcmFzcGJlcnJ5cGkv
Y29uZmlnXzQudHh0CmluZGV4IDc0YTdiMjcwY2QuLjAxZjYwMzk1YjMgMTAwNjQ0Ci0tLSBhL2Jv
YXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ180LnR4dAorKysgYi9ib2FyZC9yYXNwYmVycnlwaS9jb25m
aWdfNC50eHQKQEAgLTI0LDYgKzI0LDMgQEAgZ3B1X21lbV8xMDI0PTEwMAogCiAjIGZpeGVzIHJw
aSAoM0IsIDNCKywgM0ErLCA0QiBhbmQgWmVybyBXKSB0dHlBTUEwIHNlcmlhbCBjb25zb2xlCiBk
dG92ZXJsYXk9bWluaXVhcnQtYnQKLQotIyBlbmFibGUgYXV0b3Byb2Jpbmcgb2YgQmx1ZXRvb3Ro
IGRyaXZlciB3aXRob3V0IG5lZWQgb2YgaGNpYXR0YWNoL2J0YXR0YWNoCi1kdHBhcmFtPWtybmJ0
PW9uCmRpZmYgLS1naXQgYS9ib2FyZC9yYXNwYmVycnlwaS9jb25maWdfNF82NGJpdC50eHQgYi9i
b2FyZC9yYXNwYmVycnlwaS9jb25maWdfNF82NGJpdC50eHQKaW5kZXggYTRhZTMyN2QyYS4uMTM5
ZjZhODc4OCAxMDA2NDQKLS0tIGEvYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnXzRfNjRiaXQudHh0
CisrKyBiL2JvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ180XzY0Yml0LnR4dApAQCAtMjUsOCArMjUs
NSBAQCBncHVfbWVtXzEwMjQ9MTAwCiAjIGZpeGVzIHJwaSAoM0IsIDNCKywgM0ErLCA0QiBhbmQg
WmVybyBXKSB0dHlBTUEwIHNlcmlhbCBjb25zb2xlCiBkdG92ZXJsYXk9bWluaXVhcnQtYnQKIAot
IyBlbmFibGUgYXV0b3Byb2Jpbmcgb2YgQmx1ZXRvb3RoIGRyaXZlciB3aXRob3V0IG5lZWQgb2Yg
aGNpYXR0YWNoL2J0YXR0YWNoCi1kdHBhcmFtPWtybmJ0PW9uCi0KICMgZW5hYmxlIDY0Yml0cyBz
dXBwb3J0CiBhcm1fNjRiaXQ9MQpkaWZmIC0tZ2l0IGEvYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmln
X3plcm8ydy50eHQgYi9ib2FyZC9yYXNwYmVycnlwaS9jb25maWdfemVybzJ3LnR4dAppbmRleCA1
NTA5NWY2NGE3Li4xNTFlNDQ2YjVkIDEwMDY0NAotLS0gYS9ib2FyZC9yYXNwYmVycnlwaS9jb25m
aWdfemVybzJ3LnR4dAorKysgYi9ib2FyZC9yYXNwYmVycnlwaS9jb25maWdfemVybzJ3LnR4dApA
QCAtMjQsNiArMjQsMyBAQCBncHVfbWVtXzEwMjQ9MTAwCiAKICMgZml4ZXMgcnBpICgzQiwgM0Ir
LCAzQSssIDRCICx6ZXJvIFcgYW5kIHplcm8gMikgdHR5QU1BMCBzZXJpYWwgY29uc29sZQogZHRv
dmVybGF5PW1pbml1YXJ0LWJ0Ci0KLSMgZW5hYmxlIGF1dG9wcm9iaW5nIG9mIEJsdWV0b290aCBk
cml2ZXIgd2l0aG91dCBuZWVkIG9mIGhjaWF0dGFjaC9idGF0dGFjaAotZHRwYXJhbT1rcm5idD1v
bgotLSAKMi40NS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
