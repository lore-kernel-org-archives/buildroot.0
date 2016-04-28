From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 29 Apr 2016 00:27:28 +0200
Subject: [Buildroot] [PATCH 10/13 v6] support/apply-patches: bail-out on
	duplicate patch basenames
In-Reply-To: <cover.1461881416.git.yann.morin.1998@free.fr>
References: <cover.1461881416.git.yann.morin.1998@free.fr>
Message-ID: <66d039a990920ab2ddf110c2171e0b02417f7ac9.1461881416.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patches we save can come from various locations;
  - bundled with Buildroot
  - downloaded
  - from one or more global-patch-dir

It is possible that two patches lying into different locations have the
same basename, like so (first is bundled, second is from an hypothetical
global-patch-dir):
    package/foo/0001-fix-Makefile.patch
    /path/to/my/patches/foo/0001-fix-Makefile.patch

In that case, when running legal-info, we'd save only the second patch,
overwriting the first. That would be oproblematic, because:

  - either the second patch depends on the first, and thus would no longer
    apply (this is easy to detect, though),

  - or the second patch does not dpend on the first, and the compliance
    delivery will not be complete (this is much arder to detect).

We fix that by checking that no two patches have the same same basename.
If we find that the basename of the patch to be applied collides with
that of a previously applied patch, we error out and report the duplicate.

The unfortunate side-effect is that existing setups will now break in
that situation, but that's a minor, corner-case issue that is easily
fixed.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Changes v5 -> v6:
  - don't renumber, detect collision and error out  (Luca, Arnout,
    Thomas)
---
 support/scripts/apply-patches.sh | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 20a1552..e85891a 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -103,6 +103,12 @@ function apply_patch {
         echo "Error: missing patch file ${path}/$patch"
         exit 1
     fi
+    existing="$( grep -E "/${patch}\$" ${builddir}/.applied_patches_list )"
+    if [ -n "${existing}" ]; then
+        echo "Error: duplicate filename ${path}/$patch"
+        echo "Previous one was at: ${existing}"
+        exit 1
+    fi
     echo "${path}/${patch}" >> ${builddir}/.applied_patches_list
     ${uncomp} "${path}/$patch" | patch -g0 -p1 -E -d "${builddir}" -t -N $silent
     if [ $? != 0 ] ; then
-- 
1.9.1
