Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A86D743D9
	for <buildroot@archiver.kernel.org>; Wed, 20 Nov 2024 21:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 332566FA29;
	Wed, 20 Nov 2024 21:04:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WnXkZsiH97Tw; Wed, 20 Nov 2024 21:04:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CD7E6FA28
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CD7E6FA28;
	Wed, 20 Nov 2024 21:04:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 48EE927D6
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 21:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FEBF41815
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 21:04:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OpA74yNEVS5S for <buildroot@buildroot.org>;
 Wed, 20 Nov 2024 21:04:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FACF4060E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8FACF4060E
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 21:04:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7ADDE86506; Wed, 20 Nov 2024 21:04:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 20 Nov 2024 21:52:11 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: dfb9f3412ad6dffbed03a50790d2c005915909b6
X-Git-Newrev: 96706bc7fe013b1f3f62199c4a63587282701322
X-Patchwork-Hint: ignore
Message-Id: <20241120210408.7ADDE86506@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/ebtables: remove
 KERNEL_64_USERSPACE_32 workaround
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=96706bc7fe013b1f3f62199c4a63587282701322
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c5d6cde7b627f0f09320c0a431e186d78d6f931a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |   2 -
 ...s.h-restore-KERNEL_64_USERSPACE_32-checks.patch | 105 ---------------------
 ...c-add-option-enable-kernel-64-userland-32.patch |  51 ----------
 package/ebtables/Config.in                         |   2 +
 package/ebtables/ebtables.mk                       |   6 --
 package/libvirt/Config.in                          |   1 +
 6 files changed, 3 insertions(+), 164 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index b620280e16..78f05a4739 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -329,8 +329,6 @@ package/dvdrw-tools/0002-Include-sysmacros.h-to-compile-with-newer-gcc.patch Ups
 package/earlyoom/0001-main.c-fix-build-with-kernel-4.3.patch Upstream
 package/earlyoom/S02earlyoom Indent Shellcheck
 package/ebtables/0001-replace-ebtables-save-perl-script-with-bash.patch Upstream
-package/ebtables/0002-ebtables.h-restore-KERNEL_64_USERSPACE_32-checks.patch Upstream
-package/ebtables/0003-configure.ac-add-option-enable-kernel-64-userland-32.patch Upstream
 package/ecryptfs-utils/0001-musl.patch Upstream
 package/ecryptfs-utils/0002-openssl110.patch Upstream
 package/ecryptfs-utils/0003-fix-parallel-build-issue.patch Upstream
diff --git a/package/ebtables/0002-ebtables.h-restore-KERNEL_64_USERSPACE_32-checks.patch b/package/ebtables/0002-ebtables.h-restore-KERNEL_64_USERSPACE_32-checks.patch
deleted file mode 100644
index 84b4d0f392..0000000000
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
index cb57b39569..0000000000
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
index 703e55a3c3..ce5f67bc61 100644
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
index 46c22dde9b..09a9f4ba7d 100644
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
diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
index 3f4fc70e62..6e4de43f73 100644
--- a/package/libvirt/Config.in
+++ b/package/libvirt/Config.in
@@ -45,6 +45,7 @@ config BR2_PACKAGE_LIBVIRT_DAEMON
 	bool "libvirtd"
 	default y
 	depends on BR2_INSTALL_LIBSTDCPP # nmap
+	depends on !BR2_KERNEL_64_USERLAND_32 # ebtables
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	select BR2_PACKAGE_DNSMASQ
 	select BR2_PACKAGE_EBTABLES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
