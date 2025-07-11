Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E5F3C83F1A
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 16:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FE5A4111D;
	Fri, 11 Jul 2025 16:44:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pXkn_cM9Ji_k; Fri, 11 Jul 2025 16:44:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B975F41112
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B975F41112;
	Fri, 11 Jul 2025 16:44:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D6BF114
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 16:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F44D60BA9
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 16:44:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AYHbhRU2Mn3S for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 16:44:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 414FA60898
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 414FA60898
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 414FA60898
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 16:44:16 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4537edf2c3cso24124885e9.3
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 09:44:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752252253; x=1752857053;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mv8AyP6uZ0PW+4DXOgi2xVXXWRn4H9HLrhSFW1+FjlY=;
 b=QU65hDG7Qsy0+de712tsFNmayx0lsBFuwc+Jz7k1BKeXXuof89XExzSxGc1ENbYuzS
 lBDqfXTTIq2S00XyuNmLU/l7s5M1kqY5QXxMoJynQop0zF0XHLPUQ7fqaQSx5CJ+mMl9
 u5iLPiztmp5FZq4y3TEXCnqy2j+jDlhVESXvGWRVHv1mc5waxFxyYqrer0DU7f5SddV1
 tkYyiqVKGQLYAha3rUYRBHMND9hf4RaffxFiDZj9K+x+ssDoJj4B8jHJfl92nkInepje
 ujr9ILzl3Fo/73hWbAsMk4WgX/OjCNVBsZjfHxLZtqzQyfxn01l85e0u1q0HsakLV71G
 nQwA==
X-Gm-Message-State: AOJu0YzhbRt4iKcTE1OS7PRApX06mjEMgQh3jif1kPIaGSh6gl8r1NQK
 X3GxT6rlDqyxia33EEEsNQZCmbtwlunkirKm+r5p7nbp7peYvqiPqGKQRcC1nl3tZVMqJGNPOqR
 1enTKroM=
X-Gm-Gg: ASbGnctEOeY0/RDSzY5byFgINUFaarZxXZcj3XygywumKc2qYVJ+d2B8gZe861R7KEg
 FTpZdSeYy+4hLf5XHaq4zqv9YXXhA+6bOPL6iQOtdX9pnf/Y3BGFZbwBivwDthxHnp5n4gODg6h
 0moMH65MzHZA5f2qsQJk9fIUpoVWHw/hR0v/dhjDc0A8ew/uj08mUpSUTKcS0cNgjG7LS3QRlqN
 PguxOV+ZKnZWJSUa0HguM0p9n77tZFnqxh0+5E8PPy+vEXLfsoYAKiacvhbqnkI/lkeRUU8GwjU
 csaPIGxrAl/pdOwr716ccMfHiUscQQ3Pskj0W6/0Is0L4T1DDLiMg54itx/uI88e7vQBVGY3tOx
 KndL7cmFJnJBiueqU43l8tieuRSN3ife6mA==
X-Google-Smtp-Source: AGHT+IEMjUQFntGBPgx0WbHZV9SayM8ZAgxBCsr+dg2TkeM6jcMniUz11wnO0AikNmtq397Infov1g==
X-Received: by 2002:a05:600c:1f87:b0:439:9b2a:1b2f with SMTP id
 5b1f17b1804b1-454ec133ae2mr41472365e9.3.1752252253574; 
 Fri, 11 Jul 2025 09:44:13 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-455f8fc5a01sm5725695e9.32.2025.07.11.09.44.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 09:44:09 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 94BE95F8C4;
 Fri, 11 Jul 2025 17:44:08 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Fri, 11 Jul 2025 17:44:03 +0100
Message-ID: <20250711164407.799041-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250711164407.799041-1-alex.bennee@linaro.org>
References: <20250711164407.799041-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752252253; x=1752857053; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mv8AyP6uZ0PW+4DXOgi2xVXXWRn4H9HLrhSFW1+FjlY=;
 b=U+41Qb3u6nCwPsGE3QJW25n6Z5hMnhjl/3+2HsDz5r/pxpUDaQVU3qccnSwCUSZqce
 5jYs+HtZbVOm6NSMOxoN/ZMyKO4lXOWWzgo639Wc7v0R/b1jrIcAFBiNpSPm1UHCh6iz
 SVNrlZuLCLumYv2qPCVMJAxxld1+jnG67nJPt9qkESANkbi8/WohnJjJmo62Grp4f3N1
 +Jv/YUz0Yhjs8QtZ/JS3Q9ZvqvLNIS95mP9j0nNWN3CVnLzacuOrwtooSYEcnfD73QmP
 goDDGGKzIv9k98vodfb6lWyOPp5lhQzUzsxEqXgkvsRez7sqK2s3d4Ctr7M0ZqBoMyX3
 WXgw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=U+41Qb3u
