Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 323B6C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 05:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E776381396;
	Tue, 16 Jul 2024 05:44:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O1dXB26t7pqe; Tue, 16 Jul 2024 05:44:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D083813A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D083813A3;
	Tue, 16 Jul 2024 05:44:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 82B551BF312
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 05:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CF044015E
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 05:44:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LN3_jSDZf98Y for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 05:44:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=gael.portay@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 50C054013D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50C054013D
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 50C054013D
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 05:44:30 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-427b8571820so5034575e9.0
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 22:44:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721108667; x=1721713467;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g9XZ95p0PkcoitDq+M5o8rUbDA2AcEb5gsFuW/+YK1o=;
 b=nXSAqT8zxjSRcaOWzoCqnNAlEXqdsSfFRHUDFtRqzPynrBtBn3iRopjtRvQOwk+V9i
 yyyy8ndeoN90XRFTeooCQXKJRZodY+hdNnGw0p3BpIdbkWfpyHt5D6m0FZ2PqzNM6Rj2
 ZkzxGvuYcXv78VwpHDFkdLTUCqD7OreiMoa9Cn3bwBYWXbsOUFCJohoYMXTg+pIjEm2d
 eMrigV7ILOk9CLN8zsaIuzbVmpgvcPvp+EUDU0vsJKzOh7hmdm8imW7q+LkyGswzL2uq
 SfeNSGqQy9b8Ote14E42g0JvR8Cd3rPbe3qvBlIKcsETCWUeWiywP6ACOIxK26yG6cOi
 x+xA==
X-Gm-Message-State: AOJu0Yy4ZIptw3Aw6VX0PeE8FnU3yRim7Yy8pcOQDv4d6cJHbjjwb92N
 t8uEwQ90/kmlMjKlrFr2amZ7gdBuuq9TGdx2A7eNdb4oHV8ZEj4xVxKz/JHj
X-Google-Smtp-Source: AGHT+IEd3wEgxHNwtIGjY1d8RqoAniZWY+eSsrk+/vcJDJByj7udPQ89wFMt2R+0INjwy+YeABHHDw==
X-Received: by 2002:a05:600c:3109:b0:426:689b:65c4 with SMTP id
 5b1f17b1804b1-427ba70465dmr6535415e9.31.1721108667552; 
 Mon, 15 Jul 2024 22:44:27 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5e7749esm110658705e9.2.2024.07.15.22.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 22:44:26 -0700 (PDT)
From: "=?UTF-8?q?Ga=C3=ABl=20PORTAY?=" <gael.portay@gmail.com>
X-Google-Original-From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Tue, 16 Jul 2024 07:43:57 +0200
Message-ID: <20240716054359.92966-7-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240716054359.92966-1-gael.portay@rtone.fr>
References: <20240716054359.92966-1-gael.portay@rtone.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721108667; x=1721713467; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g9XZ95p0PkcoitDq+M5o8rUbDA2AcEb5gsFuW/+YK1o=;
 b=eSz4NcdWq5rvolU7CkJLNJVniWxW/KvJGM6btAORDqtaJvfFQ2X9ao9tZajleji918
 abxS7fC0y+Ad29PZu1Ui7G4VzpZtZAin+DR/CSD4TU6+nlPuFGWCn2KM5P/ZdaXzivhF
 k4D2RX6xbDpPpPPyQ0itmHoaqdgXqHmVVbzxz5Pk+mq8yvu+jnPSvNBMedMVfuhAduMa
 50oJZuuwUlciosxznpTI2lXrt8upRDdScKO7hxPCBdTO0ynCGDymqMkVcdtMaXgEtzS2
 Ss7kiK6IqYj1/7E8aIBN9L+tlc0Dd2Agb+S10Z2PWNte8GrmArlV17R+v1MVtGvXZ6a+
 ToUQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eSz4NcdW
Subject: [Buildroot] [PATCH 6/8] configs/raspberrypi4*: install Compute
 Module 4/4s device-tree blobs
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

