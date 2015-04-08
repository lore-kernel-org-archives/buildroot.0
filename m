From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  8 Apr 2015 18:57:23 +0200
Subject: [Buildroot] [PATCH 8/8 v4] support/download: do not accept exlcuded
	files with ashes
In-Reply-To: <cover.1428512075.git.yann.morin.1998@free.fr>
References: <cover.1428512075.git.yann.morin.1998@free.fr>
Message-ID: <ee02447feb64c265dcf5e7a60dddb630c7dc9402.1428512075.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If a file is excluded from checking its hashes, it must effectively have
no hash for it.

So, if an excluded file indeed has at least one hash, there is an issue
somewhere; that file should probably not be excluded.

When this happens, bail out in error.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 support/download/check-hash | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/support/download/check-hash b/support/download/check-hash
index 96f5965..849637e 100755
--- a/support/download/check-hash
+++ b/support/download/check-hash
@@ -18,6 +18,9 @@ set -e
 #       one of its hashes
 #   3:  the hash file exists and there was no hash to check the file against
 #   4:  the hash file exists and at least one hash type is unknown
+#   5:  the hash file exists and there was at least one hash for the file
+#       to check and all those hashes did match, but the file is excluded
+#       from being checked
 
 while getopts :q OPT; do
     case "${OPT}" in
@@ -106,4 +109,11 @@ if [ ${nb_checks} -eq 0 ]; then
     done
     printf "ERROR: No hash found for %s\n" "${base}" >&2
     exit 3
+else
+    for f in ${BR_NO_CHECK_HASH_FOR}; do
+        if [ "${f}" = "${base}" ]; then
+            printf "ERROR: Hash found for excluded %s\n" "${base}" >&2
+            exit 5
+        fi
+    done
 fi
-- 
1.9.1
