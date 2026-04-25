Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC16FF8850
	for <buildroot@archiver.kernel.org>; Sat, 25 Apr 2026 00:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B2F840C69;
	Sat, 25 Apr 2026 00:03:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QpxDL-2zFyWb; Sat, 25 Apr 2026 00:03:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1295740C6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777075393;
	bh=/ZFJolW7ve4LZt2SkhagyBKdX/+00imYg0UNkn1kFC4=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cRaxYYyTvCXPI/RoCgDDjtGYtEsbmTnFi9TNgxfaZCoYB2IwdqhIuGa8EtANUjBp6
	 jK/XpQcW2ctVVRHuBPLkr2w+bI9rMcTS6cNAW54hQgxsSRnPgs3DuIL7eR10Pqil0T
	 rrb7kXlssgUFsqIPCBATbNvzxkul4AY9j1kgZcNLg1unilVVheyXK9goVJ+YiYy6BM
	 O3ZNM9AtDYEU3oOlfGQ/pGQyebOYePEFhBmqDw//1Lz1HeNh+sFoL6KBDP6XZbxwmT
	 t45hqg5l5WwDjl1z78x29/8s5SO10ZrBBN7muiMkUxt1F9es7Dq5FLgw6XfQrVnVc4
	 L0Dbyn6lLsp5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1295740C6A;
	Sat, 25 Apr 2026 00:03:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E32C231
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 00:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E88B08142B
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 00:03:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jKYb62Izg6cr for <buildroot@buildroot.org>;
 Sat, 25 Apr 2026 00:03:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com;
 envelope-from=joseph@anodize.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D8A7681425
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8A7681425
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D8A7681425
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 00:03:09 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-83178c0f29cso1557831b3a.0
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 17:03:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777075389; x=1777680189;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=udiL2kdxpIL9kyH0Rf/QMYlxmw5uIjmc953Ys1AeBf8=;
 b=LdtI6zRdCLNT6MQpnO3VwwiBbT9arcZa5sfODr/1PPiyjPZ2dF2ipiRFPpdOpdOd7z
 VXAsBtgiAQNsC1vPZ50Y2cgxIUrS7p0eyTepbu8/ygJ36v1dpQKiIBJ9ORQU7myCrrIS
 YOaj0Ug05Z3Wbw8Trs1Wb5wrnC9qr9YyroyEm0wMNrfQy7hWqIyKpgQ9GTrKY/SlOlHr
 PWmX2COdmGdwaAYIJQSbR6ocmWX4U6CSQ4Nuwr2x6bvIQY++4meeA+cS1HdjUaMUxQhr
 ZZZ/hsRE0P+T6MHSU7pWQ569A5wykNVZfHZDPXBhFx0qSGizusYtAy0+JI4TzTVpOhnj
 OVPg==
X-Gm-Message-State: AOJu0YyJ23862jGfJBIq6ePet0NFESMq7lLuB/f+5nsQ4yEtlDUxpKaN
 wNSKi4Y8+fUpXC5DnsJgbkQee1yuCe2Fd7po9u5VMOLyOcKdhw1G0CuJopood04+Z3Y=
X-Gm-Gg: AeBDieuyiNVMRMtYoJAq5oUmvwo4oIbIEzUkq+eSH+YJM36WtEkBMscWndshS8gPLA+
 X2pnsqn/vS7W4AsZzYy6x8WQXIma+HBIATQn23SOukpxmrAGrc/RQkubO2kTqFtU5mRCYLL1Xeu
 RjvDZR3AQvdqjZeGSpLAxyu8ovbob/GK6/a1JRQqWClzrUdvV52sGfn5e56sDmJH4mxeC5ICUv8
 JRyXILvm4zacBzm+zdTij2sB2E1FIMqfRDG5m7Yx73sKfbVEFqJCyKungNIr9tySz1b4DZAlJxu
 REPWRpmi5UTGZ9dI0yB4scIa9Hu+icURgYMY4wmnyOIkr09sTnq92jz5Sxi8U+soghBF++bfzvr
 6Fddo4KUVFLrf4bfulpmh6LFmKAfEnQXztLsNWyJIpS+Yf3Tkn5MuqmF+rMWM2+9391zOoFuDpP
 VBLAe0SM9U6RE9oisVYFN6M+i3tpK7huk=
X-Received: by 2002:a05:6a00:928b:b0:82f:6dad:7b75 with SMTP id
 d2e1a72fcca58-82f8c8ebc91mr38072524b3a.33.1777075388917; 
 Fri, 24 Apr 2026 17:03:08 -0700 (PDT)
