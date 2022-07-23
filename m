Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE95C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 17:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F44460FE0;
	Sat, 23 Jul 2022 17:16:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F44460FE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R33-x-AswI_K; Sat, 23 Jul 2022 17:16:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7C4360FD7;
	Sat, 23 Jul 2022 17:16:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7C4360FD7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3428B1BF5DE
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 17:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E8AA60F9F
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 17:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E8AA60F9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ln2gWeeMyFvH for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 17:16:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E93FA60C00
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 17:16:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E93FA60C00
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A3FA084958; Sat, 23 Jul 2022 17:02:31 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 19:15:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a1e4354d5d0ced7fe0de4c09b78ba5467cc4bcf6
X-Git-Newrev: 67d87bf7d255cd05f84fab3e3625e073b5bfccf8
X-Patchwork-Hint: ignore
Message-Id: <20220723170231.A3FA084958@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libunwind: Upstep to v1.6.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=67d87bf7d255cd05f84fab3e3625e073b5bfccf8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This also removes an old patch to fix atomic_ops for ARM pre-ARMv6.
atomic_ops support has been replaced with C11 atomics, so the patch
did not apply anymore, and should be unnecessary.

This does mean compilation will fail with systems that don't support
C11 atomics, i.e. GCC versions older than 4.9

Signed-off-by: Frederik Van Bogaert <frederik.vanbogaert@mind.be>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch | 56 ----------------------
 package/libunwind/Config.in                        |  6 ++-
 package/libunwind/libunwind.hash                   |  2 +-
 package/libunwind/libunwind.mk                     |  6 +--
 4 files changed, 6 insertions(+), 64 deletions(-)

diff --git a/package/libunwind/0001-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch b/package/libunwind/0001-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch
deleted file mode 100644
index 2a37ed7784..0000000000
--- a/package/libunwind/0001-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 24484e80b3e329c9edee1995e102f8612eedb79c Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 13 May 2014 23:32:27 +0200
-Subject: [PATCH] Add AO_REQUIRE_CAS to fix build on ARM < v6
-
-ARM earlier than ARMv6, such as ARMv4 and ARMv5 do not provide
-optimize atomic operations in libatomic_ops. Since libunwind is using
-such operations, it should define AO_REQUIRE_CAS before including
-<atomic_ops.h> so that libatomic_ops knows it should use emulated
-atomic operations instead (even though they are obviously a lot more
-expensive).
-
-Also, while real atomic operations are all inline functions and
-therefore linking against libatomic_ops was not required, the emulated
-atomic operations actually require linking against libatomic_ops, so
-the commented AC_CHECK_LIB test in acinclude.m4 is uncommented to make
-sure we link against libatomic_ops.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- acinclude.m4          | 8 +-------
- include/libunwind_i.h | 1 +
- 2 files changed, 2 insertions(+), 7 deletions(-)
-
-diff --git a/acinclude.m4 b/acinclude.m4
-index 497f7c2..9c15af1 100644
---- a/acinclude.m4
-+++ b/acinclude.m4
-@@ -22,11 +22,5 @@ fi])
- AC_DEFUN([CHECK_ATOMIC_OPS],
- [dnl Check whether the system has the atomic_ops package installed.
-   AC_CHECK_HEADERS(atomic_ops.h)
--#
--# Don't link against libatomic_ops for now.  We don't want libunwind
--# to depend on libatomic_ops.so.  Fortunately, none of the platforms
--# we care about so far need libatomic_ops.a (everything is done via
--# inline macros).
--#
--#  AC_CHECK_LIB(atomic_ops, main)
-+  AC_CHECK_LIB(atomic_ops, main)
- ])
-diff --git a/include/libunwind_i.h b/include/libunwind_i.h
-index 23f615e..deabdfd 100644
---- a/include/libunwind_i.h
-+++ b/include/libunwind_i.h
-@@ -95,6 +95,7 @@ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
- 	(pthread_mutex_unlock != NULL ? pthread_mutex_unlock (l) : 0)
- 
- #ifdef HAVE_ATOMIC_OPS_H
-+# define AO_REQUIRE_CAS
- # include <atomic_ops.h>
- static inline int
- cmpxchg_ptr (void *addr, void *old, void *new)
--- 
-1.9.2
-
diff --git a/package/libunwind/Config.in b/package/libunwind/Config.in
index 5284b5864c..dfd0df30fa 100644
--- a/package/libunwind/Config.in
+++ b/package/libunwind/Config.in
@@ -23,6 +23,7 @@ config BR2_PACKAGE_LIBUNWIND
 	bool "libunwind"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11 atomics
 	# forcefully links against libgcc_s, only available in dynamic
 	# linking configurations
 	depends on !BR2_STATIC_LIBS
@@ -31,6 +32,7 @@ config BR2_PACKAGE_LIBUNWIND
 
 	  http://www.nongnu.org/libunwind/index.html
 
-comment "libunwind needs a toolchain w/ threads, dynamic library"
+comment "libunwind needs a toolchain w/ threads, dynamic library, gcc >= 4.9"
 	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/libunwind/libunwind.hash b/package/libunwind/libunwind.hash
index de00c59988..1d532a7830 100644
--- a/package/libunwind/libunwind.hash
+++ b/package/libunwind/libunwind.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  90337653d92d4a13de590781371c604f9031cdb50520366aa1e3a91e1efb1017  libunwind-1.5.0.tar.gz
+sha256  4a6aec666991fb45d0889c44aede8ad6eb108071c3554fcdff671f9c94794976  libunwind-1.6.2.tar.gz
 
 # Hash for license file
 sha256  6a0dbbdaec2b3136b7bf045586f4212bdf74e7af688bf9dfe9154607cf5ec156  COPYING
diff --git a/package/libunwind/libunwind.mk b/package/libunwind/libunwind.mk
index aaa33464a9..9cd587d0a3 100644
--- a/package/libunwind/libunwind.mk
+++ b/package/libunwind/libunwind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUNWIND_VERSION = 1.5.0
+LIBUNWIND_VERSION = 1.6.2
 LIBUNWIND_SITE = http://download.savannah.gnu.org/releases/libunwind
 LIBUNWIND_INSTALL_STAGING = YES
 LIBUNWIND_LICENSE_FILES = COPYING
@@ -16,8 +16,4 @@ LIBUNWIND_CONF_OPTS = \
 	--disable-tests \
 	$(if $(BR2_INSTALL_LIBSTDCPP),--enable-cxx-exceptions,--disable-cxx-exceptions)
 
-ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
-LIBUNWIND_DEPENDENCIES += libatomic_ops
-endif
-
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
