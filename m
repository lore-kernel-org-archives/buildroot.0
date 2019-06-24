From: John Keeping <john@metanate.com>
Date: Mon, 24 Jun 2019 12:32:24 +0100
Subject: [Buildroot] [PATCH v2 2/2] download/git: ban branch references
In-Reply-To: <20190624113224.22685-1-john@metanate.com>
References: <20190624123027.485c128f@donbot>
 <20190624113224.22685-1-john@metanate.com>
Message-ID: <20190624113224.22685-2-john@metanate.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As described in the manual, using a branch name as a version is not
supported.  However, nothing enforces this so it is easy to specify a
branch name either accidentally or because new developers have not read
through the manual.

For Git it is reasonably easy to catch most violations of this rule and
fail the fetch phase.  We now only accept tags or raw commit hashes;
it's possible that there are other special refs which are known to be
stable and this can be extended to support those in the future if
required.

Signed-off-by: John Keeping <john@metanate.com>
---
 support/download/git | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/support/download/git b/support/download/git
index 02bf01bb95..5b5be92d15 100755
--- a/support/download/git
+++ b/support/download/git
@@ -133,6 +133,20 @@ if ! _git rev-parse --quiet --verify "'${cset}^{commit}'" >/dev/null 2>&1; then
     exit 1
 fi
 
+# Check that the specified version is not a branch. We expect a tag or
+# raw commit hash, and accept some special refs as above. Using a branch
+# is forbidden because these are mutable references.
+case "$(_git rev-parse --symbolic-full-name "${cset}" 2>/dev/null)" in
+    refs/tags/*)
+        : ok
+        ;;
+    refs/*)
+        printf >&2 "Refusing to use Git branch '%s'.\n" "${cset}"
+        exit 1
+        ;;
+    # Anything else is not a ref, must be a raw hash which is ok.
+esac
+
 # The new cset we want to checkout might have different submodules, or
 # have sub-dirs converted to/from a submodule. So we would need to
 # deregister _current_ submodules before we checkout.
-- 
2.22.0
