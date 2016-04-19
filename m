From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Apr 2016 22:20:22 +0200
Subject: [Buildroot] [git commit] tegrarcm: new package
Message-ID: <20160419203323.9688B802FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e903e453be706565fbe2a0d87536bd32c3662092
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add package for the tegrarcm host utility that allows loading data to
tegra processors in recovery mode.

Signed-off-by: Julian Scheel <julian@jusst.de>
[Thomas: replace cryptopp cross-compilation fix by a more
autoconf-style solution, which has been submitted upstream.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in.host                             |   1 +
 ...-assume-cryptopp-is-system-wide-installed.patch | 114 +++++++++++++++++++++
 package/tegrarcm/Config.in.host                    |   8 ++
 package/tegrarcm/tegrarcm.hash                     |   2 +
 package/tegrarcm/tegrarcm.mk                       |  14 +++
 5 files changed, 139 insertions(+)

diff --git a/package/Config.in.host b/package/Config.in.host
index a91612b..ccded79 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -29,6 +29,7 @@ menu "Host utilities"
 	source "package/sam-ba/Config.in.host"
 	source "package/squashfs/Config.in.host"
 	source "package/sunxi-tools/Config.in.host"
+	source "package/tegrarcm/Config.in.host"
 	source "package/uboot-tools/Config.in.host"
 	source "package/util-linux/Config.in.host"
 	source "package/vboot-utils/Config.in.host"
diff --git a/package/tegrarcm/0001-Don-t-assume-cryptopp-is-system-wide-installed.patch b/package/tegrarcm/0001-Don-t-assume-cryptopp-is-system-wide-installed.patch
new file mode 100644
index 0000000..3c738d8
--- /dev/null
+++ b/package/tegrarcm/0001-Don-t-assume-cryptopp-is-system-wide-installed.patch
@@ -0,0 +1,114 @@
+From 5ea6b3859ebe16ff47856b58262b14463e119c13 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Tue, 19 Apr 2016 22:14:42 +0200
+Subject: [PATCH] Don't assume cryptopp is system-wide installed
+
+The current build system adds "-isystem /usr/include/$(CRYPTOLIB)" to
+AM_CPPFLAGS, but this is wrong because cryptopp might not be installed
+in this location. Instead, the build system should simply include
+<cryptopp/...> or <crypto++/...> and rely on the compiler include
+path.
+
+The tricky part is that it can be <cryptopp/...> or <crypto++/...>. To
+solve this, we use a solution similar to the one used in
+https://github.com/bingmann/crypto-speedtest/blob/master/m4/cryptopp.m4
+and
+https://github.com/bingmann/crypto-speedtest/blob/master/src/speedtest_cryptopp.cpp:
+the configure script fills in a variable called
+CRYPTOLIB_HEADER_PREFIX, and we use that in the C++ code to include
+the right header file.
+
+It is worth mentioning that doing #include
+<CRYPTOLIB_HEADER_PREFIX/foobar.h> doesn't work, and we have to use an
+intermediate #define'd constant to overcome this C preprocessor
+limitation.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Submitted upstream at https://github.com/NVIDIA/tegrarcm/pull/2
+---
+ configure.ac     |  1 +
+ src/Makefile.am  |  2 +-
+ src/aes-cmac.cpp | 28 +++++++++++++++++-----------
+ 3 files changed, 19 insertions(+), 12 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 943654f..620e158 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -33,6 +33,7 @@ AC_LINK_IFELSE(
+ 		[AC_MSG_ERROR([libcrypto++/libcryptopp is not installed.])])]
+ )
+ AC_SUBST(CRYPTOLIB)
++AC_DEFINE_UNQUOTED([CRYPTOLIB_HEADER_PREFIX], [$CRYPTOLIB], [Location of cryptolib header])
+ LDFLAGS=$SAVED_LDFLAGS
+ AC_LANG(C)
+ 
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 3dad0e6..35a606f 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -1,5 +1,5 @@
+ AM_CFLAGS = -Wall -std=c99
+-AM_CPPFLAGS = -isystem /usr/include/$(CRYPTOLIB) $(LIBUSB_CFLAGS)
++AM_CPPFLAGS = $(LIBUSB_CFLAGS)
+ 
+ bin_PROGRAMS = tegrarcm
+ tegrarcm_SOURCES = \
+diff --git a/src/aes-cmac.cpp b/src/aes-cmac.cpp
+index 24c89f8..da8be5a 100644
+--- a/src/aes-cmac.cpp
++++ b/src/aes-cmac.cpp
+@@ -26,6 +26,9 @@
+  * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+  */
++
++#include "config.h"
++
+ #include <iostream>
+ using std::cout;
+ using std::cerr;
+@@ -40,26 +43,29 @@ using std::string;
+ #include <cstdlib>
+ using std::exit;
+ 
+-#include "cryptlib.h"
+-using CryptoPP::Exception;
++#define CRYPTOPP_INCLUDE_CRYPTLIB	<CRYPTOLIB_HEADER_PREFIX/cryptlib.h>
++#define CRYPTOPP_INCLUDE_CMAC		<CRYPTOLIB_HEADER_PREFIX/cmac.h>
++#define CRYPTOPP_INCLUDE_AES		<CRYPTOLIB_HEADER_PREFIX/aes.h>
++#define CRYPTOPP_INCLUDE_HEX		<CRYPTOLIB_HEADER_PREFIX/hex.h>
++#define CRYPTOPP_INCLUDE_FILTERS	<CRYPTOLIB_HEADER_PREFIX/filters.h>
++#define CRYPTOPP_INCLUDE_SECBLOCK	<CRYPTOLIB_HEADER_PREFIX/secblock.h>
+ 
+-#include "cmac.h"
+-using CryptoPP::CMAC;
++#include CRYPTOPP_INCLUDE_CRYPTLIB
++#include CRYPTOPP_INCLUDE_CMAC
++#include CRYPTOPP_INCLUDE_AES
++#include CRYPTOPP_INCLUDE_HEX
++#include CRYPTOPP_INCLUDE_FILTERS
++#include CRYPTOPP_INCLUDE_SECBLOCK
+ 
+-#include "aes.h"
++using CryptoPP::Exception;
++using CryptoPP::CMAC;
+ using CryptoPP::AES;
+-
+-#include "hex.h"
+ using CryptoPP::HexEncoder;
+ using CryptoPP::HexDecoder;
+-
+-#include "filters.h"
+ using CryptoPP::StringSink;
+ using CryptoPP::StringSource;
+ using CryptoPP::HashFilter;
+ using CryptoPP::HashVerificationFilter;
+-
+-#include "secblock.h"
+ using CryptoPP::SecByteBlock;
+ 
+ extern "C" int cmac_hash(const unsigned char *msg, int len, unsigned char *cmac_buf)
+-- 
+2.6.4
+
diff --git a/package/tegrarcm/Config.in.host b/package/tegrarcm/Config.in.host
new file mode 100644
index 0000000..47590fa
--- /dev/null
+++ b/package/tegrarcm/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_TEGRARCM
+	bool "host tegrarcm"
+	depends on BR2_arm || BR2_armeb
+	help
+	  This program is used to send code to a Tegra device in recovery
+	  mode.
+
+	  https://github.com/NVIDIA/tegrarcm
diff --git a/package/tegrarcm/tegrarcm.hash b/package/tegrarcm/tegrarcm.hash
new file mode 100644
index 0000000..4194a4c
--- /dev/null
+++ b/package/tegrarcm/tegrarcm.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  538cb0af237ab33e070d3aeb6cc828cd7ef453753ba2ccc21b87ed43faac51bd  tegrarcm-v1.7.tar.gz
diff --git a/package/tegrarcm/tegrarcm.mk b/package/tegrarcm/tegrarcm.mk
new file mode 100644
index 0000000..6f03b57
--- /dev/null
+++ b/package/tegrarcm/tegrarcm.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# tegrarcm
+#
+################################################################################
+
+TEGRARCM_VERSION = v1.7
+TEGRARCM_SITE = $(call github,NVIDIA,tegrarcm,$(TEGRARCM_VERSION))
+TEGRARCM_LICENSE = BSD-3c / NVIDIA Software License (src/miniloader)
+TEGRARCM_LICENSE_FILE = LICENSE
+TEGRARCM_AUTORECONF = YES
+HOST_TEGRARCM_DEPENDENCIES = host-libusb host-pkgconf host-cryptopp
+
+$(eval $(host-autotools-package))
