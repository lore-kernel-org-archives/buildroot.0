Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D62CEBF81
	for <buildroot@archiver.kernel.org>; Fri, 27 Sep 2024 08:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C235741BFB;
	Fri, 27 Sep 2024 08:24:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j3AB7o7XJkaN; Fri, 27 Sep 2024 08:24:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93A714142D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93A714142D;
	Fri, 27 Sep 2024 08:24:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 28DC31BF3ED
 for <buildroot@lists.busybox.net>; Fri, 27 Sep 2024 08:24:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 17ECF600D1
 for <buildroot@lists.busybox.net>; Fri, 27 Sep 2024 08:24:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ukUxqCM8m0gs for <buildroot@lists.busybox.net>;
 Fri, 27 Sep 2024 08:24:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4FD2660067
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FD2660067
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4FD2660067
 for <buildroot@buildroot.org>; Fri, 27 Sep 2024 08:24:24 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 606C9440FF2;
 Fri, 27 Sep 2024 11:21:49 +0300 (IDT)
To: buildroot@buildroot.org
Date: Fri, 27 Sep 2024 11:24:10 +0300
Message-ID: <f068d8afdff3043860dcd894bc5076c1b3817ea5.1727425450.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1727425309;
 bh=32O4/TeUJ3bxg35Pglg5b1psQ24VDP/eeIRf+nRk3ug=;
 h=From:To:Cc:Subject:Date:From;
 b=USxL0h5+1Qhap/jcLNYLyaDd6dLDFV/FlMck5Sjmwc6GtkkQi2rNbTthJ0SBLvQKT
 EuvqdTKFw9e42iO6NPBH3HMonoRGJjPb3ZAOT1meidobpuHrEGYE4YKXks/nT5rwlY
 BkQScKbR9J4mvAJ6f5rT4rVRXQwYqDD/H45axAKIrSIRALkgEPmry7TPh/zzkqGwQI
 6ighEycG9eeoPjdBsefr/DIAbxv4nrXSkZI6+RgVoXoxtNm37VDtudRxv4Y2KPXoYn
 XbhnEnxNUio17EU06E8v95+HIe8lvY8vq8VdOi2HdG4aFCZbAL0QmPr5TgkADak7zb
 Gd6zlAC7pDqYA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=USxL0h5+
Subject: [Buildroot] [PATCH] package/ebtables: remove KERNEL_64_USERSPACE_32
 workaround
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This workaround breaks build with gcc 14.

Upstream developers acknowledged[1] the 32/64 compatibility issue more
than 3 years ago, but no proper fix has been applied. Specifically, for
aarch64 we don't even enable BR2_KERNEL_64_USERLAND_32, so this
workaround is not effective there.

The least we can do is make ebtables depend on
!BR2_KERNEL_64_USERLAND_32.

[1] https://lore.kernel.org/all/20210518181730.13436-1-patrickdepinguin@gmail.com/

Fixes:
http://autobuild.buildroot.net/results/680674c2b61209b505efa022a8fd9751ddc5fd47/
http://autobuild.buildroot.net/results/60f8f5f087111ec3f300dc7979363de5a9f64f08/

Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .checkpackageignore                           |   2 -
 ...estore-KERNEL_64_USERSPACE_32-checks.patch | 105 ------------------
 ...-option-enable-kernel-64-userland-32.patch |  51 ---------
 package/ebtables/Config.in                    |   2 +
 package/ebtables/ebtables.mk                  |   6 -
 5 files changed, 2 insertions(+), 164 deletions(-)
 delete mode 100644 package/ebtables/0002-ebtables.h-restore-KERNEL_64_USERSPACE_32-checks.patch
 delete mode 100644 package/ebtables/0003-configure.ac-add-option-enable-kernel-64-userland-32.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 0cc742bf0960..aa4418a03019 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -451,8 +451,6 @@ package/dvdrw-tools/0002-Include-sysmacros.h-to-compile-with-newer-gcc.patch lib
 package/earlyoom/0001-main.c-fix-build-with-kernel-4.3.patch lib_patch.Upstream
 package/earlyoom/S02earlyoom Shellcheck lib_sysv.Indent
 package/ebtables/0001-replace-ebtables-save-perl-script-with-bash.patch lib_patch.Upstream
-package/ebtables/0002-ebtables.h-restore-KERNEL_64_USERSPACE_32-checks.patch lib_patch.Upstream
-package/ebtables/0003-configure.ac-add-option-enable-kernel-64-userland-32.patch lib_patch.Upstream
 package/ecryptfs-utils/0001-musl.patch lib_patch.Upstream
 package/ecryptfs-utils/0002-openssl110.patch lib_patch.Upstream
 package/ecryptfs-utils/0003-fix-parallel-build-issue.patch lib_patch.Upstream
