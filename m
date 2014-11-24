From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 24 Nov 2014 14:56:59 +0100
Subject: [Buildroot] [PATCH v4 next 2/5] support/download: silence svn if it
	is a silent build
In-Reply-To: <1416837422-1977-1-git-send-email-fabio.porcedda@gmail.com>
References: <1416837422-1977-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1416837422-1977-3-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If it is a silent build (make -s -> QUIET=-q) silence the svn download
helper using "svn -q" just like others download helpers, e.g. wget.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---

Notes:
    v4:
    - instead of changing the "SVN" variable pass the "-q" option to the
      download helper (Thomas P.)
    v3:
     - add this patch

 package/pkg-download.mk | 3 ++-
 support/download/svn    | 4 +++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 95175d6..a8a042b 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -156,7 +156,8 @@ define DOWNLOAD_SVN
 		$(DL_DIR)/$($(PKG)_SOURCE) \
 		$($(PKG)_SITE) \
 		$($(PKG)_DL_VERSION) \
-		$($(PKG)_BASE_NAME)
+		$($(PKG)_BASE_NAME) \
+		$(QUIET)
 endef
 
 define SOURCE_CHECK_SVN
diff --git a/support/download/svn b/support/download/svn
index a960f7d..d75f306 100755
--- a/support/download/svn
+++ b/support/download/svn
@@ -9,6 +9,7 @@ set -e
 #   $2: svn repo
 #   $3: svn revision
 #   $4: package's basename (eg. foobar-1.2.3)
+#   $5: "-q", optional quiet flag
 # And this environment:
 #   SVN      : the svn command to call
 
@@ -16,7 +17,8 @@ output="${1}"
 repo="${2}"
 rev="${3}"
 basename="${4}"
+quiet="${5}"
 
-${SVN} export "${repo}@${rev}" "${basename}"
+${SVN} ${quiet} export "${repo}@${rev}" "${basename}"
 
 tar czf "${output}" "${basename}"
-- 
2.1.3
