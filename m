From: pojiro.jp at gmail.com <pojiro.jp@gmail.com>
Date: Wed, 19 May 2021 12:28:48 +0900
Subject: [Buildroot] [PATCH] support/dependencies,
 scripts: accept patches with renames
In-Reply-To: <20210515094010.GA2506@scaer>
References: <20210515094010.GA2506@scaer>
Message-ID: <20210519032848.162695-1-pojiro.jp@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ryota Kinukawa <pojiro.jp@gmail.com>

Currently, patches with renames are refused, as they reqire patch >= 2.7.
So far, we did not require that version because it was too recent to be widely available.

But patch 2.7 has been released in 2012, almost 9 years ago now;
it is old enough that we can start relying on it.

Add a check that patch is 2.7 or newer, and drop the check about
renames in apply-patches.sh.

Signed-off-by: Ryota Kinukawa <pojiro.jp@gmail.com>
---
 support/dependencies/dependencies.sh | 12 +++++++++++-
 support/scripts/apply-patches.sh     |  5 -----
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 1954f038be..5aefc5c54a 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -183,11 +183,21 @@ if test "${missing_progs}" = "yes" ; then
 	exit 1
 fi
 
+PATCH_VERSION="$(patch -v | sed -n 's/^GNU patch \(.*\)/\1/p')"
 # apply-patches.sh needs patch with --no-backup-if-mismatch support (GNU, busybox w/DESKTOP)
-if ! patch --no-backup-if-mismatch </dev/null 2>/dev/null; then
+if [ -z "${PATCH_VERSION}" ] ; then
+	echo
 	echo "Your patch program does not support the --no-backup-if-mismatch option. Install GNU patch"
 	exit 1
 fi
+PATCH_VERSION_MAJOR="$(echo "${PATCH_VERSION}" | cut -d . -f 1)"
+PATCH_VERSION_MINOR="$(echo "${PATCH_VERSION}" | cut -d . -f 2)"
+if [ "${PATCH_VERSION_MAJOR}" -lt 2 ] || \
+   [ "${PATCH_VERSION_MAJOR}" -eq 2 -a "${PATCH_VERSION_MINOR}" -lt 7 ] ; then
+	echo
+	echo "You have GNU patch '$PATCH_VERSION' installed.  GNU patch >=2.7 is required"
+	exit 1;
+fi
 
 if grep ^BR2_NEEDS_HOST_UTF8_LOCALE=y $BR2_CONFIG > /dev/null; then
 	if ! which locale > /dev/null ; then
diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 9fb488c570..e5a2fdd09e 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -113,11 +113,6 @@ function apply_patch {
         echo "  to be applied  : ${path}/${patch}"
         exit 1
     fi
-    if ${uncomp} "${path}/$patch" | grep -q "^rename from" && \
-       ${uncomp} "${path}/$patch" | grep -q "^rename to" ; then
-        echo "Error: patch contains some renames, not supported by old patch versions"
-        exit 1
-    fi
     echo "${path}/${patch}" >> ${builddir}/.applied_patches_list
     ${uncomp} "${path}/$patch" | patch -g0 -p1 -E --no-backup-if-mismatch -d "${builddir}" -t -N $silent
     if [ $? != 0 ] ; then
-- 
2.25.1
