From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Date: Fri,  2 Dec 2016 13:21:20 -0200
Subject: [Buildroot] [PATCH v2 1/4] support/download/git: do not use git
	clone
In-Reply-To: <20161202152123.20399-1-ricardo.martincoski@datacom.ind.br>
References: <20161202152123.20399-1-ricardo.martincoski@datacom.ind.br>
Message-ID: <20161202152123.20399-2-ricardo.martincoski@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rewrite the script using git init and git fetch instead of git clone,
based in some ideas discussed during the review of [1].

Always using git init + git fetch has these advantages:
- git fetch works with all kinds of refs, while git clone supports only
  branches and tags without the ref/heads/ and ref/tags/ prefixes;
- a fetch can be done for the head of those refs (the same as git clone
  -b but works for all refs);
- the objects already downloaded by a call to git fetch are reused in
  the next call.

First ask the remote for its references using git ls-remote and save the
output to a file. Later on, inspect the saved file for the desired
change set, determining if it is a named ref and so can be downloaded
using a shallow fetch.
Use an analytical solution to inspect the output of git ls-remote
instead of a single awk line. It makes each line of code simple: 'grep'
to check the entry is in the ls-remote output and 'cut' to actually get
the reference to use.

A concern that arrives from this method is that the remote can change
between the git ls-remote and the git fetch, but in this case, once the
script creates the equivalent of a shallow clone, the fetch and the
checkout do what is expected:
- for a removed named reference (branch, tag or special ref), the fetch
  fails, falling back to a possibly successful checkout after all
  branches and tags are fetched (the checkout will only succeed in
  specific cases, e.g. the remote removed a branch but created a tag
  with the same name);
- for a changed named reference (branch, tag or special ref), the fetch
  and checkout are successful using the "new" sha1 from the remote.

Move the git checkout command together to each git fetch command since
now the checkout can fail (if the change set is not yet fetched) falling
back to the next method (that downloads more objects from the remote).

When doing a full fetch in a local shallow copy, use --unshallow to
ensure the local copy is converted to a complete one.

If after the fetch of all branches and tags (equivalent to git clone)
the desired change set cannot be checked out, do a fetch of all
references (equivalent to git clone --mirror). This approach allows the
use of any unambiguous partial sha1 as package version and also allows
the use of sha1 of special refs, while keeping the usual bandwidth need
unchanged by avoiding downloading special refs when not needed.

[1] http://patchwork.ozlabs.org/patch/681841/

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
---
Please notice the comment I added to the code about falling back to full
clone when the remote only supports dumb http transport is not a new
behavior of git init + git fetch. All git commands, including git clone,
refuse to use --depth for dumb http.

Changes v1 -> v2:
  - removed acked-by/tested-by since the diff to v1 is not trivial;
  - use grep -E to avoid lots of escaping (Arnout);
  - move each checkout together to the fetch it belongs (Arnout);
  - save the output of grep to a temporary file and then get the ref
    name using cut instead of using awk (Arnout);
    - notice I extended this by using 3 temporary files. It was done to
      avoid problem with funny (valid!) names of branches and tags, e.g.
      'bra{2}ch' or 'tag$$'. Now we first do a strict grep (grep -F) and
      then its output can be checked in a less strict way. Notice using
      grep -F is the only way to make '.' not match any character
      without using e.g. bash pattern substitution to escape the change
      set before passing to grep;
  - moved the optimized download of sha1 to a separate patch (Arnout);
  - use of head -1 to get the first match (this is an extension of the
    suggestion from Arnout of using tail -1 to get the last match);
  - use if [ "$ref" ] instead of a specific flag (Arnout);
  - use ${repo} as parameter to git fetch instead of adding a remote
    (Arnout);
  - wrap to 80 columns (Arnout);
    - only one line remains with 84 chars;
  - allow optimized download of tags when using ancient git client (e.g.
    1.7.1 in RHEL6);
  - the script is now much more alike the version in current master
    (only one flag 'git_done' is used and few empty lines v1 introduced
    were removed), so comparing which code is equivalent to each should
    be easier in this version;
  - do not use a separate namespace refs/buildroot since now ${ref} is
    always in the complete form refs/tags/tag;
  - --unshallow to ensure to convert a shallow copy to a complete one;
  - added more precise comments for the cases the remote changed after
    git ls-remote;
  - added more comments;
  - update the commit message.
---
 support/download/git | 90 ++++++++++++++++++++++++++++++++++------------------
 1 file changed, 60 insertions(+), 30 deletions(-)

diff --git a/support/download/git b/support/download/git
index 792141183..0780c6a9e 100755
--- a/support/download/git
+++ b/support/download/git
@@ -38,44 +38,74 @@ _git() {
     eval ${GIT} "${@}"
 }
 
