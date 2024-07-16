Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D9D1C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 05:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3781A812F9;
	Tue, 16 Jul 2024 05:44:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OABw7KwEeN8l; Tue, 16 Jul 2024 05:44:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0D9F81378
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0D9F81378;
	Tue, 16 Jul 2024 05:44:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A07A71BF97D
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 05:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C12B8130D
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 05:44:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aprBl5ExIoc7 for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 05:44:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=gael.portay@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C5FC2812FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5FC2812FD
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C5FC2812FD
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 05:44:27 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-426636ef8c9so33865235e9.2
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 22:44:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721108665; x=1721713465;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iZr/j7+sVMgAfy0jhVKAhrQtWrZigj+l/M2kM/tXLBM=;
 b=oN92pCHaMYhiSFwXslhms6RVdi8pUutRqPijdWq/Mt0a/8rP58TYIflxdhGKTWI9Wt
 ij6TetuaVA3jWPi6b18vuulPel1fapIdg54YbEYPHhB5gJ6pjHC9rOox/V/n8Zf+m63I
 PBe3l2cE6fnW5pe7OJthz3HencjUJNucIkMKfieHNw6A6VCxsXMRq1KE7td7UgAsEz4E
 dwk1TSEGaSFjNEpaGawOuqLBVqAM5XudbFMnqKIbQU11dgfciOIgtG2Nu2jGULBD+XJA
 LTXXnyrE1UZRrvlMPK7Og5ZXuCaq2HktaJbz/3fEsA/FGVouaLEUCyIaBy94e2hiaEMt
 /Ciw==
X-Gm-Message-State: AOJu0YyqEYbwEWg5EroWbekV4kph4qk+FEHjEjxG5KLjzM+nVazX6BU9
 qZ5PBd7OsFGfoMLrcQh2qJ7XwMF2l8MbddNkiOME7tgvh4X+idvKUxwBWuTi
X-Google-Smtp-Source: AGHT+IFDYyNbvOHnN5G6eZwekHfiTTCljTBsdZEpMessR1JQCf3MOJpWtsHgWBhFjeFSm0ac2wPO6w==
X-Received: by 2002:a05:600c:4706:b0:426:549c:294c with SMTP id
 5b1f17b1804b1-427ba740de5mr6353645e9.35.1721108664634; 
 Mon, 15 Jul 2024 22:44:24 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5e7749esm110658705e9.2.2024.07.15.22.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 22:44:24 -0700 (PDT)
From: "=?UTF-8?q?Ga=C3=ABl=20PORTAY?=" <gael.portay@gmail.com>
X-Google-Original-From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Tue, 16 Jul 2024 07:43:55 +0200
Message-ID: <20240716054359.92966-5-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240716054359.92966-1-gael.portay@rtone.fr>
References: <20240716054359.92966-1-gael.portay@rtone.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721108665; x=1721713465; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iZr/j7+sVMgAfy0jhVKAhrQtWrZigj+l/M2kM/tXLBM=;
 b=dA7RilmnVJcW3zsCuoWgfDQoB+S8uj3PORqq8QtcNDGiC+Dhg/Tj0TUDSkdFRrs2Jt
 x96mCESkbiZC3geeixv1G86gJ617BK8P/7255UlIaLu7rjxIlaQfXV0zRBOfqDDhPJpm
 fZFFydZzaX8FydUTCgXuwWqGH1AV99tPBIkppeP1SvaRpWQxjVAs+RV2RR7RCltyWNt8
 sVCfv9op3S9+MMSHy6hqlyjGOGZgIlCScUGXPgrCsaelWIf65iE4LgnZx+2zMQ9rLOYl
 msRJaC7e2BaTEsULwZyqOTtM66lCwzmZYiPTZrVJIamKoGiL3wrxYsdAbUo1ADKZLOgq
 YxJw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dA7Rilmn
Subject: [Buildroot] [PATCH 4/8] configs/raspberrypi3_64: remove upstream
 device-tree blob
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

