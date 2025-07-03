Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2AE0C83F09
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91D7B83DC5;
	Fri,  4 Jul 2025 06:21:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YbzRF7GjepN6; Fri,  4 Jul 2025 06:21:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42D9883D02
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42D9883D02;
	Fri,  4 Jul 2025 06:21:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C5F37AB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03DC540530
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:21:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OXt3ix2EGydh for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:21:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F29B404F0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F29B404F0
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:21:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9D33B85D08; Fri,  4 Jul 2025 06:21:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Jul 2025 09:57:16 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 91895774f808ca40fe54b00fbe869c736f181caf
X-Git-Newrev: 6fd0878189632d7b2d39a3c04eb96ac6009be0f2
X-Patchwork-Hint: ignore
Message-Id: <20250704062126.9D33B85D08@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/binutils: fix
 build with gcc 15
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0388076087059896809=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0388076087059896809==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6fd0878189632d7b2d39a3c04eb96ac6009be0f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Backport the upstream patch that fixes the following build error when
compiling for mips with gcc 15:

In file included from mips-opc.c:29:
mips-opc.c: In function 'decode_mips_operand':
mips-formats.h:86:7: error: expected identifier or '(' before
'static_assert'
   86 |       static_assert[(1 << (SIZE)) == ARRAY_SIZE (MAP)]; \
         |       ^~~~~~~~~~~~~

The patch is already part of upstream binutils 2.44, so we only need
it for 2.42 and 2.43.1.

All 3 versions we have of host-binutils were build-tested using the
defconfig from the autobuilder failure (see the link below) and gcc 15
on the host.

Fixes:
- https://autobuild.buildroot.org/results/873/873ec25cf01d5f2b9ae7044e0b1d8d8791b781e6/

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 430aa91c3d913aa14dba78713e7960c27806c1cd)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...-std-gnu23-compatibility-wrt-static_asser.patch | 90 ++++++++++++++++++++++
 ...-std-gnu23-compatibility-wrt-static_asser.patch | 90 ++++++++++++++++++++++
 2 files changed, 180 insertions(+)

