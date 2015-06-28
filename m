From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 28 Jun 2015 21:42:35 +0200
Subject: [Buildroot] [RFC v4 01/16] packages: use TARGET_MAKE_ENV to add pps
	support
In-Reply-To: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
References: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1435520570-20332-2-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In the TARGET_MAKE_ENV variable will be added the GCC_SYSROOT variable
that is needed for per-package staging feature.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/blktrace/blktrace.mk                     | 2 +-
 package/boost/boost.mk                           | 2 +-
 package/botan/botan.mk                           | 2 +-
 package/bsdiff/bsdiff.mk                         | 4 ++--
 package/dhcpdump/dhcpdump.mk                     | 3 ++-
 package/dtc/dtc.mk                               | 3 ++-
 package/exim/exim.mk                             | 5 +++--
 package/feh/feh.mk                               | 4 ++--
 package/gadgetfs-test/gadgetfs-test.mk           | 2 +-
 package/iodine/iodine.mk                         | 2 +-
 package/iw/iw.mk                                 | 2 +-
 package/jack2/jack2.mk                           | 3 ++-
 package/libnss/libnss.mk                         | 4 ++--
 package/lmbench/lmbench.mk                       | 4 +++-
 package/lua-msgpack-native/lua-msgpack-native.mk | 3 ++-
 package/moarvm/moarvm.mk                         | 2 +-
 package/mongoose/mongoose.mk                     | 8 +++++---
 package/mplayer/mplayer.mk                       | 2 +-
 package/ncurses/ncurses.mk                       | 4 ++--
 package/nginx/nginx.mk                           | 1 +
 package/open2300/open2300.mk                     | 2 +-
 package/openssl/openssl.mk                       | 2 +-
 package/opentyrian/opentyrian.mk                 | 2 +-
 package/pax-utils/pax-utils.mk                   | 3 ++-
 package/pifmrds/pifmrds.mk                       | 3 ++-
 package/poco/poco.mk                             | 3 ++-
 package/pppd/pppd.mk                             | 2 +-
 package/qt/qt.mk                                 | 2 ++
 package/qtuio/qtuio.mk                           | 3 ++-
 package/rtmpdump/rtmpdump.mk                     | 2 +-
 package/speex/speex.mk                           | 3 ++-
 package/statserial/statserial.mk                 | 3 ++-
 package/ti-utils/ti-utils.mk                     | 2 +-
 package/tvheadend/tvheadend.mk                   | 4 ++--
 package/ushare/ushare.mk                         | 3 ++-
 package/vsftpd/vsftpd.mk                         | 2 +-
 36 files changed, 61 insertions(+), 42 deletions(-)

diff --git a/package/blktrace/blktrace.mk b/package/blktrace/blktrace.mk
index c193375..8d5e52b 100644
--- a/package/blktrace/blktrace.mk
+++ b/package/blktrace/blktrace.mk
@@ -11,7 +11,7 @@ BLKTRACE_LICENSE = GPLv2+
 BLKTRACE_LICENSE_FILES = COPYING
 
 define BLKTRACE_BUILD_CMDS
-	$(MAKE1) -C $(@D) $(TARGET_CONFIGURE_OPTS)
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) $(TARGET_CONFIGURE_OPTS)
 endef
 
 define BLKTRACE_INSTALL_TARGET_CMDS
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index dbb5de5..24f46e2 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -148,7 +148,7 @@ define HOST_BOOST_INSTALL_CMDS
 endef
 
 define BOOST_INSTALL_STAGING_CMDS
