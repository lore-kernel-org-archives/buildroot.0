Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60FD8C4345F
	for <buildroot@archiver.kernel.org>; Fri, 26 Apr 2024 07:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14363605EA;
	Fri, 26 Apr 2024 07:13:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bFLUsZvSAqHN; Fri, 26 Apr 2024 07:13:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03659605EE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03659605EE;
	Fri, 26 Apr 2024 07:13:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 189301BF292
 for <buildroot@lists.busybox.net>; Fri, 26 Apr 2024 07:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02A7E400D1
 for <buildroot@lists.busybox.net>; Fri, 26 Apr 2024 07:13:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hqWI8RYBsJt6 for <buildroot@lists.busybox.net>;
 Fri, 26 Apr 2024 07:13:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=sairon@sairon.cz; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7BE70400B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BE70400B5
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7BE70400B5
 for <buildroot@buildroot.org>; Fri, 26 Apr 2024 07:13:52 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-572242ed990so1838085a12.0
 for <buildroot@buildroot.org>; Fri, 26 Apr 2024 00:13:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714115630; x=1714720430;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xf1BsXLdQIyDYvxWHWYnSuJCTVXTeAOCUG0on111Aqc=;
 b=q3M0fgVt0e3ETlnKALfwMGu2ip6m5QA/kSo2T6nQQXiippsn+gn6PosxoV8UkjTEsG
 MG4BiI7cM1sWqKLMCfrDRTVBZ6iXMZ8Wd05e/oWPzxG1eSRud/VvF8rxf/b2ZfWmT3f8
 FoFJh0eyQL2OFn0DQCtrXIL/Hmitwi8NHiYjoVSsscoa7NyRUbLYNk6SzlSIzOome/2r
 mDoiK6JYxyn+rvZ98rjDxPSQ0ySbJVajoC5UppEA7X62xx4BFsA4RuFyB6e2zLhFa/Dk
 5n91Fgl9QeUkx+IeWJcA1MEC9qA3c7lVTFil5PpqhhD9BAAXor9x9J8g7mOfxH3yh7sp
 eQNw==
X-Gm-Message-State: AOJu0Yyypnw9a072rY+sXfaM0/OM01QEidSb3EfszYDLraZp0wE0IQPc
 j2iPMYpLER28MJA889O2hayke9mMstmtS8TlH6hVmVIfJhA/eDH7YciJmbE2bShvS7f5fOQEvRB
 G
X-Google-Smtp-Source: AGHT+IEJ5WGzMiMPl/36t7p9hIx5dValhlve947ot+oK9BCx7vibadBAWvmsrzCAqW2zwp+vR2mxSA==
X-Received: by 2002:a50:ba88:0:b0:56b:9029:dd48 with SMTP id
 x8-20020a50ba88000000b0056b9029dd48mr1306403ede.5.1714115629850; 
 Fri, 26 Apr 2024 00:13:49 -0700 (PDT)
Received: from krabice.lan (ip-89-103-66-201.bb.vodafone.cz. [89.103.66.201])
 by smtp.gmail.com with ESMTPSA id
 q10-20020a056402248a00b0056fe7c5475bsm9723057eda.10.2024.04.26.00.13.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 00:13:49 -0700 (PDT)
From: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
To: buildroot@buildroot.org
Date: Fri, 26 Apr 2024 09:13:03 +0200
Message-Id: <20240426071304.2564147-1-sairon@sairon.cz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sairon.cz; s=google; t=1714115630; x=1714720430; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xf1BsXLdQIyDYvxWHWYnSuJCTVXTeAOCUG0on111Aqc=;
 b=eSLQ377kcsTk+52yRYhhbcO5Zzzb1ehJYp9J7RD0Zpgd1Yp0PYy9Ebn9KgWGtBGNhb
 NYR4obJBUDcG4STt1TBwNCAkMUEegYDXPfPyfbt7wpadaWs03AgIBtc8dVmMaUIRulsi
 0rwCHKe1R3lm2h41lJs9UgqVpnAdO7E//nBo5RfgADuIsEpuwtvuJH9rMdzehy6M9X+s
 ey7kQdhYYL9Pk12gSz+og9PboRmVefqIJE2dA38pPSY4j3kfwhgSqZcT78mxGfXwC2uK
 umXOr4iQuxFzzuqfG4Dr10wJ9Qcj3rgDZdGxdqTjOZEUV+u6xCjQM0W9wRvlB7bKsj8+
 zHPw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=sairon.cz
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sairon.cz header.i=@sairon.cz header.a=rsa-sha256
 header.s=google header.b=eSLQ377k
