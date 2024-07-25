Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 138FAC3DA49
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 10:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2CC84046D;
	Thu, 25 Jul 2024 10:17:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TVYxRluivtip; Thu, 25 Jul 2024 10:17:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84B764088C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84B764088C;
	Thu, 25 Jul 2024 10:17:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 180CE1BF422
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 10:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0678E40931
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 10:17:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wJoS4tgP6Vhs for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 10:17:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=gael.portay@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7AECB4022B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7AECB4022B
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7AECB4022B
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 10:17:33 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-368584f9e36so375051f8f.2
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 03:17:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721902651; x=1722507451;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dgud2FeyzVP96qZkZv9lQeWa84/yqvq+itWlb2XKr9g=;
 b=RGKyxjAhi4S+J/M0q/tL0aHLT7bcQs2ztJO9XtEan8NhfJU2vgVf4U0YzjH6LqMUbP
 5tPi7B3hD7O1OWTXbZg+hsnbcVsGLzHhkpvVBn01VHmC9rWJkR26gQtfqoU5vIcz56b8
 dwB47ta2ChIQVUWkfoCxADGX2mxwlSgmZbcLDejFpB0gzAtaNObgpON8g0aXvjZMKW4E
 Q/SYSc+lIzsdJ3S4i6pgiEnMdbDU9JFKA5zBcvOeFPrP2wagdNZJmQlc1ub+I+Om2urF
 GnLCuSLsxJWpTK0bMZpPfpegX7jILPOOE/x+HTa0kJElei2v5C5TDu3dSb67GUrNvYns
 g/FQ==
X-Gm-Message-State: AOJu0YzoSsqhKur1BL1mRzBuX/Q/lDM6Y3/BS9JHs/shDP1waElTE7Z6
 B58VsDjZ2IgNSfWFMvMefgBW6ePINidQyivDtp3wHW4tIYoEZOT9JKj4k/GEyFI=
X-Google-Smtp-Source: AGHT+IFo2YpE97gfiaWqhaQpwaGFd/0mCiZ1s0jolVb5iLc9hyQf+4jjKLPXsX1DK5Ni/61TemYP/Q==
X-Received: by 2002:a5d:456b:0:b0:368:12ef:92cf with SMTP id
 ffacd0b85a97d-36b3641f37emr1177184f8f.48.1721902651060; 
 Thu, 25 Jul 2024 03:17:31 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b3686fdc5sm1629603f8f.114.2024.07.25.03.17.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 03:17:30 -0700 (PDT)
From: "=?UTF-8?q?Ga=C3=ABl=20PORTAY?=" <gael.portay@gmail.com>
X-Google-Original-From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Thu, 25 Jul 2024 12:17:10 +0200
Message-ID: <20240725101711.2443524-2-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240725101711.2443524-1-gael.portay@rtone.fr>
References: <20240725101711.2443524-1-gael.portay@rtone.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721902651; x=1722507451; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dgud2FeyzVP96qZkZv9lQeWa84/yqvq+itWlb2XKr9g=;
 b=nXfQZDfXtXtpLhLs/SJ6r3elfDFnT8EEOtru4bZoaTuZ20cbY2KSYyzw/2oBqqAgz5
 lEfkgPJ+HlgQGRCSNGuTPW3bEWOR/MR5FeJ6HBL0kbJtGW+4I1XPRcNW0/BjIQpXn69I
 V3EzRFr3G1dWgNWLyNcH1Mw4X+iEsPnY5YIjRXiE47BC8zgM4kCPLJovYRa3bdjywyB3
 hp8n/BDW8RjyBEGVWSdI+A1GBzAVjKz1XngILPYu+HscGsC3J2Iz5ahcs8Bere5pR/FA
 2ICXfa5857Hfsj3xB7Q6Wa9hVekItYhX3nGUIn0BIFcF+W5XN2OMYW2uIXRgnoMmPGNo
 Vqww==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nXfQZDfX
