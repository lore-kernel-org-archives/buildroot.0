From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Oct 2014 15:07:23 +0200
Subject: [Buildroot] [git commit] packages: rename FOO_MAKE_OPT into
	FOO_MAKE_OPTS
Message-ID: <20141004170453.4FCBD9D823@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0518a98ac3e715a846dfb72fcfb2ec7aed423084
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While the autotools infrastructure was using FOO_MAKE_OPT, generic packages
were typically using FOO_MAKE_OPTS. This inconsistency becomes a problem
when a new infrastructure is introduced that wants to make use of
FOO_MAKE_OPT(S), and can live alongside either generic-package or
autotools-package. The new infrastructure will have to choose between either
OPT or OPTS, and thus rule out transparent usage by respectively generic
packages or generic packages. An example of such an infrastructure is
kconfig-package, which provides kconfig-related make targets.

The OPTS variant is more logical, as there are typically multiple options.

This patch renames all occurrences of FOO_MAKE_OPT in FOO_MAKE_OPTS.
Sed command used:
    find * -type f | xargs sed -i 's#_MAKE_OPT\>#&S#g'

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/at91bootstrap3/at91bootstrap3.mk     |    4 ++--
 docs/manual/adding-packages-autotools.txt |    2 +-
 docs/manual/adding-packages-cmake.txt     |    2 +-
 docs/manual/adding-packages-kconfig.txt   |    2 +-
 package/avahi/avahi.mk                    |    2 +-
 package/dnsmasq/dnsmasq.mk                |   12 ++++++------
 package/e2fsprogs/e2fsprogs.mk            |    2 +-
 package/faifa/faifa.mk                    |    2 +-
 package/freetype/freetype.mk              |    2 +-
 package/gcc/gcc-initial/gcc-initial.mk    |    2 +-
 package/httping/httping.mk                |    6 +++---
 package/ipsec-tools/ipsec-tools.mk        |    2 +-
 package/iputils/iputils.mk                |    6 +++---
 package/iw/iw.mk                          |    6 +++---
 package/libdnet/libdnet.mk                |    6 +++---
 package/libjson/libjson.mk                |   12 ++++++------
 package/libseccomp/libseccomp.mk          |    2 +-
 package/linux-pam/linux-pam.mk            |    2 +-
 package/lm-sensors/lm-sensors.mk          |   12 ++++++------
 package/lshw/lshw.mk                      |    6 +++---
 package/lvm2/lvm2.mk                      |    2 +-
 package/mdadm/mdadm.mk                    |    2 +-
 package/mii-diag/mii-diag.mk              |    4 ++--
 package/mpfr/mpfr.mk                      |    2 +-
 package/openswan/openswan.mk              |   12 ++++++------
 package/openvmtools/openvmtools.mk        |    2 +-
 package/pkg-autotools.mk                  |    6 +++---
 package/pkg-cmake.mk                      |   12 ++++++------
 package/pppd/pppd.mk                      |    8 ++++----
 package/pv/pv.mk                          |    2 +-
 package/quota/quota.mk                    |    2 +-
 package/rp-pppoe/rp-pppoe.mk              |    2 +-
 package/rubix/rubix.mk                    |    2 +-
 package/schifra/schifra.mk                |    4 ++--
 package/sdl_ttf/sdl_ttf.mk                |    2 +-
 package/setserial/setserial.mk            |    2 +-
 package/speex/speex.mk                    |    2 +-
 package/sysstat/sysstat.mk                |    2 +-
 package/systemd/systemd.mk                |    4 ++--
 package/tn5250/tn5250.mk                  |    2 +-
 package/util-linux/util-linux.mk          |    2 +-
 package/whois/whois.mk                    |    6 +++---
 package/xinetd/xinetd.mk                  |    2 +-
 package/zmqpp/zmqpp.mk                    |    8 ++++----
 package/zxing/zxing.mk                    |    4 ++--
 45 files changed, 95 insertions(+), 95 deletions(-)

diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
index 07df75d..91b6684 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -17,7 +17,7 @@ AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE = \
 AT91BOOTSTRAP3_CUSTOM_PATCH_DIR = \
 	$(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_PATCH_DIR))
 
-AT91BOOTSTRAP3_MAKE_OPT = CROSS_COMPILE=$(TARGET_CROSS) DESTDIR=$(BINARIES_DIR)
+AT91BOOTSTRAP3_MAKE_OPTS = CROSS_COMPILE=$(TARGET_CROSS) DESTDIR=$(BINARIES_DIR)
 
 ifneq ($(AT91BOOTSTRAP3_CUSTOM_PATCH_DIR),)
 define AT91BOOTSTRAP3_APPLY_CUSTOM_PATCHES
@@ -41,7 +41,7 @@ define AT91BOOTSTRAP3_CONFIGURE_CMDS
 endef
 
 define AT91BOOTSTRAP3_BUILD_CMDS
-	$(MAKE) $(AT91BOOTSTRAP3_MAKE_OPT) -C $(@D) boot
+	$(MAKE) $(AT91BOOTSTRAP3_MAKE_OPTS) -C $(@D) boot
 endef
 
 define AT91BOOTSTRAP3_INSTALL_IMAGES_CMDS
diff --git a/docs/manual/adding-packages-autotools.txt b/docs/manual/adding-packages-autotools.txt
index 4329ca7..9fb765f 100644
--- a/docs/manual/adding-packages-autotools.txt
+++ b/docs/manual/adding-packages-autotools.txt
@@ -111,7 +111,7 @@ cases, typical packages will therefore only use a few of them.
   variables to pass to make in the build step. These are passed before
   the +make+ command. By default, empty.
 
-* +LIBFOO_MAKE_OPT+, to specify additional variables to
+* +LIBFOO_MAKE_OPTS+, to specify additional variables to
   pass to make in the build step. These are passed after the
   +make+ command. By default, empty.
 
diff --git a/docs/manual/adding-packages-cmake.txt b/docs/manual/adding-packages-cmake.txt
index d648fee..828fc34 100644
--- a/docs/manual/adding-packages-cmake.txt
+++ b/docs/manual/adding-packages-cmake.txt
@@ -108,7 +108,7 @@ typical packages will therefore only use a few of them.
   pass to make in the build step. These are passed before the +make+
   command. By default, empty.
 
-* +LIBFOO_MAKE_OPT+, to specify additional variables to pass to make
+* +LIBFOO_MAKE_OPTS+, to specify additional variables to pass to make
   in the build step. These are passed after the +make+ command. By
   default, empty.
 
