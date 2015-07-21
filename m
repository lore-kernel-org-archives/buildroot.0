From: Martin Bark <martin@barkynet.com>
Date: Tue, 21 Jul 2015 14:02:52 +0100
Subject: [Buildroot] [PATCH 3/5] package/redis: Install /etc/redis.conf to
	target
In-Reply-To: <1437483774-30291-1-git-send-email-martin@barkynet.com>
References: <1437483774-30291-1-git-send-email-martin@barkynet.com>
Message-ID: <1437483774-30291-3-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Copy redis.conf from the redis release package but adjust some values to
sensible defaults using 0003-redis.conf-sane-defaults.patch

The file 0003-redis.conf-sane-defaults.patch originates from the redis
package in Arch Linux.

Signed-off-by: Martin Bark <martin@barkynet.com>

---
0003-redis.conf-sane-defaults.patch is a copy of the file
redis.conf-sane-defaults.patch from the Arch Linux redis package.  See
https://projects.archlinux.org/svntogit/community.git/tree/trunk/redis.conf-sane-defaults.patch?h=packages/redis&id=b4907d2344855caeadf6c69bc01c403a95f8a4f3

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/redis/0003-redis.conf-sane-defaults.patch | 37 +++++++++++++++++++++++
 package/redis/redis.mk                            |  2 ++
 2 files changed, 39 insertions(+)
 create mode 100644 package/redis/0003-redis.conf-sane-defaults.patch

diff --git a/package/redis/0003-redis.conf-sane-defaults.patch b/package/redis/0003-redis.conf-sane-defaults.patch
new file mode 100644
index 0000000..6ee3f21
--- /dev/null
+++ b/package/redis/0003-redis.conf-sane-defaults.patch
@@ -0,0 +1,37 @@
+Taken from archlinux redis package
+See https://projects.archlinux.org/svntogit/community.git/tree/trunk/redis.conf-sane-defaults.patch?h=packages/redis&id=5b2491ea61b746f289acebd12bc66e337d7e5b88
+
+Signed-off-by: Martin Bark <martin@barkynet.com>
+
+=========================================================================
+diff --git a/redis.conf b/redis.conf
+index 6efb6ac..344e021 100644
+--- a/redis.conf
++++ b/redis.conf
+@@ -61,7 +61,7 @@ tcp-backlog 511
+ # Examples:
+ #
+ # bind 192.168.1.100 10.0.0.1
+-# bind 127.0.0.1
++bind 127.0.0.1
+ 
+ # Specify the path for the Unix socket that will be used to listen for
+ # incoming connections. There is no default, so Redis will not listen
+@@ -87,7 +87,7 @@ timeout 0
+ # On other kernels the period depends on the kernel configuration.
+ #
+ # A reasonable value for this option is 60 seconds.
+-tcp-keepalive 0
++tcp-keepalive 60
+ 
+ # Specify the server verbosity level.
+ # This can be one of:
+@@ -184,7 +184,7 @@ dbfilename dump.rdb
+ # The Append Only File will also be created inside this directory.
+ # 
+ # Note that you must specify a directory here, not a file name.
+-dir ./
++dir /var/lib/redis/
+ 
+ ################################# REPLICATION #################################
+ 
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 633d411..aa985b6 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -27,6 +27,8 @@ define REDIS_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(REDIS_BUILDOPTS) -C $(@D) \
 		LDCONFIG=true install
 	$(INSTALL) -d -m 0700 $(TARGET_DIR)/var/lib/redis
+	$(INSTALL) -D -m 0644 $(@D)/redis.conf \
+		$(TARGET_DIR)/etc/redis.conf
 endef
 
 $(eval $(generic-package))
-- 
2.1.4
