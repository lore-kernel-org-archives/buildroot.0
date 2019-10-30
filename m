From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 30 Oct 2019 07:53:03 +0100
Subject: [Buildroot] [PATCH 2/2] package/libv4l: link with libatomic when
 needed
In-Reply-To: <20191030065303.22948-1-bernd.kuhls@t-online.de>
References: <20191030065303.22948-1-bernd.kuhls@t-online.de>
Message-ID: <20191030065303.22948-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On some architectures, atomic operations are provided by the libatomic
library from gcc. Linking with libatomic is therefore necessary,
otherwise the build fails with:

/home/buildroot/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/7.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld:
 qv4l2-qv4l2.o: undefined reference to symbol '__atomic_fetch_add_4@@LIBATOMIC_1.0'

This is often for example the case on sparcv8 32 bit.

Fixes:
http://autobuild.buildroot.net/results/089/08952dbf89bf3c49da7697943441cee411940420/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libv4l/libv4l.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index a3bf099221..3c58f98391 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -84,6 +84,11 @@ ifeq ($(BR2_PACKAGE_SDL2_IMAGE),y)
 LIBV4L_DEPENDENCIES += sdl2_image
 endif
 
+# Uses __atomic_fetch_add_4
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+LIBV4L_LIBS += -latomic
+endif
+
 LIBV4L_CONF_ENV += LIBS="$(LIBV4L_LIBS)"
 
 $(eval $(autotools-package))
-- 
2.20.1
