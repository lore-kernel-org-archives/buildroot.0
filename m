From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 16 Apr 2019 00:17:37 +0200
Subject: [Buildroot] [git commit] package/wireshark: bump to version 3.0.1
Message-ID: <20190415222957.46E568EA84@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7cb7fb8191fc52c1e2cc8b4b15ea52fd12c30d9a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove patch (already in version)
- Move package to cmake infrastructure
- --disables-guides option is not avaiable with cmake
- gtk ui is no more available
- QT UI now requires:
  - qt5multimedia and qt5svg at build time
  - qt5fontconfig, qt5png and udev at runtime
- Add host-python3 dependency
- Add a hook to build host-lemon
- Disable static build (some libraries such as
  plugins/3.0/codecs/l16mono.so does not support static building)
- Disable new sdjournal feature (will be enabled in a follow up patch)

Fixes:
 - http://autobuild.buildroot.org/results/bdbfd72a5da7e02e85159ee62bf56067adbc8931

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...et-gtp-c-remove-unneeded-named-structures.patch |  75 -------------
 package/wireshark/Config.in                        |  33 ++++--
 package/wireshark/wireshark.hash                   |   4 +-
 package/wireshark/wireshark.mk                     | 125 ++++++++++-----------
 4 files changed, 81 insertions(+), 156 deletions(-)

