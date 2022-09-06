Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC0B6ECAAD5
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 15:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AD0841757;
	Tue,  6 Sep 2022 15:48:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AD0841757
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sPf0JJBbV2sO; Tue,  6 Sep 2022 15:48:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A42B34173B;
	Tue,  6 Sep 2022 15:48:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A42B34173B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A0AF31BF337
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 15:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88AC4610E9
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 15:48:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88AC4610E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o1t8MiGtD3vT for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 15:48:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 691DE60596
 for <buildroot@buildroot.org>; Tue,  6 Sep 2022 15:48:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 691DE60596
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id C513481D9F; Tue,  6 Sep 2022 15:32:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 6 Sep 2022 17:48:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 40a1c141b33c10e996623920c01eff62a9f8fbb9
X-Git-Newrev: 4765efb22231e377866bc6456971886d970f9d7a
X-Patchwork-Hint: ignore
Message-Id: <20220906153256.C513481D9F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdb: include gdbarch.h in
 xtensa-linux-nat.c
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
Content-Type: multipart/mixed; boundary="===============6243563576260774255=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6243563576260774255==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=4765efb22231e377866bc6456971886d970f9d7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It seems that gdb doesn't build for xtensa since a while, indeed commit
[1] merged in gdb 9 introduced a few number of build issues on several
architectures:

[Fix gdb build on macOS]
https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=b1c896b365f2dbcd14145a88d103623244cf0fb0

[gdb: Fix gdb build on mips64-linux]
https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=2208ee917050bcc901c7faefdee257ffbf8ef2ab

[gdb: Fix native build on Linux/Alpha.]
https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=7a27b85f6d9b5eea9bd1493f903158fbea4b2231

[Include gdbarch.h in m68k-linux-nat.c]
https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=a7cdaa914f4b937544d8f102679bb5129bb1ef08

[gdb: include gdbarch.h in hppa-linux-nat.c]
https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=ad75efa628656716982f2674008952bfd2c268af

Most of them has been fixed before the gdb 9 release but it seems
that xtensa is the last one on this list and still unfixed with
gdb 11 (not even noticed by Buildroot autobuilders).

