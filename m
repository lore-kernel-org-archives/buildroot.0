Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08386C3DA61
	for <buildroot@archiver.kernel.org>; Wed, 24 Jul 2024 07:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87F3B80AE3;
	Wed, 24 Jul 2024 07:19:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1E0_YRHrz_9g; Wed, 24 Jul 2024 07:19:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00FC381359
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00FC381359;
	Wed, 24 Jul 2024 07:19:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3AB3C1BF280
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 07:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2689981353
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 07:19:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i8uWsGlkNBwp for <buildroot@lists.busybox.net>;
 Wed, 24 Jul 2024 07:19:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7B8DD80CD3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B8DD80CD3
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7B8DD80CD3
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 07:19:15 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4266edee10cso42958135e9.2
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 00:19:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721805553; x=1722410353;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hpj1rlOMRdG3v7wKfbJW6qyimEVnx17l+YMFtCO+Yv0=;
 b=HeGbLzWcbp0wahvQ9PFe8Z7oWhE3PAwX5i1VUlJz6uwbcTLsQ8ENfMSA367TMKJ38A
 LC+IpzcgzTNxxhJpud3KJDXObGQTjlg04wiQY7GSe5CPlgKDaQF+SJ+BAFzzbZ/Lm+nE
 Kvt8meO4zgU6jJyInWaO7SRqz50uK6B/k8AGW+DnKZxXyNcQyw+Yd21AAfYUG8ocTD/u
 s7ditVHNlhusLNeWtjYI81IvzuXJP4vrtzAXMK0Sz4PhIA/cCynfEAOEIoR3wxWk98dE
 Jp5icawuzeVd8/PnZYiFJGUkPPjAev+yuH9WDXJYpMLu0zlhtkSIQp7IEJiVZMQB7HRj
 zSEg==
X-Gm-Message-State: AOJu0YyvOkO0/ypI8M1jnq8Z6N+eslnUKPnYXPU9C8XFsUSEhKFet2JC
 ynfyu7XbKhOPIQb+lGRkFbDmntFwOfXptSaebBC9PWQztMTm9TnD+NOPYw==
X-Google-Smtp-Source: AGHT+IGR+qopjKt+7MHYfdNXWEmqY/nNfrlj6CG6VaZsMAC7TiDdPd7yV3NjAbNA/ZLso1jbPX3Hsw==
X-Received: by 2002:a05:600c:1d14:b0:426:60bc:8f4e with SMTP id
 5b1f17b1804b1-427f954225dmr8009155e9.5.1721805552773; 
 Wed, 24 Jul 2024 00:19:12 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427facf9a83sm7381605e9.1.2024.07.24.00.19.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 00:19:11 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 24 Jul 2024 09:19:04 +0200
Message-ID: <20240724071904.1397662-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721805553; x=1722410353; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hpj1rlOMRdG3v7wKfbJW6qyimEVnx17l+YMFtCO+Yv0=;
 b=Ww/WjpKVcmaWVvPteBRM5V8+YeUdA9CaIG5sTmh+1dcePleJpZ4IFQxiNczUSfmBMu
 iv03ZJTZdhhrydDFs7c8B+5gHpnJu4XOiqDRAW0HrV0l3FWC7aQN7BBzSMFjA0PShq1W
 V/51l+uZIhJ7GO54UzFS26gdb488ebmMZU3IBkSOlQOYkQqNiPUvy2ameHQj3/E0k2vF
 7XyhFGlHbYoMOwYSCLfqtmWI6YqNxZat/MYEcOgqiJruRSBi8nI3Y+nQl7hrWpIXVXVI
 P8SNg0oliw4zPkf2NDjy9OKbzdV0TSjkra+ZnEdBq62wPQMbPbT7ASEGgu7Mk+2XQHO5
 yd5A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Ww/WjpKV
Subject: [Buildroot] [PATCH 1/1] package/ebtables: fix build with gcc >= 14
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop second patch which has not been accepted by upstream and raises the
following build failure with gcc >= 14:

communication.c: In function 'ebt_deliver_table':
communication.c:252:26: error: passing argument 1 of 'free' makes pointer from integer without a cast [-Wint-conversion]
  252 |                 free(repl->entries);
      |                      ~~~~^~~~~~~~~
      |                          |
      |                          uint64_t {aka long unsigned int}
In file included from communication.c:19:
/home/autobuild/autobuild/instance-11/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/stdlib.h:687:25: note: expected 'void *' but argument is of type 'uint64_t' {aka 'long unsigned int'}
  687 | extern void free (void *__ptr) __THROW;
      |                   ~~~~~~^~~~~
