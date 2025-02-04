Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88575C02193
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 17:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8E4941423;
	Tue,  4 Feb 2025 17:35:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t3e9jJFcC324; Tue,  4 Feb 2025 17:35:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6495D4109F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6495D4109F;
	Tue,  4 Feb 2025 17:35:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7192C12F
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 17:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60EA941191
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 17:35:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jYRhJZ-uCgpB for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 17:35:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=gael.portay+rtone@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E708340B57
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E708340B57
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E708340B57
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 17:35:03 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43658c452f5so7748635e9.0
 for <buildroot@buildroot.org>; Tue, 04 Feb 2025 09:35:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738690501; x=1739295301;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zDVp4Q8c0CZl/e5ZeGvxlG1TpDIflATajs2CDThQtuU=;
 b=ZYWvNS5ESwS7UR4MgvqFLylo/NOWmdibVra9SZn6FT6z1NOKC5sRhOkwnYQxaV/pwI
 nINktb0PXEyY3ywOO7X+xM8mDWiQSRNotuVMJdSgKl0+Dt835NeKkhzuwpclX6jh1ocm
 OfZPMRUnrr5iRP1DGdGHClQWSRS0JAzB9isfcaP3eIS4iXVna/Mvby+vQm1lIzmq0Kg8
 PoK3+WL85vWW71LOVXxBnikohAtDd04IWTO0Rwmm//ENaqBJqOH88PJm2pZExOcrFoFM
 gO2Sf2dlMzkSUV2gWKYVD/y8Q2suJ2UWj+UvN6D+zCZNTIBq/XCaXLZD23kqxU9lCVOf
 q6+g==
X-Gm-Message-State: AOJu0YyHSwuOe9kwvAxlrEFGG9zTtsZfqLdjs2Yh1JLZJDvgvD7zyDh0
 KFOA7mA5utdl+89cRg7yjpAMfGxZwbhm+9ZnR0MiTPrdjJQMkxBYGPhKqqwedLQ=
X-Gm-Gg: ASbGncuQldrX9uIPCy1zZ+XM1q0c3B2T3r3s3R7Py8y/Lt2N7MKIf/mkgeloxrr7dmD
 /GmLaqUn7MHVNgIbOAor+cNWfM1HIhQUzrvSHs8p/OvpzWA6kQpFuiQ13ainQI4XBrFkjokEIOF
 Lg21LZS2DAhSBWQFTiJC020CIAOTkdcjNav9rqLwu3Glo3a0wl6+Yfy6YbiHJyVUuG9Rj5xdfZW
 ceoIT4bE1wvIsD62apNPMyfK1r2ekTfgd9vYvdvc5SthUkMDDpcOGIHOZ7joInDIDnVSAG8T1nl
 tvIMaBLNz0gZWLI4OGGXpFwlOg==
X-Google-Smtp-Source: AGHT+IEFlpAB9LXr8zR8RnITTqR10yWt9Vc4Qd1md8eYQvKR66w1sBOY7D8SYBHaETvYRwpO5cXxYQ==
X-Received: by 2002:a05:600c:1c94:b0:42c:aeee:80a with SMTP id
 5b1f17b1804b1-438e183fecfmr85940385e9.7.1738690501436; 
 Tue, 04 Feb 2025 09:35:01 -0800 (PST)
