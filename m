Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFAAE107BCE2
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 21:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1ADF40E5E;
	Fri, 13 Mar 2026 21:51:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d0-qFaaoaALT; Fri, 13 Mar 2026 21:51:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADBB140EC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773438672;
	bh=3N/WA2BkRqAe5YlbSrYWitYpCiMwQY6+dqfLVRxWzNY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JQww0Ca+LmfM5lInJvRRsW+GBZPSrtsrXqYcNfr+Pj8h/GcMItZ+d+015MI3vFVXI
	 8RNY+PMVuIGu24x7ZJwVZ2Tjg6xYB4OveBTuNwcOm2u35cChsvRgEjqS2eR1QNl//P
	 SXWQfbhp1GFDXL9AAdsLiOsfWT1YsWM4uyNg6apCykzF5UJy4slrZnWczWUoWFqdTV
	 IwPDczg8vPmAyG9vB6/IX6vZlx1rLkD4419m2N28NjMpdAZRfFhOrOvn0++7QXMrba
	 Zw0G1fdRdu0ybxLyyMC0PYpzlLGBrfrc5l5DWRwqNA3iNcsBHIq3SZR/ATflXfD/OW
	 NnghdF2InL5Gg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADBB140EC2;
	Fri, 13 Mar 2026 21:51:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 532BF1AF
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4511640E4E
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:51:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uSSdc2kRrXD9 for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 21:51:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 97CB940EC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97CB940EC1
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 97CB940EC1
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:51:09 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 8428019F59C;
 Fri, 13 Mar 2026 22:51:00 +0100 (CET)
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, Julien Olivain <ju.o@free.fr>,
 Philippe Proulx <eeppeliteloop@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 13 Mar 2026 22:50:38 +0100
Message-ID: <20260313215044.2406044-2-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313215044.2406044-1-ju.o@free.fr>
References: <20260313215044.2406044-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773438667;
 bh=h+IATBRzsjrAGyeXLzDmw/eNLzV5me4iwvQdv87VLes=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eOYfShL7Ik+gw1RQs/T9cZJ35EBzQ/hlYA7XzgzLbVrcAdQeKC/fa4nI9KsZCYh1T
 WqEV8L947mjo2RX4ELFgIoe3ibj2OzY0qWLADJNqzSprrw4SIhDXW9mHSTuwLn3T8L
 4KR7q+xzPGvxbi5Y8TMXU50SQtYi83EN5+0x9x6rGtwE3+izmlzKXthpU5pJLT64s3
 ehM+PU8Ozlh1P2fiMeMZXcCikylLPhKYiaEXpEmC6htMWAef0k3Ag3NBUyhbRyqXgt
 JvQcQTZgngwStvN3rhcX3JLJaz+XNXtC8sXxk594J09JBvwE/EqzXKr8BUdgkiilhL
 2xGqB1xtmU11Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=eOYfShL7
Subject: [Buildroot] [PATCH v2 2/7] package/xfsprogs: bump version to 6.18.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/tree/doc/CHANGES?h=v6.18.0

This commit refreshes the patch 0001 (rebase and update upstream link
to lore mailing list). It also removes the patch 0002 included in
this new version and removes the corresponding _AUTORECONF and
_POST_CONFIGURE_HOOKS.

Also, the upstream commit [1] introduced a usage of the "capacity"
field of zoned block devices, introduced in Kernel commit [2],
first included in v5.9. For this reason, this commit adds the new
dependency to BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9.

For that reason, this commit updates the test_xfsprogs runtime test
to switch to a Bootlin external toolchain, which includes Kernel
headers that meet this new requirement.

Finally, this commit also updates this runtime test Kernel version
to the LTS 6.18.9. This is because the default filesystem options
of mkfs.xfs were updated in upstream commit [3] to include new
features supported in the new Kernel 6.18.y LTS series. The commit [3]
is included in xfsprogs v6.18.

[1] https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/commit/?id=48ccc2459039309cfbaf358febea53a86f07827c
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=82394db7383d33641f3f565bd79792fb41b1741f
[3] https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/commit/?id=54aad16b4b9b923442b4042afaba4438ca1aa868

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Changes:
v1-> v2:
- add --enable-libicu=no in HOST_XFSPROGS_CONF_OPTS
---
 ...do-not-do-dynamic-linking-of-libtool.patch | 12 ++---
 ...itionally-get-icu-uc-from-pkg-config.patch | 47 -------------------
 package/xfsprogs/Config.in                    |  4 +-
 package/xfsprogs/xfsprogs.hash                |  2 +-
 package/xfsprogs/xfsprogs.mk                  | 11 +----
 5 files changed, 11 insertions(+), 65 deletions(-)
 delete mode 100644 package/xfsprogs/0002-configure-additionally-get-icu-uc-from-pkg-config.patch

