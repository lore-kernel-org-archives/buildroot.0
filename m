From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Apr 2018 17:48:56 +0200
Subject: [Buildroot] [git commit] download: add missing '-d' option
Message-ID: <20180402154921.B539B8127C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d2a018ddf950b53d1d50d09d3af92849d8f5994
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The infrastructure needs to give the 'dl_dir' to the dl-wrapper which in its
turn needs to give it to the helper.  It will only be used by the 'git'
helper as of now.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-download.mk     | 1 +
 support/download/dl-wrapper | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 4fdb283acc..b7f1d43920 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -96,6 +96,7 @@ define DOWNLOAD
 		BR_NO_CHECK_HASH_FOR=$(notdir $(call qstrip,$(1)))) \
 	$(EXTRA_ENV) $(FLOCK) $(DL_WRAPPER) \
 		-c '$($(PKG)_DL_VERSION)' \
+		-d '$($(PKG)_DL_DIR)' \
 		-f '$(notdir $(1))' \
 		-H '$(PKGDIR)/$($(PKG)_RAWNAME).hash' \
 		-n '$($(PKG)_BASENAME_RAW)' \
diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index cd903f92d9..af2950ac3b 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -19,7 +19,7 @@
 # We want to catch any unexpected failure, and exit immediately.
 set -e
 
-export BR_BACKEND_DL_GETOPTS=":hc:o:n:N:H:ru:qf:e"
+export BR_BACKEND_DL_GETOPTS=":hc:d:o:n:N:H:ru:qf:e"
 
 main() {
     local OPT OPTARG
@@ -27,10 +27,11 @@ main() {
     local -a uris
 
     # Parse our options; anything after '--' is for the backend
-    while getopts ":hc:o:n:N:H:rf:u:q" OPT; do
+    while getopts ":hc:d:o:n:N:H:rf:u:q" OPT; do
         case "${OPT}" in
         h)  help; exit 0;;
         c)  cset="${OPTARG}";;
+        d)  dl_dir="${OPTARG}";;
         o)  output="${OPTARG}";;
         n)  raw_base_name="${OPTARG}";;
         N)  base_name="${OPTARG}";;
@@ -109,6 +110,7 @@ main() {
         if ! "${OLDPWD}/support/download/${backend}" \
                 $([ -n "${urlencode}" ] && printf %s '-e') \
                 -c "${cset}" \
+                -d "${dl_dir}" \
                 -n "${raw_base_name}" \
                 -N "${raw_name}" \
                 -f "${filename}" \
