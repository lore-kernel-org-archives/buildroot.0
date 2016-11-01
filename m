From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Date: Tue,  1 Nov 2016 17:33:54 -0200
Subject: [Buildroot] [PATCH 3/3] support/download/git: do not use git clone
In-Reply-To: <20161101193354.8716-1-ricardo.martincoski@datacom.ind.br>
References: <20161101193354.8716-1-ricardo.martincoski@datacom.ind.br>
Message-ID: <20161101193354.8716-3-ricardo.martincoski@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The logic of the script was completely rewritten based in some ideas
discussed during the review of [1].

Always using git init + git fetch has these advantages:
- git fetch works with all kinds of refs, while git clone supports only
  branches and tags without the ref/heads/ and ref/tags/ prefixes;
- a shallow fetch can be done for the head of those refs.

The remote is first asked for its references using git ls-remote saving
the output to a file.
This file is later on compared to the desired change set, determining if
it is a branch, tag, special ref or sha1.
A concern that arrives from this method is that the remote can change
between the git ls-remote and the git fetch, but in this case, once the
script creates a shallow fetch, the checkout does what it is expected:
- for a named reference (branch, tag or special ref), the fetch and
  checkout are successful using the "new" sha1 from the remote;
- for a sha1 of a branch, the fetch fails (because the sha1 it is not
  anymore at branch head), falling back to a successful full fetch;
- for a sha1 of a commit pointed by a tag (that should not be changed
  but it can be changed) the same behavior of a sha1 of a branch takes
  place;
- for a sha1 only accessible by a special refs, the checkout fails,
  falling back to an unsuccessful checkout after full fetch. This can be
  caused only be a error from a developer.

An analytical solution is used instead of a single awk line. It makes
each line of code simple: grep to check the entry is in the ls-remote
output and awk to actually get the reference to use.

[1] http://patchwork.ozlabs.org/patch/681841/

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
---
 support/download/git | 91 ++++++++++++++++++++++++++++++++++------------------
 1 file changed, 60 insertions(+), 31 deletions(-)

diff --git a/support/download/git b/support/download/git
index f7eef15..1411d94 100755
--- a/support/download/git
+++ b/support/download/git
@@ -39,43 +39,72 @@ _git() {
     eval ${GIT} "${@}"
 }
 
-# Try a shallow clone, since it is faster than a full clone - but that only
-# works if the version is a ref (tag or branch). Before trying to do a shallow
-# clone we check if ${cset} is in the list provided by git ls-remote. If not
-# we fall back on a full clone.
-#
-# Messages for the type of clone used are provided to ease debugging in case of
-# problems
-git_done=0
-if [ -n "$(_git ls-remote "'${repo}'" "'${cset}'" 2>&1)" ]; then
-    printf "Doing shallow clone\n"
-    if _git clone ${verbose} "${@}" --depth 1 -b "'${cset}'" "'${repo}'" "'${basename}'"; then
-        git_done=1
-    else
-        printf "Shallow clone failed, falling back to doing a full clone\n"
+_git init ${verbose} "'${basename}'"
+
+pushd "${basename}" >/dev/null
+
+# Save the temporary file inside the .git directory that will be deleted after the checkout is done.
+tmpf=".git/ls-remote"
+_git ls-remote "'${repo}'" > "${tmpf}"
+
+do_a_shallow_fetch=0
+if grep "\<\(\|\(\|refs/\)\(heads\|tags\)/\)${cset}$" "${tmpf}" >/dev/null 2>&1; then
+    printf "The desired version is a named reference\n"
+    # Support branches and tags in the simplified form.
+    # Support branches and tags and special refs in the complete form refs/heads/branch.
+    # When the name is ambiguous, the branch will be selected (by git fetch or git clone).
+    ref="${cset}"
+    do_a_shallow_fetch=1
+elif grep "^${cset}" "${tmpf}" >/dev/null 2>&1; then
+    printf "The desired version is a sha1\n"
+    if [ ${#cset} -lt 40 -a "1" != "$(awk "/^${cset}/{print \$1|\"sort -u | wc -l\"}" "${tmpf}")" ]; then
+        printf "Ambiguous partial sha1\n"
+        awk "/^${cset}/{print \$1|\"sort -u | wc -l\"}" "${tmpf}"
+        exit 1
+    fi
+    # Accept full or unambiguous partial sha1. A sha1 can be referenced by many names.
+    # Prefer sha1 of commit pointed by a tag or sha1 of the tag itself,
+    # then sha1 pointed by any ref/*, and only then sha1 pointed by *HEAD.
+    ref="$(awk -F'[\t^]' "/^${cset}.*\trefs\/tags\//{ print \$2; exit }" "${tmpf}")"
+    if [ -z "${ref}" ]; then
+        ref="$(awk -F'[\t^]' "/^${cset}.*\trefs\//{ print \$2; exit }" "${tmpf}")"
+    fi
+    if [ -z "${ref}" ]; then
+        # sha1 is referenced by HEAD
+        ref="$(awk -F'[\t^]' "/^${cset}/{ print \$2; exit }" "${tmpf}")"
+    fi
+    if [ -n "${ref}" ]; then
+        printf "Fetching '%s' to get '%s'\n" "${ref}" "${cset}"
+        do_a_shallow_fetch=1
     fi
-fi
-if [ ${git_done} -eq 0 ]; then
-    printf "Doing full clone\n"
-    _git clone ${verbose} "${@}" "'${repo}'" "'${basename}'"
 fi
 
-pushd "${basename}" >/dev/null
+git_fetch_done=0
+if [ ${do_a_shallow_fetch} -eq 1 ]; then
+    printf "Doing shallow fetch\n"
+    if _git fetch ${verbose} "${@}" --depth 1 "'${repo}'" "'${ref}:refs/buildroot/${cset}'" 2>&1; then
+        git_fetch_done=1
+    else
+        # It catches the case the remote changed after ls-remote.
+        printf "Shallow fetch failed, falling back to doing a full fetch\n"
+    fi
+fi
 
-# Try to get the special refs exposed by some forges (pull-requests for
-# github, changes for gerrit...). There is no easy way to know whether
-# the cset the user passed us is such a special ref or a tag or a sha1
-# or whatever else. We'll eventually fail at checking out that cset,
-# below, if there is an issue anyway. Since most of the cset we're gonna
-# have to clone are not such special refs, consign the output to oblivion
-# so as not to alarm unsuspecting users, but still trace it as a warning.
-if ! _git fetch origin "'${cset}:${cset}'" >/dev/null 2>&1; then
-    printf "Could not fetch special ref '%s'; assuming it is not special.\n" "${cset}"
+git_checkout_done=0
+if [ ${git_fetch_done} -eq 1 ]; then
+    if _git checkout -q "'refs/buildroot/${cset}'" 2>&1; then
+        git_checkout_done=1
+    else
+        printf "Checkout failed, falling back to doing a full fetch\n"
+    fi
 fi
 
-# Checkout the required changeset, so that we can update the required
-# submodules.
-_git checkout -q "'${cset}'"
+if [ ${git_checkout_done} -eq 0 ]; then
+    printf "Doing full fetch\n"
+    _git remote add origin "'${repo}'"
+    _git fetch ${verbose} "${@}" origin
+    _git checkout -q "'${cset}'"
+fi
 
 # Get date of commit to generate a reproducible archive.
 # %cD is RFC2822, so it's fully qualified, with TZ and all.
-- 
2.9.3
