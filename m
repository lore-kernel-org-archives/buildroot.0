Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5D6CAC58F
	for <buildroot@archiver.kernel.org>; Sun, 14 Sep 2025 04:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C24E60FD6;
	Sun, 14 Sep 2025 04:21:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vsuMyWSZWu1O; Sun, 14 Sep 2025 04:21:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C4AF60FAD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C4AF60FAD;
	Sun, 14 Sep 2025 04:21:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AB0B3117
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 04:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D4F741311
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 04:21:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WRAbPV_HG17r for <buildroot@buildroot.org>;
 Sun, 14 Sep 2025 04:21:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=salvador.joseluis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A363E4034C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A363E4034C
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A363E4034C
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 04:21:45 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-45de1084868so16054085e9.2
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 21:21:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757823703; x=1758428503;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PxBI8dmyi+aCiIse7QO5B5BK02Thn0jFcaRAmR0drBU=;
 b=RMI7M099s3aUU5EigiRaLiMkNs0w/44kJf6PnGTUujjDRfaSgX0At1ClqY4xv5SbDL
 DkFHr7D2eNnNvO16zV7KwExKANMnhrc0ckK0JD31V3JeUYJKNbEsXiRtzWFLw8TSTexd
 gBBQsBjCNMaYBB25wv7/lBNZ9ATWjUR3aw5aNT9cw01HYqi3YjyeAS+jw2WkI0py2yri
 j6LniBZyFasICil3vx9WvWW4ZOgZEk23k3vcEBfH2zS/JpgNhVU8gdELNkuEIvJMtJ4G
 YLMePIsv1xkJENtAq/+/prSsRicsD542P/YXD20jepjhuxZYOQgWWNwaKG7rh54hzRyA
 4fXQ==
X-Gm-Message-State: AOJu0YyQbIx+Z3GMdtLxJWl1xElLU7A0Y8v7naxvK+MkrH7ZRfBnK5fi
 ty89g2+wBQOabTab2vJqUj45ZRC0kCHRi46JTa/LsN5e+xRtteFRDFUDOlt61LjG
X-Gm-Gg: ASbGncse++Sqa6Lq88q4mUdJx4yB0/vW4KNiqZNKqUy0zW0nGGTggp9s0YSlPx4pCX9
 lxrcweMQoZ7K/joVPMMZ7LGqznZVSPguafnmCutqOO8nZRyeK/OIyJPWr4AlOzBdIB0HWpBD7nC
 admeYGDsvmvpGWsFpPUr08/UUmOMOs659aRaJGuXPSG7PcE9RWx57QqpP8P6Oq6HOU8kbjgsOKB
 4NRU5X0JQdvSUbv/TDO0ndFM1lpdpkh2C7fjfhSRI934t02JcZ/8HZr9UQQ0ZXj5opXvWewmvoR
 jXOvZA0zW8BHgPiKYwXonyc5FeWuyYUOExN6NyyQ4CqfiGkekNt4NiKJtNWpnh52HmYsokqCgA6
 rOXvCJWM21PrBHid5e+OWE3Hx442urcsaSlOAxbo8zKUvY+eJsZUMfzPtLWywtNla4eDY92U1Id
 ebFffJdOOFniEVC98sAKKZ8Nr048/p38WaSfS5sM4StjRmWQ==
X-Google-Smtp-Source: AGHT+IFEA7CqwPsZwZo+HxCH/ObsprkvRk7nJjuEpdrM39CqSQKfCgS+DdZ5h3Xj+DHhbObWFPFSTw==
X-Received: by 2002:a7b:c4d0:0:b0:45c:b601:660a with SMTP id
 5b1f17b1804b1-45f211f2fb3mr52164965e9.23.1757823703188; 
 Sat, 13 Sep 2025 21:21:43 -0700 (PDT)
Received: from cuervo.intranet.jlsalvador.online
 (223.85-87-142.dynamic.clientes.euskaltel.es. [85.87.142.223])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45f2b9b443csm7638725e9.18.2025.09.13.21.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Sep 2025 21:21:42 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Sep 2025 06:20:54 +0200
