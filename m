From: Guo Ren <ren_guo@c-sky.com>
Date: Tue, 21 Feb 2017 17:04:36 +0800
Subject: [Buildroot] [PATCH 1/1] toolchain/helpers.mk: fixup
	check_gcc_version.
Message-ID: <1487667876-27245-1-git-send-email-ren_guo@c-sky.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

some gcc --version ouput like this:
$ csky-linux-gcc --version
csky-linux-gcc (C-SKY Tools V2.8.08(Beta1)(Glibc,Linux 4.8.4), ABIV1,
B20161118) 4.5.1

current script just find first ')', but we need find last ')' to get
correct version number.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
---
 toolchain/helpers.mk | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 72e7292..2d695ed 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -136,18 +136,26 @@ check_kernel_headers_version = \
 # - 1!d
 #   - delete if not line 1
 #
-# - s/^[^)]+\) ([^[:space:]]+).*/\1/
-#   - eat all until the first ')' character followed by a space
-#   - match as many non-space chars as possible
-#   - eat all the remaining chars on the line
+# - s/^.+\)[[:space:]]*([^[:space:]]+)/\1/
+#   - eat all until the last ')' character
+#   - match the first non-space sequence
 #   - replace by the matched expression
 #
+# The GCC version string is built up as follows:
+# GCC (PKGVERSION) BASEVER DATESTAMP DEVPHASE REVISION
+# PKGVERSION can be anything, it's a string provided at configure time.
+# BASEVER is what we need.
+# DATESTAMP is YYYYMMDD or empty
+# DEVPHASE is experimental, pre-release or empty
+# REVISION is [svn revision info] or empty
+# Therefore, we need the first non-space sequence after the last ')' character
+#
 check_gcc_version = \
 	expected_version="$(strip $2)" ; \
 	if [ -z "$${expected_version}" ]; then \
 		exit 0 ; \
 	fi; \
-	real_version=`$(1) --version | sed -r -e '1!d; s/^[^)]+\) ([^[:space:]]+).*/\1/;'` ; \
+	real_version=`$(1) --version | sed -r -e '1!d; s/^.+\)[[:space:]]*([^[:space:]]+)/\1/;'` ; \
 	if [[ ! "$${real_version}" =~ ^$${expected_version}\. ]] ; then \
 		printf "Incorrect selection of gcc version: expected %s.x, got %s\n" \
 			"$${expected_version}" "$${real_version}" ; \
-- 
1.9.1
