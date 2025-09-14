Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2DC0CAC58F
	for <buildroot@archiver.kernel.org>; Sun, 14 Sep 2025 06:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4806E61C7F;
	Sun, 14 Sep 2025 06:36:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZLDxWW35ZcRb; Sun, 14 Sep 2025 06:36:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7384C61C70
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7384C61C70;
	Sun, 14 Sep 2025 06:36:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AFC5117
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 06:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 245B383C38
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 06:36:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CTHeKw-WvjG0 for <buildroot@buildroot.org>;
 Sun, 14 Sep 2025 06:36:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 55C2E83C23
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55C2E83C23
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 55C2E83C23
 for <buildroot@busybox.net>; Sun, 14 Sep 2025 06:36:45 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-62f1eb1abb9so882070a12.0
 for <buildroot@busybox.net>; Sat, 13 Sep 2025 23:36:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757831803; x=1758436603;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UhGrrpZi7pFwTYcl6g8GJ8+RukCyVZdQiXIYEE6kb0Q=;
 b=p4/yii+csgVvmeeHl4XzXOkxq72sJA/AJ1ap+J0kpOsxdkJKkbUm3rM9x1UC3WiBJV
 I+H+7wTKVq8Uqdu8psgLAeBgToVLhtHQl9pib3LyzjhYMX23JM6XGxzOdK9uupyWtNad
 AZ2G9Vf879UfG9jAEPqHNpMC/eGQGN09ZcEUbewP1lp2+CG3A7ue7gdGRrkuG7RwJTaC
 uXYl2JjzI6qz81+g5yH3WMg+Jnkr8osvbuZjyHtRoIEFKuxWjrxHK8344bJ5c3QlQ57I
 zljkeFhPzkPlPpzsqTbcLkj3+Wx8zuOw7kQkt8aqbIiJ8ibSPII0R6mlHVxiizSem1Eg
 pJ/A==
X-Gm-Message-State: AOJu0YzgoD3Mcx9eIJld15Ec5yERg6+riUP5ukcZ9TFKUFgXq6zSg3kA
 ctKlcbWW1DOMtPBtVOhRL1w2NolES5Dzt7oKmfoIHPaGr4orHYY1eRWC5pqH/Xss8t/jvHB0bbA
 Rmn9gpg==
X-Gm-Gg: ASbGncvFGWpdtIFRHrxbgEAaIwgfLNY0gQZswgmeEiZyIUPadhVc7Lo7HN45FVa3XRm
 6RfYCKQML36DmamzzDX4RWBSwpAgKoTf0WtqcvJw/TcygSTJAzw92rDP7a3Fawghlhjf1mheBY+
 LmD+i+DNCDcR3gkdXEjE+D0fk44D0i1U+4gkqWbwmBgLGiljgfpGKRxOkDVHufk73LE2cpQzsXD
 huH0HHvD8E7waCbscttfbc596r3jQxihTQPBhKyDBfjwJrzrnUhCxSlfp7OHsi8uiJGutGMqBDO
 nTCfdadEZVf3DivdC4XYtTCjtT5+6xkUxQE1Rje47ICa+tSrvvrMohtyXsd4yw3TJ5M0d1dBE4g
 m082Ic0NxWCT+P65sjTfX27PrHxh52kaiQMpHdfuJBxeHi4SEBvhK8IuY
X-Google-Smtp-Source: AGHT+IFIqc8B7Cez4X0RFHM/g3MNNrbTdamECkUcygL3JanXsOuCwdqkx3VTU+w2rZJzjAzFFjLxiQ==
X-Received: by 2002:a05:6402:52dc:b0:61f:eb87:fde7 with SMTP id
 4fb4d7f45d1cf-62ed9d81aa4mr8506586a12.17.1757831802874; 
 Sat, 13 Sep 2025 23:36:42 -0700 (PDT)
Received: from vm-2404.. (10.187.66.37.rev.sfr.net. [37.66.187.10])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62ec8c8ee5asm6233389a12.4.2025.09.13.23.36.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Sep 2025 23:36:42 -0700 (PDT)
To: buildroot@busybox.net
Date: Sun, 14 Sep 2025 08:36:07 +0200
Message-ID: <20250914063635.696367-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1757831803; x=1758436603; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UhGrrpZi7pFwTYcl6g8GJ8+RukCyVZdQiXIYEE6kb0Q=;
 b=NAbt7fqaWQ3MQBJ5lOde6I23OgyXw/i3w1eczW7j6SvNa17zNefnhVpc3SFBD+ryGN
 2irG4HgAQZd8kbfQtphZs5DbJDJ2wM+dTiJIx6SxNbDyOjyUUVfgV8uSgcvol1jN8iFG
 b0nHVYD9Xv/CEQQKKz2qkjIT1TMkgr15d5GmTVv5lAtjTN6q+vY4pQsAYyXfimgwXuSf
 sMVeVNA0XyuiEFkWR7h2SLEKDqiBcbUxwvnD+BAA6g3uCeLzBjJibxGRCiDBysshnDan
 xQPhn3ED0F4402mnNu00ocZXa/pazU3BvecNcwUeX0lHjT8Q/uc+aa+jvH6zPPNVmu82
 LAmg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=NAbt7fqa
