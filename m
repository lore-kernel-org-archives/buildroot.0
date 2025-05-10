Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB67C3ABC3
	for <buildroot@archiver.kernel.org>; Sat, 10 May 2025 20:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66B038131B;
	Sat, 10 May 2025 20:31:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kche2-Jx7KKV; Sat, 10 May 2025 20:31:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 631C881136
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 631C881136;
	Sat, 10 May 2025 20:31:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 664DEE0
 for <buildroot@buildroot.org>; Sat, 10 May 2025 20:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C83D81086
 for <buildroot@buildroot.org>; Sat, 10 May 2025 20:31:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id INinXx0-qazU for <buildroot@buildroot.org>;
 Sat, 10 May 2025 20:31:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=lazzer@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 90E0A80F74
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90E0A80F74
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 90E0A80F74
 for <buildroot@buildroot.org>; Sat, 10 May 2025 20:31:47 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-549b116321aso3194912e87.3
 for <buildroot@buildroot.org>; Sat, 10 May 2025 13:31:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746909105; x=1747513905;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J9s3NZBvtkugdLdBJDbm8i7qetTiP73ZPazKwvDHcXg=;
 b=S5rosGpah0MVQpKEJhYUB9BlWJM66x3eAunM3LLhLXiL9XOA1W53tvYHGktwIImEju
 L+UpXcdY3o9LMupZ+yg60aaXLd8r/Z0zdneC5fw+484y6XyJUNMIGPLkZZpedkmm+UOB
 WX/R1odRvM4ITmaOqCFjRsB4oUZI0hntxCKMfoQ52IVFch4FgKN7KfEpL8IYO6u+nPBz
 T46HLMXX8QjVRXDU8plV2J91zRXgKQYWWGwOK1KPDvWllKDIjOzTGrcBbmH6G5hEss6S
 TGUGlrnJli30wHxxYsSG6IBp/itskgayqmMPpTM4AkqJQwa2OJtltr6meBpUc7usNrVV
 5Kbw==
X-Gm-Message-State: AOJu0YziXUJOBvCH+lzEfTElVbLc2Zq/FSEc0Zg3xNH5Bg2LtzVtQ5+T
 TbVb6aSgVSqIZ2Dxyy1pC0ywg96EsMAAu/lGEk30XGVDaPOZ70r4n7TAaspj
X-Gm-Gg: ASbGncuHafNP+n3nOPWkR1E/Jebof/RnJGb3SOyYuhPLf0WZ+2HMPW2vDUu2Wm6VqXF
 zfrUGjTaq3UqHJ+k8IZg6LnAlUhTsD3j5KEAuRsMue0hKM32uuk64NlserYDuc4DLqskk59JuRC
 dwJHUxBENQSGI+NjkjfWQQSjaCwrueXmz/Tui74YdDlXmk9VLkjR4LRcNYyjnGIj8zf5oi//l1g
 NZo+9LAVYljrHR73TYJQfMIvSFVC655z0ic9qUEKnTkU2ZrriZ+Phs4dHN6GyXqfZXiB0DqEbwN
 UfpLEmE/QqCLhmfPYMnxlysc1DlsVj2BUfXqIepA7HK6sbtomydwncMf+nJ+agPYUOQZp5k4334
 =
X-Google-Smtp-Source: AGHT+IENbWHLABCW05cLC5BSaalvlsZ2xFYBunMSdoJfvPWRC5k67+6se+UZvqm4kT/UEGOvx4/LDg==
X-Received: by 2002:a05:6512:4505:b0:54f:bf00:6f38 with SMTP id
 2adb3069b0e04-54fc67e60acmr2327636e87.45.1746909104406; 
 Sat, 10 May 2025 13:31:44 -0700 (PDT)
Received: from tollan.lan (b106.broadband9.quicknet.se. [194.132.233.106])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc645cf27sm810561e87.88.2025.05.10.13.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 May 2025 13:31:43 -0700 (PDT)
From: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
To: buildroot@buildroot.org
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
Date: Sat, 10 May 2025 22:31:18 +0200
Message-ID: <20250510203122.1916485-3-lazzer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250510203122.1916485-1-lazzer@gmail.com>
References: <20250510203122.1916485-1-lazzer@gmail.com>
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746909105; x=1747513905; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=J9s3NZBvtkugdLdBJDbm8i7qetTiP73ZPazKwvDHcXg=;
 b=Ieje4IOdFeLu2RG/Y6CJ7bTqq/eKDy7Kt1wgISp0kyN/WVwtf2yDJ9BUFqv6xrsKuu
 /Etq0F/9wADruQeTQFSaujecZ4VA4nc2bTRLBIvye7WeonB5tzyop1uh0KuvYjizrTLe
 71RJa5IRiPp/Y/uEytP72BUeuYCfOSq9oXQUQ+EWo0LP5DDM3k8yXcZq5yO52aaCmFWR
 ZSXCXI9wbV8t9sJ9RVK1l00zDBvjzHD94PLSsDOeN1E8K0kK9zGXH7B5GUeS5ViYMQnk
 q5LnZ/7qn35w9Xu7Woa8TQLAmbCGrYamQAZUQ2YEED19n+SZxPYFV5MPOTgoqbqOjgfw
 x7xQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Ieje4IOd