Message-ID: <20250914042054.771446-1-salvador.joseluis@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757823703; x=1758428503; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PxBI8dmyi+aCiIse7QO5B5BK02Thn0jFcaRAmR0drBU=;
 b=WEYoHRZwbV2QVgX2i/qRKV07FxVIvvTU91NUG4VyhvWfkrEntWq/oU71DTT5xwfLoU
 BcYzWdAl34uZMaKaZ7S4ogjurrwjCb4wpm+mEFjhlWaiA1d0Nj/GUsSLdznM5/H9VSnr
 yOciT3xRInXnoiXnicd3YjC13iubyWkWGnEMZOlbmkEvTbZyil8983XBU6JBwl14H0mg
 LiZeROR3bxrW66B0lE5dIqzsypFasJbpZMEjP+dIYO/Dta3N+7BtzpEyAy2y5Pz9G2Pu
 ic1BMZnW9tklpF3gNTg+P0sDBXYuN2Vf+KGkp0tk8Y0hpCVS25t2swMN4RoEu0pIdIws
 sMmw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WEYoHRZw
Subject: [Buildroot] [PATCH 1/1] support/testing: remove arc_summary from
 ZFS tests
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
Cc: Romain Naour <romain.naour@smile.fr>,
 =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBwYXRjaCByZXBsYWNlIHRoZSBbMV0gcGF0Y2guCgpUaGUgUHl0aG9uIDMuMTMgaW50ZXJw
cmV0ZXIgaXRzZWxmIHNlZ2ZhdWx0cyBhdCBydW50aW1lIHdoZW4gY29tcGlsZWQKd2l0aCB1Q2xp
YmMgb24gdGhlIGFhcmNoNjQgcGxhdGZvcm0uCgpUbyBrZWVwIFRlc3RaZnNVY2xpYmMsIHRoZSBl
eGVjdXRpb24gb2YgdGhlIGFyY19zdW1tYXJ5IGNvbW1hbmQgaGFzCmJlZW4gcmVtb3ZlZCBmcm9t
IHRoZSBaRlMgdGVzdHMuIFRoaXMgY29tbWFuZCBvbmx5IHByaW50cyBzb21lIEFSQwpzdGF0cyBh
bnl3YXkuCgpGaXhlczoKaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290
Ly0vam9icy8xMTI3MTEyNDg1OSAoVGVzdFpmc1VjbGliYykKClsxXSBodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvcGlwZXJtYWlsL2J1aWxkcm9vdC8yMDI1LVNlcHRlbWJlci83ODYzOTYuaHRt
bAoKU2lnbmVkLW9mZi1ieTogSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIDxzYWx2YWRvci5qb3Nl
bHVpc0BnbWFpbC5jb20+Ci0tLQogc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF96
ZnMucHkgfCAyIC0tCiAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3pmcy5weSBiL3N1cHBvcnQvdGVz
dGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfemZzLnB5CmluZGV4IDFiOTA3YWM0ZGUuLjlmZWFlNDll
ODYgMTAwNjQ0Ci0tLSBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfemZzLnB5
CisrKyBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfemZzLnB5CkBAIC01Niw4
ICs1Niw2IEBAIGNsYXNzIFRlc3RaZnNCYXNlKGluZnJhLmJhc2V0ZXN0LkJSVGVzdCk6CiAgICAg
ICAgICAgICAienBvb2wgc2NydWIgLXcgcG9vbCIsCiAgICAgICAgICAgICAic2hhMjU2c3VtIC1j
IC90bXAvdXJhbmRvbS5zaGEyNTYiLAogICAgICAgICAgICAgInpwb29sIHN0YXR1cyAtdiIsCi0g
ICAgICAgICAgICAjIENoZWNrIFB5WkZTCi0gICAgICAgICAgICAiYXJjX3N1bW1hcnkiLAogICAg
ICAgICBdCiAgICAgICAgIGZvciBjbWQgaW4gY21kczoKICAgICAgICAgICAgIHNlbGYuYXNzZXJ0
UnVuT2soY21kLCB0aW1lb3V0PXNlbGYudGltZW91dCkKLS0gCjIuNTEuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
