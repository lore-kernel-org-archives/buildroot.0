Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B0AC3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 12:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0E7F60A7D;
	Thu,  8 Aug 2024 12:39:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eWefzsedoduS; Thu,  8 Aug 2024 12:39:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1E5860A8F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1E5860A8F;
	Thu,  8 Aug 2024 12:39:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C53001BF2A6
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 12:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BEE5A40E01
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 12:39:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UIpqWGqcEmvv for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 12:39:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=gael.portay@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2266940E00
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2266940E00
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2266940E00
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 12:39:45 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-428e1915e18so6041615e9.1
 for <buildroot@buildroot.org>; Thu, 08 Aug 2024 05:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723120783; x=1723725583;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WdCb+HdYvQgrB0pHRD9L+AkOMkqkmrsLJztfd+mZ3oc=;
 b=Ir99V+cQoaGUdJbbJWWG7iihp2ODEh86X0tojZoNpmJLS4EsQ9+F9uzR+mYPWC1PG3
 9e9bpsAY0836bpoH8ottS83vsADt5Y98zZWeCteTk2itkCqLTH2v40iBrKsTJsCak6DT
 L1cCiMNqd4sSFbuxac8ysWmK2yb1iPNM2bbZmPrIqLYIOIk01vxn31JTfK+0U57Xg2eJ
 t46NNQkwS8WE8Tsp3mvKrN9dehBM0z0B2Af+LePEfXt4vr1Gk8wcKbv9/baMdZviO1UB
 lLHAogG9ywrk1BM8Mr1jbUYPy6rgoYZgRxkCaqGloCFFmVvdsR9Vq08rQiU+jcEjbxgF
 IINg==
X-Gm-Message-State: AOJu0Yw6GY53mSdVMlFDePtp8VjRd8AcgMkhUpLE6b5D/Zt/KfvlgSBb
 t9ScRXlNIU34DjaSpRil16w1WexXC2MEm5qAuTHNhpQGE9ETOVyzajpKL+/xXN0=
X-Google-Smtp-Source: AGHT+IFK0hLCWFQDHiAUFo0MZ6kp9DhiEYoYNGsj+wg8J3ljCBUrFcfYDo+owW446m+qpyxnJUru4Q==
X-Received: by 2002:a05:600c:3ca4:b0:428:abd:1df1 with SMTP id
 5b1f17b1804b1-4290aeee2d1mr16896085e9.9.1723120782374; 
 Thu, 08 Aug 2024 05:39:42 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:3a7c:76ff:fe01:6f05])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4290c74a7bcsm21609755e9.23.2024.08.08.05.39.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Aug 2024 05:39:41 -0700 (PDT)
From: "=?UTF-8?q?Ga=C3=ABl=20PORTAY?=" <gael.portay@gmail.com>
X-Google-Original-From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Thu,  8 Aug 2024 14:39:37 +0200
Message-ID: <20240808123938.898039-1-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723120783; x=1723725583; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WdCb+HdYvQgrB0pHRD9L+AkOMkqkmrsLJztfd+mZ3oc=;
 b=UGuo71eudSJiBsy0FVzIgn2MIyvXv5iacbr/nR/6Nak9q0nb/n4GRAnDj7iLGk+xle
 K2/NTdgpNLhEt43Z56TlHNFm6ojEdTBLG2Exv2I/Cooc7dqjEJRD3DnPGvnRLkhdKrtr
 T3xCyUgv/smP37bZyvQs3Bxw96FDY7Na7DAZSuQJQHTu7gRMDDGOLurEEqYo19kJuTs9
 wCSezLQ3IB5ntIRluBoqP0LA1c/srw/VK5y5BqNw98VCXHC5zXQjoB/h4upHZlN+08K7
 L1/vOAPTEfqc4/y4FMgK6n+/lolzdp3mMYpBjVOzeh56LnWca2jfsciCSIXKEDzgel20
 7zSg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UGuo71eu
Subject: [Buildroot] [PATCH 1/2] configs: add Raspberry Pi Zero 2 W 64-bit
 defconfig
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