diff --git a/package/wireshark/0001-packet-gtp-c-remove-unneeded-named-structures.patch b/package/wireshark/0001-packet-gtp-c-remove-unneeded-named-structures.patch
deleted file mode 100644
index 0a894a282e..0000000000
--- a/package/wireshark/0001-packet-gtp-c-remove-unneeded-named-structures.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From 020e25b660250c97c8085e64cf85074ccfcdd06b Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 5 Mar 2019 20:59:49 +0100
-Subject: [PATCH] packet-gtp.c: remove unneeded named structures
-
-In uclibc, _header is already in sigcontext.h:
-
-packet-gtp.c:2361:16: error: redefinition of 'struct _header'
- typedef struct _header {
-                ^~~~~~~
-In file included from /home/dawncrow/buildroot-test/scripts/instance-0/output/host/i686-buildroot-linux-uclibc/sysroot/usr/include/bits/sigcontext.h:30:0,
-                 from /home/dawncrow/buildroot-test/scripts/instance-0/output/host/i686-buildroot-linux-uclibc/sysroot/usr/include/signal.h:311,
-                 from /home/dawncrow/buildroot-test/scripts/instance-0/output/host/i686-buildroot-linux-uclibc/sysroot/usr/include/glib-2.0/glib/gbacktrace.h:36,
-                 from /home/dawncrow/buildroot-test/scripts/instance-0/output/host/i686-buildroot-linux-uclibc/sysroot/usr/include/glib-2.0/glib.h:34,
-                 from ../../epan/proto.h:28,
-                 from ../../epan/packet.h:14,
-                 from packet-gtp.c:43:
-/home/dawncrow/buildroot-test/scripts/instance-0/output/host/i686-buildroot-linux-uclibc/sysroot/usr/include/asm/sigcontext.h:173:8: note: originally defined here
- struct _header {
-
-To fix this issue, transform _header and other named structures (with
-the exception of gtp_conv_info_t) into unnamed structures
-
-Fixes:
- - http://autobuild.buildroot.org/results/c41d42fe3489bc63c42e7ce7a9eccb1b4ca7b9b2
-
-Change-Id: I78116233c2a8dd7c54723b7cb558254bd5143bd2
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Reviewed-on: https://code.wireshark.org/review/32335
-Petri-Dish: Guy Harris <guy@alum.mit.edu>
-Tested-by: Petri Dish Buildbot
-Reviewed-by: Guy Harris <guy@alum.mit.edu>
-[Retrieved from:
-https://github.com/wireshark/wireshark/commit/020e25b660250c97c8085e64cf85074ccfcdd06b]
----
- epan/dissectors/packet-gtp.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/epan/dissectors/packet-gtp.c b/epan/dissectors/packet-gtp.c
-index 4c40e7aa54..971197e4ae 100644
---- a/epan/dissectors/packet-gtp.c
-+++ b/epan/dissectors/packet-gtp.c
-@@ -2170,7 +2170,7 @@ GHashTable* session_table;
- /* Relation between <teid,ip> -> frame */
- wmem_tree_t* frame_tree;
- 
--typedef struct gtp_info {
-+typedef struct {
-     guint32 teid;
-     guint32 frame;
- } gtp_info_t;
-@@ -2482,7 +2482,7 @@ static int decode_gtp_node_addr(tvbuff_t * tvb, int offset, packet_info * pinfo,
- static int decode_gtp_priv_ext(tvbuff_t * tvb, int offset, packet_info * pinfo, proto_tree * tree, session_args_t * args _U_);
- static int decode_gtp_unknown(tvbuff_t * tvb, int offset, packet_info * pinfo, proto_tree * tree, session_args_t * args _U_);
- 
--typedef struct _gtp_opt {
-+typedef struct {
-     int optcode;
-     int (*decode) (tvbuff_t *, int, packet_info *, proto_tree *, session_args_t *);
- } gtp_opt_t;
-@@ -2661,12 +2661,12 @@ id_to_str(tvbuff_t *tvb, gint offset)
- /* Next definitions and function check_field_presence checks if given field
-  * in GTP packet is compliant with ETSI
-  */
--typedef struct _header {
-+typedef struct {
-     guint8 code;
-     guint8 presence;
- } ext_header;
- 
--typedef struct _message {
-+typedef struct {
-     guint8 code;
-     ext_header fields[32];
- } _gtp_mess_items;
diff --git a/package/wireshark/Config.in b/package/wireshark/Config.in
index 0cf14f2f84..f3c6cfabcd 100644
--- a/package/wireshark/Config.in
+++ b/package/wireshark/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_WIRESHARK
 	depends on BR2_USE_MMU # fork(), glib2
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBGLIB2
@@ -14,22 +15,32 @@ config BR2_PACKAGE_WIRESHARK
 
 if BR2_PACKAGE_WIRESHARK
 
-config BR2_PACKAGE_WIRESHARK_QT
-	bool
+config BR2_PACKAGE_WIRESHARK_GUI
+	bool "Qt5 GUI"
 	default y
-	depends on BR2_PACKAGE_QT5BASE_WIDGETS
-	depends on BR2_PACKAGE_QT5TOOLS
+	depends on BR2_INSTALL_LIBSTDCPP # qt5
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # qt5
+	depends on BR2_PACKAGE_HAS_UDEV # qt5 input
+	select BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE
+	select BR2_PACKAGE_QT5BASE_FONTCONFIG #??runtime
+	select BR2_PACKAGE_QT5BASE_PNG #??runtime
+	select BR2_PACKAGE_QT5BASE_WIDGETS
+	select BR2_PACKAGE_QT5MULTIMEDIA
+	select BR2_PACKAGE_QT5SVG
+	select BR2_PACKAGE_QT5TOOLS
 	select BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS
+	help
+	  Enable Qt5 GUI
 
-config BR2_PACKAGE_WIRESHARK_GUI
-	bool
-	default y if BR2_PACKAGE_LIBGTK2
-	default y if BR2_PACKAGE_LIBGTK3
-	default y if BR2_PACKAGE_WIRESHARK_QT
+comment "Qt5 GUI needs a udev /dev management and a toolchain w/ C++, NPTL"
+	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
 endif # BR2_PACKAGE_WIRESHARK
 
-comment "wireshark needs a toolchain w/ wchar, threads"
+comment "wireshark needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 071940e1c1..99aa433bb4 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,4 +1,4 @@
-# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.6.7.txt
-sha256 747b3e7a37414942959f76f198be49dcbcca936bda538c4408942ce71bfd2b71  wireshark-2.6.7.tar.xz
+# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.0.1.txt
+sha256 86864c3d0f6c2311992a98d8ea7dfd429097fe62dae2e5516e1a2f6bef2ac08c  wireshark-3.0.1.tar.xz
 # Locally calculated
 sha256 7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index a917efb5f6..691f0140b5 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,152 +4,141 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 2.6.7
+WIRESHARK_VERSION = 3.0.1
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
 WIRESHARK_LICENSE_FILES = COPYING
-WIRESHARK_DEPENDENCIES = host-pkgconf libgcrypt libpcap libglib2
-WIRESHARK_CONF_ENV = \
-	LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config \
-	PCAP_CONFIG=$(STAGING_DIR)/usr/bin/pcap-config
+WIRESHARK_DEPENDENCIES = host-pkgconf host-python3 libgcrypt libpcap libglib2
+
+WIRESHARK_MAKE_ENV = \
+	$(TARGET_MAKE_ENV) \
+	PATH="$(@D)/bin:$(BR_PATH)"
 
 WIRESHARK_CONF_OPTS = \
-	--disable-guides \
-	--enable-static=no \
-	--with-libsmi=no \
-	--with-pcap=yes
-
-# wireshark GUI options
-ifeq ($(BR2_PACKAGE_LIBGTK3),y)
-WIRESHARK_CONF_OPTS += --with-gtk=3
-WIRESHARK_DEPENDENCIES += libgtk3
-else ifeq ($(BR2_PACKAGE_LIBGTK2),y)
-WIRESHARK_CONF_OPTS += --with-gtk=2
-WIRESHARK_DEPENDENCIES += libgtk2
-else
-WIRESHARK_CONF_OPTS += --with-gtk=no
-endif
+	-DENABLE_PCAP=ON \
+	-DENABLE_SMI=OFF \
+	-DENABLE_STATIC=OFF \
+	-DBUILD_sdjournal=OFF
+
+# wireshark needs the host version of lemon during compilation.
+# This binrary is provided by sqlite-src (which is different from
+# sqlite-autotools that is currently packaged in buildroot) moreover wireshark
+# adds several patches.
+# So, instead of creating a separate host package and installing lemon to
+# $(HOST_DIR), this binary is compiled on-the-fly
+define WIRESHARK_BUILD_LEMON_TOOL
+	cd $(@D); \
+	mkdir -p $(@D)/bin; \
+	$(HOSTCC) $(HOST_CFLAGS) -o $(@D)/bin/lemon tools/lemon/lemon.c
+endef
 
-# Qt4 needs accessibility, we don't support it
-ifeq ($(BR2_PACKAGE_WIRESHARK_QT),y)
-WIRESHARK_CONF_OPTS += --with-qt=5
-WIRESHARK_DEPENDENCIES += qt5base qt5tools
-WIRESHARK_CONF_ENV += ac_cv_path_QTCHOOSER=""
-# Seems it expects wrappers and passes a -qt=X parameter for version
-WIRESHARK_MAKE_OPTS += \
-	MOC="$(HOST_DIR)/bin/moc" \
-	RCC="$(HOST_DIR)/bin/rcc" \
-	UIC="$(HOST_DIR)/bin/uic"
-else
-WIRESHARK_CONF_OPTS += --with-qt=no
-endif
+WIRESHARK_PRE_BUILD_HOOKS += WIRESHARK_BUILD_LEMON_TOOL
 
-# No GUI at all
-ifeq ($(BR2_PACKAGE_WIRESHARK_GUI),)
-WIRESHARK_CONF_OPTS += --disable-wireshark
+ifeq ($(BR2_PACKAGE_WIRESHARK_GUI),y)
+WIRESHARK_CONF_OPTS += -DBUILD_wireshark=ON
+WIRESHARK_DEPENDENCIES += qt5base qt5multimedia qt5svg qt5tools
+else
+WIRESHARK_CONF_OPTS += -DBUILD_wireshark=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_BCG729),y)
-WIRESHARK_CONF_OPTS += --with-bcg729=$(STAGING_DIR)/usr
+WIRESHARK_CONF_OPTS += -DENABLE_BCG729=ON
 WIRESHARK_DEPENDENCIES += bcg729
 else
-WIRESHARK_CONF_OPTS += --without-bcg729
+WIRESHARK_CONF_OPTS += -DENABLE_BCG729=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_C_ARES),y)
-WIRESHARK_CONF_OPTS += --with-c-ares=$(STAGING_DIR)/usr
+WIRESHARK_CONF_OPTS += -DENABLE_CARES=ON
 WIRESHARK_DEPENDENCIES += c-ares
 else
-WIRESHARK_CONF_OPTS += --without-c-ares
+WIRESHARK_CONF_OPTS += -DENABLE_CARES=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
-WIRESHARK_CONF_OPTS += --with-gnutls=yes
+WIRESHARK_CONF_OPTS += -DENABLE_GNUTLS=ON
 WIRESHARK_DEPENDENCIES += gnutls
 else
-WIRESHARK_CONF_OPTS += --with-gnutls=no
+WIRESHARK_CONF_OPTS += -DENABLE_GNUTLS=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LIBKRB5),y)
-WIRESHARK_CONF_OPTS += --with-krb5=$(STAGING_DIR)/usr
+WIRESHARK_CONF_OPTS += -DENABLE_KERBEROS=ON
 WIRESHARK_DEPENDENCIES += libkrb5
 else
-WIRESHARK_CONF_OPTS += --without-krb5
+WIRESHARK_CONF_OPTS += -DENABLE_KERBEROS=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LIBMAXMINDDB),y)
-WIRESHARK_CONF_OPTS += --with-maxminddb=$(STAGING_DIR)/usr
+WIRESHARK_CONF_OPTS += -DBUILD_mmdbresolve=ON
 WIRESHARK_DEPENDENCIES += libmaxminddb
 else
