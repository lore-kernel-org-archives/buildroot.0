From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Dec 2014 23:12:55 +0100
Subject: [Buildroot] [git commit] util-linux: add an option to build host
	programs
Message-ID: <20141210221828.5C51A800F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2b18d093cd8a5baaf2e22ce13cc9e527c1937777
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thierry Bultel <tbultel@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/util-linux/util-linux.mk |   12 ++++++++++--
 1 files changed, 10 insertions(+), 2 deletions(-)

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
