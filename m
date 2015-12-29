From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Dec 2015 23:52:34 +0100
Subject: [Buildroot] [git commit] package/rtai: require kernel modules from
	Kconfig
Message-ID: <20151229225703.4F9B8826DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=963ad186ba0fdb37fd82b5c7f0c9c3e39990aa58
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtai/Config.in | 1 +
 package/rtai/rtai.mk   | 6 ------
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/package/rtai/Config.in b/package/rtai/Config.in
index ecbff38..14b1854 100644
--- a/package/rtai/Config.in
+++ b/package/rtai/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_RTAI
 	bool "rtai"
 	depends on BR2_LINUX_KERNEL_EXT_RTAI
+	select BR2_LINUX_NEEDS_MODULES # not using kernel-module infra
 	help
 	  RTAI - the RealTime Application Interface for Linux.
 
diff --git a/package/rtai/rtai.mk b/package/rtai/rtai.mk
index 6e803a6..dfd8e0c 100644
--- a/package/rtai/rtai.mk
+++ b/package/rtai/rtai.mk
@@ -18,12 +18,6 @@ RTAI_POST_INSTALL_STAGING_HOOKS += RTAI_POST_PATCH_FIXUP
 
 RTAI_DEPENDENCIES = linux
 
-# We're building a kernel module without using the kernel-module infra,
-# so we need to tell we want module support in the kernel
-ifeq ($(BR2_PACKAGE_RTAI),y)
-LINUX_NEEDS_MODULES = y
-endif
-
 RTAI_CONF_OPTS = \
 	--includedir=/usr/include/rtai \
 	--with-linux-dir=$(LINUX_DIR) 	\
