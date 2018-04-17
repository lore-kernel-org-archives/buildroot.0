From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 17 Apr 2018 18:48:22 +0200
Subject: [Buildroot] [PATCH 3/4] download/git: ensure we can checkout repos
 with submodule conversions
In-Reply-To: <cover.1523983687.git.yann.morin.1998@free.fr>
References: <cover.1523983687.git.yann.morin.1998@free.fr>
Message-ID: <a45b9ba78d527d29cfd5cc0daf4c767c7feb8643.1523983687.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When a repository has had a sub-dir <-> submodule conversion, checking
out a working copy from before/after the conversion can leave along a
few untracked files, expecially the .git files from submodules.

Ideally, we'd use "git submodule deinit --all" before the checkout to
the new ref, but deinit was only introduced in v1.8.3, which is still
not available in some enterprise-grade distros (RHEEL6 still has 1.7.1
AFAIK).

So, we use an alternate trick: we forcibly checkout the new ref, after
which we manually remove all .git files (not dirs!) in the new working
copy, then clean it up to remove all untracked and ignored files and
dirs, then we checkout to a pristine state.

From experimentation, this sequence looks like it is working as
expected...

However, this means we must forcibly update and initialise submodules
afterwards, so that their .git files get restored properly (and their
content checked out cleanly).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/download/git | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/support/download/git b/support/download/git
index 1172310186..e71ff029cd 100755
--- a/support/download/git
+++ b/support/download/git
@@ -97,7 +97,21 @@ fi
 
 # Checkout the required changeset, so that we can update the required
 # submodules.
-_git checkout -q "'${cset}'"
+_git checkout -f -q "'${cset}'"
+
+# We would need to deregister _current_ submodules before we checkout.
+# git-clean (which is used below) does not get rid of .git files (no
+# git command, but git-submodule, ever touches .git files or dirs);
+# Using "git submodule deinit --all" would remove all the files for
+# all submodules, including the corresponding .git files. However, it
+# was only introduced with git-1.8.3, which is too recent for some
+# entreprise-grade distros. So, we fall-back to just removing .git
+# files after the checkout.
+find . -type f -name .git -exec rm {} +
+
+# Restore repository to the new, clean-checkout state.
+_git clean -ffdx
+_git checkout -- .
 
 # Get date of commit to generate a reproducible archive.
 # %cD is RFC2822, so it's fully qualified, with TZ and all.
@@ -105,7 +119,7 @@ date="$( _git log -1 --pretty=format:%cD )"
 
 # There might be submodules, so fetch them.
 if [ ${recurse} -eq 1 ]; then
-    _git submodule update --init --recursive
+    _git submodule update --init --recursive --force
 fi
 
 # Generate the archive, sort with the C locale so that it is reproducible.
-- 
2.14.1
