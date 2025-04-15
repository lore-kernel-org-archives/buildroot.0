Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE6DC369BA
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 15:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 536B983F73;
	Tue, 15 Apr 2025 15:31:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cvU51ff4p5M2; Tue, 15 Apr 2025 15:31:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77A2A83FAC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77A2A83FAC;
	Tue, 15 Apr 2025 15:31:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 58C2B109
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 15:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4EA4360BA8
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 15:31:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r1mcryyVUBvG for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 15:31:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=gael.portay+rtone@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0A6EB60BBD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A6EB60BBD
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0A6EB60BBD
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 15:31:40 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-39127effa72so493219f8f.2
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 08:31:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744731099; x=1745335899;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ha8TEsER2S2U43YDoIXyPm8Qa80G7TfK7spcQ68RNuI=;
 b=ZI1Zz7J5kQwVdPd0zINBAO2br3vWHhvWlAKNOwO3pqFd7nbEV3GPdY3IjHPTYQPS4h
 gFVnKWnYj23Qjs4oILpQzZ5tlDCHOiePs1NvuZ6LZPGSqGzLIzQCU208ARfzv2LjkuFi
 HDrcRCPsrciZNFvdPYG3/qczlCvgS5RQwfxF962gcHGmdsjLMGR/Ngo8BKqJQJS33K1V
 yRV4glkb6a04w1sIS7HwJ1Kt2iN/EcYfedHzCobGJm0Du+nWt950GnY8kVFcAX3mQPIG
 RFRAUMlrO0LR18OOea9Y3SMVcswfkT15L2wwXWh3M/ysfwSI2aDlLPPKYdOC1AzdS9Zx
 ukyw==
X-Gm-Message-State: AOJu0YzjXWixPCkFrI462DtVXzhDRoYCAWFk2+JdIhfYitQ6Ez83T/fa
 tP18H3pbTSs+A+gCbOOy5XoDC1GV2q5xAkH15yxZzBZjYHXyfjabFeeL6vSd
X-Gm-Gg: ASbGncuN2fiarBXUZ7ndWYn3qloT8HwaNyv6Q5J+cbZJFBYS73ZIPKYCVX4U7E2y6Q5
 xGE0mz6fkVk6yivus7sqg0Ic7qnprHwj5REPgN/LI/aUBGCnD6iwbqsJ7RnHJa3EzwwyzW77wEr
 k2M2WHT5hgXvQL7L+9+InyWY5j7/3Z53cMhEWuaRfw2HigneiBmDi46+ul++6jSrueME/NHyaHF
 WQq/+MrqaMSDk4b1VN2r4zgO3nEehpAt7T88X3iukty4D8IsUBzOp8gKkeVdVm8Z5tirMZT1TNn
 alKPgK4NxD+wkr5uHpAtPyQ54IiYnLawmKdTKXCrlLqgAcFb6v0=
X-Google-Smtp-Source: AGHT+IHrA0g0koiFDPgyuiAnECYYZEduwiopOcyfJ6w61YFt+Nhf80pcwIZ4lLDseVB2jKoscGAOPA==
X-Received: by 2002:a05:6000:220c:b0:39c:30d9:48 with SMTP id
 ffacd0b85a97d-39ea52048d7mr5151497f8f.6.1744731098519; 
 Tue, 15 Apr 2025 08:31:38 -0700 (PDT)