communication.c: In function 'retrieve_from_file':
communication.c:653:31: error: assignment to 'uint64_t' {aka 'long unsigned int'} from 'void *' makes integer from pointer without a cast [-Wint-conversion]
  653 |                 repl->entries = NULL;
      |                               ^
communication.c: In function 'ebt_get_table':
communication.c:730:26: error: assignment to 'struct ebt_counter *' from 'uint64_t' {aka 'long unsigned int'} makes pointer from integer without a cast [-Wint-conversion]
  730 |         u_repl->counters = repl.counters;
      |                          ^
communication.c:770:18: error: passing argument 1 of 'free' makes pointer from integer without a cast [-Wint-conversion]
  770 |         free(repl.entries);
      |              ~~~~^~~~~~~~
      |                  |
      |                  uint64_t {aka long unsigned int}
/home/autobuild/autobuild/instance-11/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/stdlib.h:687:25: note: expected 'void *' but argument is of type 'uint64_t' {aka 'long unsigned int'}
  687 | extern void free (void *__ptr) __THROW;
      |                   ~~~~~~^~~~~

Those build failures are raised because ebt_replace is patched to change
type of entries and counters depending on the value of
KERNEL_64_USERSPACE_32. However, this patch is broken as it doesn't
update all the source code to avoid calling free on uint64_t or setting
NULL to uint64_t. More dramatically, ebt_u_replace structure has not
been patched either so uint64_t is copied into struct ebt_counter *.

Fixing all this mess seems complicated especially given the fact that
upstream rejected second and third patches.

So to fix this build failure:
 - always set --disable-kernel-64-userland-32 (even on sparc64 where
   the build will fail due to the incorrect "sparc_cast" remaining in
   the source code)
 - add a dependency on !BR2_KERNEL_64_USERLAND_32. This will disable
   ebtables only with BR2_MIPS_NABI32 as this is the only architecture
   that sets BR2_KERNEL_64_USERLAND_32 and so the only architecture
   (with sparc64) that was using this "broken" patch

While at it, fix Upstream tag on patches

Fixes: 4b5743e5235ff7d88806305a40476ecb9b408876
 - http://autobuild.buildroot.org/results/ae9b07a88a43b381bd8ce5dca9f434f63e1dcd49
 - http://autobuild.buildroot.org/results/be20febfb9e21bee5c22138e6a34016079b7eab8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |   3 -
 ...-ebtables-save-perl-script-with-bash.patch |   3 +-
 ...option-enable-kernel-64-userland-32.patch} |   7 +-
 ...estore-KERNEL_64_USERSPACE_32-checks.patch | 105 ------------------
 package/ebtables/Config.in                    |   1 +
 package/ebtables/ebtables.mk                  |   7 +-
 6 files changed, 9 insertions(+), 117 deletions(-)
 rename package/ebtables/{0003-configure.ac-add-option-enable-kernel-64-userland-32.patch => 0002-configure.ac-add-option-enable-kernel-64-userland-32.patch} (85%)
 delete mode 100644 package/ebtables/0002-ebtables.h-restore-KERNEL_64_USERSPACE_32-checks.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 5a2d96a274..1372ae1f2b 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -476,9 +476,6 @@ package/dvdrw-tools/0001-limits.h.patch lib_patch.Upstream
 package/dvdrw-tools/0002-Include-sysmacros.h-to-compile-with-newer-gcc.patch lib_patch.Upstream
 package/earlyoom/0001-main.c-fix-build-with-kernel-4.3.patch lib_patch.Upstream
 package/earlyoom/S02earlyoom Shellcheck lib_sysv.Indent
-package/ebtables/0001-replace-ebtables-save-perl-script-with-bash.patch lib_patch.Upstream
-package/ebtables/0002-ebtables.h-restore-KERNEL_64_USERSPACE_32-checks.patch lib_patch.Upstream
-package/ebtables/0003-configure.ac-add-option-enable-kernel-64-userland-32.patch lib_patch.Upstream
 package/ecryptfs-utils/0001-musl.patch lib_patch.Upstream
 package/ecryptfs-utils/0002-openssl110.patch lib_patch.Upstream
 package/ecryptfs-utils/0003-fix-parallel-build-issue.patch lib_patch.Upstream
diff --git a/package/ebtables/0001-replace-ebtables-save-perl-script-with-bash.patch b/package/ebtables/0001-replace-ebtables-save-perl-script-with-bash.patch
index 525e8a28b5..3cb3c3b6e4 100644
--- a/package/ebtables/0001-replace-ebtables-save-perl-script-with-bash.patch
+++ b/package/ebtables/0001-replace-ebtables-save-perl-script-with-bash.patch
@@ -12,8 +12,7 @@ already.
   https://bugzilla.redhat.com/show_bug.cgi?id=746040
   http://pkgs.fedoraproject.org/cgit/rpms/ebtables.git/tree/ebtables-save
 
