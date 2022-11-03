Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966F7C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32D3B81FF9;
	Thu,  3 Nov 2022 21:28:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32D3B81FF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wZ2cMy2LqTWR; Thu,  3 Nov 2022 21:28:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31B8281FFB;
	Thu,  3 Nov 2022 21:28:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31B8281FFB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B12C11BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BF7C81E88
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:12:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BF7C81E88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dxY4Kyg4nNt3 for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 21:12:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8BBD81E29
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 21:12:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8BBD81E29
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9599287C35; Thu,  3 Nov 2022 21:12:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 22:12:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aa8903447ca1c8da34b205d67cda4161723fd048
X-Git-Newrev: 5adf96d5bd3a580ab47e74ef8988594435a18a20
X-Patchwork-Hint: ignore
Message-Id: <20221103211211.9599287C35@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/makedumpfile: fix mips64 build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5adf96d5bd3a580ab47e74ef8988594435a18a20
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following mips64 build failure raised since commit
0b389385666687ecfd09cdbce6c6ecfd74ce11ab:

makedumpfile.c: In function 'is_kvaddr':
makedumpfile.c:1613:39: error: 'KVBASE' undeclared (first use in this function)
  return (addr >= (unsigned long long)(KVBASE));
                                       ^~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/94824fa8baa8edb99a5ca245e5561e0c4e430638

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/makedumpfile/0002-Handle-__mips64.patch | 69 +++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/package/makedumpfile/0002-Handle-__mips64.patch b/package/makedumpfile/0002-Handle-__mips64.patch
new file mode 100644
index 0000000000..fd3fdbbb39
--- /dev/null
+++ b/package/makedumpfile/0002-Handle-__mips64.patch
@@ -0,0 +1,69 @@
+From a5779893ee087409b2d1fe391ead102defe0f00b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 2 Nov 2022 13:00:00 +0100
+Subject: [PATCH] Handle __mips64
+
+Handle __mips64 as __mips64__ to avoid the following build failure:
+
+makedumpfile.c: In function 'is_kvaddr':
+makedumpfile.c:1613:39: error: 'KVBASE' undeclared (first use in this function)
+  return (addr >= (unsigned long long)(KVBASE));
+                                       ^~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/94824fa8baa8edb99a5ca245e5561e0c4e430638
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/makedumpfile/makedumpfile/pull/11]
+---
+ arch/mips64.c  | 2 +-
+ makedumpfile.h | 6 +++---
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/arch/mips64.c b/arch/mips64.c
+index ab45b6e..fd987b0 100644
+--- a/arch/mips64.c
++++ b/arch/mips64.c
+@@ -16,7 +16,7 @@
+  * along with this program; if not, write to the Free Software
+  * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+  */
+-#ifdef __mips64__
++#if defined(__mips64__) || defined(__mips64)
+ 
+ #include "../print_info.h"
+ #include "../elf_info.h"
+diff --git a/makedumpfile.h b/makedumpfile.h
+index 70a1a91..3842f9c 100644
+--- a/makedumpfile.h
++++ b/makedumpfile.h
+@@ -963,7 +963,7 @@ typedef unsigned long pgd_t;
+ 
+ #endif          /* sparc64 */
+ 
+-#ifdef __mips64__ /* mips64 */
++#if defined(__mips64__) || defined(__mips64) /* mips64 */
+ #define KVBASE			PAGE_OFFSET
+ 
+ #ifndef _XKPHYS_START_ADDR
+@@ -1204,7 +1204,7 @@ unsigned long long vaddr_to_paddr_sparc64(unsigned long vaddr);
+ #define arch_crashkernel_mem_size()	stub_false()
+ #endif		/* sparc64 */
+ 
+-#ifdef __mips64__ /* mips64 */
++#if defined(__mips64__) || defined(__mips64) /* mips64 */
+ int get_phys_base_mips64(void);
+ int get_machdep_info_mips64(void);
+ int get_versiondep_info_mips64(void);
+@@ -2364,7 +2364,7 @@ int get_xen_info_ia64(void);
+ #define get_xen_info_arch(X) FALSE
+ #endif	/* sparc64 */
+ 
+-#ifdef __mips64__ /* mips64 */
++#if defined(__mips64__) || defined(__mips64) /* mips64 */
+ #define kvtop_xen(X)	FALSE
+ #define get_xen_basic_info_arch(X) FALSE
+ #define get_xen_info_arch(X) FALSE
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
