From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Sun, 21 Feb 2021 12:38:44 -0600
Subject: [Buildroot] [PATCH] package/fakeroot: fix glibc detection on patch
 for new wrappers
Message-ID: <20210221183844.845822-1-ryanbarnett3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit f45925a951318e9e53bead80b363e004301adc6f add the patch:

0003-libfakeroot.c-add-wrappers-for-new-glibc-2.33-symbol.patch

which allowed fakeroot to be compiled with GLIBC 2.33 or above.
However, this introduce a bug for building with a non-GLIBC based
toolchain as a GLIBC macro - __GLIBC_PREREQ - is used on the same line
as the detection of GLIBC.

Fix this by backporting the fix to this incorrect macro from upstream
commit:

https://salsa.debian.org/clint/fakeroot/-/commit/8090dffdad8fda86dccd47ce7a7db8840bdf7d7b

Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
---
 ...d-wrappers-for-new-glibc-2.33-symbol.patch | 22 +++++++++++++------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/package/fakeroot/0003-libfakeroot.c-add-wrappers-for-new-glibc-2.33-symbol.patch b/package/fakeroot/0003-libfakeroot.c-add-wrappers-for-new-glibc-2.33-symbol.patch
index 8115598d64..fbbf16b4f4 100644
--- a/package/fakeroot/0003-libfakeroot.c-add-wrappers-for-new-glibc-2.33-symbol.patch
+++ b/package/fakeroot/0003-libfakeroot.c-add-wrappers-for-new-glibc-2.33-symbol.patch
@@ -1,4 +1,4 @@
-From feda578ca3608b7fc9a28a3a91293611c0ef47b7 Mon Sep 17 00:00:00 2001
+From 2c15ff6dda7ad3ea45590e262288569862fb3b90 Mon Sep 17 00:00:00 2001
 From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
 Date: Thu, 11 Feb 2021 21:00:04 -0800
 Subject: [PATCH] libfakeroot.c: add wrappers for new glibc 2.33+ symbols
@@ -9,22 +9,29 @@ Content-Transfer-Encoding: 8bit
 This patch add wrappers for newly exported symbols in glibc 2.33.
 
 Backported from: feda578ca3608b7fc9a28a3a91293611c0ef47b7
+Backported from: 8090dffdad8fda86dccd47ce7a7db8840bdf7d7b
 
 Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
 Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
 ---
- libfakeroot.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 48 insertions(+)
+v1 -> v2
+ - [ryan] incorporated fix to allow libfakeroot to compile on non
+   GLIBC hosts since __GLIBC_PREREQ macro is not defined
+---
+ libfakeroot.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 50 insertions(+)
 
 diff --git a/libfakeroot.c b/libfakeroot.c
-index 14cdbc4..d75c51f 100644
+index 14cdbc4..ec4e577 100644
 --- a/libfakeroot.c
 +++ b/libfakeroot.c
-@@ -1352,6 +1352,54 @@ int renameat(int olddir_fd, const char *oldpath,
+@@ -1352,6 +1352,56 @@ int renameat(int olddir_fd, const char *oldpath,
  #endif /* HAVE_FSTATAT */
  
  
-+#if defined(__GLIBC__) && __GLIBC_PREREQ(2,33)
++#if defined(__GLIBC__)
++#if __GLIBC_PREREQ(2,33)
 +/* Glibc 2.33 exports symbols for these functions in the shared lib */
 +  int lstat(const char *file_name, struct stat *statbuf) {
 +     return WRAP_LSTAT LSTAT_ARG(_STAT_VER, file_name, statbuf);
@@ -69,6 +76,7 @@ index 14cdbc4..d75c51f 100644
 +       return WRAP_MKNODAT MKNODAT_ARG(_STAT_VER, dir_fd, pathname, mode, &dev);
 +    }
 +  #endif
++#endif /* __GLIBC__ */
 +#endif /* GLIBC_PREREQ */
 +
 +
@@ -76,5 +84,5 @@ index 14cdbc4..d75c51f 100644
  pid_t fork(void)
  {
 -- 
-2.30.1
+2.25.1
 
-- 
2.25.1
