From: Charles Hardin <ckhardin@exablox.com>
Date: Thu,  8 Sep 2016 16:42:00 -0700
Subject: [Buildroot] [PATCH 1/1] jemalloc: add a check for valgrind being
	configured as well
Message-ID: <1473378120-7549-1-git-send-email-ckhardin@exablox.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

jemalloc can be compiled with valgrind support being enabled
to produce proper output, so when the valgrind package has
been configured configure jemalloc appropriately.

Signed-off-by: Charles Hardin <ckhardin@exablox.com>
---
 package/jemalloc/jemalloc.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/jemalloc/jemalloc.mk b/package/jemalloc/jemalloc.mk
index 7086dfa..f1c9ffe 100644
--- a/package/jemalloc/jemalloc.mk
+++ b/package/jemalloc/jemalloc.mk
@@ -11,5 +11,14 @@ JEMALLOC_LICENSE = BSD-2c
 JEMALLOC_LICENSE_FILES = COPYING
 JEMALLOC_INSTALL_STAGING = YES
 
+ifeq ($(BR2_PACKAGE_VALGRIND),y)
+JEMALLOC_DEPENDENCIES += valgrind
+JEMALLOC_CONF_OPTS += --enable-valgrind
+else
+JEMALLOC_CONF_OPTS += --disable-valgrind
+endif
+
+HOST_JEMALLOC_CONF_OPTS += --disable-valgrind
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.7.4 (Apple Git-66)
