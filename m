Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD58BC3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 13:15:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50964600C7;
	Sun, 14 Jul 2024 13:15:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JyGhiUVjSok9; Sun, 14 Jul 2024 13:15:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 026E260606
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 026E260606;
	Sun, 14 Jul 2024 13:15:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3AB7B1BF3D8
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 13:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27F85401B2
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 13:15:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CFSc4xLFhdsv for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 13:15:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC84740010
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC84740010
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 13:15:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A95E78675F; Sun, 14 Jul 2024 13:15:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 15:14:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e9960267e6208423b4656a152b3e576b4e5bd027
X-Git-Newrev: 654e35951237015cf4d5d48a30ed0cc9bdd33138
X-Patchwork-Hint: ignore
Message-Id: <20240714131500.A95E78675F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/prelink-cross: revert back to
 a853a5d71 to fix build
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
Content-Type: multipart/mixed; boundary="===============1724996165590252240=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1724996165590252240==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=654e35951237015cf4d5d48a30ed0cc9bdd33138
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commits b919d852e2a09b3517b79f8d0a5edeca21d2a9bb and
d991d0a3172c8716642f80d607f70b761186c9e6 recently bumped
prelink-cross, but this causes a build breakage in
gobject-introspection, because host-prelink-cross no longer
builds/install the prelink-rtld issue.

While the investigation is on-going, let's revert back to the previous
version of prelink-cross, which is known to work.

We however keep the patch from James, which has been accepted
upstream, and fixes a separate build issue.

Fixes:

  /home/autobuild/autobuild/instance-8/output-1/host/or1k-buildroot-linux-gnu/sysroot/usr/bin/g-ir-scanner-lddwrapper: line 3: /home/autobuild/autobuild/instance-8/output-1/host/sbin/prelink-rtld: No such file or directory

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 +
 ...-tls.c-Fix-TLS-offsets-computation-for-s3.patch | 43 +++++++++++++++++++++
 ...002-src-execstack.c-fix-prelink_path-type.patch | 44 ++++++++++++++++++++++
 package/prelink-cross/prelink-cross.hash           |  2 +-
 package/prelink-cross/prelink-cross.mk             |  2 +-
 5 files changed, 90 insertions(+), 2 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 8f039962a0..8edb2f8c70 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1143,6 +1143,7 @@ package/pptp-linux/0001-susv3-legacy.patch lib_patch.Upstream
 package/pptp-linux/0002-fix-parallel-build.patch lib_patch.Upstream
 package/prboom/0001-libpng-1.4.patch lib_patch.Upstream
 package/prboom/0002-configure-remove-predefined-O2-optimization-flag.patch lib_patch.Upstream
+package/prelink-cross/0001-src-rtld-dl-tls.c-Fix-TLS-offsets-computation-for-s3.patch lib_patch.Upstream
 package/procps-ng/0001-configure-Add--disable-w.patch lib_patch.Upstream
 package/procps-ng/0002-escape-c-Fix-missing-nl_langinfo-on-certain-configs.patch lib_patch.Upstream
 package/procps-ng/0003-fix-pifd_open-check.patch lib_patch.Upstream