[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=0d12e84cfc9bd36b7bbda01a3c8f83f65a832398

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../10.2/0009-gdb-Fix-native-build-on-xtensa.patch | 57 ++++++++++++++++++++++
 .../11.2/0009-gdb-Fix-native-build-on-xtensa.patch | 57 ++++++++++++++++++++++
 .../9.2/0009-gdb-Fix-native-build-on-xtensa.patch  | 57 ++++++++++++++++++++++
 3 files changed, 171 insertions(+)

diff --git a/package/gdb/10.2/0009-gdb-Fix-native-build-on-xtensa.patch b/package/gdb/10.2/0009-gdb-Fix-native-build-on-xtensa.patch
new file mode 100644
index 0000000000..927bf20de5
--- /dev/null
+++ b/package/gdb/10.2/0009-gdb-Fix-native-build-on-xtensa.patch
@@ -0,0 +1,57 @@
+From 02d9e6a3bc47dfe138ef4511aaeeae26b7dbd1ba Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sun, 28 Aug 2022 23:21:37 +0200
+Subject: [PATCH] gdb: Fix native build on xtensa
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Apply a similar fix than for Alpha architecture on gdb 9:
+https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=7a27b85f6d9b5eea9bd1493f903158fbea4b2231
+
+Fixes:
+
+../../gdb/xtensa-linux-nat.c: In function ‘void fill_gregset(const regcache*, elf_greg_t (*)[128], int)’:
+../../gdb/xtensa-linux-nat.c:66:17: error: ‘gdbarch_pc_regnum’ was not declared in this scope
+   66 |   if (regnum == gdbarch_pc_regnum (gdbarch) || regnum == -1)
+      |                 ^~~~~~~~~~~~~~~~~
+  CXX    complaints.o
+../../gdb/xtensa-linux-nat.c:68:17: error: ‘gdbarch_ps_regnum’ was not declared in this scope
+   68 |   if (regnum == gdbarch_ps_regnum (gdbarch) || regnum == -1)
+      |                 ^~~~~~~~~~~~~~~~~
+../../gdb/xtensa-linux-nat.c:71:38: error: no matching function for call to ‘gdbarch_tdep::gdbarch_tdep(gdbarch*&)’
+   71 |   if (regnum == gdbarch_tdep (gdbarch)->wb_regnum || regnum == -1)
+      |                                      ^
+In file included from ../../gdb/xtensa-linux-nat.c:38:
+../../gdb/xtensa-tdep.h:160:8: note: candidate: ‘gdbarch_tdep::gdbarch_tdep()’
+  160 | struct gdbarch_tdep
+      |        ^~~~~~~~~~~~
+../../gdb/xtensa-tdep.h:160:8: note:   candidate expects 0 arguments, 1 provided
+../../gdb/xtensa-tdep.h:160:8: note: candidate: ‘constexpr gdbarch_tdep::gdbarch_tdep(const gdbarch_tdep&)’
+../../gdb/xtensa-tdep.h:160:8: note:   no known conversion for argument 1 from ‘gdbarch*’ to ‘const gdbarch_tdep&’
+../../gdb/xtensa-tdep.h:160:8: note: candidate: ‘constexpr gdbarch_tdep::gdbarch_tdep(gdbarch_tdep&&)’
+../../gdb/xtensa-tdep.h:160:8: note:   no known conversion for argument 1 from ‘gdbarch*’ to ‘gdbarch_tdep&&’
+../../gdb/xtensa-linux-nat.c:72:49: error: no matching function for call to ‘gdbarch_tdep::gdbarch_tdep(gdbarch*&)’
+   72 |     regcache->raw_collect (gdbarch_tdep (gdbarch)->wb_regnum,
+      |                                                 ^
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gdb/xtensa-linux-nat.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gdb/xtensa-linux-nat.c b/gdb/xtensa-linux-nat.c
+index b2b3db182bc..b230e08b69f 100644
+--- a/gdb/xtensa-linux-nat.c
++++ b/gdb/xtensa-linux-nat.c
+@@ -36,6 +36,7 @@
+ 
+ #include "gregset.h"
+ #include "xtensa-tdep.h"
++#include "gdbarch.h"
+ 
+ /* Defines ps_err_e, struct ps_prochandle.  */
+ #include "gdb_proc_service.h"
+-- 
+2.37.2
+
diff --git a/package/gdb/11.2/0009-gdb-Fix-native-build-on-xtensa.patch b/package/gdb/11.2/0009-gdb-Fix-native-build-on-xtensa.patch
new file mode 100644
index 0000000000..bf4d617fc1
--- /dev/null
+++ b/package/gdb/11.2/0009-gdb-Fix-native-build-on-xtensa.patch
@@ -0,0 +1,57 @@
+From d3bb361eb0b6cbf0257f515f9d5e64add89e6bfa Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sun, 28 Aug 2022 23:21:37 +0200
+Subject: [PATCH] gdb: Fix native build on xtensa
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Apply a similar fix than for Alpha architecture on gdb 9:
+https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=7a27b85f6d9b5eea9bd1493f903158fbea4b2231
+
+Fixes:
+
+../../gdb/xtensa-linux-nat.c: In function ‘void fill_gregset(const regcache*, elf_greg_t (*)[128], int)’:
+../../gdb/xtensa-linux-nat.c:66:17: error: ‘gdbarch_pc_regnum’ was not declared in this scope
+   66 |   if (regnum == gdbarch_pc_regnum (gdbarch) || regnum == -1)
+      |                 ^~~~~~~~~~~~~~~~~
+  CXX    complaints.o
+../../gdb/xtensa-linux-nat.c:68:17: error: ‘gdbarch_ps_regnum’ was not declared in this scope
+   68 |   if (regnum == gdbarch_ps_regnum (gdbarch) || regnum == -1)
+      |                 ^~~~~~~~~~~~~~~~~
+../../gdb/xtensa-linux-nat.c:71:38: error: no matching function for call to ‘gdbarch_tdep::gdbarch_tdep(gdbarch*&)’
+   71 |   if (regnum == gdbarch_tdep (gdbarch)->wb_regnum || regnum == -1)
+      |                                      ^
+In file included from ../../gdb/xtensa-linux-nat.c:38:
+../../gdb/xtensa-tdep.h:160:8: note: candidate: ‘gdbarch_tdep::gdbarch_tdep()’
+  160 | struct gdbarch_tdep
+      |        ^~~~~~~~~~~~
+../../gdb/xtensa-tdep.h:160:8: note:   candidate expects 0 arguments, 1 provided
+../../gdb/xtensa-tdep.h:160:8: note: candidate: ‘constexpr gdbarch_tdep::gdbarch_tdep(const gdbarch_tdep&)’
+../../gdb/xtensa-tdep.h:160:8: note:   no known conversion for argument 1 from ‘gdbarch*’ to ‘const gdbarch_tdep&’
+../../gdb/xtensa-tdep.h:160:8: note: candidate: ‘constexpr gdbarch_tdep::gdbarch_tdep(gdbarch_tdep&&)’
+../../gdb/xtensa-tdep.h:160:8: note:   no known conversion for argument 1 from ‘gdbarch*’ to ‘gdbarch_tdep&&’
+../../gdb/xtensa-linux-nat.c:72:49: error: no matching function for call to ‘gdbarch_tdep::gdbarch_tdep(gdbarch*&)’
+   72 |     regcache->raw_collect (gdbarch_tdep (gdbarch)->wb_regnum,
+      |                                                 ^
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gdb/xtensa-linux-nat.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gdb/xtensa-linux-nat.c b/gdb/xtensa-linux-nat.c
+index ec33f4a10f2..73f35eac683 100644
+--- a/gdb/xtensa-linux-nat.c
++++ b/gdb/xtensa-linux-nat.c
+@@ -36,6 +36,7 @@
+ 
+ #include "gregset.h"
+ #include "xtensa-tdep.h"
++#include "gdbarch.h"
+ 
+ /* Defines ps_err_e, struct ps_prochandle.  */
+ #include "gdb_proc_service.h"
+-- 
+2.37.2
+
diff --git a/package/gdb/9.2/0009-gdb-Fix-native-build-on-xtensa.patch b/package/gdb/9.2/0009-gdb-Fix-native-build-on-xtensa.patch
new file mode 100644
index 0000000000..4ff3828f2a
--- /dev/null
+++ b/package/gdb/9.2/0009-gdb-Fix-native-build-on-xtensa.patch
@@ -0,0 +1,57 @@
+From 222cb32acf044fe90e8534b064f9168ad0d8c705 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sun, 28 Aug 2022 23:21:37 +0200
+Subject: [PATCH] gdb: Fix native build on xtensa
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Apply a similar fix than for Alpha architecture on gdb 9:
+https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=7a27b85f6d9b5eea9bd1493f903158fbea4b2231
+
+Fixes:
+
+../../gdb/xtensa-linux-nat.c: In function ‘void fill_gregset(const regcache*, elf_greg_t (*)[128], int)’:
+../../gdb/xtensa-linux-nat.c:66:17: error: ‘gdbarch_pc_regnum’ was not declared in this scope
+   66 |   if (regnum == gdbarch_pc_regnum (gdbarch) || regnum == -1)
+      |                 ^~~~~~~~~~~~~~~~~
+  CXX    complaints.o
+../../gdb/xtensa-linux-nat.c:68:17: error: ‘gdbarch_ps_regnum’ was not declared in this scope
+   68 |   if (regnum == gdbarch_ps_regnum (gdbarch) || regnum == -1)
+      |                 ^~~~~~~~~~~~~~~~~
+../../gdb/xtensa-linux-nat.c:71:38: error: no matching function for call to ‘gdbarch_tdep::gdbarch_tdep(gdbarch*&)’
+   71 |   if (regnum == gdbarch_tdep (gdbarch)->wb_regnum || regnum == -1)
+      |                                      ^
+In file included from ../../gdb/xtensa-linux-nat.c:38:
+../../gdb/xtensa-tdep.h:160:8: note: candidate: ‘gdbarch_tdep::gdbarch_tdep()’
+  160 | struct gdbarch_tdep
+      |        ^~~~~~~~~~~~
+../../gdb/xtensa-tdep.h:160:8: note:   candidate expects 0 arguments, 1 provided
+../../gdb/xtensa-tdep.h:160:8: note: candidate: ‘constexpr gdbarch_tdep::gdbarch_tdep(const gdbarch_tdep&)’
+../../gdb/xtensa-tdep.h:160:8: note:   no known conversion for argument 1 from ‘gdbarch*’ to ‘const gdbarch_tdep&’
+../../gdb/xtensa-tdep.h:160:8: note: candidate: ‘constexpr gdbarch_tdep::gdbarch_tdep(gdbarch_tdep&&)’
+../../gdb/xtensa-tdep.h:160:8: note:   no known conversion for argument 1 from ‘gdbarch*’ to ‘gdbarch_tdep&&’
+../../gdb/xtensa-linux-nat.c:72:49: error: no matching function for call to ‘gdbarch_tdep::gdbarch_tdep(gdbarch*&)’
+   72 |     regcache->raw_collect (gdbarch_tdep (gdbarch)->wb_regnum,
+      |                                                 ^
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gdb/xtensa-linux-nat.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gdb/xtensa-linux-nat.c b/gdb/xtensa-linux-nat.c
+index 097d7bd6f96..4e4290fe038 100644
+--- a/gdb/xtensa-linux-nat.c
++++ b/gdb/xtensa-linux-nat.c
+@@ -36,6 +36,7 @@
+ 
+ #include "gregset.h"
+ #include "xtensa-tdep.h"
++#include "gdbarch.h"
+ 
+ /* Defines ps_err_e, struct ps_prochandle.  */
+ #include "gdb_proc_service.h"
+-- 
+2.37.2
+

--===============6243563576260774255==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6243563576260774255==--