Subject: [Buildroot] [PATCH] package/linux-pam: bump to version 1.6.1
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
Cc: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QnVtcCB0byBsYXRlc3QgdmVyc2lvbiwgZml4aW5nIGNvdXBsZSBvZiBidWdzLiBSZW1vdmUgcGF0
Y2ggYWxyZWFkeQppbmNsdWRlZCBpbiB0aGlzIHJlbGVhc2UuCgpodHRwczovL2dpdGh1Yi5jb20v
bGludXgtcGFtL2xpbnV4LXBhbS9yZWxlYXNlcy90YWcvdjEuNi4xCgpTaWduZWQtb2ZmLWJ5OiBK
YW4gxIxlcm3DoWsgPHNhaXJvbkBzYWlyb24uY3o+Ci0tLQogLi4uLzAwMDEtcGFtX25hbWVzcGFj
ZS1pbmNsdWRlLXN0ZGludC1oLnBhdGNoIHwgNDIgLS0tLS0tLS0tLS0tLS0tLS0tLQogcGFja2Fn
ZS9saW51eC1wYW0vbGludXgtcGFtLmhhc2ggICAgICAgICAgICAgIHwgIDQgKy0KIHBhY2thZ2Uv
bGludXgtcGFtL2xpbnV4LXBhbS5tayAgICAgICAgICAgICAgICB8ICAyICstCiAzIGZpbGVzIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNDUgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2
NDQgcGFja2FnZS9saW51eC1wYW0vMDAwMS1wYW1fbmFtZXNwYWNlLWluY2x1ZGUtc3RkaW50LWgu
cGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpbnV4LXBhbS8wMDAxLXBhbV9uYW1lc3BhY2Ut
aW5jbHVkZS1zdGRpbnQtaC5wYXRjaCBiL3BhY2thZ2UvbGludXgtcGFtLzAwMDEtcGFtX25hbWVz
cGFjZS1pbmNsdWRlLXN0ZGludC1oLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCA1ZWRhNjE5NTA1Li4wMDAwMDAwMDAwCi0tLSBhL3BhY2thZ2UvbGludXgtcGFtLzAwMDEtcGFt
X25hbWVzcGFjZS1pbmNsdWRlLXN0ZGludC1oLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsNDIg
KzAsMCBAQAotRnJvbSBjYzlkNDBiN2NkYmQzZTE1Y2NhYTMyNGEwZGRhMTY4MGVmOWRlYTEzIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogSmFjb2IgSGVpZGVyIDxqYWNvYkBwa2d4LmRl
dj4KLURhdGU6IFdlZCwgMTcgSmFuIDIwMjQgMTE6NDk6MjYgLTA1MDAKLVN1YmplY3Q6IFtQQVRD
SF0gcGFtX25hbWVzcGFjZTogaW5jbHVkZSBzdGRpbnQuaAotCi1wYW1fbmFtZXNwYWNlLmMgbWFr
ZXMgdXNlIG9mIFNJWkVfTUFYIGJ1dCBkb2Vzbid0IGluY2x1ZGUgc3RkaW50LmgsCi1yZXN1bHRp
bmcgaW4gdGhlIGZvbGxvd2luZyBidWlsZCBmYWlsdXJlcyBvbiAxLjYuMDoKLQotICBwYW1fbmFt
ZXNwYWNlLmM6IEluIGZ1bmN0aW9uICdwcm9jZXNzX2xpbmUnOgotICBwYW1fbmFtZXNwYWNlLmM6
NjQ5OjQxOiBlcnJvcjogJ1NJWkVfTUFYJyB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcyBm
dW5jdGlvbikKLSAgICA2NDkgfCAgICAgICAgIGlmIChjb3VudCA+IFVJTlRfTUFYIHx8IGNvdW50
ID4gU0laRV9NQVggLyBzaXplb2YodWlkX3QpKSB7Ci0gICAgICAgIHwgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+Ci0gIHBhbV9uYW1lc3BhY2UuYzo0MTox
OiBub3RlOiAnU0laRV9NQVgnIGlzIGRlZmluZWQgaW4gaGVhZGVyICc8c3RkaW50Lmg+JzsgZGlk
IHlvdSBmb3JnZXQgdG8gJyNpbmNsdWRlIDxzdGRpbnQuaD4nPwotICAgICA0MCB8ICNpbmNsdWRl
ICJhcmd2X3BhcnNlLmgiCi0gICAgKysrIHwrI2luY2x1ZGUgPHN0ZGludC5oPgotICAgICA0MSB8
Ci0gIHBhbV9uYW1lc3BhY2UuYzo2NDk6NDE6IG5vdGU6IGVhY2ggdW5kZWNsYXJlZCBpZGVudGlm
aWVyIGlzIHJlcG9ydGVkIG9ubHkgb25jZSBmb3IgZWFjaCBmdW5jdGlvbiBpdCBhcHBlYXJzIGlu
Ci0gICAgNjQ5IHwgICAgICAgICBpZiAoY291bnQgPiBVSU5UX01BWCB8fCBjb3VudCA+IFNJWkVf
TUFYIC8gc2l6ZW9mKHVpZF90KSkgewotICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBefn5+fn5+fgotCi1GaXhlczogdjEuNi4wfjEwMCAoInBhbV9uYW1l
c3BhY2U6IHZhbGlkYXRlIGFtb3VudCBvZiB1aWRzIGluIGNvbmZpZyIpCi1SZXNvbHZlczogaHR0
cHM6Ly9naXRodWIuY29tL2xpbnV4LXBhbS9saW51eC1wYW0vaXNzdWVzLzczMwotCi1VcHN0cmVh
bTogaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LXBhbS9saW51eC1wYW0vY29tbWl0L2NjOWQ0MGI3
Y2RiZDNlMTVjY2FhMzI0YTBkZGExNjgwZWY5ZGVhMTMKLVNpZ25lZC1vZmYtYnk6IEZhYnJpY2Ug
Rm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgotLS0tCi0gbW9kdWxlcy9wYW1f
bmFtZXNwYWNlL3BhbV9uYW1lc3BhY2UuYyB8IDIgKysKLSAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspCi0KLWRpZmYgLS1naXQgYS9tb2R1bGVzL3BhbV9uYW1lc3BhY2UvcGFtX25hbWVz
cGFjZS5jIGIvbW9kdWxlcy9wYW1fbmFtZXNwYWNlL3BhbV9uYW1lc3BhY2UuYwotaW5kZXggZjcy
ZDY3MTg5Li5iMTY3MzFjMjIgMTAwNjQ0Ci0tLS0gYS9tb2R1bGVzL3BhbV9uYW1lc3BhY2UvcGFt
X25hbWVzcGFjZS5jCi0rKysgYi9tb2R1bGVzL3BhbV9uYW1lc3BhY2UvcGFtX25hbWVzcGFjZS5j
Ci1AQCAtMzQsNiArMzQsOCBAQAotIAotICNkZWZpbmUgX0FURklMRV9TT1VSQ0UKLSAKLSsjaW5j
bHVkZSAiY29uZmlnLmgiCi0rI2luY2x1ZGUgPHN0ZGludC5oPgotICNpbmNsdWRlICJwYW1fY2Nf
Y29tcGF0LmgiCi0gI2luY2x1ZGUgInBhbV9pbmxpbmUuaCIKLSAjaW5jbHVkZSAicGFtX25hbWVz
cGFjZS5oIgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saW51eC1wYW0vbGludXgtcGFtLmhhc2ggYi9w
YWNrYWdlL2xpbnV4LXBhbS9saW51eC1wYW0uaGFzaAppbmRleCBjZDg4MjcxNWNiLi4zNTM2MTNl
NmU2IDEwMDY0NAotLS0gYS9wYWNrYWdlL2xpbnV4LXBhbS9saW51eC1wYW0uaGFzaAorKysgYi9w
YWNrYWdlL2xpbnV4LXBhbS9saW51eC1wYW0uaGFzaApAQCAtMSw2ICsxLDYgQEAKICMgTG9jYWxs
eSBjb21wdXRlZCBoYXNoZXMgYWZ0ZXIgY2hlY2tpbmcgc2lnbmF0dXJlIGF0Ci0jIGh0dHBzOi8v
Z2l0aHViLmNvbS9saW51eC1wYW0vbGludXgtcGFtL3JlbGVhc2VzL2Rvd25sb2FkL3YxLjYuMC9M
aW51eC1QQU0tMS42LjAudGFyLnh6LmFzYworIyBodHRwczovL2dpdGh1Yi5jb20vbGludXgtcGFt
L2xpbnV4LXBhbS9yZWxlYXNlcy9kb3dubG9hZC92MS42LjEvTGludXgtUEFNLTEuNi4xLnRhci54
ei5hc2MKICMgc2lnbmVkIHdpdGggdGhlIGtleSA4QzZCRkQ5MkVFMEY0MkVERjkxQTZBNzM2RDFB
N0YwNTJFNTkyNEJCCi1zaGEyNTYgIGZmZjRhMzRlNWJiZWU3N2UyZThmMTk5MmYyNzYzMWUyMzI5
YmNiZjhhMDU2M2RkZWI1YzMzODliNGUzMTY5YWQgIExpbnV4LVBBTS0xLjYuMC50YXIueHoKK3No
YTI1NiAgZjg5MjNjNzQwMTU5MDUyZDcxOWRiZmMyYTJmODE5NDJkNjhkZDM0ZmNhZjYxYzcwNmEw
MmM5YjgwZmVlZWY4ZSAgTGludXgtUEFNLTEuNi4xLnRhci54egogIyBMb2NhbGx5IGNvbXB1dGVk
CiBzaGEyNTYgIDEzM2Q5OGU3YTJhYjNmZmQzMzBiNGRlYmIwYmZjMTBmZWEyMWU0YjJiNWE1YjA5
ZGUyZTkyNDI5M2JlNWZmMDggIENvcHlyaWdodApkaWZmIC0tZ2l0IGEvcGFja2FnZS9saW51eC1w
YW0vbGludXgtcGFtLm1rIGIvcGFja2FnZS9saW51eC1wYW0vbGludXgtcGFtLm1rCmluZGV4IDg5
YTQ2ZTgxZGYuLmEyMDVkNjdjNTQgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbGludXgtcGFtL2xpbnV4
LXBhbS5taworKysgYi9wYWNrYWdlL2xpbnV4LXBhbS9saW51eC1wYW0ubWsKQEAgLTQsNyArNCw3
IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1MSU5VWF9QQU1fVkVSU0lPTiA9IDEu
Ni4wCitMSU5VWF9QQU1fVkVSU0lPTiA9IDEuNi4xCiBMSU5VWF9QQU1fU09VUkNFID0gTGludXgt
UEFNLSQoTElOVVhfUEFNX1ZFUlNJT04pLnRhci54egogTElOVVhfUEFNX1NJVEUgPSBodHRwczov
L2dpdGh1Yi5jb20vbGludXgtcGFtL2xpbnV4LXBhbS9yZWxlYXNlcy9kb3dubG9hZC92JChMSU5V
WF9QQU1fVkVSU0lPTikKIExJTlVYX1BBTV9JTlNUQUxMX1NUQUdJTkcgPSBZRVMKLS0gCjIuMzQu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
