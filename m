Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C67AC4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 14:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B321841F30;
	Fri, 12 Apr 2024 14:10:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uNDSoMGp4QkC; Fri, 12 Apr 2024 14:10:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EE1441F18
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EE1441F18;
	Fri, 12 Apr 2024 14:10:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 945881BF39D
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 14:10:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 806DB41F18
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 14:10:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EgEekIffY8Hx for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 14:10:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com;
 envelope-from=gael.portay@rtone.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 91EAF41F07
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91EAF41F07
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 91EAF41F07
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 14:10:13 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2d87450361fso10534471fa.2
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 07:10:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712931011; x=1713535811;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xCG1/JlbiuMFPFlGH9lZbip6r2d3bs+FfFsthh/fflw=;
 b=Rfv94wsAzuYiWCvAJeZmfXz+G/l8gziw/0CXAbxlPBDGNTZp2FY00chYiGn7MwN1G4
 F7Gp8wITkxCLYI4YMQNumaOy1DMt9JwgujMG7Y3ZOyq6+2/vo9HK7Jp61I3+vMUIDZWG
 V/mDfO/zJwHY/ZC6wlIO+GxjoVO+mfHToBWXt9mm/NrsPT+tR8qMf/+zYqGSIcPSNxQP
 ajQdvpM6sfwz7qUoVhdL5szz6H6uU4tkqzq9mftY1V75E+t4a5JypPPgwH/jLj9MDbPQ
 Ro1L24PmH2VGQaHGwAQnDIEkVLYhLbPwnlqSUCa4Ac+bP0y7D9N0lUsAEMiIuEtIpVFg
 5A/A==
X-Gm-Message-State: AOJu0Yy0d2i6i/DYWiQcujQeNxd+62Jd+0lAu8G4/Apu+KK4QTTZ6JQm
 UZMQLPvDBY0xFhkE6NO/36G40hQ4LR0gxpiLM9cHruypWFo3G1hZ4UE9DMXL9J4ew1jqUOISQT3
 lMlo=
X-Google-Smtp-Source: AGHT+IFRqWO/LaF6ueDPrGE4V666L9zwnOlM2jUnatjWoQfFLYP95C7ljeXyfWIVvrfe1rOAWeu1Tw==
X-Received: by 2002:a2e:9dc5:0:b0:2d9:f7f8:3e87 with SMTP id
 x5-20020a2e9dc5000000b002d9f7f83e87mr1844206ljj.32.1712931010862; 
 Fri, 12 Apr 2024 07:10:10 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 gw7-20020a05600c850700b004146e58cc35sm9111114wmb.46.2024.04.12.07.10.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Apr 2024 07:10:10 -0700 (PDT)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 12 Apr 2024 16:09:43 +0200
Message-ID: <20240412140945.1626579-1-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtone.fr; s=google; t=1712931011; x=1713535811; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xCG1/JlbiuMFPFlGH9lZbip6r2d3bs+FfFsthh/fflw=;
 b=EyE+pFyT+eb1L2v0CUa0ohBGoxESVzuHwZVxavke8BHD0VdTkI1rRUUJkVMZlvhs/2
 VrOD/IDPvP5rUK/cwZSO1wQYiFp1AP8neHbcstp6wElPw6a4hFJlbmMlpL8TNGa1U8yy
 i48pLGTRUOQnUyhX7z7k2sFnkE9kzOSqygNJ4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=rtone.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=rtone.fr header.i=@rtone.fr header.a=rsa-sha256
 header.s=google header.b=EyE+pFyT
Subject: [Buildroot] [RFC PATCH 0/2] linux: install in-tree device-tree blob
 overlays
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

