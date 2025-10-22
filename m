Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C5ACCD1BC
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 00:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0C1160DD5;
	Wed, 22 Oct 2025 00:07:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pw9lCzsHZDWy; Wed, 22 Oct 2025 00:07:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D362260DD7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D362260DD7;
	Wed, 22 Oct 2025 00:07:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 540AD70A
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 00:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5178560DD7
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 00:07:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u1Kb23XxrAox for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 00:07:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 71D3660DD5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71D3660DD5
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 71D3660DD5
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 00:07:36 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-b633b54d05dso4282580a12.2
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 17:07:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761091655; x=1761696455;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SDF/vZfkCZWgCffQjwjMhWQqRdJLyKGCydse/r5RdXc=;
 b=cOGk/qmTb05HXgarzJJv+T9JrvL7Hb7sGSPodin6U+7URpXwNN8Floh3pAe7LcypkJ
 F1F/Ht4I6eR4eFR5MsuRumpmsc8PG8+/kKzl9s013zd/7zDYQfvGRiCOTW3UdmnAVp4K
 /okUya50sStIK5eRCj4YX5Jua8TBdjUmrqoedUA4XcmGFtX7VbLtZhRNJxzz15qXHnUE
 9yjimXPWZMk1LzVkkTf+ZkKldX9pngyKMx/Ap/77VF/J9qhYUAanFiz9zMzl8+pZ6/wQ
 36FsYcgDIZ8CHSewWX2lgoutkxrFCwppSFvvkGO6Sk+G2gWW/dq8w+Y6+/fk+VqFqoQQ
 0dzA==
X-Gm-Message-State: AOJu0Yy12/KPVkAKDFZhiKkYLI4jhldzrlpF+O/+4VDUXLoQFyu4YLCr
 /oAaZHGcOsV8Ay7pw/lN0ikNblhBcG4LvaU67sWYNMH2rCeieiB4GxKs
X-Gm-Gg: ASbGncvRX0C+RFSoetHt8Jj6ricvuMQSWz+i+SbigZ1IWkY0/c1ZsfylHaVVaVuO1+r
 kp8FFxnZz+YFhYmfyomS/WWa6kyfc3/zaMDFGmuMA9AWJK0QgH62tFAjz6t0GYP/DsIHNE/o4b7
 Bn6toBLyK8XPCksQ/Q8dLil+BAbdHWqsTNcPc25iIRywRU0gRc5YPuFQMieTtHi1nd+GjHRDNav
 hWWm8bFdmTtPd2tlAo/0xr6LpZlUpWnJmh/00aFmx+Qv230Kan5msNGL0jrzwxwu7yDgZTdlgTo
 j8d+fJczCvmexzyRtqjLpVILQ7s+f31KDyGxG3udjDg8ccMC/TsnVoXcWhUhTWm+eZrTQdHphf4
 NlYvrknTf3cM9ymmi487pe+kZ645wOAKyGm7x3+PR4AlGRSt9MVERNIcUMFMjGIFSSw1urc0MwW
 kd
X-Google-Smtp-Source: AGHT+IFl4hEe87/GaPjmMPAa641D+YRYgAj6WwZFiqJhKzWaWt++lyVh41KAxcd9VcioJGzV+S7AOQ==
X-Received: by 2002:a17:903:46c8:b0:24b:1589:5054 with SMTP id
 d9443c01a7336-290c9cc3da9mr210572285ad.23.1761091655279; 
 Tue, 21 Oct 2025 17:07:35 -0700 (PDT)
