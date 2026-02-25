Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE934F4BB9A
	for <buildroot@archiver.kernel.org>; Wed, 25 Feb 2026 10:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB7D060DE6;
	Wed, 25 Feb 2026 10:55:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eN3poEaCnKg4; Wed, 25 Feb 2026 10:55:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBAC560FB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772016946;
	bh=UeSaxPCzWUp3oUfG13dncw3TXqikdX2UtqiyY++MBE4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ADQHwEiXnY5AKCR+TzWPYu5mhwKRKO6zDysCxMjqhqiBkLSbZ3UEcKNs8v+MNpHfJ
	 l1kV2GqpfCorpE88bZpX/V2rClWUsGcFrCfFgcRP3WWa7DAGwmKZlP57TXeuL7eOKy
	 Vf+RNwJ5sl8WmrgYh0bBnKqOf3+iK7k5J8IF/ZfXJYLfbWK1bXPkW82G7vxf2A28Pi
	 lZwjsM4iBcw3h0z3tGTuA0iaDRoXMmJXKMdBZ6RGtKFvDgp+3LnzjP9WRFRAg3LgHq
	 LctTBYiUoSCmwrXFSxHokvDNI7J2HPBC1fjNgou8IZh15Griv4CK+kZLhhZNxBR+CB
	 rHRNy+YsKO4uA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBAC560FB4;
	Wed, 25 Feb 2026 10:55:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D7F9724E
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 10:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDD8560FB4
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 10:55:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aP4FOAlxuzel for <buildroot@buildroot.org>;
 Wed, 25 Feb 2026 10:55:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::642; helo=mail-ej1-x642.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8A56160DE6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A56160DE6
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A56160DE6
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 10:55:42 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id
 a640c23a62f3a-b79f8f7ea43so1059604266b.2
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 02:55:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772016940; x=1772621740;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WV3VWjDuBNPt1d6MYicYF/fKVEzku+lzcI80gs83Fk4=;
 b=kLIgiKNAVnLyzqjh/qHj3B1e/lF21ICbdaB8x6RFJmhKdqeyFgPYC5jLr4nNnLCFJY
 fS9HgbUuZRDu3fCtm/WdgpKj7lOHWBvRxZtanBA3fP9fryzzww1qUX9gKF53SDIzcdqQ
 2evoVRlU2XLH+QBjUrAEdf7gvoVQpENqhD/Krnq9VSUC135tOJgWy8Qf8jhan7nB45kd
 d0CxZsAqCjv/G+9W0MXxGfW6bfadCMS2fxH7KDyxWwHC/mclXeqD6JK65yX5tlBtp6K0
 f68cOca7M//yTJS7+qoT3O9I4O0lMoTFjwbgzag6wfR6Qjy3UvjqYtOP0w7YlZdPRpSd
 MWVQ==
X-Gm-Message-State: AOJu0Yy3iPmzFiJzhYT/yno5w18qW4AcUA+eC0gmgLUpdC9MivlJoIqf
 0ZmpRXeGqc3qP/ZyTO08eLDtYDxN6R2I75tJRFxQtrwy69vLDGieopYOOdKeXxZTWbbKtr40++j
 LKxBy
X-Gm-Gg: ATEYQzyG6y2ziz8/KVugql2rb6zJOQo3tC+ofz5z5jXW3ea4h6/uesluHV3KyNkTXEE
 xnsBfyD9K4sOn8cSat6aaGaB3d7K06eqijje8Gf1bIYz93Rnuw0Vy/1qsKS59ynh4hEdxXJS88e
 i6uGBLfFv0DeDLlMMJMeFz350nVd4U1nU6yDRyWa/31ZWkUma6BP/XHwkOxHm40IGm4q96/5S/5
 oA34Ua76wa4YhEGxHihSwexhFUDlGGTyW3wPd9orFhTVw+E5lO0QuVOFZVw9GCJDm/nEUJK4PEa
 ONJVLwyssckYu+gJiX2br8LKUd2tHtCPtX7tLpVSToggoRf7+kp+iSnD0YTFFiXkNnE42jXYCAe
 T3It5Lmwg/ob+tI5UEyBLu1rFMKeZfShKH/dzJjECjV+NOrq1x0B6xtUU85tMGP68qt8pE0dnAp
 eCF8qPpmKIII4XIzfh0xBm8eI=
X-Received: by 2002:a17:907:9483:b0:b8d:c595:828 with SMTP id
 a640c23a62f3a-b90819d371fmr1081335366b.14.1772016939700; 
 Wed, 25 Feb 2026 02:55:39 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9084c824e0sm510661566b.22.2026.02.25.02.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 02:55:38 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 235EE5F8BC;
 Wed, 25 Feb 2026 10:55:38 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Wed, 25 Feb 2026 10:55:31 +0000
