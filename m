From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 19 Mar 2019 11:31:49 -0400
Subject: [Buildroot] [PATCH 1/1] package/libglib2: check for selinux
Message-ID: <20190319153149.84900-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

If libselinux is selected, explicitly set --enable-selinux in the configure
options and build the library first.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/libglib2/libglib2.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index d34bfabd52..63bfec32d6 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -137,6 +137,13 @@ LIBGLIB2_CONF_OPTS += --with-libiconv=gnu
 LIBGLIB2_DEPENDENCIES += libiconv
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+LIBGLIB2_CONF_OPTS += --enable-selinux
+LIBGLIB2_DEPENDENCIES += libselinux
+else
+LIBGLIB2_CONF_OPTS += --disable-selinux
+endif
+
 # Purge gdb-related files
 ifneq ($(BR2_PACKAGE_GDB),y)
 define LIBGLIB2_REMOVE_GDB_FILES
-- 
2.20.1