VGhpcyBpbnN0YWxscyB0aGUgZGV2aWNlLXRyZWUgYmxvYnMgZm9yIHRoZSBDb21wdXRlIE1vZHVs
ZSA0IGFuZCBDb21wdXRlCk1vZHVsZSA0cy4KClNpZ25lZC1vZmYtYnk6IEdhw6tsIFBPUlRBWSA8
Z2FlbC5wb3J0YXlAcnRvbmUuZnI+Ci0tLQogYm9hcmQvcmFzcGJlcnJ5cGkvcmVhZG1lLnR4dCAg
ICAgIHwgMSArCiBjb25maWdzL3Jhc3BiZXJyeXBpNF82NF9kZWZjb25maWcgfCAyICstCiBjb25m
aWdzL3Jhc3BiZXJyeXBpNF9kZWZjb25maWcgICAgfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9ib2FyZC9yYXNwYmVy
cnlwaS9yZWFkbWUudHh0IGIvYm9hcmQvcmFzcGJlcnJ5cGkvcmVhZG1lLnR4dAppbmRleCA0ODVh
OGQ4ODI3Li4yNGI3ZjYxOWEzIDEwMDY0NAotLS0gYS9ib2FyZC9yYXNwYmVycnlwaS9yZWFkbWUu
dHh0CisrKyBiL2JvYXJkL3Jhc3BiZXJyeXBpL3JlYWRtZS50eHQKQEAgLTEwMiw2ICsxMDIsNyBA
QCBBZnRlciBidWlsZGluZywgeW91IHNob3VsZCBvYnRhaW4gdGhpcyB0cmVlOgogICAgICstLSBi
Y20yNzExLXJwaS00LWIuZHRiICAgICAgICAgWzFdCiAgICAgKy0tIGJjbTI3MTEtcnBpLTQwMC5k
dGIgICAgICAgICBbMV0KICAgICArLS0gYmNtMjcxMS1ycGktY200LmR0YiAgICAgICAgIFsxXQor
ICAgICstLSBiY20yNzExLXJwaS1jbTRzLmR0YiAgICAgICAgWzFdCiAgICAgKy0tIGJjbTI3MTIt
cnBpLTUtYi5kdGIgICAgICAgICBbMV0KICAgICArLS0gYm9vdC52ZmF0CiAgICAgKy0tIHJvb3Rm
cy5leHQ0CmRpZmYgLS1naXQgYS9jb25maWdzL3Jhc3BiZXJyeXBpNF82NF9kZWZjb25maWcgYi9j
b25maWdzL3Jhc3BiZXJyeXBpNF82NF9kZWZjb25maWcKaW5kZXggN2FjMGFkNDljYy4uYjczMzZl
MzM0ZiAxMDA2NDQKLS0tIGEvY29uZmlncy9yYXNwYmVycnlwaTRfNjRfZGVmY29uZmlnCisrKyBi
L2NvbmZpZ3MvcmFzcGJlcnJ5cGk0XzY0X2RlZmNvbmZpZwpAQCAtMjAsNyArMjAsNyBAQCBCUjJf
TElOVVhfS0VSTkVMX0RFRkNPTkZJRz0iYmNtMjcxMSIKIAogIyBCdWlsZCB0aGUgRFRCIGZyb20g
dGhlIGtlcm5lbCBzb3VyY2VzCiBCUjJfTElOVVhfS0VSTkVMX0RUU19TVVBQT1JUPXkKLUJSMl9M
SU5VWF9LRVJORUxfSU5UUkVFX0RUU19OQU1FPSJicm9hZGNvbS9iY20yNzExLXJwaS00LWIgYnJv
YWRjb20vYmNtMjcxMS1ycGktNDAwIgorQlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRTX05BTUU9
ImJyb2FkY29tL2JjbTI3MTEtcnBpLTQtYiBicm9hZGNvbS9iY20yNzExLXJwaS00MDAgYnJvYWRj
b20vYmNtMjcxMS1ycGktY200IGJyb2FkY29tL2JjbTI3MTEtcnBpLWNtNHMiCiAKIEJSMl9MSU5V
WF9LRVJORUxfTkVFRFNfSE9TVF9PUEVOU1NMPXkKIApkaWZmIC0tZ2l0IGEvY29uZmlncy9yYXNw
YmVycnlwaTRfZGVmY29uZmlnIGIvY29uZmlncy9yYXNwYmVycnlwaTRfZGVmY29uZmlnCmluZGV4
IDI0MWY3OGYyYzEuLjJjZjUzM2UzMmUgMTAwNjQ0Ci0tLSBhL2NvbmZpZ3MvcmFzcGJlcnJ5cGk0
X2RlZmNvbmZpZworKysgYi9jb25maWdzL3Jhc3BiZXJyeXBpNF9kZWZjb25maWcKQEAgLTIwLDcg
KzIwLDcgQEAgQlIyX0xJTlVYX0tFUk5FTF9ERUZDT05GSUc9ImJjbTI3MTEiCiAKICMgQnVpbGQg
dGhlIERUQiBmcm9tIHRoZSBrZXJuZWwgc291cmNlcwogQlIyX0xJTlVYX0tFUk5FTF9EVFNfU1VQ
UE9SVD15Ci1CUjJfTElOVVhfS0VSTkVMX0lOVFJFRV9EVFNfTkFNRT0iYnJvYWRjb20vYmNtMjcx
MS1ycGktNC1iIGJyb2FkY29tL2JjbTI3MTEtcnBpLTQwMCIKK0JSMl9MSU5VWF9LRVJORUxfSU5U
UkVFX0RUU19OQU1FPSJicm9hZGNvbS9iY20yNzExLXJwaS00LWIgYnJvYWRjb20vYmNtMjcxMS1y
cGktNDAwIGJyb2FkY29tL2JjbTI3MTEtcnBpLWNtNCBicm9hZGNvbS9iY20yNzExLXJwaS1jbTRz
IgogCiBCUjJfTElOVVhfS0VSTkVMX05FRURTX0hPU1RfT1BFTlNTTD15CiAKLS0gCjIuNDUuMgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
