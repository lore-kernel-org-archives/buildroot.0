From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 20 Sep 2016 17:27:43 -0300
Subject: [Buildroot] [PATCH 1/2] util-linux: enable libmount for host variant
Message-ID: <1474403264-16066-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's a necessary dependency to build the new host-libglib2.
libblkd is an indirect dependency for libmount.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/util-linux/util-linux.mk | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 82a726e..f648155 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -117,13 +117,14 @@ UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_WRITE),--enable-write,--disable-write) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_ZRAMCTL),--enable-zramctl,--disable-zramctl)
 
-# In the host version of util-linux, we so far only require libuuid,
-# and none of the util-linux utilities, so we disable all of them, unless
-# BR2_PACKAGE_HOST_UTIL_LINUX is set
+# In the host version of util-linux, we only require libuuid and
+# libmount (plus libblkid as an indirect dependency of libmount).
+# So disable all of the programs, unless BR2_PACKAGE_HOST_UTIL_LINUX is set
 
 HOST_UTIL_LINUX_CONF_OPTS += \
+	--enable-libblkid \
+	--enable-libmount \
 	--enable-libuuid \
-	--disable-libblkid --disable-libmount \
 	--without-ncurses
 
 ifeq ($(BR2_PACKAGE_HOST_UTIL_LINUX),y)
-- 
2.7.3