diff --git a/package/binutils/2.42/0004-opcodes-fix-std-gnu23-compatibility-wrt-static_asser.patch b/package/binutils/2.42/0004-opcodes-fix-std-gnu23-compatibility-wrt-static_asser.patch
new file mode 100644
index 0000000000..f9b870afa2
--- /dev/null
+++ b/package/binutils/2.42/0004-opcodes-fix-std-gnu23-compatibility-wrt-static_asser.patch
@@ -0,0 +1,90 @@
+From 8ebe62f3f0d27806b1bf69f301f5e188b4acd2b4 Mon Sep 17 00:00:00 2001
+From: Sam James <sam@gentoo.org>
+Date: Sat, 16 Nov 2024 05:03:52 +0000
+Subject: [PATCH] opcodes: fix -std=gnu23 compatibility wrt static_assert
+
+static_assert is declared in C23 so we can't reuse that identifier:
+* Define our own static_assert conditionally;
+
+* Rename "static assert" hacks to _N as we do already in some places
+  to avoid a conflict.
+
+ChangeLog:
+	PR ld/32372
+
+        * i386-gen.c (static_assert): Define conditionally.
+        * mips-formats.h (MAPPED_INT): Rename identifier.
+        (MAPPED_REG): Rename identifier.
+        (OPTIONAL_MAPPED_REG): Rename identifier.
+        * s390-opc.c (static_assert): Define conditionally.
+
+Upstream: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=8ebe62f3f0d27806b1bf69f301f5e188b4acd2b4
+Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
+---
+ opcodes/i386-gen.c     | 2 ++
+ opcodes/mips-formats.h | 6 +++---
+ opcodes/s390-opc.c     | 2 ++
+ 3 files changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/opcodes/i386-gen.c b/opcodes/i386-gen.c
+index 053b66675c5..7ee8a30310c 100644
+--- a/opcodes/i386-gen.c
++++ b/opcodes/i386-gen.c
+@@ -30,7 +30,9 @@
+ 
+ /* Build-time checks are preferrable over runtime ones.  Use this construct
+    in preference where possible.  */
++#ifndef static_assert
+ #define static_assert(e) ((void)sizeof (struct { int _:1 - 2 * !(e); }))
++#endif
+ 
+ static const char *program_name = NULL;
+ static int debug = 0;
+diff --git a/opcodes/mips-formats.h b/opcodes/mips-formats.h
+index 90df7100803..c4dec6352bf 100644
+--- a/opcodes/mips-formats.h
++++ b/opcodes/mips-formats.h
+@@ -49,7 +49,7 @@
+ #define MAPPED_INT(SIZE, LSB, MAP, PRINT_HEX) \
+   { \
+     typedef char ATTRIBUTE_UNUSED \
+-      static_assert[(1 << (SIZE)) == ARRAY_SIZE (MAP)]; \
++      static_assert_3[(1 << (SIZE)) == ARRAY_SIZE (MAP)]; \
+     static const struct mips_mapped_int_operand op = { \
+       { OP_MAPPED_INT, SIZE, LSB }, MAP, PRINT_HEX \
+     }; \
+@@ -83,7 +83,7 @@
+ #define MAPPED_REG(SIZE, LSB, BANK, MAP) \
+   { \
+     typedef char ATTRIBUTE_UNUSED \
+-      static_assert[(1 << (SIZE)) == ARRAY_SIZE (MAP)]; \
++      static_assert_4[(1 << (SIZE)) == ARRAY_SIZE (MAP)]; \
+     static const struct mips_reg_operand op = { \
+       { OP_REG, SIZE, LSB }, OP_REG_##BANK, MAP \
+     }; \
+@@ -93,7 +93,7 @@
+ #define OPTIONAL_MAPPED_REG(SIZE, LSB, BANK, MAP) \
+   { \
+     typedef char ATTRIBUTE_UNUSED \
+-      static_assert[(1 << (SIZE)) == ARRAY_SIZE (MAP)]; \
++      static_assert_5[(1 << (SIZE)) == ARRAY_SIZE (MAP)]; \
+     static const struct mips_reg_operand op = { \
+       { OP_OPTIONAL_REG, SIZE, LSB }, OP_REG_##BANK, MAP \
+     }; \
+diff --git a/opcodes/s390-opc.c b/opcodes/s390-opc.c
+index 9d9f0973e55..49efd714157 100644
+--- a/opcodes/s390-opc.c
++++ b/opcodes/s390-opc.c
+@@ -36,7 +36,9 @@
+ 
+ /* Build-time checks are preferrable over runtime ones.  Use this construct
+    in preference where possible.  */
++#ifndef static_assert
+ #define static_assert(e) ((void)sizeof (struct { int _:1 - 2 * !(e); }))
++#endif
+ 
+ #define ARRAY_SIZE(a) (sizeof(a) / sizeof((a)[0]))
+ 
+-- 
+2.34.1
+
diff --git a/package/binutils/2.43.1/0004-opcodes-fix-std-gnu23-compatibility-wrt-static_asser.patch b/package/binutils/2.43.1/0004-opcodes-fix-std-gnu23-compatibility-wrt-static_asser.patch
new file mode 100644
index 0000000000..f9b870afa2
--- /dev/null
+++ b/package/binutils/2.43.1/0004-opcodes-fix-std-gnu23-compatibility-wrt-static_asser.patch
@@ -0,0 +1,90 @@
+From 8ebe62f3f0d27806b1bf69f301f5e188b4acd2b4 Mon Sep 17 00:00:00 2001
+From: Sam James <sam@gentoo.org>
+Date: Sat, 16 Nov 2024 05:03:52 +0000
+Subject: [PATCH] opcodes: fix -std=gnu23 compatibility wrt static_assert
+
+static_assert is declared in C23 so we can't reuse that identifier:
+* Define our own static_assert conditionally;
+
+* Rename "static assert" hacks to _N as we do already in some places
+  to avoid a conflict.
+
+ChangeLog:
+	PR ld/32372
+
+        * i386-gen.c (static_assert): Define conditionally.
+        * mips-formats.h (MAPPED_INT): Rename identifier.
+        (MAPPED_REG): Rename identifier.
+        (OPTIONAL_MAPPED_REG): Rename identifier.
+        * s390-opc.c (static_assert): Define conditionally.
+
+Upstream: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=8ebe62f3f0d27806b1bf69f301f5e188b4acd2b4
+Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
+---
+ opcodes/i386-gen.c     | 2 ++
+ opcodes/mips-formats.h | 6 +++---
+ opcodes/s390-opc.c     | 2 ++
+ 3 files changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/opcodes/i386-gen.c b/opcodes/i386-gen.c
+index 053b66675c5..7ee8a30310c 100644
+--- a/opcodes/i386-gen.c
++++ b/opcodes/i386-gen.c
+@@ -30,7 +30,9 @@
+ 
+ /* Build-time checks are preferrable over runtime ones.  Use this construct
+    in preference where possible.  */
++#ifndef static_assert
+ #define static_assert(e) ((void)sizeof (struct { int _:1 - 2 * !(e); }))
++#endif
+ 
+ static const char *program_name = NULL;
+ static int debug = 0;
+diff --git a/opcodes/mips-formats.h b/opcodes/mips-formats.h
+index 90df7100803..c4dec6352bf 100644
+--- a/opcodes/mips-formats.h
++++ b/opcodes/mips-formats.h
+@@ -49,7 +49,7 @@
+ #define MAPPED_INT(SIZE, LSB, MAP, PRINT_HEX) \
+   { \
+     typedef char ATTRIBUTE_UNUSED \
+-      static_assert[(1 << (SIZE)) == ARRAY_SIZE (MAP)]; \
++      static_assert_3[(1 << (SIZE)) == ARRAY_SIZE (MAP)]; \
+     static const struct mips_mapped_int_operand op = { \
+       { OP_MAPPED_INT, SIZE, LSB }, MAP, PRINT_HEX \
+     }; \
+@@ -83,7 +83,7 @@
+ #define MAPPED_REG(SIZE, LSB, BANK, MAP) \
+   { \
+     typedef char ATTRIBUTE_UNUSED \
+-      static_assert[(1 << (SIZE)) == ARRAY_SIZE (MAP)]; \
++      static_assert_4[(1 << (SIZE)) == ARRAY_SIZE (MAP)]; \
+     static const struct mips_reg_operand op = { \
+       { OP_REG, SIZE, LSB }, OP_REG_##BANK, MAP \
+     }; \
+@@ -93,7 +93,7 @@
+ #define OPTIONAL_MAPPED_REG(SIZE, LSB, BANK, MAP) \
+   { \
+     typedef char ATTRIBUTE_UNUSED \
+-      static_assert[(1 << (SIZE)) == ARRAY_SIZE (MAP)]; \
++      static_assert_5[(1 << (SIZE)) == ARRAY_SIZE (MAP)]; \
+     static const struct mips_reg_operand op = { \
+       { OP_OPTIONAL_REG, SIZE, LSB }, OP_REG_##BANK, MAP \
+     }; \
+diff --git a/opcodes/s390-opc.c b/opcodes/s390-opc.c
+index 9d9f0973e55..49efd714157 100644
+--- a/opcodes/s390-opc.c
++++ b/opcodes/s390-opc.c
+@@ -36,7 +36,9 @@
+ 
+ /* Build-time checks are preferrable over runtime ones.  Use this construct
+    in preference where possible.  */
++#ifndef static_assert
+ #define static_assert(e) ((void)sizeof (struct { int _:1 - 2 * !(e); }))
++#endif
+ 
+ #define ARRAY_SIZE(a) (sizeof(a) / sizeof((a)[0]))
+ 
+-- 
+2.34.1
+

--===============0388076087059896809==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0388076087059896809==--
