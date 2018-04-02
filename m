From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Apr 2018 17:48:56 +0200
Subject: [Buildroot] [git commit] core/download: look for archives in the
 global download dir first
Message-ID: <20180402154921.C570E8127C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e80d1d0af448c33f93a9a913cd0a34c406a29cf4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For existing setups, the global donload directory may have a lot of the
required archives, so look into there before attempting a download.

We simply hard-link them if found there and not in the new per-package
loaction. Then we resume the existing procedure (which means the new
hardlink will get removed if it happened to not match the hash).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-download.mk     |  1 +
 support/download/dl-wrapper | 10 +++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index b7f1d43920..7ed95f2b2c 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -97,6 +97,7 @@ define DOWNLOAD
 	$(EXTRA_ENV) $(FLOCK) $(DL_WRAPPER) \
 		-c '$($(PKG)_DL_VERSION)' \
 		-d '$($(PKG)_DL_DIR)' \
+		-D '$(DL_DIR)' \
 		-f '$(notdir $(1))' \
 		-H '$(PKGDIR)/$($(PKG)_RAWNAME).hash' \
 		-n '$($(PKG)_BASENAME_RAW)' \
diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index af2950ac3b..ce44752df0 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -27,11 +27,12 @@ main() {
     local -a uris
 
     # Parse our options; anything after '--' is for the backend
-    while getopts ":hc:d:o:n:N:H:rf:u:q" OPT; do
+    while getopts ":hc:d:D:o:n:N:H:rf:u:q" OPT; do
         case "${OPT}" in
         h)  help; exit 0;;
         c)  cset="${OPTARG}";;
         d)  dl_dir="${OPTARG}";;
+        D)  old_dl_dir="${OPTARG}";;
         o)  output="${OPTARG}";;
         n)  raw_base_name="${OPTARG}";;
         N)  base_name="${OPTARG}";;
@@ -52,6 +53,13 @@ main() {
         error "no output specified, use -o\n"
     fi
 
+    # Legacy handling: check if the file already exists in the global
+    # download directory. If it does, hard-link it. If it turns out it
+    # was an incorrect download, we'd still check it below anyway.
+    if [ ! -e "${output}" -a -e "${old_dl_dir}/${filename}" ]; then
+        ln "${old_dl_dir}/${filename}" "${output}"
+    fi
+
     # If the output file already exists and:
     # - there's no .hash file: do not download it again and exit promptly
     # - matches all its hashes: do not download it again and exit promptly
