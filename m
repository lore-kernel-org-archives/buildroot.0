From: Vadim Kochan <vadim4j@gmail.com>
Date: Wed, 13 Mar 2019 00:20:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/ecryptfs-utils: Add support without
 gettext
Message-ID: <20190312222035.16834-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add custom ecryptfs-common script which provides gettext wrapper as
function which checks at runtime if there is gettext tool, if no - the
"echo" will be used instead. Each script which uses gettext is
patched with including this ecryptfs-common script.

The patch for ecryptfs-utils only inserts hard-coded (w/o using
@prefix@/lib/@PACKAGE@ variables) path to the ecryptfs-common, it is
very small and trivial, it allows to easy support new bumped version.

gettext package is now selected automatically only if NLS is enabled.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 ...cho-instead-of-gettext-if-it-does-not-exi.patch | 117 +++++++++++++++++++++
 package/ecryptfs-utils/Config.in                   |   2 +-
 package/ecryptfs-utils/ecryptfs-common             |  33 ++++++
 package/ecryptfs-utils/ecryptfs-utils.mk           |   6 ++
 4 files changed, 157 insertions(+), 1 deletion(-)
 create mode 100644 package/ecryptfs-utils/0003-utils-Use-echo-instead-of-gettext-if-it-does-not-exi.patch
 create mode 100755 package/ecryptfs-utils/ecryptfs-common