diff --git a/docs/manual/adding-packages-kconfig.txt b/docs/manual/adding-packages-kconfig.txt
index f14b87b..979a2b5 100644
--- a/docs/manual/adding-packages-kconfig.txt
+++ b/docs/manual/adding-packages-kconfig.txt
@@ -47,7 +47,7 @@ be set to suit the needs of the package under consideration:
   support, for example 'menuconfig xconfig'. By default, 'menuconfig'.
 
 * +FOO_KCONFIG_OPT+: extra options to pass when calling the kconfig
-  ediftors. This may need to include '$(FOO_MAKE_OPT)', for example. By
+  editors. This may need to include '$(FOO_MAKE_OPTS)', for example. By
   default, empty.
 
 * +FOO_KCONFIG_FIXUP_CMDS+: a list of shell commands needed to fixup the
diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 55527dc..f862fcb 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -138,7 +138,7 @@ else
 AVAHI_CONF_OPT += --disable-python
 endif
 
-AVAHI_MAKE_OPT += $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),LIBS=-lintl)
+AVAHI_MAKE_OPTS += $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),LIBS=-lintl)
 
 define AVAHI_USERS
 	avahi -1 avahi -1 * - - -
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index e7f5776..e7123f8 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -8,8 +8,8 @@ DNSMASQ_VERSION = 2.72
 DNSMASQ_SOURCE = dnsmasq-$(DNSMASQ_VERSION).tar.xz
 DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
-DNSMASQ_MAKE_OPT = COPTS="$(DNSMASQ_COPTS)" PREFIX=/usr CFLAGS="$(TARGET_CFLAGS)"
-DNSMASQ_MAKE_OPT += DESTDIR=$(TARGET_DIR) LDFLAGS="$(TARGET_LDFLAGS)"
+DNSMASQ_MAKE_OPTS = COPTS="$(DNSMASQ_COPTS)" PREFIX=/usr CFLAGS="$(TARGET_CFLAGS)"
+DNSMASQ_MAKE_OPTS += DESTDIR=$(TARGET_DIR) LDFLAGS="$(TARGET_LDFLAGS)"
 DNSMASQ_DEPENDENCIES = host-pkgconf
 DNSMASQ_LICENSE = Dual GPLv2/GPLv3
 DNSMASQ_LICENSE_FILES = COPYING COPYING-v3
@@ -37,7 +37,7 @@ endif
 # NLS requires IDN so only enable it (i18n) when IDN is true
 ifeq ($(BR2_PACKAGE_DNSMASQ_IDN),y)
 	DNSMASQ_DEPENDENCIES += libidn $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) host-gettext
-	DNSMASQ_MAKE_OPT += LIBS+="$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),-lintl)"
+	DNSMASQ_MAKE_OPTS += LIBS+="$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),-lintl)"
 	DNSMASQ_COPTS += -DHAVE_IDN
 	DNSMASQ_I18N = $(if $(BR2_ENABLE_LOCALE),-i18n)
 endif
@@ -58,7 +58,7 @@ ifeq ($(BR2_PACKAGE_DNSMASQ_LUA),y)
 
 # liblua uses dlopen when dynamically linked
 ifneq ($(BR2_PREFER_STATIC_LIB),y)
-	DNSMASQ_MAKE_OPT += LIBS+="-ldl"
+	DNSMASQ_MAKE_OPTS += LIBS+="-ldl"
 endif
 
 define DNSMASQ_ENABLE_LUA
@@ -98,11 +98,11 @@ define DNSMASQ_BUILD_CMDS
 	$(DNSMASQ_ENABLE_DBUS)
 	$(DNSMASQ_ENABLE_LUA)
 	$(DNSMASQ_ENABLE_CONNTRACK)
-	$(DNSMASQ_MAKE_ENV) $(MAKE1) -C $(@D) $(DNSMASQ_MAKE_OPT) all$(DNSMASQ_I18N)
+	$(DNSMASQ_MAKE_ENV) $(MAKE1) -C $(@D) $(DNSMASQ_MAKE_OPTS) all$(DNSMASQ_I18N)
 endef
 
 define DNSMASQ_INSTALL_TARGET_CMDS
-	$(DNSMASQ_MAKE_ENV) $(MAKE) -C $(@D) $(DNSMASQ_MAKE_OPT) install$(DNSMASQ_I18N)
+	$(DNSMASQ_MAKE_ENV) $(MAKE) -C $(@D) $(DNSMASQ_MAKE_OPTS) install$(DNSMASQ_I18N)
 	mkdir -p $(TARGET_DIR)/var/lib/misc/
 endef
 
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index b115582..468767f 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -31,7 +31,7 @@ endif
 
 E2FSPROGS_DEPENDENCIES = host-pkgconf util-linux
 
-E2FSPROGS_MAKE_OPT = \
+E2FSPROGS_MAKE_OPTS = \
 	LDCONFIG=true
 
 define HOST_E2FSPROGS_INSTALL_CMDS
diff --git a/package/faifa/faifa.mk b/package/faifa/faifa.mk
index a2a2a56..a56a8c0 100644
--- a/package/faifa/faifa.mk
+++ b/package/faifa/faifa.mk
@@ -11,7 +11,7 @@ FAIFA_DEPENDENCIES = libpcap host-autoconf
 FAIFA_LICENSE = BSD-3c
 FAIFA_LICENSE_FILES = COPYING
 
-FAIFA_MAKE_OPT += GIT_REV=$(FAIFA_VERSION)
+FAIFA_MAKE_OPTS += GIT_REV=$(FAIFA_VERSION)
 
 # This package uses autoconf, but not automake, so we need to call
 # their special autogen.sh script, and have custom target and staging
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 52a8fb4..8643a8f 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -8,7 +8,7 @@ FREETYPE_VERSION = 2.5.3
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
 FREETYPE_SITE = http://downloads.sourceforge.net/project/freetype/freetype2/$(FREETYPE_VERSION)
 FREETYPE_INSTALL_STAGING = YES
-FREETYPE_MAKE_OPT = CCexe="$(HOSTCC)"
+FREETYPE_MAKE_OPTS = CCexe="$(HOSTCC)"
 FREETYPE_LICENSE = Dual FTL/GPLv2+
 FREETYPE_LICENSE_FILES = docs/FTL.TXT docs/GPLv2.TXT
 FREETYPE_DEPENDENCIES = host-pkgconf
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index 4470477..45a0f4f 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -53,7 +53,7 @@ HOST_GCC_INITIAL_CONF_ENV = \
 # We need to tell gcc that the C library will be providing the ssp
 # support, as it can't guess it since the C library hasn't been built
 # yet (we're gcc-initial).
