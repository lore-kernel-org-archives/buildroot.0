Return-Path: <SRS0=TKET=PH=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA35C433FE
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 08:05:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3ED26137E
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 08:05:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A3ED26137E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AC98402A6;
	Tue, 19 Oct 2021 08:05:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nic4sbbv92z2; Tue, 19 Oct 2021 08:05:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7772640277;
	Tue, 19 Oct 2021 08:05:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4504F1BF310
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 08:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4232740277
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 08:05:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xPecVEfWE0ic for <buildroot@lists.busybox.net>;
 Tue, 19 Oct 2021 08:05:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E1F5140276
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 08:05:03 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id l5so4503886lja.13
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 01:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d4fX23XL35jiFzi3RsGeuJKr69IrlacDYrPNcqxt5M8=;
 b=sFPxiNWyUME8ASe/gdfY+PtRJ1kaNoCWF3EcKZ9WGjB1aYKV48KhcFb0AZ5qTucba5
 Ae1yXT2A6ghNKY+U9wCjQlOEjfxy7cS+Lx/tr1CT2g/FPG3laGiEgm2Nnx24pnYZLxcb
 N+tVtBefJpHUzapBLTkG0z5XYbo3udd68b2Qlc945VaDxLvPAC/eqoOYkGXcbM4QfyV6
 wLu4LZm/WW0uIP+wrDvLdckE3GA8mfuU7P3lFkGvA45oLlMbF2RMwRwaFgzTQ2ueuH1X
 C1LWHA2DB2ocAnR+sGEKo/O2Kv5TV2up7QpCLEQrxQatFwmNb9hcXjdn/jZUGDingAfj
 6WfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d4fX23XL35jiFzi3RsGeuJKr69IrlacDYrPNcqxt5M8=;
 b=2xendD+eD5pyx5GKwnD4FRyQ7DZ/3Z1M1bX7oM+vSz1WAiKfi7KvwwfZ4Hn4qK0Yx3
 IQQzUvtUHsUd3VUuW2MLyZK/9ReizeQ3d5JZkebThOc3Fpfgd1Ejl7Zjn4yFaxSvGM8G
 CGd2lJxbd763EEKZrh38wX+k4hAO/uynSMS6D0l7aQ6TqAXPxSJHkA8ZRRxwQaXmAU+I
 m8J2V4ghp0eOfMIr+RBQlTnhfFRKcamDz2IknzDPyFXZ3xIQKWiWGiZgRBADxxsGtiMz
 nzeWzOpxsGohOZVLZI+7yYsATtq0I6JZwmJzsrCIuHLOD9la1vUhbfUE6Fjz+6GBCGTJ
 o8uw==
X-Gm-Message-State: AOAM532tGzCgKsbOm6nR2c+HM2Fz27F+isIvrJuqY0FqGSBbvLk3fSVc
 w8HfZwZmBOrUaFrCgpFUMuhVKF+wT0AsUBRQgoJCRQ==
X-Google-Smtp-Source: ABdhPJz+tBH9VVyPtXjQ/CyJmZknZywfT/lRHhlr9oLoGsDNRU3y8nTz4i2NYO2Ck5xON9BS5If+Dw==
X-Received: by 2002:a05:651c:154a:: with SMTP id
 y10mr5203073ljp.140.1634630701908; 
 Tue, 19 Oct 2021 01:05:01 -0700 (PDT)
Received: from Unikie-T14-Gen-2i.madriguera.foxhound.fi
 (88-113-104-240.elisa-laajakaista.fi. [88.113.104.240])
 by smtp.googlemail.com with ESMTPSA id r3sm1607528lfc.114.2021.10.19.01.05.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 01:05:01 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