Message-ID: <20260225105537.1420002-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260225105537.1420002-1-alex.bennee@linaro.org>
References: <20260225105537.1420002-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772016940; x=1772621740; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WV3VWjDuBNPt1d6MYicYF/fKVEzku+lzcI80gs83Fk4=;
 b=EatdDp6GwdItGcQLhMHb7qHpEdR25+q3DVv1ftrbrDBFfs159vjfnxbQMxhZfGgghM
 HKM3K5JGJ9er3WPqt4bg0JK+xG+uyQvgtqcdVnrKMLC3dbYr1Rij2XKVNjnGqPh0J3Uw
 UwNmHGZpMzisrX/m957KsYLhiyBJqrgZbZ5dmXvlbvAl+rZCREcIqWNHG6HghrWsP5e2
 q8yqq8Q3Sk5Oo/tQ2joxQh5+p5yyQ9eqCgZCnydQ7GoUex7LD3IbkHhofiVZPI+Qq0Ik
 AvOCu+MVEzbC1oBKzgwhy5AY4g9HeOkFq9RhSWmKQ9ivfV4fuXz2cp7Q9tpnX0EPLvyz
 XewA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=EatdDp6G
Subject: [Buildroot] [PATCH v6 2/6] package/kvm-unit-tests: update
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
Cc: Thomas Huth <th.huth@posteo.eu>, Thomas Huth <th.huth+br@posteo.eu>,
 Cyril Bur <cyrilbur@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VG8gcnVuIHRoZSB0ZXN0cyB3ZSBuZWVkIGEgc3lzdGVtIFFFTVUsIHRpbWVvdXQsIGdldGNvbmYg
