From: Benjamin Kamath <kamath.ben@gmail.com>
Date: Wed, 24 Aug 2016 10:47:28 -0700
Subject: [Buildroot] [PATCH v3] support/download/git: Prioritize remote
	archive
In-Reply-To: <1471469135-19009-1-git-send-email-kamath.ben@gmail.com>
References: <1471469135-19009-1-git-send-email-kamath.ben@gmail.com>
Message-ID: <1472060848-14178-1-git-send-email-kamath.ben@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Attempt to do a remote archive since it shortcuts us past a few steps when
available. Additionally. if the git server has uploadArchive.allowUnreachable
set to true, then this method can also work on arbitrary sha1s, offering a huge
speed advantage over a full clone.

Signed-off-by: Benjamin Kamath <kamath.ben@gmail.com>
---
Changes v2 -> v3:
    - Indicate to user if the remote archive fails (suggested by Yann)
    - redirect all errors from git archive to /dev/null since this
      operation fails on most public git servers
Changes v1 -> v2:
    - Skip remote archive for repositories with submodules (suggested by Yann)

 support/download/git | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/support/download/git b/support/download/git
index 416cd1b..ec49057 100755
--- a/support/download/git
+++ b/support/download/git
@@ -36,6 +36,22 @@ _git() {
     eval ${GIT} "${@}"
 }
 
+# Try a remote archive, since it is as fast as a shallow clone and can give us
+# an archive directly. Also, if uploadArchive.allowUnreachable is set to true
+# on the remote, this will also work for arbitrary sha1s, and will offer a
+# considerable speedup over a full clone. This will not work for submodules.
+# Since this command fails on most public git servers, consign the output to 
+# oblivion but still trace as a warning.
+if [ ${recurse} -eq 0 ]; then
+    printf "Doing remote archive\n"
+    if _git archive --format=tar.gz --prefix=${basename}/ --remote=${repo} \
+        -o ${output} ${cset} >/dev/null 2>&1; then
+        exit 0
+    else
+        printf "Remote archive failed, falling back to cloning\n"
+    fi
+fi
+
 # Try a shallow clone, since it is faster than a full clone - but that only
 # works if the version is a ref (tag or branch). Before trying to do a shallow
 # clone we check if ${cset} is in the list provided by git ls-remote. If not
-- 
2.7.4