To: buildroot@buildroot.org
Date: Tue, 19 Oct 2021 11:04:58 +0300
Message-Id: <20211019080458.308969-1-jose.pekkarinen@unikie.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/softhsm2: new package
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
Cc: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBwYXRjaCBhZGRzIGEgcGFja2FnZSBmb3Igc29mdGhzbTIuCgpTaWduZWQtb2ZmLWJ5OiBK
b3PDqSBQZWtrYXJpbmVuIDxqb3NlLnBla2thcmluZW5AdW5pa2llLmNvbT4KLS0tClsgdjEgLT4g
djIgXQogIC0gQWRkZWQgaGFzaCBmaWxlIGFuZCBsaWNlbnNlIGluZm9ybWF0aW9uCiAgLSBNb3Zl
ZCByZWNpcGUgdG8gdXNlIHRhcmJhbGwKICAtIFByb3ZpZGVkIHN1cHBvcnQgdG8gYnVpbGQgYWdh
aW5zdCBkaWZmZXJlbnQgc3NsIGxpYnJhcmllcwogIC0gRml4ZWQgdG9vbGNoYWluIGRlcGVuZGVu
Y2llcyBhbmQgc3NsIHNlbGVjdAogIC0gUmVmZXJlbmNlZCB0aGUgcGFja2FnZSBpbiBwYWNrYWdl
L0NvbmZpZy5pbgogIC0gQWRkZWQgbXlzZWxmIGFzIGRldmVsb3BlcgoKIERFVkVMT1BFUlMgICAg
ICAgICAgICAgICAgICAgICB8ICAzICsrKwogcGFja2FnZS9Db25maWcuaW4gICAgICAgICAgICAg
IHwgIDEgKwogcGFja2FnZS9zb2Z0aHNtMi9Db25maWcuaW4gICAgIHwgMzUgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwogcGFja2FnZS9zb2Z0aHNtMi9zb2Z0aHNtMi5oYXNoIHwg
IDQgKysrKwogcGFja2FnZS9zb2Z0aHNtMi9zb2Z0aHNtMi5tayAgIHwgMTYgKysrKysrKysrKysr
KysrKwogNSBmaWxlcyBjaGFuZ2VkLCA1OSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2
NDQgcGFja2FnZS9zb2Z0aHNtMi9Db25maWcuaW4KIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdl
L3NvZnRoc20yL3NvZnRoc20yLmhhc2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3NvZnRo
c20yL3NvZnRoc20yLm1rCgpkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKaW5k
ZXggZjZjMzk1MTZiNS4uODNkMjBkNTZjYyAxMDA2NDQKLS0tIGEvREVWRUxPUEVSUworKysgYi9E
RVZFTE9QRVJTCkBAIC0yOTI3LDMgKzI5MjcsNiBAQCBGOglwYWNrYWdlL3Fqc29uLwogRjoJcGFj
a2FnZS9xdWF6aXAvCiBGOglwYWNrYWdlL3NoYXBlbGliLwogRjoJcGFja2FnZS90aW5jLworCitO
OglKb3PDqSBQZWtrYXJpbmVuIDxqb3NlLnBla2thcmluZW5AdW5pa2llLmNvbT4KK0Y6CXBhY2th
Z2Uvc29mdGhzbTIvCmRpZmYgLS1naXQgYS9wYWNrYWdlL0NvbmZpZy5pbiBiL3BhY2thZ2UvQ29u
ZmlnLmluCmluZGV4IDc5NzE3MjY4NzUuLjRmOWNkMzhhOTcgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uv
Q29uZmlnLmluCisrKyBiL3BhY2thZ2UvQ29uZmlnLmluCkBAIC0yMDE5LDYgKzIwMTksNyBAQCBt
ZW51ICJTZWN1cml0eSIKIAlzb3VyY2UgInBhY2thZ2UvbGlic2VtYW5hZ2UvQ29uZmlnLmluIgog
CXNvdXJjZSAicGFja2FnZS9saWJzZXBvbC9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL3Nh
ZmVjbGliL0NvbmZpZy5pbiIKKwlzb3VyY2UgInBhY2thZ2Uvc29mdGhzbTIvQ29uZmlnLmluIgog
ZW5kbWVudQogCiBtZW51ICJUZXh0IGFuZCB0ZXJtaW5hbCBoYW5kbGluZyIKZGlmZiAtLWdpdCBh
L3BhY2thZ2Uvc29mdGhzbTIvQ29uZmlnLmluIGIvcGFja2FnZS9zb2Z0aHNtMi9Db25maWcuaW4K
bmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uZTRjYTc1ZGUxMgotLS0gL2Rl
di9udWxsCisrKyBiL3BhY2thZ2Uvc29mdGhzbTIvQ29uZmlnLmluCkBAIC0wLDAgKzEsMzUgQEAK
K2NvbmZpZyBCUjJfUEFDS0FHRV9TT0ZUSFNNMgorCWJvb2wgInNvZnRoc20yIgorCWRlcGVuZHMg
b24gQlIyX0lOU1RBTExfTElCU1REQ1BQCisJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0dDQ19B
VF9MRUFTVF80XzggIyBDKysxMQorCWRlcGVuZHMgb24gIUJSMl9TVEFUSUNfTElCUyAjIGRsb3Bl
bigpCisJc2VsZWN0IEJSMl9QQUNLQUdFX09QRU5TU0wKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfT1BF
TlNTTF9GT1JDRV9MSUJPUEVOU1NMCisJaGVscAorCSAgU29mdEhTTSBpcyBhbiBpbXBsZW1lbnRh
dGlvbiBvZiBhIGNyeXB0b2dyYXBoaWMgc3RvcmUKKwkgIGFjY2Vzc2libGUgdGhyb3VnaCBhIFBL
Q1MjMTEgaW50ZXJmYWNlLiBZb3UgY2FuIHVzZSBpdAorCSAgdG8gZXhwbG9yZSBQS0NTIzExIHdp
dGhvdXQgaGF2aW5nIGEgSGFyZHdhcmUgU2VjdXJpdHkKKwkgIE1vZHVsZS4KKworCQlodHRwczov
L3d3dy5vcGVuZG5zc2VjLm9yZy9zb2Z0aHNtCisKK2Nob2ljZQorCXByb21wdCAiU1NML1RMUyBs
aWJyYXJ5IHRvIHVzZSIKKworY29uZmlnIEJSMl9QQUNLQUdFX1NPRlRIU00yX09QRU5TU0wKKwli
b29sICJPcGVuU1NMIgorCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfT1BFTlNTTAorCXNlbGVjdCBC
UjJfUEFDS0FHRV9MSUJPUEVOU1NMX0VOQUJMRV9ERVMgaWYgQlIyX1BBQ0tBR0VfTElCT1BFTlNT
TAorCitjb25maWcgQlIyX1BBQ0tBR0VfU09GVEhTTTJfQkVBUlNTTAorCWJvb2wgIkJlYXJTU0wi
CisJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9CRUFSU1NMCisKK2NvbmZpZyBCUjJfUEFDS0FHRV9T
T0ZUSFNNMl9XT0xGU1NMCisJYm9vbCAiV29sZlNTTCIKKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdF
X1dPTEZTU0wKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfV09MRlNTTF9BTEwKKworZW5kY2hvaWNlCisK
K2NvbW1lbnQgInNvZnRoc20yIG5lZWRzIGEgdG9vbGNoYWluIHdpdGggZHluYW1pYyBsaWJyYXJ5
IgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9zb2Z0aHNtMi9zb2Z0aHNtMi5oYXNoIGIvcGFja2FnZS9z
b2Z0aHNtMi9zb2Z0aHNtMi5oYXNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAw
MDAuLmEzM2UwZDdlNmYKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3NvZnRoc20yL3NvZnRo
c20yLmhhc2gKQEAgLTAsMCArMSw0IEBACisjIEZyb20gaHR0cHM6Ly93d3cub3BlbmRuc3NlYy5v
cmcvMjAyMC8wNC8xNjAyLworc2hhMjU2IDYxMjQ5NDczMDU0YmNkMTgxMTUxOWVmOWE5ODlhODgw
YTdiZGNjMzZkMzE3YzljMjU0NTdmYzYxNGRmNDc1ZjIgc29mdGhzbS0yLjYuMS50YXIuZ3oKKyMg
TG9jYWxseSBjb21wdXRlZAorc2hhMjU2IDIzMGNhYjcxMDI4MTZlOTlmN2NlMDNlZjQ3NjM1MmZj
YWQwOWQ3NDJmY2JjNjU4MGQ0NDM5M2RiNjI4MGI2NGMgTElDRU5TRQpkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9zb2Z0aHNtMi9zb2Z0aHNtMi5tayBiL3BhY2thZ2Uvc29mdGhzbTIvc29mdGhzbTIubWsK
bmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uNGI0N2RlZjNiZgotLS0gL2Rl
di9udWxsCisrKyBiL3BhY2thZ2Uvc29mdGhzbTIvc29mdGhzbTIubWsKQEAgLTAsMCArMSwxNiBA
QAorIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKKyMKKyMgc29mdGhzbTIKKyMKKyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjCisKK1NPRlRIU00yX1ZFUlNJT04gPSAyLjYuMQorU09GVEhTTTJfU09VUkNF
ID0gc29mdGhzbS0kKFNPRlRIU00yX1ZFUlNJT04pLnRhci5negorU09GVEhTTTJfU0lURSA9IGh0
dHBzOi8vZGlzdC5vcGVuZG5zc2VjLm9yZy9zb3VyY2UKK1NPRlRIU00yX0xJQ0VOU0UgPSBCU0Qt
Mi1DbGF1c2UKK1NPRlRIU00yX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCitTT0ZUSFNNMl9ERVBF
TkRFTkNJRVMgPSBvcGVuc3NsCitTT0ZUSFNNMl9BVVRPUkVDT05GID0gWUVTCitTT0ZUSFNNMl9J
TlNUQUxMX1NUQUdJTkcgPSBZRVMKKworJChldmFsICQoYXV0b3Rvb2xzLXBhY2thZ2UpKQotLSAK
Mi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
