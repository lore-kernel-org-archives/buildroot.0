Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F34DA10F9972
	for <buildroot@archiver.kernel.org>; Wed,  8 Apr 2026 19:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 902CE8271D;
	Wed,  8 Apr 2026 19:34:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tJWo9XFZu_KY; Wed,  8 Apr 2026 19:34:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83DF68272C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775676848;
	bh=fgwXrGxi7fNhHxK7TkbUwCosoGIVH/+m8WX/3eK2KAU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tj221t/y3Ah6bKqKjf5IipZEfNYB9/KOP0ZzrVOe/bBhb2/EraDSH6s19hNEcroPr
	 3HbOmUMIIw+WuqTl0G/1r1j4n8prOPIpwnusxC793j8Eeid8KmwqZ9jKKwvq/sgh5X
	 R2mTPXN8s21j5zROKuqkO1DboC6vPY7BtOb99FbVbh+lpLOZ/fNR56dfNbMx4Vq0SG
	 RM3VUiLRFuDDvpSHIfCOp2NnFWHwUZoOv3mVbzx8P12U//ESYqy25LGgePgNogw8Yz
	 TiYjbbKloo53uku77Iquge7WX8IShY2iKoJ6wQThfDgWRXZFH4Qxg18xDP8QqNm1pR
	 M3+dnj7VLDtCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83DF68272C;
	Wed,  8 Apr 2026 19:34:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 29AED1F6
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 19:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1BA594006F
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 19:34:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pL26nSkN0kxD for <buildroot@buildroot.org>;
 Wed,  8 Apr 2026 19:34:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.56;
 helo=smtpcmd0756.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AA43F405FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA43F405FA
