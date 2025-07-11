Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A923C83F1A
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 12:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C95E040968;
	Fri, 11 Jul 2025 12:06:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pEPD7oWaqgxS; Fri, 11 Jul 2025 12:06:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18B70409C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18B70409C4;
	Fri, 11 Jul 2025 12:06:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 53CE7114
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 12:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41FFC820A5
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 12:06:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n63K14sgrapW for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 12:06:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C0327820A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0327820A2
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C0327820A2
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 12:06:01 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-607ec30df2bso3988841a12.1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 05:06:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752235559; x=1752840359;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/bsNUAT0xCBj9jd6CyOgipp+iC5m/83mNuLu9R4dRPk=;
 b=qM2tpq0fMeQHWRG3rzkVuT/+gDjEntgzRkgcX+GXyYTKrxRCbFXnyJDrifrj6bWlcF
 OibmMQcBUV0uRza43oC2vdaqzm3FkrCwwDhoZtQDImUp7BSdm5W/mhMlU4U4B2fZM856
 2IHFTkVsrXuaLN5hDHyK5jZ0byLT8KCe/TZ7qJxQATu35HwYWGiPfh4kx3RE4BGhwWek
 X4/crfk2JCiuYFHHsAXRA/fmynwOgM4U6AZOSeTBca48WbqDXHX0UPcYkNuNJTjGuvlS
 sGrhSVLkEGFevAEI67/W/at8Z/SjLjn9aGVXXqsSOp3i1HxXz3641qxFma/yHmnjguwc
 h6Nw==
X-Gm-Message-State: AOJu0Yy8eG3FTAYkHJjMr26aNsShE7lXcBIAW0s2Q1DwIKJeR9ry7nX7
 DQfFH/GV80nfwEskVvoabedhC1Z10hRdROxEIjuTwL0YAWhvhvwNyyHk97HAhg==
X-Gm-Gg: ASbGncuUfE6ATzIkXYUzpiaUHH9ZsQcB7190/b+jyQ2dBFI5fAwpw6VskWnValUvFBx
 CM8n71SAPfaJealce4Qw7V0Te56g+9m7vXfvQFl10pEI/XMVHiZibc3upf3R7cydGJyQIdPRUhn
 JP9wDl0a9/0GoDjPvpBW5zPMFWb6Cjfiwx4oonRoQXT0Z3o96rey7ImhAv4XEiwRrWyZ8S4yp0l
 /GyNWyC0X5eyoeX+ScSODE4YBoacOUv1G0sZleiepydetlteCXZForkezy4jt6TRVSb7D6J7iQP
 v+8AmjgZwZ77VVUGPYq3DdMlPRRVC49gP+f8rWf9G4dV4aXNQCRGzU0PpKs3PQfKGQSRd89z2aF
 g55l9zkM6cVmDFZzT+9cqj/9nPVdPFUJbknwuwg==
X-Google-Smtp-Source: AGHT+IG0DDXm16lHBK+deOFReTojG/JD4i2CoiSusTJNeEHfMscO0BA5aV+mKAMrv5dHGZRoaqV9WQ==
X-Received: by 2002:a05:6402:1d4e:b0:607:5af9:19b6 with SMTP id
 4fb4d7f45d1cf-611e7c107efmr2330100a12.15.1752235558896; 
 Fri, 11 Jul 2025 05:05:58 -0700 (PDT)
Received: from hthiery.kontron.local ([77.21.162.101])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-611d50d6715sm1595944a12.6.2025.07.11.05.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 05:05:58 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 11 Jul 2025 14:05:44 +0200
Message-Id: <20250711120544.315926-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752235559; x=1752840359; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/bsNUAT0xCBj9jd6CyOgipp+iC5m/83mNuLu9R4dRPk=;
 b=C4MYpzk74DxZPNEgFL7eO11tmkjZN6sL4OlXmqvkJad59MQHbuDUiQ8FzgcfX2finH
 icZgL7BfBhxnq9W47APGzICVKJ1DyyLLHU72uyIAKBwyZJBoAAguyN9STCo2Jb4a03yf
 d2EpllbiJo4GpY9zY8ZPJ6v3W12xAE1XfVliJE8j4klQ9oTEIcjumJreY9ZVNLCy6y1t
 R8av5IxtbZUM5g3UI8WHiaoxGmdaj6u6URc8FoKKS25RKvP7Dgubd86R5OjXelrIJU7C
 H4DQEIE/T9R4v//uyTTQCTO9fu2yQOEGK9AfQVyFJpuJazaNJxpeJtj8tLElHldd+hDM
 tTdg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=C4MYpzk7
Subject: [Buildroot] [PATCH] package/linux-firmware: add option for
 Chips&Media Wave 521C
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Michael Walle <michael@walle.cc>,
 Bryan Brattlof <bb@ti.com>, Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add an option to install the firmware files for Chips&Media Wave 521C
video processor used in the TI K3 architecture.

This "cnm/wave521c_k3_codec_fw.bin" file has been present in linux-firmware
since version 20221109.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/linux-firmware/Config.in         | 6 ++++++
 package/linux-firmware/linux-firmware.mk | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 54910df6fd..778dfef8a0 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -33,6 +33,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_AMDGPU
 	help
 	  Firmware files for AMD GPU video cards.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_CNM_WAVE521C_K3_CODEC
+	bool "Chips&Media Wave 521C codec IP for K3"
+	help
+	  Firmware files for the Chips&Media Wave521C decoder
+	  needed by the Linux TI j721s2-wave521c driver.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_I915
 	bool "Intel i915 video card firmware"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index b9fd471e85..904c14ba10 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -25,6 +25,11 @@ LINUX_FIRMWARE_DIRS += amdgpu
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.amdgpu
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CNM_WAVE521C_K3_CODEC),y)
+LINUX_FIRMWARE_FILES += cnm/wave521c_k3_codec_fw.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.cnm
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_I915),y)
 LINUX_FIRMWARE_DIRS += i915
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.i915
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
