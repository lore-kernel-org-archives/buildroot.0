Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47EDCC021AD
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 22:21:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB2BF610D1;
	Tue, 18 Feb 2025 22:21:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o1DofpkCxBTH; Tue, 18 Feb 2025 22:21:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F21DA6110E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F21DA6110E;
	Tue, 18 Feb 2025 22:21:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A6CECE05
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 22:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1259412BD
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 22:21:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JkjbRld4OMsw for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 22:21:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 29972412C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29972412C1
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 29972412C1
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 22:21:02 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43989226283so16353785e9.1
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 14:21:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739917261; x=1740522061;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iCIQjeTEynf4ch3SxlY65J++jwgl7zFBZWnXv6Dh1FE=;
 b=jiu2evimk84I8eQVPMXLGOU7gEXG6Kpn1LbYaT0Pbnp7g2FBgIX/735vUjbwFm05kJ
 dXvQATj5VRVHPbre5vUX0tD/0Zj0Zl8Z3f2Fg5BHG6KYc+N6nbsFvDquRoGOK63QtMyj
 abg3WIUqi/MJnQKTlEZHt8O+Mvd7EObw2XYWqorbIcjcICEZafCeZlxkSdrIohp0Y8Vn
 EkXliIRqFubQfYn4OdetdFwk8HtjjsLd+GQ5WzzgE4lSQ9iKm9Oz1nNVeDJNki1EOb1e
 q9CPShYxQZR+Bmrpt4GTlLQWUYJvmBP+MSXIu4qgGJgdmgoxzMjHCjohyPKmIftWFYSw
 bgwg==
X-Gm-Message-State: AOJu0YyUbF2ToBHOmMlPJ0BEnvqXNb0bQ0DPpj9jVjCukJGlGcmNpPAr
 KT9kRPnsat/YG934xuiEGQLXk1OKmsY2l1SvkFyVwt8SEKb2HtZXTOHHg29OSl/MUrvQvQKUXui
 qsInClw==
X-Gm-Gg: ASbGnctiRpQD2C+5ZqlCD0zA3aDSduicui8y8O/vcIx6eZe3wq/pdeGqMuBKvm8BxpE
 S0axdNopVUY6vVkr6NbqxybI11cYVQRZy9SkCbrYQSsm74tTdqRf+xZ208xR9PjwWzG1yg/Q38A
 /+IwX0mSugKDALg4gHlvX77CiBGIT7Gu145UOApQu26DkPSEa2WgPTVCtMgtJOhblECuN9a9gbI
 7pnnP6Dzjg2EZpETrlG9/aoT/EL6Dz20RftRRIqePEUIo8tOl/cZdLpKfOpkHKGgGl0wIi7U+c3
 StO9kU/U7wXsaZh1JRGv8XvzZyruxfmC4A==
X-Google-Smtp-Source: AGHT+IGRyP42YVUtvI84Y9JkZiBFtncIoVYRShOFqXDImSZVaxOCGhGw8gVSVNpIypY9zqNyNDLYAg==
X-Received: by 2002:a05:600c:5110:b0:439:5ea4:c1e8 with SMTP id
 5b1f17b1804b1-4396e762833mr129816765e9.26.1739917261044; 
 Tue, 18 Feb 2025 14:21:01 -0800 (PST)
Received: from debian-hp-1.my-cloud.eu ([91.26.90.210])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258f0597sm15871233f8f.42.2025.02.18.14.21.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 14:21:00 -0800 (PST)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Tue, 18 Feb 2025 23:20:55 +0100
Message-ID: <20250218222057.141941-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218221145.140519-1-raphael.melotte@mind.be>
References: <20250218221145.140519-1-raphael.melotte@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1739917261; x=1740522061; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iCIQjeTEynf4ch3SxlY65J++jwgl7zFBZWnXv6Dh1FE=;
 b=cxisSbeuzGAXiXmfvOiYqzAtZjxF4pksoq8Jd7TU8EGL0HCYctK8+Jc7utAfVQiAax
 9lFkgJ3dO5txVqhF5vQaqbat7AhYtPb4Hger+eNZavd5w3lajqDwfBqcnStCleR4wJsC
 1OxLAEo29DJdzArKHH1vmEAmZVeszLK+SvbDzdrkfLqKjYwHQk6PhrJY2ryJAbX7ugbQ
 JeQlJsWSXiFjcboqutKV/f3NesuT6mLsGTp0lV/qQk5LIVeofYH1vpUt3Nm5i0KR9XhO
 2uZKr+c0NWk1saBo8i1fEHB80f/RjZGKAXkKnSRgKdi+iGh3PBpxj8Dlb+lLnXfCKe1+
 RvBQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=cxisSbeu
