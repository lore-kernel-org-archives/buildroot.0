Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB0AC282D1
	for <buildroot@archiver.kernel.org>; Mon,  3 Mar 2025 16:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A05B82047;
	Mon,  3 Mar 2025 16:03:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q3EzGfiB5xqW; Mon,  3 Mar 2025 16:03:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D3F08205E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D3F08205E;
	Mon,  3 Mar 2025 16:03:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EDD6944
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 16:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0DCF40D81
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 16:03:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vyRmg7F6bhaX for <buildroot@buildroot.org>;
 Mon,  3 Mar 2025 16:03:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=mickael.tansorier@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4ADEC40D91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4ADEC40D91
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4ADEC40D91
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 16:03:32 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43995b907cfso29551105e9.3
 for <buildroot@buildroot.org>; Mon, 03 Mar 2025 08:03:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741017810; x=1741622610;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EVI6p+0J3gxXImcGAwBRuLLJRCvm7eYfNDCs9Fc3y7w=;
 b=eBIm7cV2+URgIgTjD77WbU/wAHzviJn0iBI3l5wNGAzYtHpXyuZBTFevn9LnEEyUlp
 7jlfFovGfeQ4W2Ij0/EkRf8EVInwyDKc+ZPoE0LbtD4V+bEG0q1fRFuHULlTxaeTaiL7
 D6SB7Vd+08mzsfW6OgP13PCQv2KbhV3Fmz654GlWVgDmSsNbIndKE3yYG4VcMYg2PSFH
 ctmyVJgpfOfi0rJ/9kNTuRSG6seiWpMlfrbWncyuqZHWPdZythWQ8ZMXGw356UJhWYy6
 OExtjYF3qxiQNd2mCwbVC+sXJqRvw9LIq8oHvxCpDnRYNh51XZ5jnFSTUciolMbFFMeT
 erFA==
X-Gm-Message-State: AOJu0YwuTh/56dtcj7YnKSV0MsFPkVZ2bbN88V9VXrTIB3bodGNTSKSP
 a/NG6Mft9N5bDN8awahIgEV5quRaAtJFmEe5MfJeclYo3S/Hb1A713E2/aHbVnU6Pp0QfTlx53g
 h
X-Gm-Gg: ASbGncvjshpAm4wNkK1T6lU4yEcrDBgtvCRseS5IDzrkguPuJJWpooDEbAWZaI34WBF
 SyWgOc5irzcvhStXQgLDLXwDwYEvubMweH4GxJSx01JOfZI3IY+Z2Eolxjs90Ikz753q4jYWGko
 Sl1xkLFsLbQzEdA6Y9GiZ9dXrJ9iP7pk+z/Gy10UZpr5fns3aFGLXpdUJI8MWWQo+xcXsRo/gYv
 EY4se8a2x2YG0TnBzWLjFkBoWRrbBFYcHv20cfjF8c4bzrp3jmPky2auIiVIFMapD5weXY5gdx4
 1JXrOLcZMCpqug50omEXBhNU/8RJqGTF3dnY1DqxCJKPKgci5E5OPdWvhMbl7ft8a5MUBvk/m04
 Q7bkm+Jw4e4E79dhw+EWy2G7P0fhOYpxmkN6RTZyuOMMp
X-Google-Smtp-Source: AGHT+IGlxF29XNnJ65CjZ6kKJxlkb6snuYYJZeIVY5Kphhm2N4S7l4T7uQ6BeZfikb/JkXJ4MOtqCw==
X-Received: by 2002:a05:600c:3ca8:b0:439:84d3:f7ee with SMTP id
 5b1f17b1804b1-43ba675d56fmr93764515e9.24.1741017810164; 
 Mon, 03 Mar 2025 08:03:30 -0800 (PST)
Received: from baku.localdomain
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43b736f8034sm171018495e9.4.2025.03.03.08.03.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 08:03:29 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Micka=C3=ABl=20Tansorier?= <mickael.tansorier@smile.fr>
Date: Mon,  3 Mar 2025 17:03:25 +0100
Message-ID: <20250303160326.122921-2-mickael.tansorier@smile.fr>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250303160326.122921-1-mickael.tansorier@smile.fr>
References: <20250303160326.122921-1-mickael.tansorier@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1741017810; x=1741622610; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EVI6p+0J3gxXImcGAwBRuLLJRCvm7eYfNDCs9Fc3y7w=;
 b=ObuV0zVehJjkqj5SxjUrMLpMm6zcQuuQs5W7DL95bCO2Qyy0+yDTdXag51Z18H577u
 agOXCRj7Mr0qdQihrmCRwGssHRORquzrQO986cGgAnFdX5GovYpCmLmPvW88oY211Dna
 ybLyT/dI1/cnX4rtoTVZ2g3NRH5jQm4xth+BI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=ObuV0zVe
