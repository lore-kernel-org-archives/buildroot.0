Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B96C5AC7C
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 09:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A42B7608FB;
	Fri,  7 Aug 2026 09:35:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KMYhKjfpKs_y; Fri,  7 Aug 2026 09:35:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58E9360A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786095357;
	bh=QV8v7RtLTkPJUt2JNuFeMbWMX6ghq8kveS/ZZwqfsDk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ATTVtGiFiDFYgdx6LeuGgr1n2yZYu0imMSjUgjbEyM3a3ImnXEdvXKggHdFOLr1oR
	 +5+it2buLSH+nkAaiu7PlYKFnkZZoLTCivQJQmK6JSe7QOmLnDIbjKZAGs8mrw2EUu
	 wf7qWrVu/yF1XWpi7QUDGPY4lv3UGylAeipZTxOBpZt4oJBcSpHXnMD8CqJltEL8X5
	 ue0AO4QQrN7pcb4ElgxqrgWOOcyEUdCDseFsOYYH+4xaox//pRZUGU6uDSJOCuoQgz
	 dWZAJ+8RCprqZY09YDB3rIntyyzR2zRkcoAAAd07CNgAqfzHV3WOT5niP+ApgrrNcP
	 ewsDHWNUOk+SA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58E9360A4C;
	Fri,  7 Aug 2026 09:35:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 72B63282
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65396409FB
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oPyukBVeGLic for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 09:35:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD32840A10
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD32840A10
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 52EAC8CA44; Fri,  7 Aug 2026 09:34:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 7 Aug 2026 11:12:42 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: cad6826784c3f901b075a5fe3abe791dd846c2be
X-Git-Newrev: 129df625263e957e20cc1cc86c6ec9dcf3de6af8
X-Patchwork-Hint: ignore
Message-Id: <20260807093442.52EAC8CA44@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/atop: fix build
 with uclibc-ng with recent GCC
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/129df625263e957e20cc1cc86c6ec9dcf3de6af8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Add upstream patch to fix the following build issue:

    In file included from [...]/sysroot/usr/include/sys/types.h:26,
                     from atopsar.c:36:
    [...]/sysroot/usr/include/features.h:167:22: error: operator '<' has no left operand
      167 | # if _POSIX_C_SOURCE < 200809L
          |                      ^

Tested with:

    $ ./utils/test-pkg -p atop -n 1
    bootlin-armv5-uclibc [1/1]: OK

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...-explicit-value-for-_POSIX_C_SOURCE-macro.patch | 210 +++++++++++++++++++++
 1 file changed, 210 insertions(+)

