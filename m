From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun,  8 Apr 2018 04:20:29 -0300
Subject: [Buildroot] [RFC PATCH] Test download of all git packages without
 backup site
Message-ID: <20180408072029.24888-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To test a given sha1, checkout it in a clean tree (no .config file),
cherry-pick this test, re-run ./make.gitlab-ci.yml and commit
.gitlab-ci.yml before pushing it to Gitlab CI.

The script is ugly, but it is not meant to be applied anyway.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
NOTE: As soon as I send this patch I will change it to Not Applicable as
it is not meant to be applied.

This is still far from an exhaustive test but it seems a good subset:
 - all packages with site method = git
 - all boot, linux... that have custom site url in the intree defconfigs

2018.02:
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/20146633
master (d3a8177e):
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/20146667
master + patchwork 895967:
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/20146714

All tests that fail at master + patchwork 895967 also fail for 2018.02.
18xx-ti-utils and linux-firmware fail on master but are ok on master +
patchwork 895967.
Inpecting the tarball I could see 18xx-ti-utils also has a symlink to a
destination starting with ../

Some tests fail in both master and 2018.02:
- at91bootstrap3 v3.8.6: hash mismatch
- gummiboot: not found, moved to
  https://anongit.freedesktop.org/git/gummiboot.git ?

- kvm-unit-tests: not found
- kvmtool: not found
- mcelog: not found
- trace-cmd: not found
- uemacs: not found
  These 5 use https://cdn.kernel.org/pub/scm/ which is right now empty,
  maybe a temporary issue? This alternative url works:
  https://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git

- xloader: unable to connect to gitorious.org
---
 make.gitlab-ci.yml | 71 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100755 make.gitlab-ci.yml

diff --git a/make.gitlab-ci.yml b/make.gitlab-ci.yml
new file mode 100755
index 0000000000..3719bbc469
--- /dev/null
+++ b/make.gitlab-ci.yml
@@ -0,0 +1,71 @@
+#!/bin/bash
+ONLY_ONE=0
+if [ "$1" == "1" ]; then
+    ONLY_ONE=1
+fi
+FILE=".gitlab-ci.yml"
+
+echo "# $0" > ${FILE}
+
+grep 'image:' .gitlab-ci.yml.in >> ${FILE}
+
+(
+    echo
+    echo '.download: &download'
+    echo '    script:'
+    echo '        - make defconfig'
+    echo '        - ./utils/config --set-str BR2_BACKUP_SITE ""'
+    # shellcheck disable=SC2016
+    echo '        - make ${CI_JOB_NAME}'
+    echo
+) >> ${FILE}
+
+# HACKS: fix package names with '_', remove the make target for the target version for host-only packages
+packages="$(make BR2_HAVE_DOT_CONFIG=y -s printvars VARS=%_SITE_METHOD \
+    | grep '=git' \
+    | sed -e 's/_SITE_METHOD=git$//g' \
+    | tr "A-Z_" "a-z-" \
+    | sed -e 's/xdriver-xf86/xdriver_xf86/g' \
+    | grep -v '^netsurf-buildsystem' \
+    | grep -v '^opkg-utils' \
+    | grep -v '^pseudo' \
+    | grep -v '^vboot-utils')"
+
+for package in ${packages}; do
+    echo "${package}-source: *download"
+    if [ "${ONLY_ONE}" -eq 1 ]; then
+        break
+    fi
+done >> $FILE
+
+targets="$(grep -h CUSTOM_REPO_URL configs/* \
+    | sed -e 's/^BR2_TARGET_//g' -e 's/^BR2_//g' -e 's/_CUSTOM_REPO_URL=.*//g' \
+    | sort -u)"
+
+function print_script { target="$1"
+    (
+        echo
+        echo ".defconfig-${target}: &defconfig-download-${target}"
+        echo '    script:'
+        # shellcheck disable=SC2016
+        echo '        - make ${CI_JOB_NAME%-'"${target}-source}"
+        echo '        - ./utils/config --set-str BR2_BACKUP_SITE ""'
+        echo "        - make ${target}-source"
+        echo
+    ) >> ${FILE}
+}
+
+for target_upcase in ${targets}; do
+    target="$(echo "${target_upcase}" | sed -e 's/LINUX_KERNEL/LINUX/g' | tr "A-Z_" "a-z-")"
+    print_script "${target}"
+
+    defconfigs="$(grep -l "${target_upcase}_CUSTOM_REPO_URL" configs/* \
+        | sed -e 's,^configs/,,g')"
+
+    for defconfig in ${defconfigs}; do
+        echo "${defconfig}-${target}-source: *defconfig-download-${target}"
+        if [ "${ONLY_ONE}" -eq 1 ]; then
+            break 1
+        fi
+    done >> ${FILE}
+done
-- 
2.14.1