Subject: [Buildroot] [RFC PATCH v2 5/7] package/kvm-unit-tests: bump to
 2025-06-05
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
Cc: Thomas Huth <huth@tuxfamily.org>, Cyril Bur <cyrilbur@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VXBkYXRlIHRvIHRoZSBjdXJyZW50IHZlcnNpb24gb2YgS1ZNIHVuaXQgdGVzdHMuIEltcG9ydGFu
dGx5IGNoYW5nZXMKdGhlIGRlZmF1bHQgcGFnZSBzaXplIHRvIDRrIChpbnN0ZWFkIG9mIDY0aykg
d2hpY2ggbWlnaHQgZXhwbGFpbiB0aGUKZGlmZmljdWx0eSBpbiBydW5uaW5nIHRoZSB0ZXN0cyB1
bmRlciBIVkYgb24gQXBwbGUgU2lsaWNvbi4KClNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8
YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KLS0tCiBwYWNrYWdlL2t2bS11bml0LXRlc3RzL2t2bS11
bml0LXRlc3RzLmhhc2ggfCAyICstCiBwYWNrYWdlL2t2bS11bml0LXRlc3RzL2t2bS11bml0LXRl
c3RzLm1rICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2t2bS11bml0LXRlc3RzL2t2bS11bml0LXRl
c3RzLmhhc2ggYi9wYWNrYWdlL2t2bS11bml0LXRlc3RzL2t2bS11bml0LXRlc3RzLmhhc2gKaW5k
ZXggZDRkYjlmMmI3NS4uYWQwOTIyZGY1OSAxMDA2NDQKLS0tIGEvcGFja2FnZS9rdm0tdW5pdC10
ZXN0cy9rdm0tdW5pdC10ZXN0cy5oYXNoCisrKyBiL3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMva3Zt
LXVuaXQtdGVzdHMuaGFzaApAQCAtMSw0ICsxLDQgQEAKICMgTG9jYWxseSBjb21wdXRlZAotc2hh
MjU2ICA4NjM2OTk0ZTEwMjQwNzA1ZjEwYTkxNTBlZjY4OGFlNjgzMmQwZWEwZGNjODg2MGM4MjZj
NjQ1ZWNmYzExNjlmICBrdm0tdW5pdC10ZXN0cy12MjAyNC0wMS0wOC50YXIuYnoyCitzaGEyNTYg
IDYwMDE1YjAyM2YzNDI2MWMxMzRkNzE0ZjQ2NzA5MjZhYzgxNDgzZTI4NmExNjQ3NWViNGE1Y2Vk
YWIwMGVlZmEgIGt2bS11bml0LXRlc3RzLXYyMDI1LTA2LTA1LnRhci5iejIKIHNoYTI1NiAgYjNj
OWNhOWUyNTdmMmVhYWUwNzBjZjBjY2RmODc3MDc2NGYwNWE5NDdhMzlhODM1ZTYzMzQxMzc1MGE1
Nzc3YiAgQ09QWVJJR0hUCiBzaGEyNTYgIDgxNzdmOTc1MTMyMTM1MjZkZjJjZjYxODRkOGZmOTg2
YzY3NWFmYjUxNGQ0ZTY4YTQwNDAxMDUyMWI4ODA2NDMgIExJQ0VOU0UKZGlmZiAtLWdpdCBhL3Bh
Y2thZ2Uva3ZtLXVuaXQtdGVzdHMva3ZtLXVuaXQtdGVzdHMubWsgYi9wYWNrYWdlL2t2bS11bml0
LXRlc3RzL2t2bS11bml0LXRlc3RzLm1rCmluZGV4IDczZDIwZDZiMmUuLjgwOGVhMGQ0MGIgMTAw
NjQ0Ci0tLSBhL3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMva3ZtLXVuaXQtdGVzdHMubWsKKysrIGIv
cGFja2FnZS9rdm0tdW5pdC10ZXN0cy9rdm0tdW5pdC10ZXN0cy5tawpAQCAtNCw3ICs0LDcgQEAK
ICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLUtWTV9VTklUX1RFU1RTX1ZFUlNJT04gPSAy
MDI0LTAxLTA4CitLVk1fVU5JVF9URVNUU19WRVJTSU9OID0gMjAyNS0wNi0wNQogS1ZNX1VOSVRf
VEVTVFNfU09VUkNFID0ga3ZtLXVuaXQtdGVzdHMtdiQoS1ZNX1VOSVRfVEVTVFNfVkVSU0lPTiku
dGFyLmJ6MgogS1ZNX1VOSVRfVEVTVFNfU0lURSA9IGh0dHBzOi8vZ2l0bGFiLmNvbS9rdm0tdW5p
dC10ZXN0cy9rdm0tdW5pdC10ZXN0cy8tL2FyY2hpdmUvdiQoS1ZNX1VOSVRfVEVTVFNfVkVSU0lP
TikKIEtWTV9VTklUX1RFU1RTX0xJQ0VOU0UgPSBHUEwtMi4wLCBMR1BMLTIuMAotLSAKMi40Ny4y
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
