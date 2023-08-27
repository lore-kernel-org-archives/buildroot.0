Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B70EC83F18
	for <buildroot@archiver.kernel.org>; Sun, 27 Aug 2023 19:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3003A403FD;
	Sun, 27 Aug 2023 19:43:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3003A403FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zh2-UXkS5sPV; Sun, 27 Aug 2023 19:43:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8CA57400AC;
	Sun, 27 Aug 2023 19:43:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CA57400AC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C0A11BF2E4
 for <buildroot@lists.busybox.net>; Sun, 27 Aug 2023 19:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00EE6410D7
 for <buildroot@lists.busybox.net>; Sun, 27 Aug 2023 19:43:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00EE6410D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 51wfd82e2krD for <buildroot@lists.busybox.net>;
 Sun, 27 Aug 2023 19:42:59 +0000 (UTC)
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1E608409FD
 for <buildroot@buildroot.org>; Sun, 27 Aug 2023 19:42:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E608409FD
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-79268f36c49so92893939f.2
 for <buildroot@buildroot.org>; Sun, 27 Aug 2023 12:42:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693165378; x=1693770178;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=665yElq2X7GmlWUvHLdSDIZPdCiFSxhVpXuvfez+7is=;
 b=e+w0SGiOv4A8l6B01UrBIaK0zYNGotYp0xMnNS31Aq1t7DEPjsMrdwnnFqudBWO3kK
 onJNXrrpwM8PYSqL9DWWY17hppk0JJdxtVRAeOllh6FANIvGTyOnQgbJq0rHbyoFuDkg
 prOCz6WtO/jGLq60sOP5yWxILqSXoMJSOZ6Hw6vBh1jEJtxQQyb+CSrcvGCsJuoNZ9qW
 Rzs8L3d28E6xEcom9KCj59jNV96BE1H91wnX/YcD6dxy8UktQt+m9G2eDoXSZMK8HcVQ
 cO1wt6qFCTZ5LpQBmjEnSly08SohEXhpw5e3K2Eypus33i5I2tAUWOyvYyKbr64FN7iF
 nVJA==
X-Gm-Message-State: AOJu0YzR1o2jagBE1idfKbMYNZ2z5lEbOAQ7ut9CbuvhpR8kwBCJR1kS
 Em84IeNuZY9jVIO27LqYRcqxBWZyKIQ=
X-Google-Smtp-Source: AGHT+IEU24CFBF71oOxJv47GHPlvDN2hhYo7fN+XcSUMOSJNbJy8H+eRKX7njixxwyfwBDyPUWpXIA==
X-Received: by 2002:a6b:4404:0:b0:792:bbd:6caf with SMTP id
 r4-20020a6b4404000000b007920bbd6cafmr15787896ioa.12.1693165377816; 
 Sun, 27 Aug 2023 12:42:57 -0700 (PDT)
Received: from james-x399.localdomain (97-118-146-15.hlrn.qwest.net.
 [97.118.146.15]) by smtp.gmail.com with ESMTPSA id
 w8-20020a029688000000b0042b69cca627sm1939287jai.137.2023.08.27.12.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Aug 2023 12:42:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Aug 2023 13:42:54 -0600
Message-Id: <20230827194254.3475756-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693165378; x=1693770178;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=665yElq2X7GmlWUvHLdSDIZPdCiFSxhVpXuvfez+7is=;
 b=fABq+3BxPsKpQrjtj0QB8tqJB4x8nxkeR9o6Vu6sURWkW08lT+XAHgaflWAlE/NwiX
 /OOKhoWHfFeoZA81eML1j1JfOCVPHEBMMZ4ayF0NMyxh/kfF5E+dURMCNzH+h6o72NEV
 hB73HAJRHll5t4s4RNEwO54oYLWoenq2LeL8/2fQKr9Bu1k++38LEXZExgmQO0OyoPLt
 q9EaVxmc2O0Nk0sjbAPi5lsJNWCPuZ3CGAcEoSHbY3yIWqpy0kQdOfj9y7HOoFbYiwCj
 ENFNfk/d6Md82aeQ7vqc5Rf33IAyUHVlCV04Xbuy9qvMIttqyB8p75Vn7nqnIu8qVWqw
 J/AQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=fABq+3Bx
Subject: [Buildroot] [PATCH 1/1] package/qemu: add pipewire support
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
Cc: Romain Naour <romain.naour@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add optional pipewire support introduced in qemu 8.1.0.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/qemu/qemu.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 84166958bb..8379f32bf4 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -234,6 +234,13 @@ else
 QEMU_OPTS += --disable-numa
 endif
 
+ifeq ($(BR2_PACKAGE_PIPEWIRE),y)
+QEMU_OPTS += --enable-pipewire
+QEMU_DEPENDENCIES += pipewire
+else
+QEMU_OPTS += --disable-pipewire
+endif
+
 ifeq ($(BR2_PACKAGE_SPICE),y)
 QEMU_OPTS += --enable-spice
 QEMU_DEPENDENCIES += spice
@@ -476,6 +483,7 @@ define HOST_QEMU_CONFIGURE_CMDS
 		--disable-netmap \
 		--disable-oss \
 		--disable-pa \
+		--disable-pipewire \
 		--disable-sdl \
 		--disable-selinux \
 		--disable-vde \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
