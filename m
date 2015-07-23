From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Jul 2015 23:15:43 +0200
Subject: [Buildroot] [git commit] package/redis: Install /etc/redis.conf to
	target
Message-ID: <20150723213351.B20217F97A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a26dd768366452283f749a2f1560b3be3b525dcb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Copy redis.conf from the redis release package but adjust some values to
sensible defaults using 0003-redis.conf-sane-defaults.patch

The file 0003-redis.conf-sane-defaults.patch originates from the redis
package in Arch Linux.

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/redis/0003-redis.conf-sane-defaults.patch |   37 +++++++++++++++++++++
 package/redis/redis.mk                            |    2 +
 2 files changed, 39 insertions(+), 0 deletions(-)

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
index 0135cf9..04c2d6a 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -26,6 +26,8 @@ endef
 define REDIS_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(REDIS_BUILDOPTS) -C $(@D) \
 		LDCONFIG=true install
+	$(INSTALL) -D -m 0644 $(@D)/redis.conf \
+		$(TARGET_DIR)/etc/redis.conf
 endef
 
 $(eval $(generic-package))
