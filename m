From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Dec 2014 00:24:39 +0100
Subject: [Buildroot] [git commit] rpcbind: install init script
	unconditionally
Message-ID: <20141201233009.4A22A80051@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1c8369ce3f9d3c3316b36885f9124e5ae89a1837
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed, users should use a rootfs overlay or a post-build script
instead of a custom skeleton to override files installed by Buildroot,
so there is no point in having conditions when installing init scripts
or configuration files.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpcbind/rpcbind.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
index b7c2261..55de3fc 100644
--- a/package/rpcbind/rpcbind.mk
+++ b/package/rpcbind/rpcbind.mk
@@ -17,9 +17,8 @@ RPCBIND_DEPENDENCIES += libtirpc
 RPCBIND_CONF_OPTS += --with-rpcuser=root
 
 define RPCBIND_INSTALL_INIT_SYSV
-	[ -f $(TARGET_DIR)/etc/init.d/S30rpcbind ] || \
-		$(INSTALL) -m 0755 -D package/rpcbind/S30rpcbind \
-			$(TARGET_DIR)/etc/init.d/S30rpcbind
+	$(INSTALL) -m 0755 -D package/rpcbind/S30rpcbind \
+		$(TARGET_DIR)/etc/init.d/S30rpcbind
 endef
 
 $(eval $(autotools-package))
