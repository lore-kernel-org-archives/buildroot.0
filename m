Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10930C0218A
	for <buildroot@archiver.kernel.org>; Sat,  1 Feb 2025 18:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72A2242E07;
	Sat,  1 Feb 2025 18:36:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sIG-WKdgpA24; Sat,  1 Feb 2025 18:36:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F28142E0C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F28142E0C;
	Sat,  1 Feb 2025 18:36:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A05E012A
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 18:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8175442E0C
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 18:36:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3-zZCpJlZ5Oz for <buildroot@buildroot.org>;
 Sat,  1 Feb 2025 18:36:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=gael.portay+rtone@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CD69342E07
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD69342E07
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD69342E07
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 18:36:05 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43620a5f81bso3920445e9.0
 for <buildroot@buildroot.org>; Sat, 01 Feb 2025 10:36:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738434962; x=1739039762;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dUCtxAQIZNS/TGVuRMTl6sGzBCh/iOQnx3ZeSAw3jZs=;
 b=lMOaU6aFF9SvR3W8FD1DjJJDWAR5qWKeGbyo7w3f9nPCIFhyQzhDVFUu7XkbWVggCY
 lBWkDwTT9+UZZqrt+c8WxXSDtUwZgCcSkianTyZcaDZv8XlY0Tn0i5Adq+RNdOWMIX5V
 ibI/+3qmdGYNYAiqlaEFXLUUrPLw76cplB2j4sEJIWdPyaBaxuO0EhqCN41plsr7AN8L
 7vGXvKlcN2C2yIvu3NasOYQjU9IZKU2yaqu6wCarny+YP9g6dUQxZaUAJ7PUDIOAC93G
 Qny8ibkXtMOeP1wnx6766LtyJbT/dEDeDdL0iOy/NUe+FakYul3vIgt6HR4BZ5Q5CDJo
 rREQ==
X-Gm-Message-State: AOJu0Yw+mcVvJVNX2CQX6VJ9Nk2F4I+HPbDu8jStxEdS4dBzqdm110pc
 GtwDDKubFXLQUsK6B2LxjlQOPma8Qi+Os1J51b7FAdlTAVxInyf0dM/KKCVJ7gY=
X-Gm-Gg: ASbGncsy18eLjsGJBhQ0o4ZkNxn5rxgggi+XD8Lq4Nv4zm/kXuAlXLsewVxXyeQ94Sq
 hCbOks/xnzC+2B9BFlohnrstFKG7cKzN1XMAGrJjdpDI7g27w+sevDUfBXvMfWjGPe2dNHP7wFG
 ZvK1c+iR+cVLAMJ2qAlSazUXtIr+34I+UV83Cyc5CVUpt285luJDkf9oWnypR39dRveHBGB52U2
 Twh6pjREnslH5wknrH0a9sCMdjY1wffdgGdXCJD/sDMU1TLF9ffSbVIRPCv5tPt5FSpsaqfPd9X
 xsLSlbnW39H13ji/fFXTgQ4S
X-Google-Smtp-Source: AGHT+IEMjn9gMS25lvuF2X1Y41Xr0Sp5/86g8fDhvXqFE29bOFa8SePXY0PvEcp1x25J1zNI2hp1xg==
X-Received: by 2002:a05:600c:5112:b0:434:fecf:cb2f with SMTP id
 5b1f17b1804b1-438dc40d887mr55713685e9.5.1738434962019; 
 Sat, 01 Feb 2025 10:36:02 -0800 (PST)
