From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Sep 2016 05:53:00 +0200
Subject: [Buildroot] [git commit] util-linux: enable libmount for host
	variant
Message-ID: <20160921035328.E58AC81EF5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2c83114ffecf311f8e523255320365a1eb0850db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's a necessary dependency to build the new host-libglib2.
libblkd is an indirect dependency for libmount.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
