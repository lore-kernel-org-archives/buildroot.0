From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Jul 2017 00:05:18 +0200
Subject: [Buildroot] [git commit] lxc: don't download patch from Github
Message-ID: <20170702220304.4F0E97FF0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8c7c81d1d747b934367df259fa20d9afbc42b6e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patches downloaded from Github are not stable, so bring them in the
tree.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../lxc/0001-conf-fix-build-without-libcap.patch   | 31 ++++++++++++++++++++++
 package/lxc/lxc.hash                               |  1 -
 package/lxc/lxc.mk                                 |  4 ---
 3 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/package/lxc/0001-conf-fix-build-without-libcap.patch b/package/lxc/0001-conf-fix-build-without-libcap.patch
new file mode 100644
index 0000000..7e7c010
--- /dev/null
+++ b/package/lxc/0001-conf-fix-build-without-libcap.patch
@@ -0,0 +1,31 @@
+From bc5b27d6f6d166d2a6df47982cbe36041ce6b735 Mon Sep 17 00:00:00 2001
+From: Dima Krasner <dima@securingsam.com>
+Date: Sun, 14 May 2017 12:24:59 +0300
+Subject: [PATCH] conf: fix build without libcap
+
+Signed-off-by: Dima Krasner <samdima@securingsam.com>
+[Upstream commit: https://github.com/lxc/lxc/commit/bc5b27d6f6d166d2a6df47982cbe36041ce6b735]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ src/lxc/conf.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/src/lxc/conf.c b/src/lxc/conf.c
+index 35bdb249b..76a190120 100644
+--- a/src/lxc/conf.c
++++ b/src/lxc/conf.c
+@@ -130,6 +130,14 @@ lxc_log_define(lxc_conf, lxc);
+ #define LO_FLAGS_AUTOCLEAR 4
+ #endif
+ 
++#ifndef CAP_SETUID
++#define CAP_SETUID 7
++#endif
++
++#ifndef CAP_SETGID
++#define CAP_SETGID 6
++#endif
++
+ /* needed for cgroup automount checks, regardless of whether we
+  * have included linux/capability.h or not */
+ #ifndef CAP_SYS_ADMIN
diff --git a/package/lxc/lxc.hash b/package/lxc/lxc.hash
index 501f869..086b139 100644
--- a/package/lxc/lxc.hash
+++ b/package/lxc/lxc.hash
@@ -1,3 +1,2 @@
 # Locally calculated
 sha256	0d8e34b302cfe4c40c6c9ae5097096aa5cc2c1dfceea3f0f22e3e16c4a4e8494	lxc-2.0.8.tar.gz
-sha256	16cf466db42a45bd579bdb66efbeb63764cd93d049f05a6d8a659846cab9b47f	bc5b27d6f6d166d2a6df47982cbe36041ce6b735.patch
diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index 8a200e7..03e9431 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -11,10 +11,6 @@ LXC_LICENSE_FILES = COPYING
 LXC_DEPENDENCIES = host-pkgconf
 LXC_INSTALL_STAGING = YES
 
-# This patch fixes compilation without capabilities
-LXC_PATCH = \
-	https://github.com/lxc/lxc/commit/bc5b27d6f6d166d2a6df47982cbe36041ce6b735.patch
-
 LXC_CONF_OPTS = --disable-apparmor --with-distro=buildroot \
 	--disable-python --disable-werror \
 	$(if $(BR2_PACKAGE_BASH),,--disable-bash)