diff --git a/package/ecryptfs-utils/0003-utils-Use-echo-instead-of-gettext-if-it-does-not-exi.patch b/package/ecryptfs-utils/0003-utils-Use-echo-instead-of-gettext-if-it-does-not-exi.patch
new file mode 100644
index 0000000000..1e3318ab22
--- /dev/null
+++ b/package/ecryptfs-utils/0003-utils-Use-echo-instead-of-gettext-if-it-does-not-exi.patch
@@ -0,0 +1,117 @@
+From 55755006370fb12167dcadeb084b6645712197a9 Mon Sep 17 00:00:00 2001
+From: Vadim Kochan <vadim4j@gmail.com>
+Date: Tue, 12 Mar 2019 02:15:33 +0200
+Subject: [PATCH] utils: Use "echo" instead of gettext if it does not exist
+
+There might be a case when gettext does not exist on the system,
+so use just "echo" instead. Added gettext wrapper which imitates
+gettext behaviour, wrapper is used only if gettext is not found
+by "which". ecryptfs-common is included by each script which uses
+gettext tool.
+
+Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
+---
+ src/utils/ecryptfs-migrate-home   | 2 ++
+ src/utils/ecryptfs-mount-private  | 2 ++
+ src/utils/ecryptfs-rewrite-file   | 2 ++
+ src/utils/ecryptfs-setup-private  | 3 +++
+ src/utils/ecryptfs-setup-swap     | 2 ++
+ src/utils/ecryptfs-umount-private | 2 ++
+ src/utils/ecryptfs-verify         | 2 ++
+ 7 files changed, 15 insertions(+)
+
+diff --git a/src/utils/ecryptfs-migrate-home b/src/utils/ecryptfs-migrate-home
+index b810146..4fa4d86 100755
+--- a/src/utils/ecryptfs-migrate-home
++++ b/src/utils/ecryptfs-migrate-home
+@@ -24,6 +24,8 @@
+ 
+ set -e
+ 
++. /usr/lib/ecryptfs-utils/ecryptfs-common
++
+ PRIVATE_DIR="Private"
+ 
+ usage() {
+diff --git a/src/utils/ecryptfs-mount-private b/src/utils/ecryptfs-mount-private
+index c32708f..a6df39f 100755
+--- a/src/utils/ecryptfs-mount-private
++++ b/src/utils/ecryptfs-mount-private
+@@ -12,6 +12,8 @@
+ #  * inserts the mount passphrase into the keyring
+ #  * and mounts a user's encrypted private folder
+ 
++. /usr/lib/ecryptfs-utils/ecryptfs-common
++
+ PRIVATE_DIR="Private"
+ WRAPPING_PASS="LOGIN"
+ PW_ATTEMPTS=3
+diff --git a/src/utils/ecryptfs-rewrite-file b/src/utils/ecryptfs-rewrite-file
+index c4f67f5..146e385 100755
+--- a/src/utils/ecryptfs-rewrite-file
++++ b/src/utils/ecryptfs-rewrite-file
+@@ -17,6 +17,8 @@
+ #    You should have received a copy of the GNU General Public License
+ #    along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ 
++. /usr/lib/ecryptfs-utils/ecryptfs-common
++
+ TEXTDOMAIN="ecryptfs-utils"
+ 
+ error() {
+diff --git a/src/utils/ecryptfs-setup-private b/src/utils/ecryptfs-setup-private
+index e90d1d0..ca08656 100755
+--- a/src/utils/ecryptfs-setup-private
++++ b/src/utils/ecryptfs-setup-private
+@@ -6,6 +6,9 @@
+ # Ported for use on Ubuntu by Dustin Kirkland <kirkland@ubuntu.com>
+ # Copyright (C) 2008 Canonical Ltd.
+ # Copyright (C) 2007-2008 International Business Machines
++
++. /usr/lib/ecryptfs-utils/ecryptfs-common
++
+ PRIVATE_DIR="Private"
+ WRAPPING_PASS="LOGIN"
+ ECRYPTFS_DIR="/home/.ecryptfs"
+diff --git a/src/utils/ecryptfs-setup-swap b/src/utils/ecryptfs-setup-swap
+index 41cf18a..157b0c5 100755
+--- a/src/utils/ecryptfs-setup-swap
++++ b/src/utils/ecryptfs-setup-swap
+@@ -19,6 +19,8 @@
+ # The cryptswap setup used here follows a guide published at:
+ #  * http://ubuntumagnet.com/2007/11/creating-encrypted-swap-file-ubuntu-using-cryptsetup
+ 
++. /usr/lib/ecryptfs-utils/ecryptfs-common
++
+ TEXTDOMAIN="ecryptfs-utils"
+ 
+ error() {
+diff --git a/src/utils/ecryptfs-umount-private b/src/utils/ecryptfs-umount-private
+index 27edeaa..4ac0ced 100755
+--- a/src/utils/ecryptfs-umount-private
++++ b/src/utils/ecryptfs-umount-private
+@@ -5,6 +5,8 @@
+ # Original by Michael Halcrow, IBM
+ # Extracted to a stand-alone script by Dustin Kirkland <kirkland@ubuntu.com>
+ 
++. /usr/lib/ecryptfs-utils/ecryptfs-common
++
+ TEXTDOMAIN="ecryptfs-utils"
+ 
+ if grep -qs "$HOME/.Private $PWD ecryptfs " /proc/mounts 2>/dev/null; then
+diff --git a/src/utils/ecryptfs-verify b/src/utils/ecryptfs-verify
+index b55641d..3592d83 100755
+--- a/src/utils/ecryptfs-verify
++++ b/src/utils/ecryptfs-verify
+@@ -16,6 +16,8 @@
+ #    You should have received a copy of the GNU General Public License
+ #    along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ 
++. /usr/lib/ecryptfs-utils/ecryptfs-common
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
diff --git a/package/ecryptfs-utils/ecryptfs-common b/package/ecryptfs-utils/ecryptfs-common
new file mode 100755
index 0000000000..8d4050d7f4
--- /dev/null
+++ b/package/ecryptfs-utils/ecryptfs-common
@@ -0,0 +1,33 @@
+GETTEXT_PROG=""
+
+# Thanks to "Yann E. MORIN" <yann.morin.1998@free.fr>
+# for this gettext replacement function
+gettext_echo() {
+	while [ ${#} -ne 0 ]; do
+		case "${1}" in
+			(-h)              echo "no help"; exit 0;;
+			(-V)              echo "0.0.0"; exit 0;;
+			(-d|--domain)     shift 2;;
+			(-d*|--domain=*)  shift 1;;
+			(-e|-E|-n)        shift 1;;
+			(-s)              shift 1;;  # Ignore?
+			(*)               break;;
+		esac
+	done
+	case ${#} in
+		(0)   ;;
+		(1)   echo "${1}";;           # No TEXTDOMAIN?
+		(*)   shift; echo "${@}";;    # Ignore TEXTDOMAIN?
+	esac
+}
+
+gettext() {
+	if [ -z "${GETTEXT_PROG}" ]; then
+		GETTEXT_PROG=$(which gettext)
+		if [ $? != 0 ]; then
+			GETTEXT_PROG=gettext_echo
+		fi
+	fi
+
+	${GETTEXT_PROG} "$@"
+}
diff --git a/package/ecryptfs-utils/ecryptfs-utils.mk b/package/ecryptfs-utils/ecryptfs-utils.mk
index eb3194b6d0..bf630882c2 100644
--- a/package/ecryptfs-utils/ecryptfs-utils.mk
+++ b/package/ecryptfs-utils/ecryptfs-utils.mk
@@ -25,4 +25,10 @@ else
 ECRYPTFS_UTILS_CONF_OPTS += --disable-openssl
 endif
 
+define ECRYPTFS_UTILS_INSTALL_COMMON_SCRIPT
+	$(INSTALL) -D -m 0755 $(ECRYPTFS_UTILS_PKGDIR)/ecryptfs-common \
+		$(TARGET_DIR)/usr/lib/ecryptfs-utils/ecryptfs-common
+endef
+ECRYPTFS_UTILS_POST_INSTALL_TARGET_HOOKS += ECRYPTFS_UTILS_INSTALL_COMMON_SCRIPT
+
 $(eval $(autotools-package))
-- 
2.14.1
