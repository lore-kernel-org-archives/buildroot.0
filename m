From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Nov 2020 22:36:46 +0100
Subject: [Buildroot] [PATCH next 01/12] support/download/dl-wrapper: add
 concept of download post-processing
In-Reply-To: <20201119213658.1232531-1-thomas.petazzoni@bootlin.com>
References: <20201119213658.1232531-1-thomas.petazzoni@bootlin.com>
Message-ID: <20201119213658.1232531-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to support package managers such as Cargo (Rust) or Go, we
want to run some custom logic after the main download, but before
packing the tarball and checking the hash.

To implement this, this commit introduces a concept of download
post-processing: if -p <something> is passed to the dl-wrapper, then
support/download/<something>-post-process will be called.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/download/dl-wrapper | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 3315bd410e..2d74554213 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -25,7 +25,7 @@ main() {
     local -a uris
 
     # Parse our options; anything after '--' is for the backend
-    while getopts ":c:d:D:o:n:N:H:rf:u:q" OPT; do
+    while getopts ":c:d:D:o:n:N:H:rf:u:qp:" OPT; do
         case "${OPT}" in
         c)  cset="${OPTARG}";;
         d)  dl_dir="${OPTARG}";;
@@ -37,6 +37,7 @@ main() {
         r)  recurse="-r";;
         f)  filename="${OPTARG}";;
         u)  uris+=( "${OPTARG}" );;
+        p)  post_process="${OPTARG}";;
         q)  quiet="-q";;
         :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
         \?) error "unknown option '%s'\n" "${OPTARG}";;
@@ -135,6 +136,12 @@ main() {
             continue
         fi
 
+        if [ -n "${post_process}" ] ; then
+                ${OLDPWD}/support/download/${post_process}-post-process \
+                         -o "${tmpf}" \
+                         -n "${raw_base_name}"
+        fi
+
         # cd back to free the temp-dir, so we can remove it later
         cd "${OLDPWD}"
 
-- 
2.28.0
