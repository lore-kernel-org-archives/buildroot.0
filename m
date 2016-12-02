From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Date: Fri,  2 Dec 2016 13:21:21 -0200
Subject: [Buildroot] [PATCH v2 2/4] support/download/git: optimized download
	of sha1
In-Reply-To: <20161202152123.20399-1-ricardo.martincoski@datacom.ind.br>
References: <20161202152123.20399-1-ricardo.martincoski@datacom.ind.br>
Message-ID: <20161202152123.20399-3-ricardo.martincoski@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Shallow fetch don't work for downloading SHAs. However it's common to
track a tag or branch by the commit SHA so that a branch or tag doesn't
unexpectedly change.

We can take advantage of this scenario by searching the remote for a ref
that it equivalent to our sha, then shallow fetching that ref instead.

Regarding the case the remote changes between the git ls-remote and the
git fetch, once the script creates the equivalent of a shallow clone,
the fetch and the checkout do what is expected:
- for a sha1 of a removed ref (branch, tag or special ref), the fetch
  fails, falling back to the equivalent of a full clone;
- for a sha1 of a changed ref (branch, tag or special ref), the checkout
  fails (because the desired sha1 is not fetched), falling back to the
  equivalent of a full clone;
In both cases, the checkout after the equivalent of a full clone or
mirror clone is successful if the sha1 is still reachable from any ref.

Similar patch was submitted in [1] using git clone.
[1] http://patchwork.ozlabs.org/patch/681841/

Reported-by: Brandon Maier <brandon.maier@rockwellcollins.com>
Reported-by: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
---
Changes v1 -> v2:
  - moved the optimized download of sha1 to this separate patch
    (Arnout);
  - part of commit message copied from Brandon's patch;
  - only full sha1 are optimized because the output of git ls-remote is
    a subset of all sha1 and so cannot be used to validate a sha1 is
    unambiguous in the full set of sha1s from the repo (that also
    include tree-ish sha1s);
  - save the output of grep to a temporary file and then get the ref
    name using cut instead of using awk (Arnout);
  - any reference that points to the sha1 can be used, we just want to
    avoid HEAD because it is the most volatile one. So use tail -1 to
    get the last match instead of doing many 'if's to accomplish the
    same goal (Arnout);
  - added more comments, especially this: ref for sha1 pointed by
    annotated tags shows a ^{} at the end in the output of ls-remote;
  - use 'Pattern substitution' from bash to remove ^{}.
---
 support/download/git | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/support/download/git b/support/download/git
index 0780c6a9e..42048ad48 100755
--- a/support/download/git
+++ b/support/download/git
@@ -69,6 +69,18 @@ if grep -F "${cset}" ${a_r} >${c_r} 2>/dev/null; then
         # clone and git checkout. To accomplish this we use the first match
         # because output of git ls-remote is already sorted by ref.
         ref="$(cut -f 2 ${m_r} | head -1)"
+    elif grep "^${cset}\>" ${c_r} >${m_r} 2>/dev/null; then
+        # Support sha1 of branch head and commit pointed by tag (annotated or
+        # not) and sha1 of special refs head.
+        # Do not support partial sha1 because it is possible it is unambiguous
+        # in the subset of ls-remote but ambiguous in the full set of all sha1.
+        # A sha1 can be referenced by many names. Any reference can be used but
+        # avoid using HEAD if possible because it is the most volatile one.
+        # HEAD appears at the begin of ls-remote, so use the last match.
+        ref="$(cut -f 2 ${m_r} | tail -1)"
+        # The ref of the sha1 pointed by an annotated tag ends with tag^{} in
+        # the output of git ls-remote but we want the name of the tag to fetch.
+        ref=${ref/%"^{}"}
     fi
 fi
 git_done=0
@@ -82,6 +94,8 @@ if [ "${ref}" ]; then
         if _git checkout -q "'${cset}'" 2>&1; then
             git_done=1
         else
+            # It catches the case we want a sha1 but the remote changed the ref
+            # after git ls-remote.
             printf "Checkout failed, falling back to doing a full fetch\n"
         fi
     else
-- 
2.11.0