diff --git a/package/xfsprogs/0001-mdrestore-scrub-do-not-do-dynamic-linking-of-libtool.patch b/package/xfsprogs/0001-mdrestore-scrub-do-not-do-dynamic-linking-of-libtool.patch
index cb30e68db4..434658307c 100644
--- a/package/xfsprogs/0001-mdrestore-scrub-do-not-do-dynamic-linking-of-libtool.patch
+++ b/package/xfsprogs/0001-mdrestore-scrub-do-not-do-dynamic-linking-of-libtool.patch
@@ -1,4 +1,4 @@
-From fa3a4e036c8c78325216ed21eff6145aeb186686 Mon Sep 17 00:00:00 2001
+From e09511b7cf91c6c00b72c568571d0b0984acd381 Mon Sep 17 00:00:00 2001
 From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 Date: Wed, 25 Nov 2015 10:50:00 +0000
 Subject: [PATCH] mdrestore, scrub: do not do dynamic linking of libtool
@@ -11,12 +11,12 @@ linking for libuuid only. Otherwise the build will fail like this:
 ld: attempted static link of dynamic object `/usr/lib/libuuid.so'
 
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-Upstream: Proposed: https://www.spinics.net/lists/xfs/msg36149.html
+Upstream: Proposed: https://lore.kernel.org/linux-xfs/1448449838-47261-1-git-send-email-Vincent.Riera@imgtec.com/
 [baruch: update for v4.15.1; extend to include scrub]
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 [matt: update for v4.16.1; adjusted libunistring -> libicu]
 Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
-[Julien: rebased on v6.4.0]
+[Julien: rebased on v6.18.0]
 Signed-off-by: Julien Olivain <ju.o@free.fr>
 ---
  mdrestore/Makefile | 2 +-
@@ -37,10 +37,10 @@ index 4a932efb..7ea1fd45 100644
  default: depend $(LTCOMMAND)
  
 diff --git a/scrub/Makefile b/scrub/Makefile
-index aba14ed2..f0ef492f 100644
+index 6375d77a..26414491 100644
 --- a/scrub/Makefile
 +++ b/scrub/Makefile
-@@ -71,7 +71,7 @@ xfs_scrub.c
+@@ -90,7 +90,7 @@ xfs_scrub.c
  LLDLIBS += $(LIBHANDLE) $(LIBFROG) $(LIBICU_LIBS) $(LIBRT) $(LIBURCU) \
  	$(LIBPTHREAD)
  LTDEPENDENCIES += $(LIBHANDLE) $(LIBFROG)
@@ -50,5 +50,5 @@ index aba14ed2..f0ef492f 100644
  ifeq ($(HAVE_MALLINFO),yes)
  LCFLAGS += -DHAVE_MALLINFO
 -- 
-2.45.2
+2.52.0
 
diff --git a/package/xfsprogs/0002-configure-additionally-get-icu-uc-from-pkg-config.patch b/package/xfsprogs/0002-configure-additionally-get-icu-uc-from-pkg-config.patch
deleted file mode 100644
index 714d1e1257..0000000000
--- a/package/xfsprogs/0002-configure-additionally-get-icu-uc-from-pkg-config.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 0b3e7284c7fa20dd27f8a584f8db417d1d6fa27b Mon Sep 17 00:00:00 2001
-From: Alyssa Ross <hi@alyssa.is>
-Date: Fri, 14 Feb 2025 09:45:10 +0100
-Subject: configure: additionally get icu-uc from pkg-config
-
-Upstream libicu changed its pkgconfig files[0] in version 76 to require
-callers to call out to each .pc file they need for the libraries they
-want to link against.  This apparently reduces overlinking, at a cost of
-needing the world to fix themselves up.
-
-This patch fixes the following build error with icu 76, also seen by
-Fedora[1]:
-
-	    /bin/ld: unicrash.o: undefined reference to symbol 'uiter_setString_76'
-	    /bin/ld: /lib/libicuuc.so.76: error adding symbols: DSO missing from command line
-	    collect2: error: ld returned 1 exit status
-	    make[2]: *** [../include/buildrules:65: xfs_scrub] Error 1
-	    make[1]: *** [include/buildrules:35: scrub] Error 2
-
-Link: https://github.com/unicode-org/icu/commit/199bc827021ffdb43b6579d68e5eecf54c7f6f56 [0]
-Link: https://src.fedoraproject.org/rpms/xfsprogs/c/624b0fdf7b2a31c1a34787b04e791eee47c97340 [1]
-Signed-off-by: Alyssa Ross <hi@alyssa.is>
-Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
-
-Upstream: https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/commit/?id=0b3e7284c7fa20dd27f8a584f8db417d1d6fa27b
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- m4/package_icu.m4 | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-(limited to 'm4/package_icu.m4')
-
-diff --git a/m4/package_icu.m4 b/m4/package_icu.m4
-index 3ccbe0cc98..6b89c874f1 100644
---- a/m4/package_icu.m4
-+++ b/m4/package_icu.m4
-@@ -1,5 +1,5 @@
- AC_DEFUN([AC_HAVE_LIBICU],
--  [ PKG_CHECK_MODULES([libicu], [icu-i18n], [have_libicu=yes], [have_libicu=no])
-+  [ PKG_CHECK_MODULES([libicu], [icu-i18n icu-uc], [have_libicu=yes], [have_libicu=no])
-     AC_SUBST(have_libicu)
-     AC_SUBST(libicu_CFLAGS)
-     AC_SUBST(libicu_LIBS)
--- 
-cgit 1.2.3-korg
-
diff --git a/package/xfsprogs/Config.in b/package/xfsprogs/Config.in
index 1a29579d8b..1ecffa3e0e 100644
--- a/package/xfsprogs/Config.in
+++ b/package/xfsprogs/Config.in
@@ -1,7 +1,8 @@
-comment "xfsprogs needs a toolchain w/ threads, C++"
+comment "xfsprogs needs a toolchain w/ threads, headers >= 5.9, C++"
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9 || \
 		!BR2_INSTALL_LIBSTDCPP
 
 config BR2_PACKAGE_XFSPROGS
@@ -10,6 +11,7 @@ config BR2_PACKAGE_XFSPROGS
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP # liburcu
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9 # blkzoned.h (capacity)
 	select BR2_PACKAGE_INIH
 	select BR2_PACKAGE_LIBURCU
 	select BR2_PACKAGE_UTIL_LINUX
diff --git a/package/xfsprogs/xfsprogs.hash b/package/xfsprogs/xfsprogs.hash
index a86693419d..24c2e20a7e 100644
--- a/package/xfsprogs/xfsprogs.hash
+++ b/package/xfsprogs/xfsprogs.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/sha256sums.asc
-sha256  dae3bb432196f7b183b2e6bd5dc44bf33edbd7d0e85bd37d25c235df81b8100a  xfsprogs-6.11.0.tar.xz
+sha256  3a6dc7b1245ce9bccd197bab00691f1b190bd3694d3ccc301d21b83afc133199  xfsprogs-6.18.0.tar.xz
 
 # Hash for license files
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index 552ff69bd6..ab78f8e2cc 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -4,21 +4,12 @@
 #
 ################################################################################
 
-XFSPROGS_VERSION = 6.11.0
+XFSPROGS_VERSION = 6.18.0
 XFSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/fs/xfs/xfsprogs
 XFSPROGS_SOURCE = xfsprogs-$(XFSPROGS_VERSION).tar.xz
 XFSPROGS_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1 (libhandle, few headers)
 XFSPROGS_LICENSE_FILES = LICENSES/GPL-2.0 LICENSES/LGPL-2.1
 
-# 0002-configure-additionally-get-icu-uc-from-pkg-config.patch
-XFSPROGS_AUTORECONF = YES
-
-# restore upstream install-sh script overwritten by autoreconf
-define XFSPROGS_FIX_INSTALL_SH
-	mv $(@D)/install-sh~ $(@D)/install-sh
-endef
-XFSPROGS_POST_CONFIGURE_HOOKS = XFSPROGS_FIX_INSTALL_SH
-
 XFSPROGS_DEPENDENCIES = inih liburcu util-linux
 
 XFSPROGS_CONF_ENV = ac_cv_header_aio_h=yes ac_cv_lib_rt_lio_listio=yes PLATFORM="linux"
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
