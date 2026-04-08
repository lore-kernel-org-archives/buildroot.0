Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D0B1073C89
	for <buildroot@archiver.kernel.org>; Wed,  8 Apr 2026 09:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30B1A82308;
	Wed,  8 Apr 2026 09:57:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uU9A9KCtUIOb; Wed,  8 Apr 2026 09:57:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32F4982309
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775642228;
	bh=6OrBb9eQyqJCixxKlp1i6xqLTQHJbguS7TVfGwF9t+U=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UzaVjRWd+co0zhQRJkAHma6NYD/GgC/z/PTIBE7fquLPUTD5jU6gFmaX9WE1ZFto1
	 LGxmFhfEKkwkIKWgiog0ss/viAynJ3TLrL/WtWeJNPJVKBlfaPeD0y3+6g0bt5GMfo
	 or42uxDBlj6q0DEW+X+jmXh5QPh63fu0NdeQiQ+Q42jvHNRtBKpfEQY68Ysil/kyGT
	 l8DuN+AZ+nE+UwkzmwD7FdbdUk8HA47ZEGbJUjZkG1eKdxs+UyH+/6HkGf4t0pcNzI
	 7eVzx0hI27NicTwRWXJtv09vBxxhxnXRUE4cx7OmpcJ7GUesQgKgHp8HJIGOcryD87
	 q01BQxOn3cV1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32F4982309;
	Wed,  8 Apr 2026 09:57:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 64F631F6
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 09:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56E95400B7
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 09:57:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zwP_65L-YJgM for <buildroot@buildroot.org>;
 Wed,  8 Apr 2026 09:57:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.86;
 helo=smtpcmd0986.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EA72D400A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA72D400A0
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA72D400A0
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 09:57:01 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id APebw2GtG4bDkAPecwcSIg; Wed, 08 Apr 2026 11:56:58 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Petr Vorel <petr.vorel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  8 Apr 2026 11:56:57 +0200
Message-ID: <20260408095657.2560313-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260408095657.2560313-1-giulio.benetti@benettiengineering.com>
References: <20260408095657.2560313-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfMitWLiwaD48cnmq/TXxoV6QcAEb23pWRS6N5HZdEE3KgRidA/9kYButGfUotLdpVmEcbhDpwNtrhcSc+TaXmhIGoigZcDe7RGhhltBCoP7jRVvBd3/c
 7xIVw/Ihf4lV+wV2UKdrQjaQSiQIggFl80TS2WXGDvhl0CEYhNBEj5VZxAxgWHTPGMcQ5Q+Hyih6dfu4lH/JuARXr33sirh0sYrsfUDhdMxUzKQ7qtckngXM
 mfWaGOAMXtdaAoom59H7GbmYN8jOL5FqMyjyxCipnWzfIGQXeQQ+k4InA+I/kQ7S3QIWrWaHlQvwnXa/J367GfmpcynVFfFV38284FPRKnCTr/+Q94jzhMwo
 rcCDJiCN
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1775642218; bh=hUCE6zhMqGVmjejyKttM5UlULwwEbZ8F00mOtAFf8LM=;
 h=From:To:Subject:Date:MIME-Version;
 b=iGLDYayzJ6cocj4RCunePU9JqvRUDNlPEiCn6vfpr8D8mU7Bk+9A/XR+Vyup142LV
 b02sVztwMh2QbUPr89ckHdGu+SuwQWefYNsL7m2Y9+f4nZc9AVwNHfS6B3NdVZWc8V
 2J3HY30n1r4qDMioAbA84x9o+jagyRx/8RfVD3w59wkAJUhGyC91Dj+M4mY9dwUmBf
 cXevbRjS6fJeSaWJhR2J8TN3uTNAKvx/vAUgIbM1I35SrKwVX2pVQ0zfJqtx98F1tQ
 BYGyxQXkdC36Uz6ubdEmZjINNLJYTIT7g+LkJH+MhPG+HOV8QBev8nAO+JdT6jkpsg
 BUwg1KxANuJTQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=iGLDYayz
Subject: [Buildroot] [PATCH 2/2] package/nfs-utils: bump version to 2.9.1
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

Add 2 local patches pending upstream to fix build failures.

Release announce:
https://lore.kernel.org/linux-nfs/955a922e-c12d-435b-a698-caf73312f01d@redhat.com/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ..._file-fix-missing-string.h-inclusion.patch | 28 +++++++
 ....h-file-to-deal-with-old-Linux-api-a.patch | 76 +++++++++++++++++++
 package/nfs-utils/Config.in                   |  1 +
 package/nfs-utils/nfs-utils.hash              |  4 +-
 package/nfs-utils/nfs-utils.mk                |  6 +-
 5 files changed, 110 insertions(+), 5 deletions(-)
 create mode 100644 package/nfs-utils/0001-fh_key_file-fix-missing-string.h-inclusion.patch
 create mode 100644 package/nfs-utils/0002-Introduce-compat.h-file-to-deal-with-old-Linux-api-a.patch

diff --git a/package/nfs-utils/0001-fh_key_file-fix-missing-string.h-inclusion.patch b/package/nfs-utils/0001-fh_key_file-fix-missing-string.h-inclusion.patch
new file mode 100644
index 0000000000..6b6b2baba6
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
+Upstream: https://lore.kernel.org/linux-nfs/20260407154113.1152555-1-giulio.benetti@benettiengineering.com/T/#u
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
index 0000000000..1cfa407b32
--- /dev/null
+++ b/package/nfs-utils/0002-Introduce-compat.h-file-to-deal-with-old-Linux-api-a.patch
@@ -0,0 +1,76 @@
+From 3dce5da6a61f8a8aa27e5bafd253be5834b18c4e Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Tue, 7 Apr 2026 17:47:40 +0200
+Subject: [PATCH] Introduce compat.h file to deal with old Linux api and fix
+ build failure due to missing NETLINK_EXT_ACK
+
+Check if NETLINK_EXT_ACK exists, otherwise define it to fix build
+failure.
+
+Upstream: https://lore.kernel.org/linux-nfs/20260407155045.1176993-1-giulio.benetti@benettiengineering.com/T/#u
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ support/export/cache.c       |  2 ++
+ support/export/cache_flush.c |  2 ++
+ support/include/compat.h     | 10 ++++++++++
+ utils/nfsdctl/nfsdctl.c      |  1 +
+ 4 files changed, 15 insertions(+)
+ create mode 100644 support/include/compat.h
+
+diff --git a/support/export/cache.c b/support/export/cache.c
+index 2f128d7d..ca75a1ce 100644
+--- a/support/export/cache.c
++++ b/support/export/cache.c
+@@ -58,6 +58,8 @@
+ #include "blkid/blkid.h"
+ #endif
+ 
++#include "compat.h"
++
+ enum nfsd_fsid {
+ 	FSID_DEV = 0,
+ 	FSID_NUM,
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
+index 016dd2eb..fb326640 100644
+--- a/utils/nfsdctl/nfsdctl.c
++++ b/utils/nfsdctl/nfsdctl.c
+@@ -45,6 +45,7 @@
+ 
+ #include "nfslib.h"
+ #include "nfsdctl.h"
++#include "compat.h"
+ #include "conffile.h"
+ #include "xlog.h"
+ 
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