SGVsbG8sCgpUaGlzIHBhdGNoIHNlcmllIGludGVuZHMgdG8gYWRkcmVzcyBhIHBvc3NpYmxlIG91
dC1vZi1zeW5jIGZvciB0aGUKZGV2aWNlLXRyZWUgYmxvYiBhbmQgb3ZlcmxheXMgd2l0aCB0aGUg
cmFzcGJlcnJ5cGkncy4gVGhpcyBmb2xsb3dzCnVwWzFdLgoKVGhlIGZpcnN0IHBhdGNoIGFkZHMg
dGhlIHRocmVlIGNvbmZpZ3VyYXRpb25zIHRvIGluc3RhbGwgdGhlIGR0Ym8nczsKdGhlc2UgY29u
ZmlndXJhdGlvbnMgYXJlIGNvcGllcyBvZiB0aGUgb3JpZ2luYWwgZHRiJ3MgY29uZmlndXJhdGlv
bnMuCgpUaGUgc2Vjb25kIHBhdGNoIGFwcGxpZXMgdGhlc2UgY29uZmlndXJhdGlvbnMgdG8gdGhl
IHJhc3BiZXJyeXBpJ3MuCgpOb3RlOiBBbGwgdGhlIHN0b3J5IGxpdmVzIGluIHRoZSBjb21taXQg
bWVzc2FnZSBvZiB0aGUgZmlyc3QgcGF0Y2g7IHRoaXMKY291bGQgYmUgZHJvcCBpZiB0aGlzIHBh
dGNoIHNlcmllIGlzIHNvbWV0aGluZyB5b3UgYXJlIGludGVyZXN0ZWQgaW4uCgpOb3RlIDI6IEkg
aGF2ZSBhbHNvIHBlbmRpbmcgcGF0Y2hlcyB0byBzdXBwb3J0IGZvciB3aWxkY2FyZHMgZm9yIGJv
dGgKZHRiJ3MgYW5kIGR0Ym8ncyBmaWxlbmFtZXMgdGhhdCBzaW1wbGlmaWVzIHRoZSBpbnRlZ3Jh
dG9yIGxpZmUgaWYgdGhlCndob2xlIG91dHB1dCBmaWxlcyBuZWVkIHRvIGJlIGluc3RhbGxlZC4K
Ck5vdGUgMzogSWYgeW91IGtub3duIG90aGVyIGRvd25zdHJlYW0gdHJlZXMgdGhhdCBjb21waWxl
cyBkdGJvJ3MsCnBsZWFzZSB0ZWxsIG1lLgoKWzFdOiBodHRwczovL3BhdGNod29yay5vemxhYnMu
b3JnL3Byb2plY3QvYnVpbGRyb290L2NvdmVyLzIwMjMxMTIxMTkzNDQ4LjExNTE5MzYtMS1nYWVs
LnBvcnRheUBydG9uZS5mci8KCktpbmQgUmVnYXJkcywKR2HDq2wgUE9SVEFZICgyKToKICBsaW51
eDogaW5zdGFsbCBpbi10cmVlIGRldmljZS10cmVlIGJsb2Igb3ZlcmxheXMKICBib2FyZC9yYXNw
YmVycnlwaTogaW5zdGFsbCBpbi10cmVlIGRldmljZS10cmVlIGJsb2Igb3ZlcmxheXMKCiBib2Fy
ZC9yYXNwYmVycnlwaS9wb3N0LWltYWdlLnNoICAgICAgIHwgIDIgKy0KIGNvbmZpZ3MvcmFzcGJl
cnJ5cGkwd19kZWZjb25maWcgICAgICAgfCAgNSArKysrKwogY29uZmlncy9yYXNwYmVycnlwaTNf
NjRfZGVmY29uZmlnICAgICB8ICA0ICsrKysKIGNvbmZpZ3MvcmFzcGJlcnJ5cGkzX2RlZmNvbmZp
ZyAgICAgICAgfCAgNCArKysrCiBjb25maWdzL3Jhc3BiZXJyeXBpM19xdDV3ZV9kZWZjb25maWcg
IHwgIDQgKysrKwogY29uZmlncy9yYXNwYmVycnlwaTRfNjRfZGVmY29uZmlnICAgICB8ICA0ICsr
KysKIGNvbmZpZ3MvcmFzcGJlcnJ5cGk0X2RlZmNvbmZpZyAgICAgICAgfCAgNCArKysrCiBjb25m
aWdzL3Jhc3BiZXJyeXBpY200aW9fNjRfZGVmY29uZmlnIHwgIDQgKysrKwogY29uZmlncy9yYXNw
YmVycnlwaWNtNGlvX2RlZmNvbmZpZyAgICB8ICA0ICsrKysKIGNvbmZpZ3MvcmFzcGJlcnJ5cGl6
ZXJvMndfZGVmY29uZmlnICAgfCAgNCArKysrCiBsaW51eC9Db25maWcuaW4gICAgICAgICAgICAg
ICAgICAgICAgIHwgMjMgKysrKysrKysrKysrKysrKysrKysrKysKIGxpbnV4L2xpbnV4Lm1rICAg
ICAgICAgICAgICAgICAgICAgICAgfCAyNCArKysrKysrKysrKysrKysrKysrKysrKysKIDEyIGZp
bGVzIGNoYW5nZWQsIDg1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCi0tCjIuNDQuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
