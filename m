Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AB1FC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:47:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8A7660F93
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:47:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C8A7660F93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E59A60D4E;
	Tue,  3 Aug 2021 23:47:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CwX1OH2PEajC; Tue,  3 Aug 2021 23:47:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13AC460AA7;
	Tue,  3 Aug 2021 23:47:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 109451BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15EB840515
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w1gQnHurHjjl for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DADF14069D
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3AAC286AA7; Tue,  3 Aug 2021 21:10:08 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 18 Jul 2021 22:28:08 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5540b789479c4b1a5b67c6ba35d3403da86f7f6c
X-Git-Newrev: 747e2eed880b70c085bb93b34a6e1558ae49b6d0
X-Patchwork-Hint: ignore
Message-Id: <20210803211008.3AAC286AA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/binutils: fix building
 or1k with host gcc version < 5
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

commit: https://git.buildroot.net/buildroot/commit/?id=747e2eed880b70c085bb93b34a6e1558ae49b6d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add patches to fix building on hosts that provide gcc version < 5
(i.e. 4.9), otherwise they fail due to missing default '-std=gnu11' option
on variable declaration inside for loops.

The patch is pending upstream:
https://sourceware.org/pipermail/binutils/2021-June/116884.html

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...lf32-or1k-fix-building-with-gcc-version-5.patch | 50 ++++++++++++++++++++++
 ...lf32-or1k-fix-building-with-gcc-version-5.patch | 50 ++++++++++++++++++++++
 ...lf32-or1k-fix-building-with-gcc-version-5.patch | 50 ++++++++++++++++++++++
 ...lf32-or1k-fix-building-with-gcc-version-5.patch | 50 ++++++++++++++++++++++
 4 files changed, 200 insertions(+)

