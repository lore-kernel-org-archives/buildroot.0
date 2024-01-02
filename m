Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0D8C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 11:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2298E4058C;
	Tue,  2 Jan 2024 11:00:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2298E4058C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dC5VDe0ko1nO; Tue,  2 Jan 2024 11:00:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64072404A9;
	Tue,  2 Jan 2024 11:00:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64072404A9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 540D81BF3F0
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 11:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39D39605BE
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 11:00:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39D39605BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hwnzj8GMnet0 for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 11:00:49 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F4F6605A3
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 11:00:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F4F6605A3
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40d2764c0f2so122813105e9.2
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 03:00:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704193246; x=1704798046;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=08aDjMEnCB70fEHFbTldzGq7hLdv5euzV10888MH++I=;
 b=HUl7wSsz4uwYFVKMTIxhNmZndwsSMatH9CmFSnivtIS1xxYSLb/ztGr/Ns/5+iWwTE
 I1BVl54QUw7c5UVmeMX9J3m8OfllWVuHEXi8ZQz7OO2D21KeOMbV/0stNm/XYMwRVhRM
 sn6RBMSp+9tgWqQ55Q4YwjnPVSNEHDoyHUFjQPYDz6ocPvh5sLobmh/2Ip/3SVRDfOjV
 2+XoOebU75E78j2P9B9BBXmS45GhzhjYlTJfhwEtQ+g7JbJlgaz+cAEidzwsYW8ONRi0
 FQ8QBSnvWNiiI63SWTWNy6+YqqJ9Bn1x5ibomDrr00xY9hZudyNHa/IUURGgeSfj0UNS
 Ni4Q==
X-Gm-Message-State: AOJu0YyGrE6DwoULYiaVFx4nurCSWPmthBDmA1oe5D0GQ4E9Ojwf4F2C
 NYajNGAZZbUFLHJkeNA1c6ddoFwRTPA=
X-Google-Smtp-Source: AGHT+IHGdwQP83GfkspB5FYyR/3GJbsdiYB2gCzQjB+jmST5cLSQLEhHIpoWO4e//FEVIP9B16aKJw==
X-Received: by 2002:a05:600c:c1a:b0:40d:8d48:56a4 with SMTP id
 fm26-20020a05600c0c1a00b0040d8d4856a4mr254761wmb.8.1704193245884; 
 Tue, 02 Jan 2024 03:00:45 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 q28-20020adfab1c000000b0033690139ea5sm25876549wrc.44.2024.01.02.03.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 03:00:45 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 12:00:30 +0100
Message-ID: <20240102110031.737953-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704193246; x=1704798046; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=08aDjMEnCB70fEHFbTldzGq7hLdv5euzV10888MH++I=;
 b=iwPVs2Vys+kmof1Y49zZwT+t4NVpwlf5QJ21kyw0lRsB5RZW2Yrz/4p4GAvsQ4Ms6X
 sMVpOQn1L2s1zQ3I/0QKWQ/enlBiZBe1GQrMScxE36XVkWJlt32TQ3l0iUtGphc8x3xh
 oJRWTmxfZjEDWdqBYNGjsVTWEBHPaQGbUeELs31UNzKYs02R7EFz9P55CJXLRMe2UPlZ
 6ZBS7vR4WboMD/aEL1E4+SES/kj8ocn8FvzScjVxcMt222ky/QCdKIfGAmp5m8nbi/BF
 iirQsl/wnlC8s12hq3BlFbIxzT7A9kTqxKup9Ghxn581ejeszU/ANww8w1Us0NigZ7P6
 ayNg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iwPVs2Vy
Subject: [Buildroot] [PATCH 1/1] package/vala: bump to version 0.56.14
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This bump will fix the following libsoup3 build failure raised since
commit 9cbffdf9be622c8ddad3b28106851b3101b3d201:

FAILED: libsoup/libsoup-3.0.vapi
/home/buildroot/autobuild/instance-1/output-1/host/bin/vapigen --quiet --library=libsoup-3.0 --directory=/home/buildroot/autobuild/instance-1/output-1/build/libsoup3-3.4.4/build/libsoup --pkg=gio-2.0 --metadatadir=/home/buildroot/autobuild/instance-1/output-1/build/libsoup3-3.4.4/libsoup /home/buildroot/autobuild/instance-1/output-1/build/libsoup3-3.4.4/build/libsoup/Soup-3.0.gir /home/buildroot/autobuild/instance-1/output-1/build/libsoup3-3.4.4/libsoup/Soup-3.0-custom.vala
Soup-3.0.gir:6877.95-6877.95: error: The type name `GLib.TlsProtocolVersion' could not be found

https://gitlab.gnome.org/GNOME/vala/-/blob/0.56.14/NEWS

Fixes:
 - http://autobuild.buildroot.org/results/732fcd20c2998e7d7b6b8f61871ad104f8d243df

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vala/vala.hash | 4 ++--
 package/vala/vala.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/vala/vala.hash b/package/vala/vala.hash
index 7f3a099940..b3716f0854 100644
--- a/package/vala/vala.hash
+++ b/package/vala/vala.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/vala/0.52/vala-0.52.4.sha256sum
-sha256  ecde520e5160e659ee699f8b1cdc96065edbd44bbd08eb48ef5f2506751fdf31  vala-0.52.4.tar.xz
+# From https://download.gnome.org/sources/vala/0.56/vala-0.56.14.sha256sum
+sha256  9382c268ca9bdc02aaedc8152a9818bf3935273041f629c56de410e360a3f557  vala-0.56.14.tar.xz
 # Locally computed
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index 94e18d349b..415d996faa 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-VALA_VERSION_MAJOR = 0.52
-VALA_VERSION = $(VALA_VERSION_MAJOR).4
+VALA_VERSION_MAJOR = 0.56
+VALA_VERSION = $(VALA_VERSION_MAJOR).14
 VALA_SITE = http://download.gnome.org/sources/vala/$(VALA_VERSION_MAJOR)
 VALA_SOURCE = vala-$(VALA_VERSION).tar.xz
 VALA_LICENSE = LGPL-2.1+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
