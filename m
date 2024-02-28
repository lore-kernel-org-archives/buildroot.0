Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D535C47DD9
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 16:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56BE860E8B;
	Wed, 28 Feb 2024 16:53:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LaTxandRXM1K; Wed, 28 Feb 2024 16:53:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E57AD60E6B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E57AD60E6B;
	Wed, 28 Feb 2024 16:53:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 552A21BF391
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 16:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41933823CF
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 16:53:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4li9Ziiz_lLi for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 16:53:04 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=162.248.234.2;
 helo=mail.xes-mad.com; envelope-from=vfazio@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EFA868237D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFA868237D
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EFA868237D
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 16:53:03 +0000 (UTC)
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
 by mail.xes-mad.com (Postfix) with ESMTP id B5C0420FF6;
 Wed, 28 Feb 2024 10:53:02 -0600 (CST)
From: Vincent Fazio <vfazio@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 10:53:00 -0600
Message-Id: <20240228165300.4158751-1-vfazio@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=gmail.com
Subject: [Buildroot] [PATCH 1/1] package/gcc: add symver attribute support
 to MicroBlaze
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vincent Fazio <vfazio@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

While the MicroBlaze architecture does generate ELFs, it does not
leverage elfos.h to define common attributes; symver being one of them.

By adding symver support, there should no longer be any need to patch
packages to account for this architecture quirk.

Fixes: http://autobuild.buildroot.org/results/29c76e02becedf922bd7dc0533338c078bf77d2a
Fixes: http://autobuild.buildroot.net/results/1e9/1e965d83d75615f35308440c5db044314a349357

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
Tested by: 
* revert 4b34b8ccfa5159d643ecbac12c42c638e3b27e5e
* make qemu_microblazeel_mmu_defconfig
* add CONFIG_TMPFS_XATTR=y to kernel config

~/development/buildroot $ ./output/host/bin/microblazeel-buildroot-linux-gnu-readelf -W --dyn-syms output/target/usr/lib/libattr.so | grep "@ATTR"
    43: 0000355c   824 FUNC    GLOBAL DEFAULT   12 attr_listf@@ATTR_1.2
    44: 00002bf4   340 FUNC    GLOBAL DEFAULT   12 attr_getf@@ATTR_1.0
    45: 00002a80   372 FUNC    GLOBAL DEFAULT   12 attr_get@@ATTR_1.0
    46: 00001a20  1716 FUNC    GLOBAL DEFAULT   12 attr_copy_fd@@ATTR_1.1
    47: 00002fe8   272 FUNC    GLOBAL DEFAULT   12 attr_remove@@ATTR_1.0
    48: 00003894   340 FUNC    GLOBAL DEFAULT   12 attr_multi@@ATTR_1.0
    49: 000020d4  1708 FUNC    GLOBAL DEFAULT   12 attr_copy_file@@ATTR_1.1
    50: 00003cb0    72 FUNC    GLOBAL DEFAULT   12 fgetxattr@ATTR_1.0
    51: 00003dc4    64 FUNC    GLOBAL DEFAULT   12 removexattr@ATTR_1.0
    52: 00003b88    76 FUNC    GLOBAL DEFAULT   12 lsetxattr@ATTR_1.0
    53: 00003cf8    68 FUNC    GLOBAL DEFAULT   12 listxattr@ATTR_1.0
    54: 000030f8   240 FUNC    GLOBAL DEFAULT   12 attr_removef@@ATTR_1.0
    56: 00002ea8   320 FUNC    GLOBAL DEFAULT   12 attr_setf@@ATTR_1.0
    57: 00003bd4    76 FUNC    GLOBAL DEFAULT   12 fsetxattr@ATTR_1.0
    60: 000039e8   340 FUNC    GLOBAL DEFAULT   12 attr_multif@@ATTR_1.0
    61: 00003c20    72 FUNC    GLOBAL DEFAULT   12 getxattr@ATTR_1.0
    63: 0000195c   196 FUNC    GLOBAL DEFAULT   12 attr_copy_check_permissions@@ATTR_1.1
    64: 00003e04    64 FUNC    GLOBAL DEFAULT   12 lremovexattr@ATTR_1.0
    65: 00003d3c    68 FUNC    GLOBAL DEFAULT   12 llistxattr@ATTR_1.0
    66: 00002d48   352 FUNC    GLOBAL DEFAULT   12 attr_set@@ATTR_1.0
    67: 00003b3c    76 FUNC    GLOBAL DEFAULT   12 setxattr@ATTR_1.0
    68: 00001448  1300 FUNC    GLOBAL DEFAULT   12 attr_copy_action@@ATTR_1.3
    69: 00003c68    72 FUNC    GLOBAL DEFAULT   12 lgetxattr@ATTR_1.0
    70: 000031e8   884 FUNC    GLOBAL DEFAULT   12 attr_list@@ATTR_1.2
    71: 00003d80    68 FUNC    GLOBAL DEFAULT   12 flistxattr@ATTR_1.0
    72: 00003e44    64 FUNC    GLOBAL DEFAULT   12 fremovexattr@ATTR_1.0


