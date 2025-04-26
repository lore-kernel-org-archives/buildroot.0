Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A161CC369CB
	for <buildroot@archiver.kernel.org>; Sat, 26 Apr 2025 13:13:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CE4D4082E;
	Sat, 26 Apr 2025 13:13:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L9kirxyo8PMH; Sat, 26 Apr 2025 13:13:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1370740576
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1370740576;
	Sat, 26 Apr 2025 13:13:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 85650C5
 for <buildroot@buildroot.org>; Sat, 26 Apr 2025 13:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7701E40576
 for <buildroot@buildroot.org>; Sat, 26 Apr 2025 13:13:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tok1jzAih2vg for <buildroot@buildroot.org>;
 Sat, 26 Apr 2025 13:13:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=gael.portay+rtone@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 720B74050D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 720B74050D
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 720B74050D
 for <buildroot@buildroot.org>; Sat, 26 Apr 2025 13:13:37 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43eeb4e09b5so4034495e9.1
 for <buildroot@buildroot.org>; Sat, 26 Apr 2025 06:13:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745673214; x=1746278014;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FAC3LjNMwASgj9RtIlNPASowwTrNMmKdZhWEL8N3Gog=;
 b=rKVn+vm3filQXl1hweUBle1579v05GxDVcDL/UhqaiuJLX7/VYqJx7focP+AhBttPj
 +aea80T0YFTjFBw7a/1qWqowNeloA5S+JCBWfw5k9pgl/hT7rqC3Ju/hsgxjuNQuTy9r
 2gqYdQ/J1xMOfdaZou4Otqht9ldpYnf5mpbEO4ihVtaXD8TP8pinBiOnwUXAtRYH96oL
 UJw2avygbB6+9oV4PgbZBy8/EuFaiDnM7dXKydl1kjtYa46iCym1jx2XWnDxmBpuMRF4
 ZTo4MFQHxR0TP4HIgojzFF65XwwbcI02ADMJWVXxiI3ArHwygB64v8c2Gi5GIWg6rdC5
 DzCA==
X-Gm-Message-State: AOJu0YzNXsfjgpfFiTlzHuMguIZVr2oOYYNcR4q987yOxuhAZZ3W717k
 XSEsrr/+2W8nGMVKDy/ipWpzveeop8vgtA7tfKbYoaT++Frzkq7ykzFDaYox
X-Gm-Gg: ASbGncvUY3qL3eePIpaUNGSDGY+0N69q884pg8lkn8Pe59t7PWMvrBBbXJnjkCAVS+9
 SU7fMhCOjSmc8BIjESIjQqr4EXqe5Pd+HQCUDiHpW8m0saD3VvC+JSBBFJW0QnZRwnAsVw8k411
 4xqO6J4w/UTE8y+iyPMofJrtPdpj3JgVgHz8ksHUqLucmoYpnF6/78lUzbQICFGrTD5TtcPgOmI
 mXV/oZ9AB1Fpg8Kwr2AssLhDC5/9N8egO3Z8uSMeiF274dGBBCULqQKJAB8AxT6+W/hchm6jcSu
 Gik8E2AcShzjaW2H5RnVadaTkyynFaDHL0fj/c56rXfdCP+FwQMQG/CtvAKMDA==
X-Google-Smtp-Source: AGHT+IHE/wBn7BpOka9FHdhYXGV4D4ru1MfP0EzVF46SUZ4jV5GrQunfEna9uPijDnOwHrDs2esInA==
X-Received: by 2002:a5d:5f4f:0:b0:39f:728:4324 with SMTP id
 ffacd0b85a97d-3a074e2fd46mr1667054f8f.9.1745673214410; 
 Sat, 26 Apr 2025 06:13:34 -0700 (PDT)
Received: from archlinux.. ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4409d2ac5a9sm93201315e9.23.2025.04.26.06.13.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Apr 2025 06:13:33 -0700 (PDT)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>
Date: Sat, 26 Apr 2025 15:13:31 +0200
Message-ID: <20250426131331.2479358-1-gael.portay+rtone@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745673214; x=1746278014; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=FAC3LjNMwASgj9RtIlNPASowwTrNMmKdZhWEL8N3Gog=;
 b=M4CaE/Aa5mu7+rV80Cm54GdSH9oCRtrw4HKXAUfsjb8IeHpX6P912U2Hg/yCfUeOvn
 6LX6ZFBw1/DM6w8JYXzXszQhGzCyvWxugfNrP8AF3Fp6Otjil1mAGRgOFkYtirpEATB0
 t4h8I9e0dxuPdVC2A3jmUeKGuP5ZZOYJ2qe/62maYxOKY2j8IPm3vRzGhOtRu2MX8gyR
 sCo3MWJExUTshY/Cne8FrL9BK6nWyBlZG5iozJ2eQAVXsEk9ygHB10as4/pJ+luB5yeZ
 IT+CQrlyfRmongrv4iadVcTlSlOxaVFPSN9DLs9wIj+0AVdZbZUXWnF+j+APk73QGRoy
 FRYA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=M4CaE/Aa
