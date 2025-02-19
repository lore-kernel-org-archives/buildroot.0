Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D76BEC021B1
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 08:52:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4B184F3BB;
	Wed, 19 Feb 2025 08:52:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V_eMHD4zZlzs; Wed, 19 Feb 2025 08:52:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 701DF4FE95
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 701DF4FE95;
	Wed, 19 Feb 2025 08:52:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 720BA127
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4CAB1606A3
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:51:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1JstgeIdINPN for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 08:51:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 42BEA60071
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42BEA60071
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 42BEA60071
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:51:01 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4399a1eada3so6447805e9.2
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 00:51:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739955059; x=1740559859;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gUj1gcoY2cMKuDX3x9c0+5BntFAv59RPeflU2qNTDGQ=;
 b=AhtUzq2Ahea+G92vHt6/16jxxVy05sqWLPPHVVCPfWUsQqiT7hHoRhQQ0xDiXlkeUX
 Zir2uci1ncHWuHMWqPicKYQcuJ/VJ0mhnKaWM549CxmVhVbpVS/7+um3gp7Midqxw1e3
 vRfwIR3Yxj/voXE9xLspjEUKbXGpAHof5BTCPgImfFiXiZpJg8VWG3TFVzFn2eN556vh
 LCw24f2EdtH7+4D5RZ1yLggzpxg0aGiodGRW7k01jlhFTftbCydxCSTtuvccBl/eGnyl
 VrsSQZ+tOLOPchZ9jAj8YwugQxYK/1JmnXRKhKXgTUn1O3e0RMinMqVn5CXMMzV14VsO
 cObA==
X-Gm-Message-State: AOJu0YwYT1whKn/CT4hzb7GNVb22Uz5kEhi77AdM4cMxc1BQI61zJtNq
 NkC1oonsE3D+4BKQWJSiR0YxCAR2Y9wKln+s+LSzrGnk5PqFFMKzgeFmKA==
X-Gm-Gg: ASbGncs9VZzb7BXcuil5ilsp9eOpCmNYec43tak0M8yo7sy6Uik2W3635COMFIk9zDZ
 2ukiBu6VEFSPX9yTV2YdiwUYAW+Vx/7n5G6msseXJFSUM+8jwb0CbH/jcMvkrLJw+02W8D3EizS
 HSmhkeEZObateOII7Kbn5yo8WQCWFHx0ZjgGvzNdiuX8vCr/OAYRo0Nv1VbzzOTTaSfCTq3XpPV
 TPOsoDEhNGTodKmf4Mr4rP5xDC2GJkavSH+e5gqMo9n9kZzGyQT6m2mClHd+nDILMchf0gTbUMm
 qDJTOWYqDkmoafzQ+82CwFK5CA==
X-Google-Smtp-Source: AGHT+IH9GKKauXXVxfJVdpK6KgZQ/ojRV0WHY8a0KYXm5GR3YhtS55YZ2RWv5/+NwKe6vtkC431k1w==
X-Received: by 2002:a05:600c:19ce:b0:439:6a7b:7697 with SMTP id
 5b1f17b1804b1-43999da70d4mr30319955e9.14.1739955059160; 
 Wed, 19 Feb 2025 00:50:59 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5e9esm17517399f8f.61.2025.02.19.00.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 00:50:58 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Wed, 19 Feb 2025 09:50:39 +0100
Message-ID: <f1161d5722b80b835fd92e0c96d28f7257d812a2.1739955023.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1739955023.git.yann.morin.1998@free.fr>
References: <cover.1739955023.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739955059; x=1740559859; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gUj1gcoY2cMKuDX3x9c0+5BntFAv59RPeflU2qNTDGQ=;
 b=K1WVDupUQwOsGpGNZ2PFwAm++WozULHgeRxVEMmAXPEIvl9Afsut3XnJOJskVcBbDo
 IqycepXhVVreBTvJQN3YtGSxz6nc9VWkd+7qO69l437ZB5Si3rRi17kQCbSlZNtFHcG1
 LjOZ0OJ6nAEWMhL83kVxutdhyD8l3sKqsSTPMMEu6RZ683aVJC7q4V+xuZ3O8AvRtUZC
 5GEZvcXI6FbiQcGTzoskfRuD55NUFoS85bq7O7fRj+K4YiMHnLpq3cKZ7Xr6/g6Ae0b0
 EkxiZHiMfzFTf3dswhgz63CMFQxBRuNxeXleSUY1NofDDX2qi7qCFDQEXYjnCcj2hLWx
 NlGQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=K1WVDupU
Subject: [Buildroot] [PATCH 24/27] package/sdcc: add option for the mcs51
 (aka 8051) port
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

Enabling a port enables the assembler for that port; the other utilities
(sdcpp, sdbinutils) are always built.

We make it so that at least one port is enabled, otherwise it does not
make much sense to enable sdcc [0]. Also, without any port enabled,
some parts of sdcc (e.g. sdld) get compiled at install time, which is
incorrect (but by luck just happens to use the proper tools and compile
flags).

The mcs51 port is the first one that will be needed (for fx2lafw in a
following commit). So we make that the default port to use if no other
is enabled (another port will be added soon, too, so we get ready for
that right now).

[0] there is one utility, packihx, that could be used without any port
enabled, but that was not deemed an interesting-enough use-case to
support.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sdcc/Config.in.host | 16 ++++++++++++++++
 package/sdcc/sdcc.mk        |  2 +-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/package/sdcc/Config.in.host b/package/sdcc/Config.in.host
index 52934aa150..1c851951b8 100644
--- a/package/sdcc/Config.in.host
+++ b/package/sdcc/Config.in.host
@@ -2,6 +2,7 @@ config BR2_PACKAGE_HOST_SDCC
 	bool "host sdcc"
 	select BR2_PACKAGE_HOST_BOOST
 	select BR2_PACKAGE_HOST_BOOST_GRAPH
+	select BR2_PACKAGE_HOST_SDCC_MCS51 if !BR2_PACKAGE_HOST_SDCC_HAS_PORT
 	help
 	  SDCC is a retargettable, optimizing Standard C (ANSI C89, ISO
 	  C99, ISO C11, ISO C23) compiler suite that targets the Intel
@@ -13,3 +14,18 @@ config BR2_PACKAGE_HOST_SDCC
 	  65C02.
 
 	  https://sdcc.sourceforge.net/
+
+if BR2_PACKAGE_HOST_SDCC
+
+comment "Ports"
+
+config BR2_PACKAGE_HOST_SDCC_HAS_PORT
+	bool
+
+config BR2_PACKAGE_HOST_SDCC_MCS51
+	bool "mcs51 (8051 et al.)"
+	help
+	  Add support for Intel MCS-51 based Microprocessors (8031,
+	  8032, 8051, 8052, etc.),
+
+endif
diff --git a/package/sdcc/sdcc.mk b/package/sdcc/sdcc.mk
index b2082c36bc..60ed688ce4 100644
--- a/package/sdcc/sdcc.mk
+++ b/package/sdcc/sdcc.mk
@@ -51,7 +51,7 @@ HOST_SDCC_CONF_OPTS += \
 	--disable-ez80_z80-port \
 	--disable-f8-port \
 	--disable-hc08-port \
-	--disable-mcs51-port \
+	$(if $(BR2_PACKAGE_HOST_SDCC_MCS51),--enable,--disable)-mcs51-port \
 	--disable-mos6502-port \
 	--disable-mos65c02-port \
 	--disable-pdk13-port \
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
