From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Nov 2018 11:24:24 +0100
Subject: [Buildroot] [git commit] Revert "shadowsocks-libev: fix build on
 riscv"
Message-ID: <20181124104553.A97B3880BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3e2fc295ca57ff03600472589ffa57d5019aeab0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit ebffca8ba483610478f33cdc52a24a165e4da87e, which is
no longer needed now that the RISC-V gcc has been patched to define
_REENTRANT when -pthread is passed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/shadowsocks-libev/shadowsocks-libev.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/shadowsocks-libev/shadowsocks-libev.mk b/package/shadowsocks-libev/shadowsocks-libev.mk
index 7fdcd3f772..caae2176b4 100644
--- a/package/shadowsocks-libev/shadowsocks-libev.mk
+++ b/package/shadowsocks-libev/shadowsocks-libev.mk
@@ -14,11 +14,4 @@ SHADOWSOCKS_LIBEV_CONF_OPTS = \
 	--with-pcre=$(STAGING_DIR)/usr \
 	--disable-ssp
 
-# gcc on riscv doesn't define _REENTRANT when -pthread is passed while
-# it should. Compensate this deficiency here otherwise shadowsocks-libev
-# configure script doesn't find that thread support is enabled.
-ifeq ($(BR2_riscv),y)
-SHADOWSOCKS_LIBEV_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_REENTRANT"
-endif
-
 $(eval $(autotools-package))
