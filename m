From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Apr 2018 11:07:53 +0200
Subject: [Buildroot] [PATCH 4/6 v2] download/git: ensure we can checkout
 repos with submodule conversions
In-Reply-To: <cover.1524388060.git.yann.morin.1998@free.fr>
References: <cover.1524388060.git.yann.morin.1998@free.fr>
Message-ID: <8fb3989964b1395626c31c57c0e4272d2258b25b.1524388060.git.yann.morin.1998@free.fr>
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
that were parents of a removed submodule. For example. ./foo/sub/ was a
submodule, so ./foo/bar/ was removed, which left ./foo/ around.

Yet again, recent-ish git versions would have removed it during the
forced checkout, but old-ish versions (e.g. 1.7.1) do not remove it with
the forced checkout.

Instead we use a forced-forced clean of directories, untracked, and
ignored content, to really get rid of extra stuff we are not interested
in.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 support/download/git | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/support/download/git b/support/download/git
index d97d07c51f..344e253b1d 100755
--- a/support/download/git
+++ b/support/download/git
@@ -123,10 +123,39 @@ if ! _git fetch origin "'${cset}:${cset}'" >/dev/null 2>&1; then
     printf "Could not fetch special ref '%s'; assuming it is not special.\n" "${cset}"
 fi
 
+# The new cset we want to checkout might have different submodules, or
+# have sub-dirs converted to.from a submodule. So we would need to
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
+# only remove the working copies of submodule, effectively caching the
+# submodules.
+#
+# For older versions, the repository is stored in the .git/ of the
+# submodule directory, so the following will effectively remove the
+# the working copy as well as the repository, which means submodules
+# will not be cached for older versions.
+#
+_git submodule --quiet foreach 'cd .. && rm -rf "${path##*/}"'
+
 # Checkout the required changeset, so that we can update the required
 # submodules.
 _git checkout -f -q "'${cset}'"
 
+# Get rid of now-untracked directories (that were parrents of submodules
+# removed above).
+_git clean -ffdx
+
 # Get date of commit to generate a reproducible archive.
 # %cD is RFC2822, so it's fully qualified, with TZ and all.
 date="$( _git log -1 --pretty=format:%cD )"
-- 
2.14.1
