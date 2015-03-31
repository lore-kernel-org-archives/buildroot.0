From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  1 Apr 2015 00:15:06 +0200
Subject: [Buildroot] [PATCH 6/7 v4] support/download: always fail when
	there's no hash
In-Reply-To: <cover.1427840060.git.yann.morin.1998@free.fr>
References: <cover.1427840060.git.yann.morin.1998@free.fr>
Message-ID: <d9c2227b36d210797f4d2c83ec98d6401a15e745.1427840060.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

---
Changes v2 -> v3:
  - further improve the manual  (Arnout)
---
 docs/manual/adding-packages-directory.txt | 8 ++++----
 support/download/check-hash               | 8 ++------
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 0f8bb64..0051fea 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -478,10 +478,10 @@ not match, Buildroot considers this an error, deletes the downloaded file,
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
-- 
1.9.1
