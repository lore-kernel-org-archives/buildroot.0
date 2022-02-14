Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8097FC433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 21:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3932760B42;
	Mon, 14 Feb 2022 21:06:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jA3NC6o5fV7u; Mon, 14 Feb 2022 21:06:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48C6760B15;
	Mon, 14 Feb 2022 21:06:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DC0B91BF275
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 21:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CAA7840904
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 21:05:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uQQEDrtkTKws for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 21:05:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0CC7408F6
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 21:05:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A320A82A4E; Mon, 14 Feb 2022 20:58:21 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 14 Feb 2022 22:01:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5194113331b04c5fee1a773e1751b40bff6fdd18
X-Git-Newrev: 91f241b8e967d114076cd4e5533213b8f2fb27ce
X-Patchwork-Hint: ignore
Message-Id: <20220214205821.A320A82A4E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/binutils: fixes glibc build
 compiled with -Os on x86
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

commit: https://git.buildroot.net/buildroot/commit/?id=91f241b8e967d114076cd4e5533213b8f2fb27ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See here:
https://sourceware.org/bugzilla/show_bug.cgi?id=28870

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...low-GOT32-relocations-against-ABS-symbols.patch | 46 +++++++++++++++++++
 ...low-GOT32-relocations-against-ABS-symbols.patch | 53 ++++++++++++++++++++++
 ...low-GOT32-relocations-against-ABS-symbols.patch | 47 +++++++++++++++++++
 3 files changed, 146 insertions(+)

