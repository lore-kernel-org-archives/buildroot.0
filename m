From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 May 2018 21:42:04 +0200
Subject: [Buildroot] [git commit branch/next] conntrack-tools: bump to
 version 1.4.5
Message-ID: <20180529194155.3EE178028C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b3057380b9417fce6f1da6c0ab33da70909e93fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Drop the musl workaround. musl can handle the suppression of conflicting
kernel headers definitions.

Add license file hash.

This bump fixes compatibility with newer versions of
libnetfilter_conntrack.

Fixes:
http://autobuild.buildroot.net/results/0ae/0aee137c9977e0fb33e7e557b75481780b90edcc/
http://autobuild.buildroot.net/results/9c1/9c178ec5ad84224a385c3184f09ea9b65867a302/
http://autobuild.buildroot.net/results/5e1/5e1ea89e01a9cc13bd384c97903e1726df6d2228/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/conntrack-tools/conntrack-tools.hash |  7 ++++---
 package/conntrack-tools/conntrack-tools.mk   | 11 +----------
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/package/conntrack-tools/conntrack-tools.hash b/package/conntrack-tools/conntrack-tools.hash
index 9d6817721d..cd95a06dc1 100644
--- a/package/conntrack-tools/conntrack-tools.hash
+++ b/package/conntrack-tools/conntrack-tools.hash
@@ -1,3 +1,4 @@
-# From ftp://ftp.netfilter.org/pub/conntrack-tools/conntrack-tools-1.4.4.tar.bz2.{md5sum,sha1sum}
-md5	acd9e0b27cf16ae3092ba900e4d7560e	conntrack-tools-1.4.4.tar.bz2
-sha1	25b36fb6832373ef899bade3b82adf5382b9a05b	conntrack-tools-1.4.4.tar.bz2
+# From https://netfilter.org/projects/conntrack-tools/downloads.html
+sha256 36c6d99c7684851d4d72e75bd07ff3f0ff1baaf4b6f069eb7244990cd1a9a462  conntrack-tools-1.4.5.tar.bz2
+# Locally calculated
+sha256 91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
diff --git a/package/conntrack-tools/conntrack-tools.mk b/package/conntrack-tools/conntrack-tools.mk
index 2f4ea5f2ae..77fcb52956 100644
--- a/package/conntrack-tools/conntrack-tools.mk
+++ b/package/conntrack-tools/conntrack-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONNTRACK_TOOLS_VERSION = 1.4.4
+CONNTRACK_TOOLS_VERSION = 1.4.5
 CONNTRACK_TOOLS_SOURCE = conntrack-tools-$(CONNTRACK_TOOLS_VERSION).tar.bz2
 CONNTRACK_TOOLS_SITE = http://www.netfilter.org/projects/conntrack-tools/files
 CONNTRACK_TOOLS_DEPENDENCIES = host-pkgconf \
@@ -15,15 +15,6 @@ CONNTRACK_TOOLS_LICENSE_FILES = COPYING
 
 CONNTRACK_TOOLS_CFLAGS = $(TARGET_CFLAGS)
 
-# Some of conntrack-tools source files include both linux/in.h (via
-# linux/netfilter.h for kernel headers >= 4.2) and netinet/in.h, which
-# causes some symbol conflicts when musl is used. Defining __GLIBC__
-# works around that issue since the kernel headers are prepared to
-# avoid redefinition of certain symbols when they see __GLIBC__.
-ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
-CONNTRACK_TOOLS_CFLAGS += -D__GLIBC__
-endif
-
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
 CONNTRACK_TOOLS_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`
 CONNTRACK_TOOLS_DEPENDENCIES += libtirpc host-pkgconf
