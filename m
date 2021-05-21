Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD1C7C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:31:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A00960F02
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:31:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6A00960F02
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E5D740666;
	Tue,  3 Aug 2021 22:31:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LJKYNl60k9H5; Tue,  3 Aug 2021 22:31:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 517404066A;
	Tue,  3 Aug 2021 22:31:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1677E1BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7AD54059F
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2ig6CJYC7DUk for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAA044046D
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 09145810E2; Tue,  3 Aug 2021 21:09:43 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 21 May 2021 11:01:41 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8c7222ad038a4b83e69733353ba3219815ac66d9
X-Git-Newrev: 4b5743e5235ff7d88806305a40476ecb9b408876
X-Patchwork-Hint: ignore
Message-Id: <20210803210943.09145810E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ebtables: fix runtime
 in case of BR2_KERNEL_64_USERLAND_32
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=4b5743e5235ff7d88806305a40476ecb9b408876
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

ebtables 2.0.11 no longer works correctly when userland is 32-bit and the
kernel is 64-bit. This used to work correctly in version 2.0.10-4.

Problem is twofold:
- ebtables itself was broken and needs to be patched
- buildroot needs to pass the correct flag again to indicate when we are in
  this situation

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...s.h-restore-KERNEL_64_USERSPACE_32-checks.patch | 105 +++++++++++++++++++++
 ...c-add-option-enable-kernel-64-userland-32.patch |  51 ++++++++++
 package/ebtables/ebtables.mk                       |   6 ++
 3 files changed, 162 insertions(+)

