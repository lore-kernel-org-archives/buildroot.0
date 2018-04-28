From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 28 Apr 2018 21:34:48 +0200
Subject: [Buildroot] [PATCH 6/7 v4] download/git: ensure we can checkout
 repos with submodule conversions
In-Reply-To: <cover.1524944063.git.yann.morin.1998@free.fr>
References: <cover.1524944063.git.yann.morin.1998@free.fr>
Message-ID: <cc5f8b3c613a2a48d69abb15fa841035cacb0036.1524944063.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When a git tree has had sub-dir <-> sub-module conversions, or has had
submodules added or removed over the course of time, checking out a
changeset across those conversions/additions/removals may leave
untracked files, or may fail because of a conflict of type.

So, before we checkout the new changeset, we forcibly remove the
submodules. The new set of submodules, if any, will be restored later.

Ideally, we would use a native git command: git submodule deinit --all.
However, that was only introduced in git 1.8.3 which, while not being
recent by modern standards, is still too old for some enterprise-grade
distributions (RHEL6 only has git-1.7.1).

So, instead, we just use git submodule foreach, to rm -rf the submodules
directory.

Again, we would ideally use 'cd $toplevel && rm -rf $path', but
$toplevel was only introduced in git 1.7.2. $path has always been there.

So, instead, we just cd back one level, and remove the basename of the
directory.

Eventually, we need to get rid of now-empty and untracked directories,
that were parents of a removed submodule. For example. ./foo/bar/ was a
submodule, so ./foo/bar/ was removed, which left ./foo/ around.

Yet again, recent-ish git versions would have removed it during the
forced checkout, but old-ish versions (e.g. 1.7.1) do not remove it with
the forced checkout.

Instead we rely on the already used forced-forced clean of directories,
untracked, and ignored content, to really get rid of extra stuff we are
not interested in.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 support/download/git | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/support/download/git b/support/download/git
index ca8c94fa3b..b98a5d6143 100755
--- a/support/download/git
+++ b/support/download/git
@@ -152,12 +152,39 @@ if ! _git rev-parse --quiet --verify "'${cset}^{commit}'" >/dev/null 2>&1; then
     exit 1
 fi
 
+# The new cset we want to checkout might have different submodules, or
+# have sub-dirs converted to/from a submodule. So we would need to
+# deregister _current_ submodules before we checkout.
+#
+# Using "git submodule deinit --all" would remove all the files for
+# all submodules, including the corresponding .git files or directories.
+# However, it  was only introduced with git-1.8.3, which is too recent
+# for some enterprise-grade distros.
+#
+# So, we fall-back to just removing all submodules directories. We do
+# not need to be recursive, as removing a submodule will de-facto remove
+# its own submodules.
+#
+# For recent git versions, the repository for submodules is stored
+# inside the repository of the super repository, so the following will
+# only remove the working copies of submodules, effectively caching the
+# submodules.
+#
+# For older versions however, the repository is stored in the .git/ of
+# the submodule directory, so the following will effectively remove the
+# the working copy as well as the repository, which means submodules
+# will not be cached for older versions.
+#
+cmd='printf "Deregistering submodule \"%s\"\n" "${path}" && cd .. && rm -rf "${path##*/}"'
+_git submodule --quiet foreach "'${cmd}'"
+
 # Checkout the required changeset, so that we can update the required
 # submodules.
 _git checkout -f -q "'${cset}'"
 
 # Get rid of now-untracked directories (in case a git operation was
-# interrupted in a previous run).
+# interrupted in a previous run, or to get rid of empty directories
+# that were parrents of submodules removed above).
 _git clean -ffdx
 
 # Get date of commit to generate a reproducible archive.
-- 
2.14.1