-HOST_GCC_INITIAL_MAKE_OPT = $(if $(BR2_TOOLCHAIN_HAS_SSP),gcc_cv_libc_provides_ssp=yes) all-gcc all-target-libgcc
+HOST_GCC_INITIAL_MAKE_OPTS = $(if $(BR2_TOOLCHAIN_HAS_SSP),gcc_cv_libc_provides_ssp=yes) all-gcc all-target-libgcc
 HOST_GCC_INITIAL_INSTALL_OPT = install-gcc install-target-libgcc
 
 $(eval $(host-autotools-package))
diff --git a/package/httping/httping.mk b/package/httping/httping.mk
index 719b0db..e868463 100644
--- a/package/httping/httping.mk
+++ b/package/httping/httping.mk
@@ -18,19 +18,19 @@ HTTPING_DEPENDENCIES = host-gettext \
 	$(if $(BR2_PACKAGE_NCURSES_WCHAR),ncurses) \
 	$(if $(BR2_PACKAGE_OPENSSL),openssl) \
 	$(if $(BR2_PACKAGE_FFTW),fftw)
-HTTPING_MAKE_OPT = $(TARGET_CONFIGURE_OPTS) \
+HTTPING_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) \
 	FW=$(if $(BR2_PACKAGE_FFTW),yes,no) \
 	NC=$(if $(BR2_PACKAGE_NCURSES_WCHAR),yes,no) \
 	SSL=$(if $(BR2_PACKAGE_OPENSSL),yes,no) \
 	TFO=$(if $(BR2_PACKAGE_HTTPING_TFO),yes,no)
 
 define HTTPING_BUILD_CMDS
-	$(HTTPING_MAKE_OPT) LDFLAGS="$(HTTPING_LDFLAGS)" \
+	$(HTTPING_MAKE_OPTS) LDFLAGS="$(HTTPING_LDFLAGS)" \
 		$(MAKE) DEBUG=no -C $(@D)
 endef
 
 define HTTPING_INSTALL_TARGET_CMDS
