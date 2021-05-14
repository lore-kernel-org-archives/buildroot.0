From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 14 May 2021 23:26:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/dmalloc: unconditionally set -fPIC
Message-ID: <20210514212602.2274195-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Unconditionally set -fPIC to avoid the following build failure which is
raised since commit 19ec872f169a851b48ba04d22432b7c0939847d4:

/home/giuliobenetti/autobuild/run/instance-2/output-1/host/bin/or1k-linux-ld -shared --whole-archive -soname libdmallocxx.so -o libdmallocxx.so.t libdmallocxx.a
/home/giuliobenetti/autobuild/run/instance-2/output-1/host/bin/or1k-linux-ld: libdmallocxx.a(arg_check.o): non-pic relocation against symbol _dmalloc_flags
/home/giuliobenetti/autobuild/run/instance-2/output-1/host/bin/or1k-linux-ld: libdmallocxx.a(arg_check.o): non-pic relocation against symbol _dmalloc_flags
/home/giuliobenetti/autobuild/run/instance-2/output-1/host/bin/or1k-linux-ld: libdmallocxx.a(arg_check.o): pc-relative relocation against dynamic symbol dmalloc_verify_pnt

Fixes:
 - http://autobuild.buildroot.org/results/62c9c6aebca60649bd6f635125507bf10d63fc05

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dmalloc/dmalloc.mk | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
index 638fe0fcda..8300cc7f19 100644
--- a/package/dmalloc/dmalloc.mk
+++ b/package/dmalloc/dmalloc.mk
@@ -14,11 +14,7 @@ DMALLOC_LICENSE_FILES = dmalloc.h.1
 
 DMALLOC_INSTALL_STAGING = YES
 DMALLOC_CONF_OPTS = --enable-shlib
-DMALLOC_CFLAGS = $(TARGET_CFLAGS)
-
-ifeq ($(BR2_STATIC_LIBS),)
-DMALLOC_CFLAGS += -fPIC
-endif
+DMALLOC_CFLAGS = $(TARGET_CFLAGS) -fPIC
 
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 DMALLOC_CONF_OPTS += --enable-cxx
-- 
2.30.2
