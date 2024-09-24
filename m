Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3801FCF9C6B
	for <buildroot@archiver.kernel.org>; Tue, 24 Sep 2024 09:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28C824022B;
	Tue, 24 Sep 2024 09:08:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z7keI4up5QNv; Tue, 24 Sep 2024 09:08:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71E7F4037C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71E7F4037C;
	Tue, 24 Sep 2024 09:08:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A9BD21BF32B
 for <buildroot@lists.busybox.net>; Tue, 24 Sep 2024 09:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6953B60A38
 for <buildroot@lists.busybox.net>; Tue, 24 Sep 2024 09:08:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CBjYlDiLbKLN for <buildroot@lists.busybox.net>;
 Tue, 24 Sep 2024 09:08:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.42;
 helo=smtpcmd0642.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0921460A66
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0921460A66
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0921460A66
 for <buildroot@buildroot.org>; Tue, 24 Sep 2024 09:08:00 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id t1WXszdnIDhSBt1WXs9Lzs; Tue, 24 Sep 2024 11:07:57 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 24 Sep 2024 11:07:56 +0200
Message-ID: <20240924090756.735949-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfCxO2seXNTWAYy8GLtvfsCjdjtZWv7qbi6ywpKo67GBfWFCqaO/ePIg3ldxhOM789IlgHYEWhrBiOXa+a619sj4fz1AMoT5d4pTRCarUtDWuadoR7M2g
 X1obhQHdZN/A29upytx02i8seuGbhiI0tIZc8KiDYkXNmIwxlHxJE89/kixbzYps612ZLZ81FYNf3w/Omt9wH2EVfePn/7Clq+oxdG6gGbSsFE1qAehiTDNU
 rWlJ+/NPPvZqdvXr1hSW9kCn7wtpJ8qIPCm0ZHFcfLvTKtWFj7mL/BNNSNEpo3j/euJamy6wK7Cxo2ihodJLOg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1727168877; bh=hTR9NUzlj1yVqMONewRNdLX0b7mFE7xDxwuksO9b7rk=;
 h=From:To:Subject:Date:MIME-Version;
 b=V8rWEYktMDebmlGcV/Kh2KPF0lzOsrxBTjp9BtN23FwFVIg/N7fL9Hz7iF98Z3bfc
 xHhhkmoipHU9Ndc0AS5irYEn+pODtgrN0/hTetkpUZTjkbDiokaduMPhCunFlGld7l
 fYFNKEJd095jUqNch0tzmFlVzf7YW+wf9WlRfoRq7O3dGdqXrxtB83QYubODCMQiV4
 QyyqJlxlyot5tFpYeioMIiYqKL9houhyi1al3Wfuq3xkk9Ae68VrkJXtryvL0A8x2C
 ZoONQkmdvoz2DX6n53QGSjYqSCNh2dX7ZBCqKC77wy1pbGkOM+28+AzQAUlaQqY8H/
 LBI//ExgeLWGg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=V8rWEYkt
Subject: [Buildroot] [PATCH] package/nfs-utils: bump version to 2.7.1
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
Cc: Petr Vorel <petr.vorel@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

* add libxml2 dependency that is now mandatory
* drop 2 local patches that have been committed.
* add 2 patches committed upstream to fix musl build failure.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...-reexport-.c-Re-add-missing-includes.patch | 44 ----------------
 ...de-junction.h-Define-macros-for-musl.patch | 51 +++++++++++++++++++
 ...d_sqlite.c-Add-missing-sys-syscall.h.patch | 31 -----------
 ...rt-junction-path.c-Fix-buld-for-musl.patch | 40 +++++++++++++++
 package/nfs-utils/Config.in                   |  1 +
 package/nfs-utils/nfs-utils.hash              |  4 +-
 package/nfs-utils/nfs-utils.mk                |  6 +--
 7 files changed, 97 insertions(+), 80 deletions(-)
 delete mode 100644 package/nfs-utils/0001-reexport-fsidd-reexport-.c-Re-add-missing-includes.patch
 create mode 100644 package/nfs-utils/0001-support-include-junction.h-Define-macros-for-musl.patch
 delete mode 100644 package/nfs-utils/0002-support-backend_sqlite.c-Add-missing-sys-syscall.h.patch
 create mode 100644 package/nfs-utils/0002-support-junction-path.c-Fix-buld-for-musl.patch

