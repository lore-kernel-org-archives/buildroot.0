From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri,  9 Dec 2016 11:26:03 +0100
Subject: [Buildroot] [PATCH] ezxml: disable mmap code for nommu
Message-ID: <20161209102603.16303-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/8e1/8e10052a0d0ad4f47622925349ec5fddb7b672f0/
http://autobuild.buildroot.net/results/2f1/2f15b81beadd2d902c73d6d8bd7fb06b03f62ef5/

The mmap support uses madvise which isn't available on nommu uClibc, so disable it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ezxml/ezxml.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/ezxml/ezxml.mk b/package/ezxml/ezxml.mk
index a806e56..f1e18aa 100644
--- a/package/ezxml/ezxml.mk
+++ b/package/ezxml/ezxml.mk
@@ -10,9 +10,16 @@ EZXML_INSTALL_STAGING = YES
 EZXML_LICENSE = MIT
 EZXML_LICENSE_FILES = license.txt
 
+EZXML_CFLAGS = $(TARGET_CFLAGS)
+
+# mmap code uses madvise which isn't available on nommu uClibc
+ifeq ($(BR2_USE_MMU),)
+EZXML_CFLAGS += -D EZXML_NOMMAP
+endif
+
 define EZXML_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) -f GNUmakefile \
-		CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" AR=$(TARGET_AR)
+		CC="$(TARGET_CC)" CFLAGS="$(EZXML_CFLAGS)" AR=$(TARGET_AR)
 endef
 
 define EZXML_INSTALL_STAGING_CMDS
-- 
2.10.2
