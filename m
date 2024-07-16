Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422B9C3DA59
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 05:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B530C8133F;
	Tue, 16 Jul 2024 05:44:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FYj4QY3MIBAi; Tue, 16 Jul 2024 05:44:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CAF18130E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CAF18130E;
	Tue, 16 Jul 2024 05:44:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1B0B11BF312
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 05:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07D64403D6
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 05:44:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kUU5bMNC_pmm for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 05:44:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=gael.portay@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A44FC403CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A44FC403CD
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A44FC403CD
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 05:44:25 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-427aeebaecdso11235765e9.1
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 22:44:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721108662; x=1721713462;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8bzamMeXPla3AGbejjQ0HZnzNq3/UUSQ6bKsDZXjS7g=;
 b=X5/+BDzGcTCFmOX3ZxJ3ofEpQGa6jYpIPy4dmdtCVIimllJdBOcAbh+9bFXOW43Xrn
 amIJGSUjmNUnrPvtbPRtC7s+LrrOuUZ8jiOcAUVnIvrTRN/59tNndrmtjHj99Kh2mk0f
 aUFw3VY27KMgQVdPAj8lbzxs77dEUC4ML2stGUvYkGxPohivHPXlNQtVHZGBnmIT0aEn
 YthmTzTgu4alMPD6cRTLFcqYZoJSpK1RMY9Ki5PZ5c9mVS49qyHs5amg5wREvShnpOrY
 nNSQcLXp3EWvSAimyw/tthkYCvZ/ZXIr4QHjgAbNjBURAiwwaP0PlHgRuoUv0KyyF3Fl
 AgzA==
X-Gm-Message-State: AOJu0YzlhKmmDvt+Nsi+mQmcQmuUTF0/6Zixnc7/9W2/wDAsd5tG8tyB
 hbHEnSZmvpnl6BPQGZWw8Ali6vNBNRcauWmCQNAIn8aCWc+EWuSg6i4stWTe
X-Google-Smtp-Source: AGHT+IFROytWryvne0ivDxO+zLKXIRCaCjt6K27C/G9Ui3asEWFlZyCzwjTkljzh7SLmp/klRemDTg==
X-Received: by 2002:a05:600c:4583:b0:426:6945:75b8 with SMTP id
 5b1f17b1804b1-427ba69d8e7mr6067455e9.31.1721108662179; 
 Mon, 15 Jul 2024 22:44:22 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5e7749esm110658705e9.2.2024.07.15.22.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 22:44:20 -0700 (PDT)
From: "=?UTF-8?q?Ga=C3=ABl=20PORTAY?=" <gael.portay@gmail.com>
X-Google-Original-From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Tue, 16 Jul 2024 07:43:53 +0200
Message-ID: <20240716054359.92966-3-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240716054359.92966-1-gael.portay@rtone.fr>
References: <20240716054359.92966-1-gael.portay@rtone.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721108662; x=1721713462; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8bzamMeXPla3AGbejjQ0HZnzNq3/UUSQ6bKsDZXjS7g=;
 b=UZIwItfsu3Bv/zKyS1qTRiLmsOvcj+1d2hSOf9x56CF9reJ6ZPYwSWO7+tSdwPm3LK
 tW+moRQKNvxByAiX3Hj2/V1v8yLS7mjxe+o9sba0lm20DO9a4O4mu82PGsETtQ3EC64L
 kM0T2L0bTWdmWbcG9TqeZC3X+0vlI4BxSDiR9BPi2AylomqFk6owSgj/4Ch6dbgYyJxm
 IzFmOaFqMdFDhrR9OyUKx8JXGds1sLk2ihDkmM6wFWXQJ++YFCFq5A1H/VKS3ksUgavz
 ylJ+UUzYoRt4HOLCOlTXsL7eXUUGYw3LuOlK2GYfAjafGNjaX/8N2MnFlBQ39FTAVsI5
 C6ww==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UZIwItfs
Subject: [Buildroot] [PATCH 2/8] configs/raspberrypi2: install Raspberry Pi
 2 rev 1.2 device-tree blob
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