-WIRESHARK_CONF_OPTS += --without-maxminddb
+WIRESHARK_CONF_OPTS += -DBUILD_mmdbresolve=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LIBNL),y)
-WIRESHARK_CONF_OPTS += --with-libnl
+WIRESHARK_CONF_OPTS += -DENABLE_NETLINK=ON
 WIRESHARK_DEPENDENCIES += libnl
 else
-WIRESHARK_CONF_OPTS += --without-libnl
+WIRESHARK_CONF_OPTS += -DENABLE_NETLINK=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSSH),y)
-WIRESHARK_CONF_OPTS += --with-libssh=$(STAGING_DIR)/usr
+WIRESHARK_CONF_OPTS += -DENABLE_LIBSSH=ON
 WIRESHARK_DEPENDENCIES += libssh
 else
-WIRESHARK_CONF_OPTS += --without-libssh
+WIRESHARK_CONF_OPTS += -DENABLE_LIBSSH=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
-WIRESHARK_CONF_OPTS += --with-libxml2
+WIRESHARK_CONF_OPTS += -DENABLE_LIBXML2=ON
 WIRESHARK_DEPENDENCIES += libxml2
 else
-WIRESHARK_CONF_OPTS += --without-libxml2
+WIRESHARK_CONF_OPTS += -DENABLE_LIBXML2=OFF
 endif
 
 # no support for lua53 yet
 ifeq ($(BR2_PACKAGE_LUA_5_1),y)
