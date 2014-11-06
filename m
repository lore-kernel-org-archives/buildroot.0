From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu,  6 Nov 2014 10:13:37 +0100
Subject: [Buildroot] [PATCH v3 3/3] support/download: silence git if it is a
	silence build
In-Reply-To: <1415265217-18494-1-git-send-email-fabio.porcedda@gmail.com>
References: <1415265217-18494-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1415265217-18494-4-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If it is a silence build (make -s -> QUIET=-q), silence the git download
helper using "git clone -q" just like others download helpers,
e.g. wget.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---

Notes:
    v3:
     - add this patch

 package/pkg-download.mk |  3 ++-
 support/download/git    | 14 ++++++++++----
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 92240c0..265fb88 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -99,7 +99,8 @@ define DOWNLOAD_GIT
 		$(DL_DIR)/$($(PKG)_SOURCE) \
 		$($(PKG)_SITE) \
 		$($(PKG)_DL_VERSION) \
-		$($(PKG)_BASE_NAME)
+		$($(PKG)_BASE_NAME) \
+		$(QUIET)
 endef
 
 # TODO: improve to check that the given PKG_DL_VERSION exists on the remote
diff --git a/support/download/git b/support/download/git
index 5d36ca4..4ce9030 100755
--- a/support/download/git
+++ b/support/download/git
@@ -9,6 +9,7 @@ set -e
 #   $2: git repo
 #   $3: git cset
 #   $4: package's basename (eg. foobar-1.2.3)
+#   $5: "-q", optional quiet flag
 # And this environment:
 #   GIT      : the git command to call
 
@@ -16,21 +17,26 @@ output="${1}"
 repo="${2}"
 cset="${3}"
 basename="${4}"
+quiet="${5}"
 
 # Try to see if we can do a shallow clone, since it is faster
 # than a full clone.
 git_done=0
 if [ -n "$(${GIT} ls-remote "${repo}" "${cset}" 2>&1)" ]; then
-    printf "Doing shallow clone\n"
-    if ${GIT} clone --depth 1 -b "${cset}" --bare "${repo}" "${basename}"; then
+    if [ -z "${quiet}" ]; then
+	printf "Doing shallow clone\n";
+    fi
+    if ${GIT} clone ${quiet} --depth 1 -b "${cset}" --bare "${repo}" "${basename}"; then
         git_done=1
     else
         printf "Shallow clone failed, falling back to doing a full clone\n"
     fi
 fi
 if [ ${git_done} -eq 0 ]; then
-    printf "Doing full clone\n"
-    ${GIT} clone --bare "${repo}" "${basename}"
+    if [ -z "${quiet}" ]; then
+	printf "Doing full clone\n";
+    fi
+    ${GIT} clone ${quiet} --bare "${repo}" "${basename}"
 fi
 
 GIT_DIR="${basename}" \
-- 
2.1.3
