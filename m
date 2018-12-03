From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@collabora.com>
Date: Mon,  3 Dec 2018 18:51:18 -0500
Subject: [Buildroot] [PATCH] libglib2: fix configure issue without libmount
Message-ID: <20181203235118.7846-1-gael.portay@collabora.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following configure error happens when the util-linux dependency
does not install libmount:

	(...)
	checking for LIBMOUNT... no
	configure: error: *** Could not find libmount
	make[1]: *** [package/pkg-generic.mk:222: /home/gportay/src/buildroot/output-rpi3-64-drm-kms/build/libglib2-2.56.1/.stamp_configured] Error 1
	make: *** [Makefile:84: _all] Error 2

If no enable/disable option is given through to configure, glib2 checks
for the libmount package (linux only) and fails if is not present[1].

To fix this configure issue, this path explicits the option at configure
to make sure to disable libmount if is is not installed.

[1]: https://github.com/GNOME/glib/blob/glib-2-56/configure.ac#L1856

Signed-off-by: Ga?l PORTAY <gael.portay@collabora.com>
---
 package/libglib2/libglib2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 67db5ac359..16252c0ecb 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -114,6 +114,7 @@ HOST_LIBGLIB2_DEPENDENCIES = \
 
 LIBGLIB2_CONF_OPTS = \
 	--with-pcre=system \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),--enable-libmount,--disable-libmount) \
 	--disable-compile-warnings
 
 ifneq ($(BR2_ENABLE_LOCALE),y)
-- 
2.19.2
