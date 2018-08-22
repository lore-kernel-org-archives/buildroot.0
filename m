From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Aug 2018 23:10:55 +0200
Subject: [Buildroot] [PATCH 2/5] download/git: re-run the backend with a
 lock to the git tree
In-Reply-To: <cover.1534972250.git.yann.morin.1998@free.fr>
References: <cover.1534972250.git.yann.morin.1998@free.fr>
Message-ID: <b5a3123305e1d4cef3cbdb17985e73161d13f407.1534972250.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The access-pattern to the git repository must be entirely atomic.

This atomicity is currently guaranteed by the caller, from a higher
level. But this is not optimum, and it is better that the backend does
the locking it needs by itself, so that other backends from other builds
can still download for the same package (e.g. another build uses a wget
download for that package).

One would think that, ideally, we'd have three atomic sections, and that
we could release the lock in-between those sections:
  - setting the remote URL and fetching,
  - checking out, updating sub-modules, generating the archive,
  - compressing the archive.

However, this is not true, because another backend may acquire the lock
right after our first section, and decide to entirely remove the
repository (in the _on_error() trap), and thus, in the second section,
the commits we had fetched in the first section may now have disapeared.

So, in fact, the first two sections are really only one.

Now, once we have generated the tarball, we could indeed release the
lock, as we no longer need access to the repository. But releasing a
lock acquired by flock(1) is not trivial: we don't know the
filedescriptor that was used to open the directory, so we can't close
it to release the lock...

So, we just lock the whole backend: once we reach compressing the
archive, we're almost done anyway.

We do implement this locking policy by locking the git cache directory
right after it got created, and before we do any git command in there.
We do so by re-running the git backend under an flock(1), using a trick
explained in the manpage (except we don't use the script as lockfile,
but the git cache directory). Even though using an exclusive lock is the
default, we do request it, to be sure.

When running under the lock, we then know we have exclusive access to
the repository, and we can do whatever we need in it.

When the backend ends, its filesdecriptors are closed (by the kernel),
thus freeing the lock for another to acquire.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 support/download/git | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/support/download/git b/support/download/git
index 17ca04eb98..1a3d562605 100755
--- a/support/download/git
+++ b/support/download/git
@@ -25,6 +25,10 @@ declare -a OPTS=("${@}")
 # case an unexpected and unsupported situation arises with submodules
 # or uncommitted stuff (e.g. if the user manually mucked around in the
 # git cache).
+#
+# To be noted: this function is only called while we have the lock on
+# the git cache directory, so we can't remove it.
+#
 _on_error() {
     local ret=${?}
 
@@ -38,7 +42,10 @@ _on_error() {
     printf "Removing it and starting afresh.\n" >&2
 
     popd >/dev/null
-    rm -rf "${git_cache}"
+
+    # Remove everything in the git cache, but the directory itself,
+    # so as not to have to play tricks with the lock
+    find "${git_cache}" -mindepth 1 -maxdepth 1 -exec rm -rf {} \;
 
     exec "${myname}" "${OPTS[@]}" || exit ${ret}
 }
@@ -64,6 +71,21 @@ shift $((OPTIND-1)) # Get rid of our options
 # Create and cd into the directory that will contain the local git cache
 git_cache="${dl_dir}/git"
 mkdir -p "${git_cache}"
+
+# From now-on, we need exclusive access to repository. But this git
+# backend is not concurrent-safe; others instances may have to touch
+# the same git repository. So, we re-run under flock if not already
+# the case, but only after we've created the cache dir, so that we
+# only lock the cache, not the full dl-dir.
+#
+# Note that if this is our second-chance (see _on_error(), above), then
+# we already have the lock, and won't try to reacquire it (BR_GIT_FLOCK
+# is already set to the correct value).
+if [ "${BR_GIT_FLOCK}" != "${git_cache}" ]; then
+    export BR_GIT_FLOCK="${git_cache}"
+    exec flock  --exclusive --no-fork "${git_cache}" "${0}" "${OPTS[@]}"
+fi
+
 pushd "${git_cache}" >/dev/null
 
 # Any error now should try to recover
@@ -193,6 +215,12 @@ LC_ALL=C sort <"${output}.list" >"${output}.list.sorted"
 tar cf - --transform="s#^\./#${basename}/#" \
          --numeric-owner --owner=0 --group=0 --mtime="${date}" --format=gnu \
          -T "${output}.list.sorted" >"${output}.tar"
+
+# From now on, we could very well release the lock we have on the git
+# cache directory, but there is no simple solution for that (we don't
+# know its filedescriptor). So, just go on with our business, we're
+# almost done anyway...
+
 gzip -6 -n <"${output}.tar" >"${output}"
 
 rm -f "${output}.list"
-- 
2.14.1