Received: from archlinux.. ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae963fccsm14458950f8f.3.2025.04.15.08.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 08:31:37 -0700 (PDT)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>
Date: Tue, 15 Apr 2025 17:31:26 +0200
Message-ID: <20250415153127.1868025-5-gael.portay+rtone@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415153127.1868025-1-gael.portay+rtone@gmail.com>
References: <20250415153127.1868025-1-gael.portay+rtone@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744731099; x=1745335899; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ha8TEsER2S2U43YDoIXyPm8Qa80G7TfK7spcQ68RNuI=;
 b=RXO2trrr42TZrtXKsw6ZGnfqpmx8wPGVxLzN3P7QXJNrivZTWMhlJdLrR+Wwy1jZ4z
 FKjEktfuamUiNifqxE45ser637d3Vwz2dRr1tIihUivOt61ZeShrKDlE9s5TlhPj1ktr
 iQUDm3VWLcqEVMPwHNNjZu+GrdsT8WwhFrf6ITiEJoZHZApp9c7m4QADzrBs6ZiTkgCg
 jczUkj/hryA5iV5EKw7iWD3YMJwupkRhZ9TS1ymCr8baEjamniCXYMA4ivA707U5NPSW
 wpUD7LeVzvWs73ZbctHwIgE9lps8OF5aiFA6vbP0GHLorA+Wawf1EJhGMO3WJj4bd3CB
 DVZw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RXO2trrr
Subject: [Buildroot] [PATCH 5/6] board/raspberrypi/readme.txt: add pi 400
 and cm{, 3, 4, 4s} hints
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

