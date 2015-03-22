From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Mar 2015 16:21:04 +0100
Subject: [Buildroot] [PATCH 5/7 v3] support/download: properly catch missing
	hashes
In-Reply-To: <cover.1427037564.git.yann.morin.1998@free.fr>
References: <cover.1427037564.git.yann.morin.1998@free.fr>
Message-ID: <ba2046d72b5e7f4de0bec7179fe328f6f611415a.1427037564.git.yann.morin.1998@free.fr>
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
Cc: Arnout Vandecappelle <arnout@mind.be>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
Changes v2 -> v3:
  - change the exit code to 1 (no need to differentiate exit codes here)
---
 support/download/dl-wrapper | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 514118c..ef2d872 100755
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
+        elif [ ${?} -ne 2 ]; then
+            # Do not remove the file, otherwise it might get re-downloaded
+            # from a later location (i.e. primary -> upstream -> mirror).
+            # Do not print a message, check-hash already did.
+            exit 1
         fi
         rm -f "${output}"
         warn "Re-downloading '%s'...\n" "${output##*/}"
-- 
1.9.1
