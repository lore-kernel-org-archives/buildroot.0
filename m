From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Apr 2015 14:08:54 +0200
Subject: [Buildroot] [git commit] support/download: always fail when there's
	no hash
Message-ID: <20150403120939.5A4F3818F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=327531543288ac17690a36f3d4f2800f2ecc2362
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

At the time we introduced hashes, we did not want to be too harsh in the
beginning, and give people some time to adapt and accept the hashes. So
we so far only whined^Wwarned about a missing hash (when the .hash file
exists).

Some time has passed now, and people are still missing updating hashes
when bumping packages.

Let's make that warning a little bit more annoying...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-directory.txt |    8 ++++----
 support/download/check-hash               |    8 ++------
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index b9e3c52..f536a0c 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -475,10 +475,10 @@ not match, Buildroot considers this an error, deletes the downloaded file,
 and aborts.
 
 If the +.hash+ file is present, but it does not contain a hash for a
-downloaded file, no check is done for that file. If you set the
-environment variable +BR2_ENFORCE_CHECK_HASH+ to a non-empty value, and
-there is no hash for a downloaded file, Buildroot considers this an
-error, deletes the downloaded file, and aborts.
+downloaded file, Buildroot considers this an error and aborts. However,
+the downloaded file is left in the download directory since this
+typically indicates that the +.hash+ file is wrong but the downloaded
+file is probably OK.
 
 Sources that are downloaded from a version control system (git, subversion,
 etc...) can not have a hash, because the version control system and tar
diff --git a/support/download/check-hash b/support/download/check-hash
index ab416c7..13a76b8 100755
--- a/support/download/check-hash
+++ b/support/download/check-hash
@@ -94,10 +94,6 @@ while read t h f; do
 done <"${h_file}"
 
 if [ ${nb_checks} -eq 0 ]; then
-    if [ -n "${BR2_ENFORCE_CHECK_HASH}" ]; then
-        printf "ERROR: No hash found for %s\n" "${base}" >&2
-        exit 3
-    else
-        printf "WARNING: No hash found for %s\n" "${base}" >&2
-    fi
+    printf "ERROR: No hash found for %s\n" "${base}" >&2
+    exit 3
 fi
