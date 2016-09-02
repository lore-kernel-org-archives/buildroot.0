From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 02 Sep 2016 14:29:37 -0000
Subject: [Buildroot] [git commit] lxc: version bump to 2.0.3
Message-ID: <20160902142936.2C86282539@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5050a94ae9f448641e05ce29c931671ffdc62784
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed IPv6 and werror configure.ac patch(s) as
changes where incorporated upsteam.

Signed-off-by: Judd Meinders <judd.meinders@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lxc/0001-drop-werror.patch                 | 16 --------
 .../0002-Fix-redefinition-of-struct-in6_addr.patch | 43 ----------------------
 package/lxc/lxc.hash                               |  2 +-
 package/lxc/lxc.mk                                 |  4 +-
 4 files changed, 2 insertions(+), 63 deletions(-)

diff --git a/package/lxc/0001-drop-werror.patch b/package/lxc/0001-drop-werror.patch
deleted file mode 100644
index d2a8673..0000000
--- a/package/lxc/0001-drop-werror.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Don't do -Werror it breaks builds on some scenarios with trivialities.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura lxc-lxc-1.0.4/configure.ac lxc-lxc-1.0.4.orig/configure.ac
---- lxc-lxc-1.0.4.orig/configure.ac	2014-07-04 10:31:19.821029891 -0300
-+++ lxc-lxc-1.0.4/configure.ac	2014-06-13 14:07:45.000000000 -0300
-@@ -560,7 +560,7 @@
- LXC_CHECK_TLS
- 
- if test "x$GCC" = "xyes"; then
--	CFLAGS="$CFLAGS -Wall -Werror"
-+	CFLAGS="$CFLAGS -Wall"
- fi
- 
- # Files requiring some variable expansion
diff --git a/package/lxc/0002-Fix-redefinition-of-struct-in6_addr.patch b/package/lxc/0002-Fix-redefinition-of-struct-in6_addr.patch
deleted file mode 100644
index b48ece3..0000000
--- a/package/lxc/0002-Fix-redefinition-of-struct-in6_addr.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 245bba9aadf8e7aea487b6fbd851f86c75524552 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Thu, 19 May 2016 21:51:27 +0200
-Subject: [PATCH] Fix redefinition of struct in6_addr
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-struct in6_addr is both defined in the C library header <netinet/in.h>
-and the Linux kernel header <linux/in6.h>.
-
-lxc_user_nic.c includes both <netinet/in.h> and <linux/if_bridge.h>. The
-later one includes <linux/in6.h>.
-
-This breaks build with the musl libc:
-  error: redefinition of ???struct in6_addr???
-
-As lxc_user_nic.c does not use any references from <linux/if_bridge.h> it
-is safe to remove this header.
-
-Upstream status: Pending
-https://github.com/lxc/lxc/pull/1029
-
-Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
----
- src/lxc/lxc_user_nic.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/src/lxc/lxc_user_nic.c b/src/lxc/lxc_user_nic.c
-index 87780ca..0cb38ba 100644
---- a/src/lxc/lxc_user_nic.c
-+++ b/src/lxc/lxc_user_nic.c
-@@ -41,7 +41,6 @@
- #include <net/if.h>
- #include <net/if_arp.h>
- #include <netinet/in.h>
--#include <linux/if_bridge.h>
- #include <linux/netlink.h>
- #include <linux/rtnetlink.h>
- #include <linux/sockios.h>
--- 
-2.8.2
-
diff --git a/package/lxc/lxc.hash b/package/lxc/lxc.hash
index 7470101..3dee7fc 100644
--- a/package/lxc/lxc.hash
+++ b/package/lxc/lxc.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	9588ad1b04e114ee7370f690c65131e28098b28d2521d97c73557d11897ed0be	lxc-1.1.5.tar.gz
+sha256 82df40a0cdd44639ee677d560be95348de48afa93a10a20e959dadb4431ee8d6 lxc-2.0.3.tar.gz
diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index 8190969..b1cd385 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -4,13 +4,11 @@
 #
 ################################################################################
 
-LXC_VERSION = 1.1.5
+LXC_VERSION = 2.0.3
 LXC_SITE = https://linuxcontainers.org/downloads/lxc
 LXC_LICENSE = LGPLv2.1+
 LXC_LICENSE_FILES = COPYING
 LXC_DEPENDENCIES = libcap host-pkgconf
-# we're patching configure.ac
-LXC_AUTORECONF = YES
 LXC_CONF_OPTS = --disable-apparmor --with-distro=buildroot \
 	--disable-lua --disable-python \
 	$(if $(BR2_PACKAGE_BASH),,--disable-bash)