diff --git a/package/nfs-utils/0001-reexport-fsidd-reexport-.c-Re-add-missing-includes.patch b/package/nfs-utils/0001-reexport-fsidd-reexport-.c-Re-add-missing-includes.patch
deleted file mode 100644
index 4f79af450e..0000000000
--- a/package/nfs-utils/0001-reexport-fsidd-reexport-.c-Re-add-missing-includes.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 4710e469cd0f512ac5e2c3c4335d8e21b97f21b0 Mon Sep 17 00:00:00 2001
-From: Petr Vorel <pvorel@suse.cz>
-Date: Tue, 5 Dec 2023 20:40:36 +0100
-Subject: [PATCH] reexport/{fsidd,reexport}.c: Re-add missing includes
-
-Older uClibc-ng requires <unistd.h> for close(2), unlink(2) and write(2),
-<sys/un.h> for struct sockaddr_un.
-
-Fixes: 1a4edb2a ("reexport/fsidd.c: Remove unused headers")
-Fixes: bdc79f02 ("support/reexport.c: Remove unused headers")
-Signed-off-by: Petr Vorel <pvorel@suse.cz>
-Upstream: https://lore.kernel.org/linux-nfs/20231205223543.31443-1-pvorel@suse.cz/
----
- support/reexport/fsidd.c    | 2 ++
- support/reexport/reexport.c | 1 +
- 2 files changed, 3 insertions(+)
-
-diff --git a/support/reexport/fsidd.c b/support/reexport/fsidd.c
-index 3e62b3fc..814fb48e 100644
---- a/support/reexport/fsidd.c
-+++ b/support/reexport/fsidd.c
-@@ -7,6 +7,8 @@
- #include <dlfcn.h>
- #endif
- #include <event2/event.h>
-+#include <sys/un.h>
-+#include <unistd.h>
-
- #include "conffile.h"
- #include "reexport_backend.h"
-diff --git a/support/reexport/reexport.c b/support/reexport/reexport.c
-index 78516586..1900b336 100644
---- a/support/reexport/reexport.c
-+++ b/support/reexport/reexport.c
-@@ -7,6 +7,7 @@
- #endif
- #include <sys/types.h>
- #include <sys/vfs.h>
-+#include <unistd.h>
- #include <errno.h>
-
- #include "nfsd_path.h"
---
-2.43.0
diff --git a/package/nfs-utils/0001-support-include-junction.h-Define-macros-for-musl.patch b/package/nfs-utils/0001-support-include-junction.h-Define-macros-for-musl.patch
new file mode 100644
index 0000000000..3ae6996d8c
--- /dev/null
+++ b/package/nfs-utils/0001-support-include-junction.h-Define-macros-for-musl.patch
@@ -0,0 +1,51 @@
+From 34a7959ddfb50db806c3f0e848947ff1117f37e2 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Fri, 20 Sep 2024 07:43:00 -0400
+Subject: [PATCH 1/2] support/include/junction.h: Define macros for musl
+
+Fixed 1:
+In file included from cache.c:1217:
+../../support/include/junction.h:128:21: error: expected ';' before 'char'
+  128 | __attribute_malloc__
+      |                     ^
+      |                     ;
+  129 | char            **nfs_dup_string_array(char **array);
+
+Fixed 2:
+junction.c: In function 'junction_set_sticky_bit':
+junction.c:164:39: error: 'ALLPERMS' undeclared (first use in this function)
+  164 |         stb.st_mode &= (unsigned int)~ALLPERMS;
+
+Upstream: http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=34a7959ddfb50db806c3f0e848947ff1117f37e2
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Steve Dickson <steved@redhat.com>
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ support/include/junction.h | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/support/include/junction.h b/support/include/junction.h
+index 7257d80b..d127dd55 100644
+--- a/support/include/junction.h
++++ b/support/include/junction.h
+@@ -26,6 +26,16 @@
+ #ifndef _NFS_JUNCTION_H_
+ #define _NFS_JUNCTION_H_
+ 
++/* For musl, refered to glibc's sys/cdefs.h */
++#ifndef __attribute_malloc__
++#define __attribute_malloc__ __attribute__((__malloc__))
++#endif
++
++/* For musl, refered to glibc's sys/stat.h */
++#ifndef ALLPERMS
++#define ALLPERMS (S_ISUID|S_ISGID|S_ISVTX|S_IRWXU|S_IRWXG|S_IRWXO)/* 07777 */
++#endif
++
+ #include <stdint.h>
+ 
+ /*
+-- 
+2.43.0
+
diff --git a/package/nfs-utils/0002-support-backend_sqlite.c-Add-missing-sys-syscall.h.patch b/package/nfs-utils/0002-support-backend_sqlite.c-Add-missing-sys-syscall.h.patch
deleted file mode 100644
index 88e1a9068d..0000000000
--- a/package/nfs-utils/0002-support-backend_sqlite.c-Add-missing-sys-syscall.h.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From aee92881ba80cf2ae7381d19f09e7fbeda57974c Mon Sep 17 00:00:00 2001
-From: Petr Vorel <petr.vorel@gmail.com>
-Date: Tue, 5 Dec 2023 23:20:33 +0100
-Subject: [PATCH] support/backend_sqlite.c: Add missing <sys/syscall.h>
-
-This fixes build on systems which actually needs getrandom()
-(to get SYS_getrandom).
-
-Fixes: f92fd6ca ("support/backend_sqlite.c: Add getrandom() fallback")
-Fixes: http://autobuild.buildroot.net/results/c5fde6099a8b228a8bdc3154d1e47dfa192e94ed/
-Reported-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Signed-off-by: Petr Vorel <pvorel@suse.cz>
-Upstream: https://lore.kernel.org/linux-nfs/20231205223543.31443-2-pvorel@suse.cz/
----
- support/reexport/backend_sqlite.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/support/reexport/backend_sqlite.c b/support/reexport/backend_sqlite.c
-index 0eb5ea37..54dfe447 100644
---- a/support/reexport/backend_sqlite.c
-+++ b/support/reexport/backend_sqlite.c
-@@ -7,6 +7,7 @@
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
-+#include <sys/syscall.h>
- #include <unistd.h>
-
- #ifdef HAVE_GETRANDOM
---
-2.43.0
diff --git a/package/nfs-utils/0002-support-junction-path.c-Fix-buld-for-musl.patch b/package/nfs-utils/0002-support-junction-path.c-Fix-buld-for-musl.patch
new file mode 100644
index 0000000000..6098eed3e2
--- /dev/null
+++ b/package/nfs-utils/0002-support-junction-path.c-Fix-buld-for-musl.patch
@@ -0,0 +1,40 @@
+From 4ddf3188f610a4ccfa8539cd94f5505a1a22db6c Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Fri, 20 Sep 2024 07:44:53 -0400
+Subject: [PATCH 2/2] support/junction/path.c: Fix buld for musl
+
+Fixed:
+path.c:164:24: error: implicit declaration of function 'strchrnul'; did you mean 'strchr'? [-Wimplicit-function-declaration]
+[snip]
+
+path.c:239:27: error: 'NAME_MAX' undeclared (first use in this function); did you mean 'AF_MAX'?
+
+Upstream: http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=4ddf3188f610a4ccfa8539cd94f5505a1a22db6c
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Steve Dickson <steved@redhat.com>
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ support/junction/path.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/support/junction/path.c b/support/junction/path.c
+index 13a14386..dd0f59a0 100644
+--- a/support/junction/path.c
++++ b/support/junction/path.c
+@@ -23,6 +23,12 @@
+  *	http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
+  */
+ 
++/* For musl */
++#ifndef _GNU_SOURCE
++#define _GNU_SOURCE
++#endif
++#include <limits.h>
++
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ 
+-- 
+2.43.0
+
diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index 02cc7e78cc..062af104bf 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_NFS_UTILS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # getrandom()
 	select BR2_PACKAGE_LIBEVENT
 	select BR2_PACKAGE_LIBTIRPC # IPv6 requires libtirpc
