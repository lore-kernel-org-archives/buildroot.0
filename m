From: Dmitry <golubovsky@gmail.com>
Date: Sat,  8 Sep 2012 00:21:03 -0400
Subject: [Buildroot] [PATCH 1/4] If linux-pam is built,
	enable dbm functionality in Berkeley DB
Message-ID: <1347078066-25257-1-git-send-email-golubovsky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The linux-pam library has the pam_userdb module which uses a
dbm-compatible database to authenticate users. Berkeley DB provides
such functionality, so it has to be condidionally enabled if linux-pam
is used.

Signed-off-by: Dmitry <golubovsky@gmail.com>
---
 package/berkeleydb/berkeleydb.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index 3037da6..3ca334f 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -30,6 +30,7 @@ define BERKELEYDB_CONFIGURE_CMDS
 		$(if $(BR2_INSTALL_LIBSTDCPP),--enable-cxx,--disable-cxx) \
 		--disable-java \
 		--disable-tcl \
+		$(if $(BR2_PACKAGE_LINUX_PAM),--enable-dbm,--disable-dbm) \
 		--disable-compat185 \
 		$(SHARED_STATIC_LIBS_OPTS) \
 		--with-pic \
-- 
1.7.2.5