Received: from wash-5.local ([50.120.91.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82f94204ac8sm23691854b3a.0.2026.04.24.17.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2026 17:03:07 -0700 (PDT)
From: Joseph Kogut <joseph@anodize.com>
Date: Fri, 24 Apr 2026 17:03:00 -0700
MIME-Version: 1.0
Message-Id: <20260424-qemu-v11-0-0-v1-1-b5a579386fde@anodize.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM2wrCMBBEf6XsswtJlHj5FfEhSTd2hUbdbYtQ+
 u8myjydYeasoCRMCpduBaGFlZ+lgt11kIZQ7oTcVwZnnDcHt8c3jTMu1qKp8fGUj+fUZ28N1Mt
 LKPPnp7ve/qxzfFCamqMtYlDCKKGkoVVj0IkEtu0LHqtw0okAAAA=
X-Change-ID: 20260423-qemu-v11-0-0-6b8f79cdf610
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>, joseph.kogut@gmail.com, 
 Joseph Kogut <joseph@anodize.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777075387; l=2625;
 i=joseph@anodize.com; s=20251022; h=from:subject:message-id;
 bh=8D0wTAnqKyLUlCAtdiievHElCbM4s+DtcG/6tnrsnp4=;
 b=OqWspLc85SaMLcUyWcAiuj/Sixs7yXntgQ2TUaPHMqz5a9nIyk0NwSbNTj9punm8iuVnnVd+D
 wCuz3NU6QcKAY//6+n24ZmmlKqLZb6Y6qSeG0Bj5qp9BgBsoPGNmOZu
X-Developer-Key: i=joseph@anodize.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anodize.com; s=google; t=1777075389; x=1777680189; darn=buildroot.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=udiL2kdxpIL9kyH0Rf/QMYlxmw5uIjmc953Ys1AeBf8=;
 b=gfJsDcShLgecj6E6vZxVhuB4ab06Vk1WRImAAzEmiHO6TLyi1WJCFp7iErPXqFf/Pn
 w6R6m+4lukJrLcd0GE/LVoDIuXyRyrLTSZkP4vCET/OqxyAStZiDTzV/ATONUYu3WHvN
 iNzKlRm6uaKze7HW4VoUKFXmrWZciO3G3JOCe3xjtv+mWyEzb4PuK8XCbeSPoJ5PDVlw
 bhjrkb6m70vueMOZrJstFzMaZb9jhmMAxrKVBN/HuuyhaivxNlGSHD900aEPY4QNFlk8
 YxEanLpZCEHwrAza+PQpMmr1D/LpDR3aZAL3RHHJ4CAGU0IuBtqVp58hUurlxjn/3Y2h
 PCGQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=anodize.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=anodize.com header.i=@anodize.com header.a=rsa-sha256
 header.s=google header.b=gfJsDcSh
Subject: [Buildroot] [PATCH] package/qemu: bump to version 11.0.0
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

Changelog:
https://wiki.qemu.org/ChangeLog/11.0

Note:
  Support for all 32-bit host systems has been removed.

Signed-off-by: Joseph Kogut <joseph@anodize.com>
---
Build tested against all toolchains using test-pkg.

  32 builds, 23 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

Notably, this version of qemu brings upstream support for host native
context, which also requires the virglrenderer patch series [0].

[0] https://lore.kernel.org/buildroot/20260318-virglrenderer-v5-0-09a3274852d6@gmail.com/

This feature enables virtualized guests to run applications with
hardware accelerated graphics and compute, using the native Mesa driver
inside the guest.
---
 package/qemu/Config.in | 5 +----
 package/qemu/qemu.hash | 2 +-
 package/qemu/qemu.mk   | 2 +-
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 0b16c8c284..c735381b4b 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -1,11 +1,8 @@
 config BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
 	bool
 	# Only tested on these architectures
+	default n if !BR2_ARCH_IS_64
 	default y if BR2_aarch64
-	default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5
-	default y if BR2_i386
-	default y if BR2_mips
-	default y if BR2_mipsel
 	default y if BR2_powerpc64
 	default y if BR2_powerpc64le
 	default y if BR2_riscv
diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index f8e750225f..7c7325a6ce 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,4 +1,4 @@
 # Locally computed, tarball verified with GPG signature
-sha256  9e30ad1b8b9f7b4463001582d1ab297f39cfccea5d08540c0ca6d6672785883a  qemu-10.2.0.tar.xz
+sha256  c04ca36012653f32d11c674d370cf52a710e7d3f18c2d8b63e4932052a4854d6  qemu-11.0.0.tar.xz
 sha256  dd3ce02338c3a48abb6ba59b48809f7108a8bd242cb0cc8be90daafa30707c28  COPYING
 sha256  31c90ce76b6f5aab90a205851e71d5c27e31c0aa3d7017a4383b98a6fe3f1faa  COPYING.LIB
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index b7007e3b98..61e44f069a 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, check whether the list of supported targets
 # needs to be updated.
-QEMU_VERSION = 10.2.0
+QEMU_VERSION = 11.0.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = https://download.qemu.org
 QEMU_SELINUX_MODULES = qemu virt

---
base-commit: 6b1de564d07ee79c7fce9674801481c33627e03b
change-id: 20260423-qemu-v11-0-0-6b8f79cdf610

Best regards,
--  
Joseph Kogut <joseph@anodize.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