Subject: [Buildroot] [PATCH 2/3] package/minetest{-game}: bump to version
 5.8.0
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
From: =?utf-8?q?Micka=C3=ABl_Tansorier_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Micka=C3=ABl=20Tansorier?= <mickael.tansorier@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TWluZXRlc3QgR2FtZSBpcyBubyBsb25nZXIgdGhlIGRlZmF1bHQgZ2FtZSBhbmQgd2lsbCBubyBs
b25nZXIgYmUgc2hpcHBlZCBieSBNaW5ldGVzdC4gSWYgeW91IHdhbnQgaXQgYmFjaywgaW5zdGFs
bCBpdCBieSB1c2luZyB0aGUg4oCcQ29udGVudOKAnSB0YWIuIFsxXQoKWzFdIGh0dHBzOi8vZm9y
dW0ubHVhbnRpLm9yZy92aWV3dG9waWMucGhwP3Q9MzAwMDUKClNpZ25lZC1vZmYtYnk6IE1pY2th
w6tsIFRhbnNvcmllciA8bWlja2FlbC50YW5zb3JpZXJAc21pbGUuZnI+Ci0tLQogcGFja2FnZS9t
aW5ldGVzdC1nYW1lL21pbmV0ZXN0LWdhbWUuaGFzaCB8IDIgKy0KIHBhY2thZ2UvbWluZXRlc3Qt
Z2FtZS9taW5ldGVzdC1nYW1lLm1rICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL21pbmV0ZXN0LWdh
bWUvbWluZXRlc3QtZ2FtZS5oYXNoIGIvcGFja2FnZS9taW5ldGVzdC1nYW1lL21pbmV0ZXN0LWdh
bWUuaGFzaAppbmRleCA2Mjk4NzFlZGJlLi4xNGI1ZjZhYmNmIDEwMDY0NAotLS0gYS9wYWNrYWdl
L21pbmV0ZXN0LWdhbWUvbWluZXRlc3QtZ2FtZS5oYXNoCisrKyBiL3BhY2thZ2UvbWluZXRlc3Qt
Z2FtZS9taW5ldGVzdC1nYW1lLmhhc2gKQEAgLTEsNSArMSw1IEBACiAjIExvY2FsbHkgY2FsY3Vs
YXRlZAotc2hhMjU2ICA1ZGM4NTcwMDNkMjRiYjQ4OWYxMjY4NjVmY2Q2YmYwZDljMGNiMTQ2Y2E0
YzFjNzMzNTcwNjk5ZDE1YWJkMGUzICBtaW5ldGVzdC1nYW1lLTUuNi4xLnRhci5negorc2hhMjU2
ICAzM2EzYmI0M2IwODQ5N2EwYmRiMmY0OWYxNDBhMjgyOWU1ODJkNWMxNmMwYWQ1MmJlMTU5NWM4
MDNmNzA2OTEyICBtaW5ldGVzdC1nYW1lLTUuOC4wLnRhci5negogCiBzaGEyNTYgIGY4YTI1NGU4
ZDVmNmIzY2EzODczZjk5MDk4NmU4NmM4NjRmOTQzYWE1ZGM5YmY1NjgwOGM1ZjRiZmE1MDlkYjAg
IExJQ0VOU0UudHh0CiBzaGEyNTYgIGVkMmFmZWQzODhjNDcwZTA4ZWRjMTEwNGU0ZmY2ZDEyYjY4
YTMyYTc2YjhjNTJkNzYwYTk5ZDRkMmQ3NzE2ZjMgIG1vZHMvYmVkcy9saWNlbnNlLnR4dApkaWZm
IC0tZ2l0IGEvcGFja2FnZS9taW5ldGVzdC1nYW1lL21pbmV0ZXN0LWdhbWUubWsgYi9wYWNrYWdl
L21pbmV0ZXN0LWdhbWUvbWluZXRlc3QtZ2FtZS5tawppbmRleCBlYzhkNWJmZjI2Li42YjYxMWJl
MGI3IDEwMDY0NAotLS0gYS9wYWNrYWdlL21pbmV0ZXN0LWdhbWUvbWluZXRlc3QtZ2FtZS5tawor
KysgYi9wYWNrYWdlL21pbmV0ZXN0LWdhbWUvbWluZXRlc3QtZ2FtZS5tawpAQCAtNCw3ICs0LDcg
QEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLU1JTkVURVNUX0dBTUVfVkVSU0lPTiA9
IDUuNi4xCitNSU5FVEVTVF9HQU1FX1ZFUlNJT04gPSA1LjguMAogTUlORVRFU1RfR0FNRV9TSVRF
ID0gJChjYWxsIGdpdGh1YixtaW5ldGVzdCxtaW5ldGVzdF9nYW1lLCQoTUlORVRFU1RfR0FNRV9W
RVJTSU9OKSkKIE1JTkVURVNUX0dBTUVfTElDRU5TRSA9IExHUEwtMi4xKyAoY29kZSksIENDLUJZ
LVNBLTIuMCwgQ0MtQlktU0EtMy4wLCBcCiAJQ0MtQlktU0EtNC4wLCBNSVQsIENDMCAxLjAsIEND
LUJZLTIuMCAobW9kcykKLS0gCjIuNDguMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
