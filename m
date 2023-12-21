Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A431C35274
	for <buildroot@archiver.kernel.org>; Thu, 21 Dec 2023 15:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53A344266A;
	Thu, 21 Dec 2023 15:37:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53A344266A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rb5f9zMk6uVJ; Thu, 21 Dec 2023 15:37:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9229C4268A;
	Thu, 21 Dec 2023 15:37:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9229C4268A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 55B2D1BF381
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 15:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AEDC40A50
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 15:36:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AEDC40A50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id COtVlUVfgPJ8 for <buildroot@lists.busybox.net>;
 Thu, 21 Dec 2023 15:36:31 +0000 (UTC)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 31D554031D
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 15:36:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31D554031D
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1d3eabe9321so6242865ad.2
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 07:36:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703172990; x=1703777790;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YtMUJzYIc2+D5nRXa47LT0D//FMkbOeoj9L7ap6l2fQ=;
 b=aXu/wBxWQsQSAUYgnNTyWht6UySl2Zu5lnoMhuQSYnoLKCjHAmBdKBb7egmllce3VO
 VZaJbSzNk3HzrOLE80BBrtl5aWL4uo9mzjnZquKn1p7ElNL0wzG/0KuS6ZBfq/Pd18MP
 HRDFkje87/PYyDSWewOMKrQMgc9SMGTGws1uE0cppmMk5VE3GvYhSABp9NiiF7ETfuEh
 aeaynjACnn3xpFeHRvNuWcogJtAff+9nym3KYTAtjms0e5Iuk3y1HJkDKW1THi/q8cjo
 GAWp1j9Dj8F6Mv4KEwnrLL2ph4ZYcsv5i7PbKqgV44j8E8Ho9lgjlg1mF0/QQkhKfDLO
 7wLQ==
X-Gm-Message-State: AOJu0Yz2pYsrkgJ5OH4kfbDMvVH+tNA4gMGr4sk18zb4mPKSLvehr25h
 0xbhqSon44GmvONKuMaLpTuGGFrJ86As2GxRt+Y=
X-Google-Smtp-Source: AGHT+IHw84OpIjakam8hCVU+cUmt1yGjJ26wVv+8i/cp9B/NoGixFdQ7in2isFN62Kk/kHRSEY338g==
X-Received: by 2002:a17:903:22d0:b0:1d3:6421:97e with SMTP id
 y16-20020a17090322d000b001d36421097emr9030037plg.121.1703172989823; 
 Thu, 21 Dec 2023 07:36:29 -0800 (PST)
Received: from DESKTOP-OI0KN2B.ht.home (174-126-58-188.cpe.sparklight.net.
 [174.126.58.188]) by smtp.gmail.com with ESMTPSA id
 g24-20020a170902fe1800b001d0c41b1d03sm1792029plj.32.2023.12.21.07.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 07:36:29 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 21 Dec 2023 08:36:16 -0700
Message-ID: <20231221153620.237439-7-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231221153620.237439-1-adam.duskett@amarulasolutions.com>
References: <20231221153620.237439-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1703172990; x=1703777790;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YtMUJzYIc2+D5nRXa47LT0D//FMkbOeoj9L7ap6l2fQ=;
 b=YVFFdoGhZBMt9KjcKli24zPUoBheqak/yP/DO8tN05eyohfY9KEd9+WzK//L6oKALS
 mnYml1uzaLEfYsaz0Go7GI8gvFkrAgW5EEJd0zdGHjuMK2NHP6HdCMNwO/z+UdBC5ujb
 Fbnbh5y8QYA/WjgCEOYoZz5Dh7RbHBurgLSV4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=YVFFdoGh
Subject: [Buildroot] [PATCH v4 07/10] package/sway: enable swaybar support
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a config option to build sway with swaybar support.
  - The bar requires dejavu fonts.
  - If bash-completions is selected, JQ is required.
  - Select dmenu-wayland as a runtime dependency.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/sway/Config.in | 12 ++++++++++++
 package/sway/sway.mk   |  7 ++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/package/sway/Config.in b/package/sway/Config.in
index 08b6911069..6b2368ddc2 100644
--- a/package/sway/Config.in
+++ b/package/sway/Config.in
@@ -24,6 +24,18 @@ config BR2_PACKAGE_SWAY
 
 	  https://github.com/swaywm/sway
 
+if BR2_PACKAGE_SWAY
+
+config BR2_PACKAGE_SWAY_SWAYBAR
+	bool "swaybar"
+	select BR2_PACKAGE_DEJAVU
+	select BR2_PACKAGE_JQ if BR2_PACKAGE_BASH_COMPLETION
+	select BR2_PACKAGE_DMENU_WAYLAND # Runtime
+	help
+	  Enable support for swaybar
+
+endif # BR2_PACKAGE_SWAY
+
 comment "sway needs systemd, udev, EGL w/ Wayland backend and OpenGL ES support"
 	depends on !BR2_PACKAGE_SYSTEMD || \
 		!BR2_PACKAGE_HAS_UDEV || \
diff --git a/package/sway/sway.mk b/package/sway/sway.mk
index 1e3dd279ef..6d924ca92e 100644
--- a/package/sway/sway.mk
+++ b/package/sway/sway.mk
@@ -13,7 +13,6 @@ SWAY_CONF_OPTS = \
 	-Dwerror=false \
 	-Dzsh-completions=false \
 	-Dfish-completions=false \
-	-Dswaybar=false \
 	-Dswaynag=false \
 	-Dtray=disabled \
 	-Dman-pages=disabled \
@@ -44,4 +43,10 @@ else
 SWAY_CONF_OPTS += -Ddefault-wallpaper=false
 endif
 
+ifeq ($(BR2_PACKAGE_SWAY_SWAYBAR),y)
+SWAY_CONF_OPTS += -Dswaybar=true
+else
+SWAY_CONF_OPTS += -Dswaybar=false
+endif
+
 $(eval $(meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