-	$(HTTPING_MAKE_OPT) $(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
+	$(HTTPING_MAKE_OPTS) $(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
 endef
 
 $(eval $(generic-package))
diff --git a/package/ipsec-tools/ipsec-tools.mk b/package/ipsec-tools/ipsec-tools.mk
index 2be32be..9bfeaf5 100644
--- a/package/ipsec-tools/ipsec-tools.mk
+++ b/package/ipsec-tools/ipsec-tools.mk
@@ -13,7 +13,7 @@ IPSEC_TOOLS_MAKE = $(MAKE1)
 IPSEC_TOOLS_DEPENDENCIES = openssl flex host-flex
 
 # configure hardcodes -Werror, so override CFLAGS on make invocation
-IPSEC_TOOLS_MAKE_OPT = CFLAGS='$(TARGET_CFLAGS)'
+IPSEC_TOOLS_MAKE_OPTS = CFLAGS='$(TARGET_CFLAGS)'
 
 # openssl uses zlib, so we need to explicitly link with it when static
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 71300a5..735ed65 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -18,7 +18,7 @@ IPUTILS_DEPENDENCIES += busybox
 endif
 
 # Disabling CAP_SETPCAP (file capabilities)
-IPUTILS_MAKE_OPT = $(TARGET_CONFIGURE_OPTS) USE_CAP=no USE_SYSFS=no\
+IPUTILS_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) USE_CAP=no USE_SYSFS=no\
 	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE" \
 	arping clockdiff ping rarpd rdisc tftpd tracepath
 
@@ -26,7 +26,7 @@ ifeq ($(BR2_INET_IPV6),y)
 # To support md5 for ping6
 IPUTILS_DEPENDENCIES += openssl
 
-IPUTILS_MAKE_OPT += ping6 tracepath6 traceroute6
+IPUTILS_MAKE_OPTS += ping6 tracepath6 traceroute6
 
 define IPUTILS_IPV6_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 755 $(@D)/ping6       $(TARGET_DIR)/bin/ping6
@@ -36,7 +36,7 @@ endef
 endif
 
 define IPUTILS_BUILD_CMDS
-	$(MAKE) -C $(@D) $(IPUTILS_MAKE_OPT)
+	$(MAKE) -C $(@D) $(IPUTILS_MAKE_OPTS)
 endef
 
 define IPUTILS_INSTALL_TARGET_CMDS
diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 4eb0b07..f533a45 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -10,18 +10,18 @@ IW_SITE = $(BR2_KERNEL_MIRROR)/software/network/iw
 IW_LICENSE = iw license
 IW_LICENSE_FILES = COPYING
 IW_DEPENDENCIES = host-pkgconf libnl
-IW_MAKE_OPT = CC="$(TARGET_CC)" LD="$(TARGET_LD)" LDFLAGS="$(TARGET_LDFLAGS)"
+IW_MAKE_OPTS = CC="$(TARGET_CC)" LD="$(TARGET_LD)" LDFLAGS="$(TARGET_LDFLAGS)"
 IW_MAKE_ENV = PKG_CONFIG="$(HOST_DIR)/usr/bin/pkg-config" \
 	GIT_DIR=$(IW_DIR)
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
 # libnl needs pthread/m, so we need to explicitly with them when static
 # these need to added AFTER libnl, so we have to override LIBS completely
-IW_MAKE_OPT += LIBS='-lnl-genl-3 -lnl-3 -lpthread -lm'
+IW_MAKE_OPTS += LIBS='-lnl-genl-3 -lnl-3 -lpthread -lm'
 endif
 
 define IW_BUILD_CMDS
-	$(IW_MAKE_ENV) $(MAKE) $(IW_MAKE_OPT) -C $(@D)
+	$(IW_MAKE_ENV) $(MAKE) $(IW_MAKE_OPTS) -C $(@D)
 endef
 
 define IW_INSTALL_TARGET_CMDS
diff --git a/package/libdnet/libdnet.mk b/package/libdnet/libdnet.mk
index 177ef78..520c409 100644
--- a/package/libdnet/libdnet.mk
+++ b/package/libdnet/libdnet.mk
@@ -17,9 +17,9 @@ LIBDNET_CONF_OPT = \
 ifneq ($(BR2_PACKAGE_LIBDNET_PYTHON),)
 LIBDNET_DEPENDENCIES = python
 LIBDNET_CONF_OPT += --with-python
-LIBDNET_MAKE_OPT = PYINCDIR=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR) PYLIBDIR=$(STAGING_DIR)/usr/lib
-LIBDNET_INSTALL_TARGET_OPT = $(LIBDNET_MAKE_OPT) DESTDIR=$(TARGET_DIR) INSTALL_STRIP_FLAG=-s install-exec
-LIBDNET_INSTALL_STAGING_OPT = $(LIBDNET_MAKE_OPT) DESTDIR=$(STAGING_DIR) install
+LIBDNET_MAKE_OPTS = PYINCDIR=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR) PYLIBDIR=$(STAGING_DIR)/usr/lib
+LIBDNET_INSTALL_TARGET_OPT = $(LIBDNET_MAKE_OPTS) DESTDIR=$(TARGET_DIR) INSTALL_STRIP_FLAG=-s install-exec
+LIBDNET_INSTALL_STAGING_OPT = $(LIBDNET_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
 endif
 
 # Needed for autoreconf to work properly
diff --git a/package/libjson/libjson.mk b/package/libjson/libjson.mk
index dc30b50..cfb839d 100644
--- a/package/libjson/libjson.mk
+++ b/package/libjson/libjson.mk
@@ -14,13 +14,13 @@ LIBJSON_LICENSE_FILES = License.txt
 LIBJSON_CXXFLAGS = $(TARGET_CFLAGS) -DNDEBUG
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
-LIBJSON_MAKE_OPT += SHARED=0
+LIBJSON_MAKE_OPTS += SHARED=0
 else
-LIBJSON_MAKE_OPT += SHARED=1
+LIBJSON_MAKE_OPTS += SHARED=1
 LIBJSON_CXXFLAGS += -fPIC
 endif
 
-LIBJSON_MAKE_OPT += BUILD_TYPE= CXXFLAGS="$(LIBJSON_CXXFLAGS)"
+LIBJSON_MAKE_OPTS += BUILD_TYPE= CXXFLAGS="$(LIBJSON_CXXFLAGS)"
 
 define LIBJSON_EXTRACT_CMDS
 	unzip -d $(@D) $(DL_DIR)/$(LIBJSON_SOURCE)
@@ -33,17 +33,17 @@ define LIBJSON_BUILD_CMDS
 	mkdir -p $(@D)/Objects_$(if $(BR2_PREFER_STATIC_LIB),static,shared) \
 		$(@D)/_internal/Source/Dependencies
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		$(LIBJSON_MAKE_OPT) -C $(@D)
+		$(LIBJSON_MAKE_OPTS) -C $(@D)
 endef
 
 define LIBJSON_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		$(LIBJSON_MAKE_OPT) prefix=$(TARGET_DIR)/usr install -C $(@D)
+		$(LIBJSON_MAKE_OPTS) prefix=$(TARGET_DIR)/usr install -C $(@D)
 endef
 
 define LIBJSON_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		$(LIBJSON_MAKE_OPT) prefix=$(STAGING_DIR)/usr install -C $(@D)
+		$(LIBJSON_MAKE_OPTS) prefix=$(STAGING_DIR)/usr install -C $(@D)
 endef
 
 $(eval $(generic-package))
diff --git a/package/libseccomp/libseccomp.mk b/package/libseccomp/libseccomp.mk
index 3002388..5340b06 100644
--- a/package/libseccomp/libseccomp.mk
+++ b/package/libseccomp/libseccomp.mk
@@ -13,7 +13,7 @@ LIBSECCOMP_INSTALL_STAGING = YES
 # Needed for configure to find our system headers:
 LIBSECCOMP_CONF_ENV            = SYSROOT=$(STAGING_DIR)
 LIBSECCOMP_MAKE_ENV            = $(TARGET_CONFIGURE_OPTS)
-LIBSECCOMP_MAKE_OPT            = SUBDIRS_BUILD=src
+LIBSECCOMP_MAKE_OPTS            = SUBDIRS_BUILD=src
 LIBSECCOMP_INSTALL_STAGING_OPT = SUBDIRS_BUILD=src SUBDIRS_INSTALL="src include" DESTDIR=$(STAGING_DIR) install
 LIBSECCOMP_INSTALL_TARGET_OPT  = SUBDIRS_BUILD=src SUBDIRS_INSTALL="src include" DESTDIR=$(TARGET_DIR) install
 
diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index 2eae3bb..f9dd757 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -23,7 +23,7 @@ LINUX_PAM_LICENSE_FILES = Copyright
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 	LINUX_PAM_DEPENDENCIES += gettext
-	LINUX_PAM_MAKE_OPT += LIBS=-lintl
+	LINUX_PAM_MAKE_OPTS += LIBS=-lintl
 endif
 
 # Install default pam config (deny everything)
diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
index 61e1c73..3bd111e 100644
--- a/package/lm-sensors/lm-sensors.mk
+++ b/package/lm-sensors/lm-sensors.mk
@@ -20,28 +20,28 @@ LM_SENSORS_BINS_$(BR2_PACKAGE_LM_SENSORS_ISASET) += sbin/isaset
 LM_SENSORS_BINS_$(BR2_PACKAGE_LM_SENSORS_PWMCONFIG) += sbin/pwmconfig
 LM_SENSORS_BINS_$(BR2_PACKAGE_LM_SENSORS_SENSORS_DETECT) += sbin/sensors-detect
 
-LM_SENSORS_MAKE_OPT = \
+LM_SENSORS_MAKE_OPTS = \
 	BUILD_STATIC_LIB=1 \
 	MACHINE=$(KERNEL_ARCH) \
 	PREFIX=/usr
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
-LM_SENSORS_MAKE_OPT += BUILD_SHARED_LIB=0
+LM_SENSORS_MAKE_OPTS += BUILD_SHARED_LIB=0
 else
-LM_SENSORS_MAKE_OPT += BUILD_SHARED_LIB=1
+LM_SENSORS_MAKE_OPTS += BUILD_SHARED_LIB=1
 endif
 
 define LM_SENSORS_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(LM_SENSORS_MAKE_OPT) -C $(@D)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(LM_SENSORS_MAKE_OPTS) -C $(@D)
 endef
 
 define LM_SENSORS_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D) $(LM_SENSORS_MAKE_OPT) DESTDIR=$(STAGING_DIR) install
+	$(MAKE) -C $(@D) $(LM_SENSORS_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
 	rm -f $(addprefix $(STAGING_DIR)/usr/,$(LM_SENSORS_BINS_) $(LM_SENSORS_BINS_y))
 endef
 
 define LM_SENSORS_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) $(LM_SENSORS_MAKE_OPT) DESTDIR=$(TARGET_DIR) install
