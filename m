Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C61C8C282D1
	for <buildroot@archiver.kernel.org>; Mon,  3 Mar 2025 16:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 923A360607;
	Mon,  3 Mar 2025 16:16:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AmXU8xP4EcnU; Mon,  3 Mar 2025 16:16:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45411606F5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45411606F5;
	Mon,  3 Mar 2025 16:16:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 813D6D2
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 16:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 093A340D96
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 16:16:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3rjg0Ou5v1fY for <buildroot@buildroot.org>;
 Mon,  3 Mar 2025 16:16:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 380FA40CA5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 380FA40CA5
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 380FA40CA5
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 16:16:02 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-390eb7c1024so2610424f8f.0
 for <buildroot@buildroot.org>; Mon, 03 Mar 2025 08:16:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741018560; x=1741623360;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GpGGg/ksRddul2FRY9OC2ox1Q0qfb9SV0OhcbjwUi60=;
 b=l4EyxUbo641URCQLH23BcQ6id1PQoeyapFC+aukytiCTmPAwMZn9FDZAVxch5W8Flk
 UhHHmnxCpWnSAOutJEzraq2+ybt3boNGz3QMM1YzVZ2VfTd3fQrfwkfMgyalUBx+dHm1
 LXIcI1rcAfdYOrCbM/GNJkjuTzJizGeW07QO4xYbZpblKrYgBWPd6ef0P2N/ihGSBlkM
 aV7oQUgQQB13UI/9HAO+dRY+pSkp7Jcx0bSnJTx2fBf+XsZApimp3gMp+t06SVhydXON
 2P77/GHZiKww89Wq7dZQmWxpBaOSgZmb+TMZtpn3sx69Ayd79tf7OPws48BkzcYWVo4t
 we8A==
X-Gm-Message-State: AOJu0YzZiTIayS5U5W0uA5mZJstjsFLkJWkxqE4xJufYRrxY05CJTocw
 1lXffkeFPkplyNPOk12AB7eYKKefmN67UuWmxVlMDokdBlcDlgTGXEpg+HuOIC2mOaKslnFkwH6
 mrjQ=
X-Gm-Gg: ASbGnct3JHF1Q2nCtXNY6mjzN1JvhUzZxMzEJ0FSX+skWPTJ0KHX+FySdyq3vqlzKdx
 O9atoVX6UJo4P6SDZKPAtI2MoIJ3dl1nPOJnq+BzhXjs90yYapd5v+f3ty1ObcXRrbcNpn0MT3T
 JPaKBsyIRi6NwcgJWzy5kKAJzU0LXY+cvw6IDRBKf4gqBPs65eOQ+EzlMOmoBYJGrF/FqfilGyG
 dW8UnvizNCcEmTYJVkLBbC3UeiTK/3xzv0v/rjPoAY580IcvPqvsXz3Yd+PYmHjFniehOT46kyv
 3lM9gUAxUd75r6HS9QXjlC+2D5UG78wPsFV8+uixSn2i1fs=
X-Google-Smtp-Source: AGHT+IEosmuSjGRjzBGNgJCutXSPlrzHlGMoU6kFxt8eqJntTaWR+olDHM/ISwgfFEwSY6PzGuJ9Ig==
X-Received: by 2002:a5d:47c3:0:b0:38f:2f0e:980c with SMTP id
 ffacd0b85a97d-390eca4a043mr10102537f8f.47.1741018559971; 
 Mon, 03 Mar 2025 08:15:59 -0800 (PST)