Subject: [Buildroot] [PATCH v2 1/1] package/jbig2dec: bump to version 0.20
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U3RhcnRpbmcgZnJvbSB0aGlzIHZlcnNpb24gbmV3ZXIgcmVsZWFzZXMgYXJlIG9ubHkgYXZhaWxh
YmxlIGF0IGEgbmV3CmRlZGljYXRlZCByZXBvc2l0b3J5LCBzbyB0aGUgc2l0ZSBpcyB1cGRhdGVk
IGFjY29yZGluZ2x5LgoKSGFzaCBmaWxlcyBubyBsb25nZXIgZXhpc3QgaW4gdGhlIG5ldyByZXBv
LCBzbyByZW1vdmUgdGhlIHJlbGF0ZWQKY29tbWVudC4KCkl0IHR1cm5zIG91dCB0aGF0IGluc3Rh
bGwtc2ggaGFzIGJlZW4gYXZhaWxhYmxlIGluIHRoZSB0YXJiYWxsIHNpbmNlCnZlcnNpb24gMC4x
OSwgc28gcmVtb3ZlIEpCSUcyREVDX0FVVE9SRUNPTkYuCgpTaWduZWQtb2ZmLWJ5OiBSYXBoYcOr
bCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+Ci0tLQpDaGFuZ2VzIHYxIC0+IHYy
OgogIC0gQWRkIG1pc3NpbmcgaGFzaCB0eXBlLgoKIHBhY2thZ2UvamJpZzJkZWMvamJpZzJkZWMu
aGFzaCB8IDQgKy0tLQogcGFja2FnZS9qYmlnMmRlYy9qYmlnMmRlYy5tayAgIHwgNiArKy0tLS0K
IDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3BhY2thZ2UvamJpZzJkZWMvamJpZzJkZWMuaGFzaCBiL3BhY2thZ2UvamJpZzJkZWMv
amJpZzJkZWMuaGFzaAppbmRleCA1YTM0YWYzN2Y2Li5hOTNlOGQ4YTZkIDEwMDY0NAotLS0gYS9w
YWNrYWdlL2piaWcyZGVjL2piaWcyZGVjLmhhc2gKKysrIGIvcGFja2FnZS9qYmlnMmRlYy9qYmln
MmRlYy5oYXNoCkBAIC0xLDcgKzEsNSBAQAotIyBodHRwczovL2dpdGh1Yi5jb20vQXJ0aWZleFNv
ZnR3YXJlL2dob3N0cGRsLWRvd25sb2Fkcy9yZWxlYXNlcy9kb3dubG9hZC9nczk1MzAvTUQ1U1VN
UwotIyBhbmQgU0hBNTEyU1VNUyBhcmUgbWlzc2luZyB0aGUgaGFzaGVzIGZvciB0aGlzIGZpbGUu
CiAjIExvY2FsbHkgY29tcHV0ZWQ6Ci1zaGEyNTYgIDI3OTQ3NjY5NWIzOGYwNDkzOWFhNTlkMDQx
YmU1NmY2YmFkZTM0MjIwMDNhNDA2YTg1ZTk3OTJjMjcxMThhMzcgIGpiaWcyZGVjLTAuMTkudGFy
Lmd6CitzaGEyNTYgIDdiNjNmZjY0NzAyODk1NDdlN2EzYTBmMTQ1Y2I4ZWE2YzJhZmZmZGQ2NTY0
NWI3ZDg3ZDNiN2ZlYmM5NmZiM2EgIGpiaWcyZGVjLTAuMjAudGFyLmd6CiAKICMgSGFzaCBmb3Ig
bGljZW5zZSBmaWxlczoKIHNoYTI1NiAgMWJmNTI1OGFmZTQ1MzkzNDQ4NGZkMGNlYTk3NTA4Yjcy
MzAxNjMzYTZhNzhiMGFlOGE5ZWU0NGFjNzhmMjZkOSAgTElDRU5TRQpkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9qYmlnMmRlYy9qYmlnMmRlYy5tayBiL3BhY2thZ2UvamJpZzJkZWMvamJpZzJkZWMubWsK
aW5kZXggOGQ4ODExMzZhZC4uODUwOWE2MDljNCAxMDA2NDQKLS0tIGEvcGFja2FnZS9qYmlnMmRl
Yy9qYmlnMmRlYy5taworKysgYi9wYWNrYWdlL2piaWcyZGVjL2piaWcyZGVjLm1rCkBAIC00LDE0
ICs0LDEyIEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1KQklHMkRFQ19WRVJTSU9O
ID0gMC4xOQorSkJJRzJERUNfVkVSU0lPTiA9IDAuMjAKIEpCSUcyREVDX1NJVEUgPSBcCi0JaHR0
cHM6Ly9naXRodWIuY29tL0FydGlmZXhTb2Z0d2FyZS9naG9zdHBkbC1kb3dubG9hZHMvcmVsZWFz
ZXMvZG93bmxvYWQvZ3M5NTMwCisJaHR0cHM6Ly9naXRodWIuY29tL0FydGlmZXhTb2Z0d2FyZS9q
YmlnMmRlYy9yZWxlYXNlcy9kb3dubG9hZC8kKEpCSUcyREVDX1ZFUlNJT04pCiBKQklHMkRFQ19M
SUNFTlNFID0gQUdQTC0zLjArCiBKQklHMkRFQ19MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQogSkJJ
RzJERUNfQ1BFX0lEX1ZFTkRPUiA9IGFydGlmZXgKIEpCSUcyREVDX0lOU1RBTExfU1RBR0lORyA9
IFlFUwotIyB0YXJiYWxsIGlzIG1pc3NpbmcgaW5zdGFsbC1zaCwgaW5zdGFsbC5zaCwgb3Igc2h0
b29sCi1KQklHMkRFQ19BVVRPUkVDT05GID0gWUVTCiAKICQoZXZhbCAkKGF1dG90b29scy1wYWNr
YWdlKSkKLS0gCjIuMzQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