+	$(MAKE) -C $(@D) $(LM_SENSORS_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
 	rm -f $(addprefix $(TARGET_DIR)/usr/,$(LM_SENSORS_BINS_))
 endef
 
diff --git a/package/lshw/lshw.mk b/package/lshw/lshw.mk
index ee15350..e0c81d4 100644
--- a/package/lshw/lshw.mk
+++ b/package/lshw/lshw.mk
@@ -14,18 +14,18 @@ ifeq ($(BR2_ENABLE_LOCALE),)
 LSHW_CFLAGS += -DNONLS
 endif
 
-LSHW_MAKE_OPT = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" AR="$(TARGET_AR)" \
+LSHW_MAKE_OPTS = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" AR="$(TARGET_AR)" \
 	RPM_OPT_FLAGS="$(LSHW_CFLAGS)" all
 LSHW_MAKE_ENV = LIBS="$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),-lintl)"
 LSHW_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 
 define LSHW_BUILD_CMDS
-	$(LSHW_MAKE_ENV) $(MAKE) -C $(@D)/src $(LSHW_MAKE_OPT)
+	$(LSHW_MAKE_ENV) $(MAKE) -C $(@D)/src $(LSHW_MAKE_OPTS)
 endef
 
 define LSHW_INSTALL_TARGET_CMDS
 	$(LSHW_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) \
-		$(LSHW_MAKE_OPT) install
+		$(LSHW_MAKE_OPTS) install
 endef
 
 $(eval $(generic-package))
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 612f92f..a7ef514 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -32,7 +32,7 @@ LVM2_CONF_OPT += --disable-readline
 endif
 
 ifeq ($(BR2_PACKAGE_LVM2_STANDARD_INSTALL),)
-LVM2_MAKE_OPT = device-mapper
+LVM2_MAKE_OPTS = device-mapper
 LVM2_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install_device-mapper
 LVM2_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install_device-mapper
 endif
diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index 01fc77a..6c57976 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -10,7 +10,7 @@ MDADM_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/raid/mdadm
 MDADM_LICENSE = GPLv2+
 MDADM_LICENSE_FILES = COPYING
 
-MDADM_MAKE_OPT = \
+MDADM_MAKE_OPTS = \
 	CFLAGS="$(TARGET_CFLAGS)" CC="$(TARGET_CC)" CHECK_RUN_DIR=0 -C $(MDADM_DIR) mdadm
 
 MDADM_INSTALL_TARGET_OPT = \
diff --git a/package/mii-diag/mii-diag.mk b/package/mii-diag/mii-diag.mk
index 7a7bc7f..a0e4dcf 100644
--- a/package/mii-diag/mii-diag.mk
+++ b/package/mii-diag/mii-diag.mk
@@ -11,7 +11,7 @@ MII_DIAG_SITE    = $(BR2_DEBIAN_MIRROR)/debian/pool/main/m/mii-diag
 MII_DIAG_LICENSE = GPL # No version specified
 MII_DIAG_LICENSE_FILES = mii-diag.c
 
-MII_DIAG_MAKE_OPT = $(TARGET_CONFIGURE_OPTS)
+MII_DIAG_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS)
 
 define MII_DIAG_DEBIAN_PATCHES
 	if [ -d $(@D)/debian/patches ]; then \
@@ -22,7 +22,7 @@ endef
 MII_DIAG_POST_PATCH_HOOKS = MII_DIAG_DEBIAN_PATCHES
 
 define MII_DIAG_BUILD_CMDS
-	$(MAKE) $(MII_DIAG_MAKE_OPT) -C $(@D) mii-diag
+	$(MAKE) $(MII_DIAG_MAKE_OPTS) -C $(@D) mii-diag
 endef
 
 define MII_DIAG_INSTALL_TARGET_CMDS
diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
index 52d88fe..3d23247 100644
--- a/package/mpfr/mpfr.mk
+++ b/package/mpfr/mpfr.mk
@@ -11,7 +11,7 @@ MPFR_LICENSE = LGPLv3+
 MPFR_LICENSE_FILES = COPYING.LESSER
 MPFR_INSTALL_STAGING = YES
 MPFR_DEPENDENCIES = gmp
-MPFR_MAKE_OPT = RANLIB=$(TARGET_RANLIB)
+MPFR_MAKE_OPTS = RANLIB=$(TARGET_RANLIB)
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/openswan/openswan.mk b/package/openswan/openswan.mk
index ce5bdfb..ca29daa 100644
--- a/package/openswan/openswan.mk
+++ b/package/openswan/openswan.mk
@@ -10,31 +10,31 @@ OPENSWAN_LICENSE = GPLv2+, BSD-3c
 OPENSWAN_LICENSE_FILES = COPYING LICENSE
 
 OPENSWAN_DEPENDENCIES = host-bison host-flex gmp iproute2
-OPENSWAN_MAKE_OPT = ARCH=$(BR2_ARCH) CC="$(TARGET_CC)" \
+OPENSWAN_MAKE_OPTS = ARCH=$(BR2_ARCH) CC="$(TARGET_CC)" \
 	USERCOMPILE="$(TARGET_CFLAGS) -fPIE" INC_USRLOCAL=/usr \
 	USE_KLIPS=false USE_MAST=false USE_NM=false
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 	OPENSWAN_DEPENDENCIES += libcurl
-	OPENSWAN_MAKE_OPT += USE_LIBCURL=true
+	OPENSWAN_MAKE_OPTS += USE_LIBCURL=true
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	OPENSWAN_DEPENDENCIES += openssl
-	OPENSWAN_MAKE_OPT += HAVE_OPENSSL=true
+	OPENSWAN_MAKE_OPTS += HAVE_OPENSSL=true
 ifeq ($(BR2_PACKAGE_OCF_LINUX),y)
-	OPENSWAN_MAKE_OPT += HAVE_OCF=true
+	OPENSWAN_MAKE_OPTS += HAVE_OCF=true
 endif
 endif
 
 define OPENSWAN_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-		$(OPENSWAN_MAKE_OPT) programs
+		$(OPENSWAN_MAKE_OPTS) programs
 endef
 
 define OPENSWAN_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-		$(OPENSWAN_MAKE_OPT) DESTDIR=$(TARGET_DIR) install
