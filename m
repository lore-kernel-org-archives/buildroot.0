Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B3CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 10:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 190064173D;
	Sun, 24 Jul 2022 10:09:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 190064173D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aFIF8id9uFU4; Sun, 24 Jul 2022 10:09:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03C9741523;
	Sun, 24 Jul 2022 10:08:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03C9741523
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 683491BF3DA
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 10:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 419DC41523
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 10:08:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 419DC41523
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0p-lGJVHOYrk for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 10:08:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F73241296
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 10:08:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F73241296
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 7B6A785B30; Sun, 24 Jul 2022 09:55:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 11:30:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b4e706a6e320d5035cf05e8af3c6d9b8bb74fc33
X-Git-Newrev: d9ff62c4cdfdbd73a0c172bc2f6e77c5e6e28048
X-Patchwork-Hint: ignore
Message-Id: <20220724095505.7B6A785B30@busybox.osuosl.org>
Subject: [Buildroot] [git commit] pacakge: drop remnants of $(HOST_DIR)/usr
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1690962657278989000=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1690962657278989000==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d9ff62c4cdfdbd73a0c172bc2f6e77c5e6e28048
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's been ages (5 years at the next release) that we've not installed
host packages in $(HOST_DIR)/usr, but we still have a few packages that
reference it or install things in there.

Drop all of those in one fell swoop.

The run-time test still succeeds, and the following defconfig, which
should exercise all touched packages [*], does build:

    BR2_x86_i686=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_INIT_NONE=y
    BR2_SYSTEM_BIN_SH_NONE=y
    # BR2_PACKAGE_BUSYBOX is not set
    BR2_PACKAGE_GAWK=y
    BR2_PACKAGE_GETTEXT=y
    BR2_PACKAGE_ABOOTIMG=y
    BR2_PACKAGE_DBUS_PYTHON=y
    BR2_PACKAGE_OLA=y
    BR2_PACKAGE_JIMTCL=y
    BR2_PACKAGE_LUA=y
    # BR2_PACKAGE_LUA_32BITS is not set
    BR2_PACKAGE_ARGPARSE=y
    BR2_PACKAGE_PERL=y
    BR2_PACKAGE_PHP=y
    BR2_PACKAGE_PHP_APCU=y
    BR2_PACKAGE_PHP_LUA=y
    BR2_PACKAGE_PHP_PAM=y
    BR2_PACKAGE_PHP_PECL_DBUS=y
    BR2_PACKAGE_PYTHON3=y
    BR2_PACKAGE_PYTHON_CRYPTOGRAPHY=y
    BR2_PACKAGE_PYTHON_PLY=y
    BR2_PACKAGE_PYTHON_PYBIND=y
    BR2_PACKAGE_LIBVA=y
    BR2_PACKAGE_BIND=y
    BR2_PACKAGE_BIND_SERVER=y
    BR2_PACKAGE_BIND_TOOLS=y
    BR2_PACKAGE_APPARMOR=y
    BR2_PACKAGE_APPARMOR_BINUTILS=y
    BR2_PACKAGE_APPARMOR_UTILS=y
    BR2_PACKAGE_APPARMOR_UTILS_EXTRA=y
    BR2_PACKAGE_APPARMOR_PROFILES=y
    BR2_PACKAGE_REFPOLICY=y
    BR2_PACKAGE_URANDOM_SCRIPTS=y
    BR2_PACKAGE_BASH=y
    # embiggen-disk to exercise go
    BR2_PACKAGE_EMBIGGEN_DISK=y
    BR2_TARGET_GRUB2=y
    BR2_TARGET_GRUB2_I386_PC=y
    BR2_TARGET_GRUB2_I386_EFI=y

[*] exceptions:
  - zfs was not tested: it needs a kernel to be built;
  - compiler-rt was not tsted: it needs llvm to be built, that takes
    ages, and other packages already reference the correct location for
    llvm-config, so it was assumed that is OK.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: Anisse Astier <anisse@astier.eu>
Cc: Antoine Tenart <atenart@kernel.org>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Asaf Kahlon <asafka7@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Cc: Christian Stewart <christian@paral.in>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Francois Perrad <francois.perrad@gadz.org>
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>
Cc: Hervé Codina <herve.codina@bootlin.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
Cc: Julien Boibessot <julien.boibessot@armadeus.com>
Cc: Julien Olivain <ju.o@free.fr>
Cc: Matt Weber <matthew.weber@collins.com>
Cc: Nicolas Carrier <nicolas.carrier@orolia.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Vadim Kochan <vadim4j@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>