diff --git a/package/binutils/2.32/0014-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch b/package/binutils/2.32/0014-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch
new file mode 100644
index 0000000000..c3978e22fa
--- /dev/null
+++ b/package/binutils/2.32/0014-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch
@@ -0,0 +1,50 @@
+From c3003947e4bad18faea4337fd2073feeb30ee078 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 9 Jun 2021 17:28:27 +0200
+Subject: [PATCH] bfd/elf32-or1k: fix building with gcc version < 5
+
+Gcc version >= 5 has standard C mode not set to -std=gnu11, so if we use
+an old compiler(i.e. gcc 4.9) build fails on:
+```
+elf32-or1k.c:2251:3: error: 'for' loop initial declarations are only allowed in
+C99 or C11 mode
+    for (size_t i = 0; i < insn_count; i++)
+    ^
+```
+
+So let's declare `size_t i` at the top of the function instead of inside
+for loop.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ bfd/elf32-or1k.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
+index 4ae7f324d33..32063ab0289 100644
+--- a/bfd/elf32-or1k.c
++++ b/bfd/elf32-or1k.c
+@@ -2244,9 +2244,10 @@ or1k_write_plt_entry (bfd *output_bfd, bfd_byte *contents, unsigned insnj,
+ {
+   unsigned nodelay = elf_elfheader (output_bfd)->e_flags & EF_OR1K_NODELAY;
+   unsigned output_insns[PLT_MAX_INSN_COUNT];
++  size_t i;
+ 
+   /* Copy instructions into the output buffer.  */
+-  for (size_t i = 0; i < insn_count; i++)
++  for (i = 0; i < insn_count; i++)
+     output_insns[i] = insns[i];
+ 
+   /* Honor the no-delay-slot setting.  */
+@@ -2277,7 +2278,7 @@ or1k_write_plt_entry (bfd *output_bfd, bfd_byte *contents, unsigned insnj,
+     }
+ 
+   /* Write out the output buffer.  */
+-  for (size_t i = 0; i < (insn_count+1); i++)
++  for (i = 0; i < (insn_count+1); i++)
+     bfd_put_32 (output_bfd, output_insns[i], contents + (i*4));
+ }
+ 
+-- 
+2.25.1
+
diff --git a/package/binutils/2.34/0007-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch b/package/binutils/2.34/0007-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch
new file mode 100644
index 0000000000..c3978e22fa
--- /dev/null
+++ b/package/binutils/2.34/0007-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch
@@ -0,0 +1,50 @@
+From c3003947e4bad18faea4337fd2073feeb30ee078 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 9 Jun 2021 17:28:27 +0200
+Subject: [PATCH] bfd/elf32-or1k: fix building with gcc version < 5
+
+Gcc version >= 5 has standard C mode not set to -std=gnu11, so if we use
+an old compiler(i.e. gcc 4.9) build fails on:
+```
+elf32-or1k.c:2251:3: error: 'for' loop initial declarations are only allowed in
+C99 or C11 mode
+    for (size_t i = 0; i < insn_count; i++)
+    ^
+```
+
+So let's declare `size_t i` at the top of the function instead of inside
+for loop.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ bfd/elf32-or1k.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
+index 4ae7f324d33..32063ab0289 100644
+--- a/bfd/elf32-or1k.c
++++ b/bfd/elf32-or1k.c
+@@ -2244,9 +2244,10 @@ or1k_write_plt_entry (bfd *output_bfd, bfd_byte *contents, unsigned insnj,
+ {
+   unsigned nodelay = elf_elfheader (output_bfd)->e_flags & EF_OR1K_NODELAY;
+   unsigned output_insns[PLT_MAX_INSN_COUNT];
++  size_t i;
+ 
+   /* Copy instructions into the output buffer.  */
+-  for (size_t i = 0; i < insn_count; i++)
++  for (i = 0; i < insn_count; i++)
+     output_insns[i] = insns[i];
+ 
+   /* Honor the no-delay-slot setting.  */
+@@ -2277,7 +2278,7 @@ or1k_write_plt_entry (bfd *output_bfd, bfd_byte *contents, unsigned insnj,
+     }
+ 
+   /* Write out the output buffer.  */
+-  for (size_t i = 0; i < (insn_count+1); i++)
++  for (i = 0; i < (insn_count+1); i++)
+     bfd_put_32 (output_bfd, output_insns[i], contents + (i*4));
+ }
+ 
+-- 
+2.25.1
+
diff --git a/package/binutils/2.35.2/0007-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch b/package/binutils/2.35.2/0007-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch
new file mode 100644
index 0000000000..c3978e22fa
--- /dev/null
+++ b/package/binutils/2.35.2/0007-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch
@@ -0,0 +1,50 @@
+From c3003947e4bad18faea4337fd2073feeb30ee078 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 9 Jun 2021 17:28:27 +0200
+Subject: [PATCH] bfd/elf32-or1k: fix building with gcc version < 5
+
+Gcc version >= 5 has standard C mode not set to -std=gnu11, so if we use
+an old compiler(i.e. gcc 4.9) build fails on:
+```
+elf32-or1k.c:2251:3: error: 'for' loop initial declarations are only allowed in
+C99 or C11 mode
+    for (size_t i = 0; i < insn_count; i++)
+    ^
+```
+
+So let's declare `size_t i` at the top of the function instead of inside
+for loop.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ bfd/elf32-or1k.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
+index 4ae7f324d33..32063ab0289 100644
+--- a/bfd/elf32-or1k.c
++++ b/bfd/elf32-or1k.c
+@@ -2244,9 +2244,10 @@ or1k_write_plt_entry (bfd *output_bfd, bfd_byte *contents, unsigned insnj,
+ {
+   unsigned nodelay = elf_elfheader (output_bfd)->e_flags & EF_OR1K_NODELAY;
+   unsigned output_insns[PLT_MAX_INSN_COUNT];
++  size_t i;
+ 
+   /* Copy instructions into the output buffer.  */
+-  for (size_t i = 0; i < insn_count; i++)
++  for (i = 0; i < insn_count; i++)
+     output_insns[i] = insns[i];
+ 
+   /* Honor the no-delay-slot setting.  */
+@@ -2277,7 +2278,7 @@ or1k_write_plt_entry (bfd *output_bfd, bfd_byte *contents, unsigned insnj,
+     }
+ 
+   /* Write out the output buffer.  */
+-  for (size_t i = 0; i < (insn_count+1); i++)
++  for (i = 0; i < (insn_count+1); i++)
+     bfd_put_32 (output_bfd, output_insns[i], contents + (i*4));
+ }
+ 
+-- 
+2.25.1
+
diff --git a/package/binutils/2.36.1/0007-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch b/package/binutils/2.36.1/0007-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch
new file mode 100644
index 0000000000..c3978e22fa
--- /dev/null
+++ b/package/binutils/2.36.1/0007-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch
@@ -0,0 +1,50 @@
+From c3003947e4bad18faea4337fd2073feeb30ee078 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 9 Jun 2021 17:28:27 +0200
+Subject: [PATCH] bfd/elf32-or1k: fix building with gcc version < 5
+
+Gcc version >= 5 has standard C mode not set to -std=gnu11, so if we use
+an old compiler(i.e. gcc 4.9) build fails on:
+```
+elf32-or1k.c:2251:3: error: 'for' loop initial declarations are only allowed in
+C99 or C11 mode
+    for (size_t i = 0; i < insn_count; i++)
+    ^
+```
+
+So let's declare `size_t i` at the top of the function instead of inside
+for loop.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ bfd/elf32-or1k.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
+index 4ae7f324d33..32063ab0289 100644
+--- a/bfd/elf32-or1k.c
++++ b/bfd/elf32-or1k.c
+@@ -2244,9 +2244,10 @@ or1k_write_plt_entry (bfd *output_bfd, bfd_byte *contents, unsigned insnj,
+ {
+   unsigned nodelay = elf_elfheader (output_bfd)->e_flags & EF_OR1K_NODELAY;
+   unsigned output_insns[PLT_MAX_INSN_COUNT];
++  size_t i;
+ 
+   /* Copy instructions into the output buffer.  */
+-  for (size_t i = 0; i < insn_count; i++)
++  for (i = 0; i < insn_count; i++)
+     output_insns[i] = insns[i];
+ 
+   /* Honor the no-delay-slot setting.  */
+@@ -2277,7 +2278,7 @@ or1k_write_plt_entry (bfd *output_bfd, bfd_byte *contents, unsigned insnj,
+     }
+ 
+   /* Write out the output buffer.  */
+-  for (size_t i = 0; i < (insn_count+1); i++)
++  for (i = 0; i < (insn_count+1); i++)
+     bfd_put_32 (output_bfd, output_insns[i], contents + (i*4));
+ }
+ 
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
