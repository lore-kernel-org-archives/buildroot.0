From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 May 2021 23:33:02 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/dmalloc: fix
 static build
Message-ID: <20210517210900.342A387C0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8e9f7a663e656366cdce440b8be1954e6876876
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Build of dmalloc is broken since commit
19ec872f169a851b48ba04d22432b7c0939847d4 because --enable-shlib is
unconditionally set

Fixes:
 - http://autobuild.buildroot.org/results/62c9c6aebca60649bd6f635125507bf10d63fc05

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 68b5b3fbf079b9e89717a01c8f8d1db1b9f25312)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dmalloc/dmalloc.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
index 638fe0fcda..749c35359c 100644
--- a/package/dmalloc/dmalloc.mk
+++ b/package/dmalloc/dmalloc.mk
@@ -13,10 +13,12 @@ DMALLOC_LICENSE = MIT-like
 DMALLOC_LICENSE_FILES = dmalloc.h.1
 
 DMALLOC_INSTALL_STAGING = YES
-DMALLOC_CONF_OPTS = --enable-shlib
 DMALLOC_CFLAGS = $(TARGET_CFLAGS)
 
-ifeq ($(BR2_STATIC_LIBS),)
+ifeq ($(BR2_STATIC_LIBS),y)
+DMALLOC_CONF_OPTS += --disable-shlib
+else
+DMALLOC_CONF_OPTS += --enable-shlib
 DMALLOC_CFLAGS += -fPIC
 endif
 