# touch /tmp/file.txt
# attr -S -s "someattr" -V "value" /tmp/file.txt
Attribute "someattr" set to a 5 byte value for /tmp/file.txt:
value
# attr -l /tmp/file.txt
Attribute "someattr" has a 5 byte value for /tmp/file.txt
# getfattr -dm - /tmp/file.txt
getfattr: Removing leading '/' from absolute path names
# file: tmp/file.txt
security.someattr="value"
---
 ...e-define-ASM_OUTPUT_SYMVER_DIRECTIVE.patch | 57 +++++++++++++++++++
 ...e-define-ASM_OUTPUT_SYMVER_DIRECTIVE.patch | 57 +++++++++++++++++++
 ...e-define-ASM_OUTPUT_SYMVER_DIRECTIVE.patch | 57 +++++++++++++++++++
 3 files changed, 171 insertions(+)
 create mode 100644 package/gcc/11.4.0/0008-microblaze-define-ASM_OUTPUT_SYMVER_DIRECTIVE.patch
 create mode 100644 package/gcc/12.3.0/0004-microblaze-define-ASM_OUTPUT_SYMVER_DIRECTIVE.patch
 create mode 100644 package/gcc/13.2.0/0003-microblaze-define-ASM_OUTPUT_SYMVER_DIRECTIVE.patch