YW5kIG5tYXAtbmNhdApzbyB1cGRhdGUgdGhlIHNlbGVjdC9kZXBlbmRzIGZvciB0aGVtLiBBcyB3
ZSBuZWVkIGF0IGxlYXN0IEdDQyA4IHdlCmNhbiBkcm9wIHRoZSBzcGVjaWZpYyByZXF1aXJlbWVu
dCBmb3Igb2xkIHg4Ni02NCB0ZXN0cy4KClNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxl
eC5iZW5uZWVAbGluYXJvLm9yZz4KUmV2aWV3ZWQtYnk6IFRob21hcyBIdXRoIDx0aC5odXRoQHBv
c3Rlby5ldT4KCi0tLQp2MgogIC0gcmVtb3ZlIG9sZCBnY2Mgbm90ZXMgYXMgd2UgbmVlZCBhdCBs
ZWFzdCA4IGFueXdheQogIC0gc2VsZWN0IFFFTVUgYW5kIG90aGVyIHJ1bnRpbWUgZGVwcwogIC0g
bWVudGlvbiB0aGUgcnVudGltZSBkZXBzCiAgLSBhZGQgc3VwcG9ydCBmb3IgZ2V0Y29uZiBmcm9t
IGV4dGVybmFsIHRvb2xjaGFpbgogIC0gdXBkYXRlIGNvbW1lbnQgZmFsbGJhY2sKdjUKICAtIGtl
ZXAgaTM4Ni94ODYtNjQgdGFyZ2V0L2hvc3QgY29tbWVudHMKICAtIGFkZCAhQlIyX1BBQ0tBR0Vf
UUVNVV9BUkNIX1NVUFBPUlRTX1RBUkdFVCB0byBjb21tZW50IGRlcHMKLS0tCiBwYWNrYWdlL2t2
bS11bml0LXRlc3RzL0NvbmZpZy5pbiB8IDIzICsrKysrKysrKysrKysrKysrKy0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9wYWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbiBiL3BhY2thZ2Uva3ZtLXVuaXQtdGVz
dHMvQ29uZmlnLmluCmluZGV4IDgxN2QzYzRhOGYuLjc0YzMyZjQ2ZTAgMTAwNjQ0Ci0tLSBhL3Bh
Y2thZ2Uva3ZtLXVuaXQtdGVzdHMvQ29uZmlnLmluCisrKyBiL3BhY2thZ2Uva3ZtLXVuaXQtdGVz
dHMvQ29uZmlnLmluCkBAIC0xNiwxMSArMTYsMjAgQEAgY29uZmlnIEJSMl9QQUNLQUdFX0tWTV9V
TklUX1RFU1RTX0FSQ0hfU1VQUE9SVFMKIGNvbmZpZyBCUjJfUEFDS0FHRV9LVk1fVU5JVF9URVNU
UwogCWJvb2wgImt2bS11bml0LXRlc3RzIgogCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfS1ZNX1VO
SVRfVEVTVFNfQVJDSF9TVVBQT1JUUwotCSMgb24gaTM4NiBhbmQgeDg2LTY0LCBfX2J1aWx0aW5f
cmVhY2hhYmxlIGlzIHVzZWQsIHNvIHdlIG5lZWQKLQkjIGdjYyA0LjUgYXQgbGVhc3QuIG9uIGkz
ODYsIHdlIHVzZSB0aGUgdGFyZ2V0IGdjYywgd2hpbGUgb24KKwkjIE9uIGkzODYsIHdlIHVzZSB0
aGUgdGFyZ2V0IGdjYywgd2hpbGUgb24KIAkjIHg4Ni02NCB3ZSB1c2UgdGhlIGhvc3QgZ2NjIChz
ZWUgLm1rIGZpbGUgZm9yIGRldGFpbHMpCi0JZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0dDQ19B
VF9MRUFTVF80XzUgfHwgIUJSMl9pMzg2CiAJZGVwZW5kcyBvbiBCUjJfSE9TVEFSQ0ggPSAieDg2
XzY0IiB8fCAhQlIyX3g4Nl82NAorCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVB
U1RfOCAjIHFlbXUKKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX1FFTVVfQVJDSF9TVVBQT1JUU19U
QVJHRVQKKwlkZXBlbmRzIG9uIChCUjJfUEFDS0FHRV9HTElCQ19VVElMUyB8fCBcCisJCSAgICBC
UjJfVUNMSUJDX0lOU1RBTExfVVRJTFMgfHwgXAorCQkgICAgQlIyX1RPT0xDSEFJTl9FWFRFUk5B
TF9MSUJDX1VUSUxTX0NPUFkpICMgcnVudGltZSBnZXRjb25mCisJc2VsZWN0IEJSMl9QQUNLQUdF
X1FFTVUKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfUUVNVV9TWVNURU0gIyBydW50aW1lIGZvciBxZW11
LXN5c3RlbS0kQVJDSAorCXNlbGVjdCBCUjJfUEFDS0FHRV9DT1JFVVRJTFMgIyBydW50aW1lIGZv
ciB0aW1lb3V0CisJc2VsZWN0IEJSMl9QQUNLQUdFX0JBU0ggIyBydW50aW1lCisJc2VsZWN0IEJS
Ml9QQUNLQUdFX05NQVAKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTk1BUF9OQ0FUICMgcnVudGltZSBm
b3IgbmNhdAogCXNlbGVjdCBCUjJfSE9TVEFSQ0hfTkVFRFNfSUEzMl9DT01QSUxFUiBpZiBCUjJf
eDg2XzY0CiAJaGVscAogCSAga3ZtLXVuaXQtdGVzdHMgaXMgYSBwcm9qZWN0IGFzIG9sZCBhcyBL
Vk0uIEFzIGl0cyBuYW1lCkBAIC00MCw2ICs0OSwxMCBAQCBjb25maWcgQlIyX1BBQ0tBR0VfS1ZN
X1VOSVRfVEVTVFMKIAogCSAgaHR0cDovL3d3dy5saW51eC1rdm0ub3JnL3BhZ2UvS1ZNLXVuaXQt
dGVzdHMKIAotY29tbWVudCAia3ZtLXVuaXQtdGVzdHMgbmVlZHMgYSB0b29sY2hhaW4gdy8gZ2Nj
ID49IDQuNSIKK2NvbW1lbnQgImt2bS11bml0LXRlc3RzIG5lZWRzIGEgdG9vbGNoYWluIHcvIHV0
aWxzLCBnY2MgPj0gOCBhbmQgcWVtdSIKIAlkZXBlbmRzIG9uIEJSMl9pMzg2Ci0JZGVwZW5kcyBv
biAhQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfNF81CisJZGVwZW5kcyBvbiAhQlIyX1RPT0xD
SEFJTl9HQ0NfQVRfTEVBU1RfOAorCWRlcGVuZHMgb24gIShCUjJfUEFDS0FHRV9HTElCQ19VVElM
UyB8fCBcCisJCUJSMl9VQ0xJQkNfSU5TVEFMTF9VVElMUyB8fCBcCisJCUJSMl9UT09MQ0hBSU5f
RVhURVJOQUxfTElCQ19VVElMU19DT1BZKQorCWRlcGVuZHMgb24gIUJSMl9QQUNLQUdFX1FFTVVf
QVJDSF9TVVBQT1JUU19UQVJHRVQKLS0gCjIuNDcuMwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