VGhpcyBhZGRzIGhpbnRzIGZvciB0aGUgUmFzcGJlcnJ5IFBpIDQwMCwgQ29tcHV0ZSBNb2R1bGUg
MSwgMywgNCwgYW5kCjRzLgoKU2lnbmVkLW9mZi1ieTogR2HDq2wgUE9SVEFZIDxnYWVsLnBvcnRh
eStydG9uZUBnbWFpbC5jb20+Ci0tLQogYm9hcmQvcmFzcGJlcnJ5cGkvcmVhZG1lLnR4dCB8IDE3
ICsrKysrKysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9ib2FyZC9yYXNwYmVycnlwaS9yZWFkbWUudHh0IGIv
Ym9hcmQvcmFzcGJlcnJ5cGkvcmVhZG1lLnR4dAppbmRleCA0YTA5MDM1NzhiLi40NzAzZDBhZGIx
IDEwMDY0NAotLS0gYS9ib2FyZC9yYXNwYmVycnlwaS9yZWFkbWUudHh0CisrKyBiL2JvYXJkL3Jh
c3BiZXJyeXBpL3JlYWRtZS50eHQKQEAgLTYsMTMgKzYsMTggQEAgSW50cm8KIFRoZXNlIGluc3Ry
dWN0aW9ucyBhcHBseSB0byBhbGwgbW9kZWxzIG9mIHRoZSBSYXNwYmVycnkgUGk6CiAgIC0gdGhl
IG9yaWdpbmFsIG1vZGVscyBBIGFuZCBCLAogICAtIHRoZSAiZW5oYW5jZWQiIG1vZGVscyBBKyBh
bmQgQissCisgIC0gdGhlIG1vZGVsIENNIChha2EgUmFzcGJlcnJ5IFBpIENvbXB1dGUgTW9kdWxl
KS4KICAgLSB0aGUgbW9kZWwgWmVybyAoYWthIFJhc3BiZXJyeSBQaSBaZXJvKQogICAtIHRoZSBt
b2RlbCBaZXJvIFcgKGFrYSBSYXNwYmVycnkgUGkgWmVybyBXKQogICAtIHRoZSBtb2RlbCBaZXJv
IDIgVyAoYWthIFJhc3BiZXJyeSBQaSBaZXJvIDIgVykKICAgLSB0aGUgbW9kZWwgQjIgKGFrYSBS
YXNwYmVycnkgUGkgMikKICAgLSB0aGUgbW9kZWwgQjMgKGFrYSBSYXNwYmVycnkgUGkgMykuCisg
IC0gdGhlIG1vZGVsIENNMyAoYWthIFJhc3BiZXJyeSBQaSBDb21wdXRlIE1vZHVsZSAzKS4KKyAg
LSB0aGUgbW9kZWwgQ00zKyAoYWthIFJhc3BiZXJyeSBQaSBDb21wdXRlIE1vZHVsZSAzKykuCiAg
IC0gdGhlIG1vZGVsIEI0IChha2EgUmFzcGJlcnJ5IFBpIDQpLgorICAtIHRoZSBtb2RlbCA0MDAg
KGFrYSBSYXNwYmVycnkgUGkgNDAwKS4KICAgLSB0aGUgbW9kZWwgQ000IChha2EgUmFzcGJlcnJ5
IFBpIENvbXB1dGUgTW9kdWxlIDQgYW5kIElPIEJvYXJkKS4KKyAgLSB0aGUgbW9kZWwgQ000cyAo
YWthIFJhc3BiZXJyeSBQaSBDb21wdXRlIE1vZHVsZSA0cykuCiAgIC0gdGhlIG1vZGVsIEI1IChh
a2EgUmFzcGJlcnJ5IFBpIDUpLgogCiBIb3cgdG8gYnVpbGQgaXQKQEAgLTI0LDcgKzI5LDcgQEAg
Q29uZmlndXJlIEJ1aWxkcm9vdAogVGhlcmUgYXJlIHNldmVyYWwgUmFzcGJlcnJ5IFBpIGRlZmNv
bmZpZyBmaWxlcyBpbiBCdWlsZHJvb3QsIG9uZSBmb3IKIGVhY2ggbWFqb3IgdmFyaWFudCwgd2hp
Y2ggeW91IHNob3VsZCBiYXNlIHlvdXIgd29yayBvbjoKIAotRm9yIG1vZGVscyBBLCBCLCBBKyBv
ciBCKzoKK0ZvciBtb2RlbHMgQSwgQiwgQSssIEIrIGFuZCBDTToKIAogICAkIG1ha2UgcmFzcGJl
cnJ5cGlfZGVmY29uZmlnCiAKQEAgLTQwLDcgKzQ1LDcgQEAgRm9yIG1vZGVsIFplcm8gMiBXICht
b2RlbCBCMyBpbiBzbWFsbGVyIGZvcm0gZmFjdG9yKToKIAogICAkIG1ha2UgcmFzcGJlcnJ5cGl6
ZXJvMndfZGVmY29uZmlnCiAKLUZvciBtb2RlbCBaZXJvIDIgVyAobW9kZWwgQjMgaW4gc21hbGxl
ciBmb3JtIGZhY3RvciwgNjQtYml0KToKK29yIGZvciBtb2RlbCBaZXJvIDIgVyAobW9kZWwgQjMg
aW4gc21hbGxlciBmb3JtIGZhY3RvciwgNjQtYml0KToKIAogICAkIG1ha2UgcmFzcGJlcnJ5cGl6
ZXJvMndfNjRfZGVmY29uZmlnCiAKQEAgLTQ4LDE5ICs1MywxOSBAQCBGb3IgbW9kZWwgMiBCOgog
CiAgICQgbWFrZSByYXNwYmVycnlwaTJfZGVmY29uZmlnCiAKLUZvciBtb2RlbCAzIEIgYW5kIEIr
OgorRm9yIG1vZGVsIDMgQiwgQissIENNMyBhbmQgQ00zKzoKIAogICAkIG1ha2UgcmFzcGJlcnJ5
cGkzX2RlZmNvbmZpZwogCi1vciBmb3IgbW9kZWwgMyBCIGFuZCBCKyAoNjQgYml0KToKK29yIGZv
ciBtb2RlbCAzIEIsIEIrLCBDTTMgYW5kIENNMysgKDY0IGJpdCk6CiAKICAgJCBtYWtlIHJhc3Bi
ZXJyeXBpM182NF9kZWZjb25maWcKIAotRm9yIG1vZGVsIDQgQjoKK0ZvciBtb2RlbCA0IEIsIDQw
MCwgQ000IGFuZCBDTTRzOgogCiAgICQgbWFrZSByYXNwYmVycnlwaTRfZGVmY29uZmlnCiAKLW9y
IGZvciBtb2RlbCA0IEIgKDY0IGJpdCk6CitvciBmb3IgbW9kZWwgNCBCLCA0MDAsIENNNCBhbmQg
Q000cyAoNjQgYml0KToKIAogICAkIG1ha2UgcmFzcGJlcnJ5cGk0XzY0X2RlZmNvbmZpZwogCi0t
IAoyLjQ5LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
