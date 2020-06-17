From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 17 Jun 2020 22:58:22 +0200
Subject: [Buildroot] [git commit] suport/download: fix git wrapper with
 submodules on older git versions
Message-ID: <20200617205700.9DCBE825F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8fe9894f655fd79207c41673e1966cc4d4d101d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Older versions of git store the absolute path of the submodules'
repository as stored in the super-project, e.g.:

    $ cat some-submodule/.git
    gitdir: /path/to/super-project/.git/modules/some-submodule

Obviously, this is not very reproducible.

More recent versions of git, however, store relative paths, which
de-facto makes it reproducible.

Fix older versions by replacing the absolute paths with relative ones.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/download/git | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/support/download/git b/support/download/git
index 075f665bbf..15d8c66e05 100755
--- a/support/download/git
+++ b/support/download/git
@@ -176,6 +176,19 @@ date="$( _git log -1 --pretty=format:%cD )"
 # There might be submodules, so fetch them.
 if [ ${recurse} -eq 1 ]; then
     _git submodule update --init --recursive
+
+    # Older versions of git will store the absolute path of the git tree
+    # in the .git of submodules, while newer versions just use relative
+    # paths. Detect and fix the older variants to use relative paths, so
+    # that the archives are reproducible across a wider range of git
+    # versions. However, we can't do that if git is too old and uses
+    # full repositories for submodules.
+    cmd='printf "%s\n" "${path}/"'
+    for module_dir in $( _git submodule --quiet foreach "'${cmd}'" ); do
+        [ -f "${module_dir}/.git" ] || continue
+        relative_dir="$( sed -r -e 's,/+,/,g; s,[^/]+/,../,g' <<<"${module_dir}" )"
+        sed -r -i -e "s:^gitdir\: $(pwd)/:gitdir\: "${relative_dir}":" "${module_dir}/.git"
+    done
 fi
 
 # Generate the archive, sort with the C locale so that it is reproducible.