Received: from draig.lan ([185.126.160.109]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47b7d1dsm15084589f8f.56.2025.03.03.08.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 08:15:58 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 3E8DD5F9FB;
 Mon,  3 Mar 2025 16:15:58 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Mon,  3 Mar 2025 16:15:53 +0000
Message-Id: <20250303161557.571619-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250303161557.571619-1-alex.bennee@linaro.org>
References: <20250303161557.571619-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741018560; x=1741623360; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GpGGg/ksRddul2FRY9OC2ox1Q0qfb9SV0OhcbjwUi60=;
 b=D8jTDAIkZuoiS7gXgwLJrj+y9as81uMyxuIyB4XTByOFGboJZGVnm7xASHeLZt20VR
 lGSgn1puxenSak00zMzmCweyZkKozcShaUkrGj/G/oOfoMUPZcgqpCFrnS5fTYCssNez
 HIhWi4IUS94L4sO5yN+KTIogpeCrwznIU2rlASIBsmk/fMWwtFSzJBCV4k2Vgq/e7uuJ
 cPgfHezsLtqzzTkmkvj0ldGOcoq85+U3BRVYF26xMfLorqZYo85bj6RFC1BflEF3AYW7
 n2bbTYs82CDIZxXNsMITXzeFZ1IWmy2YJSOXyhHCHqciVgErKKmCCOSMjrILnOKUIKEf
 WXkw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=D8jTDAIk
Subject: [Buildroot] [PATCH v4 2/6] package/vulkan-sdk: new package
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

VGhlIHByaW5jaXBsZSBjb21wb25lbnQgb2YgdGhpcyBpcyB0aGUgbmV3IHZvbGsgbWV0YS1sb2Fk
ZXIgd2hpY2ggaXMKcmVxdWlyZWQgZm9yIG1vcmUgcmVjZW50IHZlcnNpb25zIG9mIHZ1bGthbi10
b29scy4KClNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9y
Zz4KLS0tCiBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgIHwgIDEgKwogcGFja2Fn
ZS92dWxrYW4tc2RrL0NvbmZpZy5pbiAgICAgICB8ICA4ICsrKysrKysrCiBwYWNrYWdlL3Z1bGth
bi1zZGsvdnVsa2FuLXNkay5oYXNoIHwgIDMgKysrCiBwYWNrYWdlL3Z1bGthbi1zZGsvdnVsa2Fu
LXNkay5tayAgIHwgMTggKysrKysrKysrKysrKysrKysrCiA0IGZpbGVzIGNoYW5nZWQsIDMwIGlu
c2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3Z1bGthbi1zZGsvQ29uZmln
LmluCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS92dWxrYW4tc2RrL3Z1bGthbi1zZGsuaGFz
aAogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvdnVsa2FuLXNkay92dWxrYW4tc2RrLm1rCgpk
aWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4gYi9wYWNrYWdlL0NvbmZpZy5pbgppbmRleCBh
YTAyNWQ5MDI0Li4zMGJhN2MyMDZhIDEwMDY0NAotLS0gYS9wYWNrYWdlL0NvbmZpZy5pbgorKysg
Yi9wYWNrYWdlL0NvbmZpZy5pbgpAQCAtMzc0LDYgKzM3NCw3IEBAIGNvbW1lbnQgIkdyYXBoaWMg
bGlicmFyaWVzIgogCXNvdXJjZSAicGFja2FnZS90ay9Db25maWcuaW4iCiAJc291cmNlICJwYWNr
YWdlL3Z1bGthbi1oZWFkZXJzL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvdnVsa2FuLWxv
YWRlci9Db25maWcuaW4iCisJc291cmNlICJwYWNrYWdlL3Z1bGthbi1zZGsvQ29uZmlnLmluIgog
CXNvdXJjZSAicGFja2FnZS92dWxrYW4tdG9vbHMvQ29uZmlnLmluIgogCiBjb21tZW50ICJPdGhl
ciBHVUlzIgpkaWZmIC0tZ2l0IGEvcGFja2FnZS92dWxrYW4tc2RrL0NvbmZpZy5pbiBiL3BhY2th
Z2UvdnVsa2FuLXNkay9Db25maWcuaW4KbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAw
MDAwMC4uMDViZGEyMzdiYgotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvdnVsa2FuLXNkay9D
b25maWcuaW4KQEAgLTAsMCArMSw4IEBACitjb25maWcgQlIyX1BBQ0tBR0VfVlVMS0FOX1NESwor
CWJvb2wgInZ1bGthbi1zZGsiCisJc2VsZWN0IEJSMl9QQUNLQUdFX1ZVTEtBTl9IRUFERVJTCisK
KwloZWxwCisJICBUaGUgVnVsa2FuIG1ldGEtbG9hZGVyCisKKwkgIGh0dHBzOi8vZ2l0aHViLmNv
bS96ZXV4L3ZvbGsKZGlmZiAtLWdpdCBhL3BhY2thZ2UvdnVsa2FuLXNkay92dWxrYW4tc2RrLmhh
c2ggYi9wYWNrYWdlL3Z1bGthbi1zZGsvdnVsa2FuLXNkay5oYXNoCm5ldyBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IDAwMDAwMDAwMDAuLjUxMDZlNTM1MjcKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNr
YWdlL3Z1bGthbi1zZGsvdnVsa2FuLXNkay5oYXNoCkBAIC0wLDAgKzEsMyBAQAorIyBMb2NhbGx5
IGNhbGN1bGF0ZWQKK3NoYTI1NiAgYWIzZDRhOGNjYWViMzI2NTIyNTljZGQwMDgzOTk1MDRhNDE3
OTI2NzViMDQyMWQ5MGI2NzcyOWVlMjc0NzQ2ZiAgMS40LjMwNC50YXIuZ3oKK3NoYTI1NiAgMzNj
ODMxZjc2Yjc5NTAxNjY1ZTY2YzIzYWM4Zjg3NjAyMDQ1N2MyMTZkNDQ1MjZhOGY3NDdkYTg5Nzk5
OWIzNSAgTElDRU5TRS5tZApkaWZmIC0tZ2l0IGEvcGFja2FnZS92dWxrYW4tc2RrL3Z1bGthbi1z
ZGsubWsgYi9wYWNrYWdlL3Z1bGthbi1zZGsvdnVsa2FuLXNkay5tawpuZXcgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMDAwMDAwMDAwLi5kNmFkMDgxOWM3Ci0tLSAvZGV2L251bGwKKysrIGIvcGFj
a2FnZS92dWxrYW4tc2RrL3Z1bGthbi1zZGsubWsKQEAgLTAsMCArMSwxOCBAQAorIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMKKyMKKyMgdnVsa2FuLXNkaworIworIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKKworVlVMS0FOX1NES19WRVJTSU9OID0gMS40LjMwNAorVlVMS0FOX1NES19TSVRFID0gaHR0
cHM6Ly9naXRodWIuY29tL3pldXgvdm9say9hcmNoaXZlCitWVUxLQU5fU0RLX1NPVVJDRT0gJChW
VUxLQU5fU0RLX1ZFUlNJT04pLnRhci5negorVlVMS0FOX1NES19MSUNFTlNFID0gTUlUCitWVUxL
QU5fU0RLX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFLm1kCitWVUxLQU5fU0RLX0lOU1RBTExfU1RB
R0lORyA9IFlFUworCitWVUxLQU5fU0RLX0RFUEVOREVOQ0lFUyA9IHZ1bGthbi1oZWFkZXJzCisK
K1ZVTEtBTl9TREtfQ09ORl9PUFRTICs9IC1EVk9MS19JTlNUQUxMPU9OCisKKyQoZXZhbCAkKGNt
YWtlLXBhY2thZ2UpKQotLSAKMi4zOS41CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
