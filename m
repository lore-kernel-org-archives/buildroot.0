Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25906C369A5
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 20:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC60241393;
	Wed,  9 Apr 2025 20:04:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SFQGE69KQBTE; Wed,  9 Apr 2025 20:04:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28305413AB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28305413AB;
	Wed,  9 Apr 2025 20:04:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 18456220
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8C9783FA1
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IXAdixROi6ix for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 20:03:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EEECD81D47
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEECD81D47
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EEECD81D47
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:58 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-39141ffa9fcso2837f8f.0
 for <buildroot@buildroot.org>; Wed, 09 Apr 2025 13:03:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744229036; x=1744833836;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zHMbf7dVpcoS986xJKFxn99q15fQiinwazTqAXVE3bc=;
 b=Yltqbyu5dsW/kNUnr4h+YAH02PLXok3VBmav1c+tmqPGTjT3kb64hzlpivj4ju98Cg
 ivZ0t2z1GYi9BOgRAUcQ2en1jt2BwaxVFpVTeDAjfdipzYvKgEGrzH41rtmWbV+iwzPp
 BqD8V1iQg/dbaZkzqwj9/fp0X8ZZ409Ngolj35l9lENLegqB3TDST5YlZ+46uAWngKPl
 cSvYl2B5V8gjbvZOFzyRwkqZF6zXoLeTyB1ST3yqlyE7GStQAFd8iFH5I45URnrHS3i4
 u2hfXiryk1vtcqAHgCQytbNxSTAoOAs75BRThUKdSUg9bw/uYLivX0TPKDKKXLWsoRGK
 Y3Ng==
X-Gm-Message-State: AOJu0YwKwHbMRDFZhDsEK3HQ5lTmFrQg7tde+iojY0vruikIGY7bq4Vp
 e2ntmUyGcsgbWSSX69zewnMfNcFVbGIOdT2Sod+IyoCCRO7C8dQbTNRS4A==
X-Gm-Gg: ASbGncvoNLk7IQKVlprxYWMCVnwW/OPJ7waLgQC9HuFtigearA4nR250bG298TITTFU
 ZonG4Kbg+Ke653L9sVL9vw5F2yhEAv7SG4S0+L2Iy9bLS21vOxUXcJ+PCdN8TD01AFxZs+PgCqJ
 FGlh95fpJ8YfZ19hFNNxFVJh91OG8C/7yBEOYnW1rGpajtVzQW4hwm/TaXNNqJwEdLE0Kl98oRd
 4Dfjgu9uCULnlyfZXG8YcSdZ1p8mw1yxigBVvpkdBOoG6fYuMqX0X60CRGRaUy7Nv71aizZ3+GM
 h6x8zd1AMvyj5VVLme4yLf51PJPU0L0UJgSkL64qycaPhzOZuccwDr+/sRFMtQ==
X-Google-Smtp-Source: AGHT+IFe0IEbXl0GwttrAxyV0kdw782CwvY6zzEbQ8nYwl3aTRrb7KOsVygMo22OgvC//jpIDkposw==
X-Received: by 2002:a5d:598f:0:b0:390:f9d0:5df with SMTP id
 ffacd0b85a97d-39d8f4f13camr49263f8f.52.1744229036442; 
 Wed, 09 Apr 2025 13:03:56 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d8937734esm2526113f8f.32.2025.04.09.13.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 13:03:56 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Wed,  9 Apr 2025 22:03:41 +0200
Message-ID: <a3ae43bd0fc8e011a707f9b8454063c8d6fd50fc.1744229017.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1744229017.git.yann.morin.1998@free.fr>
References: <cover.1744229017.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744229036; x=1744833836; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zHMbf7dVpcoS986xJKFxn99q15fQiinwazTqAXVE3bc=;
 b=ADYifN+o87c0gIv+WZnX4UytCBtcE102IvIskpyODkhifnzPPQhJkqRGqrn6hngcr5
 t4uk6LCtywgDaW3C/EPUgcAXNXwcFeIVhIon8LOOS41boVLrjtUJ9ydWmJR6UpOLEgn4
 42Td2Mq98URv+tKTbJO6RNREpymNa6qy28AdLnzeTlqH7BIVPHrsqrCXm/KrAsy+zg8m
 J6BJTNslZVh5pGL3AsctqJ9oKBks37nr55nEdPy+TIRH8TuUQ0L7k8eTOT0E3AQ6N+gk
 Vr5vHH0qxIEx15P+ySU/mW6MTHUlVvLewXkUFGH1VMXNb8hMFXf16E+c8b4tebt3C0xR
 TEyg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ADYifN+o
Subject: [Buildroot] [PATCH 26/29 v2] package/sdcc: add option for the z80
 port
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

The z80 is a common microprocessor familly, and although it is currently
unused in Buildroot, it makes sense to enable to demonstrate how to
enable ports other than the mcs51.

Note that we decided to add a single option that enables all the
variants of z80, rather than one for each variant: this only installs a
single additional program that handles all z80 variants anyway. When the
device libs are enabled, one set of libs is installed for each variant,
though they are small enough that it does not warrant adding an option
for each variant.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sdcc/Config.in.host | 8 ++++++++
 package/sdcc/sdcc.mk        | 8 ++++----
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/package/sdcc/Config.in.host b/package/sdcc/Config.in.host
index 1c851951b8..711da37444 100644
--- a/package/sdcc/Config.in.host
+++ b/package/sdcc/Config.in.host
@@ -28,4 +28,12 @@ config BR2_PACKAGE_HOST_SDCC_MCS51
 	  Add support for Intel MCS-51 based Microprocessors (8031,
 	  8032, 8051, 8052, etc.),
 
+config BR2_PACKAGE_HOST_SDCC_Z80
+	bool "z80 (et al.)"
+	select BR2_PACKAGE_HOST_SDCC_HAS_PORT
+	help
+	  Add support for Zilog Z80 based MCUs (Z80, Z180, eZ80 in Z80
+	  mode, SM83, Rabbit 2000/3000, Rabbit 3000A , Toshiba TLCS-90,
+	  Zilog eZ80 in Z80 mode, ASCII R800),
+
 endif
diff --git a/package/sdcc/sdcc.mk b/package/sdcc/sdcc.mk
index 60ed688ce4..8e5032427f 100644
--- a/package/sdcc/sdcc.mk
+++ b/package/sdcc/sdcc.mk
@@ -48,7 +48,7 @@ HOST_SDCC_CONF_OPTS += \
 HOST_SDCC_CONF_OPTS += \
 	--disable-ds390-port \
 	--disable-ds400-port \
-	--disable-ez80_z80-port \
+	$(if $(BR2_PACKAGE_HOST_SDCC_Z80),--enable,--disable)-ez80_z80-port \
 	--disable-f8-port \
 	--disable-hc08-port \
 	$(if $(BR2_PACKAGE_HOST_SDCC_MCS51),--enable,--disable)-mcs51-port \
@@ -68,8 +68,8 @@ HOST_SDCC_CONF_OPTS += \
 	--disable-sm83-port \
 	--disable-stm8-port \
 	--disable-tlcs90-port \
-	--disable-z180-port \
-	--disable-z80-port \
-	--disable-z80n-port
+	$(if $(BR2_PACKAGE_HOST_SDCC_Z80),--enable,--disable)-z180-port \
+	$(if $(BR2_PACKAGE_HOST_SDCC_Z80),--enable,--disable)-z80-port \
+	$(if $(BR2_PACKAGE_HOST_SDCC_Z80),--enable,--disable)-z80n-port
 
 $(eval $(host-autotools-package))
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