-# Try a shallow clone, since it is faster than a full clone - but that only
-# works if the version is a ref (tag or branch). Before trying to do a shallow
-# clone we check if ${cset} is in the list provided by git ls-remote. If not
-# we fall back on a full clone.
-#
-# Messages for the type of clone used are provided to ease debugging in case of
-# problems
+_git init ${verbose} "'${basename}'"
+
+pushd "${basename}" >/dev/null
+
+# Save temporary files inside the .git directory that will be deleted after the
+# checkout is done.
+a_r=".git/all_refs"
+c_r=".git/candidate_refs"
+m_r=".git/matching_refs"
+
+# Ask the server the list of all refs that can use the most optimized download
+# (git fetch --depth 1). In the case the remote gets updated between this
+# command and the git fetch, fall back to a full fetch.
+_git ls-remote "'${repo}'" >${a_r}
+
+# Do a strict filtering before hand, so we can use less strict checking to
+# determine a cset can use the optimized download. This way, refs with funny
+# names (e.g. 'bra{2}nch', 'tag$$') will simply fall back to a full fetch.
+if grep -F "${cset}" ${a_r} >${c_r} 2>/dev/null; then
+    if grep -E "\<(|(|refs/)(heads|tags)/)${cset}$" ${c_r} >${m_r} 2>/dev/null; then
+        # Support branches and tags in the simplified form.
+        # Support branches and tags and special refs in the form refs/tags/tag.
+        # NOTE: When using an ancient git client, the fetch of a tag in the
+        # simplified form fails and would fall back to a full fetch. Git version
+        # 1.7.1 (RHEL6) fails, 1.8.2.3 (RHEL5+EPEL) succeeds. Instead of using
+        # the received ${cset} as ref, always use the complete form.
+        # When the name is ambiguous (there is a branch and a tag with the same
+        # name), the branch is selected. This way we behave like git fetch, git
+        # clone and git checkout. To accomplish this we use the first match
+        # because output of git ls-remote is already sorted by ref.
+        ref="$(cut -f 2 ${m_r} | head -1)"
+    fi
+fi
 git_done=0
-if [ -n "$(_git ls-remote "'${repo}'" "'${cset}'" 2>&1)" ]; then
-    printf "Doing shallow clone\n"
-    if _git clone ${verbose} "${@}" --depth 1 -b "'${cset}'" "'${repo}'" "'${basename}'"; then
-        git_done=1
+if [ "${ref}" ]; then
+    printf "Doing shallow fetch, using '%s' to get '%s'\n" "${ref}" "${cset}"
+    # Because ${ref} is always in the complete form we don't need to create a
+    # separate namespace (i.e. refs/buildroot/) and just use the ref as is.
+    if _git fetch -u ${verbose} "${@}" --depth 1 "'${repo}'" \
+                  "'+${ref}:${ref}'" 2>&1; then
+        unshallow=--unshallow
+        if _git checkout -q "'${cset}'" 2>&1; then
+            git_done=1
+        else
+            printf "Checkout failed, falling back to doing a full fetch\n"
+        fi
     else
-        printf "Shallow clone failed, falling back to doing a full clone\n"
+        # It catches the case the remote supports only dumb http transport.
+        # It catches the case the remote removed the ref after git ls-remote.
+        printf "Shallow fetch failed, falling back to doing a full fetch\n"
     fi
 fi
 if [ ${git_done} -eq 0 ]; then
-    printf "Doing full clone\n"
-    _git clone ${verbose} "${@}" "'${repo}'" "'${basename}'"
+    printf "Doing full fetch\n"
+    # Fetch all branch and tag refs. The same as git clone.
+    _git fetch -u ${verbose} "${@}" ${unshallow} "'${repo}'" \
+               "'+refs/tags/*:refs/tags/*'" "'+refs/heads/*:refs/heads/*'"
+    if _git checkout -q "'${cset}'" 2>&1; then
+        git_done=1
+    fi
 fi
-
-pushd "${basename}" >/dev/null
-
-# Try to get the special refs exposed by some forges (pull-requests for
-# github, changes for gerrit...). There is no easy way to know whether
-# the cset the user passed us is such a special ref or a tag or a sha1
-# or whatever else. We'll eventually fail at checking out that cset,
-# below, if there is an issue anyway. Since most of the cset we're gonna
-# have to clone are not such special refs, consign the output to oblivion
-# so as not to alarm unsuspecting users, but still trace it as a warning.
-if ! _git fetch origin "'${cset}:${cset}'" >/dev/null 2>&1; then
-    printf "Could not fetch special ref '%s'; assuming it is not special.\n" "${cset}"
+if [ ${git_done} -eq 0 ]; then
+    printf "Doing mirror fetch\n"
+    # Fetch all refs, including special refs. The same as git clone --mirror.
+    _git fetch -u ${verbose} "${@}" ${unshallow} "'${repo}'" "'+refs/*:refs/*'"
+    _git checkout -q "'${cset}'"
 fi
 
-# Checkout the required changeset, so that we can update the required
-# submodules.
-_git checkout -q "'${cset}'"
-
 # Get date of commit to generate a reproducible archive.
 # %cD is RFC2822, so it's fully qualified, with TZ and all.
 date="$( _git log -1 --pretty=format:%cD )"
-- 
2.11.0
