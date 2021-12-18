Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11B3C433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Dec 2021 13:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3729742286;
	Sat, 18 Dec 2021 13:01:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bP3LOQJqQNPj; Sat, 18 Dec 2021 13:01:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7502542284;
	Sat, 18 Dec 2021 13:01:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 16EA31BF5DB
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 13:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10D9142284
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 13:01:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LSe_l0AB0n4v for <buildroot@lists.busybox.net>;
 Sat, 18 Dec 2021 13:01:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 417EB42283
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 13:01:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id B8BA182258; Sat, 18 Dec 2021 12:55:44 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Dec 2021 14:00:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3ba8e88e396f216ac8486580b8817aac92ae93b2
X-Git-Newrev: debc50bd594f98aa433e2de336018d769a3496ec
X-Patchwork-Hint: ignore
Message-Id: <20211218125544.B8BA182258@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/grep: fix build with microblazeel
 and or1k
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

commit: https://git.buildroot.net/buildroot/commit/?id=debc50bd594f98aa433e2de336018d769a3496ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with microblazeel and or1k raised since
bump to version 3.7 in commit f1f0b633eb1c4bc006b95daad8f299028e89d19d:

sigsegv.c: In function 'sigsegv_handler':
sigsegv.c:979:28: error: 'struct vma_struct' has no member named 'is_near_this'
  979 |                       : vma.is_near_this (addr, &vma))
      |

Fixes:
 - http://autobuild.buildroot.org/results/78142463ba8cc5f6c1bf15295095a271422294f4
 - http://autobuild.buildroot.org/results/f300b1b5e958f096a9d58197a44dcf0c2abd3585

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-sigsegv-fix-build-on-microblazeel.patch   | 32 ++++++++++++++++++++++
 package/grep/0002-sigsegv-fix-build-on-or1k.patch  | 32 ++++++++++++++++++++++
 package/grep/grep.mk                               |  2 ++
 3 files changed, 66 insertions(+)

diff --git a/package/grep/0001-sigsegv-fix-build-on-microblazeel.patch b/package/grep/0001-sigsegv-fix-build-on-microblazeel.patch
new file mode 100644
index 0000000000..06869b716e
--- /dev/null
+++ b/package/grep/0001-sigsegv-fix-build-on-microblazeel.patch
@@ -0,0 +1,32 @@
+From 3079cea1b18fe72aa1da6b04e561abfb36f4f443 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 11 Nov 2021 09:57:23 +0100
+Subject: sigsegv: fix build on microblazeel
+
+Fix the following build failure on microblazeel with diffutils 3.8:
+sigsegv.c:979:28: error: 'struct vma_struct' has no member named 'is_near_this'
+http://autobuild.buildroot.org/results/5ecd55b7c72f9630a7acc72341ccb60e94ddb574
+
+[Retrieved from:
+https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=3079cea1b18fe72aa1da6b04e561abfb36f4f443]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ m4/stack-direction.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/m4/stack-direction.m4 b/m4/stack-direction.m4
+index c90d69733..70286c8f5 100644
+--- a/m4/stack-direction.m4
++++ b/m4/stack-direction.m4
+@@ -37,7 +37,7 @@ AC_DEFUN([SV_STACK_DIRECTION],
+       m68* | \
+       m88k | \
+       mcore | \
+-      microblaze | \
++      microblaze* | \
+       mips* | \
+       mmix | \
+       mn10200 | \
+-- 
+cgit v1.2.1
+
diff --git a/package/grep/0002-sigsegv-fix-build-on-or1k.patch b/package/grep/0002-sigsegv-fix-build-on-or1k.patch
new file mode 100644
index 0000000000..73385fe9f7
--- /dev/null
+++ b/package/grep/0002-sigsegv-fix-build-on-or1k.patch
@@ -0,0 +1,32 @@
+From 496c1740e5475be85b65fdb2b143771f09ed27cb Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 11 Nov 2021 10:06:31 +0100
+Subject: sigsegv: fix build on or1k
+
+Fix the following build failure on or1k with diffutils 3.8
+https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=e54aa6196947ed22ff66bcd714e4fc7bd0c5c3b4
+sigsegv.c:979:28: error: 'struct vma_struct' has no member named 'is_near_this'
+http://autobuild.buildroot.org/results/5427e52489d29ed4f18b4a70b3c36f0f7bb0ddd9
+
+[Retrieved from:
+https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=496c1740e5475be85b65fdb2b143771f09ed27cb]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ m4/stack-direction.m4 | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/m4/stack-direction.m4 b/m4/stack-direction.m4
+index 70286c8f5..29e398d77 100644
+--- a/m4/stack-direction.m4
++++ b/m4/stack-direction.m4
+@@ -45,6 +45,7 @@ AC_DEFUN([SV_STACK_DIRECTION],
+       nios2 | \
+       nds32* | \
+       ns32k | \
++      or1k | \
+       pdp11 | \
+       pj* | \
+       powerpc* | rs6000 | \
+-- 
+cgit v1.2.1
+
diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index 233f5fe633..a485f23dc7 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -10,6 +10,8 @@ GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_LICENSE = GPL-3.0+
 GREP_LICENSE_FILES = COPYING
 GREP_CPE_ID_VENDOR = gnu
+# We're patching m4/stack-direction.m4
+GREP_AUTORECONF = YES
 GREP_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 # install into /bin like busybox grep
 GREP_CONF_OPTS = --exec-prefix=/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
