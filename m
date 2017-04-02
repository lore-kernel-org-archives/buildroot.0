From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Apr 2017 23:43:51 +0200
Subject: [Buildroot] [git commit] package/libva: bump version to 1.8.0
Message-ID: <20170402214406.8DEEE82670@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=039ad7c38de26669faf1fdd46328f6ec1719a51e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch because libva-utils are no longer part of the libva
package:
https://lists.01.org/pipermail/intel-vaapi-media/2017-March/000015.html

*   Move all utilities and tests to libva-utils

Package libva-utils will be added later.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libva/0001-no_test_decode.patch | 17 -----------------
 package/libva/libva.hash                |  4 +++-
 package/libva/libva.mk                  | 12 +++---------
 3 files changed, 6 insertions(+), 27 deletions(-)

diff --git a/package/libva/0001-no_test_decode.patch b/package/libva/0001-no_test_decode.patch
deleted file mode 100644
index 0f0d786..0000000
--- a/package/libva/0001-no_test_decode.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-mpeg2vldemo is the only file requiring cxx support. It is not needed for
-buildroot, so disable its compilation to avoid depending on cxx.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr libva-1.3.0.org/test/Makefile.am libva-1.3.0/test/Makefile.am
---- libva-1.3.0.org/test/Makefile.am	2014-03-24 05:49:46.000000000 +0100
-+++ libva-1.3.0/test/Makefile.am	2014-04-26 18:12:25.644390292 +0200
-@@ -20,7 +20,7 @@
- # TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
- # SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
- 
--SUBDIRS = common decode encode vainfo
-+SUBDIRS = common encode vainfo
- 
- if USE_X11
- SUBDIRS += basic putsurface
diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index 1f248f8..086a010 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,2 +1,4 @@
+# From https://lists.01.org/pipermail/intel-vaapi-media/2017-March/000015.html
+sha1 d9468956c301784b6b12c39cafd30ac52e24290b libva-1.8.0.tar.bz2
 # Locally computed
-sha256 f0f816a725007fbf3c7ed816ff71ba420696bec63ff49045e9b23d9b34ac73c8  libva-1.7.3.tar.gz
+sha256 eb92f3dcbe3981df3575348377263b31361113c77b2c3745f23174d1f562d658  libva-1.8.0.tar.bz2
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index bce6907..f16be90 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 1.7.3
-LIBVA_SITE = $(call github,01org,libva,libva-$(LIBVA_VERSION))
+LIBVA_VERSION = 1.8.0
+LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
+LIBVA_SITE = https://github.com/01org/libva/releases/download/$(LIBVA_VERSION)
 LIBVA_LICENSE = MIT
 LIBVA_LICENSE_FILES = COPYING
-LIBVA_AUTORECONF = YES
 LIBVA_INSTALL_STAGING = YES
 LIBVA_DEPENDENCIES = host-pkgconf libdrm
 
@@ -46,10 +46,4 @@ else
 LIBVA_CONF_OPTS += --disable-egl
 endif
 
-# Autoreconf requires an m4 directory to exist
-define LIBVA_PATCH_M4
-	mkdir -p $(@D)/m4
-endef
-LIBVA_POST_PATCH_HOOKS += LIBVA_PATCH_M4
-
 $(eval $(autotools-package))
