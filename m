From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 17 Mar 2015 13:59:37 +0100
Subject: [Buildroot] [PATCH 4/5 v2] support/download: properly catch missing
	hashes
In-Reply-To: <cover.1426597114.git.yann.morin.1998@free.fr>
References: <cover.1426597114.git.yann.morin.1998@free.fr>
Message-ID: <635ccce48b7a43df2f151481b72e6e46f2aae1a0.1426597114.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When checking hashes reports no hash for a file, and this is treated as
an error (now: because BR2_ENFORCE_CHECK_HASH is set; later: because
that will be the new and only behaviour), exit promptly in error.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Changes v1 -> v2:
  - typo in commit
---
 support/download/dl-wrapper | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 514118c..c5eb582 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -45,10 +45,19 @@ main() {
         error "no output specified, use -o\n"
     fi
 
-    # If the output file already exists, do not download it again
+    # If the output file already exists and:
+    # - there's no .hash file: do not download it again and exit promptly
+    # - matches all its hashes: do not download it again and exit promptly
+    # - fails at least one of its hashes: force a re-download
+    # - there's no hash (but a .hash file): consider it a hard error
     if [ -e "${output}" ]; then
         if support/download/check-hash ${quiet} "${hfile}" "${output}" "${output##*/}"; then
             exit 0
+        elif [ ${?} -eq 2 ]; then
+            # Do not remove the file, otherwise it might get re-downloaded
+            # from a later location (i.e. primary -> upstream -> mirror).
+            # Do not print a message, check-hash already did
+            exit 2
         fi
         rm -f "${output}"
         warn "Re-downloading '%s'...\n" "${output##*/}"
-- 
1.9.1
