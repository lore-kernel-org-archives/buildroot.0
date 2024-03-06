Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59211C5475B
	for <buildroot@archiver.kernel.org>; Wed,  6 Mar 2024 10:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3BC8405F1;
	Wed,  6 Mar 2024 10:13:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3d9uI92B-stf; Wed,  6 Mar 2024 10:13:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A50EA405DB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A50EA405DB;
	Wed,  6 Mar 2024 10:13:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 64FF41BF299
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 10:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5ECD160869
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 10:13:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ua3Qv0pUp8Rh for <buildroot@lists.busybox.net>;
 Wed,  6 Mar 2024 10:13:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 187AD60856
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 187AD60856
 for <buildroot@buildroot.org>; Wed,  6 Mar 2024 10:13:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0009788165; Wed,  6 Mar 2024 10:13:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Mar 2024 11:12:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 85acd9b5b9b46808749d1618b26789c782cc81a0
X-Git-Newrev: 0ac2d5a41ad776b493e6b0c44c760968a28ec81e
X-Patchwork-Hint: ignore
Message-Id: <20240306101333.0009788165@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/policycoreutils: fix build with
 BR2_TIME_BITS_64
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

commit: https://git.buildroot.net/buildroot/commit/?id=0ac2d5a41ad776b493e6b0c44c760968a28ec81e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Do not remove _FILE_OFFSET_BITS=64 from CFLAGS and CPPFLAGS to avoid the
following build failure with BR2_TIME_BITS_64 raised since commit
3c427c64726560ea1743282a3fdb78f5b28692eb:

In file included from /home/fabrice/buildroot/output/host/mips-buildroot-linux-gnu/sysroot/usr/include/features.h:394,
                 from /home/fabrice/buildroot/output/host/mips-buildroot-linux-gnu/sysroot/usr/include/errno.h:25,
                 from pp.c:20:
/home/fabrice/buildroot/output/host/mips-buildroot-linux-gnu/sysroot/usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
   26 | #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
      |     ^~~~~

Indeed, this LFS workaround was there since the addition of the package
in commit cb328f77f8f07bfd89d6b69385c941a7b281732b  and is only needed
to fix a build failure with the old codesourcery-arm toolchain from 2014
which uses glibc < 2.23. as glibc 2.23 was released in February 2016:
https://sourceware.org/glibc/wiki/Release/2.23, drop this workaround as
already done for libselinux in commit
c1fa9bc2f7a4e5481edf4fce5c03dd45862fe72c. A follow-up patch will also
drop codesourcery-arm toolchain.

Fixes: 3c427c64726560ea1743282a3fdb78f5b28692eb
 - No autobuilder failures (yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/policycoreutils/policycoreutils.mk | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
index 61d91066d4..0e639760fa 100644
--- a/package/policycoreutils/policycoreutils.mk
+++ b/package/policycoreutils/policycoreutils.mk
@@ -11,7 +11,7 @@ POLICYCOREUTILS_LICENSE_FILES = LICENSE
 POLICYCOREUTILS_CPE_ID_VENDOR = selinuxproject
 
 POLICYCOREUTILS_DEPENDENCIES = libsemanage libcap-ng $(TARGET_NLS_DEPENDENCIES)
-POLICYCOREUTILS_MAKE_OPTS = LDLIBS=$(TARGET_NLS_LIBS)
+POLICYCOREUTILS_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) LDLIBS=$(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 POLICYCOREUTILS_DEPENDENCIES += linux-pam
@@ -28,14 +28,6 @@ ifeq ($(BR2_PACKAGE_LINUX_PAM)$(BR2_PACKAGE_AUDIT),yy)
 POLICYCOREUTILS_MAKE_OPTS += LSPP_PRIV=y
 endif
 
-# Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
-# large file support.
-# See https://bugzilla.redhat.com/show_bug.cgi?id=574992 for more information
-POLICYCOREUTILS_MAKE_OPTS += \
-	$(TARGET_CONFIGURE_OPTS) \
-	CFLAGS="$(TARGET_CFLAGS) -U_FILE_OFFSET_BITS" \
-	CPPFLAGS="$(TARGET_CPPFLAGS) -U_FILE_OFFSET_BITS"
-
 POLICYCOREUTILS_MAKE_DIRS = \
 	load_policy newrole run_init \
 	secon semodule sestatus setfiles \
@@ -59,14 +51,9 @@ endef
 
 HOST_POLICYCOREUTILS_DEPENDENCIES = host-libsemanage
 
-# Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
-# large file support.
-# See https://bugzilla.redhat.com/show_bug.cgi?id=574992 for more information
-# We also need to pass PREFIX because it defaults to $(DESTDIR)/usr
+# We need to pass PREFIX because it defaults to $(DESTDIR)/usr
 HOST_POLICYCOREUTILS_MAKE_OPTS = \
 	$(HOST_CONFIGURE_OPTS) \
-	CFLAGS="$(HOST_CFLAGS) -U_FILE_OFFSET_BITS" \
-	CPPFLAGS="$(HOST_CPPFLAGS) -U_FILE_OFFSET_BITS" \
 	PREFIX=$(HOST_DIR) \
 	ETCDIR=$(HOST_DIR)/etc \
 	SBINDIR=$(HOST_DIR)/sbin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