-Upstream:
-https://github.com/openembedded/meta-openembedded/commit/7f723007364ba79de05447671e83d4eefb3097dc
+Upstream: https://github.com/openembedded/meta-openembedded/commit/7f723007364ba79de05447671e83d4eefb3097dc
 
 Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 [ryanbarnett3@gmail.com:
diff --git a/package/ebtables/0003-configure.ac-add-option-enable-kernel-64-userland-32.patch b/package/ebtables/0002-configure.ac-add-option-enable-kernel-64-userland-32.patch
similarity index 85%
rename from package/ebtables/0003-configure.ac-add-option-enable-kernel-64-userland-32.patch
rename to package/ebtables/0002-configure.ac-add-option-enable-kernel-64-userland-32.patch
index cb57b39569..7e481606e7 100644
--- a/package/ebtables/0003-configure.ac-add-option-enable-kernel-64-userland-32.patch
+++ b/package/ebtables/0002-configure.ac-add-option-enable-kernel-64-userland-32.patch
@@ -18,7 +18,9 @@ Instead, add a configure option. All internal details can then be handled by
 the configure script.
 
 Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
-Upstream-Status: http://patchwork.ozlabs.org/project/netfilter-devel/patch/20210518181730.13436-2-patrickdepinguin@gmail.com/
+Upstream: http://patchwork.ozlabs.org/project/netfilter-devel/patch/20210518181730.13436-2-patrickdepinguin@gmail.com/
+[Fabrice: Don't force kernel-64-userland-32 with sparc64]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  configure.ac | 9 ++++++++-
  1 file changed, 8 insertions(+), 1 deletion(-)
@@ -27,7 +29,7 @@ diff --git a/configure.ac b/configure.ac
 index c24ede3..3e89c0c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -15,10 +15,17 @@ AS_IF([test "x$LOCKFILE" = x], [LOCKFILE="/var/lib/ebtables/lock"])
+@@ -15,10 +15,16 @@ AS_IF([test "x$LOCKFILE" = x], [LOCKFILE="/var/lib/ebtables/lock"])
  
  regular_CFLAGS="-Wall -Wunused"
  regular_CPPFLAGS=""
@@ -35,7 +37,6 @@ index c24ede3..3e89c0c 100644
  case "$host" in
  	sparc64-*)
 -		regular_CPPFLAGS="$regular_CPPFLAGS -DEBT_MIN_ALIGN=8 -DKERNEL_64_USERSPACE_32";;
-+		enable_kernel_64_userland_32=yes ;;
  esac
 +AC_ARG_ENABLE([kernel-64-userland-32],
 +    AC_HELP_STRING([--enable-kernel-64-userland-32], [indicate that ebtables will be built as a 32-bit application but run under a 64-bit kernel])
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
diff --git a/package/ebtables/Config.in b/package/ebtables/Config.in
index 703e55a3c3..ea06b0d8b5 100644
--- a/package/ebtables/Config.in
+++ b/package/ebtables/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_EBTABLES
 	bool "ebtables"
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_KERNEL_64_USERLAND_32
 	help
 	  Ethernet bridge frame table administration
 
diff --git a/package/ebtables/ebtables.mk b/package/ebtables/ebtables.mk
index 46c22dde9b..74048f6339 100644
--- a/package/ebtables/ebtables.mk
+++ b/package/ebtables/ebtables.mk
@@ -11,11 +11,10 @@ EBTABLES_LICENSE_FILES = COPYING
 EBTABLES_CPE_ID_VENDOR = netfilter
 EBTABLES_SELINUX_MODULES = iptables
 
-# for 0003-configure.ac-add-option-enable-kernel-64-userland-32.patch
+# for 0002-configure.ac-add-option-enable-kernel-64-userland-32.patch
 EBTABLES_AUTORECONF = YES
-ifeq ($(BR2_KERNEL_64_USERLAND_32),y)
-EBTABLES_CONF_OPTS += --enable-kernel-64-userland-32
-endif
+# kernel-64-userland-32 is broken (spotted with gcc >= 14)
+EBTABLES_CONF_OPTS += --disable-kernel-64-userland-32
 
 ifeq ($(BR2_PACKAGE_EBTABLES_UTILS_SAVE),y)
 define EBTABLES_INSTALL_TARGET_UTILS_SAVE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
