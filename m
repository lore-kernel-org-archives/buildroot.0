Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ACF3C021B2
	for <buildroot@archiver.kernel.org>; Tue, 25 Feb 2025 13:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 056E980E6F;
	Tue, 25 Feb 2025 13:10:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9OSDrdyjdkei; Tue, 25 Feb 2025 13:10:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C40280E78
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C40280E78;
	Tue, 25 Feb 2025 13:10:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C6E62019
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 13:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0055A40D7F
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 13:10:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9arjoDULQNIu for <buildroot@buildroot.org>;
 Tue, 25 Feb 2025 13:10:21 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com;
 envelope-from=flavio.tapajos@newtesc.com.br; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7041040D7D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7041040D7D
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7041040D7D
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 13:10:19 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-220e83d65e5so104928075ad.1
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 05:10:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740489018; x=1741093818;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AtRGjx+ueShzIlmQJBb0iTbJQ2RE+EbcYdmWSvYhk24=;
 b=kIlOSLAgh4vTpeiJ9Bt0hM/NTgyq3NUfiocDy+7/DosTKC49tYMb8KHGzZGBBpaS5J
 7hWbmmj3Y/JI1XkWY14S0qBEEb8DtJx+nMF9MU1TTu82lWWeTKYKMOwtf/3UkjCagOW4
 7Z3Bl7z+/SuIqSMpvPGMjL5/1PhvRVaVe0KKrcrPyA0Jalf+OWgXacseIRy9vlbHFPiw
 iYn1BOXzJDYeUBElmge790fpBRYdggnWs1NGxDdpcQFF+79rbDkQs7u45nOQ0sKrKHFu
 F1hOm6vFQj9WGDxRmrbCZGlOxXJntjNBhs7KSveBT55pdREeZXQIv7ES8vKMnFLOayK1
 owfg==
X-Gm-Message-State: AOJu0Yw9Bg25K64BYoyKe4Iy/b0PxK/3HZCu4Z3JeK5ynYwd+KulzGSr
 VQOQzIlXzmjYP6lFrcqytFtfEZYfMNqUqb/NBnUhVbqEBGVWraqDM1wjExUNHiGY4xnKxz0+yJ9
 HB/LBoJpJ
X-Gm-Gg: ASbGncvc3NOW9rTObanCXGVqCasAXmF4TiltngFGYP9a+VXpWYamd9aQdKWSXMF8yBp
 FLhwPCniEtI4Sym3Y9n5kaJU5IUhO9r63yeF7amvHPxASilz1dD84kMMbFUpEsTTIklhAr0cQsG
 /rgsxYqssK2LM6pRnaPt/YAmgN8Gs93MXSzqMeoVmNEiJcF+31kpxpXQmfp1E/KHPxz1L2j+FuC
 Eu5nL8lS1u5kPw7FqctxMQxqwAhFEvpZBVmk0Wl1ayBSZcQQZAFlIsK5EP6WSEDB0oHvp+5gbSR
 v5I1vb3WLCFs10n9wxRcH44Z0zatq8p/IdSSPO19LUPAdwkqOp5g/zxB
X-Google-Smtp-Source: AGHT+IG7Uv0h3pCn4zDhU3pbKrF47hi5sw/ZPZ4ML72uyYf/MnzCFbLK4IPGppsKaY1toquLJYqQAw==
X-Received: by 2002:a05:6a20:2591:b0:1ee:60fc:a1ba with SMTP id
 adf61e73a8af0-1eef3c490cbmr34441480637.3.1740489018364; 
 Tue, 25 Feb 2025 05:10:18 -0800 (PST)
