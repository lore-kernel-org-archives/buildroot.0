Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73788C369B2
	for <buildroot@archiver.kernel.org>; Thu, 17 Apr 2025 12:53:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E09C770388;
	Thu, 17 Apr 2025 12:53:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rCG6OTaNtWdN; Thu, 17 Apr 2025 12:53:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08D8A70385
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08D8A70385;
	Thu, 17 Apr 2025 12:53:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A987E11B
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 12:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9AB3A423E6
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 12:53:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BT2fMfkKvVo5 for <buildroot@buildroot.org>;
 Thu, 17 Apr 2025 12:53:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 84F8142413
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84F8142413
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 84F8142413
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 12:53:09 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3995ff6b066so424471f8f.3
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 05:53:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744894387; x=1745499187;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hUWnQ3oko9v3dqJdjM0E43zuuIHxpbYgzY+YVOU+j9M=;
 b=eEy9pqMYC+Mh0rRZe5pt3vBagr+3e3Wxq8Y1RWHGi1hSpNWc8QQWz3GJJZZtobQKTR
 /CjIYmkLb2zadL8MjpGFhzALKg4VrFkrjUaYjOJNFDNNxMttmcs6NAIUPtpi0DjJ/gIr
 44LUe7LylJa0x1h/xS4dWI+EqwhCSycyUkiSbY0xoDjLkCZ83E6/lXTOF9YhMcXQyrwo
 LODA2Ok0HZqal1MJd76XzpR/f6FwsyDIAZmvBcEinXThpFuiXEHLUEk82fva2/5wsrHl
 0IjobH+DgmiAiTIhhDMIjefRS1G7irGirabnOJp3kcgb40wAqszpAeUo8HAKEpy2lxeO
 aDlA==
X-Gm-Message-State: AOJu0YzzYkrdQX8m+WP8Br1vse1qaa3gNi6NPBWk8gLRv8E31iyAQ567
 mR/f6DI48Z34OLRPSsjNUb8CDIsMuej4yjD5eUx4gSlki2mYugrlmCf45sUw1GTRb1w233Nf78J
 BTCc=
X-Gm-Gg: ASbGncvCpcqiO5oFEASB7jDSN0WjX7oyC8e/IsGxklk0iiuKsifPf3w7LK96nrRroQr
 Kw+GdsrtEZZKOs4zx8d2ICNHdu2KZmBOtXZ2U1EolZFQQHsj4A4q8RpGu0bEjDjLKs6037dQpS2
 KUfBK4itR6kX3Mjwv2R85GM9DSp2NWgbhlK6h5eLd8ZKgmWro9L8mIPJg0Utpo7bwaV3N7XD2Eg
 0aHgV3pQ0CQazwBtUJY/Cqmdil8ZuBLKMSt3eVqX2v5eb8sKcCSkJyWMqDD8xulx4lIGGs82RRU
 qoNjvzSh9yDSHRL1mQS8wd/qdMl8Fjc3CoBB267oGdxN5Gn9au9oEdX6BRMMaR6hfHSV6sR04Xr
 U7lphAh9Jvkz7/uWUzvqGTEYdBoPA+EpzxmLR
X-Google-Smtp-Source: AGHT+IHrPa95iXbZeN/U/mjKeDUPVOwngq0wAD6yZHbGvKGV2kIrzZt1xnj9fMdIaEIbLb4Tn1iaag==
X-Received: by 2002:a05:6000:1889:b0:391:2ab1:d4b8 with SMTP id
 ffacd0b85a97d-39ee5b13220mr5135075f8f.1.1744894387178; 
 Thu, 17 Apr 2025 05:53:07 -0700 (PDT)
