From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 13 Aug 2015 14:13:23 +0200
Subject: [Buildroot] [PATCH] toolchain/external: ensure gcc version is known
Message-ID: <1439468003-27047-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, when a preconfigured prebuilt toolchain forgets to specify
its gcc version, the error message is a bit misleading, like:

    Incorrect selection of gcc version: expected .x, got 4.9.2

Add a an explicit check for the gcc version being set, that reports a
better error message.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Note: we do not need the same check for kernel headers, because for
those, we really ensure a version is set, namely 2.6.x, whereas we do
not set a default 'REALLY_OLD' gcc version (and we can't really do so).
---
 toolchain/helpers.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 7c70d35..85a9407 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -193,6 +193,10 @@ check_kernel_headers_version = \
 #
 check_gcc_version = \
 	expected_version="$(strip $2)" ; \
+	if [ -z "$${expected_version}" ]; then \
+		printf "Internal error, gcc version unknown (no GCC_AT_LEAST_X_Y selected)\n"; \
+		exit 1 ; \
+	fi; \
 	real_version=`$(1) --version | sed -r -e '1!d; s/^[^)]+\) ([^[:space:]]+).*/\1/;'` ; \
 	if [[ ! "$${real_version}" =~ ^$${expected_version}\. ]] ; then \
 		printf "Incorrect selection of gcc version: expected %s.x, got %s\n" \
-- 
1.9.1
