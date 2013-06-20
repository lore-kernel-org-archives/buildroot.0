From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 20 Jun 2013 17:08:18 +0200
Subject: [Buildroot] [git commit] wvstreams: Pass -fPIC to CFLAGS when
	building PIC objects
Message-ID: <20130620151029.15F8F9AF7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=31d72937cf17e9e476e956986030e93f8fd2ce56
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The argp bundled dependency which is linked to the libwvutils.so
shared library, wasn't built with -fPIC.
MIPS will refuce to link a non-PIC library with a shared one.

We fix this problem by appending -fPIC to CFLAGS and build all the
shared objects with -fPIC.

[Peter: use +=]
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/wvstreams/wvstreams.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/wvstreams/wvstreams.mk b/package/wvstreams/wvstreams.mk
index 65f48d4..b4f7d89 100644
--- a/package/wvstreams/wvstreams.mk
+++ b/package/wvstreams/wvstreams.mk
@@ -27,6 +27,10 @@ WVSTREAMS_CONF_OPT += \
 # needed for openssl detection when statically linking (as ssl needs lz)
 WVSTREAMS_CONF_ENV += LIBS=-lz
 
+ifneq ($(BR2_PREFER_STATIC_LIB),y)
+	WVSTREAMS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -fPIC"
+endif
+
 ifeq ($(BR2_PACKAGE_DBUS),y)
 	WVSTREAMS_DEPENDENCIES += dbus
 	WVSTREAMS_CONF_OPT += --with-dbus
