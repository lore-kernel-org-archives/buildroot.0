Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA9CC433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Apr 2022 20:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7F9C401F2;
	Sun, 24 Apr 2022 20:58:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NIkymhsZBn8G; Sun, 24 Apr 2022 20:58:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C13E40339;
	Sun, 24 Apr 2022 20:58:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 10D9B1BF404
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 20:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63BA560A92
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 20:57:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3RhK_c2u3zWx for <buildroot@lists.busybox.net>;
 Sun, 24 Apr 2022 20:57:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 871E560AB3
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 20:57:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 7D8658426B; Sun, 24 Apr 2022 20:47:06 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 24 Apr 2022 22:55:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9993a36f5e1296e86f00376f795de485386bd913
X-Git-Newrev: 3bdfb5f5ad2d43cca491a7bc621800eaa0064c38
X-Patchwork-Hint: ignore
Message-Id: <20220424204706.7D8658426B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libselinux: fix host build
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3bdfb5f5ad2d43cca491a7bc621800eaa0064c38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The following build failure is raised since commit
1745fcde740057951dcc5429f3bfabd103b764a1 because
$(HOST_PKG_PYTHON_DISTUTILS_ENV) contains $(HOST_CONFIGURE_OPTS) and so
will override LDFLAGS passed by libselinux.mk:

/usr/bin/gcc -O2 -I/nvmedata/autobuild/instance-11/output-1/host/include -I../include -D_GNU_SOURCE  -DNO_ANDROID_BACKEND  -L/nvmedata/autobuild/instance-11/output-1/host/lib -Wl,-rpath,/nvmedata/autobuild/instance-11/output-1/host/lib -shared -o libselinux.so.1 avc.lo avc_internal.lo avc_sidtab.lo booleans.lo callbacks.lo canonicalize_context.lo checkAccess.lo check_context.lo checkreqprot.lo compute_av.lo compute_create.lo compute_member.lo compute_relabel.lo compute_user.lo context.lo deny_unknown.lo disable.lo enabled.lo fgetfilecon.lo freecon.lo freeconary.lo fsetfilecon.lo get_context_list.lo get_default_type.lo get_initial_context.lo getenforce.lo getfilecon.lo getpeercon.lo init.lo is_customizable_type.lo label.lo label_db.lo label_file.lo label_media.lo label_support.lo label_x.lo lgetfilecon.lo load_policy.lo lsetfilecon.lo mapping.lo matchmediacon.lo matchpathcon.lo policyvers.lo procattr.lo query_user_context.lo regex.lo reject_unknown.lo selinux_check_securetty_context.l
 o selinux_config.lo selinux_restorecon.lo sestatus.lo setenforce.lo setexecfilecon.lo setfilecon.lo setrans_client.lo seusers.lo sha1.lo stringrep.lo validatetrans.lo   -ldl -Wl,-soname,libselinux.so.1,--version-script=libselinux.map,-z,defs,-z,relro
/usr/bin/ld: regex.lo: in function `regex_writef':
regex.c:(.text+0x7c): undefined reference to `pcre_fullinfo'

To fix this build failure, instead of moving LDFLAGS after
$(HOST_PKG_PYTHON_DISTUTILS_ENV), drop LDFLAGS and add host-pkgconf
dependency to retrieve pcre dependencies as pkg-config is supported
since version 3.2 and
https://github.com/SELinuxProject/selinux/commit/74093beab0c605641ec413be81e31e6b2f55d8d4

Dropping LDFLAGS will also drop -lpthread which doesn't seem to raise
any build failures with test-pkg:

                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: SKIPPED
                            sourcery-arm [6/6]: SKIPPED

Apply the same update to the target variant for consistency.

Fixes:
 - http://autobuild.buildroot.org/results/d16995f0decef9c9bf58cab4fa30f7daab6918fb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libselinux/libselinux.mk | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index 5790e79040..c6be8e638a 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -10,7 +10,8 @@ LIBSELINUX_LICENSE = Public Domain
 LIBSELINUX_LICENSE_FILES = LICENSE
 LIBSELINUX_CPE_ID_VENDOR = selinuxproject
 
-LIBSELINUX_DEPENDENCIES = $(BR2_COREUTILS_HOST_DEPENDENCY) libsepol pcre
+LIBSELINUX_DEPENDENCIES = \
+	$(BR2_COREUTILS_HOST_DEPENDENCY) host-pkgconf libsepol pcre
 
 LIBSELINUX_INSTALL_STAGING = YES
 
@@ -52,8 +53,7 @@ endif # python3
 # when the python binding is enabled.
 LIBSELINUX_MAKE_OPTS += \
 	CFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))" \
-	CPPFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))" \
-	LDFLAGS="$(TARGET_LDFLAGS) -lpcre -lpthread"
+	CPPFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))"
 
 define LIBSELINUX_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
@@ -76,13 +76,12 @@ define LIBSELINUX_INSTALL_TARGET_CMDS
 endef
 
 HOST_LIBSELINUX_DEPENDENCIES = \
-	host-libsepol host-pcre host-swig host-python3
+	host-pkgconf host-libsepol host-pcre host-swig host-python3
 
 HOST_LIBSELINUX_MAKE_OPTS = \
 	$(HOST_CONFIGURE_OPTS) \
 	PREFIX=$(HOST_DIR) \
 	SHLIBDIR=$(HOST_DIR)/lib \
-	LDFLAGS="$(HOST_LDFLAGS) -lpcre -lpthread" \
 	$(HOST_PKG_PYTHON_DISTUTILS_ENV) \
 	PYTHON=python$(PYTHON3_VERSION_MAJOR)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
