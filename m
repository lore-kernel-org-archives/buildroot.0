From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed,  6 Feb 2019 20:13:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/libcurl: introduce a 'small' config
 option
Message-ID: <20190206191305.18306-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Libcurl is more than 250 KiB in size. About 50 KiB of this can be saved by
disabling features/protocols that are not commonly needed.

Other packages that are selecting libcurl could be incompatible with this
'small' mode. But, there is no clear way to find out which packages are in
this situation, in particular because issues may only be visible at runtime.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/libcurl/Config.in  | 19 +++++++++++++++++++
 package/libcurl/libcurl.mk | 18 ++++++++++++++++++
 2 files changed, 37 insertions(+)


To check the impact on other packages, I made a build with as much packages
enabled that select libcurl, and with the 'small' option enabled as well.
There were no compilation failures.
Defconfig used for this test:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_ROOTFS_MERGED_USR=y
BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
BR2_SYSTEM_DHCP="eth0"
BR2_TARGET_TZ_INFO=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux.config"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="versatile-pb"
BR2_PACKAGE_GSTREAMER=y
BR2_PACKAGE_GST_PLUGINS_BAD=y
BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CURL=y
BR2_PACKAGE_GSTREAMER1=y
BR2_PACKAGE_GST1_PLUGINS_BAD=y
BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CURL=y
BR2_PACKAGE_VORBIS_TOOLS=y
BR2_PACKAGE_LZ4=y
BR2_PACKAGE_SYSDIG=y
BR2_PACKAGE_CMAKE_CTEST=y
BR2_PACKAGE_CURLFTPFS=y
BR2_PACKAGE_PHP=y
BR2_PACKAGE_PHP_EXT_CURL=y
BR2_PACKAGE_LIBGCRYPT=y
BR2_PACKAGE_LIBXMLRPC=y
BR2_PACKAGE_AZURE_IOT_SDK_C=y
BR2_PACKAGE_CURLPP=y
BR2_PACKAGE_FLICKCURL=y
BR2_PACKAGE_LIBCURL_SMALL=y
BR2_PACKAGE_LIBUPNP=y
BR2_PACKAGE_LIBCAP=y
BR2_PACKAGE_COLLECTD=y
BR2_PACKAGE_COLLECTD_CURL=y
BR2_PACKAGE_ASTERISK=y
BR2_PACKAGE_BOINC=y
BR2_PACKAGE_DEHYDRATED=y
BR2_PACKAGE_FREESWITCH=y
BR2_PACKAGE_STRONGSWAN=y
BR2_PACKAGE_STRONGSWAN_CURL=y
BR2_PACKAGE_TRANSMISSION=y
BR2_PACKAGE_KMOD=y
BR2_PACKAGE_KMOD_TOOLS=y
BR2_PACKAGE_RAUC=y
BR2_PACKAGE_RAUC_NETWORK=y
BR2_PACKAGE_TPM2_TOOLS=y
BR2_PACKAGE_UTIL_LINUX_BINARIES=y
BR2_PACKAGE_UTIL_LINUX_FSCK=y
BR2_PACKAGE_UTIL_LINUX_MOUNT=y
BR2_PACKAGE_UTIL_LINUX_NOLOGIN=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_SIZE="600M"
# BR2_TARGET_ROOTFS_TAR is not set


diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
index 9c62539e4d..3f8c3ae11d 100644
--- a/package/libcurl/Config.in
+++ b/package/libcurl/Config.in
@@ -19,6 +19,25 @@ config BR2_PACKAGE_LIBCURL_VERBOSE
 	help
 	  Enable verbose text strings
 
+config BR2_PACKAGE_LIBCURL_SMALL
+	bool "disable non-basic features to reduce size"
+	help
+	  Compile libcurl only with basic features enabled, to save
+	  about 50 KiB in the root filesystem.
+
+	  Following protocols/features are disabled:
+	  - LDAP / LDAPS
+	  - POP3 / IMAP / SMTP
+	  - Telnet
+	  - TFTP
+	  - RTSP
+	  - SMB / CIFS
+	  - DICT
+	  - Gopher
+	  - Proxy support
+	  - Cookie support
+	  - The --libcurl option to generate C programs
+
 config BR2_PACKAGE_LIBCURL_TLS_SUPPORT
 	bool
 	default y if BR2_PACKAGE_OPENSSL
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 3bc5207951..7a1de44799 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -108,6 +108,24 @@ else
 LIBCURL_CONF_OPTS += --without-nghttp2
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCURL_SMALL),y)
+LIBCURL_CONF_OPTS += \
+	--disable-cookies \
+	--disable-dict \
+	--disable-gopher \
+	--disable-imap \
+	--disable-ldap \
+	--disable-ldaps \
+	--disable-libcurl-option \
+	--disable-pop3 \
+	--disable-proxy \
+	--disable-rtsp \
+	--disable-smb \
+	--disable-smtp \
+	--disable-telnet \
+	--disable-tftp
+endif
+
 define LIBCURL_FIX_DOT_PC
 	printf 'Requires: openssl\n' >>$(@D)/libcurl.pc.in
 endef
-- 
2.19.2
