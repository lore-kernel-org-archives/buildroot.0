Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B92DC48BF6
	for <buildroot@archiver.kernel.org>; Sun, 18 Feb 2024 20:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D80C4060F;
	Sun, 18 Feb 2024 20:12:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u-fcTGjSLW3u; Sun, 18 Feb 2024 20:12:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02A60405FF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02A60405FF;
	Sun, 18 Feb 2024 20:12:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 22A911BF488
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 20:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0ED6B60675
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 20:12:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VZxZOLLV4ghQ for <buildroot@lists.busybox.net>;
 Sun, 18 Feb 2024 20:12:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 187A060639
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 187A060639
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 20:12:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B8B5A87876; Sun, 18 Feb 2024 20:12:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 18 Feb 2024 21:12:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2c6dc1fed354696a706fe5ecc93c4089b8bd64bd
X-Git-Newrev: 4b34b8ccfa5159d643ecbac12c42c638e3b27e5e
X-Patchwork-Hint: ignore
Message-Id: <20240218201238.B8B5A87876@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/attr: fix build failure on
 Microblaze architecture
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

commit: https://git.buildroot.net/buildroot/commit/?id=4b34b8ccfa5159d643ecbac12c42c638e3b27e5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On Microblaze architecture __has_attribute(__symver__) support is broken
and always return true even if symver is not supported so let's add an
upstream patch to detect if symver is supported during autoreconf. Let's
also add ATTR_AUTORECONF = YES to let patch to affect building.

Fixes:
http://autobuild.buildroot.org/results/29c76e02becedf922bd7dc0533338c078bf77d2a

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ....ac-add-detection-of-symver-gcc-attribute.patch | 75 ++++++++++++++++++++++
 package/attr/attr.mk                               |  3 +
 2 files changed, 78 insertions(+)

diff --git a/package/attr/0002-configure.ac-add-detection-of-symver-gcc-attribute.patch b/package/attr/0002-configure.ac-add-detection-of-symver-gcc-attribute.patch
new file mode 100644
index 0000000000..ee029e9735
--- /dev/null
+++ b/package/attr/0002-configure.ac-add-detection-of-symver-gcc-attribute.patch
@@ -0,0 +1,75 @@
+From 365426c28f8bf73d34d77cc06b7d5ffeae17f13a Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Tue, 6 Feb 2024 15:33:15 +0100
+Subject: [PATCH] configure.ac: add detection of symver gcc attribute
+
+On non-ELF platforms, such as microblaze, builds will fail when trying
+to add symver information because  __attribute__((symver ..)) is not
+supported even though __has_attribute(__symver__) returns true.
+
+Support for symver needs to be detected via a compile test since
+__has_attribute can report false positives [0].
+
+Add a configure compile check for __attribute__((symver ..)) to ensure
+it is supported and define a variable to advertise support.
+
+[0] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101766#c1
+
+Upstream: https://git.savannah.nongnu.org/cgit/attr.git/commit/?id=943c776089dbb24ebbfb7432ba9841f1845bf95a
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+[Giulio: rework local patch for #if nesting]
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ configure.ac       | 15 +++++++++++++++
+ libattr/syscalls.c |  8 ++++----
+ 2 files changed, 19 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 7e362e9..98477b5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -57,6 +57,21 @@ AS_CASE([$host_os],
+ 	[linux*], [os_linux=yes])
+ AM_CONDITIONAL([OS_LINUX], [test "x$os_linux" = "xyes"])
+ 
++AC_CACHE_CHECK(whether __attribute__((__symver__())) is supported,
++	gcc_cv_symver_attribute,
++	[cat > conftest.c <<EOF
++void foo (void) {}
++__typeof(foo) foo __attribute__ ((__symver__("foo@foo")));
++EOF
++	gcc_cv_symver_attribute=no
++	if ${CC-cc} -Werror -S conftest.c -o conftest.s >/dev/null 2>&1; then \
++	    gcc_cv_symver_attribute=yes
++	fi
++	rm -f conftest.[cs]
++])
++AS_IF([test $gcc_cv_symver_attribute = yes],
++      [AC_DEFINE(HAVE_SYMVER_ATTRIBUTE, [], [GCC supports symver attribute])])
++
+ AC_CONFIG_COMMANDS([include/attr],
+ 	[dnl
+ 	rm -rf include/attr
+diff --git a/libattr/syscalls.c b/libattr/syscalls.c
+index 907560a..7ee6d39 100644
+--- a/libattr/syscalls.c
++++ b/libattr/syscalls.c
+@@ -31,10 +31,10 @@
+  * prefer symver attribute if available (since gcc 10),
+  * fall back to traditional .symver asm directive otherwise.
+  */
+-#ifdef __has_attribute
+-# if __has_attribute(__symver__)
+-#  define SYMVER(cn, vn) __typeof(cn) cn __attribute__((__symver__(vn)))
+-# elif __has_attribute(__no_reorder__)
++#if defined(HAVE_SYMVER_ATTRIBUTE)
++# define SYMVER(cn, vn) __typeof(cn) cn __attribute__((__symver__(vn)))
++#elif defined(__has_attribute)
++# if __has_attribute(__no_reorder__)
+    /*
+     * Avoid wrong partitioning with older gcc and LTO. May not work reliably
+     * with all versions; use -flto-partition=none if you encounter problems.
+-- 
+2.34.1
+
diff --git a/package/attr/attr.mk b/package/attr/attr.mk
index d1397921ff..1d24144f46 100644
--- a/package/attr/attr.mk
+++ b/package/attr/attr.mk
@@ -11,6 +11,9 @@ ATTR_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 ATTR_LICENSE_FILES = doc/COPYING doc/COPYING.LGPL
 ATTR_CPE_ID_VALID = YES
 
+# Flag added for patch dealing with symver in configure.ac
+ATTR_AUTORECONF = YES
+
 ATTR_INSTALL_STAGING = YES
 
 ATTR_CONF_OPTS = --disable-nls
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
