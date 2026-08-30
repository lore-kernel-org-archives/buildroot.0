Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEDE7C61DD9
	for <buildroot@archiver.kernel.org>; Sun, 30 Aug 2026 18:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58A2E80C8E;
	Sun, 30 Aug 2026 18:19:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ltp1-pN8Ahp; Sun, 30 Aug 2026 18:19:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788113972;
	bh=SZbc42xyk+SRoo1LMdgo5qzzcm6x2WMDjvaY5nh9HmY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b7575MBncTyuGjOO2HpcyJ+CQYijNrPr6PCaXpCIKSvrOBXWDlNIVzNAnvmozjNie
	 Yr315mdpLOeGfjTncjmMC9WaK+fBxj9eRZgfeleOJFGQQPNdTqHNP+UFHFYzi5mJa2
	 ty8sCZfnWRdbm4wDoDH537WQWtCLc3xUpriJbp6QD12h3purUNDNkNMmsWFZZCYiMf
	 8Q3T1ai5Vgmot+eV1XZiZqellG4fQ5akJTdErCSx9g5zJnd9Qx2ZM1qY33YyjPB8RY
	 emw8GnQyDyZn9cbGa7NzuAy0XM6fUm9MqcWe4isAli8wuLDQEFS96jhEJqUmmS8a2K
	 o+4Hie50xDUXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F75780C8F;
	Sun, 30 Aug 2026 18:19:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D84CBF2
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 18:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA86E605E5
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 18:19:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pPEhV8wHgo8I for <buildroot@buildroot.org>;
 Sun, 30 Aug 2026 18:19:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=eriVY+A8
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E29D9605DF
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 18:19:29 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-49b0d78a801so20749345e9.2
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 11:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788113967; x=1788718767; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=IOsnutDWsuejHpmkJTz4lx1T1XF+2RbZHARKaRK+4w0=;
 b=eriVY+A8+xwbLnF/eXbg+kz0eG7KbFDQtnEdbWV1Dh/GDerMBDkfVZjcqYeyZhWBD6
 jGLSOZ6ZG5f8O69U1JwH9BnXDsEY7HOGlmC0cfOODEJbt7/Q9NWwu/LX45MKqWaKLFEN
 9bCbx7g2knruGVgLnsFomEnEEhR0O7/gcE+/HRCdDXCbtQ/vZynjUT7lb0XwvR0eIsO5
 /8M7xdRnLr8hA/wNmJsUVQpMdBERjHNXKRDcDP3ZqSFenIOSVPaffZQzlXmUaRYrDQCi
 zpp5CrODPa8s1S1w5AMdQ1GhzZTTluEgClbnYk24is4ezKr04TDP2Tqj+vRXsl0huhze
 UdvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788113967; x=1788718767;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=IOsnutDWsuejHpmkJTz4lx1T1XF+2RbZHARKaRK+4w0=;
 b=cbS0WytCZsUC1ts1mtvsg52wPpdGAhdLMY4ZrX7PN4+li0WaZhOnKdAeP6nvbkFaTa
 jGcVX9iHCaLm4/oV0Eo8Gv53sJzo9in4M2WBh+tkPztLs6HEEaicmhk4JSejpo/iJDeE
 Vp93pv0t8k1DAImSUqUz1J1GwuukaaHnqrsAVbQRqZELloTi6WdUjuVHOsm/0YfJQkr+
 xNrS30jCZ9RD09YOCEk9UE9bldeqYbM+fVxL6Q6hXxyizZqpz50lEybRMK1hIpTUcxyw
 wS9H5INAlbla1dzDd+vZnM0STjyROPSB16XJxlId+Ul30AkmmCzBTXMOIuLnF7dwCA+5
 0geA==
X-Gm-Message-State: AFuF++nhDYZugJ+WGWcfXIqDPI/kGaYfWDvDlVryRITgKrT3OyRyS5ni
 NtX48zLFGWpH3dccgg8Lc1Q16o3JYHJSOr2ukBx54PF32PXbWH/LpsN/Z3FXrQ==
X-Gm-Gg: AR+sD13c2cnysh+yYvO2cngpXqBadu9gKkHQUKJJFuR2qx21DRES9cjPKtxcWq/9XGR
 OswdMLOVXf/4GCEMbbkQptOQQf3l2FIzTL399e54dQofn68jWQsX9khFX4e0W7IMMxnA+xTPheV
 Ot4qMcNvrzM0uv8gQzXojNUw9eDVkVV5+Fb9+HLXyTy/bXp8Le7b7Pdrj1HpHty4qcSVLP7LKVC
 mkL0O/NSaOhn1/ODS5tG1VL7oP3MFrFNRR6Kc3H/5ZQ/eFRMx0ZBRaRV8qYSlR2cU8wwvubqbZ0
 w8q1UAkOH/26cS5UUuBI2dHx+pqf908ZgFGiRe1sLFOkFmb3TQ7Vvd23O42wtVNJ+jEGdLW4I21
 VTqcUJMgQux36zrHSA9czEldxfjlULtxrmiPYXQ8u2yZaeNPrhE8dGKOTnwwgjvsPykyMUioySm
 nLycKV+SuQCAu5zDU/g3n353zMG5MOi6HHSjwThqoYnVA+vWPpOXii9WvfAXcr327gD0eDJh/Rx
 wEYrWVgoNJMe4wh
