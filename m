Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D16CC7EE30
	for <buildroot@archiver.kernel.org>; Mon, 27 Feb 2023 10:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0717A414FA;
	Mon, 27 Feb 2023 10:59:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0717A414FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bo4tuunFPhOt; Mon, 27 Feb 2023 10:59:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADB8541607;
	Mon, 27 Feb 2023 10:59:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADB8541607
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 704251BF25F
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 10:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A105410D3
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 10:58:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A105410D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SQl-UEbhssfS for <buildroot@lists.busybox.net>;
 Mon, 27 Feb 2023 10:58:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E41BD408C9
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E41BD408C9
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 10:58:56 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id q16so5752375wrw.2
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 02:58:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5O1x8TJex/u2xPPHJw+D2nO+ELwyMaeFoEkgly3I8tA=;
 b=L0qw9JUSD/BzAWknjU7DpzVpthFTZ3VjHiwS0AWbS6b+SQe8bUdKwOpK7+PotoF/Hl
 /RQz8oPJBZObIp1qLLNm8/j6T08aL08v2NwTmS6HAgJPTMp6WJkfJmCW0WEUswqrR+a+
 dYCHCK557Htv6G2Sp06K2zNY3FPMFIpf6EPeZBHAU0z30C2O9YYUJ7svVyPOyvzLGwyp
 XdYIR/XZ1SpCd/UTBv0OrAp5XnlJJ6+4/oOUT8jd2KgGDXcVDxKhqnOsfS2nUbr7v104
 skc/hM6vjHHkXi0M+9yxge6GGApVwWJbHZWGvoYpzqiHZgaOiulI8lF7GLN5V5JIHrWY
 +qbw==
X-Gm-Message-State: AO0yUKXa+2DBy3B+tb8uKV/BvIizjLgAUKHOgbLev+nWbcURTd0rBeNd
 u4CMpU8FJaO+LULH20036YUHGA1WrSx8///b
X-Google-Smtp-Source: AK7set9Tc0FUrmBsQYJl0uC+GQdkb84wcLRxlkWIMmkGolY0XpwvJbtMlHLpMQl4kviEEsBne6nHHA==
X-Received: by 2002:a5d:4e8d:0:b0:2c7:daa:1c56 with SMTP id
 e13-20020a5d4e8d000000b002c70daa1c56mr14202354wru.4.1677495534792; 
 Mon, 27 Feb 2023 02:58:54 -0800 (PST)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 l1-20020a1ced01000000b003ea57808179sm12055048wmh.38.2023.02.27.02.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 02:58:54 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Mon, 27 Feb 2023 11:58:37 +0100
Message-Id: <20230227105838.358916-4-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230227105838.358916-1-thomas.devoogdt@barco.com>
References: <20230227105838.358916-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5O1x8TJex/u2xPPHJw+D2nO+ELwyMaeFoEkgly3I8tA=;
 b=M0XJf6dVEG9YV0ba1wXbSME3xrKPieKfXl0m9XhPCHHhSOR0QHr4MIG7JNnPQrZc6M
 VfwQoz9rJ9h/lKFEN+kyPB7rEH0ZOoOlZtbOf0bcKT/gx7pu9Cv+W5YQvIz6s2BfRvpN
 80YUsGYJy5AMPkOmqsg4B+4Yigc5ioCFRgmNRRVCQPxtrH4LdlMIpcTYtEfKaW2MdbjU
 KeF2fFZZvg07U+iMavPtTaUcSdLxm0NhHM8Co3UUIVn+Esz8J+qle4Pk7YcmSBRuy11c
 ZcZVxYJAkJn0tyOFGC2Uw4TpCpff6YtDwNs5dOyus7jyn/86qWQo92C/NVF2iNjSrR3h
 n0tg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=M0XJf6dV
Subject: [Buildroot] [PATCH v5 4/5] package/libgtk3: re-enable atk-bridge
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
Cc: Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The at-spi2-core and at-spi2-atk were merged, and are now built by default,
so this patch is no longer required.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
v5: added re-enable atk-bridge patch to the package/at-spi2-core: bump to version 2.47.1 group
---
 package/libgtk3/0001-disable-atk-bridge.patch | 41 -------------------
 1 file changed, 41 deletions(-)
 delete mode 100644 package/libgtk3/0001-disable-atk-bridge.patch

diff --git a/package/libgtk3/0001-disable-atk-bridge.patch b/package/libgtk3/0001-disable-atk-bridge.patch
deleted file mode 100644
index f3e9bff2ba..0000000000
--- a/package/libgtk3/0001-disable-atk-bridge.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Remove atk-bridge support.
-
-atk-bridge doesn't seem useful for now in Buildroot and requires to
-add two new packages just for it: at-spi2-core and at-spi2-atk.
-
-Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
-
---- a/gtk/a11y/gtkaccessibility.c
-+++ b/gtk/a11y/gtkaccessibility.c
-@@ -37,10 +37,6 @@
- #include <gtk/gtktogglebutton.h>
- #include <gtk/gtkaccessible.h>
-
--#ifdef GDK_WINDOWING_X11
--#include <atk-bridge.h>
--#endif
--
- static gboolean gail_focus_watcher      (GSignalInvocationHint *ihint,
-                                          guint                  n_param_values,
-                                          const GValue          *param_values,
-@@ -988,9 +984,5 @@ _gtk_accessibility_init (void)
-   _gtk_accessibility_override_atk_util ();
-   do_window_event_initialization ();
-
--#ifdef GDK_WINDOWING_X11
--  atk_bridge_adaptor_init (NULL, NULL);
--#endif
--
-   atk_misc_instance = g_object_new (GTK_TYPE_MISC_IMPL, NULL);
- }
---- a/meson.build
-+++ b/meson.build
-@@ -564,7 +564,7 @@ if x11_enabled
-   xfixes_dep     = dependency('xfixes', required: false)
-   xcomposite_dep = dependency('xcomposite', required: false)
-   fontconfig_dep = dependency('fontconfig', fallback: ['fontconfig', 'fontconfig_dep'])
--  atkbridge_dep  = dependency('atk-bridge-2.0', version: at_spi2_atk_req)
-+  atkbridge_dep  = dependency('atk-bridge-2.0', version: at_spi2_atk_req, required: false)
- 
-   backend_immodules += ['xim']
- 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
