Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34169C433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 08:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAF37607C0;
	Sat,  5 Nov 2022 08:03:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAF37607C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jb0DaQRuv6Aq; Sat,  5 Nov 2022 08:03:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF80960AB7;
	Sat,  5 Nov 2022 08:03:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF80960AB7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EE8D11BF28E
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 08:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9CB382106
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 08:03:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9CB382106
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r0t5s_KJJiKQ for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 08:03:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCAEA8141D
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CCAEA8141D
 for <buildroot@busybox.net>; Sat,  5 Nov 2022 08:03:54 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id d26so18514749eje.10
 for <buildroot@busybox.net>; Sat, 05 Nov 2022 01:03:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CGREyMWB/3Qg5j38GLcnPvCAPHjRI8sveXDwalBKqxQ=;
 b=Dum5h/gsIKKile2+oqQ1w5yl9MWe8sfVj/sipAo7WuKXHlpXRYIxZZsYs3jEj2nIJD
 fT96eCrVCPccTP9Y56ax++jYHg+OCHHszW35JeR6GVy0h7VC3L2K6h5QR1FZAUqsiqYM
 eWFLKVAGic9JjSPF/0CN85eVypm6hh5/KEyF6kYuPX/MoIDu9cwnEuymmlR0YG5gSfoJ
 Ur8Ua+6bzT5ArpXj0gGlWcQvn4pOMLpdj73VVyXlTE5i65JtRogcT2sxSvZZt/LZRShg
 x+h5pn11un6Z5ClXOJBF3eaSQRT4ZPBB9xiQgez/xm95pID/Voiem8zGwT/XuDeg+QgD
 lxOw==
X-Gm-Message-State: ACrzQf1UkLIzLkPKcRzam5+ZOiCK9v6kIgJoVEVcz7GQLgkMGGUNalp+
 6+H/jlLEByEOPNYqEHpt9fNcn8JSWVU=
X-Google-Smtp-Source: AMsMyM5RllAXPFCopMci/3PvcHN2grnEY7EGYrT7FLUVGvb/V6xRvMTFb7sUAnTk3cXGfyASA146MA==
X-Received: by 2002:a17:907:80d:b0:73d:a576:dfbd with SMTP id
 wv13-20020a170907080d00b0073da576dfbdmr37961248ejb.402.1667635432943; 
 Sat, 05 Nov 2022 01:03:52 -0700 (PDT)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 h11-20020aa7c60b000000b00461aaa39efbsm864031edq.0.2022.11.05.01.03.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 01:03:52 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat,  5 Nov 2022 09:03:48 +0100
Message-Id: <20221105080348.1228426-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CGREyMWB/3Qg5j38GLcnPvCAPHjRI8sveXDwalBKqxQ=;
 b=n3T4srM9h+Q4T5bVt4MJlsnuDL7bLFMV22CfqwzEdv8si7Hl/njPEj6sgAEoDoPIzr
 wgbvTrLYuCO+jFvim4SJ/MxPBTkMrjmlCSu0QeKwhEnSLJOax1/mlmMTni3unJknppGe
 rLaM//u5uNu2ue3QOLLh4QD+JS/SM/nlTVTWPbY3NmniEZ/DCClMoBgiTtn7Iv7KuIzC
 oRd2UgdjaLdx26zEYBWiYusN7cnn53h/SKgC99X/7MAKUIZvgEI1zFyYaBc9EuvzSh6z
 v0UpUjsPoFuFzPt7v7Az9RwjaSVD2FC8vyFrXknMZQxf4cvY0Ym/eRlIFhkcVTva8htJ
 UF/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=n3T4srM9
Subject: [Buildroot] [PATCH] package/gdk-pixbuf: bump to version 2.42.10
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/gdk-pixbuf/gdk-pixbuf.hash | 4 ++--
 package/gdk-pixbuf/gdk-pixbuf.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.hash b/package/gdk-pixbuf/gdk-pixbuf.hash
index 35084a50a..23a7c3fc0 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.hash
+++ b/package/gdk-pixbuf/gdk-pixbuf.hash
@@ -1,3 +1,3 @@
-# From https://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.42/gdk-pixbuf-2.42.9.sha256sum
-sha256  28f7958e7bf29a32d4e963556d241d0a41a6786582ff6a5ad11665e0347fc962  gdk-pixbuf-2.42.9.tar.xz
+# From https://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.42/gdk-pixbuf-2.42.10.sha256sum
+sha256  ee9b6c75d13ba096907a2e3c6b27b61bcd17f5c7ebeab5a5b439d2f2e39fe44b  gdk-pixbuf-2.42.10.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 4a513effb..561e19156 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GDK_PIXBUF_VERSION_MAJOR = 2.42
-GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).9
+GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).10
 GDK_PIXBUF_SOURCE = gdk-pixbuf-$(GDK_PIXBUF_VERSION).tar.xz
 GDK_PIXBUF_SITE = http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/$(GDK_PIXBUF_VERSION_MAJOR)
 GDK_PIXBUF_LICENSE = LGPL-2.1+
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
