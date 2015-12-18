From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 18 Dec 2015 20:01:44 +0100
Subject: [Buildroot] [PATCH] package/netbsd-queue: fix circular dependency
Message-ID: <1450465304-679-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

netbsd-queue is a dependency of musl, so is part of the toolchain.
As such, it should not depend on the toolchain...

Fixes make circular dependencies such as:

    make[1]: Circular toolchain-all-source <- toolchain-external-all-source
    dependency dropped.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
---
 package/netbsd-queue/netbsd-queue.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/netbsd-queue/netbsd-queue.mk b/package/netbsd-queue/netbsd-queue.mk
index 0f486fa..5fd926b 100644
--- a/package/netbsd-queue/netbsd-queue.mk
+++ b/package/netbsd-queue/netbsd-queue.mk
@@ -9,6 +9,7 @@ NETBSD_QUEUE_SITE = http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/sys
 NETBSD_QUEUE_SOURCE = queue.h?rev=$(NETBSD_QUEUE_VERSION)
 NETBSD_QUEUE_LICENSE = BSD-3c
 
+NETBSD_QUEUE_ADD_TOOLCHAIN_DEPENDENCY = NO
 NETBSD_QUEUE_INSTALL_STAGING = YES
 
 define NETBSD_QUEUE_EXTRACT_CMDS
-- 
1.9.1
