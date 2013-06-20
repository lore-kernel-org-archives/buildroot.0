From: Markos Chandras <markos.chandras@gmail.com>
Date: Thu, 20 Jun 2013 15:14:10 +0100
Subject: [Buildroot] [PATCH v2] wvstreams: Pass -fPIC to CFLAGS when
	building PIC objects
Message-ID: <1371737650-12310-1-git-send-email-markos.chandras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Markos Chandras <markos.chandras@imgtec.com>

The argp bundled dependency which is linked to the libwvutils.so
shared library, wasn't built with -fPIC.
MIPS will refuce to link a non-PIC library with a shared one.

We fix this problem by appending -fPIC to CFLAGS and build all the
shared objects with -fPIC.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 package/wvstreams/wvstreams.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/wvstreams/wvstreams.mk b/package/wvstreams/wvstreams.mk
index 65f48d4..fddaad7 100644
--- a/package/wvstreams/wvstreams.mk
+++ b/package/wvstreams/wvstreams.mk
@@ -27,6 +27,10 @@ WVSTREAMS_CONF_OPT += \
 # needed for openssl detection when statically linking (as ssl needs lz)
 WVSTREAMS_CONF_ENV += LIBS=-lz
 
+ifneq ($(BR2_PREFER_STATIC_LIB),y)
+	WVSTREAMS_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -fPIC"
+endif
+
 ifeq ($(BR2_PACKAGE_DBUS),y)
 	WVSTREAMS_DEPENDENCIES += dbus
 	WVSTREAMS_CONF_OPT += --with-dbus
-- 
1.8.2.1
