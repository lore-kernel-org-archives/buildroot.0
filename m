From: Norbert Lange <nolange79@gmail.com>
Date: Thu, 26 Nov 2020 15:47:21 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/systemd: invoke
 systemd-tmpfilesd on final image
Message-ID: <20201126144722.502163-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Especially for read-only filesystems it is helpfull to
pre-create all folders for non-volatile paths.

This needs to run under fakeroot to allow setting
uids/gids/perms for the target fs.

As systemd-tmpfilesd also supports specifiers, but so far
only resolves those from the host, it is necessary
to specially handle entries that contain problematic
specifiers.

Entries containing problematic specifiers are either skipped,
but in some cases its possible to instead manually replace
them with correct replacements from the target.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
v1->v2
*   add a script to skip/handle specifiers that might
    otherwise take information from the host

package/systemd: tmpfilesv2

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/systemd/fakeroot_tmpfiles.sh | 66 ++++++++++++++++++++++++++++
 package/systemd/systemd.mk           |  9 +++-
 2 files changed, 73 insertions(+), 2 deletions(-)
 create mode 100644 package/systemd/fakeroot_tmpfiles.sh

diff --git a/package/systemd/fakeroot_tmpfiles.sh b/package/systemd/fakeroot_tmpfiles.sh
new file mode 100644
index 0000000000..f5e4fb234c
--- /dev/null
+++ b/package/systemd/fakeroot_tmpfiles.sh
@@ -0,0 +1,66 @@
+#!/bin/sh
+#
+# until a solution like [1] is upstreamed,
+# its necessary to mask out specs which will infer properties
+# from the host.
+#
+# TMPDIR= TEMP= TMP=  makes sure %T and %V are set to the default
+#
+# shell expansion is critical to be POSIX compliant,
+# this script wont work with zsh in its default mode for example.
+#
+# The script takes everal measures to handle more complex stuff
+# like passing this correctly:
+# f+  "/var/example" - - - - %B\n%o\n%w\n%W%%\n
+#
+# [1] - https://github.com/systemd/systemd/issues/16183
+
+[ -n "${HOST_SYSTEMD_TMPFILES-}" ] ||
+  HOST_SYSTEMD_TMPFILES=systemd-tmpfiles
+
+[ -n "${1-}" -a -d "${1-}"/usr/lib/tmpfiles.d ] ||
+  { echo 1>&2 "$0: need ROOTFS argument"; exit 1; }
+
+# read OS specific variables from file,
+# buildroot already wrote this in target-finalize,
+# users might replace it by using an overlay
+BUILD_ID=; ID=; VERSION_ID=; VARIANT_ID=;
+for f in /etc/os-release /usr/lib/os-release; do
+  # dont blindly set all variables, only pick the ones we need
+  [ -r "$1"/$f ] &&
+    eval "$(sed -n -e '/^BUILD_ID=/p' -e '/^ID=/p' -e '/^VERSION_ID=/p' -e '/^VARIANT_ID=/p' "$1"/$f)" &&
+      break
+done
+
+${HOST_SYSTEMD_TMPFILES} --no-pager --cat-config --root="$1" |
+  sed -e '/^[[:space:]]*#/d' -e 's,^[[:space:]]*,,' -e '/^$/d' |
+    while read -r line; do
+      # it is allowed to use quotes around arguments,
+      # so let the shell pack the arguments
+      eval "set -- $line"
+
+      # dont output warnings for directories we dont process
+      [ "${2#/dev}" = "${2}" ] && [ "${2#/dev}" = "${2}" ] &&
+        [ "${2#/run}" = "${2}" ] && [ "${2#/sys}" = "${2}" ] &&
+        [ "${2#/tmp}" = "${2}" ] && [ "${2#/mnt}" = "${2}" ] ||
+          continue
+
+      # blank out all specs that are ok to use,
+      # test if some remain
+      if echo "$2 ${7-}" | sed -e 's,%[%ChLStTgGuUV],,g' | grep -v -q '%'; then
+        # no "bad" specifiers, pass the line unmodified
+        eval "printf '%s\n' '$line'"
+      elif echo "$2 ${7-}" | sed -e 's,%[%ChLStTgGuUVBowW],,g' | grep -v -q '%'; then
+        # something we can fix
+        eval "printf '%s\n' '$line'" |
+          sed -e "s#%B#$BUILD_ID#g" -e "s#%o#$ID#g" -e "s#%w#$VERSION_ID#g" -e "s#%W#$VARIANT_ID#g"
+      else
+        # warn
+        eval "printf 'ignored spec: %s\n' '$line' 1>&2"
+      fi
+    done |
+\
+TMPDIR= TEMP= TMP= ${HOST_SYSTEMD_TMPFILES} --create --boot --root="$1" \
+  --exclude-prefix=/dev --exclude-prefix=/proc --exclude-prefix=/run --exclude-prefix=/sys \
+  --exclude-prefix=/tmp --exclude-prefix=/mnt \
+  -
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index ae99c02abf..629f4022d7 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -654,10 +654,15 @@ endef
 
 SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_RM_CATALOG_UPDATE_SERVICE
 
+define SYSTEMD_CREATE_TMPFILES_HOOK
+	HOST_SYSTEMD_TMPFILES=$(HOST_DIR)/bin/systemd-tmpfiles \
+		/bin/sh $(SYSTEMD_PKGDIR)/fakeroot_tmpfiles.sh $(TARGET_DIR)
+endef
+
 define SYSTEMD_PRESET_ALL
 	$(HOST_DIR)/bin/systemctl --root=$(TARGET_DIR) preset-all
 endef
-SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_PRESET_ALL
+SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_CREATE_TMPFILES_HOOK SYSTEMD_PRESET_ALL
 
 SYSTEMD_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
 SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
@@ -717,7 +722,7 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dvconsole=false \
 	-Dquotacheck=false \
 	-Dsysusers=false \
-	-Dtmpfiles=false \
+	-Dtmpfiles=true \
 	-Dimportd=false \
 	-Dhwdb=false \
 	-Drfkill=false \
-- 
2.29.2