diff --git a/package/prelink-cross/0001-src-rtld-dl-tls.c-Fix-TLS-offsets-computation-for-s3.patch b/package/prelink-cross/0001-src-rtld-dl-tls.c-Fix-TLS-offsets-computation-for-s3.patch
new file mode 100644
index 0000000000..cea1357d1d
--- /dev/null
+++ b/package/prelink-cross/0001-src-rtld-dl-tls.c-Fix-TLS-offsets-computation-for-s3.patch
@@ -0,0 +1,43 @@
+From 4064f77d2f550762cbf220fec7c26a8ce4219ea4 Mon Sep 17 00:00:00 2001
+From: Alexander Egorenkov <egorenar@linux.ibm.com>
+Date: Sun, 8 Aug 2021 11:19:52 +0200
+Subject: [PATCH] src/rtld/dl-tls.c: Fix TLS offsets computation for s390 arch
+
+rtld_determine_tlsoffsets() didn't handle s390 arch properly by falling
+back to the default case. If TLS_TCB_AT_TP is 1, then set offset to -1.
+
+From glibc's sysdeps/s390/nptl/tls.h:
+-------------------------------------
+/* The TCB can have any size and the memory following the address the
+   thread pointer points to is unspecified.  Allocate the TCB there.  */
+define TLS_TCB_AT_TP	1
+define TLS_DTV_AT_TP	0
+
+This lead to the following error:
+---------------------------------
+prelink-rtld: error while loading shared libraries: /lib64/libc.so.6: cannot handle TLS data
+
+Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
+---
+ src/rtld/dl-tls.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/rtld/dl-tls.c b/src/rtld/dl-tls.c
+index 280cee45f950..29422dcfd25e 100644
+--- a/src/rtld/dl-tls.c
++++ b/src/rtld/dl-tls.c
+@@ -143,6 +143,11 @@ rtld_determine_tlsoffsets (int e_machine, struct r_scope_elem *search_list)
+       tls_tcb_size = 0;
+       break;
+ 
++    case EM_S390:
++      tls_tcb_at_tp = 1;
++      tls_tcb_size = -1;
++      break;
++
+     default:
+       /* Hope there's no TLS!  */
+       for (i = 0; i < search_list->r_nlist; i++)
+-- 
+2.31.1
+
diff --git a/package/prelink-cross/0002-src-execstack.c-fix-prelink_path-type.patch b/package/prelink-cross/0002-src-execstack.c-fix-prelink_path-type.patch
new file mode 100644
index 0000000000..26a68d8f5d
--- /dev/null
+++ b/package/prelink-cross/0002-src-execstack.c-fix-prelink_path-type.patch
@@ -0,0 +1,44 @@
+From 516030f287f65ca8bdab92c979ba2d328ee40506 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Fri, 31 May 2024 12:51:01 -0600
+Subject: [PATCH] src/execstack.c: fix prelink_path type
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+execstack.c: In function ‘execstack_make_rdwr’:
+execstack.c:127:17: error: passing argument 1 of ‘asprintf’ from incompatible pointer type [-Wincompatible-pointer-types]
+  127 |       asprintf (&prelink_path, "%s/%s", dirname, PRELINK_PROG EXEEXT);
+      |                 ^~~~~~~~~~~~~
+      |                 |
+      |                 const char **
+In file included from execstack.c:10:
+/usr/include/stdio.h:403:40: note: expected ‘char ** restrict’ but argument is of type ‘const char **’
+  403 | extern int asprintf (char **__restrict __ptr,
+      |                      ~~~~~~~~~~~~~~~~~~^~~~~
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream: https://git.yoctoproject.org/prelink-cross/commit/?id=ff2561c02ade96c5d4d56ddd4e27ff064840a176
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/execstack.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/execstack.c b/src/execstack.c
+index dda6bc7..5413fa2 100644
+--- a/src/execstack.c
++++ b/src/execstack.c
+@@ -52,7 +52,7 @@ const char *program_path;
+ 
+ /* The full pathname of the prelink tool, or NULL if it hasn't been
+    computed yet.  */
+-const char *prelink_path;
++char *prelink_path;
+ 
+ static error_t
+ parse_opt (int key, char *arg, struct argp_state *state)
+-- 
+2.45.2
+
diff --git a/package/prelink-cross/prelink-cross.hash b/package/prelink-cross/prelink-cross.hash
index 286fef9fc3..6776d407b8 100644
--- a/package/prelink-cross/prelink-cross.hash
+++ b/package/prelink-cross/prelink-cross.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a8fdf6e96032d2300102c549bdb4d961fef4e546874d79cda1f88fa07912e30c  prelink-cross-ff2561c02ade96c5d4d56ddd4e27ff064840a176-git4.tar.gz
+sha256  555fd65c1b907f9b78d6d41ec04cb6e242d2ecb0667867e39cdd517b3f182dd3  prelink-cross-a853a5d715d84eec93aa68e8f2df26b7d860f5b2-git4.tar.gz
 sha256  b8a2f73f743dc1a51aff23f1aacbca4b868564db52496fa3c0caba755bfd1eaf  COPYING
diff --git a/package/prelink-cross/prelink-cross.mk b/package/prelink-cross/prelink-cross.mk
index e554a423d4..2312ee53e6 100644
--- a/package/prelink-cross/prelink-cross.mk
+++ b/package/prelink-cross/prelink-cross.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PRELINK_CROSS_VERSION = ff2561c02ade96c5d4d56ddd4e27ff064840a176
+PRELINK_CROSS_VERSION = a853a5d715d84eec93aa68e8f2df26b7d860f5b2
 PRELINK_CROSS_SITE = https://git.yoctoproject.org/git/prelink-cross
 PRELINK_CROSS_SITE_METHOD = git
 PRELINK_CROSS_LICENSE = GPL-2.0+

--===============1724996165590252240==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1724996165590252240==--