diff --git a/package/ebtables/0002-ebtables.h-restore-KERNEL_64_USERSPACE_32-checks.patch b/package/ebtables/0002-ebtables.h-restore-KERNEL_64_USERSPACE_32-checks.patch
deleted file mode 100644
index 84b4d0f392db..000000000000
--- a/package/ebtables/0002-ebtables.h-restore-KERNEL_64_USERSPACE_32-checks.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-From 7297a8ef3cab3b0faf1426622ee902a2144e2e89 Mon Sep 17 00:00:00 2001
-From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
-Date: Wed, 24 Mar 2021 11:27:14 +0100
-Subject: [PATCH] ebtables.h: restore KERNEL_64_USERSPACE_32 checks
-
-Commit e6359eedfbf497e52d52451072aea4713ed80a88 replaced the file ebtables.h
-but removed the usage of KERNEL_64_USERSPACE_32. This breaks boards where
-such flag is relevant, with following messages:
-
-[ 6364.971346] kernel msg: ebtables bug: please report to author: Standard target size too big
-
-Unable to update the kernel. Two possible causes:
-1. Multiple ebtables programs were executing simultaneously. The ebtables
-   userspace tool doesn't by default support multiple ebtables programs running
-   concurrently. The ebtables option --concurrent or a tool like flock can be
-   used to support concurrent scripts that update the ebtables kernel tables.
-2. The kernel doesn't support a certain ebtables extension, consider
-   recompiling your kernel or insmod the extension.
-
-Analysis shows that the structure 'ebt_replace' passed from userspace
-ebtables to the kernel, is too small, i.e 80 bytes instead of 120 in case of
-64-bit kernel.
-
-Note that the ebtables build system seems to assume that 'sparc64' is the
-only case where KERNEL_64_USERSPACE_32 is relevant, but this is not true.
-This situation can happen on many architectures, especially in embedded
-systems. For example, an Aarch64 processor with kernel in 64-bit but
-userland build for 32-bit Arm. Or a 64-bit MIPS Octeon III processor, with
-userland running in the 'n32' ABI.
-
-Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
-Upstream-Status: http://patchwork.ozlabs.org/project/netfilter-devel/patch/20210518181730.13436-1-patrickdepinguin@gmail.com/
----
- include/linux/netfilter_bridge/ebtables.h | 21 +++++++++++++++++++++
- 1 file changed, 21 insertions(+)
-
-diff --git a/include/linux/netfilter_bridge/ebtables.h b/include/linux/netfilter_bridge/ebtables.h
-index 5be75f2..3c2b61e 100644
---- a/include/linux/netfilter_bridge/ebtables.h
-+++ b/include/linux/netfilter_bridge/ebtables.h
-@@ -49,12 +49,21 @@ struct ebt_replace {
- 	/* total size of the entries */
- 	unsigned int entries_size;
- 	/* start of the chains */
-+#ifdef KERNEL_64_USERSPACE_32
-+	uint64_t hook_entry[NF_BR_NUMHOOKS];
-+#else
- 	struct ebt_entries *hook_entry[NF_BR_NUMHOOKS];
-+#endif
- 	/* nr of counters userspace expects back */
- 	unsigned int num_counters;
- 	/* where the kernel will put the old counters */
-+#ifdef KERNEL_64_USERSPACE_32
-+	uint64_t counters;
-+	uint64_t entries;
-+#else
- 	struct ebt_counter *counters;
- 	char *entries;
-+#endif
- };
- 
- struct ebt_replace_kernel {
-@@ -129,6 +138,9 @@ struct ebt_entry_match {
- 	} u;
- 	/* size of data */
- 	unsigned int match_size;
-+#ifdef KERNEL_64_USERSPACE_32
-+	unsigned int pad;
-+#endif
- 	unsigned char data[0] __attribute__ ((aligned (__alignof__(struct ebt_replace))));
- };
- 
-@@ -142,6 +154,9 @@ struct ebt_entry_watcher {
- 	} u;
- 	/* size of data */
- 	unsigned int watcher_size;
-+#ifdef KERNEL_64_USERSPACE_32
-+	unsigned int pad;
-+#endif
- 	unsigned char data[0] __attribute__ ((aligned (__alignof__(struct ebt_replace))));
- };
- 
-@@ -155,6 +170,9 @@ struct ebt_entry_target {
- 	} u;
- 	/* size of data */
- 	unsigned int target_size;
-+#ifdef KERNEL_64_USERSPACE_32
-+	unsigned int pad;
-+#endif
- 	unsigned char data[0] __attribute__ ((aligned (__alignof__(struct ebt_replace))));
- };
- 
-@@ -162,6 +180,9 @@ struct ebt_entry_target {
- struct ebt_standard_target {
- 	struct ebt_entry_target target;
- 	int verdict;
-+#ifdef KERNEL_64_USERSPACE_32
-+	unsigned int pad;
-+#endif
- };
- 
- /* one entry */
--- 
-2.26.2
-
diff --git a/package/ebtables/0003-configure.ac-add-option-enable-kernel-64-userland-32.patch b/package/ebtables/0003-configure.ac-add-option-enable-kernel-64-userland-32.patch
deleted file mode 100644
index cb57b395690a..000000000000
--- a/package/ebtables/0003-configure.ac-add-option-enable-kernel-64-userland-32.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From ebf0236270b977a62c522bc32810bc9f8edc72d1 Mon Sep 17 00:00:00 2001
-From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
-Date: Wed, 24 Mar 2021 13:40:14 +0100
-Subject: [PATCH] configure.ac: add option --enable-kernel-64-userland-32
-
-The ebtables build system seems to assume that 'sparc64' is the
-only case where KERNEL_64_USERSPACE_32 is relevant, but this is not true.
-This situation can happen on many architectures, especially in embedded
-systems. For example, an Aarch64 processor with kernel in 64-bit but
-userland build for 32-bit Arm. Or a 64-bit MIPS Octeon III processor, with
-userland running in the 'n32' ABI.
-
-While it is possible to set CFLAGS in the environment when calling the
-configure script, the caller would need to know to not only specify
-KERNEL_64_USERSPACE_32 but also the EBT_MIN_ALIGN value.
-
-Instead, add a configure option. All internal details can then be handled by
-the configure script.
-
-Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
-Upstream-Status: http://patchwork.ozlabs.org/project/netfilter-devel/patch/20210518181730.13436-2-patrickdepinguin@gmail.com/
----
- configure.ac | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index c24ede3..3e89c0c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -15,10 +15,17 @@ AS_IF([test "x$LOCKFILE" = x], [LOCKFILE="/var/lib/ebtables/lock"])
- 
- regular_CFLAGS="-Wall -Wunused"
- regular_CPPFLAGS=""
-+
- case "$host" in
- 	sparc64-*)
--		regular_CPPFLAGS="$regular_CPPFLAGS -DEBT_MIN_ALIGN=8 -DKERNEL_64_USERSPACE_32";;
-+		enable_kernel_64_userland_32=yes ;;
- esac
-+AC_ARG_ENABLE([kernel-64-userland-32],
-+    AC_HELP_STRING([--enable-kernel-64-userland-32], [indicate that ebtables will be built as a 32-bit application but run under a 64-bit kernel])
-+)
-+AS_IF([test "x$enable_kernel_64_userland_32" = xyes],
-+    [regular_CPPFLAGS="$regular_CPPFLAGS -DEBT_MIN_ALIGN=8 -DKERNEL_64_USERSPACE_32"]
-+)
- 
- AC_SUBST([regular_CFLAGS])
- AC_SUBST([regular_CPPFLAGS])
--- 
-2.26.2
-
diff --git a/package/ebtables/Config.in b/package/ebtables/Config.in
index 703e55a3c3c8..ce5f67bc61f9 100644
--- a/package/ebtables/Config.in
+++ b/package/ebtables/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_EBTABLES
 	bool "ebtables"
 	depends on BR2_USE_MMU # fork()
