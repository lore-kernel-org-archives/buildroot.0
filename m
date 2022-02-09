Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358F3C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:57:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E45A983412;
	Wed,  9 Feb 2022 21:57:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Oq8OG-uLKDvC; Wed,  9 Feb 2022 21:57:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 309F683342;
	Wed,  9 Feb 2022 21:57:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2CC9B1BF2F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1AFF960A4F
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:53:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=othermo.de
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6brrrTtQbaMj for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:53:32 +0000 (UTC)
X-Greylist: delayed 00:09:57 by SQLgrey-1.8.0
Received: from mout-b-110.mailbox.org (mout-b-110.mailbox.org
 [IPv6:2001:67c:2050:101:465::110])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2FD7C60803
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:53:32 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-110.mailbox.org (Postfix) with ESMTPS id 4JvD014RWFz9sr6;
 Wed,  9 Feb 2022 22:43:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=othermo.de; s=MBO0001; 
 t=1644443007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=lbYYzDNCfmWpqbPJOels1zpyzkmjMYh9ikN5AxrUSRQ=;
 b=Fg75v9Aq9MN+hKnK6nHHiJ/BKpaAsmFFu2N/X4WegI3BXW8ilVYrFWAstys6iuWqkTbk5q
 Dwy4Mzha+62qWtNHNMCzb1DhuooM9/vvKFjUoGbW70ZJbOQnljTyBdED4HzjvMhxYsQKDd
 PsNZvpCJMKDHp6HEreAYSXPaV+nbP4h7fY0dPbJofv6fcWbNjo9xzWv+D+oNTHFaiC/Ty+
 GpRy8U9qvaX8zd0TjE0Ow4Gi1XAjiek+kJ5QWL41vMiCcvuNK7rfb7umTsskdgC0A+3dWu
 otFzgxuGaKVsdGARc55Jxge3LdDmBP6ZmXvVgDEBkAirKPJdX9QoghGa4p3xfA==
From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 22:43:05 +0100
Message-Id: <20220209214305.314272-1-marcus.hoffmann@othermo.de>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libqmi: fix build failure without
 host-python
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Aleksander Morgado <aleksander@aleksander.es>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add an upstream patch to use python3 instead of just python during the
libqmi build.

Fixes a build error with the following defconfig inside the buildroot:base
docker image.

BR2_aarch64=y
BR2_cortex_a72=y
BR2_ARM_FPU_VFPV4=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_PACKAGE_LIBQMI=y

Fixes:

FAILED: src/libqmi-glib/generated/qmi-ctl.c src/libqmi-glib/generated/qmi-ctl.h src/libqmi-glib/generated/qmi-ctl.sections
/builds/othermo/buildroot/output/build/libqmi-1.30.2/build-aux/qmi-codegen/qmi-codegen --input /builds/othermo/buildroot/output/build/libqmi-1.30.2/data/qmi-service-ctl.json --include /builds/othermo/buildroot/output/build/libqmi-1.30.2/data/qmi-common.json --output src/libqmi-glib/generated/qmi-ctl
/usr/bin/env: 'python': No such file or directory

Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
---
 package/libqmi/libqmi.hash | 1 +
 package/libqmi/libqmi.mk   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
index 1f2da45ac0..854de8512c 100644
--- a/package/libqmi/libqmi.hash
+++ b/package/libqmi/libqmi.hash
@@ -2,3 +2,4 @@
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
 sha256  2eb7c7971b91a64ad830643b0170cff692a69bf0f093ca61d72d3f466a0272d4  libqmi-1.30.2.tar.gz
+sha256  1fb80064cddc9a0a2a2abeb622acc535c3f1c74795bdee48c81f32e15442d7d7  17c604d7bd78dd081868798a702db0eaa8abb169.patch
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index a4839f1efb..f3c51f7486 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -6,6 +6,7 @@
 
 LIBQMI_VERSION = 1.30.2
 LIBQMI_SITE = https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/archive/$(LIBQMI_VERSION)
+LIBQMI_PATCH = https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/commit/17c604d7bd78dd081868798a702db0eaa8abb169.patch
 LIBQMI_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
 LIBQMI_LICENSE_FILES = COPYING COPYING.LIB
 LIBQMI_CPE_ID_VENDOR = libqmi_project
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
