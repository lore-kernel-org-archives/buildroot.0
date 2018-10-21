From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Oct 2018 16:26:54 +0200
Subject: [Buildroot] [git commit] package/gcc: introduce
 BR2_GCC_SUPPORTS_LIBCILKRTS
Message-ID: <20181021142523.3631B882B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6300de5464989f2dd07ee86a3589cd05e5184bb0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libcilkrts was introduced in gcc 4.9, and removed in gcc
8.x. Therefore, it does not make sense to pass --disable-libcilkrts in
gcc 8.x and higher. This commit introduces BR2_GCC_SUPPORTS_LIBCILKRTS
that allows the makefile code to know if the selected gcc version
supports libcilkrts or not.

This new option mainly allows to annotate the fact that libcilkrts
exists in gcc [4.9, 7] and that once we have dropped support for those
gcc versions, the libcilkrts related logic can be removed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/Config.in.host         |  6 ++++++
 package/gcc/gcc-final/gcc-final.mk | 12 ++++++++++--
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 5a8f684a4c..3bf87fe597 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -76,6 +76,12 @@ config BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
 	bool
 	default y
 
+# libcilkrts was introduced in gcc 4.9 (oldest gcc version we
+# support), and removed in gcc 8.x
+config BR2_GCC_SUPPORTS_LIBCILKRTS
+	bool
+	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8
+
 config BR2_GCC_VERSION
 	string
 	default "4.9.4"     if BR2_GCC_VERSION_4_9_X
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 1be0b9bfc9..cbde56ce1c 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -76,6 +76,8 @@ HOST_GCC_FINAL_CONF_OPTS += "--with-multilib-list=m4a,m4a-nofpu"
 HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/$(GNU_TARGET_NAME)/lib/!m4*
 endif
 
+ifeq ($(BR2_GCC_SUPPORTS_LIBCILKRTS),y)
+
 # libcilkrts does not support v8
 ifeq ($(BR2_sparc),y)
 HOST_GCC_FINAL_CONF_OPTS += --disable-libcilkrts
@@ -86,10 +88,16 @@ ifeq ($(BR2_PTHREADS_NONE),y)
 HOST_GCC_FINAL_CONF_OPTS += --disable-libcilkrts
 endif
 
+ifeq ($(BR2_STATIC_LIBS),y)
+# disable libcilkrts as there is no static version
+HOST_GCC_FINAL_CONF_OPTS += --disable-libcilkrts
+endif
+
+endif # BR2_GCC_SUPPORTS_LIBCILKRTS
+
 # Disable shared libs like libstdc++ if we do static since it confuses linking
-# In that case also disable libcilkrts as there is no static version
 ifeq ($(BR2_STATIC_LIBS),y)
-HOST_GCC_FINAL_CONF_OPTS += --disable-shared --disable-libcilkrts
+HOST_GCC_FINAL_CONF_OPTS += --disable-shared
 else
 HOST_GCC_FINAL_CONF_OPTS += --enable-shared
 endif
