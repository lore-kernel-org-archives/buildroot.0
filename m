From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 10 Nov 2018 17:00:28 +0100
Subject: [Buildroot] [PATCH 1/1] libmicrohttpd: fix build on riscv
Message-ID: <20181110160028.22033-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Define _REENTRANT like already done for ARC otherwise pthread detection
will fail

Fixes:
 - https://autobuild.buildroot.org/results/910dc7164312637bf4dcd89e4cb476ae198466c8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmicrohttpd/libmicrohttpd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index 1cda434819..c22ad08478 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -11,10 +11,10 @@ LIBMICROHTTPD_INSTALL_STAGING = YES
 LIBMICROHTTPD_CONF_OPTS = --disable-curl --disable-examples
 LIBMICROHTTPD_CFLAGS = $(TARGET_CFLAGS) -std=c99
 
-# gcc on arc doesn't define _REENTRANT when -pthread is passed while
+# gcc on arc and riscv doesn't define _REENTRANT when -pthread is passed while
 # it should. Compensate this deficiency here otherwise libmicrohttpd
 # configure script doesn't find that thread support is enabled.
-ifeq ($(BR2_arc),y)
+ifeq ($(BR2_arc)$(BR2_riscv),y)
 LIBMICROHTTPD_CFLAGS += -D_REENTRANT
 endif
 
-- 
2.17.1
