From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Dec 2019 18:09:06 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/libssh: bump to
 version 0.9.0
Message-ID: <20191225170049.D7C618E36E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4589e20afa407cca07dcd92c23adf700582d38e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Drop upstream patches.

Cc: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a18af4f8e012283e1c94540f1ec70b6441d16647)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...001-buffer-Fix-size-comparison-with-count.patch |  48 -------
 ...size_t-for-argc-argument-in-ssh_buffer_-u.patch | 152 ---------------------
 .../libssh/0003-more-strict-overflow-fixes.patch   | 122 -----------------
 package/libssh/libssh.hash                         |   4 +-
 package/libssh/libssh.mk                           |   4 +-
 5 files changed, 4 insertions(+), 326 deletions(-)

diff --git a/package/libssh/0001-buffer-Fix-size-comparison-with-count.patch b/package/libssh/0001-buffer-Fix-size-comparison-with-count.patch
deleted file mode 100644
index 88e1bc3b48..0000000000
--- a/package/libssh/0001-buffer-Fix-size-comparison-with-count.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 2aa8c46a853acd4198af16e417ebffd5b0e2c9f4 Mon Sep 17 00:00:00 2001
-From: Andreas Schneider <asn@cryptomilk.org>
-Date: Mon, 1 Oct 2018 20:58:47 +0200
-Subject: [PATCH] buffer: Fix size comparison with count
-
-Signed-off-by: Andreas Schneider <asn@cryptomilk.org>
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit 9c3ba94960cd5
-
- src/buffer.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/buffer.c b/src/buffer.c
-index da6e587fc9e4..b029f202660f 100644
---- a/src/buffer.c
-+++ b/src/buffer.c
-@@ -816,8 +816,8 @@ static int ssh_buffer_pack_allocate_va(struct ssh_buffer_struct *buffer,
-     ssh_string string = NULL;
-     char *cstring = NULL;
-     size_t needed_size = 0;
--    size_t count;
-     size_t len;
-+    int count; /* int for size comparison with argc */
-     int rc = SSH_OK;
- 
-     for (p = format, count = 0; *p != '\0'; p++, count++) {
-@@ -934,7 +934,7 @@ int ssh_buffer_pack_va(struct ssh_buffer_struct *buffer,
-     char *cstring;
-     bignum b;
-     size_t len;
--    int count;
-+    int count; /* int for size comparison with argc */
- 
-     for (p = format, count = 0; *p != '\0'; p++, count++) {
-         /* Invalid number of arguments passed */
-@@ -1098,7 +1098,7 @@ int ssh_buffer_unpack_va(struct ssh_buffer_struct *buffer,
-     } o;
-     size_t len, rlen, max_len;
-     va_list ap_copy;
--    int count;
-+    int count; /* int for size comparison with argc */
- 
-     max_len = ssh_buffer_get_len(buffer);
- 
--- 
-2.20.1
-
diff --git a/package/libssh/0002-buffer-Use-size_t-for-argc-argument-in-ssh_buffer_-u.patch b/package/libssh/0002-buffer-Use-size_t-for-argc-argument-in-ssh_buffer_-u.patch
deleted file mode 100644
index c86238a7a1..0000000000
--- a/package/libssh/0002-buffer-Use-size_t-for-argc-argument-in-ssh_buffer_-u.patch
+++ /dev/null
@@ -1,152 +0,0 @@
-From 270d6aa2bb01f3430d07cce5f97b48b741e3df9c Mon Sep 17 00:00:00 2001
-From: Andreas Schneider <asn@cryptomilk.org>
-Date: Fri, 7 Dec 2018 12:06:03 +0100
-Subject: [PATCH] buffer: Use size_t for argc argument in ssh_buffer_(un)pack()
-
-Signed-off-by: Andreas Schneider <asn@cryptomilk.org>
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit c306a693f3fbe
-
- include/libssh/buffer.h |  4 ++--
- src/buffer.c            | 38 +++++++++++++++++++-------------------
- 2 files changed, 21 insertions(+), 21 deletions(-)
-
-diff --git a/include/libssh/buffer.h b/include/libssh/buffer.h
-index 4721cbe06c20..1c375343ee14 100644
---- a/include/libssh/buffer.h
-+++ b/include/libssh/buffer.h
-@@ -40,11 +40,11 @@ void *ssh_buffer_allocate(struct ssh_buffer_struct *buffer, uint32_t len);
- int ssh_buffer_allocate_size(struct ssh_buffer_struct *buffer, uint32_t len);
- int ssh_buffer_pack_va(struct ssh_buffer_struct *buffer,
-                        const char *format,
--                       int argc,
-+                       size_t argc,
-                        va_list ap);
- int _ssh_buffer_pack(struct ssh_buffer_struct *buffer,
-                      const char *format,
--                     int argc,
-+                     size_t argc,
-                      ...);
- #define ssh_buffer_pack(buffer, format, ...) \
-     _ssh_buffer_pack((buffer), (format), __VA_NARG__(__VA_ARGS__), __VA_ARGS__, SSH_BUFFER_PACK_END)
-diff --git a/src/buffer.c b/src/buffer.c
-index b029f202660f..99863747fc3c 100644
---- a/src/buffer.c
-+++ b/src/buffer.c
-@@ -809,7 +809,7 @@ ssh_buffer_get_ssh_string(struct ssh_buffer_struct *buffer)
-  */
- static int ssh_buffer_pack_allocate_va(struct ssh_buffer_struct *buffer,
-                                        const char *format,
--                                       int argc,
-+                                       size_t argc,
-                                        va_list ap)
- {
-     const char *p = NULL;
-@@ -817,12 +817,12 @@ static int ssh_buffer_pack_allocate_va(struct ssh_buffer_struct *buffer,
-     char *cstring = NULL;
-     size_t needed_size = 0;
-     size_t len;
--    int count; /* int for size comparison with argc */
-+    size_t count;
-     int rc = SSH_OK;
- 
-     for (p = format, count = 0; *p != '\0'; p++, count++) {
-         /* Invalid number of arguments passed */
--        if (argc != -1 && count > argc) {
-+        if (count > argc) {
-             return SSH_ERROR;
-         }
- 
-@@ -881,7 +881,7 @@ static int ssh_buffer_pack_allocate_va(struct ssh_buffer_struct *buffer,
-         }
-     }
- 
--    if (argc != -1 && argc != count) {
-+    if (argc != count) {
-         return SSH_ERROR;
-     }
- 
-@@ -891,11 +891,7 @@ static int ssh_buffer_pack_allocate_va(struct ssh_buffer_struct *buffer,
-          */
-         uint32_t canary = va_arg(ap, uint32_t);
-         if (canary != SSH_BUFFER_PACK_END) {
--            if (argc == -1){
--                return SSH_ERROR;
--            } else {
--                abort();
--            }
-+            abort();
-         }
-     }
- 
-@@ -918,7 +914,7 @@ static int ssh_buffer_pack_allocate_va(struct ssh_buffer_struct *buffer,
-  */
- int ssh_buffer_pack_va(struct ssh_buffer_struct *buffer,
-                        const char *format,
--                       int argc,
-+                       size_t argc,
-                        va_list ap)
- {
-     int rc = SSH_ERROR;
-@@ -934,11 +930,15 @@ int ssh_buffer_pack_va(struct ssh_buffer_struct *buffer,
-     char *cstring;
-     bignum b;
-     size_t len;
--    int count; /* int for size comparison with argc */
-+    size_t count;
-+
-+    if (argc > 256) {
-+        return SSH_ERROR;
-+    }
- 
-     for (p = format, count = 0; *p != '\0'; p++, count++) {
-         /* Invalid number of arguments passed */
--        if (argc != -1 && count > argc) {
-+        if (count > argc) {
-             return SSH_ERROR;
-         }
- 
-@@ -1010,7 +1010,7 @@ int ssh_buffer_pack_va(struct ssh_buffer_struct *buffer,
-         }
-     }
- 
--    if (argc != -1 && argc != count) {
-+    if (argc != count) {
-         return SSH_ERROR;
-     }
- 
-@@ -1018,11 +1018,7 @@ int ssh_buffer_pack_va(struct ssh_buffer_struct *buffer,
-         /* Check if our canary is intact, if not somthing really bad happened */
-         uint32_t canary = va_arg(ap, uint32_t);
-         if (canary != SSH_BUFFER_PACK_END) {
--            if (argc == -1){
--                return SSH_ERROR;
--            } else {
--                abort();
--            }
-+            abort();
-         }
-     }
-     return rc;
-@@ -1050,12 +1046,16 @@ int ssh_buffer_pack_va(struct ssh_buffer_struct *buffer,
-  */
- int _ssh_buffer_pack(struct ssh_buffer_struct *buffer,
-                      const char *format,
--                     int argc,
-+                     size_t argc,
-                      ...)
- {
-     va_list ap;
-     int rc;
- 
-+    if (argc > 256) {
-+        return SSH_ERROR;
-+    }
-+
-     va_start(ap, argc);
-     rc = ssh_buffer_pack_allocate_va(buffer, format, argc, ap);
-     va_end(ap);
--- 
-2.20.1
-
diff --git a/package/libssh/0003-more-strict-overflow-fixes.patch b/package/libssh/0003-more-strict-overflow-fixes.patch
deleted file mode 100644
index 6232ee77ea..0000000000
--- a/package/libssh/0003-more-strict-overflow-fixes.patch
+++ /dev/null
@@ -1,122 +0,0 @@
-From 7656b1be8dc5425d5af03ffa6af711599fc07e80 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Tue, 22 Jan 2019 08:16:50 +0200
-Subject: [PATCH] buffer: Convert argc to size_t in ssh_buffer_unpack() as well
-
-Commit c306a693f3fb ("buffer: Use size_t for argc argument in
-ssh_buffer_(un)pack()") mentioned unpack in the commit log, but it only
-touches the pack variants. Extend the conversion to unpack.
-
-Pre-initialize the p pointer to avoid possible use before
-initialization in case of early argc check failure.
-
-This fixes build failure:
-
-.../libssh-0.8.6/src/buffer.c: In function 'ssh_buffer_unpack_va':
-.../libssh-0.8.6/src/buffer.c:1229:16: error: assuming signed overflow does not occur when simplifying conditional to constant [-Werror=strict-overflow]
-             if (argc == -1){
-		^
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://www.libssh.org/archive/libssh/2019-01/0000032.html
-
- include/libssh/buffer.h |  4 ++--
- src/buffer.c            | 25 +++++++++++++------------
- 2 files changed, 15 insertions(+), 14 deletions(-)
-
-diff --git a/include/libssh/buffer.h b/include/libssh/buffer.h
-index 1c375343ee14..cd2dea6a7ecc 100644
---- a/include/libssh/buffer.h
-+++ b/include/libssh/buffer.h
-@@ -50,11 +50,11 @@ int _ssh_buffer_pack(struct ssh_buffer_struct *buffer,
-     _ssh_buffer_pack((buffer), (format), __VA_NARG__(__VA_ARGS__), __VA_ARGS__, SSH_BUFFER_PACK_END)
- 
- int ssh_buffer_unpack_va(struct ssh_buffer_struct *buffer,
--                         const char *format, int argc,
-+                         const char *format, size_t argc,
-                          va_list ap);
- int _ssh_buffer_unpack(struct ssh_buffer_struct *buffer,
-                        const char *format,
--                       int argc,
-+                       size_t argc,
-                        ...);
- #define ssh_buffer_unpack(buffer, format, ...) \
-     _ssh_buffer_unpack((buffer), (format), __VA_NARG__(__VA_ARGS__), __VA_ARGS__, SSH_BUFFER_PACK_END)
-diff --git a/src/buffer.c b/src/buffer.c
-index 99863747fc3c..c8ad20f24e43 100644
---- a/src/buffer.c
-+++ b/src/buffer.c
-@@ -1082,11 +1082,11 @@ int _ssh_buffer_pack(struct ssh_buffer_struct *buffer,
-  */
- int ssh_buffer_unpack_va(struct ssh_buffer_struct *buffer,
-                          const char *format,
--                         int argc,
-+                         size_t argc,
-                          va_list ap)
- {
-     int rc = SSH_ERROR;
--    const char *p, *last;
-+    const char *p = format, *last;
-     union {
-         uint8_t *byte;
-         uint16_t *word;
-@@ -1098,16 +1098,21 @@ int ssh_buffer_unpack_va(struct ssh_buffer_struct *buffer,
-     } o;
-     size_t len, rlen, max_len;
-     va_list ap_copy;
--    int count; /* int for size comparison with argc */
-+    size_t count;
- 
-     max_len = ssh_buffer_get_len(buffer);
- 
-     /* copy the argument list in case a rollback is needed */
-     va_copy(ap_copy, ap);
- 
--    for (p = format, count = 0; *p != '\0'; p++, count++) {
-+    if (argc > 256) {
-+        rc = SSH_ERROR;
-+        goto cleanup;
-+    }
-+
-+    for (count = 0; *p != '\0'; p++, count++) {
-         /* Invalid number of arguments passed */
--        if (argc != -1 && count > argc) {
-+        if (count > argc) {
-             rc = SSH_ERROR;
-             goto cleanup;
-         }
-@@ -1217,7 +1222,7 @@ int ssh_buffer_unpack_va(struct ssh_buffer_struct *buffer,
-         }
-     }
- 
--    if (argc != -1 && argc != count) {
-+    if (argc != count) {
-         rc = SSH_ERROR;
-     }
- 
-@@ -1226,11 +1231,7 @@ cleanup:
-         /* Check if our canary is intact, if not something really bad happened */
-         uint32_t canary = va_arg(ap, uint32_t);
-         if (canary != SSH_BUFFER_PACK_END){
--            if (argc == -1){
--                rc = SSH_ERROR;
--            } else {
--                abort();
--            }
-+            abort();
-         }
-     }
- 
-@@ -1320,7 +1321,7 @@ cleanup:
-  */
- int _ssh_buffer_unpack(struct ssh_buffer_struct *buffer,
-                        const char *format,
--                       int argc,
-+                       size_t argc,
-                        ...)
- {
-     va_list ap;
--- 
-2.20.1
-
diff --git a/package/libssh/libssh.hash b/package/libssh/libssh.hash
index 7164c91069..2f5708ddac 100644
--- a/package/libssh/libssh.hash
+++ b/package/libssh/libssh.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.libssh.org/files/0.8/libssh-0.8.7.tar.xz.asc
+# https://www.libssh.org/files/0.9/libssh-0.9.0.tar.xz.asc
 # with key 8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D
-sha256 43304ca22f0ba0b654e14b574a39816bc70212fdea5858a6637cc26cade3d592  libssh-0.8.7.tar.xz
+sha256 25303c2995e663cd169fdd902bae88106f48242d7e96311d74f812023482c7a5  libssh-0.9.0.tar.xz
 sha256 1656186e951db1c010a8485481fa94587f7e53a26d24976bef97945ad0c4df5a  COPYING
diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index 332f2a5700..d5f22c29a0 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSSH_VERSION_MAJOR = 0.8
-LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).7
+LIBSSH_VERSION_MAJOR = 0.9
+LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).0
 LIBSSH_SOURCE = libssh-$(LIBSSH_VERSION).tar.xz
 LIBSSH_SITE = https://www.libssh.org/files/$(LIBSSH_VERSION_MAJOR)
 LIBSSH_LICENSE = LGPL-2.1
