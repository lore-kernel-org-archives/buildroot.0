From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Oct 2016 13:12:11 -0300
Subject: [Buildroot] [PATCH] redis: bump to version 3.2.5
Message-ID: <1477671131-7056-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adjust default config patch to match new major version.
localhost binding is now default so drop it, 300s keepalive is now
default as well (instead of 60s from the previous patch and 0 by
default) - which sounds reasonable so keep it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...3-redis.conf-adjust-defauts-for-buildroot.patch | 29 +++++++++++++++++
 package/redis/0003-redis.conf-sane-defaults.patch  | 37 ----------------------
 package/redis/redis.hash                           |  4 +--
 package/redis/redis.mk                             |  2 +-
 4 files changed, 32 insertions(+), 40 deletions(-)
 create mode 100644 package/redis/0003-redis.conf-adjust-defauts-for-buildroot.patch
 delete mode 100644 package/redis/0003-redis.conf-sane-defaults.patch

diff --git a/package/redis/0003-redis.conf-adjust-defauts-for-buildroot.patch b/package/redis/0003-redis.conf-adjust-defauts-for-buildroot.patch
new file mode 100644
index 0000000..6ad81a4
--- /dev/null
+++ b/package/redis/0003-redis.conf-adjust-defauts-for-buildroot.patch
@@ -0,0 +1,29 @@
+From f79d1d1bf9e6f54b67e5482602084fbff7fd9cc9 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Fri, 28 Oct 2016 12:50:34 -0300
+Subject: [PATCH] redis.conf: adjust defauts for buildroot
+
+Based on Martin Bark's patch hence archlinux package.
+We just need to specify a proper db directory.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ redis.conf | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/redis.conf b/redis.conf
+index 22e00bc..3bb0430 100644
+--- a/redis.conf
++++ b/redis.conf
+@@ -244,7 +244,7 @@ dbfilename dump.rdb
+ # The Append Only File will also be created inside this directory.
+ #
+ # Note that you must specify a directory here, not a file name.
+-dir ./
++dir /var/lib/redis/
+ 
+ ################################# REPLICATION #################################
+ 
+-- 
+2.7.3
+
diff --git a/package/redis/0003-redis.conf-sane-defaults.patch b/package/redis/0003-redis.conf-sane-defaults.patch
deleted file mode 100644
index 6ee3f21..0000000
--- a/package/redis/0003-redis.conf-sane-defaults.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Taken from archlinux redis package
-See https://projects.archlinux.org/svntogit/community.git/tree/trunk/redis.conf-sane-defaults.patch?h=packages/redis&id=5b2491ea61b746f289acebd12bc66e337d7e5b88
-
-Signed-off-by: Martin Bark <martin@barkynet.com>
-
-=========================================================================
-diff --git a/redis.conf b/redis.conf
-index 6efb6ac..344e021 100644
---- a/redis.conf
-+++ b/redis.conf
-@@ -61,7 +61,7 @@ tcp-backlog 511
- # Examples:
- #
- # bind 192.168.1.100 10.0.0.1
--# bind 127.0.0.1
-+bind 127.0.0.1
- 
- # Specify the path for the Unix socket that will be used to listen for
- # incoming connections. There is no default, so Redis will not listen
-@@ -87,7 +87,7 @@ timeout 0
- # On other kernels the period depends on the kernel configuration.
- #
- # A reasonable value for this option is 60 seconds.
--tcp-keepalive 0
-+tcp-keepalive 60
- 
- # Specify the server verbosity level.
- # This can be one of:
-@@ -184,7 +184,7 @@ dbfilename dump.rdb
- # The Append Only File will also be created inside this directory.
- # 
- # Note that you must specify a directory here, not a file name.
--dir ./
-+dir /var/lib/redis/
- 
- ################################# REPLICATION #################################
- 
diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 07783f5..7e09db5 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,4 +1,4 @@
 # From https://github.com/antirez/redis-hashes/blob/master/README
-sha1	e56b4b7e033ae8dbf311f9191cf6fdf3ae974d1c 	redis-3.0.7.tar.gz
+sha1	6f6333db6111badaa74519d743589ac4635eba7a 	redis-3.2.5.tar.gz
 # Calculated based on the hash above
-sha256	b2a791c4ea3bb7268795c45c6321ea5abcc24457178373e6a6e3be6372737f23	redis-3.0.7.tar.gz
+sha256	8509ceb1efd849d6b2346a72a8e926b5a4f6ed3cc7c3cd8d9f36b2e9ba085315	redis-3.2.5.tar.gz
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index a9df6e7..3b70991 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 3.0.7
+REDIS_VERSION = 3.2.5
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3c (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-- 
2.7.3