Received: from smtpcmd0756.aruba.it (smtpcmd0756.aruba.it [62.149.156.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AA43F405FA
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 19:34:03 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id AYf2weC6stpTfAYf2wsLE4; Wed, 08 Apr 2026 21:34:00 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Petr Vorel <petr.vorel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  8 Apr 2026 21:33:59 +0200
Message-ID: <20260408193359.4047938-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260408193359.4047938-1-giulio.benetti@benettiengineering.com>
References: <20260408193359.4047938-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfEBHeYAQSyY6FwWwXDmzpAxbpKxdC7UAuz9lHpu/wSxs6/x16WVGH8FqtZwa+zvYPmxY2lF8xmF8Eg1iImHfXo2oePBxtCDN+FgPJyP+FjY6I5+3XYwQ
 5ViOkVQ1IsuVmOSGsrtVk/FDCe+y0AqFqh6/9/a6E5z0MOFbGCD5NNhk63+NF5rQtkH1QmLVXDfW2OoPmPjyQUeKFSm+4oeQ6jgjQXv1OSalHkjdgJqPd2Qe
 aRKyHSsh4zfRyaiIQvejvZCGDT75f4745B0xZDkc543jSc0SEWDj8bPnlPVYUqvoN8lU0NdQsbrnNWiYTpyD7dLB99xBppm4Lo4D5p9Jj/yJG++3sNoMt6CH
 8ZHldZJE
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1775676840; bh=vu8X/HXzXRmE/KwRbi7zMrg9er5FYdTO8Y6duKKmPlY=;
 h=From:To:Subject:Date:MIME-Version;
 b=JxpWGebQ2OENBtFZZOtmZ+UXOWLTbZexUzMko8c6emfGsHKQDYrSEkpTNFmKFQ4Tk
 jq83vpC1g19hu3fRoWyQFoCl9i/U/DSad94QnyIrRHgmfp9II5xZvVvo46RUuhFx3E
 AP6TnmOHdoCol/MwBwoD3cqSnKIz9UJP11x6XBCl7zbXeMy2qe4OdSCH3uSmw6l99g
 1KyUjmOVS45OddOp5yqNxGmsGt3tWwYjRuaDanjuWxeoKat5Vw68wgW6ERQd63NSJk
 TuPETK/P08+rxVMjwEaor3A7/kac7IB2UFr2cl5n2uOZ7ZS2zykAIjoOlEVC+gUakf
 8Cc8IIP83i/4Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=JxpWGebQ
Subject: [Buildroot] [PATCH v2 2/2] package/nfs-utils: bump version to 2.9.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add dependency to libnl that became mandatory with commit:
https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commitdiff;h=d2fa3421f857e04de7f79cdf3114a0fe73983d25

Add 3 local patches pending upstream to fix build failures.

Release announce:
https://lore.kernel.org/linux-nfs/955a922e-c12d-435b-a698-caf73312f01d@redhat.com/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* reworked patches 1 and 2 and added patch 3 to fix build with old glibc
---
 ..._file-fix-missing-string.h-inclusion.patch | 28 +++++++
 ....h-file-to-deal-with-old-Linux-api-a.patch | 77 +++++++++++++++++++
 ...kend_sqlite.c-fix-getrandom-fallback.patch | 30 ++++++++
 package/nfs-utils/Config.in                   |  1 +
 package/nfs-utils/nfs-utils.hash              |  4 +-
 package/nfs-utils/nfs-utils.mk                |  6 +-
 6 files changed, 141 insertions(+), 5 deletions(-)
 create mode 100644 package/nfs-utils/0001-fh_key_file-fix-missing-string.h-inclusion.patch
 create mode 100644 package/nfs-utils/0002-Introduce-compat.h-file-to-deal-with-old-Linux-api-a.patch
 create mode 100644 package/nfs-utils/0003-support-backend_sqlite.c-fix-getrandom-fallback.patch

diff --git a/package/nfs-utils/0001-fh_key_file-fix-missing-string.h-inclusion.patch b/package/nfs-utils/0001-fh_key_file-fix-missing-string.h-inclusion.patch
new file mode 100644
index 0000000000..838d519d5a
--- /dev/null
+++ b/package/nfs-utils/0001-fh_key_file-fix-missing-string.h-inclusion.patch
@@ -0,0 +1,28 @@
+From 2d99ff0aa8a3b4d20558bce742edaaed9d24b3cb Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Tue, 7 Apr 2026 17:23:13 +0200
+Subject: [PATCH] fh_key_file: fix missing string.h inclusion
+
+Add #include <string.h> to fix build failure.
+
+Upstream: https://lore.kernel.org/linux-nfs/20260408173535.3992116-1-giulio.benetti@benettiengineering.com/T/#t
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ support/nfs/fh_key_file.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/support/nfs/fh_key_file.c b/support/nfs/fh_key_file.c
+index 5f5eafc1..81ea1500 100644
+--- a/support/nfs/fh_key_file.c
++++ b/support/nfs/fh_key_file.c
+@@ -26,6 +26,7 @@
+ #include <sys/types.h>
+ #include <unistd.h>
+ #include <errno.h>
++#include <string.h>
+ #include <uuid/uuid.h>
+ 
+ #include "nfslib.h"
+-- 
+2.47.3
+
diff --git a/package/nfs-utils/0002-Introduce-compat.h-file-to-deal-with-old-Linux-api-a.patch b/package/nfs-utils/0002-Introduce-compat.h-file-to-deal-with-old-Linux-api-a.patch
new file mode 100644
index 0000000000..c5c57c6503
--- /dev/null
+++ b/package/nfs-utils/0002-Introduce-compat.h-file-to-deal-with-old-Linux-api-a.patch
@@ -0,0 +1,77 @@
+From 218e1b572123f527bd92c17ebb7ac00c2a7e6c01 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Tue, 7 Apr 2026 17:47:40 +0200
+Subject: [PATCH] Introduce compat.h file to deal with old Linux api and fix
+ build failure due to missing NETLINK_EXT_ACK
+
+In compat.h check if NETLINK_EXT_ACK exists, otherwise define it to fix
+build failure and where at the moment <linux/netlink.h> is included
+let's include "compat.h"
+
+Upstream: https://lore.kernel.org/linux-nfs/20260408173535.3992116-2-giulio.benetti@benettiengineering.com/T/#u
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ support/export/cache.c       |  2 +-
+ support/export/cache_flush.c |  2 ++
+ support/include/compat.h     | 10 ++++++++++
+ utils/nfsdctl/nfsdctl.c      |  1 +
+ 4 files changed, 14 insertions(+), 1 deletion(-)
+ create mode 100644 support/include/compat.h
+
+diff --git a/support/export/cache.c b/support/export/cache.c
+index 2f128d7d..65008f51 100644
+--- a/support/export/cache.c
++++ b/support/export/cache.c
+@@ -40,7 +40,7 @@
+ #include <netlink/genl/ctrl.h>
+ #include <netlink/msg.h>
+ #include <netlink/attr.h>
+-#include <linux/netlink.h>
++#include "compat.h"
+ 
+ #ifdef USE_SYSTEM_NFSD_NETLINK_H
+ #include <linux/nfsd_netlink.h>
+diff --git a/support/export/cache_flush.c b/support/export/cache_flush.c
+index ed7b964f..2a24dec7 100644
+--- a/support/export/cache_flush.c
++++ b/support/export/cache_flush.c
+@@ -38,6 +38,8 @@ extern int no_netlink;
+ #include "sunrpc_netlink.h"
+ #endif
+ 
++#include "compat.h"
++
+ static int nl_send_flush(struct nl_sock *sock, int family, int cmd)
+ {
+ 	struct nl_msg *msg;
+diff --git a/support/include/compat.h b/support/include/compat.h
+new file mode 100644
+index 00000000..83229b65
+--- /dev/null
++++ b/support/include/compat.h
+@@ -0,0 +1,10 @@
++#ifndef COMPAT_H
++#define COMPAT_H
++
++#include <linux/netlink.h>
++
++#ifndef NETLINK_EXT_ACK
++#define NETLINK_EXT_ACK 11
++#endif
++
++#endif /* COMPAT_H */
+diff --git a/utils/nfsdctl/nfsdctl.c b/utils/nfsdctl/nfsdctl.c
+index 016dd2eb..c7126748 100644
+--- a/utils/nfsdctl/nfsdctl.c
++++ b/utils/nfsdctl/nfsdctl.c
+@@ -26,6 +26,7 @@
+ #include <netlink/msg.h>
+ #include <netlink/attr.h>
+ #include <linux/netlink.h>
++#include "compat.h"
+ 
+ #include <readline/readline.h>
+ #include <readline/history.h>
+-- 
+2.47.3
+
diff --git a/package/nfs-utils/0003-support-backend_sqlite.c-fix-getrandom-fallback.patch b/package/nfs-utils/0003-support-backend_sqlite.c-fix-getrandom-fallback.patch
new file mode 100644
index 0000000000..86d615ca34
--- /dev/null
+++ b/package/nfs-utils/0003-support-backend_sqlite.c-fix-getrandom-fallback.patch
@@ -0,0 +1,30 @@
+From dbd44e7d6d4140e5e9d01f0a6daf6f3e45e5acbc Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 8 Apr 2026 14:28:28 +0200
+Subject: [PATCH] support/backend_sqlite.c: fix getrandom() fallback
+
+In old Linux/Glibc versions __NR_getrandom is defined in <sys/random.h>
+so let's add it to fix build failure.
+
+Upstream: https://lore.kernel.org/linux-nfs/20260408173535.3992116-3-giulio.benetti@benettiengineering.com/T/#u
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ support/reexport/backend_sqlite.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/support/reexport/backend_sqlite.c b/support/reexport/backend_sqlite.c
+index 0eb5ea37..a1e981e4 100644
+--- a/support/reexport/backend_sqlite.c
++++ b/support/reexport/backend_sqlite.c
+@@ -9,6 +9,8 @@
+ #include <string.h>
+ #include <unistd.h>
+ 
++#include <sys/syscall.h>
++
+ #ifdef HAVE_GETRANDOM
+ # include <sys/random.h>
+ # if !defined(SYS_getrandom) && defined(__NR_getrandom)
+-- 
+2.47.3
+
diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index 419b605667..295ce28edb 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_NFS_UTILS
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # getrandom()
 	select BR2_PACKAGE_LIBEVENT
+	select BR2_PACKAGE_LIBNL
 	select BR2_PACKAGE_LIBTIRPC # IPv6 requires libtirpc
 	select BR2_PACKAGE_LIBTIRPC_RPCDB
 	select BR2_PACKAGE_SQLITE
diff --git a/package/nfs-utils/nfs-utils.hash b/package/nfs-utils/nfs-utils.hash
index 1e3f63d419..19315e60a3 100644
--- a/package/nfs-utils/nfs-utils.hash
+++ b/package/nfs-utils/nfs-utils.hash
@@ -1,4 +1,4 @@
-# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.8.7/sha256sums.asc
-sha256  59d0f1e17b18efaa60ea3ccf89a9cad3217f8d3b23c18d2fe34b25c8969d60ae  nfs-utils-2.8.7.tar.xz
+# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.9.1/sha256sums.asc
+sha256  302846343bf509f8f884c23bdbd0fe853b7f7cbb6572060a9082279d13b21a2c  nfs-utils-2.9.1.tar.xz
 # Locally computed
 sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 3d391c1804..df9fdbc052 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-NFS_UTILS_VERSION = 2.8.7
+NFS_UTILS_VERSION = 2.9.1
 NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
 NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
 NFS_UTILS_LICENSE = GPL-2.0+
 NFS_UTILS_LICENSE_FILES = COPYING
-NFS_UTILS_DEPENDENCIES = host-nfs-utils host-pkgconf libevent libtirpc sqlite util-linux
+NFS_UTILS_DEPENDENCIES = host-nfs-utils host-pkgconf libevent libnl libtirpc sqlite util-linux
 NFS_UTILS_CPE_ID_VENDOR = linux-nfs
 
 NFS_UTILS_CONF_ENV = knfsd_cv_bsd_signals=no
@@ -23,7 +23,7 @@ NFS_UTILS_CONF_OPTS = \
 	--with-statedir=/run/nfs \
 	--with-rpcgen=$(HOST_DIR)/bin/rpcgen
 
-HOST_NFS_UTILS_DEPENDENCIES = host-pkgconf host-libtirpc host-libevent host-sqlite host-util-linux
+HOST_NFS_UTILS_DEPENDENCIES = host-pkgconf host-libtirpc host-libevent host-libnl host-sqlite host-util-linux
 
 HOST_NFS_UTILS_CONF_OPTS = \
 	--enable-tirpc \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