Subject: [Buildroot] [PATCH 1/1] configs/raspberrypi3_qt5we: switch to mesa3d
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
ZXByZWNhdGVkWzFdLgoKSXQgY29udGFpbnMgY29kZSB1c2luZyBwcm9wcmlldGFyeSBBUElzIHRv
IGludGVyZmFjZSB0byB0aGUgVmlkZW9Db3JlCmZpcm13YXJlLiBJdCBoYXMgbW92ZWQgdG8gc3Rh
bmRhcmQgbGludXggQVBJcy4KCkl0IGlzIHJlY29tbWVuZGVkIHRvIHVzZSBEUk0vS01TIGFuZCBN
ZXNhIGluc3RlYWQuCgpUaGlzIHN3aXRjaGVzIHRvIHRoZSBtZXNhM2QgT3BlbkdMRVMgYmFja2Vu
ZCBpbnN0ZWFkIG9mIHRoZSBkZXByZWNhdGVkCm9uZSBwcm92aWRlZCBieSBycGktdXNlcmxhbmQu
IEl0IGltcGxpZXMgdGhlIGxvYWQgZm9yIHRoZSB2YzQta21zLXYzZApkZXZpY2UtdHJlZSBvdmVy
bGF5LgoKWzFdOiBodHRwczovL2dpdGh1Yi5jb20vcmFzcGJlcnJ5cGkvdXNlcmxhbmQvY29tbWl0
Lzk2YTczMzRhZTlkNWZjOWRiN2FjOTJlNTk4NTIzNzdkZjYzZjE4NDgKClNpZ25lZC1vZmYtYnk6
IEdhw6tsIFBPUlRBWSA8Z2FlbC5wb3J0YXkrcnRvbmVAZ21haWwuY29tPgotLS0KIGJvYXJkL3Jh
c3BiZXJyeXBpL2NvbmZpZ18zX3F0NXdlLnR4dCB8IDMgKysrCiBjb25maWdzL3Jhc3BiZXJyeXBp
M19xdDV3ZV9kZWZjb25maWcgfCA0ICsrKy0KIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmln
XzNfcXQ1d2UudHh0IGIvYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnXzNfcXQ1d2UudHh0CmluZGV4
IDNkODFhNGU1ZGEuLmVkMTg4ZDczZmUgMTAwNjQ0Ci0tLSBhL2JvYXJkL3Jhc3BiZXJyeXBpL2Nv
bmZpZ18zX3F0NXdlLnR4dAorKysgYi9ib2FyZC9yYXNwYmVycnlwaS9jb25maWdfM19xdDV3ZS50
eHQKQEAgLTI0LDMgKzI0LDYgQEAgZ3B1X21lbV8xMDI0PTIwMAogCiAjIEVuYWJsZSBVQVJUMCBm
b3Igc2VyaWFsIGNvbnNvbGUgb24gdHR5QU1BMAogZHRvdmVybGF5PW1pbml1YXJ0LWJ0CisKKyMg
RW5hYmxlIERSTSBWQzQgVjNEIGRyaXZlcgorZHRvdmVybGF5PXZjNC1rbXMtdjNkCmRpZmYgLS1n
aXQgYS9jb25maWdzL3Jhc3BiZXJyeXBpM19xdDV3ZV9kZWZjb25maWcgYi9jb25maWdzL3Jhc3Bi
ZXJyeXBpM19xdDV3ZV9kZWZjb25maWcKaW5kZXggZGM4MTYwNzExZC4uYjg2YzMzMDQzZiAxMDA2
NDQKLS0tIGEvY29uZmlncy9yYXNwYmVycnlwaTNfcXQ1d2VfZGVmY29uZmlnCisrKyBiL2NvbmZp
Z3MvcmFzcGJlcnJ5cGkzX3F0NXdlX2RlZmNvbmZpZwpAQCAtMjAsNiArMjAsOSBAQCBCUjJfTElO
VVhfS0VSTkVMX05FRURTX0hPU1RfT1BFTlNTTD15CiBCUjJfUEFDS0FHRV9CVVNZQk9YX1NIT1df
T1RIRVJTPXkKIEJSMl9QQUNLQUdFX1haPXkKIEJSMl9QQUNLQUdFX0xJQkVSQVRJT049eQorQlIy
X1BBQ0tBR0VfTUVTQTNEPXkKK0JSMl9QQUNLQUdFX01FU0EzRF9HQUxMSVVNX0RSSVZFUl9WQzQ9
eQorQlIyX1BBQ0tBR0VfTUVTQTNEX09QRU5HTF9FUz15CiBCUjJfUEFDS0FHRV9RVDU9eQogQlIy
X1BBQ0tBR0VfUVQ1QkFTRV9FWEFNUExFUz15CiBCUjJfUEFDS0FHRV9RVDVCQVNFX0dJRj15CkBA
IC0yOSw3ICszMiw2IEBAIEJSMl9QQUNLQUdFX1JQSV9GSVJNV0FSRT15CiBCUjJfUEFDS0FHRV9S
UElfRklSTVdBUkVfQk9PVENPREVfQklOPXkKIEJSMl9QQUNLQUdFX1JQSV9GSVJNV0FSRV9WQVJJ
QU5UX1BJPXkKIEJSMl9QQUNLQUdFX1JQSV9GSVJNV0FSRV9DT05GSUdfRklMRT0iYm9hcmQvcmFz
cGJlcnJ5cGkzL2NvbmZpZ18zX3F0NXdlLnR4dCIKLUJSMl9QQUNLQUdFX1JQSV9VU0VSTEFORD15
CiBCUjJfUEFDS0FHRV9DQV9DRVJUSUZJQ0FURVM9eQogQlIyX1BBQ0tBR0VfTlRQPXkKIEJSMl9Q
QUNLQUdFX0tNT0RfVE9PTFM9eQotLSAKMi40OS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
