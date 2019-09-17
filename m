From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Sep 2019 22:15:14 +0200
Subject: [Buildroot] [git commit] package/fio: bump to version 3.15
Message-ID: <20190917201811.B4DBB8E9B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f8334e24936d8cb36791e9698a30e76b8fc744ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove patch (already in version)
- Change FIO_SITE to http://brick.kernel.dk/snaps to remove 'fio-'
  prefix from FIO_VERSION to match what is given by
  release-monitoring.org

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fio/0001-configure-add-gettid-test.patch | 200 -----------------------
 package/fio/fio.hash                             |   2 +-
 package/fio/fio.mk                               |   4 +-
 3 files changed, 3 insertions(+), 203 deletions(-)

diff --git a/package/fio/0001-configure-add-gettid-test.patch b/package/fio/0001-configure-add-gettid-test.patch
deleted file mode 100644
index 4138e23912..0000000000
--- a/package/fio/0001-configure-add-gettid-test.patch
+++ /dev/null
@@ -1,200 +0,0 @@
-From de5ed0e4d398bc9d4576f9b2b82d7686989c27e1 Mon Sep 17 00:00:00 2001
-From: Jens Axboe <axboe@kernel.dk>
-Date: Wed, 22 May 2019 17:12:55 -0600
-Subject: [PATCH] configure: add gettid() test
-
-Apparently some newer glibcs now have it, decades after the
-fact.
-
-Signed-off-by: Jens Axboe <axboe@kernel.dk>
-[Retrieved (and backported) from:
-http://git.kernel.dk/?p=fio.git;a=commit;h=de5ed0e4d398bc9d4576f9b2b82d7686989c27e1]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure         | 18 ++++++++++++++++++
- os/os-dragonfly.h |  2 ++
- os/os-linux.h     |  2 ++
- os/os-mac.h       |  2 ++
- os/os-netbsd.h    |  2 ++
- os/os-openbsd.h   |  2 ++
- os/os-solaris.h   |  2 ++
- os/os-windows.h   |  2 ++
- os/os.h           |  2 ++
- 9 files changed, 34 insertions(+)
-
-diff --git a/configure b/configure
-index d71387c0..ee421663 100755
---- a/configure
-+++ b/configure
-@@ -2374,6 +2374,21 @@ EOF
- fi
- print_config "MADV_HUGEPAGE" "$thp"
- 
-+##########################################
-+# check for gettid()
-+gettid="no"
-+cat > $TMPC << EOF
-+#include <unistd.h>
-+int main(int argc, char **argv)
-+{
-+  return gettid();
-+}
-+EOF
-+if compile_prog "" "" "gettid"; then
-+  gettid="yes"
-+fi
-+print_config "gettid" "$gettid"
-+
- #############################################################################
- 
- if test "$wordsize" = "64" ; then
-@@ -2645,6 +2660,9 @@ fi
- if test "$march_set" = "no" && test "$build_native" = "yes" ; then
-   output_sym "CONFIG_BUILD_NATIVE"
- fi
-+if test "$gettid" = "yes"; then
-+  output_sym "CONFIG_HAVE_GETTID"
-+fi
- 
- echo "LIBS+=$LIBS" >> $config_host_mak
- echo "GFIO_LIBS+=$GFIO_LIBS" >> $config_host_mak
-diff --git a/os/os-dragonfly.h b/os/os-dragonfly.h
-index eb92521f..3c460ae2 100644
---- a/os/os-dragonfly.h
-+++ b/os/os-dragonfly.h
-@@ -202,10 +202,12 @@ static inline unsigned long long os_phys_mem(void)
- 	return mem;
- }
- 
-+#ifndef CONFIG_HAVE_GETTID
- static inline int gettid(void)
- {
- 	return (int) lwp_gettid();
- }
-+#endif
- 
- static inline unsigned long long get_fs_free_size(const char *path)
- {
-diff --git a/os/os-linux.h b/os/os-linux.h
-index ba58bf7d..36339ef3 100644
---- a/os/os-linux.h
-+++ b/os/os-linux.h
-@@ -124,10 +124,12 @@ static inline int ioprio_set(int which, int who, int ioprio_class, int ioprio)
- 	return syscall(__NR_ioprio_set, which, who, ioprio);
- }
- 
-+#ifndef CONFIG_HAVE_GETTID
- static inline int gettid(void)
- {
- 	return syscall(__NR_gettid);
- }
-+#endif
- 
- #define SPLICE_DEF_SIZE	(64*1024)
- 
-diff --git a/os/os-mac.h b/os/os-mac.h
-index 0b9c8707..a073300c 100644
---- a/os/os-mac.h
-+++ b/os/os-mac.h
-@@ -90,10 +90,12 @@ static inline unsigned long long os_phys_mem(void)
- 	return mem;
- }
- 
-+#ifndef CONFIG_HAVE_GETTID
- static inline int gettid(void)
- {
- 	return mach_thread_self();
- }
-+#endif
- 
- /*
-  * For some reason, there's no header definition for fdatasync(), even
-diff --git a/os/os-netbsd.h b/os/os-netbsd.h
-index c06261d4..88fb3ef1 100644
---- a/os/os-netbsd.h
-+++ b/os/os-netbsd.h
-@@ -65,10 +65,12 @@ static inline unsigned long long os_phys_mem(void)
- 	return mem;
- }
- 
-+#ifndef CONFIG_HAVE_GETTID
- static inline int gettid(void)
- {
- 	return (int) _lwp_self();
- }
-+#endif
- 
- static inline unsigned long long get_fs_free_size(const char *path)
- {
-diff --git a/os/os-openbsd.h b/os/os-openbsd.h
-index 70f58b49..43a649d4 100644
---- a/os/os-openbsd.h
-+++ b/os/os-openbsd.h
-@@ -65,10 +65,12 @@ static inline unsigned long long os_phys_mem(void)
- 	return mem;
- }
- 
-+#ifndef CONFIG_HAVE_GETTID
- static inline int gettid(void)
- {
- 	return (int)(intptr_t) pthread_self();
- }
-+#endif
- 
- static inline unsigned long long get_fs_free_size(const char *path)
- {
-diff --git a/os/os-solaris.h b/os/os-solaris.h
-index 1a411af6..f1966f44 100644
---- a/os/os-solaris.h
-+++ b/os/os-solaris.h
-@@ -164,10 +164,12 @@ static inline int fio_cpuset_exit(os_cpu_mask_t *mask)
- 	return 0;
- }
- 
-+#ifndef CONFIG_HAVE_GETTID
- static inline int gettid(void)
- {
- 	return pthread_self();
- }
-+#endif
- 
- /*
-  * Should be enough, not aware of what (if any) restrictions Solaris has
-diff --git a/os/os-windows.h b/os/os-windows.h
-index dc958f5c..3e9f7341 100644
---- a/os/os-windows.h
-+++ b/os/os-windows.h
-@@ -162,10 +162,12 @@ static inline unsigned long long os_phys_mem(void)
- 	return (unsigned long long) pages * (unsigned long long) pagesize;
- }
- 
-+#ifndef CONFIG_HAVE_GETTID
- static inline int gettid(void)
- {
- 	return GetCurrentThreadId();
- }
-+#endif
- 
- static inline int init_random_seeds(uint64_t *rand_seeds, int size)
- {
-diff --git a/os/os.h b/os/os.h
-index 756ece4b..e4729680 100644
---- a/os/os.h
-+++ b/os/os.h
-@@ -373,11 +373,13 @@ static inline int CPU_COUNT(os_cpu_mask_t *mask)
- #endif
- 
- #ifndef FIO_HAVE_GETTID
-+#ifndef CONFIG_HAVE_GETTID
- static inline int gettid(void)
- {
- 	return getpid();
- }
- #endif
-+#endif
- 
- #ifndef FIO_HAVE_SHM_ATTACH_REMOVED
- static inline int shm_attach_to_open_removed(void)
--- 
-2.17.1
-
diff --git a/package/fio/fio.hash b/package/fio/fio.hash
index e7eea5820b..f6ec1f3277 100644
--- a/package/fio/fio.hash
+++ b/package/fio/fio.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256 b4009bf4f9ddbb4e8c72b2316f91dcf83e476e7a1132b0318c226d945a6d8247  fio-fio-3.9.tar.gz
+sha256 a84e663518c8e25ef8f9a1f6a92a91b28b4cc8f648d4d26728a8bfc1dafdce74  fio-3.15.tar.gz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256 8a240c1ad13d1fe3e58588643d81d0695899be4a669fe6d8fafa76ca6a89db2c  MORAL-LICENSE
diff --git a/package/fio/fio.mk b/package/fio/fio.mk
index 34e24e55de..c88e7d2841 100644
--- a/package/fio/fio.mk
+++ b/package/fio/fio.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FIO_VERSION = fio-3.9
-FIO_SITE = git://git.kernel.dk/fio.git
+FIO_VERSION = 3.15
+FIO_SITE = http://brick.kernel.dk/snaps
 FIO_LICENSE = GPL-2.0
 FIO_LICENSE_FILES = COPYING MORAL-LICENSE
 
