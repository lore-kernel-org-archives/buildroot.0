Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F740C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 09:28:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8CC360EBD
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 09:28:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C8CC360EBD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C111828DD;
	Tue,  3 Aug 2021 09:28:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oj76M3CO5MVx; Tue,  3 Aug 2021 09:28:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66913828DE;
	Tue,  3 Aug 2021 09:28:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 388C01BF2B0
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 09:27:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27DF3828DE
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 09:27:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 61vTnwW1qkAt for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 09:27:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA6B5828DD
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 09:27:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5FC918A639; Tue,  3 Aug 2021 09:27:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Aug 2021 11:27:08 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 9c76f35500d88c75949c0bab64621b7eb79efa9f
X-Git-Newrev: 4f37a85aeae5ee4e06ec3f19244dcf31186f2a6d
X-Patchwork-Hint: ignore
Message-Id: <20210803092745.5FC918A639@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/binutils: fix
 linker assert on OpenRisc
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

commit: https://git.buildroot.net/buildroot/commit/?id=4f37a85aeae5ee4e06ec3f19244dcf31186f2a6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

When building openal we were seeing the assert failure:

/home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld: CMakeFiles/OpenAL.dir/al/source.cpp.o:
pc-relative relocation against dynamic symbol alSourcePausev
/home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld: CMakeFiles/OpenAL.dir/al/source.cpp.o:
pc-relative relocation against dynamic symbol alSourceStopv
/home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld: CMakeFiles/OpenAL.dir/al/source.cpp.o:
pc-relative relocation against dynamic symbol alSourceRewindv
/home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld: CMakeFiles/OpenAL.dir/al/source.cpp.o:
pc-relative relocation against dynamic symbol alSourcePlayv
collect2: error: ld returned 1 exit status

So add patches to fix this binutils assert link failure on OpenRisc.
It's been suggested upstream and it's pending here:
https://sourceware.org/pipermail/binutils/2021-July/117334.html

Fixes:
http://autobuild.buildroot.net/results/c96/c96f2600f227d6c76114b9fbc41f74a57e40415a/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e3b3432fc0d9a960738a831a88572ac0124d3259)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-relative-relocation-against-dynamic-on-P.patch | 59 ++++++++++++++++++++++
 ...-relative-relocation-against-dynamic-on-P.patch | 59 ++++++++++++++++++++++
 ...-relative-relocation-against-dynamic-on-P.patch | 59 ++++++++++++++++++++++
 ...-relative-relocation-against-dynamic-on-P.patch | 59 ++++++++++++++++++++++
 4 files changed, 236 insertions(+)

