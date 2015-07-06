From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon,  6 Jul 2015 17:48:04 +0300
Subject: [Buildroot] [PATCH] berkeleydb: accommodate threads presence/absence
Message-ID: <1436194084-24502-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In BerkeleyDB the most convenient implementation of mutexes on Linux is
via POSIX mutex, and that requires pthread library.

Still it is possible to build (and hopefully use) BerkeleyDB without
mutexes. For this we pass "--disable-mutexsupport" during configuration
of the package.

Fixes:
http://autobuild.buildroot.net/results/717f3b37600a56262badc6f7cb64d7949fdacb67/
http://autobuild.buildroot.net/results/80ebf0382992b277fd94743815bbf0c7426a3654/

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 package/berkeleydb/berkeleydb.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index 30fc518..e5c11bd 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -40,6 +40,7 @@ define BERKELEYDB_CONFIGURE_CMDS
 		$(SHARED_STATIC_LIBS_OPTS) \
 		--with-pic \
 		--enable-o_direct \
+		$(if $(BR2_TOOLCHAIN_HAS_THREADS),--enable-mutexsupport,--disable-mutexsupport) \
 	)
 endef
 
-- 
2.4.3
