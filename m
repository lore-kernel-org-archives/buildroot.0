From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Nov 2018 22:52:55 +0100
Subject: [Buildroot] [git commit] shadowsocks-libev: fix build on riscv
Message-ID: <20181113215032.3438882B50@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ebffca8ba483610478f33cdc52a24a165e4da87e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Define _REENTRANT otherwise pthread detection will fail

Fixes:
 - http://autobuild.buildroot.org/results/c5406206190b46e15d35d05c5ed026ee7632f5b1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/shadowsocks-libev/shadowsocks-libev.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/shadowsocks-libev/shadowsocks-libev.mk b/package/shadowsocks-libev/shadowsocks-libev.mk
index caae2176b4..7fdcd3f772 100644
--- a/package/shadowsocks-libev/shadowsocks-libev.mk
+++ b/package/shadowsocks-libev/shadowsocks-libev.mk
@@ -14,4 +14,11 @@ SHADOWSOCKS_LIBEV_CONF_OPTS = \
 	--with-pcre=$(STAGING_DIR)/usr \
 	--disable-ssp
 
+# gcc on riscv doesn't define _REENTRANT when -pthread is passed while
+# it should. Compensate this deficiency here otherwise shadowsocks-libev
+# configure script doesn't find that thread support is enabled.
+ifeq ($(BR2_riscv),y)
+SHADOWSOCKS_LIBEV_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_REENTRANT"
+endif
+
 $(eval $(autotools-package))