-WIRESHARK_CONF_OPTS += --with-lua
+WIRESHARK_CONF_OPTS += -DENABLE_LUA=ON
 WIRESHARK_DEPENDENCIES += lua
 else
-WIRESHARK_CONF_OPTS += --without-lua
+WIRESHARK_CONF_OPTS += -DENABLE_LUA=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LZ4),y)
-WIRESHARK_CONF_OPTS += --with-lz4=$(STAGING_DIR)/usr
+WIRESHARK_CONF_OPTS += -DENABLE_LZ4=ON
 WIRESHARK_DEPENDENCIES += lz4
 else
-WIRESHARK_CONF_OPTS += --without-lz4
+WIRESHARK_CONF_OPTS += -DENABLE_LZ4=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_NGHTTP2),y)
-WIRESHARK_CONF_OPTS += --with-nghttp2=$(STAGING_DIR)/usr
+WIRESHARK_CONF_OPTS += -DENABLE_NGHTTP2=ON
 WIRESHARK_DEPENDENCIES += nghttp2
 else
-WIRESHARK_CONF_OPTS += --without-nghttp2
+WIRESHARK_CONF_OPTS += -DENABLE_NGHTTP2=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_SBC),y)
-WIRESHARK_CONF_OPTS += --with-sbc=yes
+WIRESHARK_CONF_OPTS += -DENABLE_SBC=ON
 WIRESHARK_DEPENDENCIES += sbc
 else
-WIRESHARK_CONF_OPTS += --with-sbc=no
+WIRESHARK_CONF_OPTS += -DENABLE_SBC=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_SNAPPY),y)
-WIRESHARK_CONF_OPTS += --with-snappy=$(STAGING_DIR)/usr
+WIRESHARK_CONF_OPTS += -DENABLE_SNAPPY=ON
 WIRESHARK_DEPENDENCIES += snappy
-ifeq ($(BR2_STATIC_LIBS),y)
-WIRESHARK_CONF_ENV += LIBS=-lstdc++
-endif
 else
-WIRESHARK_CONF_OPTS += --without-snappy
+WIRESHARK_CONF_OPTS += -DENABLE_SNAPPY=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_SPANDSP),y)
-WIRESHARK_CONF_OPTS += --with-spandsp
+WIRESHARK_CONF_OPTS += -DENABLE_SPANDSP=ON
 WIRESHARK_DEPENDENCIES += spandsp
 else
-WIRESHARK_CONF_OPTS += --without-spandsp
+WIRESHARK_CONF_OPTS += -DENABLE_SPANDSP=OFF
 endif
 
 define WIRESHARK_REMOVE_DOCS
@@ -159,4 +148,4 @@ endef
 
 WIRESHARK_POST_INSTALL_TARGET_HOOKS += WIRESHARK_REMOVE_DOCS
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
