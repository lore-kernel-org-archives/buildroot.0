From: Vadim Kochan <vadim4j@gmail.com>
Date: Fri, 15 Mar 2019 04:34:56 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/ecryptfs-utils: Add support
 without gettext
Message-ID: <20190315023456.15988-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add custom ecryptfs-common script which provides gettext wrapper as
function, script checks if there is gettext tool, if no - the "printf"
will be used instead. Each script which uses gettext is patched with
including this ecryptfs-common script.

gettext package is now selected automatically only if NLS is enabled.

Also replaced AM_GLIB_GNU_GETTEXT by AM_GNU_GETTEXT because original
macro is removed during autoreconf. Actually AM_GLIB_GNU_GETTEXT is
marked as deprecated in:

    https://gitlab.gnome.org/GNOME/glib/blob/master/m4macros/glib-gettext.m4#L437

so it is ok to use the gettext's one.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---

v2:
    1) Move ecryptfs-common from package/ecryptfs-utils to *.patch and
       install it from src/utils/Makefile.am

    2) Use solution from Yann E. Morin for gettext-wrapper

    3) Replace AM_GLIB_GNU_GETTEXT by AM_GNU_GETTEXT

    4) Use @prefix@ and @PACKAGE@ variables to properly include the
       ecryptfs-common script in utils which uses gettext, it requires
       to add these utils scripts into configure.ac AC_CONFIG_FILES for
       variable replacement.

 ...tils-Use-printf-if-gettext-does-not-exist.patch | 217 +++++++++++++++++++++
 package/ecryptfs-utils/Config.in                   |   2 +-
 package/ecryptfs-utils/ecryptfs-utils.mk           |   5 +
 3 files changed, 223 insertions(+), 1 deletion(-)
 create mode 100644 package/ecryptfs-utils/0003-utils-Use-printf-if-gettext-does-not-exist.patch

