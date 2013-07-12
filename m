From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Fri, 12 Jul 2013 09:42:44 +0200
Subject: [Buildroot] [PATCH] package/iozone: Build non-threads version if
	!BR2_PTHREADS_NATIVE
Message-ID: <1373614964-5163-1-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

iozone uses pthread_setaffinity_np, which is not supported
in Linuxthreads.

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
 package/iozone/Config.in |    1 +
 package/iozone/iozone.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/iozone/Config.in b/package/iozone/Config.in
index 26d4daa..9dc4f72 100644
--- a/package/iozone/Config.in
+++ b/package/iozone/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_IOZONE
 	bool "iozone"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_PTHREADS_NATIVE # pthread_setaffinity_np()
 	help
 	  IOzone is a filesystem benchmark tool.
 	  The benchmark generates and measures a variety of file operations
diff --git a/package/iozone/iozone.mk b/package/iozone/iozone.mk
index 328a526..c985141 100644
--- a/package/iozone/iozone.mk
+++ b/package/iozone/iozone.mk
@@ -12,7 +12,7 @@ IOZONE_LICENSE = IOzone license (NO DERIVED WORKS ALLOWED)
 # http://www.iozone.org/docs/Iozone_License.txt
 
 # No threading target is non-AIO as well
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
+ifeq ($(BR2_PTHREADS_NATIVE),)
 IOZONE_TARGET = linux-noth
 # AIO support not available on uClibc, use the linux (non-aio) target.
 else ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
-- 
1.7.9.5
