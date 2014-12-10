From: Thierry Bultel <tbultel@free.fr>
Date: Wed, 10 Dec 2014 22:02:01 +0100
Subject: [Buildroot] [PATCH v2] util-linux: add an option to build host
	programs
Message-ID: <1418245321-6043-1-git-send-email-tbultel@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thierry Bultel <tbultel@free.fr>

---
Changes v1 -> v2
  - use the existing BR2_PACKAGE_HOST_UTIL_LINUX (suggested by Yann E. MORIN)
---
 package/util-linux/util-linux.mk | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index dc10193..e06fa9a 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -91,11 +91,19 @@ UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_WRITE),--enable-write,--disable-write)
 
 # In the host version of util-linux, we so far only require libuuid,
-# and none of the util-linux utilities, so we disable all of them.
+# and none of the util-linux utilities, so we disable all of them, unless
+# BR2_PACKAGE_HOST_UTIL_LINUX is set
+
 HOST_UTIL_LINUX_CONF_OPTS += \
 	--enable-libuuid \
 	--disable-libblkid --disable-libmount \
-	--disable-all-programs --without-ncurses
+	--without-ncurses
+
+ifeq ($(BR2_PACKAGE_HOST_UTIL_LINUX),y)
+HOST_UTIL_LINUX_CONF_OPTS += --disable-makeinstall-chown
+else
+HOST_UTIL_LINUX_CONF_OPTS += --disable-all-programs
+endif
 
 # Avoid building the tools if they are disabled since we can't install on
 # a per-directory basis.
-- 
1.9.1
