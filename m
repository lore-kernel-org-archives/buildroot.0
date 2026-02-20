Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88445C531EA
	for <buildroot@archiver.kernel.org>; Fri, 20 Feb 2026 01:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A02E860F82;
	Fri, 20 Feb 2026 01:45:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S0QbOw9qw8Jd; Fri, 20 Feb 2026 01:45:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 077A860F7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771551930;
	bh=Vz6EZikeKv9R0/RKW3QxGV8T52g7txMTLsAsMikUcMY=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HnG9TwIQuNuw5CVejRZHQEV/h5SEWg+uGAjJbjyOVxlLv3Rm+7LMlLgtWtD8W6T0p
	 rWXCCh8eC10U2rJS3axX1YlsL8t2qP/QeTIVexMxa6kQfeqjAJTJqESNhbXgQjwgmD
	 NWqV8fj0g1wAT/i16VfdXGIVD+c9Ba2jHVeZDCggMl+Ju8+ynjc/qL81x84a5IQ9Di
	 B/XWoZ66nmz2kir5VV1xM0BeyVOYRHJ55s4hD9a9uOo+bSQzo2ESWLpxPv9x6FDM/L
	 AATnA85XWWJiovdF6ryzkZtjVkD/zNr/7PyiW386CbHv/6oi/mIMbm/wfVkVP+Xq65
	 clNr8ZRrehrHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 077A860F7C;
	Fri, 20 Feb 2026 01:45:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8408D183
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 01:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6978B40A93
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 01:45:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4CMWtN0CSYVg for <buildroot@buildroot.org>;
 Fri, 20 Feb 2026 01:45:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6AA3640B65
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AA3640B65
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6AA3640B65
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 01:45:27 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-824b32875e7so875877b3a.3
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:45:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771551926; x=1772156726;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e64acSAcmEdtcKZFi2hcNzLAbc6GRUupAVDUko4qH0g=;
 b=SnP+zOfN/WldTXBduXGjcG4Ti0bQ5hrTyw1rp/mFMzqJnNdwFinBJzztUKkuGPlrSG
 FQ6ZCvC5v45riiP1CKomvnlLTFGNICjE8mf8Y6s+2q6WQBVuU1skxmAvjSIIbHsCLzF2
 r4rUE7IAXsvKF2+K8c97JAfVF4k6shqL+mcwQbQ4V99tGTvQdj9o58etx+vQZuRojz8d
 iTQdLxHD31llhqtSdJHfqR+pA4jO/XcNg9XN9KgTME+ZG1MBQbuY6FFt6QxUOtlRUZVc
 ODrfAE6Vavt2XVowKRGmkWIEdrbAKTOxHLn1CFTf/sIgyctCDTDUeCqztBbNkHVbwiA+
 16Qg==
X-Gm-Message-State: AOJu0YwscHuqyrPxAg1qir2+UhjiEfYJRPnTy2qKlC9K/P/KqdY+cecj
 +wucAKCZci2xbuhBR/66N1OUJYdXi37wrhKk1h+aUCTqJHhsED5U9lFY
X-Gm-Gg: AZuq6aJ7bA191PrPPytMbgB6n2jAR+VKkoxe8vgtYBdve8sur4dSyLIfhlnsoyvGumF
 acgrR51JvJpWrjZcKJgxLFfPahAAuWas6bY/EjxX5s8lYA3GqKM2i/LEKJ3luznnWoE1/c0cHnU
 YbKhaz+uylmYAoKbRcvtPGuGFtbr3NoTc2bpi2jHYGva06mMlHvv8hA51DpcYf39E7IAVVd2xGr
 zSj6uGxdKUzA6+EwYu/FJ7wldF2aWlLLknlTdUn3k9l1iO82UvliOCC0NKZUDzfGljnLD0YvzP8
 LevC7qO+ReFQyfPAQlgIZjwzNzOIRrcyc3sjOmC1WgnILdkKRO+6sKlL0nF1JyO9EPaXW88R/yC
 J7nzfZTpjtanh2gIuB78VCjgPSmdUeeRlqUIA6jqLFs7MoBShsnrK7Kn/U1SA0hjp3b3AnuvNpt
 flbh2uJ8lK+T7jY0HbUSx55ZPLdw==