-	(cd $(@D) && ./bjam -j$(PARALLEL_JOBS) -q -d+1 \
+	(cd $(@D) && $(TARGET_MAKE_ENV) ./bjam -j$(PARALLEL_JOBS) -q -d+1 \
 	--user-config=$(@D)/user-config.jam \
 	$(BOOST_OPTS) \
 	--prefix=$(STAGING_DIR)/usr \
diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 6ac3ce7..58456fb 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -48,7 +48,7 @@ define BOTAN_CONFIGURE_CMDS
 endef
 
 define BOTAN_BUILD_CMDS
-	$(MAKE) -C $(@D) AR="$(TARGET_AR) crs"
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) AR="$(TARGET_AR) crs"
 endef
 
 define BOTAN_INSTALL_STAGING_CMDS
diff --git a/package/bsdiff/bsdiff.mk b/package/bsdiff/bsdiff.mk
index 7d2b296..eb903e0 100644
--- a/package/bsdiff/bsdiff.mk
+++ b/package/bsdiff/bsdiff.mk
@@ -11,9 +11,9 @@ BSDIFF_LICENSE = BSD-2c
 BSDIFF_LICENSE_FILES = bsdiff.c
 
 define BSDIFF_BUILD_CMDS
-	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
+	$(TARGET_MAKE_ENV) $(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
 		$(@D)/bsdiff.c -lbz2 -o $(@D)/bsdiff
-	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
+	$(TARGET_MAKE_ENV) $(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
 		$(@D)/bspatch.c -lbz2 -o $(@D)/bspatch
 endef
 
diff --git a/package/dhcpdump/dhcpdump.mk b/package/dhcpdump/dhcpdump.mk
index 0756319..8df5135 100644
--- a/package/dhcpdump/dhcpdump.mk
+++ b/package/dhcpdump/dhcpdump.mk
@@ -16,7 +16,8 @@ DHCPDUMP_LIBS += $(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additiona
 endif
 
 define DHCPDUMP_BUILD_CMDS
-	$(MAKE) -C $(@D) CC="$(TARGET_CC) $(TARGET_CFLAGS)" LIBS="$(DHCPDUMP_LIBS)"
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		CC="$(TARGET_CC) $(TARGET_CFLAGS)" LIBS="$(DHCPDUMP_LIBS)"
 endef
 
 define DHCPDUMP_INSTALL_TARGET_CMDS
diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index e094f7b..0800fb0 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -41,7 +41,8 @@ define DTC_INSTALL_STAGING_CMDS
 endef
 
 define DTC_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) PREFIX=/usr $(DTC_INSTALL_GOAL)
+	$(TARGET_MAKE_ENV) $(MAKE) \
+		-C $(@D) DESTDIR=$(TARGET_DIR) PREFIX=/usr $(DTC_INSTALL_GOAL)
 endef
 
 $(eval $(generic-package))
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index b852793..4f75e9a 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -111,8 +111,9 @@ endef
 # Need to replicate the LFLAGS in install, as exim still wants to build
 # something when installing...
 define EXIM_INSTALL_TARGET_CMDS
-	DESTDIR=$(TARGET_DIR) INSTALL_ARG="-no_chown -no_symlink" build=br \
-	  $(MAKE1) -C $(@D) $(EXIM_STATIC_FLAGS) install
+	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) \
+		INSTALL_ARG="-no_chown -no_symlink" build=br \
+		$(MAKE1) -C $(@D) $(EXIM_STATIC_FLAGS) install
 	chmod u+s $(TARGET_DIR)/usr/sbin/exim
 endef
 
diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index 0c4c164..27ac53b 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -12,8 +12,8 @@ FEH_LICENSE = MIT
 FEH_LICENSE_FILES = COPYING
 
 define FEH_BUILD_CMDS
-	$(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
-		-C $(@D) all
+	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) \
+		$(TARGET_LDFLAGS)" -C $(@D) all
 endef
 
 define FEH_INSTALL_TARGET_CMDS
diff --git a/package/gadgetfs-test/gadgetfs-test.mk b/package/gadgetfs-test/gadgetfs-test.mk
index 655f50a..bdeaede 100644
--- a/package/gadgetfs-test/gadgetfs-test.mk
+++ b/package/gadgetfs-test/gadgetfs-test.mk
@@ -15,7 +15,7 @@ GADGETFS_TEST_MAKEOPTS += USE_AIO=y
 endif
 
 define GADGETFS_TEST_BUILD_CMDS
-	$(MAKE) -C $(@D) $(GADGETFS_TEST_MAKEOPTS)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(GADGETFS_TEST_MAKEOPTS)
 endef
 
 define GADGETFS_TEST_INSTALL_TARGET_CMDS
diff --git a/package/iodine/iodine.mk b/package/iodine/iodine.mk
index 57deb9e..c3df831 100644
--- a/package/iodine/iodine.mk
+++ b/package/iodine/iodine.mk
@@ -11,7 +11,7 @@ IODINE_LICENSE = MIT
 IODINE_LICENSE_FILES = README
 
 define IODINE_BUILD_CMDS
-	$(MAKE) CC="$(TARGET_CC)" ARCH=$(BR2_ARCH) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" ARCH=$(BR2_ARCH) -C $(@D)
 endef
 
 define IODINE_INSTALL_TARGET_CMDS
diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 2766850..3aa285b 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -11,7 +11,7 @@ IW_LICENSE = iw license
 IW_LICENSE_FILES = COPYING
 IW_DEPENDENCIES = host-pkgconf libnl
 IW_MAKE_OPTS = CC="$(TARGET_CC)" LD="$(TARGET_LD)" LDFLAGS="$(TARGET_LDFLAGS)"
-IW_MAKE_ENV = PKG_CONFIG="$(HOST_DIR)/usr/bin/pkg-config" \
+IW_MAKE_ENV = $(TARGET_MAKE_ENV) PKG_CONFIG="$(HOST_DIR)/usr/bin/pkg-config" \
 	GIT_DIR=$(IW_DIR)
 
 define IW_BUILD_CMDS
diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
index 73328d3..3db7f3d 100644
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -20,7 +20,8 @@ define JACK2_CONFIGURE_CMDS
 endef
 
 define JACK2_BUILD_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/python2 ./waf build -j $(PARALLEL_JOBS))
+	(cd $(@D); $(TARGET_MAKE_ENV) \
+		$(HOST_DIR)/usr/bin/python2 ./waf build -j $(PARALLEL_JOBS))
 endef
 
 define JACK2_INSTALL_TARGET_CMDS
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index db272b3..529b773 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -38,12 +38,12 @@ endif
 endif
 
 define LIBNSS_BUILD_CMDS
-	$(MAKE1) -C $(@D)/nss coreconf \
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)/nss coreconf \
 		SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
 		DIST=$(@D)/$(LIBNSS_DISTDIR) \
 		CHECKLOC= \
 		$(LIBNSS_BUILD_VARS)
