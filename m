From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Sep 2016 22:26:49 +0200
Subject: [Buildroot] [git commit] jemalloc: add a check for valgrind being
	configured as well
Message-ID: <20160911202710.3D5FB81E59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ec692f94984e10593dd154fc340299131b347b0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

jemalloc can be compiled with valgrind support being enabled
to produce proper output, so when the valgrind package has
been configured configure jemalloc appropriately.

In addition, make sure to disable valgrind support unconditionally in
the host variant of jemalloc.

Signed-off-by: Charles Hardin <ckhardin@exablox.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
