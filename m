Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F1AFF8850
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 21:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF5F4605BA;
	Fri, 24 Apr 2026 21:41:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Odk0x-FlSNf8; Fri, 24 Apr 2026 21:41:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13E6760699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777066897;
	bh=7YtQqBQVvW+P5G2cfUHO9OPxa+xqLLe8L1xYeSPc1D0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qsUkYDRCfNin8EA+5L/mtRSqTpol3wgsfTH3kkxFc3BPezr4cgkmUKg87I+6b2c3m
	 0myjZL9/VtdFPqNjjJkSiyYPMDEuKFr3Q6ol9alZG7ztZxQpM35fUWNHAA5TEB4A2t
	 FDuX/FYeqqoq3WEpdFYH5TnJbYpz6vD8RKZXaLejo+2iK29lvgOFpZuewZS2hTQgsn
	 v7DZ9GzmEQCXP5mcro7tUFmOXpe3eoMboDDrrIlWtNPpg+ZudKHe/faan6sy850tzP
	 vQhqIfnZdyfx9jp5M5hxyEQRKIcBTXewWYJHDjV8iQl6iRCXYrN388gs2SwTW7h3l3
	 wW4ptelMspxDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13E6760699;
	Fri, 24 Apr 2026 21:41:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D91C194
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 21:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2872960699
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 21:41:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zqj4WwNwODKU for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 21:41:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7019E60688
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7019E60688
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 21:41:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 19893832D9; Fri, 24 Apr 2026 21:41:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 23:31:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 18935d9d35c377f6de1ee5355f7f0cc743a2685b
X-Git-Newrev: 5e917c3a81f131a0d8555a81a43fe106b11bda02
X-Patchwork-Hint: ignore
Message-Id: <20260424214135.19893832D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/neon: fix build with zlib
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5e917c3a81f131a0d8555a81a43fe106b11bda02
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Building this defconfig

BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_NEON=y
BR2_PACKAGE_NEON_ZLIB=y

does not build libneon with zlib support, quoting configure log:

  configure: zlib not enabled

although the configure parameter

  --with-zlib=/home/bernd/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot

was used.

The reason is the addition of "=$(STAGING_DIR)" to --with-zlib which was
added to buildroot in 2008 with commit
cc6562ff839502a65a3b202ffe7fa3c67bae0856.

The upstream code, which expects only "yes", all other values lead to
the else-condition, is unchanged since 2004:
https://github.com/notroj/neon/blame/0.37.1/macros/neon.m4#L478
so a backport of this patch to LTS branches should be considered.

With this patch the configure log shows:

  checking for zlib.h... yes
  checking for inflate in -lz... yes
  configure: zlib support enabled, using -lz

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/neon/neon.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index e7872df3c9..39abbaef48 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -16,7 +16,7 @@ NEON_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 NEON_CONF_ENV = ne_cv_libsfor_bindtextdomain=$(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_PACKAGE_NEON_ZLIB),y)
-NEON_CONF_OPTS += --with-zlib=$(STAGING_DIR)
+NEON_CONF_OPTS += --with-zlib
 NEON_DEPENDENCIES += zlib
 else
 NEON_CONF_OPTS += --without-zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
