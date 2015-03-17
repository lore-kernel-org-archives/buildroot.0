From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 17 Mar 2015 13:59:38 +0100
Subject: [Buildroot] [PATCH 5/5 v2] support/download: always fail when
	there's no hash
In-Reply-To: <cover.1426597114.git.yann.morin.1998@free.fr>
References: <cover.1426597114.git.yann.morin.1998@free.fr>
Message-ID: <b9c42017c424fae04a5bae3d8a74c3b21de65370.1426597114.git.yann.morin.1998@free.fr>
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
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
---
 docs/manual/adding-packages-directory.txt | 6 ++----
 support/download/check-hash               | 8 ++------
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 1ce9a3b..febb33c 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -469,9 +469,7 @@ not match, Buildroot considers this an error, deletes the downloaded file,
 and aborts.
 
 If the +.hash+ file is present, but it does not contain a hash for a
-downloaded file, no check is done for that file. If you set the
-environment variable +BR2_ENFORCE_CHECK_HASH+ to a non-empty value, and
-there is no hash for a downloaded file, Buildroot considers this an
-error, deletes the downloaded file, and aborts.
+downloaded file, Buildroot considers this an error and aborts (but leaves
+the downloaded file in place).
 
 If the +.hash+ file is missing, then no check is done at all.
diff --git a/support/download/check-hash b/support/download/check-hash
index 9c62d7f..0caa619 100755
--- a/support/download/check-hash
+++ b/support/download/check-hash
@@ -88,10 +88,6 @@ while read t h f; do
 done <"${h_file}"
 
 if [ ${nb_checks} -eq 0 ]; then
-    if [ -n "${BR2_ENFORCE_CHECK_HASH}" ]; then
-        printf "ERROR: No hash found for %s\n" "${base}" >&2
-        exit 2
-    else
-        printf "WARNING: No hash found for %s\n" "${base}" >&2
-    fi
+    printf "ERROR: No hash found for %s\n" "${base}" >&2
+    exit 2
 fi
-- 
1.9.1
