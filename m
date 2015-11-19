From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Thu, 19 Nov 2015 11:36:03 +0100
Subject: [Buildroot] [PATCH 2/5] download/git: allow to create archives
	containing shallowed git repos
In-Reply-To: <1447929366-8972-1-git-send-email-jezz@sysmic.org>
References: <1447929366-8972-1-git-send-email-jezz@sysmic.org>
Message-ID: <1447929366-8972-3-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We introduce a new tarball format for projects managed with git. This
new format is a shallowed version of upstream repository.

This format is a little larger (20 to 50% in my tests) than standard
one and contains information about upstream git repository.

That simplify workflow with upstream. It is now possible to reconnect
a build directory with upstream repository using:

   git fetch --unshallow

If you want to also get remote tags and branch (as in a standard
clone), run:

   git config remote.origin.fetch refs/heads/*:refs/remotes/origin/*
   git fetch

For large repository, you can use a local repository as reference in
order to speedup unshallow process (read warnings about '--reference'
option in git-clone manual page):

   echo "repo_path/.git/objects" > .git/objects/info/alternates
   git fetch --unshallow

Note 1: some repository does not support unshallowing (especially
anonscm.debian.org)

Note 2: I have tested this patch with git 2.1 (from Debian Jessie).

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 support/download/git | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/support/download/git b/support/download/git
index 0e6103b..6755f65 100755
--- a/support/download/git
+++ b/support/download/git
@@ -46,7 +46,31 @@ if [ ${git_done} -eq 0 ]; then
     ${GIT} clone ${verbose} --bare "${repo}" "${basename}"
 fi
 
-GIT_DIR="${basename}" \
-${GIT} archive --prefix="${basename}/" -o "${output}.tmp" --format=tar "${cset}"
+if [[ ${output} != *.git.tar.gz* ]]; then
+    GIT_DIR="${basename}" \
+    ${GIT} archive --prefix="${basename}/" -o "${output}.tmp" --format=tar "${cset}"
 
-gzip <"${output}.tmp" >"${output}"
+    gzip <"${output}.tmp" >"${output}"
+fi
+if [[ ${output} = *.git.tar.gz* ]]; then
+    GIT_DIR="${basename}" ${GIT} reset --soft ${cset}
+
+    # Git cannot shallow a repository on an arbitrary commit-id. It must be a
+    # symbolic reference of a remote repository (HEAD, tag or branch) (problem
+    # seems to be resolved in git 2.5).
+    # However, we want to be able to shallow on any commit-id.
+    # We didn't find any other way than use an intermediate repository in order
+    # to work around this limitation.
+    # (In add, this method make easier pruning of packed objects)
+    #
+    # Note 1: --depth is ignored in local clones. Git suggest to use file://
+    # in order to force copy of objects. We have to use an absolute path with
+    # these URIs
+    #
+    # Note 2: ${basename}.git will be removed by dl-wrapper (since it is in
+    # same directory than ${basename})
+    ${GIT} clone "file://$(readlink -f ${basename})" "${basename}.git" --bare --depth 1
+    GIT_DIR="${basename}.git" ${GIT} remote set-url origin "${repo}"
+
+    tar czf "${output}" "${basename}.git"
+fi
-- 
2.1.4
