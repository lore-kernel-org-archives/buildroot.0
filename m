From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 6 Nov 2012 08:20:17 +0100
Subject: [Buildroot] [git commit] rpcbind: new package
Message-ID: <20121106072425.7155B99BFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8bc245da2107d4cbd51ae86f90a6e6d5a1f151d8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                              |    1 +
 package/rpcbind/Config.in                      |    8 ++++
 package/rpcbind/rpcbind-01-no-yp-support.patch |   46 ++++++++++++++++++++++++
 package/rpcbind/rpcbind.mk                     |   17 +++++++++
 4 files changed, 72 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index e7e7353..e531c41 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -627,6 +627,7 @@ source "package/proftpd/Config.in"
 source "package/quagga/Config.in"
 source "package/radvd/Config.in"
 source "package/rp-pppoe/Config.in"
+source "package/rpcbind/Config.in"
 source "package/rsh-redone/Config.in"
 source "package/rsync/Config.in"
 source "package/rtorrent/Config.in"
diff --git a/package/rpcbind/Config.in b/package/rpcbind/Config.in
new file mode 100644
index 0000000..1bdcd9e
--- /dev/null
+++ b/package/rpcbind/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_RPCBIND
+	bool "rpcbind"
+	# We really need libtirpc and can't work with the native RPC
+	# implementation of toolchains.
+	select BR2_PACKAGE_LIBTIRPC
+	help
+	  The rpcbind utility is a server that converts RPC program numbers
+	  into universal addresses.
diff --git a/package/rpcbind/rpcbind-01-no-yp-support.patch b/package/rpcbind/rpcbind-01-no-yp-support.patch
new file mode 100644
index 0000000..e9e6c9d
--- /dev/null
+++ b/package/rpcbind/rpcbind-01-no-yp-support.patch
@@ -0,0 +1,46 @@
+Remove yellow pages support
+
+This support requires yellow pages support in libtirpc, which isn't
+available. As most Buildroot users are most likely never going to need
+such feature, get rid of it.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Index: b/src/security.c
+===================================================================
+--- a/src/security.c
++++ b/src/security.c
+@@ -23,9 +23,6 @@
+ #include <rpcsvc/mount.h>
+ #include <rpcsvc/rquota.h>
+ #include <rpcsvc/nfs_prot.h>
+-#include <rpcsvc/yp.h>
+-#include <rpcsvc/ypclnt.h>
+-#include <rpcsvc/yppasswd.h>
+ 
+ #include "rpcbind.h"
+ 
+@@ -322,24 +319,9 @@
+ 		    args->rmt_proc != MOUNTPROC_UMNT)
+ 			break;
+ 		goto deny;
+-	case YPBINDPROG:
+-		if (args->rmt_proc != YPBINDPROC_SETDOM)
+-			break;
+-		/* FALLTHROUGH */
+-	case YPPASSWDPROG:
+ 	case NFS_PROGRAM:
+ 	case RQUOTAPROG:
+ 		goto deny;
+-	case YPPROG:
+-		switch (args->rmt_proc) {
+-		case YPPROC_ALL:
+-		case YPPROC_MATCH:
+-		case YPPROC_FIRST:
+-		case YPPROC_NEXT:
+-			goto deny;
+-		default:
+-			break;
+-		}
+ 	default:
+ 		break;
+ 	}
diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
new file mode 100644
index 0000000..d9a80de
--- /dev/null
+++ b/package/rpcbind/rpcbind.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# rpcbind
+#
+#############################################################
+
+RPCBIND_VERSION = 0.2.0
+RPCBIND_SITE    = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/rpcbind/rpcbind/$(RPCBIND_VERSION)
+RPCBIND_SOURCE  = rpcbind-$(RPCBIND_VERSION).tar.bz2
+RPCBIND_LICENSE = BSD-3c
+RPCBIND_LICENSE_FILES = COPYING
+
+RPCBIND_CONF_ENV += \
+	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/tirpc/"
+RPCBIND_DEPENDENCIES += libtirpc
+
+$(eval $(autotools-package))
