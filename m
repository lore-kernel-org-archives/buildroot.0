From: Olaf Rempel <razzor@kopf-tisch.de>
Date: Sun, 16 Oct 2016 13:14:07 +0200
Subject: [Buildroot] [PATCH] package/ctorrent: fix static builds with threads
Message-ID: <1476616447-11298-1-git-send-email-razzor@kopf-tisch.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix static linking with enabled threads for some toolchains

./arm-buildroot-uclinux-uclibcgnueabi/lib/libstdc++.a(guard.o): In function `(anonymous namespace)::get_static_cond()':
guard.cc:(.text._ZN12_GLOBAL__N_115get_static_condEv+0x6): undefined reference to `pthread_once'

Fixes: http://autobuild.buildroot.net/results/138/138569071d0514a0301aa5568bc86706e692d5e9/

Signed-off-by: Olaf Rempel <razzor@kopf-tisch.de>
---
 package/ctorrent/ctorrent.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/ctorrent/ctorrent.mk b/package/ctorrent/ctorrent.mk
index 55fc95e..a3564c5 100644
--- a/package/ctorrent/ctorrent.mk
+++ b/package/ctorrent/ctorrent.mk
@@ -16,4 +16,8 @@ else
 CTORRENT_CONF_OPTS += --with-ssl=no
 endif
 
+ifeq ($(BR2_STATIC_LIBS)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
+CTORRENT_CONF_OPTS += LIBS=-pthread
+endif
+
 $(eval $(autotools-package))
-- 
2.7.4
