Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5713AC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 05:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE7B0812F7;
	Tue, 16 Jul 2024 05:44:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vKn9QES8Z_tE; Tue, 16 Jul 2024 05:44:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E2F381328
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E2F381328;
	Tue, 16 Jul 2024 05:44:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A4DD11BF312
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 05:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 924DC40470
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 05:44:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cM110ONX3jyy for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 05:44:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com;
 envelope-from=gael.portay@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8685340010
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8685340010
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8685340010
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 05:44:27 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2eedebccfa4so31742741fa.1
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 22:44:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721108664; x=1721713464;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0d65JJhhQZpkr/IdBl0VbH/X+WTJ36LuxxEqWMTlN1c=;
 b=hLbQGmBLe4S6+87DDo0S9bs1e8Y3Q7LAHmFwG83QfZGqgcsnf9r+gGd4MOk3T3NaX/
 k+sdLOBNWPAEJj5J/LIRcwQJQHDFF6rRt1zrYeFIROHCDA+noBARIbHliA66qude+CmZ
 bqbMtkzHAN235odSezAaJ4ttjmoolehFscH71QYSmHEstt99Babr7IhRB/TNfIEZYeib
 s9dmj8BDKl7NtpkSY0pPUxt5oS2t0PBGMKRS7lVQGKRtWecwordTBJDr20dL4NiPCUok
 vVML/tl57bczuStj2AJehA6r3U30PaEuV7GoBo/0W/yst50Zrps1ICjYTq9toVa575LN
 6JDQ==
X-Gm-Message-State: AOJu0Yx0ARo5JQ3nvXaGdOTQ2bDleJW05DsnX4ptuigDc4w1rHvtwhVD
 ce+PhyV4DUIfm23xvMq9uxpU/8AwpaHsXYuKySJl3VyywIsMHxh8upXsWaw8
X-Google-Smtp-Source: AGHT+IFWNk6QbnWmyESSQb7mNf/Jeh6EjMOfGqjcCkGn1SakhuAKVcFet9uKSP65q7Y0pzmqjmI72Q==
X-Received: by 2002:a2e:2205:0:b0:2ee:7c88:63a2 with SMTP id
 38308e7fff4ca-2eef41ddc0bmr7611221fa.44.1721108663871; 
 Mon, 15 Jul 2024 22:44:23 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5e7749esm110658705e9.2.2024.07.15.22.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 22:44:22 -0700 (PDT)
From: "=?UTF-8?q?Ga=C3=ABl=20PORTAY?=" <gael.portay@gmail.com>
X-Google-Original-From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Tue, 16 Jul 2024 07:43:54 +0200
Message-ID: <20240716054359.92966-4-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240716054359.92966-1-gael.portay@rtone.fr>
References: <20240716054359.92966-1-gael.portay@rtone.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721108664; x=1721713464; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0d65JJhhQZpkr/IdBl0VbH/X+WTJ36LuxxEqWMTlN1c=;
 b=h+NgBiYyZl0uPJLrXQo3QBHlRKY5v3BAXbpqOhsAjyqmTkFao/L1c2cAebC7kVIdxz
 LUxup3BgIk308bA22Ljy3c1p+tJ5wLnJXZsKjI5bIDI6yNMgJ7Kc8/6Lo/9V1FL7e1j5
 i+On2ZxjOvcdZOAV1ARgg6jvCYdvw8s6b1XxYafcGlbbXi2hY+MRqRPNXzuCGjoCwrpI
 FvPfy54Vagqz9kvtbVFncZdRfLxbkauLm1afZwuylJvyAMePXYaxyFLeHN4uSg2oaSOP
 up04dxzQfQhohi2rOeAoRKVyX7brgefCUGoHp0HuOw4pd6Qj87G1LQAy5BKEQ7ijb4O0
 IqBA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=h+NgBiYy
Subject: [Buildroot] [PATCH 3/8] configs/raspberrypi3_64: install Compute
 Module 3 device-tree blob
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

VGhpcyBpbnN0YWxscyB0aGUgZGV2aWNlLXRyZWUgYmxvYiBmb3IgdGhlIENvbXB1dGUgTW9kdWxl
IDMuCgpOb3RlOiBUaGUgcmFzcGJlcnJ5cGkzX2RlZmNvbmZpZyBpbnN0YWxscyB0aGUgc2luY2Ug
YTcyNmM3ZGZmOAooY29uZmlncy9yYXNwYmVycnlwaTNfZGVmY29uZmlnOiBhZGQgcmFzcGJlcnJ5
IHBpIDMgY29tcHV0ZSBtb2R1bGUKc3VwcG9ydCkuCgpTaWduZWQtb2ZmLWJ5OiBHYcOrbCBQT1JU
QVkgPGdhZWwucG9ydGF5QHJ0b25lLmZyPgotLS0KIGNvbmZpZ3MvcmFzcGJlcnJ5cGkzXzY0X2Rl
ZmNvbmZpZyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2NvbmZpZ3MvcmFzcGJlcnJ5cGkzXzY0X2RlZmNvbmZpZyBiL2Nv
bmZpZ3MvcmFzcGJlcnJ5cGkzXzY0X2RlZmNvbmZpZwppbmRleCBlYzMwOWIyYmFkLi5kNmNhZTQw
MGFlIDEwMDY0NAotLS0gYS9jb25maWdzL3Jhc3BiZXJyeXBpM182NF9kZWZjb25maWcKKysrIGIv
Y29uZmlncy9yYXNwYmVycnlwaTNfNjRfZGVmY29uZmlnCkBAIC0yMCw3ICsyMCw3IEBAIEJSMl9M
SU5VWF9LRVJORUxfREVGQ09ORklHPSJiY21ycGkzIgogCiAjIEJ1aWxkIHRoZSBEVEIgZnJvbSB0
aGUga2VybmVsIHNvdXJjZXMKIEJSMl9MSU5VWF9LRVJORUxfRFRTX1NVUFBPUlQ9eQotQlIyX0xJ
TlVYX0tFUk5FTF9JTlRSRUVfRFRTX05BTUU9ImJyb2FkY29tL2JjbTI3MTAtcnBpLTMtYiBicm9h
ZGNvbS9iY20yNzEwLXJwaS0zLWItcGx1cyBicm9hZGNvbS9iY20yODM3LXJwaS0zLWIiCitCUjJf
TElOVVhfS0VSTkVMX0lOVFJFRV9EVFNfTkFNRT0iYnJvYWRjb20vYmNtMjcxMC1ycGktMy1iIGJy
b2FkY29tL2JjbTI3MTAtcnBpLTMtYi1wbHVzIGJyb2FkY29tL2JjbTI3MTAtcnBpLWNtMyBicm9h
ZGNvbS9iY20yODM3LXJwaS0zLWIiCiAKIEJSMl9MSU5VWF9LRVJORUxfTkVFRFNfSE9TVF9PUEVO
U1NMPXkKIAotLSAKMi40NS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