diff --git a/package/binutils/2.35.2/0010-i386-Allow-GOT32-relocations-against-ABS-symbols.patch b/package/binutils/2.35.2/0010-i386-Allow-GOT32-relocations-against-ABS-symbols.patch
new file mode 100644
index 0000000000..e95eb1e7c5
--- /dev/null
+++ b/package/binutils/2.35.2/0010-i386-Allow-GOT32-relocations-against-ABS-symbols.patch
@@ -0,0 +1,46 @@
+From 30a954525f4e53a9cd50a1a8a6f201c7cf6595c7 Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Mon, 7 Feb 2022 15:22:19 -0800
+Subject: [PATCH] i386: Allow GOT32 relocations against ABS symbols
+
+GOT32 relocations are allowed since absolute value + addend is stored in
+the GOT slot.
+
+Tested on glibc 2.35 build with GCC 11.2 and -Os.
+
+bfd/
+
+	PR ld/28870
+	* elfxx-x86.c (_bfd_elf_x86_valid_reloc_p): Also allow GOT32
+	relocations.
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff --git a/bfd/elfxx-x86.c b/bfd/elfxx-x86.c
+index 7ac2411fc80..d00dc45677b 100644
+--- a/bfd/elfxx-x86.c
++++ b/bfd/elfxx-x86.c
+@@ -1942,9 +1942,9 @@ _bfd_elf_x86_valid_reloc_p (asection *input_section,
+       irel = *rel;
+ 
+       /* Only allow relocations against absolute symbol, which can be
+-	 resolved as absolute value + addend.  GOTPCREL relocations
+-	 are allowed since absolute value + addend is stored in the
+-	 GOT slot.  */
++	 resolved as absolute value + addend.  GOTPCREL and GOT32
++	 relocations are allowed since absolute value + addend is
++	 stored in the GOT slot.  */
+       if (bed->target_id == X86_64_ELF_DATA)
+ 	{
+ 	  r_type &= ~R_X86_64_converted_reloc_bit;
+@@ -1965,7 +1965,9 @@ _bfd_elf_x86_valid_reloc_p (asection *input_section,
+       else
+ 	valid_p = (r_type == R_386_32
+ 		   || r_type == R_386_16
+-		   || r_type == R_386_8);
++		   || r_type == R_386_8
++		   || r_type == R_386_GOT32
++		   || r_type == R_386_GOT32X);
+ 
+       if (valid_p)
+ 	*no_dynreloc_p = true;
diff --git a/package/binutils/2.36.1/0010-i386-Allow-GOT32-relocations-against-ABS-symbols.patch b/package/binutils/2.36.1/0010-i386-Allow-GOT32-relocations-against-ABS-symbols.patch
new file mode 100644
index 0000000000..af96f1a0f0
--- /dev/null
+++ b/package/binutils/2.36.1/0010-i386-Allow-GOT32-relocations-against-ABS-symbols.patch
@@ -0,0 +1,53 @@
+From 30a954525f4e53a9cd50a1a8a6f201c7cf6595c7 Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Mon, 7 Feb 2022 15:22:19 -0800
+Subject: [PATCH] i386: Allow GOT32 relocations against ABS symbols
+
+GOT32 relocations are allowed since absolute value + addend is stored in
+the GOT slot.
+
+Tested on glibc 2.35 build with GCC 11.2 and -Os.
+
+bfd/
+
+	PR ld/28870
+	* elfxx-x86.c (_bfd_elf_x86_valid_reloc_p): Also allow GOT32
+	relocations.
+
+ld/
+
+	PR ld/28870
+	* testsuite/ld-i386/i386.exp: Run pr28870.
+	* testsuite/ld-i386/pr28870.d: New file.
+	* testsuite/ld-i386/pr28870.s: Likewise.
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff --git a/bfd/elfxx-x86.c b/bfd/elfxx-x86.c
+index 7ac2411fc80..d00dc45677b 100644
+--- a/bfd/elfxx-x86.c
++++ b/bfd/elfxx-x86.c
+@@ -1942,9 +1942,9 @@ _bfd_elf_x86_valid_reloc_p (asection *input_section,
+       irel = *rel;
+ 
+       /* Only allow relocations against absolute symbol, which can be
+-	 resolved as absolute value + addend.  GOTPCREL relocations
+-	 are allowed since absolute value + addend is stored in the
+-	 GOT slot.  */
++	 resolved as absolute value + addend.  GOTPCREL and GOT32
++	 relocations are allowed since absolute value + addend is
++	 stored in the GOT slot.  */
+       if (bed->target_id == X86_64_ELF_DATA)
+ 	{
+ 	  r_type &= ~R_X86_64_converted_reloc_bit;
+@@ -1965,7 +1965,9 @@ _bfd_elf_x86_valid_reloc_p (asection *input_section,
+       else
+ 	valid_p = (r_type == R_386_32
+ 		   || r_type == R_386_16
+-		   || r_type == R_386_8);
++		   || r_type == R_386_8
++		   || r_type == R_386_GOT32
++		   || r_type == R_386_GOT32X);
+ 
+       if (valid_p)
+ 	*no_dynreloc_p = true;
diff --git a/package/binutils/2.37/0007-i386-Allow-GOT32-relocations-against-ABS-symbols.patch b/package/binutils/2.37/0007-i386-Allow-GOT32-relocations-against-ABS-symbols.patch
new file mode 100644
index 0000000000..3e29282261
--- /dev/null
+++ b/package/binutils/2.37/0007-i386-Allow-GOT32-relocations-against-ABS-symbols.patch
@@ -0,0 +1,47 @@
+From 30a954525f4e53a9cd50a1a8a6f201c7cf6595c7 Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Mon, 7 Feb 2022 15:22:19 -0800
+Subject: [PATCH] i386: Allow GOT32 relocations against ABS symbols
+
+GOT32 relocations are allowed since absolute value + addend is stored in
+the GOT slot.
+
+Tested on glibc 2.35 build with GCC 11.2 and -Os.
+
+bfd/
+
+	PR ld/28870
+	* elfxx-x86.c (_bfd_elf_x86_valid_reloc_p): Also allow GOT32
+	relocations.
+
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff --git a/bfd/elfxx-x86.c b/bfd/elfxx-x86.c
+index 7ac2411fc80..d00dc45677b 100644
+--- a/bfd/elfxx-x86.c
++++ b/bfd/elfxx-x86.c
+@@ -1942,9 +1942,9 @@ _bfd_elf_x86_valid_reloc_p (asection *input_section,
+       irel = *rel;
+ 
+       /* Only allow relocations against absolute symbol, which can be
+-	 resolved as absolute value + addend.  GOTPCREL relocations
+-	 are allowed since absolute value + addend is stored in the
+-	 GOT slot.  */
++	 resolved as absolute value + addend.  GOTPCREL and GOT32
++	 relocations are allowed since absolute value + addend is
++	 stored in the GOT slot.  */
+       if (bed->target_id == X86_64_ELF_DATA)
+ 	{
+ 	  r_type &= ~R_X86_64_converted_reloc_bit;
+@@ -1965,7 +1965,9 @@ _bfd_elf_x86_valid_reloc_p (asection *input_section,
+       else
+ 	valid_p = (r_type == R_386_32
+ 		   || r_type == R_386_16
+-		   || r_type == R_386_8);
++		   || r_type == R_386_8
++		   || r_type == R_386_GOT32
++		   || r_type == R_386_GOT32X);
+ 
+       if (valid_p)
+ 	*no_dynreloc_p = true;
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
