Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0DBAC433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 18:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68C7160750;
	Fri,  7 Jan 2022 18:15:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MnvXmq87_DHg; Fri,  7 Jan 2022 18:15:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45A3D60A98;
	Fri,  7 Jan 2022 18:15:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0018C1BF291
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 18:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1A8F81467
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 18:15:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kdFCgfVY4p64 for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 18:15:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA62181458
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 18:15:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3DCB481882; Fri,  7 Jan 2022 18:09:39 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 7 Jan 2022 19:15:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: feda801885091a9e41faa45aa0416afa67a0e2ce
X-Git-Newrev: 3a1f18a85784da3e4243b1c54a18fa88f02a8a00
X-Patchwork-Hint: ignore
Message-Id: <20220107180939.3DCB481882@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/binutils: add patches to fix
 binutils bug 28735 for or1k
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

commit: https://git.buildroot.net/buildroot/commit/?id=3a1f18a85784da3e4243b1c54a18fa88f02a8a00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After fixing binutils bug 21464, bug 28735 showed up. It got fixed very
soon after my request:
https://sourceware.org/pipermail/binutils/2022-January/119078.html

So let's add patch and backported patches to all binutils versions to make
Buildroot free from bug 28735. Unfortunately Bootlin toolchains have just
been rebuilt and will fail for this bug. This happened because libgeos
has been bumped few time ago and was masked by bug 21464 dependency that
prevented to build.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...R_OR1K_GOT16-signed-overflow-by-using-spe.patch | 75 ++++++++++++++++++++++
 ...R_OR1K_GOT16-signed-overflow-by-using-spe.patch | 75 ++++++++++++++++++++++
 ...R_OR1K_GOT16-signed-overflow-by-using-spe.patch | 75 ++++++++++++++++++++++
 ...R_OR1K_GOT16-signed-overflow-by-using-spe.patch | 75 ++++++++++++++++++++++
 4 files changed, 300 insertions(+)

