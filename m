Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE77D116EA
	for <buildroot@archiver.kernel.org>; Fri, 28 Nov 2025 18:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F2414196D;
	Fri, 28 Nov 2025 18:14:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id haKgnRv6tT7v; Fri, 28 Nov 2025 18:14:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45FA64194C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45FA64194C;
	Fri, 28 Nov 2025 18:14:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 53E59708
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 18:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3235A4194C
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 18:14:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PPwbzy6EuVnh for <buildroot@buildroot.org>;
 Fri, 28 Nov 2025 18:14:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 91D9C41944
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91D9C41944
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 91D9C41944
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 18:14:04 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0558.dip0.t-ipconnect.de [91.58.5.88])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id ECB6CA4C16B3
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 19:14:01 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47898)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vP2yn-000000008Vj-1Yjk
 for buildroot@buildroot.org; Fri, 28 Nov 2025 18:14:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 28 Nov 2025 19:14:01 +0100
Message-ID: <20251128181401.3252582-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1764353642;
 bh=NOHzvHudwfltnf42f1pPaPFy+AQAOYXIFVTbuLPRRUU=;
 h=From:To:Subject:Date:From;
 b=wvG4JJ4tGO+yK1jx/CfBejZys7eou+onRGAslJFQ1qeP+JZyy9MOJZAQUVKbHicVD
 8fA+tVq+X3JxnwmcU4PXOf5asa0f1uybgTRUd9KorATDwReQ5f54E4KKBPX3R2ErpW
 sYleyj6c1whD6les1UYD+L9wWHqbBOuJhpUWzYDc9we7pqcAurQ5aJTNmHYf74UMAa
 yrGImTrYYavdOdlepoKvHzkJVhjxzxCDUhU6ZHLKmU+KaXFe0g2uTMoPUyyE4QnXl5
 Zkyj92mU3zR481lhi0N1SbqA8Mnie9lbA5PN8tvdtO3HwcoNV468Evmh5iCvPuz/X+
 QCVsYlGpkC3Zw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=wvG4JJ4t
Subject: [Buildroot] [PATCH 1/1] package/xfsprogs: fix build with icu >= 76
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

Buildroot commit dcee99507c6767230fd1faeeefe95f5662eb03a3 bumped icu
from version 73-2 to 77-1 causing a build error during linking.

Fixes:
https://autobuild.buildroot.net/results/a30/a30bf79be2102f3a77e4a78a488fb3b6a5b63bbb/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...itionally-get-icu-uc-from-pkg-config.patch | 47 +++++++++++++++++++
 package/xfsprogs/xfsprogs.mk                  |  9 ++++
 2 files changed, 56 insertions(+)
 create mode 100644 package/xfsprogs/0002-configure-additionally-get-icu-uc-from-pkg-config.patch

diff --git a/package/xfsprogs/0002-configure-additionally-get-icu-uc-from-pkg-config.patch b/package/xfsprogs/0002-configure-additionally-get-icu-uc-from-pkg-config.patch
new file mode 100644
index 0000000000..714d1e1257
--- /dev/null
+++ b/package/xfsprogs/0002-configure-additionally-get-icu-uc-from-pkg-config.patch
@@ -0,0 +1,47 @@
+From 0b3e7284c7fa20dd27f8a584f8db417d1d6fa27b Mon Sep 17 00:00:00 2001
+From: Alyssa Ross <hi@alyssa.is>
+Date: Fri, 14 Feb 2025 09:45:10 +0100
+Subject: configure: additionally get icu-uc from pkg-config
+
+Upstream libicu changed its pkgconfig files[0] in version 76 to require
+callers to call out to each .pc file they need for the libraries they
+want to link against.  This apparently reduces overlinking, at a cost of
+needing the world to fix themselves up.
+
+This patch fixes the following build error with icu 76, also seen by
+Fedora[1]:
+
+	    /bin/ld: unicrash.o: undefined reference to symbol 'uiter_setString_76'
+	    /bin/ld: /lib/libicuuc.so.76: error adding symbols: DSO missing from command line
+	    collect2: error: ld returned 1 exit status
+	    make[2]: *** [../include/buildrules:65: xfs_scrub] Error 1
+	    make[1]: *** [include/buildrules:35: scrub] Error 2
+
+Link: https://github.com/unicode-org/icu/commit/199bc827021ffdb43b6579d68e5eecf54c7f6f56 [0]
+Link: https://src.fedoraproject.org/rpms/xfsprogs/c/624b0fdf7b2a31c1a34787b04e791eee47c97340 [1]
+Signed-off-by: Alyssa Ross <hi@alyssa.is>
+Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
+
+Upstream: https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/commit/?id=0b3e7284c7fa20dd27f8a584f8db417d1d6fa27b
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ m4/package_icu.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+(limited to 'm4/package_icu.m4')
+
+diff --git a/m4/package_icu.m4 b/m4/package_icu.m4
+index 3ccbe0cc98..6b89c874f1 100644
+--- a/m4/package_icu.m4
++++ b/m4/package_icu.m4
+@@ -1,5 +1,5 @@
+ AC_DEFUN([AC_HAVE_LIBICU],
+-  [ PKG_CHECK_MODULES([libicu], [icu-i18n], [have_libicu=yes], [have_libicu=no])
++  [ PKG_CHECK_MODULES([libicu], [icu-i18n icu-uc], [have_libicu=yes], [have_libicu=no])
+     AC_SUBST(have_libicu)
+     AC_SUBST(libicu_CFLAGS)
+     AC_SUBST(libicu_LIBS)
+-- 
+cgit 1.2.3-korg
+
diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index 0234b91d09..552ff69bd6 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -10,6 +10,15 @@ XFSPROGS_SOURCE = xfsprogs-$(XFSPROGS_VERSION).tar.xz
 XFSPROGS_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1 (libhandle, few headers)
 XFSPROGS_LICENSE_FILES = LICENSES/GPL-2.0 LICENSES/LGPL-2.1
 
+# 0002-configure-additionally-get-icu-uc-from-pkg-config.patch
+XFSPROGS_AUTORECONF = YES
+
+# restore upstream install-sh script overwritten by autoreconf
+define XFSPROGS_FIX_INSTALL_SH
+	mv $(@D)/install-sh~ $(@D)/install-sh
+endef
+XFSPROGS_POST_CONFIGURE_HOOKS = XFSPROGS_FIX_INSTALL_SH
+
 XFSPROGS_DEPENDENCIES = inih liburcu util-linux
 
 XFSPROGS_CONF_ENV = ac_cv_header_aio_h=yes ac_cv_lib_rt_lio_listio=yes PLATFORM="linux"
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
