From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jul 2020 21:26:54 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] core/br2-external: fix
 reporting errors
Message-ID: <20200715192515.3D452873BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=87f9527b55b202c1078f2130342077175407cdbc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

When a br2-external tree has an issue, e.g. a missing file, or does not
have a name, or the name uses invalid chars, we report that condition by
setting the variable BR2_EXTERNAL_ERROR.

That variable is defined in the script support/scripts/br2-external,
which outputs it on stdout, and checked by the Makefile.

Before d027cd75d09, stdout was explicitly redirected to the generated
.mk file, with   exec >"${ofile}"   as the Makefile and Kconfig
fragments were generated each with their own call to the script, and
the validation phase would emit the BR2_EXTERNAL_ERROR variable in the
Makefile fragment.

But with d027cd75d09, both the Makefile and Kconfig fragments were now
generated with a single call to the script, and as such the semantics of
the scripts changed, and only each of the actual generators, do_mk and
do_kconfig, had their out put redirected. Which left do_validate with
the default stdout. Which would emit BR2_EXTERNAL_ERROR on stdout.

In turn, the stdout of the script would be interpreted by as part of the
Makefile. But this does not end up very well when a br2-external tree
indeed has an error:

  - missing a external.desc file:

    Makefile:184: *** multiple target patterns.  Stop.

  - empty external.desc file:

    Config.in:22: can't open file "output/.br2-external.in.paths"

So we must redirect the output of the validation step to the
Makefile fragment, so that the error message is correctly caught by the
top-level Makefile.

Note that we don't need to append in do_mk, and we can do an overwrite
redirection: if we go so far as to call do_mk, it means there was no
error, and thus the fragment is empty.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Tested-by: Romain Naour <romain.naour@gmail.com>
(cherry picked from commit 0ac7dcb73e8e6878e4285c1cb55cbde3f3b492c6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/br2-external | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index 171526f8c8..fdea5aa251 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -33,9 +33,8 @@ main() {
     # Trap any unexpected error to generate a meaningful error message
     trap "error 'unexpected error while generating ${ofile}\n'" ERR
 
-    do_validate ${@//:/ }
-
     mkdir -p "${outputdir}"
+    do_validate "${outputdir}" ${@//:/ }
     do_mk "${outputdir}"
     do_kconfig "${outputdir}"
 }
@@ -51,7 +50,9 @@ main() {
 # snippet means that there were no error.
 #
 do_validate() {
+    local outputdir="${1}"
     local br2_ext
+    shift
 
     if [ ${#} -eq 0 ]; then
         # No br2-external tree is valid
@@ -60,7 +61,7 @@ do_validate() {
 
     for br2_ext in "${@}"; do
         do_validate_one "${br2_ext}"
-    done
+    done >"${outputdir}/.br2-external.mk"
 }
 
 do_validate_one() {