+		$(OPENSWAN_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
 endef
 
 $(eval $(generic-package))
diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
index 9191643..b626ad1 100644
--- a/package/openvmtools/openvmtools.mk
+++ b/package/openvmtools/openvmtools.mk
@@ -41,7 +41,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_OPENVMTOOLS_PAM),y)
 OPENVMTOOLS_CONF_OPT += --with-pam
-OPENVMTOOLS_MAKE_OPT += CFLAGS+="-Wno-unused-local-typedefs"
+OPENVMTOOLS_MAKE_OPTS += CFLAGS+="-Wno-unused-local-typedefs"
 OPENVMTOOLS_DEPENDENCIES += linux-pam
 else
 OPENVMTOOLS_CONF_OPT += --without-pam
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 4404f15..1884d4d 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -106,7 +106,7 @@ endif
 $(2)_CONF_ENV			?=
 $(2)_CONF_OPT			?=
 $(2)_MAKE_ENV			?=
-$(2)_MAKE_OPT			?=
+$(2)_MAKE_OPTS			?=
 $(2)_INSTALL_OPT                ?= install
 $(2)_INSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) install
 $(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR)  install
@@ -270,11 +270,11 @@ endif
 ifndef $(2)_BUILD_CMDS
 ifeq ($(4),target)
 define $(2)_BUILD_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) -C $$($$(PKG)_SRCDIR)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_SRCDIR)
 endef
 else
 define $(2)_BUILD_CMDS
-	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) -C $$($$(PKG)_SRCDIR)
+	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_SRCDIR)
 endef
 endif
 endif
diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 2006b76..f146d51 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -40,7 +40,7 @@ $(2)_CONF_ENV			?=
 $(2)_CONF_OPT			?=
 $(2)_MAKE			?= $$(MAKE)
 $(2)_MAKE_ENV			?=
-$(2)_MAKE_OPT			?=
+$(2)_MAKE_OPTS			?=
 $(2)_INSTALL_HOST_OPT		?= install
 $(2)_INSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) install
 $(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR) install
@@ -111,11 +111,11 @@ $(2)_DEPENDENCIES += host-cmake
 ifndef $(2)_BUILD_CMDS
 ifeq ($(4),target)
 define $(2)_BUILD_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) -C $$($$(PKG)_BUILDDIR)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_BUILDDIR)
 endef
 else
 define $(2)_BUILD_CMDS
-	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) -C $$($$(PKG)_BUILDDIR)
+	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) -C $$($$(PKG)_BUILDDIR)
 endef
 endif
 endif
@@ -126,7 +126,7 @@ endif
 #
 ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
-	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) $$($$(PKG)_INSTALL_HOST_OPT) -C $$($$(PKG)_BUILDDIR)
+	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_HOST_OPT) -C $$($$(PKG)_BUILDDIR)
 endef
 endif
 
@@ -136,7 +136,7 @@ endif
 #
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) $$($$(PKG)_INSTALL_STAGING_OPT) -C $$($$(PKG)_BUILDDIR)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_STAGING_OPT) -C $$($$(PKG)_BUILDDIR)
 endef
 endif
 
@@ -146,7 +146,7 @@ endif
 #
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) $$($$(PKG)_INSTALL_TARGET_OPT) -C $$($$(PKG)_BUILDDIR)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPTS) $$($$(PKG)_INSTALL_TARGET_OPT) -C $$($$(PKG)_BUILDDIR)
 endef
 endif
 
diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 46caa36..eb06eec 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -19,11 +19,11 @@ PPPD_RADIUS_CONF = dictionary dictionary.ascend dictionary.compat \
 
 ifeq ($(BR2_PACKAGE_PPPD_FILTER),y)
 	PPPD_DEPENDENCIES += libpcap
-	PPPD_MAKE_OPT += FILTER=y
+	PPPD_MAKE_OPTS += FILTER=y
 endif
 
 ifeq ($(BR2_INET_IPV6),y)
-	PPPD_MAKE_OPT += HAVE_INET6=y
+	PPPD_MAKE_OPTS += HAVE_INET6=y
 endif
 
 # pppd bundles some but not all of the needed kernel headers. The embedded
@@ -43,7 +43,7 @@ endef
 
 define PPPD_BUILD_CMDS
 	$(MAKE) CC="$(TARGET_CC)" COPTS="$(TARGET_CFLAGS)" \
-		-C $(@D) $(PPPD_MAKE_OPT)
+		-C $(@D) $(PPPD_MAKE_OPTS)
 endef
 
 ifeq ($(BR2_PACKAGE_PPPD_RADIUS),y)
@@ -94,7 +94,7 @@ define PPPD_INSTALL_TARGET_CMDS
 endef
 
 define PPPD_INSTALL_STAGING_CMDS
-	$(MAKE) INSTROOT=$(STAGING_DIR)/ -C $(@D) $(PPPD_MAKE_OPT) install-devel
+	$(MAKE) INSTROOT=$(STAGING_DIR)/ -C $(@D) $(PPPD_MAKE_OPTS) install-devel
 endef
 
 $(eval $(generic-package))
diff --git a/package/pv/pv.mk b/package/pv/pv.mk
index 0ba8f5f..095b0d6 100644
--- a/package/pv/pv.mk
+++ b/package/pv/pv.mk
@@ -23,7 +23,7 @@ PV_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext host-gettext)
 # configuration, as the ld default emulation may not necessarily be
 # the correct one. By passing the below values for LD and LDFLAGS, we
 # ensure that 'gcc' is used to do these partial linking steps.
-PV_MAKE_OPT = \
+PV_MAKE_OPTS = \
 	LD="$(TARGET_CC)" \
 	LDFLAGS="-Wl,-r -nostdlib"
 
diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index 1cc96d7..df049af 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -24,7 +24,7 @@ QUOTA_CFLAGS += -I$(STAGING_DIR)/usr/include/tirpc/
 QUOTA_LDFLAGS += -ltirpc
 endif
 
-QUOTA_MAKE_OPT = $(TARGET_CONFIGURE_OPTS) CFLAGS="$(QUOTA_CFLAGS) -D_GNU_SOURCE" LDFLAGS="$(QUOTA_LDFLAGS)"
+QUOTA_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) CFLAGS="$(QUOTA_CFLAGS) -D_GNU_SOURCE" LDFLAGS="$(QUOTA_LDFLAGS)"
 QUOTA_CONF_ENV = \
 	CFLAGS="$(QUOTA_CFLAGS) -D_GNU_SOURCE" LDFLAGS="$(QUOTA_LDFLAGS)"
 
