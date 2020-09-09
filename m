From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 9 Sep 2020 22:38:23 +0200
Subject: [Buildroot] [git commit] package/libcap: disable GOLANG
Message-ID: <20200909203131.C0FBB8078E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3daacfa65bf1e5bf861736b45e3112c8cd2c3f00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Recently, the go infrastructure has changed, and libcap has been
upgraded to 2.42. libcap introduced golang in 2.28, see:

https://git.kernel.org/pub/scm/linux/kernel/git/morgan/libcap.git/commit/Make.Rules?id=0615d996379dceedefcd65a114f93fefd81c208f

When you compile host-go and then compile host-libcap, GOLANG will be
automatically set to yes. Because libcap.mk lacks golang support,
compilation will fail.

Signed-off-by: Tian Yuanhao <tianyuanhao@aliyun.com>
Tested-by: Joseph Kogut <joseph.kogut@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libcap/libcap.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 08c1bc9deb..e16e4ed413 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -62,12 +62,12 @@ endef
 
 define HOST_LIBCAP_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)\
-		RAISE_SETFCAP=no
+		RAISE_SETFCAP=no GOLANG=no
 endef
 
 define HOST_LIBCAP_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) prefix=$(HOST_DIR) \
-		RAISE_SETFCAP=no lib=lib install
+		RAISE_SETFCAP=no GOLANG=no lib=lib install
 endef
 
 $(eval $(generic-package))
