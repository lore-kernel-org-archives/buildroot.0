From: Peter Seiderer <ps.report@gmx.net>
Date: Sun,  8 Mar 2020 17:51:49 +0100
Subject: [Buildroot] [PATCH v1] package/ser2net: fix gensio detection with
 openssl enabled
Message-ID: <20200308165149.31293-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add openssl linker flags via LIBS to fix configure gensio
library detection.

Fixes:

  http://autobuild.buildroot.net/results/66e0d3e0a2a8dc5a62c267d16a53216f0f2ce8dd

  checking gensio/gensio.h usability... yes
  checking gensio/gensio.h presence... yes
  checking for gensio/gensio.h... yes
  checking for str_to_gensio in -lgensio... no
  configure: error: libgensio won't link, please install gensio dev package

The build/ser2net-4.1.1/config.log files states:

  .../arm-buildroot-linux-uclibcgnueabi/bin/ld: .../host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgensio.a(gensio_filter_ssl.o): in function `gensio_do_ssl_init':
  gensio_filter_ssl.c:(.text+0x34): undefined reference to `OPENSSL_init_ssl'

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/ser2net/ser2net.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index 2ea68ccc43..94035b2184 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -16,6 +16,11 @@ else
 SER2NET_CONF_OPTS += --without-pthreads
 endif
 
+# fix gensio detection with openssl enabled
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+SER2NET_CONF_ENV += LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs openssl`"
+endif
+
 define SER2NET_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 755 package/ser2net/S50ser2net \
 		$(TARGET_DIR)/etc/init.d/S50ser2net
-- 
2.25.1
