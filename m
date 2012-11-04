From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 4 Nov 2012 01:08:49 +0100
Subject: [Buildroot] [git commit] uClibc: use the Buildroot toolchain
	options instead of the hidden common options
Message-ID: <20121104090717.0E0C599929@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6ee99c01d9195e886232bd8b0589495d2540640c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since we are some day going to finally rename the badly named common
toolchain options (BR2_USE_WCHAR, BR2_ENABLE_LOCALE, BR2_INET_RPC,
etc.) into something more logical, let's start using the Buildroot
toolchain options in the uClibc code.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/uClibc/uclibc.mk |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 397cdd4..8cf59bc 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -230,19 +230,19 @@ ifneq ($(UCLIBC_TARGET_ENDIAN),)
 		-e 's/.*\(ARCH_WANTS_$(UCLIBC_TARGET_ENDIAN)_ENDIAN\).*/\1=y/g' \
 		$(UCLIBC_DIR)/.oldconfig
 endif
-ifeq ($(BR2_LARGEFILE),y)
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_LARGEFILE),y)
 	$(SED) 's,.*UCLIBC_HAS_LFS.*,UCLIBC_HAS_LFS=y,g' $(UCLIBC_DIR)/.oldconfig
 else
 	$(SED) 's,.*UCLIBC_HAS_LFS.*,UCLIBC_HAS_LFS=n,g' $(UCLIBC_DIR)/.oldconfig
 	$(SED) '/.*UCLIBC_HAS_FOPEN_LARGEFILE_MODE.*/d' $(UCLIBC_DIR)/.oldconfig
 	echo "# UCLIBC_HAS_FOPEN_LARGEFILE_MODE is not set" >> $(UCLIBC_DIR)/.oldconfig
 endif
-ifeq ($(BR2_INET_IPV6),y)
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_INET_IPV6),y)
 	$(SED) 's,^.*UCLIBC_HAS_IPV6.*,UCLIBC_HAS_IPV6=y,g' $(UCLIBC_DIR)/.oldconfig
 else
 	$(SED) 's,^.*UCLIBC_HAS_IPV6.*,UCLIBC_HAS_IPV6=n,g' $(UCLIBC_DIR)/.oldconfig
 endif
-ifeq ($(BR2_INET_RPC),y)
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_INET_RPC),y)
 	$(SED) 's,^.*UCLIBC_HAS_RPC.*,UCLIBC_HAS_RPC=y,g' \
 		-e 's,^.*UCLIBC_HAS_FULL_RPC.*,UCLIBC_HAS_FULL_RPC=y,g' \
 		-e 's,^.*UCLIBC_HAS_REENTRANT_RPC.*,UCLIBC_HAS_REENTRANT_RPC=y,g' \
@@ -302,12 +302,12 @@ ifeq ($(BR2_PTHREAD_DEBUG),y)
 else
 	echo "# PTHREADS_DEBUG_SUPPORT is not set" >> $(UCLIBC_DIR)/.oldconfig
 endif
-ifeq ($(BR2_ENABLE_LOCALE),y)
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_LOCALE),y)
 	$(SED) 's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=y\n# UCLIBC_BUILD_ALL_LOCALE is not set\nUCLIBC_BUILD_MINIMAL_LOCALE=y\nUCLIBC_BUILD_MINIMAL_LOCALES="$(UCLIBC_LOCALES)"\nUCLIBC_PREGENERATED_LOCALE_DATA=n\nUCLIBC_DOWNLOAD_PREGENERATED_LOCALE_DATA=n\nUCLIBC_HAS_XLOCALE=y\nUCLIBC_HAS_GLIBC_DIGIT_GROUPING=n\n,g' $(UCLIBC_DIR)/.oldconfig
 else
 	$(SED) 's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=n,g' $(UCLIBC_DIR)/.oldconfig
 endif
-ifeq ($(BR2_USE_WCHAR),y)
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_WCHAR),y)
 	$(SED) 's,^.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=y,g' $(UCLIBC_DIR)/.oldconfig
 else
 	$(SED) 's,^.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=n,g' $(UCLIBC_DIR)/.oldconfig