diff --git a/package/binutils/2.32/0015-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch b/package/binutils/2.32/0015-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch
new file mode 100644
index 0000000000..585b97b2af
--- /dev/null
+++ b/package/binutils/2.32/0015-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch
@@ -0,0 +1,59 @@
+From 9af93e143a7fbdb75aa1ed37277f9250eb111628 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Sat, 10 Jul 2021 17:57:34 +0200
+Subject: [PATCH] or1k: fix pc-relative relocation against dynamic on PC
+ relative 26 bit relocation
+
+When building openal we were seeing the assert failure:
+
+/home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld: CMakeFiles/OpenAL.dir/al/source.cpp.o:
+pc-relative relocation against dynamic symbol alSourcePausev
+/home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld: CMakeFiles/OpenAL.dir/al/source.cpp.o:
+pc-relative relocation against dynamic symbol alSourceStopv
+/home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld: CMakeFiles/OpenAL.dir/al/source.cpp.o:
+pc-relative relocation against dynamic symbol alSourceRewindv
+/home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld: CMakeFiles/OpenAL.dir/al/source.cpp.o:
+pc-relative relocation against dynamic symbol alSourcePlayv
+collect2: error: ld returned 1 exit status
+
+This happens because in R_OR1K_INSN_REL_26 case we can't reference local
+symbol as previously done but we need to make sure that calls to actual
+symbol always call the version of current object.
+
+bfd/Changelog:
+
+	* elf32-or1k.c (or1k_elf_relocate_section): use a separate entry
+	  in switch case R_OR1K_INSN_REL_26 where we need to check for
+	  !SYMBOL_CALLS_LOCAL() instead of !SYMBOL_REFERENCES_LOCAL().
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ bfd/elf32-or1k.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
+index 4ae7f324d33..4f9092539f5 100644
+--- a/bfd/elf32-or1k.c
++++ b/bfd/elf32-or1k.c
+@@ -1543,6 +1543,18 @@ or1k_elf_relocate_section (bfd *output_bfd,
+ 	  break;
+ 
+ 	case R_OR1K_INSN_REL_26:
++	  /* For a non-shared link, these will reference plt or call the
++	     version of actual object.  */
++	  if (bfd_link_pic (info) && !SYMBOL_CALLS_LOCAL (info, h))
++	    {
++	      _bfd_error_handler
++		(_("%pB: pc-relative relocation against dynamic symbol %s"),
++		 input_bfd, name);
++	      ret_val = FALSE;
++	      bfd_set_error (bfd_error_bad_value);
++	    }
++	  break;
++
+ 	case R_OR1K_PCREL_PG21:
+ 	case R_OR1K_LO13:
+ 	case R_OR1K_SLO13:
+-- 
+2.25.1
+
diff --git a/package/binutils/2.34/0008-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch b/package/binutils/2.34/0008-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch
new file mode 100644
index 0000000000..585b97b2af
--- /dev/null
+++ b/package/binutils/2.34/0008-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch
@@ -0,0 +1,59 @@
+From 9af93e143a7fbdb75aa1ed37277f9250eb111628 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Sat, 10 Jul 2021 17:57:34 +0200
+Subject: [PATCH] or1k: fix pc-relative relocation against dynamic on PC
+ relative 26 bit relocation
+
+When building openal we were seeing the assert failure:
+
+/home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld: CMakeFiles/OpenAL.dir/al/source.cpp.o:
+pc-relative relocation against dynamic symbol alSourcePausev
+/home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld: CMakeFiles/OpenAL.dir/al/source.cpp.o:
+pc-relative relocation against dynamic symbol alSourceStopv
+/home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld: CMakeFiles/OpenAL.dir/al/source.cpp.o:
+pc-relative relocation against dynamic symbol alSourceRewindv
+/home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld: CMakeFiles/OpenAL.dir/al/source.cpp.o:
+pc-relative relocation against dynamic symbol alSourcePlayv
+collect2: error: ld returned 1 exit status
+
+This happens because in R_OR1K_INSN_REL_26 case we can't reference local
+symbol as previously done but we need to make sure that calls to actual
+symbol always call the version of current object.
+
+bfd/Changelog:
+
+	* elf32-or1k.c (or1k_elf_relocate_section): use a separate entry
+	  in switch case R_OR1K_INSN_REL_26 where we need to check for
+	  !SYMBOL_CALLS_LOCAL() instead of !SYMBOL_REFERENCES_LOCAL().
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ bfd/elf32-or1k.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
+index 4ae7f324d33..4f9092539f5 100644
+--- a/bfd/elf32-or1k.c
++++ b/bfd/elf32-or1k.c
+@@ -1543,6 +1543,18 @@ or1k_elf_relocate_section (bfd *output_bfd,
+ 	  break;
+ 
+ 	case R_OR1K_INSN_REL_26:
++	  /* For a non-shared link, these will reference plt or call the
++	     version of actual object.  */
++	  if (bfd_link_pic (info) && !SYMBOL_CALLS_LOCAL (info, h))
++	    {
++	      _bfd_error_handler
++		(_("%pB: pc-relative relocation against dynamic symbol %s"),
++		 input_bfd, name);
++	      ret_val = FALSE;
++	      bfd_set_error (bfd_error_bad_value);
++	    }
++	  break;
++
+ 	case R_OR1K_PCREL_PG21:
+ 	case R_OR1K_LO13:
+ 	case R_OR1K_SLO13:
+-- 
+2.25.1
+
diff --git a/package/binutils/2.35.2/0008-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch b/package/binutils/2.35.2/0008-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch
new file mode 100644
index 0000000000..585b97b2af
--- /dev/null
+++ b/package/binutils/2.35.2/0008-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch
@@ -0,0 +1,59 @@
+From 9af93e143a7fbdb75aa1ed37277f9250eb111628 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Sat, 10 Jul 2021 17:57:34 +0200
+Subject: [PATCH] or1k: fix pc-relative relocation against dynamic on PC
+ relative 26 bit relocation
+
+When building openal we were seeing the assert failure:
+
+/home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld: CMakeFiles/OpenAL.dir/al/source.cpp.o:
+pc-relative relocation against dynamic symbol alSourcePausev
+/home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld: CMakeFiles/OpenAL.dir/al/source.cpp.o:
+pc-relative relocation against dynamic symbol alSourceStopv
+/home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld: CMakeFiles/OpenAL.dir/al/source.cpp.o:
+pc-relative relocation against dynamic symbol alSourceRewindv
+/home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld: CMakeFiles/OpenAL.dir/al/source.cpp.o:
+pc-relative relocation against dynamic symbol alSourcePlayv
+collect2: error: ld returned 1 exit status
+
+This happens because in R_OR1K_INSN_REL_26 case we can't reference local
+symbol as previously done but we need to make sure that calls to actual
+symbol always call the version of current object.
+
+bfd/Changelog:
+
+	* elf32-or1k.c (or1k_elf_relocate_section): use a separate entry
+	  in switch case R_OR1K_INSN_REL_26 where we need to check for
+	  !SYMBOL_CALLS_LOCAL() instead of !SYMBOL_REFERENCES_LOCAL().
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ bfd/elf32-or1k.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
+index 4ae7f324d33..4f9092539f5 100644
+--- a/bfd/elf32-or1k.c
++++ b/bfd/elf32-or1k.c
+@@ -1543,6 +1543,18 @@ or1k_elf_relocate_section (bfd *output_bfd,
+ 	  break;
+ 
+ 	case R_OR1K_INSN_REL_26:
++	  /* For a non-shared link, these will reference plt or call the
++	     version of actual object.  */
++	  if (bfd_link_pic (info) && !SYMBOL_CALLS_LOCAL (info, h))
++	    {
++	      _bfd_error_handler
++		(_("%pB: pc-relative relocation against dynamic symbol %s"),
++		 input_bfd, name);
++	      ret_val = FALSE;
++	      bfd_set_error (bfd_error_bad_value);
++	    }
++	  break;
++
+ 	case R_OR1K_PCREL_PG21:
+ 	case R_OR1K_LO13:
+ 	case R_OR1K_SLO13:
+-- 
+2.25.1
+
diff --git a/package/binutils/2.36.1/0008-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch b/package/binutils/2.36.1/0008-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch
new file mode 100644
index 0000000000..585b97b2af
--- /dev/null
+++ b/package/binutils/2.36.1/0008-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch
@@ -0,0 +1,59 @@
+From 9af93e143a7fbdb75aa1ed37277f9250eb111628 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Sat, 10 Jul 2021 17:57:34 +0200
+Subject: [PATCH] or1k: fix pc-relative relocation against dynamic on PC
+ relative 26 bit relocation
+
+When building openal we were seeing the assert failure:
+
+/home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld: CMakeFiles/OpenAL.dir/al/source.cpp.o:
+pc-relative relocation against dynamic symbol alSourcePausev
+/home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld: CMakeFiles/OpenAL.dir/al/source.cpp.o:
+pc-relative relocation against dynamic symbol alSourceStopv
+/home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld: CMakeFiles/OpenAL.dir/al/source.cpp.o:
+pc-relative relocation against dynamic symbol alSourceRewindv
+/home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld: CMakeFiles/OpenAL.dir/al/source.cpp.o:
+pc-relative relocation against dynamic symbol alSourcePlayv
+collect2: error: ld returned 1 exit status
+
+This happens because in R_OR1K_INSN_REL_26 case we can't reference local
+symbol as previously done but we need to make sure that calls to actual
+symbol always call the version of current object.
+
+bfd/Changelog:
+
+	* elf32-or1k.c (or1k_elf_relocate_section): use a separate entry
+	  in switch case R_OR1K_INSN_REL_26 where we need to check for
+	  !SYMBOL_CALLS_LOCAL() instead of !SYMBOL_REFERENCES_LOCAL().
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ bfd/elf32-or1k.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
+index 4ae7f324d33..4f9092539f5 100644
+--- a/bfd/elf32-or1k.c
++++ b/bfd/elf32-or1k.c
+@@ -1543,6 +1543,18 @@ or1k_elf_relocate_section (bfd *output_bfd,
+ 	  break;
+ 
+ 	case R_OR1K_INSN_REL_26:
++	  /* For a non-shared link, these will reference plt or call the
++	     version of actual object.  */
++	  if (bfd_link_pic (info) && !SYMBOL_CALLS_LOCAL (info, h))
++	    {
++	      _bfd_error_handler
++		(_("%pB: pc-relative relocation against dynamic symbol %s"),
++		 input_bfd, name);
++	      ret_val = FALSE;
++	      bfd_set_error (bfd_error_bad_value);
++	    }
++	  break;
++
+ 	case R_OR1K_PCREL_PG21:
+ 	case R_OR1K_LO13:
+ 	case R_OR1K_SLO13:
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