Subject: [Buildroot] [PATCH v2 1/2] package/rpi-utils: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
NTk4NTIzNzdkZjYzZjE4NDgKClNpZ25lZC1vZmYtYnk6IEdhw6tsIFBPUlRBWSA8Z2FlbC5wb3J0
YXlAcnRvbmUuZnI+Ci0tLQogREVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAgICAgfCAgMyAr
KysKIHBhY2thZ2UvQ29uZmlnLmluICAgICAgICAgICAgICAgIHwgIDEgKwogcGFja2FnZS9ycGkt
dXRpbHMvQ29uZmlnLmluICAgICAgfCAxNCArKysrKysrKysrKysrKwogcGFja2FnZS9ycGktdXRp
bHMvcnBpLXV0aWxzLmhhc2ggfCAgMyArKysKIHBhY2thZ2UvcnBpLXV0aWxzL3JwaS11dGlscy5t
ayAgIHwgMTggKysrKysrKysrKysrKysrKysrCiA1IGZpbGVzIGNoYW5nZWQsIDM5IGluc2VydGlv
bnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3JwaS11dGlscy9Db25maWcuaW4KIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3JwaS11dGlscy9ycGktdXRpbHMuaGFzaAogY3JlYXRl
IG1vZGUgMTAwNjQ0IHBhY2thZ2UvcnBpLXV0aWxzL3JwaS11dGlscy5tawoKZGlmZiAtLWdpdCBh
L0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCmluZGV4IDdkNmIzNjRlNTguLjBmMTBkMGRjMzAgMTAw
NjQ0Ci0tLSBhL0RFVkVMT1BFUlMKKysrIGIvREVWRUxPUEVSUwpAQCAtMTIwNCw2ICsxMjA0LDkg
QEAgTjoJRnJhbmsgVmFuYmV2ZXIgPGZyYW5rLnZhbmJldmVyQG1pbmQuYmU+CiBGOglwYWNrYWdl
L2xpYm1vZHNlY3VyaXR5LwogRjoJcGFja2FnZS9uZ2lueC1tb2RzZWN1cml0eS8KIAorTjoJR2HD
q2wgUE9SVEFZIDxnYWVsLnBvcnRheUBydG9uZS5mcj4KK0Y6CXBhY2thZ2UvcnBpLXV0aWxzLwor
CiBOOglHYW8gWGlhbmcgPGhzaWFuZ2thb0Bhb2wuY29tPgogRjoJcGFja2FnZS9lcm9mcy11dGls
cy8KIApkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4gYi9wYWNrYWdlL0NvbmZpZy5pbgpp
bmRleCA1ZjBlNzQ5MWM4Li4xNWIyODZiMmZiIDEwMDY0NAotLS0gYS9wYWNrYWdlL0NvbmZpZy5p
bgorKysgYi9wYWNrYWdlL0NvbmZpZy5pbgpAQCAtNDU3LDYgKzQ1Nyw3IEBAIG1lbnUgIkZpcm13
YXJlIgogCXNvdXJjZSAicGFja2FnZS9xb3JpcS1mbS11Y29kZS9Db25maWcuaW4iCiAJc291cmNl
ICJwYWNrYWdlL3Jjdy1zbWFyYy1zYWwyOC9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL3Jw
aS1maXJtd2FyZS9Db25maWcuaW4iCisJc291cmNlICJwYWNrYWdlL3JwaS11dGlscy9Db25maWcu
aW4iCiAJc291cmNlICJwYWNrYWdlL3N1bnhpLWJvYXJkcy9Db25maWcuaW4iCiAJc291cmNlICJw
YWNrYWdlL3RzNDkwMC1mcGdhL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvdXg1MDAtZmly
bXdhcmUvQ29uZmlnLmluIgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9ycGktdXRpbHMvQ29uZmlnLmlu
IGIvcGFja2FnZS9ycGktdXRpbHMvQ29uZmlnLmluCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IDAwMDAwMDAwMDAuLmIyYTI1ZjM2ZjUKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3JwaS11
dGlscy9Db25maWcuaW4KQEAgLTAsMCArMSwxNCBAQAorY29uZmlnIEJSMl9QQUNLQUdFX1JQSV9V
VElMUworCWJvb2wgInJwaS11dGlscyIKKwlkZXBlbmRzIG9uICFCUjJfU1RBVElDX0xJQlMgIyBk
dGMKKwlkZXBlbmRzIG9uICFCUjJfVE9PTENIQUlOX1VTRVNfVUNMSUJDICMgbm8gcmVhbGxvY2Fy
cmF5CisJc2VsZWN0IEJSMl9QQUNLQUdFX0RUQworCWhlbHAKKwkgIEEgY29sbGVjdGlvbiBvZiBz
Y3JpcHRzIGFuZCBzaW1wbGUgYXBwbGljYXRpb25zIGZvciB0aGUKKwkgIFJhc3BiZXJyeSBQaS4K
KworCSAgaHR0cHM6Ly9naXRodWIuY29tL3Jhc3BiZXJyeXBpL3V0aWxzLworCitjb21tZW50ICJy
cGktdXRpbHMgbmVlZHMgYSBnbGliYyBvciBtdXNsIHRvb2xjaGFpbiB3LyBkeW5hbWljIGxpYnJh
cnkiCisJZGVwZW5kcyBvbiBCUjJfU1RBVElDX0xJQlMKKwlkZXBlbmRzIG9uICFCUjJfVE9PTENI
QUlOX1VTRVNfVUNMSUJDCmRpZmYgLS1naXQgYS9wYWNrYWdlL3JwaS11dGlscy9ycGktdXRpbHMu
aGFzaCBiL3BhY2thZ2UvcnBpLXV0aWxzL3JwaS11dGlscy5oYXNoCm5ldyBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IDAwMDAwMDAwMDAuLmE2NjEyMzczYjAKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNr
YWdlL3JwaS11dGlscy9ycGktdXRpbHMuaGFzaApAQCAtMCwwICsxLDMgQEAKKyMgTG9jYWxseSBj
b21wdXRlZAorc2hhMjU2ICBjMzU5MzJlNTAxYjQzZTVmYjQ4Y2ZjNDg4YWFkYzRhOGJiY2ViMGU5
ZTZkYWZkZjZjN2NkMjA2NmI1OGFjZDYxICBycGktdXRpbHMtYTFkNTIyZjBmMWI1MDg1OGE0NGZh
YzgwNTIzYTJiZDgwMDk4ZTc4OS50YXIuZ3oKK3NoYTI1NiAgNzMxZGE5NTY0MzFkMWE3YzUwNzNl
N2VlNWViZTAxZjU0ZTM1OWM1MzM5MzEwYjMyZjA4OTNjNmZlNjUwN2Q1YSAgTElDRU5DRQpkaWZm
IC0tZ2l0IGEvcGFja2FnZS9ycGktdXRpbHMvcnBpLXV0aWxzLm1rIGIvcGFja2FnZS9ycGktdXRp
bHMvcnBpLXV0aWxzLm1rCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjQ5
ZGIzYWVmOWYKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3JwaS11dGlscy9ycGktdXRpbHMu
bWsKQEAgLTAsMCArMSwxOCBAQAorIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKKyMKKyMgcnBpLXV0
aWxzCisjCisjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIworCitSUElfVVRJTFNfVkVSU0lPTiA9IGEx
ZDUyMmYwZjFiNTA4NThhNDRmYWM4MDUyM2EyYmQ4MDA5OGU3ODkKK1JQSV9VVElMU19TSVRFID0g
JChjYWxsIGdpdGh1YixyYXNwYmVycnlwaSx1dGlscywkKFJQSV9VVElMU19WRVJTSU9OKSkKK1JQ
SV9VVElMU19MSUNFTlNFID0gQlNELTMtQ2xhdXNlCitSUElfVVRJTFNfTElDRU5TRV9GSUxFUyA9
IExJQ0VOQ0UKK1JQSV9VVElMU19JTlNUQUxMX1NUQUdJTkcgPSBZRVMKK1JQSV9VVElMU19ERVBF
TkRFTkNJRVMgPSBkdGMKKworIyBFbnN1cmUgdGhlIGludGVybmFsIGR0b3ZsIHJlbWFpbnMgYW4g
YXJjaGl2ZSBvYmplY3QgYW5kIGl0IGlzIG5vdCBidWlsdCBhcyBhCisjIGR5bmFtaWMgbGlicmFy
eSB0aGF0IGlzIGxpbmtlZCBieSBvdGhlciB1dGlsaXRpZXM7IGFzIGl0IGlzIG5vdCBpbnN0YWxs
ZWQuCitSUElfVVRJTFNfQ09ORl9PUFRTID0gLURTVEFUSUM9U1RBVElDCisKKyQoZXZhbCAkKGNt
YWtlLXBhY2thZ2UpKQotLSAKMi40NS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