diff --git a/package/binutils/2.32/0016-or1k-Avoid-R_OR1K_GOT16-signed-overflow-by-using-spe.patch b/package/binutils/2.32/0016-or1k-Avoid-R_OR1K_GOT16-signed-overflow-by-using-spe.patch
new file mode 100644
index 0000000000..7e92e2bfd8
--- /dev/null
+++ b/package/binutils/2.32/0016-or1k-Avoid-R_OR1K_GOT16-signed-overflow-by-using-spe.patch
@@ -0,0 +1,75 @@
+From 51def3dc6a168d03d28e0d4e2935d9ddb2929192 Mon Sep 17 00:00:00 2001
+From: Stafford Horne <shorne@gmail.com>
+Date: Sun, 2 Jan 2022 09:03:28 +0900
+Subject: [PATCH] or1k: Avoid R_OR1K_GOT16 signed overflow by using special
+ howto
+
+Previously when fixing PR 21464 we masked out upper bits of the
+relocation value in order to avoid overflow complaints when acceptable.
+It turns out this does not work when the relocation value ends up being
+signed.
+
+To fix this this patch introduces a special howto with
+complain_on_overflow set to complain_overflow_dont.  This is used in
+place of the normal R_OR1K_GOT16 howto when we detect R_OR1K_GOT_AHI16
+relocations.
+
+bfd/ChangeLog:
+
+	PR 28735
+	* elf32-or1k.c (or1k_elf_got16_no_overflow_howto): Define.
+	(or1k_elf_relocate_section): Use new howto instead of trying to
+	mask out relocation bits.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ bfd/elf32-or1k.c | 24 ++++++++++++++++++++----
+ 1 file changed, 20 insertions(+), 4 deletions(-)
+
+diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
+index cfa292f0032..ecb70753b6a 100644
+--- a/bfd/elf32-or1k.c
++++ b/bfd/elf32-or1k.c
+@@ -828,6 +828,23 @@ static reloc_howto_type or1k_elf_howto_table[] =
+ 	FALSE),                /* pcrel_offset */
+ };
+ 
++/* A copy of the R_OR1K_GOT16 used in the presense of R_OR1K_GOT_AHI16
++   relocations when we know we can ignore overflows.  */
++static reloc_howto_type or1k_elf_got16_no_overflow_howto =
++  HOWTO (R_OR1K_GOT16,		/* type */
++	 0,			/* rightshift */
++	 2,			/* size (0 = byte, 1 = short, 2 = long) */
++	 16,			/* bitsize */
++	 FALSE,			/* pc_relative */
++	 0,			/* bitpos */
++	 complain_overflow_dont, /* complain_on_overflow */
++	 bfd_elf_generic_reloc, /* special_function */
++	 "R_OR1K_GOT16",	/* name */
++	 FALSE,			/* partial_inplace */
++	 0,			/* src_mask */
++	 0xffff,		/* dst_mask */
++	 FALSE);		/* pcrel_offset */
++
+ /* Map BFD reloc types to Or1k ELF reloc types.  */
+ 
+ struct or1k_reloc_map
+@@ -1477,12 +1494,11 @@ or1k_elf_relocate_section (bfd *output_bfd,
+ 	    if (r_type == R_OR1K_GOT_AHI16)
+ 	      saw_gotha = TRUE;
+ 
+-	    /* If we have a R_OR1K_GOT16 followed by a R_OR1K_GOT_AHI16
++	    /* If we have a R_OR1K_GOT16 following a R_OR1K_GOT_AHI16
+ 	       relocation we assume the code is doing the right thing to avoid
+-	       overflows.  Here we mask the lower 16-bit of the relocation to
+-	       avoid overflow validation failures.  */
++	       overflows.  */
+ 	    if (r_type == R_OR1K_GOT16 && saw_gotha)
+-	      relocation &= 0xffff;
++	      howto = &or1k_elf_got16_no_overflow_howto;
+ 
+ 	  /* Addend should be zero.  */
+ 	  if (rel->r_addend != 0)
+-- 
+2.25.1
+
diff --git a/package/binutils/2.35.2/0009-or1k-Avoid-R_OR1K_GOT16-signed-overflow-by-using-spe.patch b/package/binutils/2.35.2/0009-or1k-Avoid-R_OR1K_GOT16-signed-overflow-by-using-spe.patch
new file mode 100644
index 0000000000..e96d49122a
--- /dev/null
+++ b/package/binutils/2.35.2/0009-or1k-Avoid-R_OR1K_GOT16-signed-overflow-by-using-spe.patch
@@ -0,0 +1,75 @@
+From fbab8933bca6b7dba2aa19190a71f799a370c3d4 Mon Sep 17 00:00:00 2001
+From: Stafford Horne <shorne@gmail.com>
+Date: Sun, 2 Jan 2022 09:03:28 +0900
+Subject: [PATCH] or1k: Avoid R_OR1K_GOT16 signed overflow by using special
+ howto
+
+Previously when fixing PR 21464 we masked out upper bits of the
+relocation value in order to avoid overflow complaints when acceptable.
+It turns out this does not work when the relocation value ends up being
+signed.
+
+To fix this this patch introduces a special howto with
+complain_on_overflow set to complain_overflow_dont.  This is used in
+place of the normal R_OR1K_GOT16 howto when we detect R_OR1K_GOT_AHI16
+relocations.
+
+bfd/ChangeLog:
+
+	PR 28735
+	* elf32-or1k.c (or1k_elf_got16_no_overflow_howto): Define.
+	(or1k_elf_relocate_section): Use new howto instead of trying to
+	mask out relocation bits.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ bfd/elf32-or1k.c | 24 ++++++++++++++++++++----
+ 1 file changed, 20 insertions(+), 4 deletions(-)
+
+diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
+index 2ff998066a8..3df31172fcb 100644
+--- a/bfd/elf32-or1k.c
++++ b/bfd/elf32-or1k.c
+@@ -828,6 +828,23 @@ static reloc_howto_type or1k_elf_howto_table[] =
+ 	FALSE),                /* pcrel_offset */
+ };
+ 
++/* A copy of the R_OR1K_GOT16 used in the presense of R_OR1K_GOT_AHI16
++   relocations when we know we can ignore overflows.  */
++static reloc_howto_type or1k_elf_got16_no_overflow_howto =
++  HOWTO (R_OR1K_GOT16,		/* type */
++	 0,			/* rightshift */
++	 2,			/* size (0 = byte, 1 = short, 2 = long) */
++	 16,			/* bitsize */
++	 FALSE,			/* pc_relative */
++	 0,			/* bitpos */
++	 complain_overflow_dont, /* complain_on_overflow */
++	 bfd_elf_generic_reloc, /* special_function */
++	 "R_OR1K_GOT16",	/* name */
++	 FALSE,			/* partial_inplace */
++	 0,			/* src_mask */
++	 0xffff,		/* dst_mask */
++	 FALSE);		/* pcrel_offset */
++
+ /* Map BFD reloc types to Or1k ELF reloc types.  */
+ 
+ struct or1k_reloc_map
+@@ -1508,12 +1525,11 @@ or1k_elf_relocate_section (bfd *output_bfd,
+ 	    if (r_type == R_OR1K_GOT_AHI16)
+ 	      saw_gotha = TRUE;
+ 
+-	    /* If we have a R_OR1K_GOT16 followed by a R_OR1K_GOT_AHI16
++	    /* If we have a R_OR1K_GOT16 following a R_OR1K_GOT_AHI16
+ 	       relocation we assume the code is doing the right thing to avoid
+-	       overflows.  Here we mask the lower 16-bit of the relocation to
+-	       avoid overflow validation failures.  */
++	       overflows.  */
+ 	    if (r_type == R_OR1K_GOT16 && saw_gotha)
+-	      relocation &= 0xffff;
++	      howto = &or1k_elf_got16_no_overflow_howto;
+ 
+ 	  /* Addend should be zero.  */
+ 	  if (rel->r_addend != 0)
+-- 
+2.25.1
+
diff --git a/package/binutils/2.36.1/0009-or1k-Avoid-R_OR1K_GOT16-signed-overflow-by-using-spe.patch b/package/binutils/2.36.1/0009-or1k-Avoid-R_OR1K_GOT16-signed-overflow-by-using-spe.patch
new file mode 100644
index 0000000000..c4fedb719a
--- /dev/null
+++ b/package/binutils/2.36.1/0009-or1k-Avoid-R_OR1K_GOT16-signed-overflow-by-using-spe.patch
@@ -0,0 +1,75 @@
+From 190091f9c1ec4cb80f8106e45ab4125eefa4114b Mon Sep 17 00:00:00 2001
+From: Stafford Horne <shorne@gmail.com>
+Date: Sun, 2 Jan 2022 09:03:28 +0900
+Subject: [PATCH] or1k: Avoid R_OR1K_GOT16 signed overflow by using special
+ howto
+
+Previously when fixing PR 21464 we masked out upper bits of the
+relocation value in order to avoid overflow complaints when acceptable.
+It turns out this does not work when the relocation value ends up being
+signed.
+
+To fix this this patch introduces a special howto with
+complain_on_overflow set to complain_overflow_dont.  This is used in
+place of the normal R_OR1K_GOT16 howto when we detect R_OR1K_GOT_AHI16
+relocations.
+
+bfd/ChangeLog:
+
+	PR 28735
+	* elf32-or1k.c (or1k_elf_got16_no_overflow_howto): Define.
+	(or1k_elf_relocate_section): Use new howto instead of trying to
+	mask out relocation bits.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ bfd/elf32-or1k.c | 24 ++++++++++++++++++++----
+ 1 file changed, 20 insertions(+), 4 deletions(-)
+
+diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
+index 431a8ee479f..ea26cdf1033 100644
+--- a/bfd/elf32-or1k.c
++++ b/bfd/elf32-or1k.c
+@@ -828,6 +828,23 @@ static reloc_howto_type or1k_elf_howto_table[] =
+ 	FALSE),                /* pcrel_offset */
+ };
+ 
++/* A copy of the R_OR1K_GOT16 used in the presense of R_OR1K_GOT_AHI16
++   relocations when we know we can ignore overflows.  */
++static reloc_howto_type or1k_elf_got16_no_overflow_howto =
++  HOWTO (R_OR1K_GOT16,		/* type */
++	 0,			/* rightshift */
++	 2,			/* size (0 = byte, 1 = short, 2 = long) */
++	 16,			/* bitsize */
++	 FALSE,			/* pc_relative */
++	 0,			/* bitpos */
++	 complain_overflow_dont, /* complain_on_overflow */
++	 bfd_elf_generic_reloc, /* special_function */
++	 "R_OR1K_GOT16",	/* name */
++	 FALSE,			/* partial_inplace */
++	 0,			/* src_mask */
++	 0xffff,		/* dst_mask */
++	 FALSE);		/* pcrel_offset */
++
+ /* Map BFD reloc types to Or1k ELF reloc types.  */
+ 
+ struct or1k_reloc_map
+@@ -1506,12 +1523,11 @@ or1k_elf_relocate_section (bfd *output_bfd,
+ 	    if (r_type == R_OR1K_GOT_AHI16)
+ 	      saw_gotha = TRUE;
+ 
+-	    /* If we have a R_OR1K_GOT16 followed by a R_OR1K_GOT_AHI16
++	    /* If we have a R_OR1K_GOT16 following a R_OR1K_GOT_AHI16
+ 	       relocation we assume the code is doing the right thing to avoid
+-	       overflows.  Here we mask the lower 16-bit of the relocation to
+-	       avoid overflow validation failures.  */
++	       overflows.  */
+ 	    if (r_type == R_OR1K_GOT16 && saw_gotha)
+-	      relocation &= 0xffff;
++	      howto = &or1k_elf_got16_no_overflow_howto;
+ 
+ 	  /* Addend should be zero.  */
+ 	  if (rel->r_addend != 0)
+-- 
+2.25.1
+
diff --git a/package/binutils/2.37/0005-or1k-Avoid-R_OR1K_GOT16-signed-overflow-by-using-spe.patch b/package/binutils/2.37/0005-or1k-Avoid-R_OR1K_GOT16-signed-overflow-by-using-spe.patch
new file mode 100644
index 0000000000..8609db95b7
--- /dev/null
+++ b/package/binutils/2.37/0005-or1k-Avoid-R_OR1K_GOT16-signed-overflow-by-using-spe.patch
@@ -0,0 +1,75 @@
+From 362a20108782b87cd780a989c0dbd014fc2def8b Mon Sep 17 00:00:00 2001
+From: Stafford Horne <shorne@gmail.com>
+Date: Sun, 2 Jan 2022 09:03:28 +0900
+Subject: [PATCH] or1k: Avoid R_OR1K_GOT16 signed overflow by using special
+ howto
+
+Previously when fixing PR 21464 we masked out upper bits of the
+relocation value in order to avoid overflow complaints when acceptable.
+It turns out this does not work when the relocation value ends up being
+signed.
+
+To fix this this patch introduces a special howto with
+complain_on_overflow set to complain_overflow_dont.  This is used in
+place of the normal R_OR1K_GOT16 howto when we detect R_OR1K_GOT_AHI16
+relocations.
+
+bfd/ChangeLog:
+
+	PR 28735
+	* elf32-or1k.c (or1k_elf_got16_no_overflow_howto): Define.
+	(or1k_elf_relocate_section): Use new howto instead of trying to
+	mask out relocation bits.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ bfd/elf32-or1k.c | 24 ++++++++++++++++++++----
+ 1 file changed, 20 insertions(+), 4 deletions(-)
+
+diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
+index 4ae7f324d33..7fd88d72442 100644
+--- a/bfd/elf32-or1k.c
++++ b/bfd/elf32-or1k.c
+@@ -828,6 +828,23 @@ static reloc_howto_type or1k_elf_howto_table[] =
+ 	 false),		/* pcrel_offset */
+ };
+ 
++/* A copy of the R_OR1K_GOT16 used in the presense of R_OR1K_GOT_AHI16
++   relocations when we know we can ignore overflows.  */
++static reloc_howto_type or1k_elf_got16_no_overflow_howto =
++  HOWTO (R_OR1K_GOT16,		/* type */
++	 0,			/* rightshift */
++	 2,			/* size (0 = byte, 1 = short, 2 = long) */
++	 16,			/* bitsize */
++	 false,			/* pc_relative */
++	 0,			/* bitpos */
++	 complain_overflow_dont, /* complain_on_overflow */
++	 bfd_elf_generic_reloc, /* special_function */
++	 "R_OR1K_GOT16",	/* name */
++	 false,			/* partial_inplace */
++	 0,			/* src_mask */
++	 0xffff,		/* dst_mask */
++	 false);		/* pcrel_offset */
++
+ /* Map BFD reloc types to Or1k ELF reloc types.  */
+ 
+ struct or1k_reloc_map
+@@ -1506,12 +1523,11 @@ or1k_elf_relocate_section (bfd *output_bfd,
+ 	    if (r_type == R_OR1K_GOT_AHI16)
+ 	      saw_gotha = true;
+ 
+-	    /* If we have a R_OR1K_GOT16 followed by a R_OR1K_GOT_AHI16
++	    /* If we have a R_OR1K_GOT16 following a R_OR1K_GOT_AHI16
+ 	       relocation we assume the code is doing the right thing to avoid
+-	       overflows.  Here we mask the lower 16-bit of the relocation to
+-	       avoid overflow validation failures.  */
++	       overflows.  */
+ 	    if (r_type == R_OR1K_GOT16 && saw_gotha)
+-	      relocation &= 0xffff;
++	      howto = &or1k_elf_got16_no_overflow_howto;
+ 
+ 	  /* Addend should be zero.  */
+ 	  if (rel->r_addend != 0)
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