Subject: [Buildroot] [PATCH v2 2/5] package/libyang: bump to version 3.12.2
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

Q2hhbmdlbG9nOgogb3B0aW9uYWwgeHhoYXNoIGZhc3RlciBoYXNpbmcgZnVuY3Rpb24KIHN1cHBv
cnQgZm9yIG1ldGFkYXRhIGluIGRpZmYKIGxvdHMgb2Ygb3B0aW1pemF0aW9ucyBhbmQgZml4ZXMK
ClNpZ25lZC1vZmYtYnk6IE1hdHRpYXMgV2Fsc3Ryw7ZtIDxsYXp6ZXJAZ21haWwuY29tPgotLS0K
IHBhY2thZ2UvbGlieWFuZy9saWJ5YW5nLmhhc2ggfCA0ICsrLS0KIHBhY2thZ2UvbGlieWFuZy9s
aWJ5YW5nLm1rICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYnlhbmcvbGlieWFuZy5oYXNoIGIv
cGFja2FnZS9saWJ5YW5nL2xpYnlhbmcuaGFzaAppbmRleCBlMDMyNzhhZGZkLi4xNjlkYmI1NDg1
IDEwMDY0NAotLS0gYS9wYWNrYWdlL2xpYnlhbmcvbGlieWFuZy5oYXNoCisrKyBiL3BhY2thZ2Uv
bGlieWFuZy9saWJ5YW5nLmhhc2gKQEAgLTEsMyArMSwzIEBACiAjIExvY2FsbHkgY2FsY3VsYXRl
ZAotc2hhMjU2ICA3N2EwYWFhZWIzZGY3MjBhZWI3MGQ2ODk2ZTMyZTJjMmJlMDk5ZDQ4ZGY3M2Uz
Y2ZiNTI1NjcwNTFhZjNlNDRiICBsaWJ5YW5nLTIuMS4xNDgudGFyLmd6Ci1zaGEyNTYgIDBiN2Vj
NDM3NDdkMjExYTFlNDljNTM1ODhiMDgyMjA2Mjk0N2JhYjZiZGNjOTUyMzg1NzhiZWFiMzRjYmE1
YmIgIExJQ0VOU0UKK3NoYTI1NiAgYTJhZTk0Y2U0M2Q4YjRiMDg0ZjY3YzA1OTAyZjk3Y2JjMGVj
ODgyZDM4ZWY1ZGRmMWQ2MDE2NTlmNjRkNWM2NiAgbGlieWFuZy0zLjEyLjIudGFyLmd6CitzaGEy
NTYgIGY0ZmJhYTA5YzhiMmZhYTZhODczYTM4MTgxZmY4NjBlMmZmOTA4MDgzMjBmNzFkZWIzNjlm
MDNkZGZiOTIwZGEgIExJQ0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlieWFuZy9saWJ5YW5n
Lm1rIGIvcGFja2FnZS9saWJ5YW5nL2xpYnlhbmcubWsKaW5kZXggZmNhMGNkNjNmOC4uOTRmOWJh
M2I4YSAxMDA2NDQKLS0tIGEvcGFja2FnZS9saWJ5YW5nL2xpYnlhbmcubWsKKysrIGIvcGFja2Fn
ZS9saWJ5YW5nL2xpYnlhbmcubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIwogCi1MSUJZQU5HX1ZFUlNJT04gPSAyLjEuMTQ4CitMSUJZQU5HX1ZFUlNJT04gPSAz
LjEyLjIKIExJQllBTkdfU0lURSA9ICQoY2FsbCBnaXRodWIsQ0VTTkVULGxpYnlhbmcsdiQoTElC
WUFOR19WRVJTSU9OKSkKIExJQllBTkdfTElDRU5TRSA9IEJTRC0zLUNsYXVzZQogTElCWUFOR19M
SUNFTlNFX0ZJTEVTID0gTElDRU5TRQotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