diff --git a/package/ebtables/0002-ebtables.h-restore-KERNEL_64_USERSPACE_32-checks.patch b/package/ebtables/0002-ebtables.h-restore-KERNEL_64_USERSPACE_32-checks.patch
new file mode 100644
index 0000000000..84b4d0f392
--- /dev/null
+++ b/package/ebtables/0002-ebtables.h-restore-KERNEL_64_USERSPACE_32-checks.patch
@@ -0,0 +1,105 @@
+From 7297a8ef3cab3b0faf1426622ee902a2144e2e89 Mon Sep 17 00:00:00 2001
+From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
+Date: Wed, 24 Mar 2021 11:27:14 +0100
+Subject: [PATCH] ebtables.h: restore KERNEL_64_USERSPACE_32 checks
+
+Commit e6359eedfbf497e52d52451072aea4713ed80a88 replaced the file ebtables.h
+but removed the usage of KERNEL_64_USERSPACE_32. This breaks boards where
+such flag is relevant, with following messages:
+
+[ 6364.971346] kernel msg: ebtables bug: please report to author: Standard target size too big
+
+Unable to update the kernel. Two possible causes:
+1. Multiple ebtables programs were executing simultaneously. The ebtables
+   userspace tool doesn't by default support multiple ebtables programs running
+   concurrently. The ebtables option --concurrent or a tool like flock can be
+   used to support concurrent scripts that update the ebtables kernel tables.
+2. The kernel doesn't support a certain ebtables extension, consider
+   recompiling your kernel or insmod the extension.
+
+Analysis shows that the structure 'ebt_replace' passed from userspace
+ebtables to the kernel, is too small, i.e 80 bytes instead of 120 in case of
+64-bit kernel.
+
+Note that the ebtables build system seems to assume that 'sparc64' is the
+only case where KERNEL_64_USERSPACE_32 is relevant, but this is not true.
+This situation can happen on many architectures, especially in embedded
+systems. For example, an Aarch64 processor with kernel in 64-bit but
+userland build for 32-bit Arm. Or a 64-bit MIPS Octeon III processor, with
+userland running in the 'n32' ABI.
+
+Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
+Upstream-Status: http://patchwork.ozlabs.org/project/netfilter-devel/patch/20210518181730.13436-1-patrickdepinguin@gmail.com/
+---
+ include/linux/netfilter_bridge/ebtables.h | 21 +++++++++++++++++++++
+ 1 file changed, 21 insertions(+)
+
+diff --git a/include/linux/netfilter_bridge/ebtables.h b/include/linux/netfilter_bridge/ebtables.h
+index 5be75f2..3c2b61e 100644
+--- a/include/linux/netfilter_bridge/ebtables.h
++++ b/include/linux/netfilter_bridge/ebtables.h
+@@ -49,12 +49,21 @@ struct ebt_replace {
+ 	/* total size of the entries */
+ 	unsigned int entries_size;
+ 	/* start of the chains */
++#ifdef KERNEL_64_USERSPACE_32
++	uint64_t hook_entry[NF_BR_NUMHOOKS];
++#else
+ 	struct ebt_entries *hook_entry[NF_BR_NUMHOOKS];
++#endif
+ 	/* nr of counters userspace expects back */
+ 	unsigned int num_counters;
+ 	/* where the kernel will put the old counters */
++#ifdef KERNEL_64_USERSPACE_32
++	uint64_t counters;
++	uint64_t entries;
++#else
+ 	struct ebt_counter *counters;
+ 	char *entries;
++#endif
+ };
+ 
+ struct ebt_replace_kernel {
+@@ -129,6 +138,9 @@ struct ebt_entry_match {
+ 	} u;
+ 	/* size of data */
+ 	unsigned int match_size;
++#ifdef KERNEL_64_USERSPACE_32
++	unsigned int pad;
++#endif
+ 	unsigned char data[0] __attribute__ ((aligned (__alignof__(struct ebt_replace))));
+ };
+ 
+@@ -142,6 +154,9 @@ struct ebt_entry_watcher {
+ 	} u;
+ 	/* size of data */
+ 	unsigned int watcher_size;
++#ifdef KERNEL_64_USERSPACE_32
++	unsigned int pad;
++#endif
+ 	unsigned char data[0] __attribute__ ((aligned (__alignof__(struct ebt_replace))));
+ };
+ 
+@@ -155,6 +170,9 @@ struct ebt_entry_target {
+ 	} u;
+ 	/* size of data */
+ 	unsigned int target_size;
++#ifdef KERNEL_64_USERSPACE_32
++	unsigned int pad;
++#endif
+ 	unsigned char data[0] __attribute__ ((aligned (__alignof__(struct ebt_replace))));
+ };
+ 
+@@ -162,6 +180,9 @@ struct ebt_entry_target {
+ struct ebt_standard_target {
+ 	struct ebt_entry_target target;
+ 	int verdict;
++#ifdef KERNEL_64_USERSPACE_32
++	unsigned int pad;
++#endif
+ };
+ 
+ /* one entry */
+-- 
+2.26.2
+
diff --git a/package/ebtables/0003-configure.ac-add-option-enable-kernel-64-userland-32.patch b/package/ebtables/0003-configure.ac-add-option-enable-kernel-64-userland-32.patch
new file mode 100644
index 0000000000..cb57b39569
--- /dev/null
+++ b/package/ebtables/0003-configure.ac-add-option-enable-kernel-64-userland-32.patch
@@ -0,0 +1,51 @@
+From ebf0236270b977a62c522bc32810bc9f8edc72d1 Mon Sep 17 00:00:00 2001
+From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
+Date: Wed, 24 Mar 2021 13:40:14 +0100
+Subject: [PATCH] configure.ac: add option --enable-kernel-64-userland-32
+
+The ebtables build system seems to assume that 'sparc64' is the
+only case where KERNEL_64_USERSPACE_32 is relevant, but this is not true.
+This situation can happen on many architectures, especially in embedded
+systems. For example, an Aarch64 processor with kernel in 64-bit but
+userland build for 32-bit Arm. Or a 64-bit MIPS Octeon III processor, with
+userland running in the 'n32' ABI.
+
+While it is possible to set CFLAGS in the environment when calling the
+configure script, the caller would need to know to not only specify
+KERNEL_64_USERSPACE_32 but also the EBT_MIN_ALIGN value.
+
+Instead, add a configure option. All internal details can then be handled by
+the configure script.
+
+Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
+Upstream-Status: http://patchwork.ozlabs.org/project/netfilter-devel/patch/20210518181730.13436-2-patrickdepinguin@gmail.com/
+---
+ configure.ac | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index c24ede3..3e89c0c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -15,10 +15,17 @@ AS_IF([test "x$LOCKFILE" = x], [LOCKFILE="/var/lib/ebtables/lock"])
+ 
+ regular_CFLAGS="-Wall -Wunused"
+ regular_CPPFLAGS=""
++
+ case "$host" in
+ 	sparc64-*)
+-		regular_CPPFLAGS="$regular_CPPFLAGS -DEBT_MIN_ALIGN=8 -DKERNEL_64_USERSPACE_32";;
++		enable_kernel_64_userland_32=yes ;;
+ esac
++AC_ARG_ENABLE([kernel-64-userland-32],
++    AC_HELP_STRING([--enable-kernel-64-userland-32], [indicate that ebtables will be built as a 32-bit application but run under a 64-bit kernel])
++)
++AS_IF([test "x$enable_kernel_64_userland_32" = xyes],
++    [regular_CPPFLAGS="$regular_CPPFLAGS -DEBT_MIN_ALIGN=8 -DKERNEL_64_USERSPACE_32"]
++)
+ 
+ AC_SUBST([regular_CFLAGS])
+ AC_SUBST([regular_CPPFLAGS])
+-- 
+2.26.2
+
diff --git a/package/ebtables/ebtables.mk b/package/ebtables/ebtables.mk
index 54932334c2..2f9dd5ac4b 100644
--- a/package/ebtables/ebtables.mk
+++ b/package/ebtables/ebtables.mk
@@ -11,6 +11,12 @@ EBTABLES_LICENSE_FILES = COPYING
 EBTABLES_CPE_ID_VENDOR = netfilter
 EBTABLES_SELINUX_MODULES = iptables
 
+# for 0003-configure.ac-add-option-enable-kernel-64-userland-32.patch
+EBTABLES_AUTORECONF = YES
+ifeq ($(BR2_KERNEL_64_USERLAND_32),y)
+EBTABLES_CONF_OPTS += --enable-kernel-64-userland-32
+endif
+
 ifeq ($(BR2_PACKAGE_EBTABLES_UTILS_SAVE),y)
 define EBTABLES_INSTALL_TARGET_UTILS_SAVE
 	$(INSTALL) -m 0755 -D $(@D)/ebtables-save.sh $(TARGET_DIR)/usr/sbin/ebtables-legacy-save
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
