From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 19 May 2018 20:58:26 +0200
Subject: [Buildroot] [PATCH v4 for-next 1/2] package/exim: remove libnsl
 linking
Message-ID: <20180519185827.23898-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

glibc now considers its built-in libnsl as being obsolete, and requires
passing --enable-obsolete-libnsl to have it built and installed. libnsl
is now provided as a separate project [1], but it isn't packaged yet in
Buildroot.

In preparation for dropping --enable-obsolete-libnsl from the glibc
package, this commit ensures that exim doesn't use libnsl. It was
already the case for uclibc and musl toolchains, so this commit simply
extends that to make sure libnsl is also not used with glibc toolchains.

Only Exim's nis.so and nisplus.so lookup modules require libnsl,
but they are not build by default. So we can safely remove -lnsl
from the Makefile-Linux. If someone want these modules, a new libnsl
package must be added first to provide nsl library.

Since we remove -lnsl unconditionally, use a patch instead of a sed command.

[1] https://github.com/thkukuk/libnsl.git
[2] https://fedoraproject.org/wiki/Changes/NISIPv6

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Baruch Siach <baruch@tkos.co.il>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
---
v4: remove -lnsl by a patch instread of a sed (Baruch).
v3: Also comment the buildconfig build issue on the host with Fedora 28 (Luca)
    Add a comment about this issue in exim.mk
---
 package/exim/0006-remove-libnsl.patch | 37 +++++++++++++++++++++++++++++++++++
 package/exim/exim.mk                  |  9 ---------
 2 files changed, 37 insertions(+), 9 deletions(-)
 create mode 100644 package/exim/0006-remove-libnsl.patch

diff --git a/package/exim/0006-remove-libnsl.patch b/package/exim/0006-remove-libnsl.patch
new file mode 100644
index 0000000000..8ca53c9acb
--- /dev/null
+++ b/package/exim/0006-remove-libnsl.patch
@@ -0,0 +1,37 @@
+From b722f8fc01f6b1d71c98c0c66f759935b0dac136 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sat, 19 May 2018 20:36:41 +0200
+Subject: [PATCH] remove libnsl
+
+glibc now considers its built-in libnsl as being obsolete, and requires
+passing --enable-obsolete-libnsl to have it built and installed. libnsl
+is now provided as a separate project [1], but it isn't packaged yet in
+Buildroot.
+
+Exim's nis.so and nisplus.so lookup modules require libnsl,
+but they are not build by default. So we can safely remove -lnsl
+from the Makefile-Linux.
+
+[1] https://github.com/thkukuk/libnsl.git
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ OS/Makefile-Linux | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/OS/Makefile-Linux b/OS/Makefile-Linux
+index 990f884..ea5644b 100644
+--- a/OS/Makefile-Linux
++++ b/OS/Makefile-Linux
+@@ -19,7 +19,7 @@ CFLAGS_DYNAMIC ?= -shared -rdynamic
+ DBMLIB = -ldb
+ USE_DB = yes
+ 
+-LIBS = -lnsl -lcrypt -lm
++LIBS = -lcrypt -lm
+ LIBRESOLV = -lresolv
+ 
+ X11=/usr/X11R6
+-- 
+2.14.3
+
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 37eab501a4..bde2df1153 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -72,14 +72,6 @@ define EXIM_USE_DEFAULT_CONFIG_FILE_OPENSSL
 endef
 endif
 
-# only glibc provides libnsl, remove -lnsl for all other toolchains
-# http://bugs.exim.org/show_bug.cgi?id=1564
-ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
-define EXIM_REMOVE_LIBNSL_FROM_MAKEFILE
-	$(SED) 's/-lnsl//g' $(@D)/OS/Makefile-Linux
-endef
-endif
-
 # musl does not provide struct ip_options nor struct ip_opts (but it is
 # available with both glibc and uClibc)
 ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
@@ -96,7 +88,6 @@ define EXIM_CONFIGURE_TOOLCHAIN
 	$(call exim-config-add,RANLIB,$(TARGET_RANLIB))
 	$(call exim-config-add,HOSTCC,$(HOSTCC))
 	$(call exim-config-add,HOSTCFLAGS,$(HOSTCFLAGS))
-	$(EXIM_REMOVE_LIBNSL_FROM_MAKEFILE)
 	$(EXIM_FIX_IP_OPTIONS_FOR_MUSL)
 endef
 
-- 
2.14.3