X-Received: by 2002:a05:6a00:2d90:b0:824:ae74:571f with SMTP id
 d2e1a72fcca58-82527591ec2mr7505920b3a.40.1771551926496; 
 Thu, 19 Feb 2026 17:45:26 -0800 (PST)
Received: from wash-5.local ([50.120.91.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-824c6a2ac83sm19417438b3a.12.2026.02.19.17.45.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 17:45:26 -0800 (PST)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Thu, 19 Feb 2026 17:45:21 -0800
MIME-Version: 1.0
Message-Id: <20260219-qemu-tcg-interpreter-v1-1-d7f11b967f49@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQrCQBAEvxLm7ECyYkS/Ih52Np1kDq46u5FAy
 N8dvTRUQ9VGBaYodG02Mny06DM7dIeG0hzzBNbBmUIb+jZ0F37jsXBNE2uusJfBlwc59jKegpw
 F5Krfo67/7O3uLLGAxWJO8y+WsVba9y808I3mfQAAAA==
X-Change-ID: 20260219-qemu-tcg-interpreter-db36bf52b7be
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>, 
 Joseph Kogut <joseph.kogut@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771551926; l=1347;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=XsqDVyUEzzdQ7slZ6E638GE6OHbzlKunfnpNMIKbZhs=;
 b=RQ/DiDTdJRwuGX4ZQpcZIWGNYecN8XC7evzQ0IVNVhODPwaNtf5B8PRsVa09sw+dDn/uHt+KV
 X3RGQh8i3h1BJbeHqV8FCX9EaZ8o2NBXJVgurZUSGsK91PLea8t4Ps+
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771551926; x=1772156726; darn=buildroot.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=e64acSAcmEdtcKZFi2hcNzLAbc6GRUupAVDUko4qH0g=;
 b=lbik4nBAGx3j9vhoNX2Xkz5tgzFXrb+FScFjv5Sj4hCHJLIZN1EGyYIuxmGNvbDjqZ
 oTbMZTDLJoedZCEY1l0KmtCWQWmJVPrZsJ/ZMCWcI9Gjzp/T5Tq0bShMaSC6vj5bfZWb
 raD6P8+9wK4EvnwIaB+YCTO8SojVNzXMbxEurKxs+3VP43QaBTdsXB2OR0Djs/gilcO1
 ng8zmhlwF+V0AmEvgmwSY2RStplVhtZjPe0WQFIjYvsduuOGg85Rh5ntScAob3WH0emM
 OSONhTTT2GzeqPoSV4oUTXnqfbdYFF7Py96kb1Dn5uw0ZGDULjyQbYj93BrMXgxrTTcE
 fftA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lbik4nBA
Subject: [Buildroot] [PATCH] package/qemu: conditionally enable TCG
 interpreter
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Qemu has two flags related to enabling the Tiny Code Generator (TCG)
feature. Using:

  --enable-tcg

Simply enables the TCG backend for JIT code generation. However, some
architectures aren't supported by the code generator, and the build
will fail during configuration, such as in this bootlin-mipsel32r6-glibc
build:

../meson.build:923:6: ERROR: Problem encountered: Unsupported CPU , try --enable-tcg-interpreter

Enabling the TCG interpreter [0] allows for a software interpreter to
execute TCG code in cases where native code generation is unsupported,
which fixes the build.

[0] https://wiki.qemu.org/Features/TCI

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/qemu/qemu.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 97f8e22091..f50805917b 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -56,7 +56,8 @@ QEMU_OPTS += --disable-kvm
 endif
 
 ifeq ($(BR2_PACKAGE_QEMU_SYSTEM_TCG), y)
-QEMU_OPTS += --enable-tcg
+QEMU_OPTS += --enable-tcg \
+	     --enable-tcg-interpreter
 else
 QEMU_OPTS += --disable-tcg
 endif

---
base-commit: 6c83a0b8e5658b901dd35ae23217075f035af998
change-id: 20260219-qemu-tcg-interpreter-db36bf52b7be

Best regards,
-- 
Joseph Kogut <joseph.kogut@gmail.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