Received: from archlinux.. ([78.244.185.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dadca52e6sm2092245f8f.0.2025.02.04.09.35.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 09:35:00 -0800 (PST)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Olivier Benjamin <olivier.benjamin@bootlin.com>
Date: Tue,  4 Feb 2025 18:34:55 +0100
Message-ID: <20250204173456.201056-2-gael.portay+rtone@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250204173456.201056-1-gael.portay+rtone@gmail.com>
References: <20250204173456.201056-1-gael.portay+rtone@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738690501; x=1739295301; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zDVp4Q8c0CZl/e5ZeGvxlG1TpDIflATajs2CDThQtuU=;
 b=lLwj21mMj46FIiWuD495HuZPtsa41m/VntRsXNLrOwhLGswfD1yqltrlq3V4lm9cv4
 sKDl5SmtyJ/iugbGk3bcWkCo/oRwynOXd/asxEdrgaAZSuEcDquI3e3c0ydCr/3qKMeN
 CiYUYTyjQBASIxDZPMo6o6AxtcCNzzbzokn/48hnX/EywQP5ZwApjwQMIsORhOhUSQc0
 xvD7plfiOkHXT9RtsLDE/UPEiaUKqbW5jTKd/euX7bneQMHcU/FbYq+gyM5Zo18xFSQd
 vNV47AunlRxjhycYuGpnUZplFlH/ZWegew9EOC1i3hS/1cdnxff6UI6n+s+aRE0L2iyl
 Czyw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lLwj21mM
Subject: [Buildroot] [PATCH v4 1/2] package/rpi-utils: new package
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

VGhlIHBhY2thZ2UgcnBpLXVzZXJsYW5kIGhhcyBiZWVuIG1hcmtlZCBhcyBhbmNpZW50IGFuZCBk
ZXByZWNhdGVkWzFdLgoKVGhlIHVzZWZ1bCB0b29scyAoZHRvdmVybGF5LCBkdG1lcmdlLCB2Y21h
aWxib3gsIHZjZ2VuY21kKSB3ZXJlIG1vdmVkIHRvCnRoZSByZXBvc2l0b3J5IHJwaS11dGlscyBz
aW5jZSB0aGVuLgoKVGhpcyBhZGRzIHRoZSBuZXcgcGFja2FnZSBycGktdXRpbHMgYXQgbGF0ZXN0
IGNvbW1pdCBhcyB0aGVyZSBpcyBubwp0YWdnZWQgY29tbWl0LgoKWzFdOiBodHRwczovL2dpdGh1
Yi5jb20vcmFzcGJlcnJ5cGkvdXNlcmxhbmQvY29tbWl0Lzk2YTczMzRhZTlkNWZjOWRiN2FjOTJl
NTk4NTIzNzdkZjYzZjE4NDgKClRlc3RlZC1ieTogT2xpdmllciBCZW5qYW1pbiA8b2xpdmllci5i
ZW5qYW1pbkBib290bGluLmNvbT4KU2lnbmVkLW9mZi1ieTogR2HDq2wgUE9SVEFZIDxnYWVsLnBv
cnRheStydG9uZUBnbWFpbC5jb20+Ci0tLQogREVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMSArCiBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICB8ICAxICsKIHBhY2th
Z2UvcnBpLXV0aWxzL0NvbmZpZy5pbiAgICAgIHwgMTIgKysrKysrKysrKysrCiBwYWNrYWdlL3Jw
aS11dGlscy9ycGktdXRpbHMuaGFzaCB8ICAzICsrKwogcGFja2FnZS9ycGktdXRpbHMvcnBpLXV0
aWxzLm1rICAgfCAxOCArKysrKysrKysrKysrKysrKysKIDUgZmlsZXMgY2hhbmdlZCwgMzUgaW5z
ZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcnBpLXV0aWxzL0NvbmZpZy5p
bgogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcnBpLXV0aWxzL3JwaS11dGlscy5oYXNoCiBj
cmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9ycGktdXRpbHMvcnBpLXV0aWxzLm1rCgpkaWZmIC0t
Z2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKaW5kZXggMmRhNWQxNzhiMi4uZmMxYmEyYWIy
NyAxMDA2NDQKLS0tIGEvREVWRUxPUEVSUworKysgYi9ERVZFTE9QRVJTCkBAIC0xMjAzLDYgKzEy
MDMsNyBAQCBGOglwYWNrYWdlL25naW54LW1vZHNlY3VyaXR5LwogTjoJR2HDq2wgUE9SVEFZIDxn
YWVsLnBvcnRheStydG9uZUBnbWFpbC5jb20+CiBGOglib2FyZC9yYXNwYmVycnlwaS8KIEY6CWNv
bmZpZ3MvcmFzcGJlcnJ5cGkqCitGOglwYWNrYWdlL3JwaS11dGlscy8KIAogTjoJR2FvIFhpYW5n
IDxoc2lhbmdrYW9AYW9sLmNvbT4KIEY6CXBhY2thZ2UvZXJvZnMtdXRpbHMvCmRpZmYgLS1naXQg
YS9wYWNrYWdlL0NvbmZpZy5pbiBiL3BhY2thZ2UvQ29uZmlnLmluCmluZGV4IGU5Yzc4OWNmZjIu
LmYwMmZlNTJmMzUgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvQ29uZmlnLmluCisrKyBiL3BhY2thZ2Uv
Q29uZmlnLmluCkBAIC00NTQsNiArNDU0LDcgQEAgbWVudSAiRmlybXdhcmUiCiAJc291cmNlICJw
YWNrYWdlL3FvcmlxLWZtLXVjb2RlL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvcmN3LXNt
YXJjLXNhbDI4L0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvcnBpLWZpcm13YXJlL0NvbmZp
Zy5pbiIKKwlzb3VyY2UgInBhY2thZ2UvcnBpLXV0aWxzL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBh
Y2thZ2Uvc3VueGktYm9hcmRzL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvdHM0OTAwLWZw
Z2EvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS91eDUwMC1maXJtd2FyZS9Db25maWcuaW4i
CmRpZmYgLS1naXQgYS9wYWNrYWdlL3JwaS11dGlscy9Db25maWcuaW4gYi9wYWNrYWdlL3JwaS11
dGlscy9Db25maWcuaW4KbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uYTI3
MjkxNjdhYQotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvcnBpLXV0aWxzL0NvbmZpZy5pbgpA
QCAtMCwwICsxLDEyIEBACitjb25maWcgQlIyX1BBQ0tBR0VfUlBJX1VUSUxTCisJYm9vbCAicnBp
LXV0aWxzIgorCWRlcGVuZHMgb24gIUJSMl9TVEFUSUNfTElCUyAjIGR0YworCXNlbGVjdCBCUjJf
UEFDS0FHRV9EVEMKKwloZWxwCisJICBBIGNvbGxlY3Rpb24gb2Ygc2NyaXB0cyBhbmQgc2ltcGxl
IGFwcGxpY2F0aW9ucyBmb3IgdGhlCisJICBSYXNwYmVycnkgUGkuCisKKwkgIGh0dHBzOi8vZ2l0
aHViLmNvbS9yYXNwYmVycnlwaS91dGlscy8KKworY29tbWVudCAicnBpLXV0aWxzIG5lZWRzIGEg
dG9vbGNoYWluIHcvIGR5bmFtaWMgbGlicmFyeSIKKwlkZXBlbmRzIG9uIEJSMl9TVEFUSUNfTElC
UwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9ycGktdXRpbHMvcnBpLXV0aWxzLmhhc2ggYi9wYWNrYWdl
L3JwaS11dGlscy9ycGktdXRpbHMuaGFzaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAw
MDAwMDAwLi5hNjYxMjM3M2IwCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9ycGktdXRpbHMv
cnBpLXV0aWxzLmhhc2gKQEAgLTAsMCArMSwzIEBACisjIExvY2FsbHkgY29tcHV0ZWQKK3NoYTI1
NiAgYzM1OTMyZTUwMWI0M2U1ZmI0OGNmYzQ4OGFhZGM0YThiYmNlYjBlOWU2ZGFmZGY2YzdjZDIw
NjZiNThhY2Q2MSAgcnBpLXV0aWxzLWExZDUyMmYwZjFiNTA4NThhNDRmYWM4MDUyM2EyYmQ4MDA5
OGU3ODkudGFyLmd6CitzaGEyNTYgIDczMWRhOTU2NDMxZDFhN2M1MDczZTdlZTVlYmUwMWY1NGUz
NTljNTMzOTMxMGIzMmYwODkzYzZmZTY1MDdkNWEgIExJQ0VOQ0UKZGlmZiAtLWdpdCBhL3BhY2th
Z2UvcnBpLXV0aWxzL3JwaS11dGlscy5tayBiL3BhY2thZ2UvcnBpLXV0aWxzL3JwaS11dGlscy5t
awpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi40OWRiM2FlZjlmCi0tLSAv
ZGV2L251bGwKKysrIGIvcGFja2FnZS9ycGktdXRpbHMvcnBpLXV0aWxzLm1rCkBAIC0wLDAgKzEs
MTggQEAKKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCisjCisjIHJwaS11dGlscworIworIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMKKworUlBJX1VUSUxTX1ZFUlNJT04gPSBhMWQ1MjJmMGYxYjUwODU4
YTQ0ZmFjODA1MjNhMmJkODAwOThlNzg5CitSUElfVVRJTFNfU0lURSA9ICQoY2FsbCBnaXRodWIs
cmFzcGJlcnJ5cGksdXRpbHMsJChSUElfVVRJTFNfVkVSU0lPTikpCitSUElfVVRJTFNfTElDRU5T
RSA9IEJTRC0zLUNsYXVzZQorUlBJX1VUSUxTX0xJQ0VOU0VfRklMRVMgPSBMSUNFTkNFCitSUElf
VVRJTFNfSU5TVEFMTF9TVEFHSU5HID0gWUVTCitSUElfVVRJTFNfREVQRU5ERU5DSUVTID0gZHRj
CisKKyMgRW5zdXJlIHRoZSBpbnRlcm5hbCBkdG92bCByZW1haW5zIGFuIGFyY2hpdmUgb2JqZWN0
IGFuZCBpdCBpcyBub3QgYnVpbHQgYXMgYQorIyBkeW5hbWljIGxpYnJhcnkgdGhhdCBpcyBsaW5r
ZWQgYnkgb3RoZXIgdXRpbGl0aWVzOyBhcyBpdCBpcyBub3QgaW5zdGFsbGVkLgorUlBJX1VUSUxT
X0NPTkZfT1BUUyA9IC1EU1RBVElDPVNUQVRJQworCiskKGV2YWwgJChjbWFrZS1wYWNrYWdlKSkK
LS0gCjIuNDguMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
