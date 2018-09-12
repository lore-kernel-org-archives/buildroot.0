From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 21:22:25 +0200
Subject: [Buildroot] [git commit] support/scripts/mkusers: preserve group
 members
Message-ID: <20180912193102.7FDB786D33@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=497f7134fca4b111499b2fd23501d7e048303e7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When the function add_one_group is called on an existing group,
make sure the members of this group are not removed in the process of
deleting then re-adding the group.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Thomas: add curly braces when referencing ${members}, as suggested by
Yann.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/mkusers | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/support/scripts/mkusers b/support/scripts/mkusers
index 5bbec3e10f..d00ba33823 100755
--- a/support/scripts/mkusers
+++ b/support/scripts/mkusers
@@ -75,6 +75,14 @@ get_gid() {
         '$1 == group { printf( "%d\n", $3 ); }' "${GROUP}"
 }
 
+#----------------------------------------------------------------------------
+get_members() {
+    local group="${1}"
+
+    awk -F: -v group="${group}"                             \
+        '$1 == group { printf( "%s\n", $4 ); }' "${GROUP}"
+}
+
 #----------------------------------------------------------------------------
 get_username() {
     local uid="${1}"
@@ -211,16 +219,17 @@ generate_gid() {
 add_one_group() {
     local group="${1}"
     local gid="${2}"
-    local _f
+    local members
 
     # Generate a new GID if needed
     if [ ${gid} -eq -1 ]; then
         gid="$( generate_gid "${group}" )"
     fi
 
+    members=$(get_members "$group")
     # Remove any previous instance of this group, and re-add the new one
     sed -i --follow-symlinks -e '/^'"${group}"':.*/d;' "${GROUP}"
-    printf "%s:x:%d:\n" "${group}" "${gid}" >>"${GROUP}"
+    printf "%s:x:%d:%s\n" "${group}" "${gid}" "${members}" >>"${GROUP}"
 
     # Ditto for /etc/gshadow if it exists
     if [ -f "${GSHADOW}" ]; then