diff --git a/package/gcc/11.4.0/0008-microblaze-define-ASM_OUTPUT_SYMVER_DIRECTIVE.patch b/package/gcc/11.4.0/0008-microblaze-define-ASM_OUTPUT_SYMVER_DIRECTIVE.patch
new file mode 100644
index 0000000000..ade50e512d
--- /dev/null
+++ b/package/gcc/11.4.0/0008-microblaze-define-ASM_OUTPUT_SYMVER_DIRECTIVE.patch
@@ -0,0 +1,57 @@
+From 99873bdc294aabd19861786f51c6be01ecaee59c Mon Sep 17 00:00:00 2001
+From: Vincent Fazio <vfazio@xes-inc.com>
+Date: Tue, 20 Feb 2024 16:49:06 -0600
+Subject: [PATCH] microblaze: define ASM_OUTPUT_SYMVER_DIRECTIVE
+
+The MicroBlaze target architecture generates ELF binary objects, however
+it does not leverage elfos.h like other ELF generating architectures
+(see gcc/config.gcc).
+
+Due to this quirk, the architecture does not receive "free" updates for
+new features that get added for ELF objects. One such feature being
+symver support [0].
+
+Now, the macro necessary to emit symver directives is defined.
+
+Packages such as attr, xz, libkcapi, et al which use this directive
+should now compile on MicroBlaze without needing a patch to account
+for this lack of support.
+
+This patch has not been submitted upstream as discussion [1] around
+the approach has leaned toward a full migration to elfos.h which is
+non-trivial.
+
+[0]: https://github.com/gcc-mirror/gcc/commit/d7ddfbcb7
+[1]: https://gcc.gnu.org/pipermail/gcc/2023-February/240752.html
+Upstream-bug: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101766
+Upstream: Not Submitted
+Signed-off-by: Vincent Fazio <vfazio@gmail.com>
+---
+ gcc/config/microblaze/microblaze.h | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/gcc/config/microblaze/microblaze.h b/gcc/config/microblaze/microblaze.h
+index 2ecec750526..e4452acddb9 100644
+--- a/gcc/config/microblaze/microblaze.h
++++ b/gcc/config/microblaze/microblaze.h
+@@ -833,6 +833,17 @@ do {									 \
+       fputc ('\n', FILE);						\
+     } while (0)
+ 
++#define ASM_OUTPUT_SYMVER_DIRECTIVE(FILE, NAME, NAME2)		\
++  do								\
++    {								\
++      fputs ("\t.symver\t", (FILE));				\
++      assemble_name ((FILE), (NAME));				\
++      fputs (", ", (FILE));					\
++      assemble_name ((FILE), (NAME2));				\
++      fputc ('\n', (FILE));					\
++    }								\
++  while (0)
++
+ #define MAKE_DECL_ONE_ONLY(DECL)	(DECL_WEAK (DECL) = 1)
+ #undef UNIQUE_SECTION_P
+ #define UNIQUE_SECTION_P(DECL)		(DECL_ONE_ONLY (DECL))
+-- 
+2.34.1
+
diff --git a/package/gcc/12.3.0/0004-microblaze-define-ASM_OUTPUT_SYMVER_DIRECTIVE.patch b/package/gcc/12.3.0/0004-microblaze-define-ASM_OUTPUT_SYMVER_DIRECTIVE.patch
new file mode 100644
index 0000000000..ade50e512d
--- /dev/null
+++ b/package/gcc/12.3.0/0004-microblaze-define-ASM_OUTPUT_SYMVER_DIRECTIVE.patch
@@ -0,0 +1,57 @@
+From 99873bdc294aabd19861786f51c6be01ecaee59c Mon Sep 17 00:00:00 2001
+From: Vincent Fazio <vfazio@xes-inc.com>
+Date: Tue, 20 Feb 2024 16:49:06 -0600
+Subject: [PATCH] microblaze: define ASM_OUTPUT_SYMVER_DIRECTIVE
+
+The MicroBlaze target architecture generates ELF binary objects, however
+it does not leverage elfos.h like other ELF generating architectures
+(see gcc/config.gcc).
+
+Due to this quirk, the architecture does not receive "free" updates for
+new features that get added for ELF objects. One such feature being
+symver support [0].
+
+Now, the macro necessary to emit symver directives is defined.
+
+Packages such as attr, xz, libkcapi, et al which use this directive
+should now compile on MicroBlaze without needing a patch to account
+for this lack of support.
+
+This patch has not been submitted upstream as discussion [1] around
+the approach has leaned toward a full migration to elfos.h which is
+non-trivial.
+
+[0]: https://github.com/gcc-mirror/gcc/commit/d7ddfbcb7
+[1]: https://gcc.gnu.org/pipermail/gcc/2023-February/240752.html
+Upstream-bug: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101766
+Upstream: Not Submitted
+Signed-off-by: Vincent Fazio <vfazio@gmail.com>
+---
+ gcc/config/microblaze/microblaze.h | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/gcc/config/microblaze/microblaze.h b/gcc/config/microblaze/microblaze.h
+index 2ecec750526..e4452acddb9 100644
+--- a/gcc/config/microblaze/microblaze.h
++++ b/gcc/config/microblaze/microblaze.h
+@@ -833,6 +833,17 @@ do {									 \
+       fputc ('\n', FILE);						\
+     } while (0)
+ 
++#define ASM_OUTPUT_SYMVER_DIRECTIVE(FILE, NAME, NAME2)		\
++  do								\
++    {								\
++      fputs ("\t.symver\t", (FILE));				\
++      assemble_name ((FILE), (NAME));				\
++      fputs (", ", (FILE));					\
++      assemble_name ((FILE), (NAME2));				\
++      fputc ('\n', (FILE));					\
++    }								\
++  while (0)
++
+ #define MAKE_DECL_ONE_ONLY(DECL)	(DECL_WEAK (DECL) = 1)
+ #undef UNIQUE_SECTION_P
+ #define UNIQUE_SECTION_P(DECL)		(DECL_ONE_ONLY (DECL))
+-- 
+2.34.1
+
diff --git a/package/gcc/13.2.0/0003-microblaze-define-ASM_OUTPUT_SYMVER_DIRECTIVE.patch b/package/gcc/13.2.0/0003-microblaze-define-ASM_OUTPUT_SYMVER_DIRECTIVE.patch
new file mode 100644
index 0000000000..ade50e512d
--- /dev/null
+++ b/package/gcc/13.2.0/0003-microblaze-define-ASM_OUTPUT_SYMVER_DIRECTIVE.patch
@@ -0,0 +1,57 @@
+From 99873bdc294aabd19861786f51c6be01ecaee59c Mon Sep 17 00:00:00 2001
+From: Vincent Fazio <vfazio@xes-inc.com>
+Date: Tue, 20 Feb 2024 16:49:06 -0600
+Subject: [PATCH] microblaze: define ASM_OUTPUT_SYMVER_DIRECTIVE
+
+The MicroBlaze target architecture generates ELF binary objects, however
+it does not leverage elfos.h like other ELF generating architectures
+(see gcc/config.gcc).
+
+Due to this quirk, the architecture does not receive "free" updates for
+new features that get added for ELF objects. One such feature being
+symver support [0].
+
+Now, the macro necessary to emit symver directives is defined.
+
+Packages such as attr, xz, libkcapi, et al which use this directive
+should now compile on MicroBlaze without needing a patch to account
+for this lack of support.
+
+This patch has not been submitted upstream as discussion [1] around
+the approach has leaned toward a full migration to elfos.h which is
+non-trivial.
+
+[0]: https://github.com/gcc-mirror/gcc/commit/d7ddfbcb7
+[1]: https://gcc.gnu.org/pipermail/gcc/2023-February/240752.html
+Upstream-bug: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101766
+Upstream: Not Submitted
+Signed-off-by: Vincent Fazio <vfazio@gmail.com>
+---
+ gcc/config/microblaze/microblaze.h | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/gcc/config/microblaze/microblaze.h b/gcc/config/microblaze/microblaze.h
+index 2ecec750526..e4452acddb9 100644
+--- a/gcc/config/microblaze/microblaze.h
++++ b/gcc/config/microblaze/microblaze.h
+@@ -833,6 +833,17 @@ do {									 \
+       fputc ('\n', FILE);						\
+     } while (0)
+ 
++#define ASM_OUTPUT_SYMVER_DIRECTIVE(FILE, NAME, NAME2)		\
++  do								\
++    {								\
++      fputs ("\t.symver\t", (FILE));				\
++      assemble_name ((FILE), (NAME));				\
++      fputs (", ", (FILE));					\
++      assemble_name ((FILE), (NAME2));				\
++      fputc ('\n', (FILE));					\
++    }								\
++  while (0)
++
+ #define MAKE_DECL_ONE_ONLY(DECL)	(DECL_WEAK (DECL) = 1)
+ #undef UNIQUE_SECTION_P
+ #define UNIQUE_SECTION_P(DECL)		(DECL_ONE_ONLY (DECL))
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
