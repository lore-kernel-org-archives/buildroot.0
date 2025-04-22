Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E4EC369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 14:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA85B403F7;
	Tue, 22 Apr 2025 14:20:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4fV5UHmbDknZ; Tue, 22 Apr 2025 14:20:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1200940B70
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1200940B70;
	Tue, 22 Apr 2025 14:20:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CB8141BC
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 14:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C86A2403F7
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 14:19:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W9V2kmwLMVq9 for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 14:19:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=mickael.tansorier@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 90A1F40B80
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90A1F40B80
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 90A1F40B80
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 14:19:57 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-39ac56756f6so5192555f8f.2
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 07:19:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745331596; x=1745936396;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VaYI7taV7eKgp9/DHepZRfFyvmoCj2uEiYQjhi+2qao=;
 b=X7efJ4/fkVHqqKo/XQkUmaYyHOGM7TfjqJ7BZEadgeVlMqjpDSyGeEySQIRaX/dRPs
 Mz0Q/X9R3ev9fol1rqWwOvICRWBoB7bglbsQBKZpznTBIAvoJbpH0wojpl/m9vRkNist
 OGR1+wJ+rBzt4kbiZtYTsvVXYBz/Cs1oQjBy+tK2ovH7fbn9fOJ+zCn1S1yOfvVbVgh7
 UkZ176ZF8k0UwuPME4D9gzyGpkJR7yBxxXNROSlVr9ibxRGoB8K4E5z69yZXOWZ4QIT+
 r3sq8+7t3QlZbCSvHQc/xM/QBVBSQu2Jl/MQjHKKVvhYjwDeapk1r05s1KDpyxUcekh/
 hvDQ==
X-Gm-Message-State: AOJu0YzdjzlDvJfQz+CEMQ0YOxsGhmrhoOaehr0+QdDjUM7SyUeP3V3F
 NGkZgtzFdnMjP7nwj2RZQ+oG2xOF7byDzmsXmQ57CS1/jeWQIANX1jbISJn6ebY0L5DcIPIW7yv
 a
X-Gm-Gg: ASbGnctbk1723gfz90k7dP4ZVcGQlse5FJst+XKuflTHCh7wO5D8eGz8QlH55DfKG27
 SHqPXY611S2z0bEq4m4/oDgzhs/gk21+dBJsd0/dxmOksYdL9gMMd1Ng10rfaH/Wl9kjetboXxM
 FCC/VbpGqdI6b9GgejcSS+ctVfh6E60yzMLYEcLfbL7Vhw/Aigbr+9S8YGRuuu7ZPp/K4OHYRZx
 NXHFRpiKYuNqtSNx/px7KyiOCWlNwaKlROvFwRmi1C8EK1jGJrTSjlC+ZCnWd+hK/Gt6023aMHS
 6aQ0uG0n3IhKrz0O17D0dk+B/4pjWAII25thx7ei8GCvxyHMXdAEF1RZa+H2WAmm3Q+lVnH5R63
 Ig/hVUY91/r0+bSIyElXiJppSP1f+y1jf6BnGzEqE
X-Google-Smtp-Source: AGHT+IFzdwxtuunN/A9GtnHI5y/+4w94i/R8wGtkxhFjrcUACRNS4St+HUZNSgnctbV0DS38qHXw3A==
X-Received: by 2002:a05:6000:1ac9:b0:39b:fa24:950a with SMTP id
 ffacd0b85a97d-39efbadeb66mr13353362f8f.36.1745331595679; 
 Tue, 22 Apr 2025 07:19:55 -0700 (PDT)
Received: from baku.localdomain
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d5a9df6sm180714555e9.1.2025.04.22.07.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 07:19:55 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 22 Apr 2025 16:19:40 +0200
Message-ID: <20250422141943.51161-2-mickael.tansorier@smile.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422141943.51161-1-mickael.tansorier@smile.fr>
References: <20250422141943.51161-1-mickael.tansorier@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1745331596; x=1745936396; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VaYI7taV7eKgp9/DHepZRfFyvmoCj2uEiYQjhi+2qao=;
 b=Lk2UUCu35Nz971TH5W2RWHLmgjmHN0+L9cp4WQy0iDFcC/Zlg84pMt8FrdOyPmWKjj
 NlFuzRLDPObE5LIq/84u8rKvOJ1taCuEGhMtEyBQLvB6pR8tEDjQUagPdEbAk6J/XFbm
 2s8I1I5925SUWSkBAJeuAy4T5X8b2mpqeC0cw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=Lk2UUCu3
Subject: [Buildroot] [PATCH 2/5] package/minetest-game: bump to version 5.8.0
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
Cc: Romain Naour <romain.naour@gmail.com>, Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Micka=C3=ABl=20Tansorier?= <mickael.tansorier@smile.fr>
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
LUJZLTIuMCAobW9kcykKLS0gCjIuNDkuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
