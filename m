From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Mar 2019 21:16:19 +0200
Subject: [Buildroot] [git commit] package/tegrarcm: bump to version 1.8
Message-ID: <20190331191238.AD9EB8A50D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10731a4ed19574ad30212945e3d8d26bd280ed13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove patch (already in version)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-assume-cryptopp-is-system-wide-installed.patch | 114 ---------------------
 package/tegrarcm/tegrarcm.hash                     |   3 +-
 package/tegrarcm/tegrarcm.mk                       |   2 +-
 3 files changed, 3 insertions(+), 116 deletions(-)

diff --git a/package/tegrarcm/0001-Don-t-assume-cryptopp-is-system-wide-installed.patch b/package/tegrarcm/0001-Don-t-assume-cryptopp-is-system-wide-installed.patch
deleted file mode 100644
index 3c738d86a4..0000000000
--- a/package/tegrarcm/0001-Don-t-assume-cryptopp-is-system-wide-installed.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-From 5ea6b3859ebe16ff47856b58262b14463e119c13 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 19 Apr 2016 22:14:42 +0200
-Subject: [PATCH] Don't assume cryptopp is system-wide installed
-
-The current build system adds "-isystem /usr/include/$(CRYPTOLIB)" to
-AM_CPPFLAGS, but this is wrong because cryptopp might not be installed
-in this location. Instead, the build system should simply include
-<cryptopp/...> or <crypto++/...> and rely on the compiler include
-path.
-
-The tricky part is that it can be <cryptopp/...> or <crypto++/...>. To
-solve this, we use a solution similar to the one used in
-https://github.com/bingmann/crypto-speedtest/blob/master/m4/cryptopp.m4
-and
-https://github.com/bingmann/crypto-speedtest/blob/master/src/speedtest_cryptopp.cpp:
-the configure script fills in a variable called
-CRYPTOLIB_HEADER_PREFIX, and we use that in the C++ code to include
-the right header file.
-
-It is worth mentioning that doing #include
-<CRYPTOLIB_HEADER_PREFIX/foobar.h> doesn't work, and we have to use an
-intermediate #define'd constant to overcome this C preprocessor
-limitation.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Submitted upstream at https://github.com/NVIDIA/tegrarcm/pull/2
----
- configure.ac     |  1 +
- src/Makefile.am  |  2 +-
- src/aes-cmac.cpp | 28 +++++++++++++++++-----------
- 3 files changed, 19 insertions(+), 12 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 943654f..620e158 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -33,6 +33,7 @@ AC_LINK_IFELSE(
- 		[AC_MSG_ERROR([libcrypto++/libcryptopp is not installed.])])]
- )
- AC_SUBST(CRYPTOLIB)
-+AC_DEFINE_UNQUOTED([CRYPTOLIB_HEADER_PREFIX], [$CRYPTOLIB], [Location of cryptolib header])
- LDFLAGS=$SAVED_LDFLAGS
- AC_LANG(C)
- 
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 3dad0e6..35a606f 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -1,5 +1,5 @@
- AM_CFLAGS = -Wall -std=c99
--AM_CPPFLAGS = -isystem /usr/include/$(CRYPTOLIB) $(LIBUSB_CFLAGS)
-+AM_CPPFLAGS = $(LIBUSB_CFLAGS)
- 
- bin_PROGRAMS = tegrarcm
- tegrarcm_SOURCES = \
-diff --git a/src/aes-cmac.cpp b/src/aes-cmac.cpp
-index 24c89f8..da8be5a 100644
---- a/src/aes-cmac.cpp
-+++ b/src/aes-cmac.cpp
-@@ -26,6 +26,9 @@
-  * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
-  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-  */
-+
-+#include "config.h"
-+
- #include <iostream>
- using std::cout;
- using std::cerr;
-@@ -40,26 +43,29 @@ using std::string;
- #include <cstdlib>
- using std::exit;
- 
--#include "cryptlib.h"
--using CryptoPP::Exception;
-+#define CRYPTOPP_INCLUDE_CRYPTLIB	<CRYPTOLIB_HEADER_PREFIX/cryptlib.h>
-+#define CRYPTOPP_INCLUDE_CMAC		<CRYPTOLIB_HEADER_PREFIX/cmac.h>
-+#define CRYPTOPP_INCLUDE_AES		<CRYPTOLIB_HEADER_PREFIX/aes.h>
-+#define CRYPTOPP_INCLUDE_HEX		<CRYPTOLIB_HEADER_PREFIX/hex.h>
-+#define CRYPTOPP_INCLUDE_FILTERS	<CRYPTOLIB_HEADER_PREFIX/filters.h>
-+#define CRYPTOPP_INCLUDE_SECBLOCK	<CRYPTOLIB_HEADER_PREFIX/secblock.h>
- 
--#include "cmac.h"
--using CryptoPP::CMAC;
-+#include CRYPTOPP_INCLUDE_CRYPTLIB
-+#include CRYPTOPP_INCLUDE_CMAC
-+#include CRYPTOPP_INCLUDE_AES
-+#include CRYPTOPP_INCLUDE_HEX
-+#include CRYPTOPP_INCLUDE_FILTERS
-+#include CRYPTOPP_INCLUDE_SECBLOCK
- 
--#include "aes.h"
-+using CryptoPP::Exception;
-+using CryptoPP::CMAC;
- using CryptoPP::AES;
--
--#include "hex.h"
- using CryptoPP::HexEncoder;
- using CryptoPP::HexDecoder;
--
--#include "filters.h"
- using CryptoPP::StringSink;
- using CryptoPP::StringSource;
- using CryptoPP::HashFilter;
- using CryptoPP::HashVerificationFilter;
--
--#include "secblock.h"
- using CryptoPP::SecByteBlock;
- 
- extern "C" int cmac_hash(const unsigned char *msg, int len, unsigned char *cmac_buf)
--- 
-2.6.4
-
diff --git a/package/tegrarcm/tegrarcm.hash b/package/tegrarcm/tegrarcm.hash
index 4194a4cd21..3849f0f6c7 100644
--- a/package/tegrarcm/tegrarcm.hash
+++ b/package/tegrarcm/tegrarcm.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256  538cb0af237ab33e070d3aeb6cc828cd7ef453753ba2ccc21b87ed43faac51bd  tegrarcm-v1.7.tar.gz
+sha256  08329ee0247499b28ec37b0cc639f35443792dfb9bc4a8a182eea63dae6f64ea  tegrarcm-v1.8.tar.gz
+sha256  5f20d276321cb37346d911712a813cb7ce4c8e3a570bffc919bec820eeef13f6  LICENSE
diff --git a/package/tegrarcm/tegrarcm.mk b/package/tegrarcm/tegrarcm.mk
index ad4c317b35..c84cf7f644 100644
--- a/package/tegrarcm/tegrarcm.mk
+++ b/package/tegrarcm/tegrarcm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TEGRARCM_VERSION = v1.7
+TEGRARCM_VERSION = v1.8
 TEGRARCM_SITE = $(call github,NVIDIA,tegrarcm,$(TEGRARCM_VERSION))
 TEGRARCM_LICENSE = BSD-3-Clause / NVIDIA Software License (src/miniloader)
 TEGRARCM_LICENSE_FILES = LICENSE
