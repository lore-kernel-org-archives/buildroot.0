From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Aug 2015 16:58:55 +0200
Subject: [Buildroot] [git commit] toolchain/external: better check for gcc-5
Message-ID: <20150809151640.6B79D818C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4a5f878946c37deb8c1785fb8363cd1d322f7436
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gcc will always report a three-digit version sting, like 4.9.3 or 5.1.0.

For gcc before 5, we want to check the first two digits, while starting
with gcc 5, we are only concerned about the first digit.

So, change our matching code to test for the leading part of the version
string, up to the first dot after as-many version digit we're interested
in.

Note: we're adding the dot in the .mk code rather than in the Kconfig
symbol, because it seemed cleaner to do so.

Reported-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/helpers.mk |   12 ++++--------
 1 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 018f3ed..7c70d35 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -191,16 +191,12 @@ check_kernel_headers_version = \
 #   - eat all the remaining chars on the line
 #   - replace by the matched expression
 #
-# - s/\.[[:digit:]]+$//
-#   - eat a dot followed by as many digits as possible up to the end
-#     of line
-#   - replace with nothing
-#
 check_gcc_version = \
 	expected_version="$(strip $2)" ; \
-	real_version=`$(1) --version | sed -r -e '1!d; s/^[^)]+\) ([^[:space:]]+).*/\1/; s/\.[[:digit:]]+$$//;'` ; \
-	if [ "$${real_version}" != "$${expected_version}" ] ; then \
-		echo "Incorrect selection of gcc version: expected $${expected_version}, got $${real_version}" ; \
+	real_version=`$(1) --version | sed -r -e '1!d; s/^[^)]+\) ([^[:space:]]+).*/\1/;'` ; \
+	if [[ ! "$${real_version}" =~ ^$${expected_version}\. ]] ; then \
+		printf "Incorrect selection of gcc version: expected %s.x, got %s\n" \
+			"$${expected_version}" "$${real_version}" ; \
 		exit 1 ; \
 	fi
 
