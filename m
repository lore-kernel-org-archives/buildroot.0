From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Jun 2017 22:13:53 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] support/scripts: allow
	/etc/shadow to be symlinked
Message-ID: <20170626202409.39BF0818B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c4dffa19c156f16b9df6e071398a89b967f85854
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

This commit fixes a problem where it was not possible to replace
/etc/shadow with a symlink to a e.g. a user partition where the
shadow file is placed. This is required, e.g. for systems where the
rootfs is mounted read-only but users should still be able to be
added. Thus, if within an filesystem overlay setup a user tries
to replace /etc/shadow with a symlink to the real file on a user
partition a buildroot build stops with an error message because
sed is called on the symlink instead of following the symlink.
This commit fixes this shortcoming.

Signed-off-by: Jens Maus <mail@jens-maus.de>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 82f64203a8f017d50b754323194694374f92add5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/mkusers | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/support/scripts/mkusers b/support/scripts/mkusers
index 2ac76f9..5bbec3e 100755
--- a/support/scripts/mkusers
+++ b/support/scripts/mkusers
@@ -219,12 +219,12 @@ add_one_group() {
     fi
 
     # Remove any previous instance of this group, and re-add the new one
-    sed -i -e '/^'"${group}"':.*/d;' "${GROUP}"
+    sed -i --follow-symlinks -e '/^'"${group}"':.*/d;' "${GROUP}"
     printf "%s:x:%d:\n" "${group}" "${gid}" >>"${GROUP}"
 
     # Ditto for /etc/gshadow if it exists
     if [ -f "${GSHADOW}" ]; then
-        sed -i -e '/^'"${group}"':.*/d;' "${GSHADOW}"
+        sed -i --follow-symlinks -e '/^'"${group}"':.*/d;' "${GSHADOW}"
         printf "%s:*::\n" "${group}" >>"${GSHADOW}"
     fi
 }
@@ -263,7 +263,8 @@ add_user_to_group() {
 
     for _f in "${GROUP}" "${GSHADOW}"; do
         [ -f "${_f}" ] || continue
-        sed -r -i -e 's/^('"${group}"':.*:)(([^:]+,)?)'"${username}"'(,[^:]+*)?$/\1\2\4/;'  \
+        sed -r -i --follow-symlinks \
+                  -e 's/^('"${group}"':.*:)(([^:]+,)?)'"${username}"'(,[^:]+*)?$/\1\2\4/;'  \
                   -e 's/^('"${group}"':.*)$/\1,'"${username}"'/;'                           \
                   -e 's/,+/,/'                                                              \
                   -e 's/:,/:/'                                                              \
@@ -303,7 +304,7 @@ add_one_user() {
 
     # Remove any previous instance of this user
     for _f in "${PASSWD}" "${SHADOW}"; do
-        sed -r -i -e '/^'"${username}"':.*/d;' "${_f}"
+        sed -r -i --follow-symlinks -e '/^'"${username}"':.*/d;' "${_f}"
     done
 
     _gid="$( get_gid "${group}" )"
