Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5BE8CAC59A
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 08:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C7A040DB2;
	Fri, 19 Sep 2025 08:10:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id chzMTI8GBH8i; Fri, 19 Sep 2025 08:10:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9283240CAA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9283240CAA;
	Fri, 19 Sep 2025 08:10:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D53F273
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 08:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A52C60F74
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 08:10:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fzQlQiSytBzx for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 08:10:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8764F60D7A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8764F60D7A
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8764F60D7A
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 08:10:39 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-b5516255bedso577802a12.3
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 01:10:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758269438; x=1758874238;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=80xVguMtHU2x+THX2ZgLfOmE1vqFLUjrigsnNZV/VYw=;
 b=rk27jtWOZn1sRBIUNOzZ1hAFiY6/5v5dR3XxXR41c6qVB20UxvpeuYVgyv6FB5tlQ1
 H4EZ0QT3wpquNog0JNuahkwYGdViw9y28Wb2/wyKYB7/VHvpFghaplRsFyGzTSXDWCLN
 ZhBbRwh1vRFq6Yiy8cE7o8f5pqyrLOq+WOp/BcU5WNiUqS9dFxp0WOjxZvQr2OAIIdCx
 2uDJVv7I0SinuTJBQ6uiYXz6/YCQ13i+zZD283LW+S5/jrqkEyTQw9OKabe3t4gcQIpl
 8kRjmAzuaiGzJdM3CdiiurhAliYI+evAjol96meuuKIr5TcfgU477sPdBbJWpDnFOUC0
 JG+Q==
X-Gm-Message-State: AOJu0YwWOWf68JsAThel2q7pHWkxsuZdbCUDTcc8Q2Z+W0Svu81O+sSM
 9bPIY687PlDNlzAiXfLBNssE/gty9RgnJdzdzfYw94J43G/pWJAyqYa69c3Uhw==
X-Gm-Gg: ASbGnctoGMCSoGeyqoaL553h0jLhVZhxHSJhz31yHxd7hLaAK/C0V8+LCp2kKteZDdE
 TG6r7k4URNQ7xiwQijjQdOhq/+6BcTlEbvKwDIeiD/I79P7NrEGuAOrBT4PR5ynx2X8hWdAEITQ
 Uiq+Kjc6LhIRkK1Ct1OOUUfWPCHiDBk8AI6ex643qXG7HoAmk6/jcDrrasbXopnLFVtWpG6voJ9
 wAGlZmK35KaBAljAuOIGXn2KJ53OoC9IdRyrO2LgsOquSyvwV3HkUevMyzNoL60cvjvYpl/OriH
 dDUOr2EMBpxx0DHYxdrrJb6PC2ftx35qutzI5tNZaz5Gazd0g/d2bXJrDIPH6TEcKP7XTzPX3Ue
 p9iA22SO4Y6maH+f+5eU=
X-Google-Smtp-Source: AGHT+IFX5d0G/oh+8Y3nyVksMCB835+/eQTRU87Tqa7w1vIjxkcK3LoD2idTpHcQs550YD9AYsQfRA==
X-Received: by 2002:a05:6a20:e212:b0:254:b352:6479 with SMTP id
 adf61e73a8af0-2926e37bea9mr3811976637.32.1758269438217; 
 Fri, 19 Sep 2025 01:10:38 -0700 (PDT)
Received: from localhost ([66.112.214.180])
 by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-33047220cfesm3419397a91.2.2025.09.19.01.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 01:10:37 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
	Romain Naour <romain.naour@gmail.com>
Date: Fri, 19 Sep 2025 16:10:31 +0800
Message-ID: <20250919081032.1132163-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758269438; x=1758874238; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=80xVguMtHU2x+THX2ZgLfOmE1vqFLUjrigsnNZV/VYw=;
 b=GX1KpwKH3WTtV0XsckC7df4vhQKbmd8KT+dRZar3vomwb0er6joIHoa8GUBKJJ6d8P
 7oi2v+nvU0VSKWa6sTwSwQ4ednclVs1Cxx6esrorPUqOg6JZniAcg6mvW504mtXfKN9p
 ljQeGFji0IqIIE1x673JArn9t/gSu8B5PiLwYJBHKcaCE8Alqf1mkduulRSMnHz+Y12u
 SVbQ2fXO078h0Iq5zRQWIBpwEQY5XO5aZldWU/4yg2rGtdwz03JW+tFE2kda4wQ5zdAN
 NYa9iqXkKyLHWmtwHxMo2x9LUUq7EKOY8nQ7/csDRw5BuetyiEk8ZdmeGzWbNNY1ud03
 A0tw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GX1KpwKH
Subject: [Buildroot] [PATCH] package/qemu: bump to version 10.1.0
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

Changes log:
https://wiki.qemu.org/ChangeLog/10.1

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/qemu/qemu.hash | 2 +-
 package/qemu/qemu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index a8b7d688e8..876d34a638 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,4 +1,4 @@
 # Locally computed, tarball verified with GPG signature
-sha256  22c075601fdcf8c7b2671a839ebdcef1d4f2973eb6735254fd2e1bd0f30b3896  qemu-10.0.0.tar.xz
+sha256  e0517349b50ca73ebec2fa85b06050d5c463ca65c738833bd8fc1f15f180be51  qemu-10.1.0.tar.xz
 sha256  6f04ae8364d0079a192b14635f4b1da294ce18724c034c39a6a41d1b09df6100  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index fdc8591e54..0d1d154371 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, check whether the list of supported targets
 # needs to be updated.
-QEMU_VERSION = 10.0.0
+QEMU_VERSION = 10.1.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = https://download.qemu.org
 QEMU_SELINUX_MODULES = qemu virt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
