From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 May 2017 10:39:44 +0200
Subject: [Buildroot] [git commit] package/libpng: cleanup NEON support
	options
Message-ID: <20170501084017.C74BA82747@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=765f241063939c14bc3a18777b7a79fcd44a37f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Suggested by Thomas:
http://lists.busybox.net/pipermail/buildroot/2017-April/189086.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libpng/libpng.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 2491157..7ae1dd5 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -14,7 +14,12 @@ LIBPNG_INSTALL_STAGING = YES
 LIBPNG_DEPENDENCIES = host-pkgconf zlib
 HOST_LIBPNG_DEPENDENCIES = host-pkgconf host-zlib
 LIBPNG_CONFIG_SCRIPTS = libpng$(LIBPNG_SERIES)-config libpng-config
-LIBPNG_CONF_OPTS = $(if $(BR2_ARM_CPU_HAS_NEON),--enable-arm-neon=yes,--enable-arm-neon=no)
+
+ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
+LIBPNG_CONF_OPTS += --enable-arm-neon
+else
+LIBPNG_CONF_OPTS += --disable-arm-neon
+endif
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
