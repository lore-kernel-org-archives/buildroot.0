From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Oct 2015 16:25:41 +0200
Subject: [Buildroot] [git commit] package/rtmpdump: Fix makefile when GnuTLS
	is used
Message-ID: <20151017142545.1C42D81D81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c71a72646ce70871988c703987dceaf6edf040e5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In librtmp/Makefile the variable CRYPTO defaults to OpenSSL. When
building with GnuTLS support instead, librtmp.pc includes wrong
libraries:

$ grep Req output/staging/usr/lib/pkgconfig/librtmp.pc
Requires: libssl,libcrypto

using this defconfig

BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_PACKAGE_GNUTLS=y
BR2_PACKAGE_RTMPDUMP=y

Pass RTMPDUMP_CRYPTO also to INSTALL_*_CMDS to fix this problem.
Patch supposed by Thomas:
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/129525

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rtmpdump/rtmpdump.mk |   13 ++++++++-----
 1 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/rtmpdump/rtmpdump.mk b/package/rtmpdump/rtmpdump.mk
index 6e0685e..ad4308c 100644
--- a/package/rtmpdump/rtmpdump.mk
+++ b/package/rtmpdump/rtmpdump.mk
@@ -32,22 +32,25 @@ else
 RTMPDUMP_SHARED = "SHARED="
 endif
 
+RTMPDUMP_MAKE_FLAGS = \
+	CRYPTO=$(RTMPDUMP_CRYPTO) \
+	prefix=/usr \
+	$(RTMPDUMP_SHARED)
+
 define RTMPDUMP_BUILD_CMDS
-	$(MAKE) CRYPTO=$(RTMPDUMP_CRYPTO) \
-		prefix=/usr \
+	$(MAKE) $(RTMPDUMP_MAKE_FLAGS) \
 		XCFLAGS="$(RTMPDUMP_CFLAGS)" \
 		XLDFLAGS="$(TARGET_LDFLAGS)" \
 		CROSS_COMPILE="$(TARGET_CROSS)" \
-		$(RTMPDUMP_SHARED) \
 		-C $(@D)/librtmp
 endef
 
 define RTMPDUMP_INSTALL_STAGING_CMDS
-	$(MAKE) prefix=/usr -C $(@D)/librtmp install DESTDIR=$(STAGING_DIR) $(RTMPDUMP_SHARED)
+	$(MAKE) -C $(@D)/librtmp install DESTDIR=$(STAGING_DIR) $(RTMPDUMP_MAKE_FLAGS)
 endef
 
 define RTMPDUMP_INSTALL_TARGET_CMDS
-	$(MAKE) prefix=/usr -C $(@D)/librtmp install DESTDIR=$(TARGET_DIR) $(RTMPDUMP_SHARED)
+	$(MAKE) -C $(@D)/librtmp install DESTDIR=$(TARGET_DIR) $(RTMPDUMP_MAKE_FLAGS)
 endef
 
 $(eval $(generic-package))
