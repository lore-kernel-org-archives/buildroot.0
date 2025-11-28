Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBBFED116EA
	for <buildroot@archiver.kernel.org>; Fri, 28 Nov 2025 20:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A91184867;
	Fri, 28 Nov 2025 20:42:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RbZv8--pJ1by; Fri, 28 Nov 2025 20:42:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0E2784709
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0E2784709;
	Fri, 28 Nov 2025 20:42:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B7F1D708
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 20:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9ED3684883
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 20:42:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eMyYJz4jBsze for <buildroot@buildroot.org>;
 Fri, 28 Nov 2025 20:42:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90470847EE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90470847EE
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 20:42:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7FC2F8613A; Fri, 28 Nov 2025 20:42:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Nov 2025 21:40:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7cf46f0384a7953df54f56aab0a1871b9817a25d
X-Git-Newrev: 865b690517d72c6619496448961531a206961e66
X-Patchwork-Hint: ignore
Message-Id: <20251128204209.7FC2F8613A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xfsprogs: fix build with icu >= 76
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

commit: https://git.buildroot.net/buildroot/commit/?id=865b690517d72c6619496448961531a206961e66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit dcee99507c6767230fd1faeeefe95f5662eb03a3 bumped icu
from version 73-2 to 77-1 causing a build error during linking.

Fixes:
https://autobuild.buildroot.net/results/a30/a30bf79be2102f3a77e4a78a488fb3b6a5b63bbb/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...e-additionally-get-icu-uc-from-pkg-config.patch | 47 ++++++++++++++++++++++
 package/xfsprogs/xfsprogs.mk                       |  9 +++++
 2 files changed, 56 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
