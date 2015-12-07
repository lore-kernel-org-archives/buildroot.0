From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 7 Dec 2015 08:34:17 +0100
Subject: [Buildroot] [git commit] gcc: host-cloog is not needed for graphite
	support on gcc 5.x
Message-ID: <20151207073617.26D137FA81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a4a1c47f289ef2d8e3a888f65a617444dccd8baa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See https://gcc.gnu.org/gcc-5/changes.html

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/gcc.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index b9551e8..07883d0 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -170,8 +170,14 @@ HOST_GCC_COMMON_CONF_OPTS += --with-mpc=$(HOST_DIR)/usr
 endif
 
 ifeq ($(BR2_GCC_ENABLE_GRAPHITE),y)
-HOST_GCC_COMMON_DEPENDENCIES += host-isl host-cloog
-HOST_GCC_COMMON_CONF_OPTS += --with-isl=$(HOST_DIR)/usr --with-cloog=$(HOST_DIR)/usr
+HOST_GCC_COMMON_DEPENDENCIES += host-isl
+HOST_GCC_COMMON_CONF_OPTS += --with-isl=$(HOST_DIR)/usr
+# gcc 5 doesn't need cloog any more, see
+# https://gcc.gnu.org/gcc-5/changes.html
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_5),)
+HOST_GCC_COMMON_DEPENDENCIES += host-cloog
+HOST_GCC_COMMON_CONF_OPTS += --with-cloog=$(HOST_DIR)/usr
+endif
 else
 HOST_GCC_COMMON_CONF_OPTS += --without-isl --without-cloog
 endif