-	$(MAKE1) -C $(@D)/nss lib/dbm all \
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)/nss lib/dbm all \
 		SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
 		DIST=$(@D)/$(LIBNSS_DISTDIR) \
 		CHECKLOC= \
diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
index f593428..d4be8d4 100644
--- a/package/lmbench/lmbench.mk
+++ b/package/lmbench/lmbench.mk
@@ -31,7 +31,9 @@ endef
 # script. So the variables override below don't take direct effect in
 # src/Makefile.
 define LMBENCH_BUILD_CMDS
-	$(MAKE) CFLAGS="$(LMBENCH_CFLAGS)" LDLIBS="$(LMBENCH_LDLIBS)" OS=$(ARCH) CC="$(TARGET_CC)" -C $(@D)/src
+	$(TARGET_MAKE_ENV) $(MAKE) \
+		CFLAGS="$(LMBENCH_CFLAGS)" LDLIBS="$(LMBENCH_LDLIBS)" \
+		OS=$(ARCH) CC="$(TARGET_CC)" -C $(@D)/src
 endef
 
 define LMBENCH_INSTALL_TARGET_CMDS
diff --git a/package/lua-msgpack-native/lua-msgpack-native.mk b/package/lua-msgpack-native/lua-msgpack-native.mk
index acd3a0e..cc68b3b 100644
--- a/package/lua-msgpack-native/lua-msgpack-native.mk
+++ b/package/lua-msgpack-native/lua-msgpack-native.mk
@@ -11,7 +11,8 @@ LUA_MSGPACK_NATIVE_LICENSE = Apache-2.0
 LUA_MSGPACK_NATIVE_LICENSE_FILES = LICENSE.txt
 
 define LUA_MSGPACK_NATIVE_BUILD_CMDS
-	$(TARGET_CC) $(TARGET_CFLAGS) -fPIC -shared -o $(@D)/msgpack.so $(@D)/mp.c
+	$(TARGET_MAKE_ENV) $(TARGET_CC) \
+		$(TARGET_CFLAGS) -fPIC -shared -o $(@D)/msgpack.so $(@D)/mp.c
 endef
 
 define LUA_MSGPACK_NATIVE_INSTALL_TARGET_CMDS
diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
index 5889436..e00058b 100644
--- a/package/moarvm/moarvm.mk
+++ b/package/moarvm/moarvm.mk
@@ -32,7 +32,7 @@ define MOARVM_CONFIGURE_CMDS
 endef
 
 define MOARVM_BUILD_CMDS
-	$(MAKE) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
 define MOARVM_INSTALL_STAGING_CMDS
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 6797e58..0961946 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -19,11 +19,13 @@ MONGOOSE_CFLAGS += -DNS_ENABLE_SSL -lssl -lcrypto -lz
 endif
 
 define MONGOOSE_BUILD_CMDS
-	$(TARGET_CC) $(@D)/examples/web_server/web_server.c $(@D)/mongoose.c \
+	$(TARGET_MAKE_ENV) $(TARGET_CC) \
+		$(@D)/examples/web_server/web_server.c $(@D)/mongoose.c \
 		-I$(@D) -o $(@D)/examples/web_server/web_server \
 		$(MONGOOSE_CFLAGS) -pthread
-	$(TARGET_CC) -c $(@D)/mongoose.c $(MONGOOSE_CFLAGS) -o $(@D)/mongoose.o
-	$(TARGET_AR) rcs $(@D)/libmongoose.a $(@D)/mongoose.o
+	$(TARGET_MAKE_ENV) $(TARGET_CC) \
+		-c $(@D)/mongoose.c $(MONGOOSE_CFLAGS) -o $(@D)/mongoose.o
+	$(TARGET_MAKE_ENV) $(TARGET_AR) rcs $(@D)/libmongoose.a $(@D)/mongoose.o
 endef
 
 define MONGOOSE_INSTALL_TARGET_CMDS
diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 3a61b8f..6ac91ab 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -269,7 +269,7 @@ define MPLAYER_CONFIGURE_CMDS
 endef
 
 define MPLAYER_BUILD_CMDS
-	$(MAKE) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
 define MPLAYER_INSTALL_TARGET_CMDS
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 8368c69..6dcf496 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -115,9 +115,9 @@ endif
 # ncurses breaks with parallel build, but takes quite a while to
 # build single threaded. Work around it similar to how Gentoo does
 define NCURSES_BUILD_CMDS
-	$(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR) sources
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR) sources
 	rm -rf $(@D)/misc/pc-files
-	$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR)
 endef
 
 ifneq ($(BR2_STATIC_LIBS),y)
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 90ebbcc..3a4599b 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -31,6 +31,7 @@ endef
 
 # disable external libatomic_ops because its detection fails.
 NGINX_CONF_ENV += \
+	$(TARGET_MAKE_ENV) \
 	ngx_force_c_compiler=yes \
 	ngx_force_c99_have_variadic_macros=yes \
 	ngx_force_gcc_have_variadic_macros=yes \
diff --git a/package/open2300/open2300.mk b/package/open2300/open2300.mk
index 73db2a0..253a8cd 100644
--- a/package/open2300/open2300.mk
+++ b/package/open2300/open2300.mk
@@ -24,7 +24,7 @@ OPEN2300_LDFLAGS += -L$(STAGING_DIR)/usr/lib/mysql -lmysqlclient
 endif
 
 define OPEN2300_BUILD_CMDS
-	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" \
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" \
 		CFLAGS="$(OPEN2300_CFLAGS)" CC_LDFLAGS="$(OPEN2300_LDFLAGS)" \
 		-C $(@D) $(OPEN2300_BINS)
 endef
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index f90c811..0dc3750 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -99,7 +99,7 @@ define HOST_OPENSSL_BUILD_CMDS
 endef
 
 define OPENSSL_BUILD_CMDS
-	$(MAKE1) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)
 endef
 
 define OPENSSL_INSTALL_STAGING_CMDS
diff --git a/package/opentyrian/opentyrian.mk b/package/opentyrian/opentyrian.mk
index b74e4cf..6efbe4e 100644
--- a/package/opentyrian/opentyrian.mk
+++ b/package/opentyrian/opentyrian.mk
@@ -20,7 +20,7 @@ OPENTYRIAN_NETWORK = false
 endif
 
 define OPENTYRIAN_BUILD_CMDS
-	$(MAKE) PLATFORM=UNIX \
+	$(TARGET_MAKE_ENV) $(MAKE) PLATFORM=UNIX \
 		CC="$(TARGET_CC)" \
 		STRIP="/bin/true" \
 		SDL_CONFIG="$(STAGING_DIR)/usr/bin/sdl-config" \