Subject: [Buildroot] [PATCH] package/lua-utf8: remove upstream patch
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

dGhpcyBwYXRjaCB3YXMgdXNlZnVsIGFnYWluc3QgMC4xLjUsCmJ1dCBub3cgaXQgaXMgbWVyZ2Vk
IHVwc3RyZWFtIGluIDAuMS42CgpmaXggYnVpbGQsIHNlZSBodHRwczovL2F1dG9idWlsZC5idWls
ZHJvb3Qub3JnL3Jlc3VsdHMvM2JmZmU1NTI3NWE5NDM0NjgyYWYxYmYzMzkwZDA4MzBhNDg1OWM1
Yy9idWlsZC1lbmQubG9nCgpTaWduZWQtb2ZmLWJ5OiBGcmFuY29pcyBQZXJyYWQgPGZyYW5jb2lz
LnBlcnJhZEBnYWR6Lm9yZz4KLS0tCiAuLi5kZS1saW1pdHMuaC1pbnN0ZWFkLW9mLXRyYW5zaXRp
dmVseS0ucGF0Y2ggfCA1OCAtLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNTgg
ZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgcGFja2FnZS9sdWEtdXRmOC8wMDAxLUV4
cGxpY2l0bHktaW5jbHVkZS1saW1pdHMuaC1pbnN0ZWFkLW9mLXRyYW5zaXRpdmVseS0ucGF0Y2gK
CmRpZmYgLS1naXQgYS9wYWNrYWdlL2x1YS11dGY4LzAwMDEtRXhwbGljaXRseS1pbmNsdWRlLWxp
bWl0cy5oLWluc3RlYWQtb2YtdHJhbnNpdGl2ZWx5LS5wYXRjaCBiL3BhY2thZ2UvbHVhLXV0Zjgv
MDAwMS1FeHBsaWNpdGx5LWluY2x1ZGUtbGltaXRzLmgtaW5zdGVhZC1vZi10cmFuc2l0aXZlbHkt
LnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBmODc5MzBlNmEuLjAwMDAwMDAw
MAotLS0gYS9wYWNrYWdlL2x1YS11dGY4LzAwMDEtRXhwbGljaXRseS1pbmNsdWRlLWxpbWl0cy5o
LWluc3RlYWQtb2YtdHJhbnNpdGl2ZWx5LS5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDU4ICsw
LDAgQEAKLUZyb20gZmVkYTM4YzZiN2VmNGM1NjRmNzcyMTMwMzdkYzIwNzY4YzYzOGQ5YyBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IENhbGViIE1hY2xlbm5hbiA8Y2FsZWJAYWxlcnF1
ZS5jb20+Ci1EYXRlOiBUaHUsIDIgSmFuIDIwMjUgMTU6NDI6MDUgKzAzMDAKLVN1YmplY3Q6IFtQ
QVRDSF0gRXhwbGljaXRseSBpbmNsdWRlIGxpbWl0cy5oIGluc3RlYWQgb2YgdHJhbnNpdGl2ZWx5
IGFzc3VtaW5nCi0gaXQKLU1JTUUtVmVyc2lvbjogMS4wCi1Db250ZW50LVR5cGU6IHRleHQvcGxh
aW47IGNoYXJzZXQ9VVRGLTgKLUNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKLQotUmVj
ZW50IHVwc3RyZWFtIHJlbGVhc2VzIG9mIEx1YUpJVCBoYXZlIGJyb2tlbiBidWlsZGluZyB0aGlz
IEx1YSBSb2NrCi1lbnRpcmVseS4gUFVDIEx1YSBhbmQgTHVhSklUIGJ1aWxkcyB1cCB0byBhIGNl
cnRhaW4gcG9pbnQgaW5jbHVkZWQgdGhpcwotaGVhZGVyIGluIGx1YS5oLCB3aGljaCBtZWFudCB0
aGF0IGl0IHdhcyBhbHdheXMgYXJvdW5kIGFzIGEgdHJhbnNpdGl2ZQotZGVwZW5kZW5jeS4gUmVj
ZW50IHVwc3RyZWFtIEx1YUpJVCBidWlsZHMgbm8gbG9uZ2VyIGluY2x1ZGUgdGhlIGhlYWRlcgot
c2luY2UgdGhleSBhcmVuJ3QgdXNpbmcgaXQgZGlyZWN0bHkgYW55IG1vcmUsIGJ1dCB0aGF0IG1l
YW5zIHRoaW5ncyB0aGF0Ci1pbmNsdWRlIGx1YS5oIGRvbid0IGdldCBpdCBmb3IgZnJlZSBhbnkg
bW9yZS4gSXQgc2hvdWxkIG5ldmVyIGhhdmUgYmVlbgotYXNzdW1lZCBhbnl3YXksIGJ1dCB0aGF0
J3MgYmVlbiB0aGUgc3RhdHVzIHF1byBmb3IgYSB3aGlsZS4KLQotVGhpcyBmaXhlcyBidWlsZCBl
cnJvcnMgd2hlbiB1c2luZyBMdWFKSVQgaGVhZGVycyBpbnN0ZWFkIG9mIFBVQyBMdWE6Ci0KLWBg
YAotbHV0ZjhsaWIuYzogSW4gZnVuY3Rpb24g4oCYTHV0ZjhfY29kZXBvaW504oCZOgotbHV0Zjhs
aWIuYzozOTg6MjI6IGVycm9yOiDigJhJTlRfTUFY4oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBp
biB0aGlzIGZ1bmN0aW9uKQotICAzOTggfCAgIGlmIChwb3NlIC0gcG9zaSA+PSBJTlRfTUFYKSAg
LyogKGx1YV9JbnRlZ2VyIC0+IGludCkgb3ZlcmZsb3c/ICovCi0gICAgICB8ICAgICAgICAgICAg
ICAgICAgICAgIF5+fn5+fn4KLWx1dGY4bGliLmM6MTI6MTogbm90ZTog4oCYSU5UX01BWOKAmSBp
cyBkZWZpbmVkIGluIGhlYWRlciDigJg8bGltaXRzLmg+4oCZOyBkaWQgeW91IGZvcmdldCB0byDi
gJgjaW5jbHVkZSA8bGltaXRzLmg+4oCZPwotICAgMTEgfCAjaW5jbHVkZSAidW5pZGF0YS5oIgot
ICArKysgfCsjaW5jbHVkZSA8bGltaXRzLmg+Ci0gICAxMiB8Ci1sdXRmOGxpYi5jOjM5ODoyMjog
bm90ZTogZWFjaCB1bmRlY2xhcmVkIGlkZW50aWZpZXIgaXMgcmVwb3J0ZWQgb25seSBvbmNlIGZv
ciBlYWNoIGZ1bmN0aW9uIGl0IGFwcGVhcnMgaW4KLSAgMzk4IHwgICBpZiAocG9zZSAtIHBvc2kg
Pj0gSU5UX01BWCkgIC8qIChsdWFfSW50ZWdlciAtPiBpbnQpIG92ZXJmbG93PyAqLwotICAgICAg
fCAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+Ci1gYGAKLQotVGhpcyBpcyBiZWNhdXNlIGBJ
TlRfTUFYYCBpcyBkZWZpbmVkIGFwcHJvcHJpYXRlbHkgZm9yIGEgZ2l2ZW4gcGxhdGZyb20KLWlu
IGluIGxpbWl0cy5oLgotCi1VcHN0cmVhbTogMWJiNzBkNDUyMDhkNDAzM2RjYzc1ZWZlZTk2OGJl
NzA1MzRkZDNhYgotW1JvbWFpbjogcmViYXNlIG9uIDAuMS41XQotU2lnbmVkLW9mZi1ieTogUm9t
YWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+Ci0tLS0KLSBsdWF1dGY4LTAuMS41L2x1
dGY4bGliLmMgfCAxICsKLSAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKLQotZGlmZiAt
LWdpdCBhL2x1YXV0ZjgtMC4xLjUvbHV0ZjhsaWIuYyBiL2x1YXV0ZjgtMC4xLjUvbHV0ZjhsaWIu
YwotaW5kZXggNTIyNTk5ZS4uNzFmMmY0MiAxMDA2NDQKLS0tLSBhL2x1YXV0ZjgtMC4xLjUvbHV0
ZjhsaWIuYwotKysrIGIvbHVhdXRmOC0wLjEuNS9sdXRmOGxpYi5jCi1AQCAtNyw2ICs3LDcgQEAK
LSAjaW5jbHVkZSA8YXNzZXJ0Lmg+Ci0gI2luY2x1ZGUgPHN0cmluZy5oPgotICNpbmNsdWRlIDxz
dGRpbnQuaD4KLSsjaW5jbHVkZSA8bGltaXRzLmg+Ci0gCi0gI2luY2x1ZGUgInVuaWRhdGEuaCIK
LSAKLS0tIAotMi41MS4wCi0KLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
