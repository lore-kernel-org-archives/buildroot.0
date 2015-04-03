From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Apr 2015 14:08:00 +0200
Subject: [Buildroot] [git commit] support/download: make hash file optional
Message-ID: <20150403120939.1E622818F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c22fe04a789ef59add62612d1c5ceeadccd4e3ef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/download/check-hash |    2 +-
 support/download/dl-wrapper |    3 ---
 2 files changed, 1 insertions(+), 4 deletions(-)

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
