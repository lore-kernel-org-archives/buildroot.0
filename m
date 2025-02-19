Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5AD4C021AA
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 08:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70DF884DA7;
	Wed, 19 Feb 2025 08:52:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7r_8Bw8JA9wJ; Wed, 19 Feb 2025 08:52:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7916284D9E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7916284D9E;
	Wed, 19 Feb 2025 08:52:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FBFB127
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEA2460071
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:51:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0m7An7hr8Fir for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 08:51:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DB03860671
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB03860671
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB03860671
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:51:01 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-438a39e659cso44007575e9.2
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 00:51:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739955060; x=1740559860;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zHMbf7dVpcoS986xJKFxn99q15fQiinwazTqAXVE3bc=;
 b=Iu0pm1ZM8x/98UNvzNdS59s9S3FRrRO9OAbYTKz946BwLBJ/ispWflSL/eF2uDQa2Q
 06/BnHY67Mkrx3oxBVLfa7lLL7jj5bSANHrxaCebu82/XNULqfpvdDORshIRIldvtqdK
 uZXKK/x8uKo/KAYbwmPgtnFNqcRIpzyW+6pLfI4TzaiKEkmAZcT35hg+FgpV+iLbozs1
 COzxCOMzjQEp4yKL6MeozrGilpvTAGy6GiDDOuEfFxlKyEUThg63caIO8BNIHIIl3f2W
 81N37m5jm0sTwtalSRlLveIVoCst/w5wNgtkWS5BuOrIwqcRANhr77jz8xxj5LHSigEk
 1HPQ==
X-Gm-Message-State: AOJu0YxkvhYpSGm4iPyvx4sw9VdU0B0Hu+T3470oYRz8TKmsycuV40J2
 vNr/ioOT0YQMOmNv2xIVCNfaEp7OZtYH0GUc/+pHAxHTYCB9PzK4hSa/qg==
X-Gm-Gg: ASbGnctO29cA/zwPJGo8AmZ4dXSo5XxtsEk93rO6zDHVS/CdYhais/BjgPJnYsuNgHb
 4gDUO3UYOf2vwZMkhZ3MqIp09xtDs+4Ftp8KSSUNzlYYgtaR4T8wWNvGFVOPyrCZjOW4Rca/4F6
 vC9xbKFdmMeUbQirMgTB0JTkeu8oNSE4UwuBWt29iIDwvQDdVV2R3WFeUAxxaMZ7xVIKj9bI4hv
 KPTmb+8A6yiJSs6lOzSNorqNBMgiMkrcAR0Azo7FMQYvA6+TMJbev1QWwRuIjvmcOlQSOVDr9Fs
 d44uQkEXI9F0bHYtRgg7mh//ng==
X-Google-Smtp-Source: AGHT+IEw8ey4O3pU0wGMkCh8CeKWw4W9JNP6fNpqfwaYLfEkQ2IYh4MJLnuhvGZia72PhEJQNQzHRA==
X-Received: by 2002:a05:600c:4e49:b0:439:8523:36cc with SMTP id
 5b1f17b1804b1-4398523382cmr113040295e9.11.1739955059840; 
 Wed, 19 Feb 2025 00:50:59 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5e9esm17517399f8f.61.2025.02.19.00.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 00:50:59 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Wed, 19 Feb 2025 09:50:40 +0100
Message-ID: <f908f28f1dc58ee3145e7bab18f02149d6acf43d.1739955023.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1739955023.git.yann.morin.1998@free.fr>
References: <cover.1739955023.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739955060; x=1740559860; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zHMbf7dVpcoS986xJKFxn99q15fQiinwazTqAXVE3bc=;
 b=Ktt/rpm7UZrPkimZPIwrBQkZpSrl0x2N1APCILl8Kbezij/YYOqHjUw4cSPhReE7J7
 ouYIB4+SsL+z9i+UUzRK6EI3Z2w0JcqVFv2XsuBv4CrGDdRQ+3ndznihecd12fxjz/fi
 tWXJJw+jjOzNxrQ2a/6DlN6NJad/EL+gRHfLk+SWCE5L7b6BsbPQSY7Fr7GYVIPS7eFy
 CkYxkhcXgS3sKP3oemyVwKPTQHk2+prSOUnxg2oQgJejOBdlGdlzbIIHfQrJvBJeAfOD
 XNMg1zEjz4YpXHrlqU0ZEc4SN5BHyZ1ZSC/983PIUfOtS+MOZcpoZKarihY9d/GHZPD/
 l0SQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Ktt/rpm7
Subject: [Buildroot] [PATCH 25/27] package/sdcc: add option for the z80 port
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
