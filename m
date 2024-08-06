Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B52C49EA1
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 22:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 512DC60887;
	Tue,  6 Aug 2024 22:45:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oJQQh1O1Y5te; Tue,  6 Aug 2024 22:45:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CD7E6089E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CD7E6089E;
	Tue,  6 Aug 2024 22:45:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1A85F1BF969
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 22:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0778280BDA
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 22:45:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hbECGAC1WkvC for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 22:45:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B721980BAD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B721980BAD
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 22:45:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A1D5984344; Tue,  6 Aug 2024 22:45:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 7 Aug 2024 00:12:11 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 9a118c766437a2419fdc267fcf871d18369eb4fa
X-Git-Newrev: b5060121343c780e1642df9c0460ae0ea11fcd15
X-Patchwork-Hint: ignore
Message-Id: <20240806224505.A1D5984344@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/gpm: fix musl
 build with gcc 14
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

commit: https://git.buildroot.net/buildroot/commit/?id=b5060121343c780e1642df9c0460ae0ea11fcd15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Fix the following musl build failure with gcc 14:

daemon/old_main.c: In function 'old_main':
daemon/old_main.c:56:11: error: implicit declaration of function 'strcmp' [-Wimplicit-function-declaration]
   56 |       if(!strcmp((which_mouse->opt_dev),"-")) fd=0; /* use stdin */
      |           ^~~~~~
daemon/old_main.c:35:1: note: include '<string.h>' or provide a declaration of 'strcmp'
   34 | #include "headers/gpmInt.h"         /* daemon internals */
  +++ |+#include <string.h>
   35 |

While at it, add Upstream tags to other patches

Fixes:
 - http://autobuild.buildroot.org/results/3192740863d57e72e90e622683e7b9fcc057fa8b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 50b18ed68ceef78061e85a390d29ad172d1f9f95)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |  5 ----
 ...ded-musl-support-to-libgpm-and-the-daemon.patch |  4 +---
 .../gpm/0002-Install-unversioned-solibrary.patch   |  4 +---
 ...-sigemptyset-API-instead-of-__sigemptyset.patch |  1 +
 package/gpm/0005-fix-building-w-newer-glibc.patch  |  1 +
 ...-daemon.h-avoid-redefinition-of-last_sele.patch |  1 +
 package/gpm/0007-Add-include-string-h.patch        | 27 ++++++++++++++++++++++
 7 files changed, 32 insertions(+), 11 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 9eba20f24e..cd60677c2f 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -697,11 +697,6 @@ package/gob2/0001-dont-include-from-prefix.patch lib_patch.Upstream
 package/gobject-introspection/0001-disable-tests.patch lib_patch.Upstream
 package/gobject-introspection/0002-Add-rpath-links-to-ccompiler.patch lib_patch.Upstream
 package/gobject-introspection/0003-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch lib_patch.Upstream
-package/gpm/0001-Added-musl-support-to-libgpm-and-the-daemon.patch lib_patch.Upstream
-package/gpm/0002-Install-unversioned-solibrary.patch lib_patch.Upstream
-package/gpm/0004-Use-sigemptyset-API-instead-of-__sigemptyset.patch lib_patch.Upstream
-package/gpm/0005-fix-building-w-newer-glibc.patch lib_patch.Upstream
-package/gpm/0006-src-headers-daemon.h-avoid-redefinition-of-last_sele.patch lib_patch.Upstream
 package/gpsd/S50gpsd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/gptfdisk/0001-gptcurses-partially-revert-Tweaks-for-building-on-th.patch lib_patch.Upstream
 package/graphite2/0001-don-t-install-a-libtool-file-with-static-library.patch lib_patch.Upstream
diff --git a/package/gpm/0001-Added-musl-support-to-libgpm-and-the-daemon.patch b/package/gpm/0001-Added-musl-support-to-libgpm-and-the-daemon.patch
index 1e1e919416..1e143e5031 100644
--- a/package/gpm/0001-Added-musl-support-to-libgpm-and-the-daemon.patch
+++ b/package/gpm/0001-Added-musl-support-to-libgpm-and-the-daemon.patch
@@ -3,9 +3,7 @@ From: Dima Krasner <dima@dimakrasner.com>
 Date: Wed, 12 Nov 2014 23:06:46 +0200
 Subject: [PATCH] Added musl support to libgpm and the daemon.
 