VGhlcmUgYXJlIHR3byBraW5kIG9mIGRldmljZS10cmVlIGJsb2JzIHVwIHRvIHRoZSBSYXNwZXJy
eSBQaSAzWzFdWzJdOgogLSB0aGUgZG93bnN0cmVhbSBkdGJzIGFyZSBuYW1lZCBhZnRlciB0aGUg
ZGllIG5hbWUgKGkuZS4gQkNNMjd4eCkKIC0gdGhlIHVwc3RyZWFtIGR0YnMgYXJlIG5hbWUgYWZ0
ZXIgdGhlIHBhY2thZ2UgbmFtZSAoaS5lLiBCQ00yODN4KQoKRXZlcnkgZGVmY29uZmlncyBpbnN0
YWxsIGV4Y2x1c2l2ZWx5IHRoZSBkb3duc3RyZWFtIGRldmljZS10cmVlIGJsb2IsIGF0CnRoZSBl
eGNlcHRpb24gb2YgdGhlIHJhc3BiZXJyeXBpM182NF9kZWZjb25maWcgdGhhdCBpbnN0YWxscyBi
b3RoIHNpbmNlCnRoZSBiZWdpbmluZy4KClRoaXMgcmVtb3ZlcyB0aGUgdXBzdHJlYW0gZGV2aWNl
LXRyZWUgYmxvYiBmb3IgdGhlIGJlYXV0eSBvZgpjb25zaXN0ZW5jeS4KCk5vdGU6IEl0IGlzIHBv
c3NpYmxlIHRvIGxvYWQgdGhlIHVwc3RyZWFtIGRldmljZS10cmVlIHVzaW5nIHRoZQp1cHN0cmVh
bV9rZXJuZWwgcHJvcGVydHlbM10uCgpSYXNwYmVycnkgUGksIENvbXB1dGUgTW9kdWxlLCBSYXNw
YmVycnkgUGkgWmVybyBhbmQgUmFzcGJlcnJ5IFBpIFplcm8gVwp1c2UgYmNtMjgzNSBmb3IgdXBz
dHJlYW0gYW5kIGJjbTI3MDggZm9yIGRvd25zdHJlYW0uCgpSYXNwYmVycnkgUGkgMiB1c2VzIGJj
bTI4MzYgZm9yIHVwc3RyZWFtIGFuZCBiY20yNzA5IGZvciBkb3duc3RyZWFtLgoKUmFzcGJlcnJ5
IFBpIDIgcmV2IDEuMiwgUmFzcGJlcnJ5IFBpIDMsIENvbXB1dGUgTW9kdWxlIDMvMysgYW5kClJh
c3BiZXJyeSBaZXJvIDIgVyB1c2UgYmNtMjgzNyBmb3IgdXBzdHJlYW0gYW5kIGJjbTI3MDkgZm9y
IGRvd25zdHJlYW0uCgpSYXNwYmVycnkgUGkgNC80MDAgYW5kIENvbXB1dGUgTW9kdWxlIDQvNHMg
dXNlcyBiY20yNzExIGFuZCBSYXNwYmVycnkgUGkKNSB1c2VzIGJjbTI3MTIuCgpbMV06IGh0dHBz
Oi8vZ2l0aHViLmNvbS9yYXNwYmVycnlwaS9saW51eC9pc3N1ZXMvMzIzNwpbMl06IGh0dHBzOi8v
d3d3LnJhc3BiZXJyeXBpLmNvbS9kb2N1bWVudGF0aW9uL2NvbXB1dGVycy9yYXNwYmVycnktcGku
aHRtbCNmbGFnc2hpcC1zZXJpZXMKWzNdOiBodHRwczovL3d3dy5yYXNwYmVycnlwaS5jb20vZG9j
dW1lbnRhdGlvbi9jb21wdXRlcnMvbGVnYWN5X2NvbmZpZ190eHQuaHRtbCN1cHN0cmVhbV9rZXJu
ZWwKClNpZ25lZC1vZmYtYnk6IEdhw6tsIFBPUlRBWSA8Z2FlbC5wb3J0YXlAcnRvbmUuZnI+Ci0t
LQogYm9hcmQvcmFzcGJlcnJ5cGkvcmVhZG1lLnR4dCAgICAgIHwgMSAtCiBjb25maWdzL3Jhc3Bi
ZXJyeXBpM182NF9kZWZjb25maWcgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2JvYXJkL3Jhc3BiZXJyeXBpL3JlYWRt
ZS50eHQgYi9ib2FyZC9yYXNwYmVycnlwaS9yZWFkbWUudHh0CmluZGV4IDA0OTlmZTBkNTEuLjc4
YzU1MTU3OWEgMTAwNjQ0Ci0tLSBhL2JvYXJkL3Jhc3BiZXJyeXBpL3JlYWRtZS50eHQKKysrIGIv
Ym9hcmQvcmFzcGJlcnJ5cGkvcmVhZG1lLnR4dApAQCAtMTAyLDcgKzEwMiw2IEBAIEFmdGVyIGJ1
aWxkaW5nLCB5b3Ugc2hvdWxkIG9idGFpbiB0aGlzIHRyZWU6CiAgICAgKy0tIGJjbTI3MTEtcnBp
LTQtYi5kdGIgICAgICAgICBbMV0KICAgICArLS0gYmNtMjcxMS1ycGktY200LmR0YiAgICAgICAg
IFsxXQogICAgICstLSBiY20yNzEyLXJwaS01LWIuZHRiICAgICAgICAgWzFdCi0gICAgKy0tIGJj
bTI4MzctcnBpLTMtYi5kdGIgICAgICAgICBbMV0KICAgICArLS0gYm9vdC52ZmF0CiAgICAgKy0t
IHJvb3Rmcy5leHQ0CiAgICAgKy0tIHJwaS1maXJtd2FyZS8KZGlmZiAtLWdpdCBhL2NvbmZpZ3Mv
cmFzcGJlcnJ5cGkzXzY0X2RlZmNvbmZpZyBiL2NvbmZpZ3MvcmFzcGJlcnJ5cGkzXzY0X2RlZmNv
bmZpZwppbmRleCBkNmNhZTQwMGFlLi5mNGVjZjI1NzVmIDEwMDY0NAotLS0gYS9jb25maWdzL3Jh
c3BiZXJyeXBpM182NF9kZWZjb25maWcKKysrIGIvY29uZmlncy9yYXNwYmVycnlwaTNfNjRfZGVm
Y29uZmlnCkBAIC0yMCw3ICsyMCw3IEBAIEJSMl9MSU5VWF9LRVJORUxfREVGQ09ORklHPSJiY21y
cGkzIgogCiAjIEJ1aWxkIHRoZSBEVEIgZnJvbSB0aGUga2VybmVsIHNvdXJjZXMKIEJSMl9MSU5V
WF9LRVJORUxfRFRTX1NVUFBPUlQ9eQotQlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRTX05BTUU9
ImJyb2FkY29tL2JjbTI3MTAtcnBpLTMtYiBicm9hZGNvbS9iY20yNzEwLXJwaS0zLWItcGx1cyBi
cm9hZGNvbS9iY20yNzEwLXJwaS1jbTMgYnJvYWRjb20vYmNtMjgzNy1ycGktMy1iIgorQlIyX0xJ
TlVYX0tFUk5FTF9JTlRSRUVfRFRTX05BTUU9ImJyb2FkY29tL2JjbTI3MTAtcnBpLTMtYiBicm9h
ZGNvbS9iY20yNzEwLXJwaS0zLWItcGx1cyBicm9hZGNvbS9iY20yNzEwLXJwaS1jbTMiCiAKIEJS
Ml9MSU5VWF9LRVJORUxfTkVFRFNfSE9TVF9PUEVOU1NMPXkKIAotLSAKMi40NS4yCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
