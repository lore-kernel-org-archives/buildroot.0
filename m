Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253E4C4829A
	for <buildroot@archiver.kernel.org>; Wed, 14 Feb 2024 07:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6458405CE;
	Wed, 14 Feb 2024 07:54:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JzRYnOtixm6h; Wed, 14 Feb 2024 07:54:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 959D440552
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 959D440552;
	Wed, 14 Feb 2024 07:54:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C57BB1BF364
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 07:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF437819E6
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 07:54:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aaB9DRRJRQ6P for <buildroot@lists.busybox.net>;
 Wed, 14 Feb 2024 07:54:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.devoogdt@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7E3B081886
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E3B081886
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E3B081886
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 07:54:51 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-410ca9e851bso22331395e9.3
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 23:54:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707897288; x=1708502088;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iGtE5RaTUIvKRIR09rcQ4rmBGR4aHMeJQlXLD66+oXk=;
 b=IviytxnrsuXn3LEOtlexxEKYHxfcw8viCrd0VsTt44OYkfOWNR7L5CLcnJ+Q8JQhME
 PrLpbk2WLpNR1sGhbUkoTNbX2CUkzDm6dIB8YJUlxN4KZc7xRwVh6Xx3s6nk8puHPoEg
 IwlB+w3/m0Ic6VY20Oe06lJjywuoswG/XZT9voqLpodWJnI+54LDljCAZ3/UP3tH2Qx8
 lq58kpOyjCD0haolgPZ+EieQJ0oTtk63O49728J8RbAb7Pt1oiEmgDJRcsiNu+0yMzxv
 uEYlJyCKW2BhIQuzb47uV+GEZpr0dFSdwFDaGUjht7i01pkRbmuzXmNCtrZu+DhP+Ze7
 Yffg==
X-Gm-Message-State: AOJu0Yx6TLlw1oN7Zqx1/Gt0astzVQHY8K4baMqbCQhoDhT7DbXiKFo6
 g/FnMZwUZMvozGaDWOCwF7Njj7na9hy/h9DXB9q+R5YOObfLyZPpJtU5A0Z0
X-Google-Smtp-Source: AGHT+IEO90+BF+0G/T4vhI6r3CFecM+xn+eoMM0NJPy5gXZ/mC/hWpui8noYVWlmp45pwuFOLeu5hA==
X-Received: by 2002:a05:600c:190c:b0:410:72e0:d391 with SMTP id
 j12-20020a05600c190c00b0041072e0d391mr1281155wmq.6.1707897288187; 
 Tue, 13 Feb 2024 23:54:48 -0800 (PST)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 j12-20020a05600c190c00b00410bca333b7sm1105196wmq.27.2024.02.13.23.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 23:54:47 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Wed, 14 Feb 2024 08:54:45 +0100
Message-ID: <20240214075445.1011185-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707897288; x=1708502088; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=iGtE5RaTUIvKRIR09rcQ4rmBGR4aHMeJQlXLD66+oXk=;
 b=c0VuCwjERXwkZKY33yRJI1/ZGAO3qvJFAHZwzVdUFmGRFjc4PaUGZZsWQyS5NJfz6z
 XzHtKuPsKYcWDiPqCHSu3pbDATRc7yrnuOS+dB6cGEM1GcaHXg0osWJIxJ9c4Nl82PZa
 /EH9j/94dk89HWA1C0ncuaG2yXmddAXJwpIwhfHRvMxj+jADsqw2yM8RlcRbzYYWc16+
 4gooVfg8ETmKUW/HufL3cimae6pp+zhXSppFyl/X9FmB5clLlozt2XMohSXLVuEL0w7W
 tekRFrXAZZNgdVGcJanTtMm29MU6nSgu6U4MJ0rw3X8+j8JyamltTCwXXA4Ad7ksRteM
 gOTQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=c0VuCwjE
Subject: [Buildroot] [PATCH v1] package/weston: bump to 13.0.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Announce:
  https://lists.freedesktop.org/archives/wayland-devel/2023-November/043326.html

Drop -Dlauncher-libseat=true, as it has been dropped upstream:
  https://gitlab.freedesktop.org/wayland/weston/-/commit/e3b6ed50f1c3c259c51274c78d08b58ccea8a0df

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/weston/weston.hash | 6 +++---
 package/weston/weston.mk   | 3 +--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/weston/weston.hash b/package/weston/weston.hash
index 0ecbaa4168..ded5d35275 100644
--- a/package/weston/weston.hash
+++ b/package/weston/weston.hash
@@ -1,4 +1,4 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2023-May/042725.html
-sha256  b18591eab278bc191720f6c09158040b795e7118af1d5ddca6acd9a8e2039535  weston-12.0.1.tar.xz
-sha512  3dcfa1a2a6b9a605d3ecd597bf7ac0f87b0fd1971845b6e5c44b5e34296943ac146dae6e1cfea9be14ad7a9a8b6d30dc765f9289ef80920d7c516ebba1ba4688  weston-12.0.1.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2023-November/043326.html
+sha256  52ff1d4aa2394a2e416c85a338b627ce97fa71d43eb762fd4aaf145d36fc795a  weston-13.0.0.tar.xz
+sha512  8c656cdf24ec9429c76c64ebd2d58351991f5990a6d4b5900ac913243ad8e2c9c0fb1a748f018d177fbfd7e0a8836d0434d97acec287a8f977d47335ae30eacc  weston-13.0.0.tar.xz
 sha256  fdb65868f65d0fbdb05c2d3b779e10ce9969fa0c4b9262ba4f260e87086ab860  COPYING
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index b07e798765..5ae9c22973 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WESTON_VERSION = 12.0.1
+WESTON_VERSION = 13.0.0
 WESTON_SITE = https://gitlab.freedesktop.org/wayland/weston/-/releases/$(WESTON_VERSION)/downloads
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
@@ -19,7 +19,6 @@ WESTON_CONF_OPTS = \
 	-Ddoc=false \
 	-Dremoting=false \
 	-Dbackend-vnc=false \
-	-Dlauncher-libseat=true \
 	-Dtools=calibrator,debug,info,terminal,touch-calibrator
 
 ifeq ($(BR2_PACKAGE_WESTON_SIMPLE_CLIENTS),y)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
