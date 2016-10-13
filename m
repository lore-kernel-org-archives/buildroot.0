From: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
Date: Thu, 13 Oct 2016 10:50:59 -0500
Subject: [Buildroot] [PATCH 1/1] support/download: Add git download method
	for SHAs
Message-ID: <1476373859-51202-1-git-send-email-bryce.ferguson@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Brandon Maier <brandon.maier@rockwellcollins.com>

Shallow clones don't work for downloading SHAs. However it's common to
track a tag or branch by the commit SHA so that a branch or tag doesn't
unexpectedly change.

We can take advantage of this scenario by searching the remote for a ref
that it equivalent to our sha, then shallow cloning that ref instead.

Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
Signed-off-by: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
---
 support/download/git | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/support/download/git b/support/download/git
index 281db61..1c6548d 100755
--- a/support/download/git
+++ b/support/download/git
@@ -55,6 +55,23 @@ if [ -n "$(_git ls-remote "'${repo}'" "'${cset}'" 2>&1)" ]; then
     fi
 fi
 if [ ${git_done} -eq 0 ]; then
+    # See if $cset is a sha that maps to a branch, then shallow clone that branch
+    equivalent_ref="$(_git ls-remote --heads --tags "'${repo}'" | awk "/^${cset}/{ print \$2; exit }" | sed 's,refs/\(tags\|heads\)/,,')"
+    if [ -n "$equivalent_ref" ]; then
+        printf "Doing shallow clone with cset '%s' as '%s'\n" "$cset" "$equivalent_ref"
+        if _git clone ${verbose} "${@}" --depth 1 -b "'${equivalent_ref}'" "'${repo}'" "'${basename}'"; then
+            if (cd "${basename}" && _git show "'${cset}'" >/dev/null 2>&1); then
+                git_done=1
+            else
+                rm -rf "${basename}"
+                printf "Shallow clone failed, checked out wrong revision, falling back to doing a full clone\n"
+            fi
+        else
+            printf "Shallow clone failed, falling back to doing a full clone\n"
+        fi
+    fi
+fi
+if [ ${git_done} -eq 0 ]; then
     printf "Doing full clone\n"
     _git clone ${verbose} "${@}" "'${repo}'" "'${basename}'"
 fi
-- 
1.9.1