diff --git a/package/rp-pppoe/rp-pppoe.mk b/package/rp-pppoe/rp-pppoe.mk
index fde1e61..2497446 100644
--- a/package/rp-pppoe/rp-pppoe.mk
+++ b/package/rp-pppoe/rp-pppoe.mk
@@ -11,7 +11,7 @@ RP_PPPOE_LICENSE_FILES = doc/LICENSE
 RP_PPPOE_DEPENDENCIES = pppd
 RP_PPPOE_SUBDIR = src
 RP_PPPOE_TARGET_FILES = pppoe pppoe-server pppoe-relay pppoe-sniff
-RP_PPPOE_MAKE_OPT = PLUGIN_DIR=/usr/lib/pppd/$(PPPD_VERSION)
+RP_PPPOE_MAKE_OPTS = PLUGIN_DIR=/usr/lib/pppd/$(PPPD_VERSION)
 RP_PPPOE_CONF_OPT = --disable-debugging
 RP_PPPOE_CONF_ENV = \
 	rpppoe_cv_pack_bitfields=normal \
diff --git a/package/rubix/rubix.mk b/package/rubix/rubix.mk
index 5427830..675a4d0 100644
--- a/package/rubix/rubix.mk
+++ b/package/rubix/rubix.mk
@@ -11,7 +11,7 @@ RUBIX_INSTALL_TARGET_OPT = GAMESDIR=$(TARGET_DIR)/usr/games install
 RUBIX_LICENSE = Public Domain
 RUBIX_LICENSE_FILES = LICENCE
 
-RUBIX_MAKE_OPT = CC="$(TARGET_CC)" XINC="-I$(STAGING_DIR)/usr/include/X11" XLIB="-L$(STAGING_DIR)/usr/lib -lX11"
+RUBIX_MAKE_OPTS = CC="$(TARGET_CC)" XINC="-I$(STAGING_DIR)/usr/include/X11" XLIB="-L$(STAGING_DIR)/usr/lib -lX11"
 
 RUBIX_DEPENDENCIES = xlib_libX11
 
diff --git a/package/schifra/schifra.mk b/package/schifra/schifra.mk
index 75dc588..96387d3 100644
--- a/package/schifra/schifra.mk
+++ b/package/schifra/schifra.mk
@@ -11,13 +11,13 @@ SCHIFRA_INSTALL_STAGING = YES
 SCHIFRA_LICENSE = schifra license
 SCHIFRA_LICENSE_FILES = schifra_license.txt
 
-SCHIFRA_MAKE_OPT = COMPILER="$(TARGET_CXX)" \
+SCHIFRA_MAKE_OPTS = COMPILER="$(TARGET_CXX)" \
 		   OPTIONS="$(TARGET_CFLAGS) $(TARGET_LDFLAGS) -o"
 
 # The examples are the only buildable artefacts.
 ifeq ($(BR2_PACKAGE_SCHIFRA_EXAMPLES),y)
 define SCHIFRA_BUILD_CMDS
-	$(MAKE) -C $(@D) $(SCHIFRA_MAKE_OPT) all
+	$(MAKE) -C $(@D) $(SCHIFRA_MAKE_OPTS) all
 endef
 
 define SCHIFRA_INSTALL_EXAMPLES
diff --git a/package/sdl_ttf/sdl_ttf.mk b/package/sdl_ttf/sdl_ttf.mk
index c3e8d29..47b55f8 100644
--- a/package/sdl_ttf/sdl_ttf.mk
+++ b/package/sdl_ttf/sdl_ttf.mk
@@ -16,5 +16,5 @@ SDL_TTF_CONF_OPT = --without-x \
 		--with-freetype-prefix=$(STAGING_DIR)/usr \
 		--with-sdl-prefix=$(STAGING_DIR)/usr
 
-SDL_TTF_MAKE_OPT = INCLUDES="-I$(STAGING_DIR)/usr/include/SDL"  LDFLAGS="-L$(STAGING_DIR)/usr/lib"
+SDL_TTF_MAKE_OPTS = INCLUDES="-I$(STAGING_DIR)/usr/include/SDL"  LDFLAGS="-L$(STAGING_DIR)/usr/lib"
 $(eval $(autotools-package))
diff --git a/package/setserial/setserial.mk b/package/setserial/setserial.mk
index 13174be..55be4c1 100644
--- a/package/setserial/setserial.mk
+++ b/package/setserial/setserial.mk
@@ -11,7 +11,7 @@ SETSERIAL_SITE = http://snapshot.debian.org/archive/debian/20131001T214925Z/pool
 SETSERIAL_LICENSE = GPLv2
 SETSERIAL_LICENSE_FILES = debian/copyright
 # make all also builds setserial.cat which needs nroff
-SETSERIAL_MAKE_OPT = setserial
+SETSERIAL_MAKE_OPTS = setserial
 
 define SETSERIAL_APPLY_DEBIAN_PATCHES
 	# Touching gorhack.h is needed for the Debian patch 18 to work
diff --git a/package/speex/speex.mk b/package/speex/speex.mk
index 6eb7e90..92aeb51 100644
--- a/package/speex/speex.mk
+++ b/package/speex/speex.mk
@@ -31,7 +31,7 @@ endef
 SPEEX_POST_CONFIGURE_HOOKS += SPEEX_LIBTOOL_FIXUP
 
 define SPEEX_BUILD_CMDS
-	$($(PKG)_MAKE_ENV) $(MAKE) $($(PKG)_MAKE_OPT) -C $(@D)/$($(PKG)_SUBDIR)
+	$($(PKG)_MAKE_ENV) $(MAKE) $($(PKG)_MAKE_OPTS) -C $(@D)/$($(PKG)_SUBDIR)
 endef
 
 $(eval $(autotools-package))
diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index 9d413fe..56a6da2 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -14,7 +14,7 @@ SYSSTAT_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 SYSSTAT_DEPENDENCIES += gettext
-SYSSTAT_MAKE_OPT += CFLAGS="$(TARGET_CFLAGS) -lintl"
+SYSSTAT_MAKE_OPTS += CFLAGS="$(TARGET_CFLAGS) -lintl"
 endif
 
 # The isag tool is a post processing script that depends on tcl/tk
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index c7cff0d..ea6baaa 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -138,8 +138,8 @@ SYSTEMD_CONF_OPT += --disable-smack
 endif
 
 # mq_getattr needs -lrt