---
Changes v1 -> v2:
  - fix new instance that have crept in  (Romain)
---
 boot/grub2/grub2.mk                                                 | 2 +-
 package/abootimg/abootimg.mk                                        | 2 +-
 package/bind/bind.mk                                                | 2 +-
 package/compiler-rt/compiler-rt.mk                                  | 2 +-
 package/dbus-python/dbus-python.mk                                  | 6 +++---
 package/gawk/gawk.mk                                                | 2 +-
 package/gettext-tiny/gettext-tiny.mk                                | 2 +-
 package/go/go.mk                                                    | 6 +++---
 package/jimtcl/jimtcl.mk                                            | 6 +++---
 package/libapparmor/libapparmor.mk                                  | 2 +-
 package/libva/libva.mk                                              | 2 +-
 package/lua/lua.mk                                                  | 2 +-
 package/ola/ola.mk                                                  | 4 ++--
 package/openjdk-bin/openjdk-bin.mk                                  | 2 +-
 package/php-apcu/php-apcu.mk                                        | 4 ++--
 package/php-lua/php-lua.mk                                          | 4 ++--
 package/php-pam/php-pam.mk                                          | 4 ++--
 package/php-pecl-dbus/php-pecl-dbus.mk                              | 4 ++--
 package/python-cryptography/python-cryptography.mk                  | 2 +-
 package/python-maturin/python-maturin.mk                            | 2 +-
 package/python-pybind/python-pybind.mk                              | 2 +-
 package/refpolicy/refpolicy.mk                                      | 2 +-
 package/zfs/zfs.mk                                                  | 2 +-
 .../package/python-pybind-example/python-pybind-example.mk          | 2 +-
 24 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index ce0594d1d3..57593330dd 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -157,7 +157,7 @@ define GRUB2_INSTALL_IMAGES_CMDS
 	$(foreach tuple, $(GRUB2_TUPLES-y), \
 		@$(call MESSAGE,Installing $(tuple) to images directory)
 		mkdir -p $(dir $(GRUB2_IMAGE_$(tuple)))
-		$(HOST_DIR)/usr/bin/grub-mkimage \
+		$(HOST_DIR)/bin/grub-mkimage \
 			-d $(@D)/build-$(tuple)/grub-core/ \
 			-O $(tuple) \
 			-o $(GRUB2_IMAGE_$(tuple)) \
diff --git a/package/abootimg/abootimg.mk b/package/abootimg/abootimg.mk
index a07100df5a..ca09e94f16 100644
--- a/package/abootimg/abootimg.mk
+++ b/package/abootimg/abootimg.mk
@@ -27,7 +27,7 @@ define HOST_ABOOTIMG_BUILD_CMDS
 endef
 
 define HOST_ABOOTIMG_INSTALL_CMDS
-	$(INSTALL) -m 0755 $(@D)/abootimg $(HOST_DIR)/usr/bin/abootimg
+	$(INSTALL) -m 0755 $(@D)/abootimg $(HOST_DIR)/bin/abootimg
 endef
 
 $(eval $(generic-package))
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index bd12f7ad31..5eb3e69bed 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -91,7 +91,7 @@ endif
 # Used by dnssec-keymgr
 ifeq ($(BR2_PACKAGE_PYTHON_PLY),y)
 BIND_DEPENDENCIES += host-python-ply
-BIND_CONF_OPTS += --with-python=$(HOST_DIR)/usr/bin/python
+BIND_CONF_OPTS += --with-python=$(HOST_DIR)/bin/python
 else
 BIND_CONF_OPTS += --with-python=no
 endif
diff --git a/package/compiler-rt/compiler-rt.mk b/package/compiler-rt/compiler-rt.mk
index 57f9c26854..c8ea86e899 100644
--- a/package/compiler-rt/compiler-rt.mk
+++ b/package/compiler-rt/compiler-rt.mk
@@ -19,7 +19,7 @@ COMPILER_RT_INSTALL_TARGET = NO
 COMPILER_RT_CONF_OPTS=-DCOMPILER_RT_STANDALONE_BUILD=OFF \
 	-DCOMPILER_RT_STANDALONE_BUILD=ON \
 	-DCOMPILER_RT_DEFAULT_TARGET_TRIPLE=$(GNU_TARGET_NAME) \
-	-DLLVM_CONFIG_PATH=$(HOST_DIR)/usr/bin/llvm-config
+	-DLLVM_CONFIG_PATH=$(HOST_DIR)/bin/llvm-config
 
 # The installation of the target runtime libraries defaults to DESTDIR, however
 # host-clang resources directory needs a link so Clang can find the runtime
diff --git a/package/dbus-python/dbus-python.mk b/package/dbus-python/dbus-python.mk
index d9bb30ed67..16b22d4821 100644
--- a/package/dbus-python/dbus-python.mk
+++ b/package/dbus-python/dbus-python.mk
@@ -20,9 +20,9 @@ DBUS_PYTHON_CONF_ENV = \
 
 HOST_DBUS_PYTHON_CONF_ENV = \
 	PYTHON=$(HOST_DIR)/bin/python3 \
-	PYTHON_INCLUDES="`$(HOST_DIR)/usr/bin/python3-config --includes`" \
-	PYTHON_LIBS="`$(HOST_DIR)/usr/bin/python3-config --ldflags`" \
-	PYTHON_EXTRA_LIBS="`$(HOST_DIR)/usr/bin/python3-config --libs --embed`"
+	PYTHON_INCLUDES="`$(HOST_DIR)/bin/python3-config --includes`" \
+	PYTHON_LIBS="`$(HOST_DIR)/bin/python3-config --ldflags`" \
+	PYTHON_EXTRA_LIBS="`$(HOST_DIR)/bin/python3-config --libs --embed`"
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index b55c74d00a..3a1cec4969 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -40,7 +40,7 @@ endef
 GAWK_POST_INSTALL_TARGET_HOOKS += GAWK_CREATE_SYMLINK
 
 define HOST_GAWK_CREATE_SYMLINK
-	ln -sf gawk $(HOST_DIR)/usr/bin/awk
+	ln -sf gawk $(HOST_DIR)/bin/awk
 endef
 
 HOST_GAWK_POST_INSTALL_HOOKS += HOST_GAWK_CREATE_SYMLINK
diff --git a/package/gettext-tiny/gettext-tiny.mk b/package/gettext-tiny/gettext-tiny.mk
index c297cb1fe5..e2dc563667 100644
--- a/package/gettext-tiny/gettext-tiny.mk
+++ b/package/gettext-tiny/gettext-tiny.mk
@@ -95,7 +95,7 @@ define HOST_GETTEXT_TINY_INSTALL_CMDS
 	$(Q)touch $(HOST_DIR)/share/gettext-tiny/ABOUT-NLS
 
 	# for gettextize
-	ln -sf $(HOST_DIR)/usr/share/gettext-tiny $(HOST_DIR)/usr/share/gettext
+	ln -sf $(HOST_DIR)/share/gettext-tiny $(HOST_DIR)/share/gettext
 endef
 
 # Install simple echo wrapper for gettext tool
diff --git a/package/go/go.mk b/package/go/go.mk
index 6767b1481d..172bf16b6f 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -13,10 +13,10 @@ GO_LICENSE_FILES = LICENSE
 GO_CPE_ID_VENDOR = golang
 
 HOST_GO_DEPENDENCIES = host-go-bootstrap
-HOST_GO_GOPATH = $(HOST_DIR)/usr/share/go-path
-HOST_GO_HOST_CACHE = $(HOST_DIR)/usr/share/host-go-cache
+HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
+HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
 HOST_GO_ROOT = $(HOST_DIR)/lib/go
-HOST_GO_TARGET_CACHE = $(HOST_DIR)/usr/share/go-cache
+HOST_GO_TARGET_CACHE = $(HOST_DIR)/share/go-cache
 
 # We pass an empty GOBIN, otherwise "go install: cannot install
 # cross-compiled binaries when GOBIN is set"
diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
index 2f8e0e6c69..3d68ca8f64 100644
--- a/package/jimtcl/jimtcl.mk
+++ b/package/jimtcl/jimtcl.mk
@@ -92,11 +92,11 @@ endef
 
 define HOST_JIMTCL_INSTALL_CMDS
 	for i in $(JIMTCL_HEADERS_TO_INSTALL); do \
-		cp -a $(@D)/$$i $(HOST_DIR)/usr/include/ || exit 1 ; \
+		cp -a $(@D)/$$i $(HOST_DIR)/include/ || exit 1 ; \
 	done;
 	$(INSTALL) -m 0755 -D $(@D)/libjim.so.$(JIMTCL_VERSION) \
-		$(HOST_DIR)/usr/lib/libjim.so.$(JIMTCL_VERSION)
-	ln -sf libjim.so.$(JIMTCL_VERSION) $(HOST_DIR)/usr/lib/libjim.so
+		$(HOST_DIR)/lib/libjim.so.$(JIMTCL_VERSION)
+	ln -sf libjim.so.$(JIMTCL_VERSION) $(HOST_DIR)/lib/libjim.so
 endef
 
 $(eval $(generic-package))
diff --git a/package/libapparmor/libapparmor.mk b/package/libapparmor/libapparmor.mk
index fcd3a4389b..af59335933 100644
--- a/package/libapparmor/libapparmor.mk
+++ b/package/libapparmor/libapparmor.mk
@@ -31,7 +31,7 @@ ifeq ($(BR2_PACKAGE_PYTHON3),y)
 LIBAPPARMOR_DEPENDENCIES += host-python3 host-python-setuptools host-swig python3
 LIBAPPARMOR_CONF_OPTS += \
 	--with-python \
-	PYTHON=$(HOST_DIR)/usr/bin/python3 \
+	PYTHON=$(HOST_DIR)/bin/python3 \
 	PYTHON_CONFIG=$(STAGING_DIR)/usr/bin/python3-config \
 	SWIG=$(SWIG)
 else
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index f89dac335f..4138daf8b4 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -30,7 +30,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
 LIBVA_DEPENDENCIES += wayland
-LIBVA_CONF_ENV += ac_cv_path_WAYLAND_SCANNER=$(HOST_DIR)/usr/bin/wayland-scanner
+LIBVA_CONF_ENV += ac_cv_path_WAYLAND_SCANNER=$(HOST_DIR)/bin/wayland-scanner
 LIBVA_CONF_OPTS += --enable-wayland
 else
 LIBVA_CONF_OPTS += --disable-wayland
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 09e7b34f7d..01b554eb6b 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -60,7 +60,7 @@ LUA_POST_PATCH_HOOKS += LUA_32BITS_LUACONF
 endif
 
 define HOST_LUA_LUACONF
-	$(SED) 's|#define LUA_ROOT.*|#define LUA_ROOT "$(HOST_DIR)/usr/"|' $(@D)/src/luaconf.h
+	$(SED) 's|#define LUA_ROOT.*|#define LUA_ROOT "$(HOST_DIR)/"|' $(@D)/src/luaconf.h
 endef
 HOST_LUA_POST_PATCH_HOOKS += HOST_LUA_LUACONF
 
diff --git a/package/ola/ola.mk b/package/ola/ola.mk
index 6600de797e..82615e8155 100644
--- a/package/ola/ola.mk
+++ b/package/ola/ola.mk
@@ -24,7 +24,7 @@ OLA_CONF_OPTS = \
 	--disable-root-check \
 	--disable-tcmalloc \
 	--disable-unittests \
-	--with-ola-protoc-plugin=$(HOST_DIR)/usr/bin/ola_protoc_plugin
+	--with-ola-protoc-plugin=$(HOST_DIR)/bin/ola_protoc_plugin
 
 HOST_OLA_DEPENDENCIES = host-util-linux host-protobuf host-bison host-flex
 
@@ -47,7 +47,7 @@ HOST_OLA_CONF_OPTS = \
 # only.
 HOST_OLA_MAKE_OPTS = protoc/ola_protoc_plugin
 define HOST_OLA_INSTALL_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/protoc/ola_protoc_plugin $(HOST_DIR)/usr/bin/ola_protoc_plugin
+	$(INSTALL) -D -m 0755 $(@D)/protoc/ola_protoc_plugin $(HOST_DIR)/bin/ola_protoc_plugin
 endef
 
 # sets where to find python libs built for target and required by ola
diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index 5cb6e3ba6a..608a0bc3ac 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -26,7 +26,7 @@ HOST_OPENJDK_BIN_SITE = https://github.com/adoptium/temurin$(HOST_OPENJDK_BIN_VE
 HOST_OPENJDK_BIN_LICENSE = GPL-2.0+ with exception
 HOST_OPENJDK_BIN_LICENSE_FILES = legal/java.prefs/LICENSE legal/java.prefs/ASSEMBLY_EXCEPTION
 
-HOST_OPENJDK_BIN_ROOT_DIR = $(HOST_DIR)/usr/lib/jvm
+HOST_OPENJDK_BIN_ROOT_DIR = $(HOST_DIR)/lib/jvm
 
 # unpack200 has an invalid RPATH and relies on libzlib. When
 # host-libzlib is installed on the system, the error "ERROR: package
diff --git a/package/php-apcu/php-apcu.mk b/package/php-apcu/php-apcu.mk
index 3ac062e772..d381c9054f 100644
--- a/package/php-apcu/php-apcu.mk
+++ b/package/php-apcu/php-apcu.mk
@@ -16,8 +16,8 @@ PHP_APCU_CONF_OPTS = \
 
 define PHP_APCU_PHPIZE
 	(cd $(@D); \
-		PHP_AUTOCONF=$(HOST_DIR)/usr/bin/autoconf \
-		PHP_AUTOHEADER=$(HOST_DIR)/usr/bin/autoheader \
+		PHP_AUTOCONF=$(HOST_DIR)/bin/autoconf \
+		PHP_AUTOHEADER=$(HOST_DIR)/bin/autoheader \
 		$(STAGING_DIR)/usr/bin/phpize)
 endef
 PHP_APCU_PRE_CONFIGURE_HOOKS += PHP_APCU_PHPIZE
diff --git a/package/php-lua/php-lua.mk b/package/php-lua/php-lua.mk
index 529b347e42..559bd59209 100644
--- a/package/php-lua/php-lua.mk
+++ b/package/php-lua/php-lua.mk
@@ -30,8 +30,8 @@ endif
 
 define PHP_LUA_PHPIZE
 	(cd $(@D); \
-		PHP_AUTOCONF=$(HOST_DIR)/usr/bin/autoconf \
-		PHP_AUTOHEADER=$(HOST_DIR)/usr/bin/autoheader \
+		PHP_AUTOCONF=$(HOST_DIR)/bin/autoconf \
+		PHP_AUTOHEADER=$(HOST_DIR)/bin/autoheader \
 		$(STAGING_DIR)/usr/bin/phpize)
 endef
 PHP_LUA_PRE_CONFIGURE_HOOKS += PHP_LUA_PHPIZE
diff --git a/package/php-pam/php-pam.mk b/package/php-pam/php-pam.mk
index 8e20095d86..c35ad4f5d0 100644
--- a/package/php-pam/php-pam.mk
+++ b/package/php-pam/php-pam.mk
@@ -17,8 +17,8 @@ PHP_PAM_CONF_OPTS = \
 
 define PHP_PAM_PHPIZE
 	(cd $(@D); \
-		PHP_AUTOCONF=$(HOST_DIR)/usr/bin/autoconf \
-		PHP_AUTOHEADER=$(HOST_DIR)/usr/bin/autoheader \
+		PHP_AUTOCONF=$(HOST_DIR)/bin/autoconf \
+		PHP_AUTOHEADER=$(HOST_DIR)/bin/autoheader \
 		$(STAGING_DIR)/usr/bin/phpize)
 endef
 PHP_PAM_PRE_CONFIGURE_HOOKS += PHP_PAM_PHPIZE
diff --git a/package/php-pecl-dbus/php-pecl-dbus.mk b/package/php-pecl-dbus/php-pecl-dbus.mk
index 456d662554..a70a2e7ae1 100644
--- a/package/php-pecl-dbus/php-pecl-dbus.mk
+++ b/package/php-pecl-dbus/php-pecl-dbus.mk
@@ -15,8 +15,8 @@ PHP_PECL_DBUS_CONF_OPTS = \
 
 define PHP_PECL_DBUS_PHPIZE
 	(cd $(@D); \
-		PHP_AUTOCONF=$(HOST_DIR)/usr/bin/autoconf \
-		PHP_AUTOHEADER=$(HOST_DIR)/usr/bin/autoheader \
+		PHP_AUTOCONF=$(HOST_DIR)/bin/autoconf \
+		PHP_AUTOHEADER=$(HOST_DIR)/bin/autoheader \
 		$(STAGING_DIR)/usr/bin/phpize)
 endef
 PHP_PECL_DBUS_PRE_CONFIGURE_HOOKS += PHP_PECL_DBUS_PHPIZE
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index 99eba3eeab..582a7f7891 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -27,7 +27,7 @@ PYTHON_CRYPTOGRAPHY_ENV = \
 	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
 HOST_PYTHON_CRYPTOGRAPHY_ENV = \
 	$(HOST_PKG_CARGO_ENV) \
-	PYO3_CROSS_LIB_DIR="$(HOST_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
+	PYO3_CROSS_LIB_DIR="$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)"
 # We need to vendor the Cargo crates at download time
 PYTHON_CRYPTOGRAPHY_DOWNLOAD_POST_PROCESS = cargo
 PYTHON_CRYPTOGRAPHY_DOWNLOAD_DEPENDENCIES = host-rustc
diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
index 3d5ba70391..9ac11f264b 100644
--- a/package/python-maturin/python-maturin.mk
+++ b/package/python-maturin/python-maturin.mk
@@ -16,7 +16,7 @@ HOST_PYTHON_MATURIN_DEPENDENCIES = \
 	host-rustc
 HOST_PYTHON_MATURIN_ENV = \
 	$(HOST_PKG_CARGO_ENV) \
-	PYO3_CROSS_LIB_DIR="$(HOST_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
+	PYO3_CROSS_LIB_DIR="$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)"
 # We need to vendor the Cargo crates at download time
 PYTHON_MATURIN_DOWNLOAD_POST_PROCESS = cargo
 PYTHON_MATURIN_DOWNLOAD_DEPENDENCIES = host-rustc
diff --git a/package/python-pybind/python-pybind.mk b/package/python-pybind/python-pybind.mk
index 7448d246b2..05fc593346 100644
--- a/package/python-pybind/python-pybind.mk
+++ b/package/python-pybind/python-pybind.mk
@@ -17,7 +17,7 @@ PYTHON_PYBIND_CONF_OPTS = \
 	-DPYBIND11_TEST=OFF \
 	-DPYBIND11_NOPYTHON=ON
 
-PYTHON_PYBIND_INSTALL_PATH = $(HOST_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/pybind11
+PYTHON_PYBIND_INSTALL_PATH = $(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/pybind11
 
 define PYTHON_PYBIND_INSTALL_MODULE
 	mkdir -p $(PYTHON_PYBIND_INSTALL_PATH)
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index 44c50af278..f11b72755a 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -30,7 +30,7 @@ endif
 
 # Cannot use multiple threads to build the reference policy
 REFPOLICY_MAKE = \
-	PYTHON=$(HOST_DIR)/usr/bin/python3 \
+	PYTHON=$(HOST_DIR)/bin/python3 \
 	XMLLINT=$(LIBXML2_HOST_BINARY) \
 	TEST_TOOLCHAIN=$(HOST_DIR) \
 	$(TARGET_MAKE_ENV) \
diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index 0a6e4a3cfa..900a72f997 100644
--- a/package/zfs/zfs.mk
+++ b/package/zfs/zfs.mk
@@ -40,7 +40,7 @@ endif
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 ZFS_DEPENDENCIES += python3 python-setuptools host-python-cffi host-python-packaging
 ZFS_CONF_ENV += \
-	PYTHON=$(HOST_DIR)/usr/bin/python3 \
+	PYTHON=$(HOST_DIR)/bin/python3 \
 	PYTHON_CPPFLAGS="`$(STAGING_DIR)/usr/bin/python3-config --includes`" \
 	PYTHON_LIBS="`$(STAGING_DIR)/usr/bin/python3-config --ldflags`" \
 	PYTHON_EXTRA_LIBS="`$(STAGING_DIR)/usr/bin/python3-config --libs --embed`" \
diff --git a/support/testing/tests/package/br2-external/python-pybind/package/python-pybind-example/python-pybind-example.mk b/support/testing/tests/package/br2-external/python-pybind/package/python-pybind-example/python-pybind-example.mk
index a6d7e0daaf..6620e70410 100644
--- a/support/testing/tests/package/br2-external/python-pybind/package/python-pybind-example/python-pybind-example.mk
+++ b/support/testing/tests/package/br2-external/python-pybind/package/python-pybind-example/python-pybind-example.mk
@@ -10,7 +10,7 @@
 PYTHON_PYBIND_EXAMPLE_DEPENDENCIES = python-pybind
 
 PYTHON_PYBIND_EXAMPLE_PYBIND_INCLUDE = \
-	$(shell $(HOST_DIR)/usr/bin/python3 -c 'import pybind11; print(pybind11.get_include())')
+	$(shell $(HOST_DIR)/bin/python3 -c 'import pybind11; print(pybind11.get_include())')
 
 PYTHON_PYBIND_EXAMPLE_CXX_FLAGS = \
 	$(TARGET_CXXFLAGS) \

--===============1690962657278989000==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1690962657278989000==--