Received: from archlinux.. ([94.106.221.60]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1cf53asm7748242f8f.87.2025.02.01.10.36.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2025 10:36:01 -0800 (PST)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
Date: Sat,  1 Feb 2025 19:35:53 +0100
Message-ID: <20250201183553.929140-1-gael.portay+rtone@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738434962; x=1739039762; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=dUCtxAQIZNS/TGVuRMTl6sGzBCh/iOQnx3ZeSAw3jZs=;
 b=KSnpPVVeOY936wEJfh1o/XhGN/M8amQ1KW90jbl9VK5bFOMGs1colx5yK0G2eN2Pbw
 chn+cyNfTFwDB7hienifdXRju90I0L6GV8QYn3D75vbfvwbij3FW9TTIdeJ6nfmOddyM
 5x6sSp0A3aA/uDiEH0rsoXulsdKH45kfA4vniO+KZLMNAvaSDVDTfQDpTU+XamnWTsRP
 kPCsi2V4KqeSXxgcZ0mtf4FEBooKiuAwTw9lnNMPKMrHndgBSUC2MLNSOC0s5jb35sm9
 6zmh0Kw1swRh9h++JelE8B+vk4Oqy+EtPOwCWeH5K9Ly70ROBF0cN+Ah7wC4pH/lrS6k
 mzJg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KSnpPVVe
Subject: [Buildroot] [RESEND] board/raspberrypi*: remove dtparam krnbt=on
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
OiBHYcOrbCBQT1JUQVkgPGdhZWwucG9ydGF5K3J0b25lQGdtYWlsLmNvbT4KLS0tCkhlbGxvLAoK
Q2hhbmdlcyBzaW5jZSByZXNlbmQ6CiAtIFVwZGF0ZWQgZS1tYWlsLgoKUmVnYXJkcywKR2HDq2wK
CiBib2FyZC9yYXNwYmVycnlwaS9jb25maWdfMHcudHh0ICAgICAgfCAzIC0tLQogYm9hcmQvcmFz
cGJlcnJ5cGkvY29uZmlnXzMudHh0ICAgICAgIHwgMyAtLS0KIGJvYXJkL3Jhc3BiZXJyeXBpL2Nv
bmZpZ18zXzY0Yml0LnR4dCB8IDMgLS0tCiBib2FyZC9yYXNwYmVycnlwaS9jb25maWdfNC50eHQg
ICAgICAgfCAzIC0tLQogYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnXzRfNjRiaXQudHh0IHwgMyAt
LS0KIGJvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ196ZXJvMncudHh0ICB8IDMgLS0tCiA2IGZpbGVz
IGNoYW5nZWQsIDE4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2JvYXJkL3Jhc3BiZXJyeXBp
L2NvbmZpZ18wdy50eHQgYi9ib2FyZC9yYXNwYmVycnlwaS9jb25maWdfMHcudHh0CmluZGV4IDEy
M2UwOWNmNTYuLjAyNjcyMTBlMmQgMTAwNjQ0Ci0tLSBhL2JvYXJkL3Jhc3BiZXJyeXBpL2NvbmZp
Z18wdy50eHQKKysrIGIvYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnXzB3LnR4dApAQCAtMjQsNiAr
MjQsMyBAQCBncHVfbWVtXzEwMjQ9MTAwCiAKICMgRW5hYmxlIFVBUlQwIGZvciBzZXJpYWwgY29u
c29sZSBvbiB0dHlBTUEwCiBkdG92ZXJsYXk9bWluaXVhcnQtYnQKLQotIyBlbmFibGUgYXV0b3By
b2Jpbmcgb2YgQmx1ZXRvb3RoIGRyaXZlciB3aXRob3V0IG5lZWQgb2YgaGNpYXR0YWNoL2J0YXR0
YWNoCi1kdHBhcmFtPWtybmJ0PW9uCmRpZmYgLS1naXQgYS9ib2FyZC9yYXNwYmVycnlwaS9jb25m
aWdfMy50eHQgYi9ib2FyZC9yYXNwYmVycnlwaS9jb25maWdfMy50eHQKaW5kZXggMTIzZTA5Y2Y1
Ni4uMDI2NzIxMGUyZCAxMDA2NDQKLS0tIGEvYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnXzMudHh0
CisrKyBiL2JvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ18zLnR4dApAQCAtMjQsNiArMjQsMyBAQCBn
cHVfbWVtXzEwMjQ9MTAwCiAKICMgRW5hYmxlIFVBUlQwIGZvciBzZXJpYWwgY29uc29sZSBvbiB0
dHlBTUEwCiBkdG92ZXJsYXk9bWluaXVhcnQtYnQKLQotIyBlbmFibGUgYXV0b3Byb2Jpbmcgb2Yg
Qmx1ZXRvb3RoIGRyaXZlciB3aXRob3V0IG5lZWQgb2YgaGNpYXR0YWNoL2J0YXR0YWNoCi1kdHBh
cmFtPWtybmJ0PW9uCmRpZmYgLS1naXQgYS9ib2FyZC9yYXNwYmVycnlwaS9jb25maWdfM182NGJp
dC50eHQgYi9ib2FyZC9yYXNwYmVycnlwaS9jb25maWdfM182NGJpdC50eHQKaW5kZXggODgyMDZl
OWIxNC4uYmJkOGI2OTM2MyAxMDA2NDQKLS0tIGEvYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnXzNf
NjRiaXQudHh0CisrKyBiL2JvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ18zXzY0Yml0LnR4dApAQCAt
MjUsOCArMjUsNSBAQCBncHVfbWVtXzEwMjQ9MTAwCiAjIEVuYWJsZSBVQVJUMCBmb3Igc2VyaWFs
IGNvbnNvbGUgb24gdHR5QU1BMAogZHRvdmVybGF5PW1pbml1YXJ0LWJ0CiAKLSMgZW5hYmxlIGF1
dG9wcm9iaW5nIG9mIEJsdWV0b290aCBkcml2ZXIgd2l0aG91dCBuZWVkIG9mIGhjaWF0dGFjaC9i
dGF0dGFjaAotZHRwYXJhbT1rcm5idD1vbgotCiAjIGVuYWJsZSA2NGJpdHMgc3VwcG9ydAogYXJt
XzY0Yml0PTEKZGlmZiAtLWdpdCBhL2JvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ180LnR4dCBiL2Jv
YXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ180LnR4dAppbmRleCA5Yjc3ZDIzZDc0Li4xM2E3MjM4ZjZl
IDEwMDY0NAotLS0gYS9ib2FyZC9yYXNwYmVycnlwaS9jb25maWdfNC50eHQKKysrIGIvYm9hcmQv
cmFzcGJlcnJ5cGkvY29uZmlnXzQudHh0CkBAIC0yNCw2ICsyNCwzIEBAIGdwdV9tZW1fMTAyND0x
MDAKIAogIyBFbmFibGUgVUFSVDAgZm9yIHNlcmlhbCBjb25zb2xlIG9uIHR0eUFNQTAKIGR0b3Zl
cmxheT1taW5pdWFydC1idAotCi0jIGVuYWJsZSBhdXRvcHJvYmluZyBvZiBCbHVldG9vdGggZHJp
dmVyIHdpdGhvdXQgbmVlZCBvZiBoY2lhdHRhY2gvYnRhdHRhY2gKLWR0cGFyYW09a3JuYnQ9b24K
ZGlmZiAtLWdpdCBhL2JvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ180XzY0Yml0LnR4dCBiL2JvYXJk
L3Jhc3BiZXJyeXBpL2NvbmZpZ180XzY0Yml0LnR4dAppbmRleCBmY2IxYzVjMzBhLi4yZWVmNmRk
MWEyIDEwMDY0NAotLS0gYS9ib2FyZC9yYXNwYmVycnlwaS9jb25maWdfNF82NGJpdC50eHQKKysr
IGIvYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnXzRfNjRiaXQudHh0CkBAIC0yNSw4ICsyNSw1IEBA
IGdwdV9tZW1fMTAyND0xMDAKICMgRW5hYmxlIFVBUlQwIGZvciBzZXJpYWwgY29uc29sZSBvbiB0
dHlBTUEwCiBkdG92ZXJsYXk9bWluaXVhcnQtYnQKIAotIyBlbmFibGUgYXV0b3Byb2Jpbmcgb2Yg
Qmx1ZXRvb3RoIGRyaXZlciB3aXRob3V0IG5lZWQgb2YgaGNpYXR0YWNoL2J0YXR0YWNoCi1kdHBh
cmFtPWtybmJ0PW9uCi0KICMgZW5hYmxlIDY0Yml0cyBzdXBwb3J0CiBhcm1fNjRiaXQ9MQpkaWZm
IC0tZ2l0IGEvYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnX3plcm8ydy50eHQgYi9ib2FyZC9yYXNw
YmVycnlwaS9jb25maWdfemVybzJ3LnR4dAppbmRleCAxMjNlMDljZjU2Li4wMjY3MjEwZTJkIDEw
MDY0NAotLS0gYS9ib2FyZC9yYXNwYmVycnlwaS9jb25maWdfemVybzJ3LnR4dAorKysgYi9ib2Fy
ZC9yYXNwYmVycnlwaS9jb25maWdfemVybzJ3LnR4dApAQCAtMjQsNiArMjQsMyBAQCBncHVfbWVt
XzEwMjQ9MTAwCiAKICMgRW5hYmxlIFVBUlQwIGZvciBzZXJpYWwgY29uc29sZSBvbiB0dHlBTUEw
CiBkdG92ZXJsYXk9bWluaXVhcnQtYnQKLQotIyBlbmFibGUgYXV0b3Byb2Jpbmcgb2YgQmx1ZXRv
b3RoIGRyaXZlciB3aXRob3V0IG5lZWQgb2YgaGNpYXR0YWNoL2J0YXR0YWNoCi1kdHBhcmFtPWty
bmJ0PW9uCi0tIAoyLjQ4LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
