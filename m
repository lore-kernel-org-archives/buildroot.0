From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 2 Jul 2016 19:11:14 +0200
Subject: [Buildroot] [git commit] support/download/git: do not use git
	archive, handle it manually
Message-ID: <20160702235623.724517F9AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3abd5ba4243489b821d44e407528020cd8a138f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We currently use git-archive to generate the tarball. This is all handy
and dandy, but git-archive does not support submodules. In the follow-up
patch, we're going to handle submodules, so we would not be able to use
git-archive.

Instead, we manually generate the archive:
  - extract the tree to the requested cset,
  - get the date of the commit to store in the archive,
  - store only numeric owners,
  - store owner and group as 0 (zero, although any arbitrary value would
    have been fine, as long as it's a constant),
  - sort the files to store in the archive.

We also get rid of the .git directory, because there is no reason to
keep it in the context of Buildroot. Some people would love to keep it
so as to speed up later downloads when updating a package, but that is
not really doable. For example:
  - use current Buildroot
  - it would need foo-12345, so do a clone and keep the .git in the
    generated tarball
  - update Buildroot
  - it would need foo-98765
For that second clone, how could we know we would have to first extract
foo-12345 ? So, the .git in the archive is pretty much useless for
Buildroot.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: Matt Weber <matt@thewebers.ws>
Reviewed-by: Matt Weber <matt@thewebers.ws>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/download/git | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/support/download/git b/support/download/git
index 2d98923..d8094d2 100755
--- a/support/download/git
+++ b/support/download/git
@@ -65,9 +65,20 @@ if ! _git fetch origin "'${cset}:${cset}'" >/dev/null 2>&1; then
     printf "Could not fetch special ref '%s'; assuming it is not special.\n" "${cset}"
 fi
 
-_git archive --prefix="'${basename}/'" -o "'${output}.tmp'" --format=tar "'${cset}'"
+# Checkout the required changeset.
+_git checkout -q "'${cset}'"
+
+# Get date of commit to generate a reproducible archive.
+# %cD is RFC2822, so it's fully qualified, with TZ and all.
+date="$( _git show --no-patch --pretty=format:%cD )"
+
+# We do not need the .git dir and other gitfiles to generate the tarball
+find . \( -name .git -o -name .gitmodules -o -name .gitignore \) \
+       -exec rm -rf {} +
 
-# Not really required, but here for consistency
 popd >/dev/null
 
-gzip -n <"${output}.tmp" >"${output}"
+# Generate the archive, sort with the C locale so that it is reproducible
+tar cf - --numeric-owner --owner=0 --group=0 --mtime="${date}" \
+         -T <(find "${basename}" -not -type d |LC_ALL=C sort) \
+|gzip -n >"${output}"