diff --git a/package/pax-utils/pax-utils.mk b/package/pax-utils/pax-utils.mk
index fc0589f..462413d 100644
--- a/package/pax-utils/pax-utils.mk
+++ b/package/pax-utils/pax-utils.mk
@@ -31,7 +31,8 @@ define HOST_PAX_UTILS_BUILD_CMDS
 endef
 
 define PAX_UTILS_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(PAX_UTILS_USE_CAP) -C $(@D)
+	$(TARGET_MAKE_ENV) \
+		$(MAKE) $(TARGET_CONFIGURE_OPTS) $(PAX_UTILS_USE_CAP) -C $(@D)
 endef
 
 define HOST_PAX_UTILS_INSTALL_CMDS
diff --git a/package/pifmrds/pifmrds.mk b/package/pifmrds/pifmrds.mk
index 5179715..9e71916 100644
--- a/package/pifmrds/pifmrds.mk
+++ b/package/pifmrds/pifmrds.mk
@@ -11,7 +11,8 @@ PIFMRDS_LICENSE = GPLv3+
 PIFMRDS_LICENSE_FILES = LICENSE
 
 define PIFMRDS_BUILD_CMDS
-	$(MAKE) -C $(@D)/src CC="$(TARGET_CC)" LDFLAGS="$(TARGET_LDFLAGS)" \
+	$(TARGET_MAKE_ENV) $(MAKE) \
+		-C $(@D)/src CC="$(TARGET_CC)" LDFLAGS="$(TARGET_LDFLAGS)" \
 		CFLAGS="$(TARGET_CFLAGS) -std=gnu99 -ffast-math -c" \
 		app rds_wav
 endef
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 7233d43..dff71e4 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -51,7 +51,8 @@ define POCO_CONFIGURE_CMDS
 endef
 
 define POCO_BUILD_CMDS
-	$(MAKE1) POCO_TARGET_OSARCH=$(ARCH) CROSSENV=$(TARGET_CROSS) \
+	$(TARGET_MAKE_ENV) $(MAKE1) \
+		POCO_TARGET_OSARCH=$(ARCH) CROSSENV=$(TARGET_CROSS) \
 		MYSQL_LIBDIR=$(STAGING_DIR)/usr/lib/mysql \
 		MYSQL_INCDIR=$(STAGING_DIR)/usr/include/mysql -C $(@D)
 endef
diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 0f9945f..e655457 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -50,7 +50,7 @@ define PPPD_CONFIGURE_CMDS
 endef
 
 define PPPD_BUILD_CMDS
-	$(MAKE) CC="$(TARGET_CC)" COPTS="$(TARGET_CFLAGS)" \
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" COPTS="$(TARGET_CFLAGS)" \
 		-C $(@D) $(PPPD_MAKE_OPTS)
 endef
 
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index a7bbe5f..b2b9bbe 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -482,6 +482,8 @@ define QT_CONFIGURE_CONFIG_FILE
 endef
 endif
 
+QT_CONFIGURE_ENV += $(TARGET_MAKE_ENV)
+
 define QT_CONFIGURE_CMDS
 	-[ -f $(@D)/Makefile ] && $(MAKE) -C $(@D) confclean
 	$(QT_CONFIGURE_IPV6)
diff --git a/package/qtuio/qtuio.mk b/package/qtuio/qtuio.mk
index 5fa10a7..58008bb 100644
--- a/package/qtuio/qtuio.mk
+++ b/package/qtuio/qtuio.mk
@@ -32,7 +32,8 @@ endef
 ifeq ($(BR2_QTUIO_EXAMPLES),y)
 define QTUIO_BUILD_EXAMPLES
 	for example in $(QTUIO_EXAMPLES) ; do \
-		$(MAKE) -C $(@D)/examples/$${example} || exit 1; \
+		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/examples/$${example} || \
+			exit 1; \
 	done
 endef
 endif
diff --git a/package/rtmpdump/rtmpdump.mk b/package/rtmpdump/rtmpdump.mk
index 613f1cd..aaa0071 100644
--- a/package/rtmpdump/rtmpdump.mk
+++ b/package/rtmpdump/rtmpdump.mk
@@ -36,7 +36,7 @@ RTMPDUMP_SHARED = "SHARED="
 endif
 
 define RTMPDUMP_BUILD_CMDS