diff --git a/package/atop/0001-Define-explicit-value-for-_POSIX_C_SOURCE-macro.patch b/package/atop/0001-Define-explicit-value-for-_POSIX_C_SOURCE-macro.patch
new file mode 100644
index 0000000000..0ce134e089
--- /dev/null
+++ b/package/atop/0001-Define-explicit-value-for-_POSIX_C_SOURCE-macro.patch
@@ -0,0 +1,210 @@
+From 5e853bba484d22620e8b6f97bf329da3075070b5 Mon Sep 17 00:00:00 2001
+From: Gerlof Langeveld <gerlof.langeveld@atoptool.nl>
+Date: Sat, 18 Jul 2026 12:54:39 +0200
+Subject: [PATCH] Define explicit value for _POSIX_C_SOURCE macro
+
+Certain compilers expect an explicit value for the _POSIX_C_SOURCE
+macro. It has been explicitly defined now as 200809L which is also
+the default value whenever it is not explicitly defined.
+
+Upstream: https://github.com/Atoptool/atop/commit/5e853bba484d22620e8b6f97bf329da3075070b5
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ atop.c        | 2 +-
+ atopacctd.c   | 2 +-
+ atopcat.c     | 2 +-
+ atophide.c    | 2 +-
+ atopsar.c     | 2 +-
+ cgroups.c     | 2 +-
+ drawbar.c     | 2 +-
+ gpucom.c      | 2 +-
+ netatopif.c   | 2 +-
+ photoproc.c   | 2 +-
+ photosyst.c   | 2 +-
+ rawlog.c      | 2 +-
+ showgeneric.c | 2 +-
+ various.c     | 2 +-
+ 14 files changed, 14 insertions(+), 14 deletions(-)
+
+diff --git a/atop.c b/atop.c
+index 4270715..53c9231 100644
+--- a/atop.c
++++ b/atop.c
+@@ -118,7 +118,7 @@
+ ** can be linked with 'atop'; the one to use can eventually be chosen
+ ** at runtime. 
+ */
+-#define _POSIX_C_SOURCE	
++#define _POSIX_C_SOURCE	200809L
+ #define _XOPEN_SOURCE
+ #define _GNU_SOURCE
+ #define _DEFAULT_SOURCE
+diff --git a/atopacctd.c b/atopacctd.c
+index ae87235..90deec9 100644
+--- a/atopacctd.c
++++ b/atopacctd.c
+@@ -36,7 +36,7 @@
+ ** it under the terms of the GNU General Public License version 2 as
+ ** published by the Free Software Foundation.
+ */
+-#define _POSIX_C_SOURCE
++#define _POSIX_C_SOURCE	200809L
+ #define _XOPEN_SOURCE
+ #define _GNU_SOURCE
+ #define _DEFAULT_SOURCE
+diff --git a/atopcat.c b/atopcat.c
+index aa9624d..938a0cb 100644
+--- a/atopcat.c
++++ b/atopcat.c
+@@ -28,7 +28,7 @@
+ ** Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ ** --------------------------------------------------------------------------
+ */
+-#define _POSIX_C_SOURCE
++#define _POSIX_C_SOURCE	200809L
+ #define _XOPEN_SOURCE
+ #define _GNU_SOURCE
+ #define _DEFAULT_SOURCE
+diff --git a/atophide.c b/atophide.c
+index eb87d66..fd6bbdf 100644
+--- a/atophide.c
++++ b/atophide.c
+@@ -31,7 +31,7 @@
+ ** Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ ** --------------------------------------------------------------------------
+ */
+-#define _POSIX_C_SOURCE
++#define _POSIX_C_SOURCE	200809L
+ #define _XOPEN_SOURCE
+ #define _GNU_SOURCE
+ #define _DEFAULT_SOURCE
+diff --git a/atopsar.c b/atopsar.c
+index 8874d6f..112b01f 100644
+--- a/atopsar.c
++++ b/atopsar.c
+@@ -28,7 +28,7 @@
+ ** Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ ** --------------------------------------------------------------------------
+ */
+-#define _POSIX_C_SOURCE
++#define _POSIX_C_SOURCE	200809L
+ #define _XOPEN_SOURCE
+ #define _GNU_SOURCE
+ #define _DEFAULT_SOURCE
+diff --git a/cgroups.c b/cgroups.c
+index e24e448..64b6a6a 100644
+--- a/cgroups.c
++++ b/cgroups.c
+@@ -27,7 +27,7 @@
+ ** Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ ** --------------------------------------------------------------------------
+ */
+-#define _POSIX_C_SOURCE
++#define _POSIX_C_SOURCE	200809L
+ #define _XOPEN_SOURCE
+ #define _GNU_SOURCE
+ #define _DEFAULT_SOURCE
+diff --git a/drawbar.c b/drawbar.c
+index bc3d2eb..651a81e 100644
+--- a/drawbar.c
++++ b/drawbar.c
+@@ -103,7 +103,7 @@
+ // horizontally scaled by the user, atop might switch from one model to
+ // the other.
+ /////////////////////////////////////////////////////////////////////////////
+-#define _POSIX_C_SOURCE
++#define _POSIX_C_SOURCE	200809L
+ #define _XOPEN_SOURCE
+ #define _GNU_SOURCE
+ #define _DEFAULT_SOURCE
+diff --git a/gpucom.c b/gpucom.c
+index 2335116..fddd07b 100644
+--- a/gpucom.c
++++ b/gpucom.c
+@@ -23,7 +23,7 @@
+ ** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
+ ** See the GNU General Public License for more details.
+ */
+-#define _POSIX_C_SOURCE
++#define _POSIX_C_SOURCE	200809L
+ #define _XOPEN_SOURCE
+ #define _GNU_SOURCE
+ #define _DEFAULT_SOURCE
+diff --git a/netatopif.c b/netatopif.c
+index d0e9c29..92ca4f9 100644
+--- a/netatopif.c
++++ b/netatopif.c
+@@ -22,7 +22,7 @@
+ ** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
+ ** See the GNU General Public License for more details.
+ */
+-#define _POSIX_C_SOURCE
++#define _POSIX_C_SOURCE	200809L
+ #define _XOPEN_SOURCE
+ #define _GNU_SOURCE
+ #define _DEFAULT_SOURCE
+diff --git a/photoproc.c b/photoproc.c
+index 78be340..9846691 100644
+--- a/photoproc.c
++++ b/photoproc.c
+@@ -30,7 +30,7 @@
+ ** Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ ** --------------------------------------------------------------------------
+ */
+-#define _POSIX_C_SOURCE
++#define _POSIX_C_SOURCE	200809L
+ #define _XOPEN_SOURCE
+ #define _GNU_SOURCE
+ #define _DEFAULT_SOURCE
+diff --git a/photosyst.c b/photosyst.c
+index 08489ce..303d2f9 100644
+--- a/photosyst.c
++++ b/photosyst.c
+@@ -29,7 +29,7 @@
+ ** Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ ** --------------------------------------------------------------------------
+ */
+-#define _POSIX_C_SOURCE
++#define _POSIX_C_SOURCE	200809L
+ #define _XOPEN_SOURCE
+ #define _GNU_SOURCE
+ #define _DEFAULT_SOURCE
+diff --git a/rawlog.c b/rawlog.c
+index 6a5064e..f5b7e4e 100644
+--- a/rawlog.c
++++ b/rawlog.c
+@@ -26,7 +26,7 @@
+ ** Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ ** --------------------------------------------------------------------------
+ */
+-#define _POSIX_C_SOURCE
++#define _POSIX_C_SOURCE	200809L
+ #define _XOPEN_SOURCE
+ #define _GNU_SOURCE
+ #define _DEFAULT_SOURCE
+diff --git a/showgeneric.c b/showgeneric.c
+index f3e73be..17f0ed6 100644
+--- a/showgeneric.c
++++ b/showgeneric.c
+@@ -29,7 +29,7 @@
+ ** Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ ** --------------------------------------------------------------------------
+ */
+-#define _POSIX_C_SOURCE
++#define _POSIX_C_SOURCE	200809L
+ #define _XOPEN_SOURCE
+ #define _GNU_SOURCE
+ #define _DEFAULT_SOURCE
+diff --git a/various.c b/various.c
+index 7353a52..4ff5860 100644
+--- a/various.c
++++ b/various.c
+@@ -29,7 +29,7 @@
+ ** Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ ** --------------------------------------------------------------------------
+ */
+-#define _POSIX_C_SOURCE
++#define _POSIX_C_SOURCE	200809L
+ #define _XOPEN_SOURCE
+ #define _GNU_SOURCE
+ #define _DEFAULT_SOURCE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
