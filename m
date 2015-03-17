From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 17 Mar 2015 13:59:34 +0100
Subject: [Buildroot] [PATCH 1/5 v2] support/download: make hash file optional
In-Reply-To: <cover.1426597114.git.yann.morin.1998@free.fr>
References: <cover.1426597114.git.yann.morin.1998@free.fr>
Message-ID: <26bebad3dca4191b35ddb2dae535b15de9a883c2.1426597114.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, specifying a hash file for our download wrapper is mandatory.

However, when we download a git, svn, bzr, hg or cvs tree, there's by
design no hash to check the download against.

Since we're going to have hash checking mandatory when a hash file
exists, this would break those downloads from a repository.

So, make specifying a hash file optional when calling our download
wrapper and bail out early from the check-hash script if no hash file is
specified.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/download/check-hash | 2 +-
 support/download/dl-wrapper | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/support/download/check-hash b/support/download/check-hash
index 4c07274..cee64ef 100755
--- a/support/download/check-hash
+++ b/support/download/check-hash
@@ -23,7 +23,7 @@ file="${2}"
 base="${3}"
 
 # Does the hash-file exist?
-if [ ! -f "${h_file}" ]; then
+if [ -z "${h_file}" -o ! -f "${h_file}" ]; then
     exit 0
 fi
 
diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 3b30840..514118c 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -44,9 +44,6 @@ main() {
     if [ -z "${output}" ]; then
         error "no output specified, use -o\n"
     fi
-    if [ -z "${hfile}" ]; then
-        error "no hash-file specified, use -H\n"
-    fi
 
     # If the output file already exists, do not download it again
     if [ -e "${output}" ]; then
-- 
1.9.1