VGhpcyBpbnN0YWxscyBSYXNwYmVycnkgUGkgMiBNb2RlbCBCIHJldiAxLjIgZGV2aWNlLXRyZWUg
YmxvYi4KCk5vdGU6IFJhc3BiZXJyeSBQaSAyIE1vZGVsIEIgdmV2IDEuMiBzd2l0Y2hlZCB0byBC
Q00yODM3WzFdWzJdLgoKWzFdOiBodHRwczovL3d3dy5yYXNwYmVycnlwaS5jb20vZG9jdW1lbnRh
dGlvbi9jb21wdXRlcnMvcmFzcGJlcnJ5LXBpLmh0bWwjZmxhZ3NoaXAtc2VyaWVzClsyXTogaHR0
cHM6Ly93d3cucmFzcGJlcnJ5cGkuY29tL2RvY3VtZW50YXRpb24vY29tcHV0ZXJzL3Byb2Nlc3Nv
cnMuaHRtbCNiY20yODM3CgpTaWduZWQtb2ZmLWJ5OiBHYcOrbCBQT1JUQVkgPGdhZWwucG9ydGF5
QHJ0b25lLmZyPgotLS0KIGJvYXJkL3Jhc3BiZXJyeXBpL3JlYWRtZS50eHQgICB8IDEgKwogY29u
Zmlncy9yYXNwYmVycnlwaTJfZGVmY29uZmlnIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9ib2FyZC9yYXNwYmVycnlw
aS9yZWFkbWUudHh0IGIvYm9hcmQvcmFzcGJlcnJ5cGkvcmVhZG1lLnR4dAppbmRleCBjYmQ5YTU3
YTYzLi4wNDk5ZmUwZDUxIDEwMDY0NAotLS0gYS9ib2FyZC9yYXNwYmVycnlwaS9yZWFkbWUudHh0
CisrKyBiL2JvYXJkL3Jhc3BiZXJyeXBpL3JlYWRtZS50eHQKQEAgLTk1LDYgKzk1LDcgQEAgQWZ0
ZXIgYnVpbGRpbmcsIHlvdSBzaG91bGQgb2J0YWluIHRoaXMgdHJlZToKICAgICArLS0gYmNtMjcw
OC1ycGktemVyby13LmR0YiAgICAgIFsxXQogICAgICstLSBiY20yNzEwLXJwaS16ZXJvLTItdy5k
dGIgICAgWzFdCiAgICAgKy0tIGJjbTI3MDktcnBpLTItYi5kdGIgICAgICAgICBbMV0KKyAgICAr
LS0gYmNtMjcxMC1ycGktMi1iLmR0YiAgICAgICAgIFsxXQogICAgICstLSBiY20yNzEwLXJwaS0z
LWIuZHRiICAgICAgICAgWzFdCiAgICAgKy0tIGJjbTI3MTAtcnBpLTMtYi1wbHVzLmR0YiAgICBb
MV0KICAgICArLS0gYmNtMjcxMC1ycGktY20zLmR0YiAgICAgICAgIFsxXQpkaWZmIC0tZ2l0IGEv
Y29uZmlncy9yYXNwYmVycnlwaTJfZGVmY29uZmlnIGIvY29uZmlncy9yYXNwYmVycnlwaTJfZGVm
Y29uZmlnCmluZGV4IDA1ODcwY2M2ZTEuLjc1MzEwZmRiMjggMTAwNjQ0Ci0tLSBhL2NvbmZpZ3Mv
cmFzcGJlcnJ5cGkyX2RlZmNvbmZpZworKysgYi9jb25maWdzL3Jhc3BiZXJyeXBpMl9kZWZjb25m
aWcKQEAgLTIxLDcgKzIxLDcgQEAgQlIyX0xJTlVYX0tFUk5FTF9ERUZDT05GSUc9ImJjbTI3MDki
CiAKICMgQnVpbGQgdGhlIERUQiBmcm9tIHRoZSBrZXJuZWwgc291cmNlcwogQlIyX0xJTlVYX0tF
Uk5FTF9EVFNfU1VQUE9SVD15Ci1CUjJfTElOVVhfS0VSTkVMX0lOVFJFRV9EVFNfTkFNRT0iYnJv
YWRjb20vYmNtMjcwOS1ycGktMi1iIgorQlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRTX05BTUU9
ImJyb2FkY29tL2JjbTI3MDktcnBpLTItYiBicm9hZGNvbS9iY20yNzEwLXJwaS0yLWIiCiAKIEJS
Ml9MSU5VWF9LRVJORUxfTkVFRFNfSE9TVF9PUEVOU1NMPXkKIAotLSAKMi40NS4yCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