Received: from niltesque.newtesc.com.br ([189.113.44.122])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-aeda7f83fa8sm1308158a12.29.2025.02.25.05.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 05:10:17 -0800 (PST)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Date: Tue, 25 Feb 2025 10:09:59 -0300
Message-ID: <20250225130959.960578-1-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1740489018; x=1741093818;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AtRGjx+ueShzIlmQJBb0iTbJQ2RE+EbcYdmWSvYhk24=;
 b=gCx3pJh7WwLVjOI29bm/9sBmYEJa2L/fuiegXEA1YBlF8rhpsYmmTxEVYN7r0GNhb5
 6ahpKsG0v19qUkVKfeMcOgwX8k9+qrR3D3/GRXlQ+G2lrDQ5Cqp+8H6oD7qcBsq7MTKH
 q8a6Ov+Vwi/g+HogkHkA8wtE/6DoIvvAm6otTCFPRE5mwrezkrr0gfViM2ZHTZIYuU15
 2nJGlh5IXDypgnO9rILJQGvyMKgMkt7SeiLiqjVP/uIttyDeS1F4wewd8kf9pbzyI7t9
 Yhjwc8KFa5EXhBFoOds8GvxLoiKO0eTdbv05uQ5Zll6thEdJz7izCSsPzfSgKp9R6yHV
 7nsQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=newtesc.com.br
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=gCx3pJh7
Subject: [Buildroot] [PATCH 1/1] package/python-sqlalchemy: bump to version
 2.0.38
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
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogRmzDoXZpbyBUYXBhasOzcyA8ZmxhdmlvLnRhcGFqb3NAbmV3dGVzYy5j
b20uYnI+Ci0tLQogcGFja2FnZS9weXRob24tc3FsYWxjaGVteS9weXRob24tc3FsYWxjaGVteS5o
YXNoIHwgNCArKy0tCiBwYWNrYWdlL3B5dGhvbi1zcWxhbGNoZW15L3B5dGhvbi1zcWxhbGNoZW15
Lm1rICAgfCA0ICsrLS0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkvcHl0aG9uLXNx
bGFsY2hlbXkuaGFzaCBiL3BhY2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkvcHl0aG9uLXNxbGFsY2hl
bXkuaGFzaAppbmRleCBjZmEzMjZjZmRjLi5hYTk4ODhiNThkIDEwMDY0NAotLS0gYS9wYWNrYWdl
L3B5dGhvbi1zcWxhbGNoZW15L3B5dGhvbi1zcWxhbGNoZW15Lmhhc2gKKysrIGIvcGFja2FnZS9w
eXRob24tc3FsYWxjaGVteS9weXRob24tc3FsYWxjaGVteS5oYXNoCkBAIC0xLDUgKzEsNSBAQAog
IyBtZDUsIHNoYTI1NiBmcm9tIGh0dHBzOi8vcHlwaS5vcmcvcHlwaS9zcWxhbGNoZW15L2pzb24K
LW1kNSAgYjdiMTUxNGIwMTc5NmMxYjk4ZDdiN2RkZDJiMmM3OWEgIHNxbGFsY2hlbXktMi4wLjM3
LnRhci5negotc2hhMjU2ICAxMmIyOGQ5OWE5YzE0ZWFmNDA1NTgxMGRmMTAwMTU1NzE3NjcxNmRl
MDE2N2I5MTAyNmU2NDhlNjUyMjliZmZiICBzcWxhbGNoZW15LTIuMC4zNy50YXIuZ3oKK21kNSAg
M2NiZjIxOGM1NGIyNWZhNGUxOGQ3ODg0Mjk1NjYwMWQgIHNxbGFsY2hlbXktMi4wLjM4LnRhci5n
egorc2hhMjU2ICBlNWE0ZDgyYmRiNGJmMWFjMTI4NWE2OGVhYjAyZDI1M2FiNzMzNTVkOWYwZmU3
MjVhOTdlMWUwZmE2ODlkZWNiICBzcWxhbGNoZW15LTIuMC4zOC50YXIuZ3oKICMgTG9jYWxseSBj
b21wdXRlZCBzaGEyNTYgY2hlY2tzdW1zCiBzaGEyNTYgIDk4MjE3MjBiNThkNGE1NjViNjEzMjEw
MDdhOGFkNDNhYjY5OTFhMzk1OWU2NmNkNWRiNGRkOWVhZTY5YzdkZmMgIExJQ0VOU0UKZGlmZiAt
LWdpdCBhL3BhY2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkvcHl0aG9uLXNxbGFsY2hlbXkubWsgYi9w
YWNrYWdlL3B5dGhvbi1zcWxhbGNoZW15L3B5dGhvbi1zcWxhbGNoZW15Lm1rCmluZGV4IGM4ZDkx
OWMzY2QuLjNhOWQ5ZTA2YjYgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkv
cHl0aG9uLXNxbGFsY2hlbXkubWsKKysrIGIvcGFja2FnZS9weXRob24tc3FsYWxjaGVteS9weXRo
b24tc3FsYWxjaGVteS5tawpAQCAtNCw5ICs0LDkgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjCiAKLVBZVEhPTl9TUUxBTENIRU1ZX1ZFUlNJT04gPSAyLjAuMzcKK1BZVEhPTl9TUUxBTENI
RU1ZX1ZFUlNJT04gPSAyLjAuMzgKIFBZVEhPTl9TUUxBTENIRU1ZX1NPVVJDRSA9IHNxbGFsY2hl
bXktJChQWVRIT05fU1FMQUxDSEVNWV9WRVJTSU9OKS50YXIuZ3oKLVBZVEhPTl9TUUxBTENIRU1Z
X1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvM2IvMjAvOTNl
YTI1MThkZjRkN2ExNGViZTlhY2U5YWI4YmI5MmFhZjdkZjAwNzJiOTAwNzY0NGRlNzQxNzJiMDZj
CitQWVRIT05fU1FMQUxDSEVNWV9TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3Jn
L3BhY2thZ2VzL2U0LzA4LzlhOTA5NjJlYTcyYWNkNTMyYmRhNzEyNDlhNjI2MzQ0ZDg1NWM0MDMy
NjAzOTI0YjFiNTQ3Njk0YjgzNwogUFlUSE9OX1NRTEFMQ0hFTVlfU0VUVVBfVFlQRSA9IHNldHVw
dG9vbHMKIFBZVEhPTl9TUUxBTENIRU1ZX0xJQ0VOU0UgPSBNSVQKIFBZVEhPTl9TUUxBTENIRU1Z
X0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCi0tIAoyLjQ4LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