VGhpcyBjb25maWd1cmF0aW9uIGJ1aWxkcyBhbiBpbWFnZSBmb3IgdGhlIFJhc3BiZXJyeSBQaSBa
ZXJvIDIgVwooNjQtYml0KS4KClNpZ25lZC1vZmYtYnk6IEdhw6tsIFBPUlRBWSA8Z2FlbC5wb3J0
YXlAcnRvbmUuZnI+Ci0tLQogYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnX3plcm8yd182NGJpdC50
eHQgfCAzMiArKysrKysrKysrKysrKysKIGJvYXJkL3Jhc3BiZXJyeXBpemVybzJ3LTY0ICAgICAg
ICAgICAgICAgIHwgIDEgKwogY29uZmlncy9yYXNwYmVycnlwaXplcm8yd182NF9kZWZjb25maWcg
ICAgfCA0OCArKysrKysrKysrKysrKysrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCA4MSBpbnNl
cnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnX3pl
cm8yd182NGJpdC50eHQKIGNyZWF0ZSBtb2RlIDEyMDAwMCBib2FyZC9yYXNwYmVycnlwaXplcm8y
dy02NAogY3JlYXRlIG1vZGUgMTAwNjQ0IGNvbmZpZ3MvcmFzcGJlcnJ5cGl6ZXJvMndfNjRfZGVm
Y29uZmlnCgpkaWZmIC0tZ2l0IGEvYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnX3plcm8yd182NGJp
dC50eHQgYi9ib2FyZC9yYXNwYmVycnlwaS9jb25maWdfemVybzJ3XzY0Yml0LnR4dApuZXcgZmls
ZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi42NjcyODcxMTI1Ci0tLSAvZGV2L251bGwK
KysrIGIvYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnX3plcm8yd182NGJpdC50eHQKQEAgLTAsMCAr
MSwzMiBAQAorIyBQbGVhc2Ugbm90ZSB0aGF0IHRoaXMgaXMgb25seSBhIHNhbXBsZSwgd2UgcmVj
b21tZW5kIHlvdSB0byBjaGFuZ2UgaXQgdG8gZml0CisjIHlvdXIgbmVlZHMuCisjIFlvdSBzaG91
bGQgb3ZlcnJpZGUgdGhpcyBmaWxlIHVzaW5nIEJSMl9QQUNLQUdFX1JQSV9GSVJNV0FSRV9DT05G
SUdfRklMRS4KKyMgU2VlIGh0dHA6Ly9idWlsZHJvb3Qub3JnL21hbnVhbC5odG1sI3Jvb3Rmcy1j
dXN0b20KKyMgYW5kIGh0dHA6Ly9lbGludXgub3JnL1JQaWNvbmZpZyBmb3IgYSBkZXNjcmlwdGlv
biBvZiBjb25maWcudHh0IHN5bnRheAorCitzdGFydF9maWxlPXN0YXJ0LmVsZgorZml4dXBfZmls
ZT1maXh1cC5kYXQKKwora2VybmVsPUltYWdlCisKKyMgVG8gdXNlIGFuIGV4dGVybmFsIGluaXRy
YW1mcyBmaWxlCisjaW5pdHJhbWZzIHJvb3Rmcy5jcGlvLmd6CisKKyMgRGlzYWJsZSBvdmVyc2Nh
biBhc3N1bWluZyB0aGUgZGlzcGxheSBzdXBwb3J0cyBkaXNwbGF5aW5nIHRoZSBmdWxsIHJlc29s
dXRpb24KKyMgSWYgdGhlIHRleHQgc2hvd24gb24gdGhlIHNjcmVlbiBkaXNhcHBlYXJzIG9mZiB0
aGUgZWRnZSwgY29tbWVudCB0aGlzIG91dAorZGlzYWJsZV9vdmVyc2Nhbj0xCisKKyMgSG93IG11
Y2ggbWVtb3J5IGluIE1CIHRvIGFzc2lnbiB0byB0aGUgR1BVIG9uIFBpIG1vZGVscyBoYXZpbmcK
KyMgMjU2LCA1MTIgb3IgMTAyNCBNQiB0b3RhbCBtZW1vcnkKK2dwdV9tZW1fMjU2PTEwMAorZ3B1
X21lbV81MTI9MTAwCitncHVfbWVtXzEwMjQ9MTAwCisKKyMgZml4ZXMgcnBpICgzQiwgM0IrLCAz
QSssIDRCIGFuZCBaZXJvIFcpIHR0eUFNQTAgc2VyaWFsIGNvbnNvbGUKK2R0b3ZlcmxheT1taW5p
dWFydC1idAorCisjIGVuYWJsZSBhdXRvcHJvYmluZyBvZiBCbHVldG9vdGggZHJpdmVyIHdpdGhv
dXQgbmVlZCBvZiBoY2lhdHRhY2gvYnRhdHRhY2gKK2R0cGFyYW09a3JuYnQ9b24KKworIyBlbmFi
bGUgNjRiaXRzIHN1cHBvcnQKK2FybV82NGJpdD0xCmRpZmYgLS1naXQgYS9ib2FyZC9yYXNwYmVy
cnlwaXplcm8ydy02NCBiL2JvYXJkL3Jhc3BiZXJyeXBpemVybzJ3LTY0Cm5ldyBmaWxlIG1vZGUg
MTIwMDAwCmluZGV4IDAwMDAwMDAwMDAuLmZjZGFmYzgxZWQKLS0tIC9kZXYvbnVsbAorKysgYi9i
b2FyZC9yYXNwYmVycnlwaXplcm8ydy02NApAQCAtMCwwICsxIEBACityYXNwYmVycnlwaQpcIE5v
IG5ld2xpbmUgYXQgZW5kIG9mIGZpbGUKZGlmZiAtLWdpdCBhL2NvbmZpZ3MvcmFzcGJlcnJ5cGl6
ZXJvMndfNjRfZGVmY29uZmlnIGIvY29uZmlncy9yYXNwYmVycnlwaXplcm8yd182NF9kZWZjb25m
aWcKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uN2MzNjE4M2E5ZgotLS0g
L2Rldi9udWxsCisrKyBiL2NvbmZpZ3MvcmFzcGJlcnJ5cGl6ZXJvMndfNjRfZGVmY29uZmlnCkBA
IC0wLDAgKzEsNDggQEAKK0JSMl9hYXJjaDY0PXkKK0JSMl9jb3J0ZXhfYTUzPXkKK0JSMl9BUk1f
RlBVX1ZGUFY0PXkKKworIyBwYXRjaGVzCitCUjJfR0xPQkFMX1BBVENIX0RJUj0iYm9hcmQvcmFz
cGJlcnJ5cGkvcGF0Y2hlcyIKK0JSMl9ET1dOTE9BRF9GT1JDRV9DSEVDS19IQVNIRVM9eQorCisj
IExpbnV4IGhlYWRlcnMgc2FtZSBhcyBrZXJuZWwsIGEgNi42IHNlcmllcworQlIyX1BBQ0tBR0Vf
SE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV82XzY9eQorCitCUjJfVE9PTENIQUlOX0JVSUxEUk9P
VF9DWFg9eQorCitCUjJfTElOVVhfS0VSTkVMPXkKK0JSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1RB
UkJBTEw9eQorQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVEFSQkFMTF9MT0NBVElPTj0iJChjYWxs
IGdpdGh1YixyYXNwYmVycnlwaSxsaW51eCw1NzZjYzEwZTFlZDUwYTllYWNmZmM3YTA1Yzc5NjA1
MWQ3MzQzZWE0KS9saW51eC01NzZjYzEwZTFlZDUwYTllYWNmZmM3YTA1Yzc5NjA1MWQ3MzQzZWE0
LnRhci5neiIKK0JSMl9MSU5VWF9LRVJORUxfREVGQ09ORklHPSJiY21ycGkzIgorCisjIEJ1aWxk
IHRoZSBEVEIgZnJvbSB0aGUga2VybmVsIHNvdXJjZXMKK0JSMl9MSU5VWF9LRVJORUxfRFRTX1NV
UFBPUlQ9eQorQlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRTX05BTUU9ImJyb2FkY29tL2JjbTI3
MTAtcnBpLXplcm8tMi13IgorCitCUjJfTElOVVhfS0VSTkVMX05FRURTX0hPU1RfT1BFTlNTTD15
CisKK0JSMl9QQUNLQUdFX1JQSV9GSVJNV0FSRT15CitCUjJfUEFDS0FHRV9SUElfRklSTVdBUkVf
Qk9PVENPREVfQklOPXkKK0JSMl9QQUNLQUdFX1JQSV9GSVJNV0FSRV9WQVJJQU5UX1BJPXkKK0JS
Ml9QQUNLQUdFX1JQSV9GSVJNV0FSRV9DT05GSUdfRklMRT0iYm9hcmQvcmFzcGJlcnJ5cGl6ZXJv
MnctNjQvY29uZmlnX3plcm8yd182NGJpdC50eHQiCisKKyMgUmVxdWlyZWQgdG9vbHMgdG8gY3Jl
YXRlIHRoZSBTRCBpbWFnZQorQlIyX1BBQ0tBR0VfSE9TVF9ET1NGU1RPT0xTPXkKK0JSMl9QQUNL
QUdFX0hPU1RfR0VOSU1BR0U9eQorQlIyX1BBQ0tBR0VfSE9TVF9NVE9PTFM9eQorCisjIEZpbGVz
eXN0ZW0gLyBpbWFnZQorQlIyX1RBUkdFVF9ST09URlNfRVhUMj15CitCUjJfVEFSR0VUX1JPT1RG
U19FWFQyXzQ9eQorQlIyX1RBUkdFVF9ST09URlNfRVhUMl9TSVpFPSIxMjBNIgorIyBCUjJfVEFS
R0VUX1JPT1RGU19UQVIgaXMgbm90IHNldAorQlIyX1JPT1RGU19QT1NUX0JVSUxEX1NDUklQVD0i
Ym9hcmQvcmFzcGJlcnJ5cGl6ZXJvMnctNjQvcG9zdC1idWlsZC5zaCIKK0JSMl9ST09URlNfUE9T
VF9JTUFHRV9TQ1JJUFQ9ImJvYXJkL3Jhc3BiZXJyeXBpemVybzJ3LTY0L3Bvc3QtaW1hZ2Uuc2gi
CisKKyMgRW5hYmxlIGNvbXByZXNzZWQga2VybmVsIG1vZHVsZSBzdXBwb3J0CitCUjJfUEFDS0FH
RV9CVVNZQk9YX1NIT1dfT1RIRVJTPXkKK0JSMl9QQUNLQUdFX0tNT0RfVE9PTFM9eQorQlIyX1BB
Q0tBR0VfWFo9eQorQlIyX1BBQ0tBR0VfS01PRD15CitCUjJfUEFDS0FHRV9IT1NUX0tNT0RfWFo9
eQotLSAKMi40Ni4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