-SYSTEMD_MAKE_OPT += LIBS=-lrt
-SYSTEMD_MAKE_OPT += LDFLAGS+=-ldl
+SYSTEMD_MAKE_OPTS += LIBS=-lrt
+SYSTEMD_MAKE_OPTS += LDFLAGS+=-ldl
 
 define SYSTEMD_INSTALL_INIT_HOOK
 	ln -fs ../lib/systemd/systemd $(TARGET_DIR)/sbin/init
diff --git a/package/tn5250/tn5250.mk b/package/tn5250/tn5250.mk
index 33f7c0c..0ec358b 100644
--- a/package/tn5250/tn5250.mk
+++ b/package/tn5250/tn5250.mk
@@ -6,7 +6,7 @@
 
 TN5250_VERSION = 0.17.4
 TN5250_SITE = http://downloads.sourceforge.net/project/tn5250/tn5250/$(TN5250_VERSION)
-TN5250_MAKE_OPT = CPPFLAGS=""
+TN5250_MAKE_OPTS = CPPFLAGS=""
 TN5250_DEPENDENCIES = ncurses
 TN5250_LICENSE = LGPLv2.1+
 TN5250_LICENSE_FILES = COPYING
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 86770be..6202739 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -44,7 +44,7 @@ endif
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 UTIL_LINUX_DEPENDENCIES += gettext
-UTIL_LINUX_MAKE_OPT += LIBS=-lintl
+UTIL_LINUX_MAKE_OPTS += LIBS=-lintl
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCAP_NG),y)
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index 4c40481..3dbf338 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -10,7 +10,7 @@ WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
 # take precedence over busybox implementation
 WHOIS_DEPENDENCIES = host-gettext $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 WHOIS_MAKE_ENV = $(TARGET_MAKE_ENV)
-WHOIS_MAKE_OPT = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
+WHOIS_MAKE_OPTS = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
 	LIBS="$(WHOIS_EXTRA_LIBS)"
 WHOIS_LICENSE = GPLv2+
 WHOIS_LICENSE_FILES = COPYING
@@ -32,11 +32,11 @@ WHOIS_MAKE_ENV += HAVE_LIBIDN=1
 endif
 
 define WHOIS_BUILD_CMDS
-	$(WHOIS_MAKE_ENV) $(MAKE) $(WHOIS_MAKE_OPT) -C $(@D)
+	$(WHOIS_MAKE_ENV) $(MAKE) $(WHOIS_MAKE_OPTS) -C $(@D)
 endef
 
 define WHOIS_INSTALL_TARGET_CMDS
-	$(WHOIS_MAKE_ENV) $(MAKE) $(WHOIS_MAKE_OPT) \
+	$(WHOIS_MAKE_ENV) $(MAKE) $(WHOIS_MAKE_OPTS) \
 		BASEDIR="$(TARGET_DIR)" install -C $(@D)
 endef
 
diff --git a/package/xinetd/xinetd.mk b/package/xinetd/xinetd.mk
index 34a449f..a269878 100644
--- a/package/xinetd/xinetd.mk
+++ b/package/xinetd/xinetd.mk
@@ -28,6 +28,6 @@ XINETD_CONF_ENV += \
 	CFLAGS="$(XINETD_CFLAGS)" \
 	LIBS="$(XINETD_LIBS)"
 
-XINETD_MAKE_OPT = AR="$(TARGET_AR)"
+XINETD_MAKE_OPTS = AR="$(TARGET_AR)"
 
 $(eval $(autotools-package))
diff --git a/package/zmqpp/zmqpp.mk b/package/zmqpp/zmqpp.mk
index c73a856..fbb0260 100644
--- a/package/zmqpp/zmqpp.mk
+++ b/package/zmqpp/zmqpp.mk
@@ -11,7 +11,7 @@ ZMQPP_DEPENDENCIES = zeromq
 ZMQPP_LICENSE = LGPLv3+ with exceptions
 ZMQPP_LICENSE_FILES = COPYING COPYING.LESSER
 
-ZMQPP_MAKE_OPT = LD="$(TARGET_CXX)" BUILD_PATH=./build PREFIX=/usr
+ZMQPP_MAKE_OPTS = LD="$(TARGET_CXX)" BUILD_PATH=./build PREFIX=/usr
 ZMQPP_LDFLAGS = $(TARGET_LDFLAGS) -lpthread
 
 ifeq ($(BR2_PACKAGE_ZMQPP_CLIENT),y)
@@ -21,19 +21,19 @@ endif
 define ZMQPP_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
 		LDFLAGS="$(ZMQPP_LDFLAGS)" \
-		$(ZMQPP_MAKE_OPT) $(if $(BR2_PACKAGE_ZMQPP_CLIENT),all) -C $(@D)
+		$(ZMQPP_MAKE_OPTS) $(if $(BR2_PACKAGE_ZMQPP_CLIENT),all) -C $(@D)
 endef
 
 define ZMQPP_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -d $(TARGET_DIR)/usr/include/zmqpp
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		$(ZMQPP_MAKE_OPT) DESTDIR=$(TARGET_DIR) install -C $(@D)
+		$(ZMQPP_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install -C $(@D)
 endef
 
 define ZMQPP_INSTALL_STAGING_CMDS
 	$(INSTALL) -m 0755 -d $(STAGING_DIR)/usr/include/zmqpp
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		$(ZMQPP_MAKE_OPT) DESTDIR=$(STAGING_DIR) install -C $(@D)
+		$(ZMQPP_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install -C $(@D)
 endef
 
 $(eval $(generic-package))
diff --git a/package/zxing/zxing.mk b/package/zxing/zxing.mk
index 5942167..7d30cc3 100644
--- a/package/zxing/zxing.mk
+++ b/package/zxing/zxing.mk
@@ -17,7 +17,7 @@ ZXING_DEPENDENCIES += libiconv
 else
 # There is no locale support in the toolchain and libiconv
 # is not available so disable iconv support in zxing
-ZING_MAKE_OPT=CXXFLAGS+="-DNO_ICONV"
+ZING_MAKE_OPTS=CXXFLAGS+="-DNO_ICONV"
 endif
 endif
 
@@ -26,7 +26,7 @@ define ZXING_EXTRACT_CMDS
 endef
 
 define ZXING_BUILD_CMDS
-	$(MAKE) -C $(@D)/cpp/core/src $(TARGET_CONFIGURE_OPTS) $(ZING_MAKE_OPT)
+	$(MAKE) -C $(@D)/cpp/core/src $(TARGET_CONFIGURE_OPTS) $(ZING_MAKE_OPTS)
 endef
 
 define ZXING_INSTALL_STAGING_CMDS