+	# https://lore.kernel.org/all/20210518181730.13436-1-patrickdepinguin@gmail.com/
+	depends on !BR2_KERNEL_64_USERLAND_32
 	help
 	  Ethernet bridge frame table administration
 
diff --git a/package/ebtables/ebtables.mk b/package/ebtables/ebtables.mk
index 46c22dde9baf..09a9f4ba7dbb 100644
--- a/package/ebtables/ebtables.mk
+++ b/package/ebtables/ebtables.mk
@@ -11,12 +11,6 @@ EBTABLES_LICENSE_FILES = COPYING
 EBTABLES_CPE_ID_VENDOR = netfilter
 EBTABLES_SELINUX_MODULES = iptables
 
-# for 0003-configure.ac-add-option-enable-kernel-64-userland-32.patch
-EBTABLES_AUTORECONF = YES
-ifeq ($(BR2_KERNEL_64_USERLAND_32),y)
-EBTABLES_CONF_OPTS += --enable-kernel-64-userland-32
-endif
-
 ifeq ($(BR2_PACKAGE_EBTABLES_UTILS_SAVE),y)
 define EBTABLES_INSTALL_TARGET_UTILS_SAVE
 	$(INSTALL) -m 0755 -D $(@D)/ebtables-save.sh $(TARGET_DIR)/usr/sbin/ebtables-legacy-save
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