X-Received: by 2002:a05:600c:c490:b0:499:726a:a017 with SMTP id
 5b1f17b1804b1-49b91c17294mr323005105e9.1.1788113967259; 
 Sun, 30 Aug 2026 11:19:27 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482fbb284cbsm17390774f8f.30.2026.08.30.11.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Aug 2026 11:19:26 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Date: Sun, 30 Aug 2026 20:19:02 +0200
Message-ID: <20260830181907.106154-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260830181907.106154-1-alexander.sverdlin@gmail.com>
References: <20260830181907.106154-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] boot/syslinux: Don't delete host syslinux
 installer
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

With 6.04-pre2 the installer is being built properly with host
toolchain and can be successfully used to install BIOS bootloader
into the target image.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 ...ost-toolchain-for-syslinux-installer.patch | 48 +++++++++++++++++++
 boot/syslinux/syslinux.mk                     |  8 ----
 2 files changed, 48 insertions(+), 8 deletions(-)
 create mode 100644 boot/syslinux/0005-mtools-Use-the-host-toolchain-for-syslinux-installer.patch

diff --git a/boot/syslinux/0005-mtools-Use-the-host-toolchain-for-syslinux-installer.patch b/boot/syslinux/0005-mtools-Use-the-host-toolchain-for-syslinux-installer.patch
new file mode 100644
index 0000000000..3fe431ac37
--- /dev/null
+++ b/boot/syslinux/0005-mtools-Use-the-host-toolchain-for-syslinux-installer.patch
@@ -0,0 +1,48 @@
+From 3eb38370b831ede21ecb8cda7ed04b6123531df4 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Beno=C3=AEt=20Allard?= <benoit.allard@greenbone.net>
+Date: Thu, 6 Apr 2017 09:43:46 +0200
+Subject: [PATCH] mtools: Use the host toolchain for syslinux installer
+
+Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
+---
+ mtools/Makefile | 13 ++++++++-----
+ 1 file changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/mtools/Makefile b/mtools/Makefile
+index 632b185b..b67354d4 100755
+--- a/mtools/Makefile
++++ b/mtools/Makefile
+@@ -1,5 +1,8 @@
+ include $(MAKEDIR)/syslinux.mk
+ 
++CC_FOR_BUILD	?= $(CC)
++STRIP_FOR_BUILD	?= $(STRIP)
++
+ OPTFLAGS = -g -Os
+ INCLUDES = -I$(SRC) -I$(objdir) -I$(SRC)/../libfat -I$(SRC)/../libinstaller
+ CFLAGS	 = $(GCCWARN) -D_FILE_OFFSET_BITS=64 $(OPTFLAGS) $(INCLUDES)
+@@ -35,16 +38,16 @@ spotless: clean
+ installer: syslinux
+ 
+ syslinux: $(OBJS)
+-	$(CC) $(LDFLAGS) -o $@ $^
++	$(CC_FOR_BUILD) $(LDFLAGS) -o $@ $^
+ 
+ strip:
+-	$(STRIP) syslinux
++	$(STRIP_FOR_BUILD) syslinux
+ 
+ %.o: %.c
+-	$(CC) $(UMAKEDEPS) $(CFLAGS) -c -o $@ $<
++	$(CC_FOR_BUILD) $(UMAKEDEPS) $(CFLAGS) -c -o $@ $<
+ %.i: %.c
+-	$(CC) $(UMAKEDEPS) $(CFLAGS) -E -o $@ $<
++	$(CC_FOR_BUILD) $(UMAKEDEPS) $(CFLAGS) -E -o $@ $<
+ %.s: %.c
+-	$(CC) $(UMAKEDEPS) $(CFLAGS) -S -o $@ $<
++	$(CC_FOR_BUILD) $(UMAKEDEPS) $(CFLAGS) -S -o $@ $<
+ 
+ -include .*.d
+-- 
+2.31.1
+
diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 3d24869e59..ab531f69fd 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -98,14 +98,6 @@ define SYSLINUX_INSTALL_TARGET_CMDS
 		-C $(@D) $(SYSLINUX_TARGET) install
 endef
 
-# That 'syslinux' binary is an installer actually built for the target.
-# However, buildroot makes no usage of it, so better delete it than have it
-# installed at the wrong place
-define SYSLINUX_POST_INSTALL_CLEANUP
-	rm -rf $(HOST_DIR)/bin/syslinux
-endef
-SYSLINUX_POST_INSTALL_TARGET_HOOKS += SYSLINUX_POST_INSTALL_CLEANUP
-
 SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_ISOLINUX) += bios/core/isolinux.bin
 SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_PXELINUX) += bios/core/pxelinux.bin
 SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_LPXELINUX) += bios/core/lpxelinux.bin
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
