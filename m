Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8990FC7618E
	for <buildroot@archiver.kernel.org>; Wed, 26 Apr 2023 08:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2FB5441CC8;
	Wed, 26 Apr 2023 08:00:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FB5441CC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cQzipaAgjzUj; Wed, 26 Apr 2023 08:00:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B090941CC3;
	Wed, 26 Apr 2023 08:00:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B090941CC3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B04461BF215
 for <buildroot@lists.busybox.net>; Wed, 26 Apr 2023 07:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87C2A41861
 for <buildroot@lists.busybox.net>; Wed, 26 Apr 2023 07:59:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87C2A41861
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Jrk_bwHGnfV for <buildroot@lists.busybox.net>;
 Wed, 26 Apr 2023 07:59:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B5514090B
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B5514090B
 for <buildroot@buildroot.org>; Wed, 26 Apr 2023 07:59:39 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-9505214c47fso1263998666b.1
 for <buildroot@buildroot.org>; Wed, 26 Apr 2023 00:59:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682495977; x=1685087977;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=deyfqBsBO07Y2MRwoGFAzCuEf0nHhP4Y2pgqbZu5jj8=;
 b=IKCDOkQisMq7T/pk6CCTgusw55z6FN99bTCzGbVlpvu6pQFcC+me9yLXwSGKcEpeu5
 q7f5Ow1FRMGsfsgRGvWQKsxVXn4FNrAjJiuFjK3iQ+E6CCZC7AtRea42ZcrpUGCfZ2/p
 AjlTCsbt5x+Dyrb12mi/5Cl5ESglGfvsupM3Gw8JPg9Aw8tW4778gfJK10C/hM3TJmaB
 e6g1jZuxDcuHm0NWRki5a+Vcwz2KVql3Dv+vwGWbn7SW0BX+fYhQsnNQJE9w/JRwOp4y
 bvRVpMEHQm6e8wAM5gY4RZiGOw3G/XvzHlXupMEIBTYcW0ikJxewLEUb+jGjSUMkSVIZ
 RL/Q==
X-Gm-Message-State: AAQBX9dvH8sjSDekON2OWsWCXeFmL6osEssHaw064kcFTli0dmKIUguj
 K1OXA9edlid66AOv5LOo1ux6Ywf/3oyXqGWc
X-Google-Smtp-Source: AKy350YHJ97kTkUhlDzJ0UyK40wEiQ4qsMC93WWtEXgSNeM7xnk4igQOZap5A4xg2S4/dvdaZbDPCA==
X-Received: by 2002:a17:906:a2da:b0:946:be05:ed7a with SMTP id
 by26-20020a170906a2da00b00946be05ed7amr15875646ejb.70.1682495977387; 
 Wed, 26 Apr 2023 00:59:37 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:5dc7:9f11:9dc8:1e6d])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a170906970900b009534211cc97sm7883414ejx.159.2023.04.26.00.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 00:59:37 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Wed, 26 Apr 2023 09:59:04 +0200
Message-Id: <20230426075905.2307988-4-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230426075905.2307988-1-thomas@devoogdt.com>
References: <20230426075905.2307988-1-thomas@devoogdt.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v6 4/5] package/libgtk3: re-enable atk-bridge
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Daniel Lang <d.lang@abatec.at>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 James Knight <james.knight@collins.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The at-spi2-core and at-spi2-atk were merged, and are now built by default,
so this patch is no longer required.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Tested-by: Adrian Perez de Castro <aperez@igalia.com>
---
v5: added re-enable atk-bridge patch to the package/at-spi2-core: bump to version 2.47.1 group
v6: no change
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
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