diff --git a/package/ecryptfs-utils/0003-utils-Use-printf-if-gettext-does-not-exist.patch b/package/ecryptfs-utils/0003-utils-Use-printf-if-gettext-does-not-exist.patch
new file mode 100644
index 0000000000..7fe8756323
--- /dev/null
+++ b/package/ecryptfs-utils/0003-utils-Use-printf-if-gettext-does-not-exist.patch
@@ -0,0 +1,217 @@
+From e2a69d509653ff189dd8dd7ed30ff568a0183f1a Mon Sep 17 00:00:00 2001
+From: Vadim Kochan <vadim4j@gmail.com>
+Date: Tue, 12 Mar 2019 02:15:33 +0200
+Subject: [PATCH] utils: Use "printf" if gettext does not exist
+
+There might be a case when gettext does not exist on the system,
+so use just "printf" instead. Added gettext wrapper which imitates
+gettext behaviour, wrapper is used only if gettext is not found
+by "which". ecryptfs-common is included by each script which uses
+gettext tool.
+
+AM_GLIB_GNU_GETTEXT is replaced by AM_GNU_GETTEXT, to get rid of
+glib2 dependency just only for this macro. Actually this macro is marked
+as deprecated in:
+
+    https://gitlab.gnome.org/GNOME/glib/blob/master/m4macros/glib-gettext.m4#L437
+
+Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
+---
+ configure.ac                      | 12 ++++++++++--
+ src/utils/Makefile.am             |  4 +++-
+ src/utils/ecryptfs-common         | 30 ++++++++++++++++++++++++++++++
+ src/utils/ecryptfs-migrate-home   |  2 ++
+ src/utils/ecryptfs-mount-private  |  2 ++
+ src/utils/ecryptfs-rewrite-file   |  2 ++
+ src/utils/ecryptfs-setup-private  |  3 +++
+ src/utils/ecryptfs-setup-swap     |  2 ++
+ src/utils/ecryptfs-umount-private |  2 ++
+ src/utils/ecryptfs-verify         |  2 ++
+ 10 files changed, 58 insertions(+), 3 deletions(-)
+ create mode 100755 src/utils/ecryptfs-common
+
+diff --git a/configure.ac b/configure.ac
+index bbc6ffc..eec1ebc 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -13,7 +13,7 @@ AC_PREREQ(2.59)
+ AC_INIT([ecryptfs-utils],[111])
+ AC_CANONICAL_HOST
+ AC_CANONICAL_TARGET
+-AM_INIT_AUTOMAKE([${PACKAGE_NAME}], [${PACKAGE_VERSION}])
++AM_INIT_AUTOMAKE([foreign])
+ AC_CONFIG_SRCDIR([src/libecryptfs])
+ AC_CONFIG_HEADERS([config.h])
+ AC_SUBST(AM_CPPFLAGS, '-include $(top_builddir)/config.h')
+@@ -369,7 +369,8 @@ AC_SUBST(GETTEXT_PACKAGE)
+ AC_DEFINE_UNQUOTED(GETTEXT_PACKAGE,"$GETTEXT_PACKAGE",
+                    [the gettext translation domain])
+ 
+-AM_GLIB_GNU_GETTEXT
++AM_GNU_GETTEXT_VERSION([0.19])
++AM_GNU_GETTEXT([external])
+ 
+ IT_PROG_INTLTOOL([0.41.0])
+ 
+@@ -439,6 +440,13 @@ AC_CONFIG_FILES([
+ 	tests/kernel/Makefile
+ 	tests/userspace/Makefile
+ 	po/Makefile.in
++	src/utils/ecryptfs-migrate-home:src/utils/ecryptfs-migrate-home
++	src/utils/ecryptfs-mount-private:src/utils/ecryptfs-mount-private
++	src/utils/ecryptfs-rewrite-file:src/utils/ecryptfs-rewrite-file
++	src/utils/ecryptfs-setup-private:src/utils/ecryptfs-setup-private
++	src/utils/ecryptfs-setup-swap:src/utils/ecryptfs-setup-swap
++	src/utils/ecryptfs-umount-private:src/utils/ecryptfs-umount-private
++	src/utils/ecryptfs-verify:src/utils/ecryptfs-verify
+ ])
+ AC_OUTPUT
+ 
+diff --git a/src/utils/Makefile.am b/src/utils/Makefile.am
+index 83cf851..54c3bdc 100644
+--- a/src/utils/Makefile.am
++++ b/src/utils/Makefile.am
+@@ -21,9 +21,11 @@ bin_SCRIPTS = ecryptfs-setup-private \
+ 	      ecryptfs-find \
+ 	      ecryptfs-verify
+ bin2dir = $(bindir)
+-
+ noinst_PROGRAMS=test
+ 
++commonlibdir=$(libdir)/ecryptfs-utils
++commonlib_SCRIPTS=ecryptfs-common
++
+ if ENABLE_TESTS
+ TESTS=test
+ endif
+diff --git a/src/utils/ecryptfs-common b/src/utils/ecryptfs-common
+new file mode 100755
+index 0000000..3b18568
+--- /dev/null
++++ b/src/utils/ecryptfs-common
+@@ -0,0 +1,30 @@
++# Thanks to "Yann E. MORIN" <yann.morin.1998@free.fr>
++# for this gettext replacement function
++if ! which gettext >/dev/null 2>&1; then
++gettext() {
++    if [ -n "${GETTEXT}" ]; then
++	# Weird construct so that script that are 'set -e'
++	# fail at the call site of gettext and not here.
++	"${GETTEXT}" "${@}" || return $?
++	return 0
++    fi
++    while [ ${#} -ne 0 ]; do
++	case "${1}" in
++	  (-h)              printf "no help\n"; return 0;;
++	  (-V)              printf "0.0.0\n"; return 0;;
++	  (-d|--domain)     shift 2;;
++	  (-d*|--domain=*)  shift 1;;
++	  (-e|-E|-n)        shift 1;;
++	  (-s)              shift 1;;  # Ignore?
++	  (-*)              printf "invalid option '%s'\n" "${1}" >&2; return 1;;
++	  (*)               break;;
++	esac
++    done
++    case ${#} in
++      (0)   printf "missing arguments\n" >&2; return 1;;
++      (1)   printf "%s" "${1}";;
++      (2)   shift; printf "%s" "${2}";;
++      (*)   printf "too many arguments\n" >&2; return 1;;
++    esac
++}
++fi
+diff --git a/src/utils/ecryptfs-migrate-home b/src/utils/ecryptfs-migrate-home
+index b810146..1233910 100755
+--- a/src/utils/ecryptfs-migrate-home
++++ b/src/utils/ecryptfs-migrate-home
+@@ -24,6 +24,8 @@
+ 
+ set -e
+ 
++. @prefix@/lib/@PACKAGE@/ecryptfs-common
++
+ PRIVATE_DIR="Private"
+ 
+ usage() {
+diff --git a/src/utils/ecryptfs-mount-private b/src/utils/ecryptfs-mount-private
+index c32708f..218d0a2 100755
+--- a/src/utils/ecryptfs-mount-private
++++ b/src/utils/ecryptfs-mount-private
+@@ -12,6 +12,8 @@
+ #  * inserts the mount passphrase into the keyring
+ #  * and mounts a user's encrypted private folder
+ 
++. @prefix@/lib/@PACKAGE@/ecryptfs-common
++
+ PRIVATE_DIR="Private"
+ WRAPPING_PASS="LOGIN"
+ PW_ATTEMPTS=3
+diff --git a/src/utils/ecryptfs-rewrite-file b/src/utils/ecryptfs-rewrite-file
+index c4f67f5..6b00370 100755
+--- a/src/utils/ecryptfs-rewrite-file
++++ b/src/utils/ecryptfs-rewrite-file
+@@ -17,6 +17,8 @@
+ #    You should have received a copy of the GNU General Public License
+ #    along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ 
++. @prefix@/lib/@PACKAGE@/ecryptfs-common
++
+ TEXTDOMAIN="ecryptfs-utils"
+ 
+ error() {
+diff --git a/src/utils/ecryptfs-setup-private b/src/utils/ecryptfs-setup-private
+index e90d1d0..50073d4 100755
+--- a/src/utils/ecryptfs-setup-private
++++ b/src/utils/ecryptfs-setup-private
+@@ -6,6 +6,9 @@
+ # Ported for use on Ubuntu by Dustin Kirkland <kirkland@ubuntu.com>
+ # Copyright (C) 2008 Canonical Ltd.
+ # Copyright (C) 2007-2008 International Business Machines
++
++. @prefix@/lib/@PACKAGE@/ecryptfs-common
++
+ PRIVATE_DIR="Private"
+ WRAPPING_PASS="LOGIN"
+ ECRYPTFS_DIR="/home/.ecryptfs"
+diff --git a/src/utils/ecryptfs-setup-swap b/src/utils/ecryptfs-setup-swap
+index 41cf18a..f122674 100755
+--- a/src/utils/ecryptfs-setup-swap
++++ b/src/utils/ecryptfs-setup-swap
+@@ -19,6 +19,8 @@
+ # The cryptswap setup used here follows a guide published at:
+ #  * http://ubuntumagnet.com/2007/11/creating-encrypted-swap-file-ubuntu-using-cryptsetup
+ 
++. @prefix@/lib/@PACKAGE@/ecryptfs-common
++
+ TEXTDOMAIN="ecryptfs-utils"
+ 
+ error() {
+diff --git a/src/utils/ecryptfs-umount-private b/src/utils/ecryptfs-umount-private
+index 27edeaa..5645f4d 100755
+--- a/src/utils/ecryptfs-umount-private
++++ b/src/utils/ecryptfs-umount-private
+@@ -5,6 +5,8 @@
+ # Original by Michael Halcrow, IBM
+ # Extracted to a stand-alone script by Dustin Kirkland <kirkland@ubuntu.com>
+ 
++. @prefix@/lib/@PACKAGE@/ecryptfs-common
++
+ TEXTDOMAIN="ecryptfs-utils"
+ 
+ if grep -qs "$HOME/.Private $PWD ecryptfs " /proc/mounts 2>/dev/null; then
+diff --git a/src/utils/ecryptfs-verify b/src/utils/ecryptfs-verify
+index b55641d..f102d2b 100755
+--- a/src/utils/ecryptfs-verify
++++ b/src/utils/ecryptfs-verify
+@@ -16,6 +16,8 @@
+ #    You should have received a copy of the GNU General Public License
+ #    along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ 
++. @prefix@/lib/@PACKAGE@/ecryptfs-common
++
+ error() {
+ 	echo `gettext "ERROR:"` "$@" 1>&2
+ 	echo `gettext "ERROR:"` "Configuration invalid" 1>&2
+-- 
+2.14.1
+
diff --git a/package/ecryptfs-utils/Config.in b/package/ecryptfs-utils/Config.in
index 6652d33e0e..1438c1754c 100644
--- a/package/ecryptfs-utils/Config.in
+++ b/package/ecryptfs-utils/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_ECRYPTFS_UTILS
 	select BR2_PACKAGE_LIBNSS
 	# runtime dependency only, some scripts are using the
 	# 'gettext' program to get translations
-	select BR2_PACKAGE_GETTEXT
+	select BR2_PACKAGE_GETTEXT if BR2_SYSTEM_ENABLE_NLS
 	# runtime dependency only
 	select BR2_PACKAGE_GETENT
 	help
diff --git a/package/ecryptfs-utils/ecryptfs-utils.mk b/package/ecryptfs-utils/ecryptfs-utils.mk
index eb3194b6d0..1b49397137 100644
--- a/package/ecryptfs-utils/ecryptfs-utils.mk
+++ b/package/ecryptfs-utils/ecryptfs-utils.mk
@@ -25,4 +25,9 @@ else
 ECRYPTFS_UTILS_CONF_OPTS += --disable-openssl
 endif
 
+define ECRYPTFS_UTILS_RUN_AUTOGEN
+	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
+endef
+ECRYPTFS_UTILS_PRE_CONFIGURE_HOOKS += ECRYPTFS_UTILS_RUN_AUTOGEN
+
 $(eval $(autotools-package))
-- 
2.14.1