Received: from debian-hp-1.local.essensium.com
 (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae9777absm19856736f8f.46.2025.04.17.05.53.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 05:53:06 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 17 Apr 2025 14:52:48 +0200
Message-ID: <20250417125251.301268-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1744894387; x=1745499187; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hUWnQ3oko9v3dqJdjM0E43zuuIHxpbYgzY+YVOU+j9M=;
 b=TFKCR/P72C+l3SYFQ2E2OQEuco3HDztCvOoSLdLI20XbCPBJhFRY6CJZrLJmyFsY/A
 hYRsleFgEr3I1pZCS7q8v8anZDUaXwtGlXw9Qz5B6Z8E7iNm0bwJVRD3xfDrJs0ZE1+P
 m59T/M+3cwSxhf7C8ZeBuOTHq2qgLeAQq5fGJP1Lc4kPVqTGBFsLW656Kg/8sSkMbLsq
 AKiHLmmmkhzmORhKa0dOF/bfdwppe2pUq/fPon8/iDpYfofs+Chd+OKw+nVLoMsvpmMq
 YTiVTlT/u3pvlgarDGkT4MS80jI4yEzG3l/I48oNwyfod/7TKLGdUmm96VMtiKTv4DJM
 W6mQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=TFKCR/P7
Subject: [Buildroot] [PATCH 1/1] package/python-sdbus: bump to version 0.14.0
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIHVwc3RyZWFtIFVSTCBoYXMgY2hhbmdlZCBzbyB3aGlsZSBhdCBpdCBhbHNvIHVwZGF0ZSBp
dC4KClNpZ25lZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWlu
ZC5iZT4KLS0tCiBwYWNrYWdlL3B5dGhvbi1zZGJ1cy9Db25maWcuaW4gICAgICAgICB8IDIgKy0K
IHBhY2thZ2UvcHl0aG9uLXNkYnVzL3B5dGhvbi1zZGJ1cy5oYXNoIHwgNCArKy0tCiBwYWNrYWdl
L3B5dGhvbi1zZGJ1cy9weXRob24tc2RidXMubWsgICB8IDQgKystLQogMyBmaWxlcyBjaGFuZ2Vk
LCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9w
eXRob24tc2RidXMvQ29uZmlnLmluIGIvcGFja2FnZS9weXRob24tc2RidXMvQ29uZmlnLmluCmlu
ZGV4IGIyZDM5OTBhYjQuLjc2Njc1ZTRhMjUgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcHl0aG9uLXNk
YnVzL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL3B5dGhvbi1zZGJ1cy9Db25maWcuaW4KQEAgLTUs
NyArNSw3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9QWVRIT05fU0RCVVMKIAkgIE1vZGVybiBQeXRo
b24gRC1CdXMgbGlicmFyeS4gQmFzZWQgb24gc2QtYnVzIGZyb20KIAkgIGxpYnN5c3RlbWQuCiAK
LQkgIGh0dHBzOi8vZ2l0aHViLmNvbS9pZ285NTg2Mi9weXRob24tc2RidXMKKwkgIGh0dHBzOi8v
Z2l0aHViLmNvbS9weXRob24tc2RidXMvcHl0aG9uLXNkYnVzLwogCiBjb21tZW50ICJweXRob24t
c2RidXMgbmVlZHMgc3lzdGVtZCIKIAlkZXBlbmRzIG9uICFCUjJfUEFDS0FHRV9TWVNURU1ECmRp
ZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1zZGJ1cy9weXRob24tc2RidXMuaGFzaCBiL3BhY2th
Z2UvcHl0aG9uLXNkYnVzL3B5dGhvbi1zZGJ1cy5oYXNoCmluZGV4IDYyYTQ1ODc2MjguLjU0NDI2
MmQ0OGYgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcHl0aG9uLXNkYnVzL3B5dGhvbi1zZGJ1cy5oYXNo
CisrKyBiL3BhY2thZ2UvcHl0aG9uLXNkYnVzL3B5dGhvbi1zZGJ1cy5oYXNoCkBAIC0xLDUgKzEs
NSBAQAogIyBtZDUsIHNoYTI1NiBmcm9tIGh0dHBzOi8vcHlwaS5vcmcvcHlwaS9zZGJ1cy9qc29u
Ci1tZDUgIGVhNjNlYmZkMDQ5OTk0MGRjMzI4NzhiMGZmYjk2MDFjICBzZGJ1cy0wLjEzLjAudGFy
Lmd6Ci1zaGEyNTYgIDgwMWJkNDY2MDhlZTgyNjE0ZDQyOTYwYzhiYThhZTkzMDBlZGIxYmY1YmJl
YjUzNGJjOGZkMjFmMTNkMmMyMGUgIHNkYnVzLTAuMTMuMC50YXIuZ3oKK21kNSAgNjlhMjU2ZWEx
YzI1MTA1NDYxYTM5NTVhYzY4ZTNlYTcgIHNkYnVzLTAuMTQuMC50YXIuZ3oKK3NoYTI1NiAgNDFk
NjFiNzZjYzA1YTllYTQxZDEwZDcwYTExZTlmOWE4NmVkOTVmNDBmNzEzNjMwYzVlMTgzNDBlMGU0
Yzc2ZiAgc2RidXMtMC4xNC4wLnRhci5negogIyBMb2NhbGx5IGNvbXB1dGVkIHNoYTI1NiBjaGVj
a3N1bXMKIHNoYTI1NiAgODE3N2Y5NzUxMzIxMzUyNmRmMmNmNjE4NGQ4ZmY5ODZjNjc1YWZiNTE0
ZDRlNjhhNDA0MDEwNTIxYjg4MDY0MyAgQ09QWUlORwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRo
b24tc2RidXMvcHl0aG9uLXNkYnVzLm1rIGIvcGFja2FnZS9weXRob24tc2RidXMvcHl0aG9uLXNk
YnVzLm1rCmluZGV4IDExMWM0YmQ2NDguLjU2MGE1ZjAyYWUgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uv
cHl0aG9uLXNkYnVzL3B5dGhvbi1zZGJ1cy5taworKysgYi9wYWNrYWdlL3B5dGhvbi1zZGJ1cy9w
eXRob24tc2RidXMubWsKQEAgLTQsOSArNCw5IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IwogCi1QWVRIT05fU0RCVVNfVkVSU0lPTiA9IDAuMTMuMAorUFlUSE9OX1NEQlVTX1ZFUlNJT04g
PSAwLjE0LjAKIFBZVEhPTl9TREJVU19TT1VSQ0UgPSBzZGJ1cy0kKFBZVEhPTl9TREJVU19WRVJT
SU9OKS50YXIuZ3oKLVBZVEhPTl9TREJVU19TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0
ZWQub3JnL3BhY2thZ2VzLzRmL2M3Lzg3NDBmZjc4ZTlmZmRiYjlhMjhlNzcyMmUxNDU3OTUwMTVj
NjJlYTdjZTgxMjI0MmY1OTY4MDczNTExYworUFlUSE9OX1NEQlVTX1NJVEUgPSBodHRwczovL2Zp
bGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvMTcvOWEvMWRjMDEwNDI4ZmExZjQ0NDgwOWQ5
YWExYWRiM2NlMjMxZGFlODkxYjVmMzM2MzVkOGY0ZDdhOGUzM2ZkCiBQWVRIT05fU0RCVVNfU0VU
VVBfVFlQRSA9IHNldHVwdG9vbHMKIFBZVEhPTl9TREJVU19MSUNFTlNFID0gTEdQTC0yLjErCiBQ
WVRIT05fU0RCVVNfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcKLS0gCjIuNDkuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