-[Upstream patch backported from the github repository,
-https://github.com/telmich/gpm/commit/d88fb1de5803c366ab62f7de9ee5d83207fb2afe.]
-
+Upstream: https://github.com/telmich/gpm/commit/d88fb1de5803c366ab62f7de9ee5d83207fb2afe
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
  src/daemon/open_console.c  | 1 +
diff --git a/package/gpm/0002-Install-unversioned-solibrary.patch b/package/gpm/0002-Install-unversioned-solibrary.patch
index 27e97acb32..5f184daba2 100644
--- a/package/gpm/0002-Install-unversioned-solibrary.patch
+++ b/package/gpm/0002-Install-unversioned-solibrary.patch
@@ -6,9 +6,7 @@ Subject: [PATCH] Install unversioned solibrary
 Unversioned solibraries are shipped with -devel packages in Linux
 distros. Generate and install it for the consistency.
 
-[Upstream patch backported from the github repository,
-https://github.com/telmich/gpm/commit/06b00d53d8bd513ad5d262dc94a016c6fbf2d3aa]
-
+Upstream: https://github.com/telmich/gpm/commit/06b00d53d8bd513ad5d262dc94a016c6fbf2d3aa
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
  src/Makefile.in | 7 +++----
diff --git a/package/gpm/0004-Use-sigemptyset-API-instead-of-__sigemptyset.patch b/package/gpm/0004-Use-sigemptyset-API-instead-of-__sigemptyset.patch
index 01c7424a9d..5820d21f51 100644
--- a/package/gpm/0004-Use-sigemptyset-API-instead-of-__sigemptyset.patch
+++ b/package/gpm/0004-Use-sigemptyset-API-instead-of-__sigemptyset.patch
@@ -7,6 +7,7 @@ __sigemptyset has been removed from glibc public
 API headers in upcoming (2.26) release onwards
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream: https://github.com/telmich/gpm/commit/fdc42770596e25749f7e2ce0ea97882177397167
 Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
 ---
  src/prog/gpm-root.y | 4 ----
diff --git a/package/gpm/0005-fix-building-w-newer-glibc.patch b/package/gpm/0005-fix-building-w-newer-glibc.patch
index b451d975e0..839f92f37b 100644
--- a/package/gpm/0005-fix-building-w-newer-glibc.patch
+++ b/package/gpm/0005-fix-building-w-newer-glibc.patch
@@ -7,6 +7,7 @@ Linux C libraries are looking to disentangle sysmacros.h from the
 sys/types.h include, so make sure we pull in the header when it is
 found.
 
+Upstream: https://github.com/telmich/gpm/commit/b350aee4ea5785a75cb6ad770f6b768c506ebb70
 Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
 ---
  src/daemon/open_console.c | 4 ++++
diff --git a/package/gpm/0006-src-headers-daemon.h-avoid-redefinition-of-last_sele.patch b/package/gpm/0006-src-headers-daemon.h-avoid-redefinition-of-last_sele.patch
index 36a8ddc5bb..0c8428df2c 100644
--- a/package/gpm/0006-src-headers-daemon.h-avoid-redefinition-of-last_sele.patch
+++ b/package/gpm/0006-src-headers-daemon.h-avoid-redefinition-of-last_sele.patch
@@ -20,6 +20,7 @@ https://gcc.gnu.org/PR85678.
 The error also happens if CFLAGS=-fno-common passed explicitly.
 
 Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
+Upstream: https://github.com/telmich/gpm/commit/f04f24dd5ca5c1c13608b144ab66e2ccd47f106a
 Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
 ---
  src/headers/daemon.h | 2 +-
diff --git a/package/gpm/0007-Add-include-string-h.patch b/package/gpm/0007-Add-include-string-h.patch
new file mode 100644
index 0000000000..dd7e736e7b
--- /dev/null
+++ b/package/gpm/0007-Add-include-string-h.patch
@@ -0,0 +1,27 @@
+From 2085cab74a0a84df8b965addf007775a7225c9ec Mon Sep 17 00:00:00 2001
+From: Kurt Nalty <46026992+kurtnalty@users.noreply.github.com>
+Date: Sat, 29 Dec 2018 23:47:17 -0600
+Subject: [PATCH] Add include <string.h>
+
+Added
+ line 28, #include <string.h>                 /* strcpy, bzero     */
+for musl compilation
+
+Upstream: https://github.com/telmich/gpm/commit/2085cab74a0a84df8b965addf007775a7225c9ec
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/daemon/old_main.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/daemon/old_main.c b/src/daemon/old_main.c
+index 2581e26..ab7a87f 100644
+--- a/src/daemon/old_main.c
++++ b/src/daemon/old_main.c
+@@ -25,6 +25,7 @@
+ #include <signal.h>                 /* guess again       */
+ #include <errno.h>                  /* guess again       */
+ #include <unistd.h>                 /* unlink            */
++#include <string.h>                 /* strcpy, bzero     */
+ #include <sys/stat.h>               /* chmod             */
+
+ #include <linux/kd.h>               /* linux hd*         */
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
