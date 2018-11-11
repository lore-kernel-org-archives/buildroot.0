From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Nov 2018 21:59:00 +0100
Subject: [Buildroot] [git commit] libmicrohttpd: fix build on riscv
Message-ID: <20181111205631.AE9F1825DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2e57e835bf26a8f554033f8c1998d1a34fce16a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Define _REENTRANT like already done for ARC otherwise pthread detection
will fail

Fixes:
 - https://autobuild.buildroot.org/results/910dc7164312637bf4dcd89e4cb476ae198466c8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 