-	$(MAKE) CRYPTO=$(RTMPDUMP_CRYPTO) \
+	$(TARGET_MAKE_ENV) $(MAKE) CRYPTO=$(RTMPDUMP_CRYPTO) \
 		prefix=/usr \
 		XCFLAGS="$(RTMPDUMP_CFLAGS)" \
 		XLDFLAGS="$(TARGET_LDFLAGS)" \
diff --git a/package/speex/speex.mk b/package/speex/speex.mk
index a34bfac..c7d77a0 100644
--- a/package/speex/speex.mk
+++ b/package/speex/speex.mk
@@ -32,7 +32,8 @@ endef
 SPEEX_POST_CONFIGURE_HOOKS += SPEEX_LIBTOOL_FIXUP
 
 define SPEEX_BUILD_CMDS
-	$($(PKG)_MAKE_ENV) $(MAKE) $($(PKG)_MAKE_OPTS) -C $(@D)/$($(PKG)_SUBDIR)
+	$(TARGET_MAKE_ENV) $($(PKG)_MAKE_ENV) $(MAKE) \
+		$($(PKG)_MAKE_OPTS) -C $(@D)/$($(PKG)_SUBDIR)
 endef
 
 $(eval $(autotools-package))
diff --git a/package/statserial/statserial.mk b/package/statserial/statserial.mk
index f0e15bc..1d646d9 100644
--- a/package/statserial/statserial.mk
+++ b/package/statserial/statserial.mk
@@ -11,7 +11,8 @@ STATSERIAL_LICENSE = GPLv2+
 STATSERIAL_LICENSE_FILES = COPYING
 
 define STATSERIAL_BUILD_CMDS
-	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_CC)" \
+		CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D)
 endef
 
 define STATSERIAL_INSTALL_TARGET_CMDS
diff --git a/package/ti-utils/ti-utils.mk b/package/ti-utils/ti-utils.mk
index 3141219..35ecc19 100644
--- a/package/ti-utils/ti-utils.mk
+++ b/package/ti-utils/ti-utils.mk
@@ -14,7 +14,7 @@ TI_UTILS_CFLAGS = $(shell $(PKG_CONFIG_HOST_BINARY) --cflags libnl-genl-3.0)
 TI_UTILS_LIBS = $(shell $(PKG_CONFIG_HOST_BINARY) --libs libnl-genl-3.0)
 
 define TI_UTILS_BUILD_CMDS
-	$(MAKE1) NFSROOT="$(STAGING_DIR)" \
+	$(TARGET_MAKE_ENV) $(MAKE1) NFSROOT="$(STAGING_DIR)" \
 		CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) $(TI_UTILS_CFLAGS)" \
 		LIBS="$(TI_UTILS_LIBS)" -C $(@D) all
 endef
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 2a0019e..38a4ebe 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -68,11 +68,11 @@ define TVHEADEND_CONFIGURE_CMDS
 endef
 
 define TVHEADEND_BUILD_CMDS
-	$(MAKE) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
 define TVHEADEND_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
 endef
 
 # Remove documentation and source files that are not needed because we
diff --git a/package/ushare/ushare.mk b/package/ushare/ushare.mk
index 25f880c..c9c6ae8 100644
--- a/package/ushare/ushare.mk
+++ b/package/ushare/ushare.mk
@@ -26,7 +26,8 @@ define USHARE_CONFIGURE_CMDS
 endef
 
 define USHARE_BUILD_CMDS
-	$(MAKE) LDFLAGS="$(TARGET_LDFLAGS) $(USHARE_LDFLAGS)" -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) \
+		LDFLAGS="$(TARGET_LDFLAGS) $(USHARE_LDFLAGS)" -C $(@D)
 endef
 
 define USHARE_INSTALL_TARGET_CMDS
diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index 3091f06..db85015 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -39,7 +39,7 @@ VSFTPD_LIBS += -lpam
 endif
 
 define VSFTPD_BUILD_CMDS
-	$(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)" LIBS="$(VSFTPD_LIBS)" -C $(@D)
 endef
 
-- 
2.4.3
