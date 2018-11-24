From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Nov 2018 11:25:25 +0100
Subject: [Buildroot] [git commit] Revert "libmicrohttpd: fix build on riscv"
Message-ID: <20181124104553.B6579880BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1133df5c96eb7d78951d0021fc402ccd8c919e23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 2e57e835bf26a8f554033f8c1998d1a34fce16a5, which is
no longer needed now that the RISC-V gcc has been patched to define
_REENTRANT when -pthread is passed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libmicrohttpd/libmicrohttpd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index c22ad08478..1cda434819 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -11,10 +11,10 @@ LIBMICROHTTPD_INSTALL_STAGING = YES
 LIBMICROHTTPD_CONF_OPTS = --disable-curl --disable-examples
 LIBMICROHTTPD_CFLAGS = $(TARGET_CFLAGS) -std=c99
 
-# gcc on arc and riscv doesn't define _REENTRANT when -pthread is passed while
+# gcc on arc doesn't define _REENTRANT when -pthread is passed while
 # it should. Compensate this deficiency here otherwise libmicrohttpd
 # configure script doesn't find that thread support is enabled.
-ifeq ($(BR2_arc)$(BR2_riscv),y)
+ifeq ($(BR2_arc),y)
 LIBMICROHTTPD_CFLAGS += -D_REENTRANT
 endif
 