Received: from wash.local ([50.46.184.91]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2924721b6cfsm121350075ad.107.2025.10.21.17.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 17:07:34 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Tue, 21 Oct 2025 17:07:33 -0700
MIME-Version: 1.0
Message-Id: <20251021-virglrenderer-v2-v2-2-d3ea6ff07489@gmail.com>
References: <20251021-virglrenderer-v2-v2-0-d3ea6ff07489@gmail.com>
In-Reply-To: <20251021-virglrenderer-v2-v2-0-d3ea6ff07489@gmail.com>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Romain Naour <romain.naour@gmail.com>, 
 Steve deRosier <derosier@cal-sierra.com>, Adam Ford <aford173@gmail.com>, 
 Joseph Kogut <joseph.kogut@gmail.com>
X-Mailer: b4 0.14.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761091655; x=1761696455; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SDF/vZfkCZWgCffQjwjMhWQqRdJLyKGCydse/r5RdXc=;
 b=hl3pCc9r66v+8ioFrZYTAVQg3SP7NHkNsFCf2RJdLdLvUZSs/fwQfJflhyTJjMjArC
 iqvexKJKPzf9FYKU75lZk/ZMf1GERPY7bnvLHhVhuWV4fehdjUfRqwKqQOyRCcuNF+yP
 lzfnMILuKaAd87WRQAUKhvw7rZWrv+0mvgbijyuptNy3ztbKdpv8R4zBZwJK0zhKjht0
 WMSbaO7uG3C8kHVA5RJ70TXWm05X+2nmMNgJqeVD8neJ1fTj0/i1ZA1YnBFoUwyIWoax
 eHpOov3y0CFi3f/jp+SX32w9JbCFgTdQ7IKheJxJWMblSO/GcQRpZpDZ0XKOAlvPyrKx
 zWjw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hl3pCc9r
Subject: [Buildroot] [PATCH v2 2/2] package/qemu: add virglrenderer support
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

Add optional virglrenderer support, along with enabling OpenGL when
necessary.

https://www.qemu.org/docs/master/system/devices/virtio-gpu.html#virtio-gpu-virglrenderer

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/qemu/Config.in | 27 +++++++++++++++++++++++++++
 package/qemu/qemu.mk   | 15 ++++++++++++++-
 2 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index ff7423bc4c..e86dcf57db 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -100,6 +100,33 @@ config BR2_PACKAGE_QEMU_SDL
 	  Say 'y' to enable the SDL frontend, that is, a graphical
 	  window presenting the VM's display.
 
+comment "OpenGL and virglrenderer need an OpenGL and/or OpenGL EGL backend"
+	depends on !(BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
+
+config BR2_PACKAGE_QEMU_OPENGL
+	bool "Enable OpenGL"
+	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL # libepoxy
+	help
+	  Say 'y' to enable OpenGL accelerated display frontend support.
+	  This is necessary to efficiently display frames rendered in a
+	  guest on the host.
+
+	  Run qemu with `-display sdl,gl=on`
+
+config BR2_PACKAGE_QEMU_VIRGLRENDERER
+	bool "Enable virglrenderer"
+	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL # virglrenderer
+	select BR2_PACKAGE_OPENGL
+	select BR2_PACKAGE_VIRGLRENDERER
+	help
+	  Say 'y' to enable virglrenderer, enabling GL and Vulkan
+	  passthrough from the host to the guest through virtio-gpu.
+	  This enables the guest to have accelerated GL and/or Vulkan.
+
+	  Run qemu with `-device virtio-gpu-gl`
+
+	  https://www.qemu.org/docs/master/system/devices/virtio-gpu.html#virtio-gpu-virglrenderer
+
 config BR2_PACKAGE_QEMU_FDT
 	bool "Enable FDT"
 	select BR2_PACKAGE_DTC
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index fdc8591e54..05267de5e7 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -261,6 +261,20 @@ else
 QEMU_OPTS += --disable-usb-redir
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_OPENGL),y)
+QEMU_OPTS += --enable-opengl
+QEMU_DEPENDENCIES += libepoxy
+else
+QEMU_OPTS += --disable-opengl
+endif
+
+ifeq ($(BR2_PACKAGE_QEMU_VIRGLRENDERER),y)
+QEMU_OPTS += --enable-virglrenderer
+QEMU_DEPENDENCIES += virglrenderer
+else
+QEMU_OPTS += --disable-virglrenderer
+endif
+
 ifeq ($(BR2_STATIC_LIBS),y)
 QEMU_OPTS += --static
 endif
@@ -310,7 +324,6 @@ define QEMU_CONFIGURE_CMDS
 			--disable-membarrier \
 			--disable-mpath \
 			--disable-netmap \
-			--disable-opengl \
 			--disable-oss \
 			--disable-pa \
 			--disable-plugins \

-- 
2.51.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
