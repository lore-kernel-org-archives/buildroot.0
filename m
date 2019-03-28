From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Mar 2019 10:48:46 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/git: use
 pkg-config to get ssl dependencies
Message-ID: <20190328094533.C7723886CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a4b34dc6522e66c8c284fba5dd654d0c7334c62d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

On some architectures, atomic binutils are provided by the libatomic
library from gcc. Linking with libatomic is therefore necessary,
otherwise the build fails with:

/home/test/autobuild/run/instance-2/output/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libssl.a(ssl_cert.o): In function `CRYPTO_DOWN_REF':
/home/test/autobuild/run/instance-2/output/build/libopenssl-1.1.1a/include/internal/refcount.h:50: undefined reference to `__atomic_fetch_sub_4'

This is often for example the case on sparcv8 32 bit.

To fix this issue, use pkg-config to retrieve openssl dependencies
including atomic library, these dependencies must be passed to
LIB_4_CRYPTO IN GIT_MAKE_OPTS

Fixes:
 - http://autobuild.buildroot.org/results/3093897d14a854a7252b25b2fa1f8fdcbb26c9b7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1ae9640a9fc11c315aeb989941d9555065da8b24)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/git/git.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.mk b/package/git/git.mk
index 9b176d3661..aec30e3eb3 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -12,9 +12,9 @@ GIT_LICENSE_FILES = COPYING LGPL-2.1
 GIT_DEPENDENCIES = zlib $(TARGET_NLS_DEPENDENCIES)
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-GIT_DEPENDENCIES += openssl
+GIT_DEPENDENCIES += host-pkgconf openssl
 GIT_CONF_OPTS += --with-openssl
-GIT_CONF_ENV_LIBS += $(if $(BR2_STATIC_LIBS),-lz)
+GIT_MAKE_OPTS += LIB_4_CRYPTO="`$(PKG_CONFIG_HOST_BINARY) --libs libssl libcrypto`"
 else
 GIT_CONF_OPTS += --without-openssl
 endif