+	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
diff --git a/package/nfs-utils/nfs-utils.hash b/package/nfs-utils/nfs-utils.hash
index 9d74991df1..6241eb1c3d 100644
--- a/package/nfs-utils/nfs-utils.hash
+++ b/package/nfs-utils/nfs-utils.hash
@@ -1,4 +1,4 @@
-# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.6.4/sha256sums.asc
-sha256  01b3b0fb9c7d0bbabf5114c736542030748c788ec2fd9734744201e9b0a1119d  nfs-utils-2.6.4.tar.xz
+# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.7.1/sha256sums.asc
+sha256  885c948a84a58bca4148f459588f9a7369dbb40dcc466f04e455c6b10fd0aa48  nfs-utils-2.7.1.tar.xz
 # Locally computed
 sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index b757e3e51d..7fb3c2a7ec 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-NFS_UTILS_VERSION = 2.6.4
+NFS_UTILS_VERSION = 2.7.1
 NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
 NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
 NFS_UTILS_LICENSE = GPL-2.0+
 NFS_UTILS_LICENSE_FILES = COPYING
-NFS_UTILS_DEPENDENCIES = host-nfs-utils host-pkgconf libevent libtirpc sqlite util-linux
+NFS_UTILS_DEPENDENCIES = host-nfs-utils host-pkgconf libevent libtirpc libxml2 sqlite util-linux
 NFS_UTILS_CPE_ID_VENDOR = linux-nfs
 
 NFS_UTILS_CONF_ENV = knfsd_cv_bsd_signals=no
@@ -21,7 +21,7 @@ NFS_UTILS_CONF_OPTS = \
 	--with-statedir=/run/nfs \
 	--with-rpcgen=$(HOST_DIR)/bin/rpcgen
 
-HOST_NFS_UTILS_DEPENDENCIES = host-pkgconf host-libtirpc host-libevent host-sqlite host-util-linux
+HOST_NFS_UTILS_DEPENDENCIES = host-pkgconf host-libtirpc host-libxml2 host-libevent host-sqlite host-util-linux
 
 HOST_NFS_UTILS_CONF_OPTS = \
 	--enable-tirpc \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
