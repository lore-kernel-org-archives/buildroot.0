From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  1 Mar 2017 21:59:44 +0100
Subject: [Buildroot] [PATCH] Revert "dependencies/cmake: blacklist cmake 3.7"
Message-ID: <1488401984-30053-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 4422eca2d418e2b817b419ff6c4c62f7f4cb7871.

We now have a workaround for the RPATH issue introduced in 3.7, so we
can use it again.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 support/dependencies/check-host-cmake.sh | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/support/dependencies/check-host-cmake.sh b/support/dependencies/check-host-cmake.sh
index 84c26c2..9b63b06 100755
--- a/support/dependencies/check-host-cmake.sh
+++ b/support/dependencies/check-host-cmake.sh
@@ -6,9 +6,6 @@ version_min="${2}"
 major_min="${version_min%.*}"
 minor_min="${version_min#*.}"
 
-# cmake-3.7 incorrectly handles rpath, linking to host libraries
-blacklist_version="3.7"
-
 cmake=`which ${candidate}`
 if [ ! -x "${cmake}" ]; then
     # echo nothing: no suitable cmake found
@@ -30,11 +27,6 @@ version="$(${cmake} --version \
 major="${version%.*}"
 minor="${version#*.}"
 
-if [ "${version}" = "${blacklist_version}" ]; then
-    # echo nothing: no suitable cmake found
-    exit 1
-fi
-
 if [ ${major} -gt ${major_min} ]; then
     echo "${cmake}"
 else
-- 
2.7.4
